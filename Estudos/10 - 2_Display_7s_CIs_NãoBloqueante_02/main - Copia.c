/* MAIN.C file - STM8S903K3
 * Desenvolvimento de contagem não bloquente
 *
 * Este programa configura um microcontrolador STM8S903K3 para controlar
 * dois displays BCD de 7 segmentos. Ele permite iniciar contagens regressivas
 * de 14 ou 24 segundos através de botões, com feedback de áudio (buzzer)
 * e visual (piscar os displays) ao final de cada contagem.
 * A comunicação com os displays BCD é feita através de pinos de dados e latches.
 *
 * Versão atual: Contagem Não Bloquente com lógica de pausa baseada em flag única.
 *
 * Copyright (c) 2002-2005 STMicroelectronics
 */


// ---------- Bibliotecas ---------- //

#include "stm8s.h"           // Biblioteca principal da SPL. Contém definições gerais para STM8.
#include "stm8s903k.h"       // Definições específicas do seu modelo de MCU (STM8S903K3).
#include "stm8s_tim4.h"      // Biblioteca da SPL para o Timer 4. Usado para gerar interrupções de tempo.
#include "stm8s_itc.h"       // Biblioteca da SPL para o Controlador de Interrupção (ITC). Usado para prioridades de interrupção.


// ---------- Definição da Pinagem --------- //
// Pinos LE (Latch Enable) para os decodificadores.
#define LATCH_01_PORT		GPIOC		// Porta C, Pino 02
#define LATCH_01_PIN		GPIO_PIN_2

#define LATCH_02_PORT		GPIOC
#define LATCH_02_PIN		GPIO_PIN_1

// Pinos de Dados BCD (conectados às entradas A, B, C, D do decodificador BCD para 7 segmentos)
// Estes 4 pinos transmitem o valor binário codificado em decimal para o display.
#define BCD_A_PORT	GPIOB		// Porta B, Pino 0 -- BIT A
#define BCD_A_PIN		GPIO_PIN_0

#define BCD_B_PORT	GPIOB		// BIT B
#define BCD_B_PIN		GPIO_PIN_1

#define BCD_C_PORT	GPIOB		// BIT C
#define BCD_C_PIN		GPIO_PIN_2

#define BCD_D_PORT	GPIOB		// BIT D
#define BCD_D_PIN		GPIO_PIN_3

// Pinos para os Botões (Entradas com Pull-up)
#define BOTAO_14S_PORT	GPIOD					// Porta D, pino 2 para o botão de 14 segundos.
#define BOTAO_14S_PIN		GPIO_PIN_2

#define BOTAO_24S_PORT	GPIOD					// Porta D, pino 3 para o botão de 14 segundos.
#define BOTAO_24S_PIN		GPIO_PIN_3

#define BOTAO_PAUSE_PORT	GPIOD
#define BOTAO_PAUSE_PIN		GPIO_PIN_4

// Pino para o Buzzer
#define BUZZER_PORT		GPIOD
#define BUZZER_PIN		GPIO_PIN_0

// Macro para instrução 'No Operation' (usada para pequenos atrasos de ciclo de clock ou debouncing).
// 'NOP' significa que a CPU não faz nada por um ciclo de clock.
#define NOP() _asm("nop")

// ---------- Variáveis Globais ---------
// 'volatile' informa ao compilador que o valor pode mudar a qualquer momento
// por uma rotina externa (a interrupção), evitando otimizações indevidas.

volatile uint8_t tempo_restante = 0;	    // Armazena o valor atual da contagem regressiva
volatile uint16_t contador_ms = 0;	    // Contador de milissegundos, incrementado na ISR

// --- NOVAS FLAGS DE CONTROLE (baseadas na lógica Assembly) ---
volatile uint8_t flag_run = 0;              // 0 = Pausado, 1 = Rodando. Controla toda a lógica de tempo.
volatile uint8_t flag_start = 0;            // 0 = Nunca iniciado, 1 = Já iniciado. Permite que o pause só funcione após o primeiro start.

// Variáveis para a sequência de finalização (piscar displays e buzzer)
volatile uint8_t fim_contagem_estado = 0;	    // Máquina de estados da animação final (0 = inativo, >0 = estado atual)
volatile uint16_t contador_ms_sequencia = 0;    // Contador de tempo para a animação

