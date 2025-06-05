/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 
 * Desenvolvimento para aplicar o acionamento do botão para acionar o buzzer e piscar o terceiro LED
 * e retornando para o estado atual de dois leds alternando entre eles
 
 */

// Inclue as Bibliotecas
#include "stm8s.h"
#include "stm8s903k.h"

// Define os pinos utilizados para os LEDs
#define LED_01_PORT		GPIOE							
#define LED_01_PIN		GPIO_PIN_5

#define LED_02_PORT		GPIOC
#define LED_02_PIN		GPIO_PIN_2

#define LED_03_PORT		GPIOC
#define LED_03_PIN		GPIO_PIN_3

// Pinos para o Botão
#define BOTAO_PORT 		GPIOC
#define BOTAO_PIN		GPIO_PIN_1


// Pino para o Buzzer
#define BUZZER_PORT		GPIOC
#define BUZZER_PIN		GPIO_PIN_4

// Protótipos das funções (todos padronizados para minúsculas para consistência)
void InitGPIO(void);
void InitCLOCK(void);

main()
{
	while (1)
	{
	}
}

//Função para a configuração dos pinos
void InitGPIO(void)
{
	// Configura os pinos dos LEDs como saída push-pull, com nível baixo e velocidade rápida
	GPIO_Init(LED_01_PORT, LED_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
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