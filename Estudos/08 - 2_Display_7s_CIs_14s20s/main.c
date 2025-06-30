/* MAIN.C file
 *
 * Copyright (c) 2002-2005 STMicroelectronics
 *
 * Este programa configura um microcontrolador STM8S903K3 para controlar
 * dois displays BCD de 7 segmentos. Ele permite iniciar contagens regressivas
 * de 14 ou 24 segundos através de botões, com feedback de áudio (buzzer)
 * e visual (piscar os displays) ao final de cada contagem.
 * A comunicação com os displays BCD é feita através de pinos de dados e latches.
 *
 * Versão atual: Contagem com polling de botão (sem interrupção).
 */

#include "stm8s.h"         // Biblioteca principal para o microcontrolador STM8
#include "stm8s903k.h"     // Definições específicas para o modelo STM8S903K3
#include "stm8s_tim4.h"    // Biblioteca para o Timer 4, usada para gerar atrasos

// ---------------------- Definições dos Pinos --------------------------
// Mapeamento dos pinos do microcontrolador para facilitar a leitura e modificação do código.

// Pinos de Latch (usados para travar o valor nos displays BCD)
// LATCH_01: Latch das unidades (display da direita), conectado a GPIOC, pino 2
#define LATCH_01_PORT	GPIOC
#define LATCH_01_PIN	GPIO_PIN_2

// LATCH_02: Latch das dezenas (display da esquerda), conectado a GPIOC, pino 1
#define LATCH_02_PORT	GPIOC
#define LATCH_02_PIN	GPIO_PIN_1

// Pinos de dados BCD (conectados às entradas A, B, C, D do decodificador BCD para 7 segmentos)
// Esses pinos enviam o código BCD para que o decodificador saiba qual dígito exibir.
#define LD_A_PORT	GPIOB
#define LD_A_PIN	GPIO_PIN_0

#define LD_B_PORT	GPIOB
#define LD_B_PIN	GPIO_PIN_1

#define LD_C_PORT	GPIOB
#define LD_C_PIN	GPIO_PIN_2

#define LD_D_PORT	GPIOB
#define LD_D_PIN	GPIO_PIN_3

// Pinos para os Botões (configurados como entrada com pull-up interno)
// BOT_1: Inicia a contagem de 14 segundos, conectado a GPIOD, pino 2
#define BOT_1_PORT	GPIOD
#define BOT_1_PIN	GPIO_PIN_2

// BOT_2: Inicia a contagem de 24 segundos, conectado a GPIOD, pino 3
#define BOT_2_PORT	GPIOD
#define BOT_2_PIN	GPIO_PIN_3

// Define o pino do Buzzer/LEDs de feedback, conectado a GPIOD, pino 0
#define BUZZER_PORT	GPIOD
#define BUZZER_PIN	GPIO_PIN_0

// ---------------------- Protótipos das Funções --------------------------
// Declaração de todas as funções usadas no programa.
// Isso permite que o compilador saiba sobre as funções antes de encontrá-las.

void InitCLOCK(void);             // Inicializa o clock do sistema para operar na velocidade desejada
void InitGPIO(void);              // Configura os pinos de Entrada/Saída (GPIO)
void InitTIM4(void);              // Inicializa o Timer 4 para gerar atrasos precisos
void Delay_ms_Timer(uint16_t ms); // Função de atraso em milissegundos usando o Timer 4 (bloqueante)

void writeBCD(uint8_t valor);             // Converte um número para BCD e o envia para os pinos do display
void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN); // Gera um pulso no pino latch para atualizar o display
void Contagem_14s(void);          // Realiza a contagem regressiva de 14 segundos
void Contagem_24s(void);          // Realiza a contagem regressiva de 24 segundos

uint8_t ReadButton(GPIO_TypeDef* PORT, uint8_t PIN); // Lê o estado de um botão (pressionado ou solto)
void BUZZER(uint8_t num_acm, uint16_t temp_acm);    // Ativa o buzzer/LED um número de vezes
void LED(uint8_t num_acm, uint16_t temp_acm);       // Ativa e desativa os pinos BCD para um efeito visual de "piscar" nos displays

