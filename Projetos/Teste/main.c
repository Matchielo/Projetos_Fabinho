/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "stm8s903k.h"

// Definição dos pinos
#define PORT_LED				GPIOC
#define PIN_LED					GPIO_PIN_3 		

// Inclusão dos protótipos das funções 
void InitCLOCK(void);
void InitGPIO(void);

main()
{
	
	void InitCLOCK();		// Configuração do CLOCK
	void InitGPIO(); 		// Configuração do GPIO
	
	
	while (1)
	{
			// Atualiza o LED como ALTA
			GPIO_WriteHigh(PORT_LED, PIN_LED);
			Delay_ms(1000);
			
			// Atualiza o LED como BAIXA
			GPIO_WriteLow(PORT_LED, PIN_LED);
			Delay_ms(1000);
	}
}

// Função para consfiguração dos pinos
void InitGPIO()
{
	GPIO_Init(PORT_LED, PIN_LED, GPIO_MODE_OUT_PP_LOW_FAST);
}

// função que adicionar o timer em milisegundos
void Delay_ms(uint16_t ms)
{
	volatile uint32_t i; 
	for(i = 0; i < (8 * 10) * ms; i++);
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

    CLK_ClockSwitchCmd(ENABLE);                        // Habilita a troca de clock automática
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);     // Prescaler HSI = 1 (clock total)
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);           // Prescaler CPU = 1 (clock total)

    // Configura o HSI como fonte principal de clock
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

    // Desativa periféricos não usados para economizar energia
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
}