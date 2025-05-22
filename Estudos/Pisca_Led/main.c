 /* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "stm8s903k.h"


// Declaração das funções locais
void InitGPIO(void);
void InitCLOCK(void);

main()
{
	InitCLOCK();
	InitGPIO();
	
	while (1)
	{
		GPIO_WriteHigh(GPIOC, GPIO_PIN_1);
		Delay(1000);
		GPIO_WriteLow(GPIOC, GPIO_PIN_1);	
	}
}

void InitGPIO()
{
	GPIO_Init(GPIOC, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);			//Pins 1 and 2 and 3 ([1]CALL Button; [2]Jumper PAR; [3]Jumper BOT)
}

void InitCLOCK()
{
	CLK_DeInit(); 
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);																																	//HSI Full Clock = 16MHz
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);              												//Divisible by 1; 2; 4; 8
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);																						//Divisible by 1; 2; 4; 8; 16; 32; 64; 128
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}