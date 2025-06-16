/* MAIN.C file
 * Contagem de 0 a 20 em dois displays BCD usando STM8S903K3
 */

#include "stm8s.h"
#include "stm8s903k.h"
#include "stm8s_tim4.h"

// ---------------------- Definições dos Pinos --------------------------
#define LATCH_01_PORT	GPIOC
#define LATCH_01_PIN	GPIO_PIN_2  // Latch das unidades

#define LATCH_02_PORT	GPIOC
#define LATCH_02_PIN	GPIO_PIN_1  // Latch das dezenas

#define LD_A_PORT	GPIOB
#define LD_A_PIN	GPIO_PIN_0

#define LD_B_PORT	GPIOB
#define LD_B_PIN	GPIO_PIN_1

#define LD_C_PORT	GPIOB
#define LD_C_PIN	GPIO_PIN_2

#define LD_D_PORT	GPIOB
#define LD_D_PIN	GPIO_PIN_3

// ---------------------- Protótipos --------------------------
void InitCLOCK(void);
void InitGPIO(void);
void InitTIM4(void);
void Delay_ms_Timer(uint16_t ms);

void writeBCD(uint8_t valor);
void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN);
void CONTAGEM(void);

// ---------------------- Função Principal --------------------------
void main(void)
{
	InitCLOCK();
	InitTIM4();
	InitGPIO();
	
	while(1)
	{
		CONTAGEM();
	}
}

// ---------------------- Função de Contagem de 0 a 20 --------------------------
void CONTAGEM(void)
{
	uint8_t i;
	uint8_t unidades;
	uint8_t dezenas;

	for(i = 0; i <= 24; i++)
	{
		unidades = i % 10;
		dezenas = i / 10;

		// --------- Envia unidades ----------
		writeBCD(unidades);
		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
		
		// --------- Envia dezenas ----------
		writeBCD(dezenas);
		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
		
		// --------- Aguarda 1 segundo ----------
		Delay_ms_Timer(1000);
	}
}

// ---------------------- Função para enviar BCD aos pinos --------------------------
void writeBCD(uint8_t valor)
{
	// A
	if(valor & 0x01)
		GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);
	else
		GPIO_WriteLow(LD_A_PORT, LD_A_PIN);

	// B
	if(valor & 0x02)
		GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);
	else
		GPIO_WriteLow(LD_B_PORT, LD_B_PIN);

	// C
	if(valor & 0x04)
		GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);
	else
		GPIO_WriteLow(LD_C_PORT, LD_C_PIN);

	// D
	if(valor & 0x08)
		GPIO_WriteHigh(LD_D_PORT, LD_D_PIN);
	else
		GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
}

// ---------------------- Pulso no Latch --------------------------
void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN)
{
	GPIO_WriteHigh(PORT, PIN);
	Delay_ms_Timer(1);
	GPIO_WriteLow(PORT, PIN);
}

// ---------------------- Inicialização do GPIO --------------------------
void InitGPIO(void)
{
	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}

// ---------------------- Inicialização do Clock --------------------------
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

// ---------------------- Inicialização do Timer 4 --------------------------
void InitTIM4(void)
{
	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
	TIM4_SetAutoreload(125);
	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
	TIM4_Cmd(ENABLE);
}

// ---------------------- Delay em ms usando Timer 4 --------------------------
void Delay_ms_Timer(uint16_t ms)
{
	while(ms--)
	{
		TIM4_SetCounter(0);
		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
	}
}
