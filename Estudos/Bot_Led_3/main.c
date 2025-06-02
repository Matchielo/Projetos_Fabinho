/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

// Puxa as Bibliotecas

#include "stm8s.h"
#include "stm8s903k.h"

// Definição dos pinos
#define BOTAO_PORT	GPIOC
#define BOTAO_PIN		GPIO_PIN_3

#define LED_PORT	GPIOE
#define LED_PIN		GPIO_PIN_5

// Funções
void InitGPIO(void);                // Inicializa os pinos
void InitCLOCK(void);              	// Inicializa o clock do sistema
uint8_t ReadButton(void);          	// Lê o estado do botão
void delay_ms(uint16_t ms);       	// Função de atraso (delay em milissegundos)

	
main()
{
	while (1);
}

// Função para configurar os pinos de entrada e saída
void InitGPIO(void)
{
	// Configuração do pinos LED
	GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Configura os pinos do Botão
	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

// Função para Ler o Botão
uint8_t ReadButton(void)
{
	// Le o nível lógico do botão
	// Se estiver pressionado, retorna 0 (RESET). Se estiver solto, retorna 1 (SET)
	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
}

// Função para configuração do Delay
void Delay_ms(uint16_t ms)
{
	uint32_t i;
	// Ajuste o valor de 'i' conforme a velocidade do seu clock
	// Este valor é aproximado e pode precisar de calibração
	for (i = 0; i < (16000 / 1000) * ms; i++); // Assumindo clock de 16MHz
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