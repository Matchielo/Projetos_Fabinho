/* MAIN.C file - STM8S903K3
 * Desenvolvimento de contagem não bloquente 
 * 
 * Este programa configura um microcontrolador STM8S903K3 para controlar
 * dois displays BCD de 7 segmentos. Ele permite iniciar contagens regressivas
 * de 14 ou 24 segundos através de botões, com feedback de áudio (buzzer)
 * e visual (piscar os displays) ao final de cada contagem.
 * A comunicação com os displays BCD é feita através de pinos de dados e latches.
 *
 * Versão atual: Contagem Não Bloquente (com interrupção).
 *
 * Copyright (c) 2002-2005 STMicroelectronics
 */


// ---------- Bibliotecas ---------- //

#include "stm8s.h"           // Biblioteca principal da SPL. Contém definições gerais para STM8.
#include "stm8s903k.h"       // Definições específicas do seu modelo de MCU (STM8S903K3).
#include "stm8s_tim4.h"      // Biblioteca da SPL para o Timer 4. Usado para gerar interrupções de tempo.
#include "stm8s_itc.h"       // Biblioteca da SPL para o Controlador de Interrupção (ITC). Usado para prioridades de interrupção.


// ---------- Definição da Pinagem --------- //
// Macros para associar nomes legíveis a pinos específicos do microcontrolador.

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

#define BOTAO_PAUSE_PORT	GPIOD				// Porta D, pino 3 para o botão de pause
#define BOTAO_PAUSE_PIN		GPIO_PIN_4

// Pino para o Buzzer
#define BUZZER_PORT		GPIOD
#define BUZZER_PIN		GPIO_PIN_0

// Macro para instrução 'No Operation' (usada para pequenos atrasos de ciclo de clock ou debouncing).
// 'NOP' significa que a CPU não faz nada por um ciclo de clock.
#define NOP() _asm("nop")

// ---------- Variáveis Globais ---------

// Variáveis declaradas fora de qualquer função. Elas são acessíveis por todas as funções.
// 'volatile' é crucial: informa ao compilador que o valor dessas variáveis pode mudar
// a qualquer momento por algo externo (neste caso, a Rotina de Serviço de Interrupção - ISR).
// Isso impede que o compilador faça otimizações que poderiam usar valores "antigos" da variável.

volatile uint8_t tempo_restante = 0;		// Armazena o valor atual da contagem regressiva
volatile uint8_t contador_ms = 0;		// Cotador milessegundos. Incrementado no IRS a cada 1ms
																		// Quando chega a 1000ms 1 segundo se passou

// Flag de cintrole de Estado
volatile uint8_t flag_run;		// 0 = pausado / 1 = rodando. Controla a lógica de tempo
volatile uint8_t flag_start;	// 0 = nunca iniciado / 1 = Já iniciado - Permite que o pause funcione após o start


// Variáveis para a sequência de finalização (piscar displays e buzzer)
volatile uint8_t fim_contagem_estado = 0;		//variável de estado 
																						// 0 = inativo, >0 = estado atual da sequência (1 a 6).
volatile uint8_t contador_ms_sequencia = 0; // Contador de milissegundos para controlar o tempo de cada estado da sequência.

// ---------- Definicões do protótipo ----------
void InitGPIO(void);               // Configura os pinos de E/S.
void InitCLOCK(void);              // Configura o clock do sistema.
void TIM4_Config(void);            // Configura o Timer 4 para gerar interrupções.
void WriteBCD(uint8_t valor);      // Converte e envia um dígito para os pinos BCD.
void PulseLatch(GPIO_TypeDef* porta, uint8_t pino); // Gera um pulso no pino de latch do display.
void ApagarDisplay(void);          // Apaga todos os segmentos dos displays.
void AtualizarDisplay(uint8_t valor); // Atualiza ambos os displays com um valor de 0 a 99.