// ---------------------- Função Principal --------------------------
void main(void)
{
	// Variáveis para detectar a borda de pressionamento dos botões (de solto para pressionado).
	// 'last_state_btnX' guarda o estado anterior, 'current_state_btnX' guarda o estado atual.
	// Inicializadas como 1 (solto), pois os botões estão configurados com pull-up.
	uint8_t last_state_btn1 = 1;
	uint8_t last_state_btn2 = 1;
	uint8_t current_state_btn1;
	uint8_t current_state_btn2;

	// --- Inicialização do Sistema ---
	InitCLOCK();  // Configura o clock do microcontrolador
	InitTIM4();   // Configura o Timer 4 para atrasos
	InitGPIO();   // Configura os pinos de entrada/saída

	// Efeito visual inicial: pisca os LEDs dos displays 4 vezes por 500ms cada.
	LED(4, 500);

	// Loop infinito principal do programa. O microcontrolador executa continuamente o que está aqui dentro.
	while (1)
    {
        // Lê o estado atual de ambos os botões.
        // Retorna 0 se o botão estiver pressionado (devido ao pull-up) e 1 se estiver solto.
        current_state_btn1 = ReadButton(BOT_1_PORT, BOT_1_PIN);
        current_state_btn2 = ReadButton(BOT_2_PORT, BOT_2_PIN);

        // --- Lógica para o Botão 1 (BTN1) - Inicia Contagem de 14s ---
        // Verifica se houve uma transição de "solto" (last_state_btn1 == 1) para "pressionado" (current_state_btn1 == 0).
        if ((last_state_btn1 == 1) && (current_state_btn1 == 0))
        {
            Delay_ms_Timer(50); // Atraso de 50ms para Debounce: espera para ver se o pressionamento é estável.
            // Após o debounce, verifica novamente se o botão ainda está pressionado.
            // Isso filtra ruídos mecânicos do botão que poderiam gerar múltiplos disparos.
            if (ReadButton(BOT_1_PORT, BOT_1_PIN) == 0)
            {
                Contagem_14s();   // Chama a função de contagem regressiva de 14 segundos
                BUZZER(1, 500);   // Aciona o buzzer/LED uma vez por 500ms ao final da contagem
            }
        }

        // --- Lógica para o Botão 2 (BTN2) - Inicia Contagem de 24s ---
        // Implementação idêntica ao BTN1, mas para a contagem de 24 segundos.
        if ((last_state_btn2 == 1) && (current_state_btn2 == 0))
        {
            Delay_ms_Timer(50); // Debounce
            if (ReadButton(BOT_2_PORT, BOT_2_PIN) == 0) // Confirma se continua pressionado
            {
                Contagem_24s();   // Chama a função de contagem regressiva de 24 segundos
                BUZZER(1, 500);   // Aciona o buzzer/LED uma vez por 500ms ao final da contagem
            }
        }

        // Atualiza o estado anterior dos botões para a próxima iteração do loop.
        last_state_btn1 = current_state_btn1;
        last_state_btn2 = current_state_btn2;

        Delay_ms_Timer(20); // Pequeno atraso no loop principal para evitar "polling" excessivo
                            // e reduzir o consumo de CPU, embora ainda seja um atraso bloqueante.
    }
}

// ---------------------- Função para Leitura do Botão --------------------------
// Lê o estado de um pino de botão específico.
// Retorna 0 se o botão estiver pressionado (o pino está em nível LOW, pois está configurado com pull-up
// e o botão o conecta ao GND quando pressionado).
// Retorna 1 se o botão estiver solto (o pino está em nível HIGH devido ao pull-up).
uint8_t ReadButton(GPIO_TypeDef* PORT, uint8_t PIN)
{
	return (GPIO_ReadInputPin(PORT, PIN) == RESET) ? 0 : 1;
}

// ---------------------- Função para Acionamento do Buzzer/LED de Feedback --------------------------
// num_acm: Número de vezes que o buzzer/LED irá acionar (piscar/emitir som).
// temp_acm: Tempo de duração (em milissegundos) de cada estado (ligado e desligado).
void BUZZER (uint8_t num_acm, uint16_t temp_acm)
{
	uint8_t i;
	for(i = 0; i < num_acm; i++)
	{
		GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN); // Ativa o buzzer/LED (define o pino como HIGH)
		LED(4, 500);                             // Chama a função LED para piscar os displays BCD como um efeito visual
		Delay_ms_Timer(temp_acm);                // Mantém o buzzer/LED ativo pelo tempo especificado

		GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);  // Desativa o buzzer/LED (define o pino como LOW)
		Delay_ms_Timer(temp_acm);                // Mantém o buzzer/LED desativado pelo tempo especificado
	}
}

