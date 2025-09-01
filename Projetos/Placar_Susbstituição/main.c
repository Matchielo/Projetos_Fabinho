/* MAIN.C file
 * 
 * STM8S903K3 — Placar com 4 botões, BCD + Latch
 * Atravez de um botão aciona a contagem de 1 digito para o display
 * toda vez que o botão é acionado adiciona +1 ao display
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s_tim5.h" 
#include "stm8s_tim6.h"

// ==============================================================================
// DEFINIÇÕES - PINAGEM
// ==============================================================================

#define LATCH_01_PORT	GPIOC
#define LATCH_01_PIN	GPIO_PIN_1  // Latch do Display 1

#define LATCH_02_PORT GPIOC
#define LATCH_02_PIN  GPIO_PIN_2

#define LATCH_03_PORT GPIOC
#define LATCH_03_PIN  GPIO_PIN_3

#define LATCH_04_PORT GPIOC
#define LATCH_04_PIN  GPIO_PIN_4

#define LD_A_PORT	GPIOB
#define LD_A_PIN	GPIO_PIN_0

#define LD_B_PORT	GPIOB
#define LD_B_PIN	GPIO_PIN_1

#define LD_C_PORT	GPIOB
#define LD_C_PIN	GPIO_PIN_2

#define LD_D_PORT	GPIOB
#define LD_D_PIN	GPIO_PIN_3

// Botões para acionamento dos numeros do placar de substituição 1
#define BOTAO_1_PORT GPIOD
#define BOTAO_1_PIN  GPIO_PIN_2

#define BOTAO_2_PORT GPIOD
#define BOTAO_2_PIN  GPIO_PIN_3

#define BOTAO_3_PORT GPIOD
#define BOTAO_3_PIN  GPIO_PIN_4

#define BOTAO_4_PORT GPIOD
#define BOTAO_4_PIN  GPIO_PIN_5

#define DEBOUNCE_INTERVAL_MS 100 
// Botões para acionamento dos numeros do placar de substituição 2

// ==============================================================================
// VARIÁVEIS GLOBAIS
// ==============================================================================

// VARIÁVEIS PARA O BOTÃO 1
volatile uint16_t countDebounceUp_01;
volatile uint16_t countDebounceDw_01;
volatile bool flagDebounce_01 = FALSE;

// VARIÁVEIS PARA O BOTÃO 2
volatile uint16_t countDebounceUp_02;
volatile uint16_t countDebounceDw_02;
volatile bool flagDebounce_02 = FALSE;

// VARIÁVEIS PARA O BOTÃO 3
volatile uint16_t countDebounceUp_03;
volatile uint16_t countDebounceDw_03;
volatile bool flagDebounce_03 = FALSE;

// VARIÁVEIS PARA O BOTÃO 3
volatile uint16_t countDebounceUp_04;
volatile uint16_t countDebounceDw_04;
volatile bool flagDebounce_04 = FALSE;

// VARIÁVEIS PARA CONTAGEM DOS DISPLAYS
volatile uint8_t unidades_1 = 0; // Dígito das unidades
//volatile uint8_t dezenas;  // Dígito das dezenas

volatile uint8_t dezenas_1 = 0;

volatile uint8_t unidades_2 = 0; 

volatile uint8_t dezenas_2 = 0;

// Macro para instrução 'No Operation' (atraso mínimo)
#define NOP() _asm("nop")

// ==============================================================================
// DEFINIÇÕES - PROTÓTIPOS
// ==============================================================================
void setup_tim6(void);
void setup_tim5(void);

void InitGPIO(void);

void Contagem_Placar(void);
void WriteBCD(uint8_t valor);

main()
{
	InitGPIO();
	setup_tim5();
	setup_tim6();
	
	Contagem_Placar();
	
	rim();

	while (1)
	{
		// LÓGICA DOS BOTÕES
		//===============================================
		// LÓGIACA BOTÃO 01

		if(GPIO_ReadInputPin(BOTAO_1_PORT, BOTAO_1_PIN) == 0)		
		{
			countDebounceUp_01 = 0;
			countDebounceDw_01++;
			if(countDebounceDw_01 >= 500 && flagDebounce_01 == FALSE)
			{
				countDebounceDw_01--;
				flagDebounce_01 = TRUE;
				dezenas_1++;
				if (dezenas_1 > 9)
				{
					dezenas_1 = 0;
				}
				Contagem_Placar();
			}
		}
		else if (GPIO_ReadInputPin(BOTAO_1_PORT, BOTAO_1_PIN) != 0)
		{
			countDebounceDw_01 = 0;
			countDebounceUp_01++;
			if(countDebounceUp_01 >= 500)
			{
				countDebounceUp_01--;
				flagDebounce_01 = FALSE;
			}
		}
		
		//==========================================================
		// LÓGIACA BOTÃO 02

		if(GPIO_ReadInputPin(BOTAO_2_PORT, BOTAO_2_PIN) == RESET )
		{
			countDebounceUp_02 = 0;
			countDebounceDw_02++;
			if(countDebounceDw_02 >= 500 && flagDebounce_02 == FALSE)
			{
				countDebounceDw_02--;
				flagDebounce_02 = TRUE;
				
				unidades_1++;
				if (unidades_1 > 9)
				{
					unidades_1 = 0;
				}
				Contagem_Placar();
			}
		}
		else if(GPIO_ReadInputPin(BOTAO_2_PORT, BOTAO_2_PIN) != RESET )
		{
			countDebounceDw_02 = 0;
			countDebounceUp_02++;
			if(countDebounceUp_02 >= 500)
			{
				countDebounceUp_02--;
				flagDebounce_02 = FALSE;
			}
		}
		
		//==========================================================
		// LÓGIACA BOTÃO 03

		if(GPIO_ReadInputPin(BOTAO_3_PORT, BOTAO_3_PIN) == RESET )
		{
			countDebounceUp_03 = 0;
			countDebounceDw_03++;
			if(countDebounceDw_03 >= 500 && flagDebounce_03 == FALSE)
			{
				countDebounceDw_03--;
				flagDebounce_03 = TRUE;
				
				dezenas_2++;
				if (dezenas_2 > 9)
				{
					dezenas_2 = 0;
				}
				Contagem_Placar();
			}
		}
		else if(GPIO_ReadInputPin(BOTAO_3_PORT, BOTAO_3_PIN) != RESET )
		{
			countDebounceDw_03 = 0;
			countDebounceUp_03++;
			if(countDebounceUp_03 >= 500)
			{
				countDebounceUp_03--;
				flagDebounce_03 = FALSE;
			}
		}
		
		//==========================================================
		// LÓGIACA BOTÃO 04

		if(GPIO_ReadInputPin(BOTAO_4_PORT, BOTAO_4_PIN) == RESET )
		{
			countDebounceUp_04 = 0;
			countDebounceDw_04++;
			if(countDebounceDw_04 >= 500 && flagDebounce_04 == FALSE)
			{
				countDebounceDw_04--;
				flagDebounce_04 = TRUE;
				
				unidades_2++;
				if (unidades_2 > 9)
				{
					unidades_2 = 0;
				}
				Contagem_Placar();
			}
		}
		else if(GPIO_ReadInputPin(BOTAO_4_PORT, BOTAO_4_PIN) != RESET )
		{
			countDebounceDw_04 = 0;
			countDebounceUp_04++;
			if(countDebounceUp_04 >= 500)
			{
				countDebounceUp_04--;
				flagDebounce_04 = FALSE;
			}
		}		
	}
}

// ---------------------- Funções Auxiliares --------------------------
void InitGPIO(void)
{
	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_03_PORT, LATCH_03_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_04_PORT, LATCH_04_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

	GPIO_Init(BOTAO_1_PORT, BOTAO_1_PIN, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BOTAO_2_PORT, BOTAO_2_PIN, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BOTAO_3_PORT, BOTAO_3_PIN, GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BOTAO_4_PORT, BOTAO_4_PIN, GPIO_MODE_IN_PU_NO_IT);

}

void Contagem_Placar(void)
{

	WriteBCD(unidades_1);         // Envia o dígito das dezenas para os pinos BCD
	GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
	
	
	WriteBCD(dezenas_1);          // Envia o dígito das unidades para os pinos BCD
	GPIO_WriteHigh(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das unidades
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_02_PORT, LATCH_02_PIN);
	
	
	WriteBCD(unidades_2);         // Envia o dígito das dezenas para os pinos BCD
	GPIO_WriteHigh(LATCH_03_PORT, LATCH_03_PIN); // Trava o valor no display das unidades
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_03_PORT, LATCH_03_PIN);
	
	
	WriteBCD(dezenas_2);          // Envia o dígito das unidades para os pinos BCD
	GPIO_WriteHigh(LATCH_04_PORT, LATCH_04_PIN); // Trava o valor no display das unidades
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_04_PORT, LATCH_04_PIN);

}
// ---------------------- Função para Escrever um Valor BCD --------------------------
// Converte um valor decimal (0-9) para sua representação BCD de 4 bits
// e define os estados dos pinos LD_A a LD_D de acordo.
void WriteBCD(uint8_t valor)
{
	// Verifica cada bit do 'valor' e define o pino correspondente como HIGH ou LOW.
	// Ex: se valor é 5 (0101 binário), LD_A e LD_C serão HIGH, LD_B e LD_D serão LOW.
	if(valor & 0x01) GPIO_WriteHigh(LD_A_PORT, LD_A_PIN); else GPIO_WriteLow(LD_A_PORT, LD_A_PIN); // Bit 0 (1)
	if(valor & 0x02) GPIO_WriteHigh(LD_B_PORT, LD_B_PIN); else GPIO_WriteLow(LD_B_PORT, LD_B_PIN); // Bit 1 (2)
	if(valor & 0x04) GPIO_WriteHigh(LD_C_PORT, LD_C_PIN); else GPIO_WriteLow(LD_C_PORT, LD_C_PIN); // Bit 2 (4)
	if(valor & 0x08) GPIO_WriteHigh(LD_D_PORT, LD_D_PIN); else GPIO_WriteLow(LD_D_PORT, LD_D_PIN); // Bit 3 (8)
}

void setup_tim6(void)
{
	// 1. Habilitar o clock do TIM6
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, ENABLE);

	// 2. Configurar o Prescaler para 64 (TIM6_PRESCALER_64)
	TIM6_PrescalerConfig(TIM6_PRESCALER_64, TIM6_PSCRELOADMODE_IMMEDIATE);

	// 3. Configurar o valor do período (ARR) para 249
	// A interrupção ocorrerá a cada 1ms
	TIM6_SetCounter(0); // Zera o contador
	TIM6_SetAutoreload(249);

	// 4. Habilitar a interrupção do tipo "Update"
	TIM6_ITConfig(TIM6_IT_UPDATE, ENABLE);

	// 5. Habilitar o temporizador
	TIM6_Cmd(ENABLE);

	// 6. Habilitar as interrupções globais no main.c, se ainda não o fez
	// A chamada 'enableInterrupts()' ou 'rim()' deve estar no seu main()
}

void setup_tim5(void)
{
	// 1. Habilitar o clock do TIM5
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER5, ENABLE);

	// 2. Configurar o Prescaler
	// O valor 0x07 (7) no registrador TIM5_PSCR corresponde a um prescaler de 128
	TIM5_PrescalerConfig(TIM5_PRESCALER_128, TIM5_PSCRELOADMODE_IMMEDIATE);

	// 3. Configurar o valor do período (ARR) para 31249
	// A interrupção ocorrerá a cada 250ms
	TIM5_SetCounter(0); // Zera o contador
	TIM5_SetAutoreload(31249);

	// 4. Habilitar a interrupção do tipo "Update"
	TIM5_ITConfig(TIM5_IT_UPDATE, ENABLE);

	// 5. Habilitar o temporizador
	TIM5_Cmd(ENABLE);
}