main()
{
	InitCLOCK();	// Configura o oscilador interno (HSI) para 16MHz e distribui clocks.
	InitGPIO();		// Configura os pinos para displays, botões e buzzer.
	
	// Configura a prioridade da interrupção do Timer 4 (opcional, mas boa prática).
	// Nível 1 é uma prioridade média. Isso é importante em sistemas com múltiplas interrupções.
	ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
	
	TIM4_Config();	// Configura o Timer 4 para gerar uma interrupção a cada 1 milissegundo.
	
	// **HABILITA AS INTERRUPÇÕES GLOBAIS DA CPU.**
	enableInterrupts();	// Sem isso, mesmo que o Timer 4 gere interrupções, a CPU as ignora.
	
	ApagarDisplay();	// Garante que os Displays comecem desligados ao ligar o equipamento
	
	while (1)
	{
		// --- Lógica do Botão 14 Segundos ---
		// Verifica se o botão 14 foi pressionado.
    // 'GPIO_ReadInputPin' lê o estado do pino. 'RESET' (ou 0) indica que o botão está pressionado (pino conectado ao GND).
		
		if(GPIO_ReadInputPin(BOTAO_14S_PORT, BOTAO_14S_PIN) == RESET)
		{
			tempo_restante = 14;				// Define o tempo inicial da contagem
			contador_ms = 0;						// Zera o contador de mls para um novo segundo inicial
			fim_contagem_estado = 0;		// Cancela qualquer atividade que esteja acontecendo
			flag_start = 1;							// Habilita o botão de pause
			flag_run = 1; 							// Inicia a contagem no IRS 
			
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
			// Só permite pausar se a contagem estiver ativa
			if(flag_start == 1)
			{
				// O "coração" do toggle: inverte o estado da flag de 0 para 1 ou de 1 para 0
				flag_run = !flag_run;
				
				// Se pausou durante a atividade, garante que o buzzer desligue
				if(flag_run == 0 && fim_contagem_estado == 0)
				{
					GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
				}
			}
			while(GPIO_ReadInputPin(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN) == RESET);
		}
		
	}
}

// ---------- Rotina de Interrupção (IRS) do timer 4 -----------
// Função executada automaticamente pelo micro a cada 1 mls
// 'INTERRUPT_HANDLER' é uma macro específica do compilador cosmic para os ISRs
// 'TIM4_UPD_OVF_IRQHandler' é o nome da função.
// '23' é o número do vetor de interrupção para o Timer 4 (consulte o datasheet ou stm8_interrupt_vector.c).

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
	// Limpla flag de Interrupção
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	
	// O portão
	// Se a Flag fot 0 (pausado), não faz mais nada
	// Pausa tanto a contagem 
	if(flag_run = 0)
	{
		return; // Sai da interrução imediatamente
	}
	
	// Lógica de contagem principal
	if(fim_contagem_estado == 0)
	{
		contador_ms ++;
		
		if(contador_ms >+ 1000)		// 1 Segundo se passou
		{
			contador_ms = 0;
			if(tempo_restante > 0)
			{
				tempo_restante--;
				AtualizarDisplay(tempo_restante);
			}
			if(tempo_restante == 0)	// Transição para a animação final
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
		contador_ms_sequencia ++;
		
		if(contador_ms_sequencia == 1)
		{
			AtualizarDisplay(0);
			GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
		}
		if(contador_ms_sequencia >= 1000)
		{
			GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
			ApagarDisplay();
			
			// Reseta todas as Flags ao estado inicial
			fim_contagem_estado = 0;
			flag_run = 0;
			flag_start = 0;
		}
	}
	
}

