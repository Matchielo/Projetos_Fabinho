/* MAIN.C file
 * 
 * Projeto: Pisca LED STM8S903K
 */

#include "stm8s.h"
#include "stm8s903k.h" 


// Declaração das funções
void InitGPIO(void);
void InitCLOCK(void);
void Delay_ms(uint16_t ms); 
void Pisca_LED(void);


// variável que recebe o esttado do led
uint8_t estado_led = 0;

// Função principal
void main(void)
{
	InitCLOCK();
	InitGPIO();
	
	while (1)
	{
		Pisca_LED();
	}
}

// Função de Delay calibrado para clock de 8MHz
void Delay_ms(uint16_t ms)
{
    volatile uint16_t i;
    while (ms--)
    {
        for (i = 0; i < 2000; i++);
    }
}


// Função que pisca o LED
void Pisca_LED(void)
{
	GPIO_WriteHigh(GPIOE, GPIO_PIN_5);
	Delay_ms(500);  // LED ligado por 500ms
	estado_led =1;
	
	GPIO_WriteLow(GPIOE, GPIO_PIN_5);
	Delay_ms(500);  // LED desligado por 500ms
	estado_led =0;
}

// Configuração dos pinos
void InitGPIO(void)
{
	GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);  // LED na porta E5
}


// Configuração do clock
void InitCLOCK(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);  // Ativa HSI (16MHz)
	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

	// Clock CPU = HSI dividido por 2 ? 8MHz
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);

	CLK_ClockSwitchCmd(ENABLE);
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

	// Desabilita periféricos não utilizados
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
}