// ---------- Definição dos Protótipos -----------
void InitGPIO(void);               // Configura os pinos de E/S.
void InitCLOCK(void);              // Configura o clock do sistema.
void TIM4_Config(void);            // Configura o Timer 4 para gerar interrupções.
void WriteBCD(uint8_t valor);      // Converte e envia um dígito para os pinos BCD.
void PulseLatch(GPIO_TypeDef* porta, uint8_t pino); // Gera um pulso no pino de latch do display.
void ApagarDisplay(void);          // Apaga todos os segmentos dos displays.
void AtualizarDisplay(uint8_t valor); // Atualiza ambos os displays com um valor de 0 a 99.

main()
{
	InitCLOCK();		// Configura o oscilador interno (HSI) para 16MHz e distribui clocks.
	InitGPIO();			// Configura os pinos para displays, botões e buzzer.
	
	// Configura a prioridade da interrupção do Timer 4 (opcional, mas boa prática).
	// Nível 1 é uma prioridade média. Isso é importante em sistemas com múltiplas interrupções.
	ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
	
	TIM4_Config();				// Configura o Timer 4 para gerar uma interrupção a cada 1 milissegundo.
	
	// **HABILITA AS INTERRUPÇÕES GLOBAIS DA CPU.**
	enableInterrupts();		// Sem isso, mesmo que o Timer 4 gere interrupções, a CPU as ignora.
	
	ApagarDisplay();		// Garante que os displays comecem desligados ao ligar o aparelho.
	
	// --- Loop Infinito Principal ---

	while (1)
	{
		// --- Lógica do Botão 14 Segundos ---
		// Verifica se o botão 14 foi pressionado.
    // 'GPIO_ReadInputPin' lê o estado do pino. 'RESET' (ou 0) indica que o botão está pressionado (pino conectado ao GND).
		
		if(GPIO_ReadInputPin(BOTAO_14S_PORT, BOTAO_14S_PIN) == RESET)
		{
			tempo_restante = 14;						// Define o tempo inicial da contagem.
			contador_ms = 0;								// Zera o contador de mls para um novo segundo inicial.
			fim_contagem_estado = 0;        // Cancela qualquer animação final que esteja ocorrendo
			flag_start = 1;                 // Habilita o botão de pause
			flag_run = 1;                   // Inicia a contagem na ISR
			
			AtualizarDisplay(tempo_restante);
			
			// Debounce simples: espera o botão ser solto
			// Isso evita que um único pressionamento
      // seja interpretado como múltiplos pressionamentos rápidos pelo MCU.
			while(GPIO_ReadInputPin(BOTAO_14S_PORT, BOTAO_14S_PIN) == RESET);
		}
		
		// --- Lógica do Botão 24 Segundos ---
		if(GPIO_ReadInputPin(BOTAO_24S_PORT, BOTAO_24S_PIN) == RESET)
		{ 
			tempo_restante = 24;
			contador_ms = 0;
			fim_contagem_estado = 0;        // Cancela qualquer animação final
			flag_start = 1;                 // Habilita o botão de pause
			flag_run = 1;                   // Inicia a contagem na ISR
			
			AtualizarDisplay(tempo_restante);

			while(GPIO_ReadInputPin(BOTAO_24S_PORT, BOTAO_24S_PIN) == RESET);
		}
		
		// --- Lógica para o Botão de Pausa/Continuar ---
		if(GPIO_ReadInputPin(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN) == RESET)
		{
			// Só permite pausar se a contagem já tiver sido iniciada alguma vez
			if (flag_start == 1)
			{
				// O "coração" do toggle: inverte o estado da flag de 0 para 1 ou de 1 para 0
				flag_run = !flag_run;

                // Se pausou durante a animação final, garante que o buzzer desligue
                if (flag_run == 0 && fim_contagem_estado > 0)
                {
                    GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
                }
			}
			
			// Espera o botão ser solto para evitar múltiplos acionamentos
			while(GPIO_ReadInputPin(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN) == RESET);
		}
	}
}

