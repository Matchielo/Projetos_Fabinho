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
void Delay_ms(uint16_t ms);
uint8_t ReadButton (void);
void LedBuzzer(uint8_t num_acionamento, uint16_t temp_acionamento);
void Led_State_01_02(uint8_t current_state);

main()
{
	uint8_t last_button_state = 1;			// Guarda o último estado lido do botão (1 = solto)
	uint8_t current_button;							// Guardará o estado do botão na leitura atual
	
	uint8_t alternate_led_state = 1;		//  Controla o estado dos LEDs 01 e 02 (0=LED_01 aceso, 1=LED_02 aceso)
	
	InitCLOCK();
	InitGPIO();
	
	// Estado inicial: LED_01 aceso, LED_02 e LED_03 apagados, Buzzer apagado
	GPIO_WriteHigh(LED_01_PORT, LED_01_PIN);
	GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
	GPIO_WriteLow(LED_03_PORT, LED_03_PIN);
	GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
	
	while (1)
	{
		current_button = ReadButton();			// CB recebe o valor do estado do Botão atual
		
		// Detecção de borda de descida (botão foi pressionado)
		if (last_button_state == 1 && current_button == 0)
		{
			// Apaga os LEDs 1 e 2
			GPIO_WriteLow(LED_01_PORT, LED_01_PIN);
			GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
				
			LedBuzzer (3,1000);									// Faz o acioonamento do buzzer e o led 3x
				
			GPIO_WriteLow(LED_03_PORT, LED_03_PIN);
			GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
			
			Delay_ms(50); // Debounce para o pressionamento do botão
			
		}
		else
		{
			Led_State_01_02(alternate_led_state); 
			alternate_led_state = !alternate_led_state; // Inverte o estado para a próxima alternância
			Delay_ms(10);
		}
		
		// Atualiza o last_button_state no final de CADA iteração do loop
		last_button_state = current_button;
		
	}
}

//Função para a configuração dos pinos
void InitGPIO(void)
{
	// Configura os pinos dos LEDs como saída push-pull, com nível baixo e velocidade rápida
	GPIO_Init(LED_01_PORT, LED_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LED_02_PORT, LED_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LED_03_PORT, LED_03_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Configura o pino do botão como entrada pull up sem interrupção
	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
	
	// Configura o pino do Buzzer como saída push-pull
	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}

// Função para configuração do Delay
void Delay_ms(uint16_t ms)
{
	volatile uint32_t i;
	for ( i = 0; i < (16000UL / 1000UL) * ms; i++);
}

// Função para configuração do botão
uint8_t ReadButton (void)
{
	// Lê o nível lógico do pino do botão
	// Se estiver pressionado, retorna 0 (RESET). Se estiver solto, retorna 1 (SET)
	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
}

// Função para acionar o LED eo Buzzer
void LedBuzzer(uint8_t num_acionamento, uint16_t temp_acionamento)
{
	uint8_t i;
	for (i = 0; i < num_acionamento; i++)
	{
		GPIO_WriteHigh(LED_03_PORT, LED_03_PIN);
		GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
		Delay_ms(temp_acionamento);
		GPIO_WriteLow(LED_03_PORT, LED_03_PIN);
		GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
		Delay_ms(temp_acionamento);
	}
}
void Led_State_01_02(uint8_t current_state) 
{
	if (current_state == 0)											// Se o estado é 0 (aciona LED_01)
	{
		GPIO_WriteHigh(LED_01_PORT, LED_01_PIN);
		GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
	}
	else
	{
		GPIO_WriteLow(LED_01_PORT, LED_01_PIN);
		GPIO_WriteHigh(LED_02_PORT, LED_02_PIN);
	}
	 Delay_ms(2000);
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