// ---------------------- Função Para o Pisca-pisca dos Displays BCD (efeito visual) --------------------------
// num_acm: Número de vezes que os displays BCD irão piscar (aceso e apagado).
// temp_acm: Tempo de duração (em milissegundos) de cada estado (aceso e apagado).
void LED (uint8_t num_acm, uint16_t temp_acm)
{
	uint8_t i;
	for(i = 0; i < num_acm; i++)
	{
		// Acende todos os segmentos dos displays BCD (representa o número '8' quando todos os bits estão em HIGH)
		GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);
		GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);
		GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);
		GPIO_WriteHigh(LD_D_PORT, LD_D_PIN);
		pulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades
		pulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das dezenas

		Delay_ms_Timer(temp_acm); // Mantém os displays acesos pelo tempo especificado

		// Apaga todos os segmentos dos displays BCD
		GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
		GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
		GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
		GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
		pulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor "apagado" nas unidades
		pulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor "apagado" nas dezenas

		Delay_ms_Timer(temp_acm); // Mantém os displays apagados pelo tempo especificado
	}
}

// ---------------------- Contagem Regressiva de 14 Segundos --------------------------
void Contagem_14s(void)
{
	int i;           // Variável do contador
	uint8_t unidades; // Dígito das unidades
	uint8_t dezenas;  // Dígito das dezenas

	// Loop de contagem regressiva de 14 até 0
	for(i = 14; i >= 0; i--)
	{
		unidades = i % 10;  // Calcula o dígito das unidades (resto da divisão por 10)
		dezenas = i / 10;   // Calcula o dígito das dezenas (resultado da divisão inteira por 10)

		writeBCD(unidades);         // Envia o dígito das unidades para os pinos BCD
		pulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades

		writeBCD(dezenas);          // Envia o dígito das dezenas para os pinos BCD
		pulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das dezenas

		Delay_ms_Timer(1000); // Aguarda 1 segundo antes de decrementar a contagem.
                              // Esta função é bloqueante.
	}
}

// ---------------------- Contagem Regressiva de 24 Segundos --------------------------
// Implementação idêntica à Contagem_14s, mas inicia de 24.
void Contagem_24s(void)
{
	int i;
	uint8_t unidades;
	uint8_t dezenas;

	for(i = 24; i >= 0; i--)
	{
		unidades = i % 10;
		dezenas = i / 10;

		writeBCD(unidades);
		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);

		writeBCD(dezenas);
		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);

		Delay_ms_Timer(1000); // Aguarda 1 segundo
	}
}

// ---------------------- Função para Escrever um Valor BCD --------------------------
// Converte um valor decimal (0-9) para sua representação BCD de 4 bits
// e define os estados dos pinos LD_A a LD_D de acordo.
void writeBCD(uint8_t valor)
{
	// Verifica cada bit do 'valor' e define o pino correspondente como HIGH ou LOW.
	// Ex: se valor é 5 (0101 binário), LD_A e LD_C serão HIGH, LD_B e LD_D serão LOW.
	if(valor & 0x01) GPIO_WriteHigh(LD_A_PORT, LD_A_PIN); else GPIO_WriteLow(LD_A_PORT, LD_A_PIN); // Bit 0 (1)
	if(valor & 0x02) GPIO_WriteHigh(LD_B_PORT, LD_B_PIN); else GPIO_WriteLow(LD_B_PORT, LD_B_PIN); // Bit 1 (2)
	if(valor & 0x04) GPIO_WriteHigh(LD_C_PORT, LD_C_PIN); else GPIO_WriteLow(LD_C_PORT, LD_C_PIN); // Bit 2 (4)
	if(valor & 0x08) GPIO_WriteHigh(LD_D_PORT, LD_D_PIN); else GPIO_WriteLow(LD_D_PORT, LD_D_PIN); // Bit 3 (8)
}

// ---------------------- Função para Gerar Pulso no Latch --------------------------
// Gera um pulso curto (HIGH-LOW) no pino latch especificado.
// Este pulso é necessário para que o decodificador BCD "leia" os dados
// atualmente presentes nos pinos de dados (LD_A a LD_D) e os exiba.
void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN)
{
	GPIO_WriteHigh(PORT, PIN);  // Define o pino latch como HIGH
	Delay_ms_Timer(1);          // Aguarda um pequeno tempo (1ms) para garantir o pulso
	GPIO_WriteLow(PORT, PIN);   // Define o pino latch como LOW
}

