/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include	"stm8s.h"
#include	"stm8s903k.h"

// Defiinição dos pinos para acionamento dos SEGMENTOS LEDs
#define SEG_A_PORT			GPIOC
#define SEG_A_PIN			GPIO_PIN_6

#define SEG_B_PORT			GPIOC
#define SEG_B_PIN			GPIO_PIN_7

#define SEG_C_PORT			GPIOD
#define SEG_C_PIN			GPIO_PIN_0

#define SEG_D_PORT			GPIOD
#define SEG_D_PIN			GPIO_PIN_1

#define SEG_E_PORT			GPIOD
#define SEG_E_PIN			GPIO_PIN_2

#define SEG_F_PORT			GPIOD
#define SEG_F_PIN			GPIO_PIN_3

#define SEG_G_PORT			GPIOD
#define SEG_G_PIN			GPIO_PIN_4


// Protótipos das funções
void InitGPIO(void);
void Delay_ms(uint16_t ms);
void InitCLOCK(void);

void seg_0(void);
void seg_1(void);
void seg_2(void);
void seg_3(void);
void seg_4(void);
void seg_5(void);
void seg_6(void);
void seg_7(void);
void seg_8(void);
void seg_9(void);

main()
{
	InitCLOCK();
	InitGPIO();
	
	while (1);
	{
		seg_0(void);
		Delay_ms(1000);
		
		seg_1(void);
		Delay_ms(1000);
		
		seg_2(void);
		Delay_ms(1000);
		
		seg_3(void);
		Delay_ms(1000);
		
		seg_4(void);
		Delay_ms(1000);
		
		seg_5(void);
		Delay_ms(1000);
		
		seg_6(void);
		Delay_ms(1000);
		
		seg_7(void);
		Delay_ms(1000);
		
		seg_8(void);
		Delay_ms(1000);
		
		seg_9(void);
		Delay_ms(1000);
		
	}
}

// Configuração dos pinos do segmento
void InitGPIO(void)
{
	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}

void Delay_ms(uint16_t ms)
{
	volatile uint32_t i;
	for (i = 0; i < (16000UL / 1000UL) * ms; i++);
}

void seg_0(void)
{
	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
}
void seg_1(void)
{
	GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
}
void seg_2(void)
{
	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
}
void seg_3(void)
{
	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
}
void seg_4(void)
{
	GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
}
void seg_5(void)
{
	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
}
void seg_6(void)
{
	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
}
void seg_7(void)
{
	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
}
void seg_8(void)
{
	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
}
void seg_9(void)
{
	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
}

// Função para configurar o clock do sistema
void InitCLOCK(void)
{
    CLK_DeInit(); // Reseta a configuração de clock para o padrão

    CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
    CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
    CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)

    // Aguarda até que o HSI esteja estável
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

    CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)

    // Configura o HSI como fonte principal de clock
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

    // Desativa periféricos não usados para economizar energia
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
}