// --------- Definição dos pinos ---------
void InitGPIO(void)
{
	// Pinos de Dados BCD (LD_A a LD_D): Saídas Push-Pull, velocidade rápida, inicialmente LOW.
	GPIO_Init(BCD_A_PORT, BCD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(BCD_B_PORT, BCD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  GPIO_Init(BCD_C_PORT, BCD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  GPIO_Init(BCD_D_PORT, BCD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Pinos de Latch (LATCH_01, LATCH_02): Saídas Push-Pull, velocidade rápida, inicialmente LOW.
	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Pinos dos Botões (BOTAO_14, BOTAO_24): Entradas com Pull-up interno, SEM interrupção.
	// O pull-up garante que o pino esteja HIGH quando o botão não está pressionado.
  // "NO_IT" significa que não geram interrupções (a leitura é por polling no main loop).
	GPIO_Init(BOTAO_14S_PORT, BOTAO_14S_PIN, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BOTAO_24S_PORT, BOTAO_24S_PIN, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN, GPIO_MODE_IN_PU_NO_IT);
	
	// Pino do Buzzer: Saída Push-Pull, velocidade rápida, inicialmente LOW (desligado).
	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}

// Função: InitCLOCK
// Configura o relógio principal do microcontrolador.
void InitCLOCK(void)
{
    CLK_DeInit(); // Reseta todas as configurações de clock.
    CLK_HSECmd(DISABLE); // Desabilita oscilador externo (HSE).
    CLK_LSICmd(DISABLE); // Desabilita oscilador interno de baixa frequência (LSI).
    CLK_HSICmd(ENABLE);  // Habilita o oscilador interno de alta frequência (HSI).

    // Espera até que o HSI esteja pronto e estável.
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

    CLK_ClockSwitchCmd(ENABLE);          // Permite a troca da fonte de clock.
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // HSI a 16MHz (16MHz / 1 = 16MHz).
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // CPU roda na velocidade do clock do sistema (16MHz).
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

    // Habilita clocks para periféricos usados e desabilita para os não usados.
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE); // Habilita o clock para o Timer 4.
}

// Função: TIM4_Config
// Configura o Timer 4 para gerar uma interrupção a cada 1 milissegundo.
// Clock do Timer 4: 16 MHz (HSI) / 128 (Prescaler) = 125.000 Hz.
// Período de Autoreload: 124 (ou seja, 125 ciclos de 0 a 124).
// Frequência de Interrupção = 125.000 Hz / 125 = 1.000 Hz (1ms por interrupção).

void TIM4_Config(void)
{
	TIM4_DeInit();	// Reseta o Timer 4
	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124);	// Define prescaler e autoreload.
	// **HABILITA A INTERRUPÇÃO DE UPDATE DO TIMER 4.**
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);	// Isso faz a ISR ser chamada a cada 1ms.
	TIM4_Cmd(ENABLE);//Habilita o timer 4 para iniciar a contagem
}

// Função: writeBCD
// Converte um valor de 0-9 para o formato BCD de 4 bits e o envia para os pinos do display.
void WriteBCD(uint8_t valor)
{
	// Usa operações bit a bit ('&') para verificar cada bit do 'valor' (de 0 a 9)
	// e setar os pinos LD_A a LD_D (que correspondem a 1, 2, 4, 8) para HIGH ou LOW.
	
	(valor & 0x01) ? GPIO_WriteHigh(BCD_A_PORT, BCD_A_PIN) : GPIO_WriteLow(BCD_A_PORT, BCD_A_PIN);
	(valor & 0x02) ? GPIO_WriteHigh(BCD_B_PORT, BCD_B_PIN) : GPIO_WriteLow(BCD_B_PORT, BCD_B_PIN);
	(valor & 0x04) ? GPIO_WriteHigh(BCD_C_PORT, BCD_C_PIN) : GPIO_WriteLow(BCD_C_PORT, BCD_C_PIN);
	(valor & 0x08) ? GPIO_WriteHigh(BCD_D_PORT, BCD_D_PIN) : GPIO_WriteLow(BCD_D_PORT, BCD_D_PIN);
}

// Função: pulseLatch
// Gera um pulso curto (HIGH -> LOW) em um pino de latch específico.
// Este pulso é necessário para que o CI de latch ou decodificador BCD "capture"
// os dados presentes nos pinos LD_A-LD_D e os exiba no display.
void PulseLatch(GPIO_TypeDef* porta, uint8_t pino)
{
	GPIO_WriteHigh(porta, pino);	// Define o pino de latch para HIGH.
	NOP(); NOP(); NOP(); NOP(); // Pequeno atraso para garantir que o pulso seja longo o suficiente.
	GPIO_WriteLow(porta, pino);	// Define o pino de latch para LOW, completando o pulso.
}

// Função: apagarDisplay
// Envia o valor BCD 0000 (todos os bits LOW) para os displays e pulsa ambos os latches.
// Isso garante que todos os segmentos dos displays estejam apagados.

void ApagarDisplay(void)
{
	GPIO_WriteLow(BCD_A_PORT, BCD_A_PIN);
	GPIO_WriteLow(BCD_B_PORT, BCD_B_PIN);
	GPIO_WriteLow(BCD_C_PORT, BCD_C_PIN);
	GPIO_WriteLow(BCD_D_PORT, BCD_D_PIN);
	
	PulseLatch(LATCH_01_PORT,LATCH_01_PIN);
	PulseLatch(LATCH_02_PORT,LATCH_02_PIN);
}

// Função: AtualizarDisplay
// Divide um número de 0 a 99 em dezenas e unidades e os exibe nos displays.
void AtualizarDisplay(uint8_t valor)
{
	uint8_t unidades = valor % 10; // Calcula o dígito das unidades (ex: 14 % 10 = 4).
	uint8_t dezenas = valor / 10;	 // Calcula o dígito das dezenas (ex: 14 / 10 = 1).
	
	WriteBCD(unidades);	// Envia o dígito das unidades para os pinos BCD.
	PulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades.
	
	WriteBCD(dezenas);	// Envia o dígito das unidades para os pinos BCD.
	PulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das unidades.
}