// ---------------------- Inicialização GPIO (Pinos de Entrada/Saída) --------------------------
// Configura a direção (entrada/saída) e o modo de operação de cada pino GPIO utilizado.
void InitGPIO(void)
{
	// Pinos de dados BCD: configurados como Saídas Push-Pull de Baixa Frequência, inicialmente LOW.
	// "Push-pull" significa que o pino pode tanto fornecer corrente (HIGH) quanto afundar (LOW).
	// "Low_Fast" significa que a velocidade de transição é rápida.
	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

	// Pinos Latch: configurados como Saídas Push-Pull de Baixa Frequência, inicialmente LOW.
	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

	// Pinos dos Botões: configurados como Entrada com Pull-up interno, SEM interrupção.
	// "Pull-up" significa que o pino é mantido em nível HIGH (1) por um resistor interno quando o botão não é pressionado.
	// "NO_IT" significa que esses pinos não gerarão interrupções.
	GPIO_Init(BOT_1_PORT, BOT_1_PIN, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BOT_2_PORT, BOT_2_PIN, GPIO_MODE_IN_PU_NO_IT);

	// Pino do Buzzer/LED: configurado como Saída Push-Pull de Baixa Frequência, inicialmente LOW.
	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}

// ---------------------- Inicialização CLOCK (Relógio do Sistema) --------------------------
// Configura o clock principal do microcontrolador para usar o HSI (High-Speed Internal)
// a 16MHz, que é o oscilador interno padrão do STM8.
void InitCLOCK(void)
{
	CLK_DeInit(); // Reseta todas as configurações do clock para os valores padrão de fábrica.

	CLK_HSECmd(DISABLE); // Desabilita o oscilador externo de alta velocidade (HSE), se houver.
	CLK_LSICmd(DISABLE); // Desabilita o oscilador interno de baixa velocidade (LSI), usado para RTC/AWU.
	CLK_HSICmd(ENABLE);  // Habilita o oscilador interno de alta velocidade (HSI).

	// Loop de espera: aguarda até que o HSI esteja pronto e estável para uso.
	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

	CLK_ClockSwitchCmd(ENABLE);              // Permite a troca da fonte de clock.
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // Define o prescaler do HSI para DIV1 (16MHz / 1 = 16MHz).
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // Define o prescaler da CPU para DIV1 (CPU roda na velocidade do clock do sistema).
	// Configura a troca automática para a fonte HSI quando estiver pronta.
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

	// Desabilita os clocks de periféricos não utilizados para economizar energia e reduzir ruído.
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE); // Habilita o clock para o Timer 4, pois ele será usado.
}

// ---------------------- Inicialização TIMER4 --------------------------
// Configura o Timer 4 para ser a base de tempo para a função Delay_ms_Timer.
// O objetivo é gerar um "tick" de 1ms.
// Com o Clock do Sistema (HSI) em 16MHz:
// Frequência do Timer 4 = Frequência do Clock / Prescaler.
// Tempo de um tick = (Autoreload + 1) / Frequência do Timer 4.
//
// Usando Prescaler = 128: Freq. Timer = 16,000,000 Hz / 128 = 125,000 Hz.
// Usando Autoreload = 125: Cada ciclo do timer tem (125 + 1) = 126 contagens.
// Tempo de 1 tick = 126 / 125,000 Hz, aproximadamente 1ms.
// (Nota: Se o autoreload fosse 124, seria exatamente 125 contagens, resultando em 1ms perfeito).
void InitTIM4(void)
{
	// Define o prescaler do Timer 4 para 128, que divide o clock do sistema por 128.
	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
	// Define o valor de autoreload para 125. O timer contará de 0 a 125 antes de transbordar.
	// Isso significa 126 "ticks" de clock do timer por transbordamento.
	TIM4_SetAutoreload(125);
	// Desabilita a interrupção de atualização do Timer 4.
	// A função Delay_ms_Timer fará um "polling" do flag de atualização, sem usar interrupções.
	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
	// Habilita o Timer 4 para começar a contar.
	TIM4_Cmd(ENABLE);
}

// ---------------------- Função de Atraso em Milissegundos (Bloqueante) --------------------------
// Implementa um atraso de 'ms' milissegundos usando o Timer 4.
// Esta é uma função de atraso "bloqueante": o microcontrolador fica em um loop
// esperando o tempo passar e não executa nenhuma outra tarefa durante esse período.
void Delay_ms_Timer(uint16_t ms)
{
	// Loop que se repete 'ms' vezes, onde cada iteração representa 1 milissegundo de atraso.
	while(ms--)
	{
		TIM4_SetCounter(0);       // Zera o contador do Timer 4.
		TIM4_ClearFlag(TIM4_FLAG_UPDATE); // Limpa o flag de atualização (transbordamento) do Timer 4.
		// Espera em um loop até que o flag de atualização seja configurado,
		// indicando que 1ms se passou (o timer contou até seu autoreload e transbordou).
		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
	}
}