// ---------- Rotina de Interrupção (ISR) do Timer 4 -----------
// Esta função é executada a cada 1ms
INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
	// 1. Limpa a flag da interrupção (obrigatório)
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	
	// 2. O "PORTÃO": Se a flag_run for 0 (pausado), não faz mais nada.
	// Pausa tanto a contagem normal quanto a animação final.
	if (flag_run == 0)
	{
		return; // Sai da interrupção imediatamente.
	}
	
	// ---- O CÓDIGO ABAIXO SÓ É EXECUTADO SE flag_run == 1 ----
	
	// Lógica de contagem principal (só executa antes da animação final)
	if (fim_contagem_estado == 0)
	{
		contador_ms++;
		if (contador_ms >= 1000) // 1 segundo se passou
		{
			contador_ms = 0;
			if (tempo_restante > 0)
			{
				tempo_restante--;
				AtualizarDisplay(tempo_restante);
			}
			
			if (tempo_restante == 0) // Transição para a animação final
			{
				// A flag_run continua em 1 para permitir que a animação (que é baseada em tempo) rode.
				// O botão de pause poderá pausar a animação.
				fim_contagem_estado = 1;
				contador_ms_sequencia = 0;
			}
		}
	}
	
	// Sequenciador de Finalização (só executa quando ativado)
	if(fim_contagem_estado > 0)
	{
		contador_ms_sequencia++;
		
		switch(fim_contagem_estado)
		{
			case 1: // Estado 1: Apaga o display
				if(contador_ms_sequencia == 1){ ApagarDisplay(); }
				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 2; }
				break;
			
			case 2:	// Estado 2: Mostra "00"
				if(contador_ms_sequencia == 1){ AtualizarDisplay(0); }	
				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 3; }
				break;
			
			case 3:	// Estado 3: Apaga o display
				if(contador_ms_sequencia == 1){ ApagarDisplay(); }
				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 4; }
				break;
			
			case 4:	// Estado 4: Mostra "00"
				if(contador_ms_sequencia == 1){ AtualizarDisplay(0); }	
				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 5; }
				break;
			
			case 5:	// Estado 5: Apaga o display
				if(contador_ms_sequencia == 1){ ApagarDisplay(); }
				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 6; }
				break;
			
			case 6:	// Estado 6: Mostra "00", liga o Buzzer e finaliza tudo.
				if(contador_ms_sequencia == 1){
					AtualizarDisplay(0);
					GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
				}	
				if(contador_ms_sequencia >= 1000){ // Mantém por 1 segundo
					GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
					ApagarDisplay();
					
					// Reseta todas as flags para o estado inicial
					fim_contagem_estado = 0;
					flag_run = 0;
					flag_start = 0;
				}
				break;
		}
	}
}

// --- Funções Auxiliares de Hardware e Display (sem alterações) ---

void InitGPIO(void)
{
    GPIO_Init(BCD_A_PORT, BCD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(BCD_B_PORT, BCD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(BCD_C_PORT, BCD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(BCD_D_PORT, BCD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(BOTAO_14S_PORT, BOTAO_14S_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BOTAO_24S_PORT, BOTAO_24S_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}

void InitCLOCK(void)
{
    CLK_DeInit();
    CLK_HSECmd(DISABLE);
    CLK_LSICmd(DISABLE);
    CLK_HSICmd(ENABLE);
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
    CLK_ClockSwitchCmd(ENABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
}

void TIM4_Config(void)
{
	TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	TIM4_Cmd(ENABLE);
}

void WriteBCD(uint8_t valor)
{
	(valor & 0x01) ? GPIO_WriteHigh(BCD_A_PORT, BCD_A_PIN) : GPIO_WriteLow(BCD_A_PORT, BCD_A_PIN);
	(valor & 0x02) ? GPIO_WriteHigh(BCD_B_PORT, BCD_B_PIN) : GPIO_WriteLow(BCD_B_PORT, BCD_B_PIN);
	(valor & 0x04) ? GPIO_WriteHigh(BCD_C_PORT, BCD_C_PIN) : GPIO_WriteLow(BCD_C_PORT, BCD_C_PIN);
	(valor & 0x08) ? GPIO_WriteHigh(BCD_D_PORT, BCD_D_PIN) : GPIO_WriteLow(BCD_D_PORT, BCD_D_PIN);
}

void PulseLatch(GPIO_TypeDef* porta, uint8_t pino)
{
	GPIO_WriteHigh(porta, pino);
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(porta, pino);
}

void ApagarDisplay(void)
{
	GPIO_WriteLow(BCD_A_PORT, BCD_A_PIN);
	GPIO_WriteLow(BCD_B_PORT, BCD_B_PIN);
	GPIO_WriteLow(BCD_C_PORT, BCD_C_PIN);
	GPIO_WriteLow(BCD_D_PORT, BCD_D_PIN);
	PulseLatch(LATCH_01_PORT,LATCH_01_PIN);
	PulseLatch(LATCH_02_PORT,LATCH_02_PIN);
}

void AtualizarDisplay(uint8_t valor)
{
	uint8_t unidades = valor % 10;
	uint8_t dezenas = valor / 10;
	
	WriteBCD(unidades);
	PulseLatch(LATCH_01_PORT, LATCH_01_PIN);
	
	WriteBCD(dezenas);
	PulseLatch(LATCH_02_PORT, LATCH_02_PIN);
}