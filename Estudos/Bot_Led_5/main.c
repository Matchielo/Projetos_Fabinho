/* MAIN.C file
 *
 * Copyright (c) 2002-2005 STMicroelectronics
 
 * Função para Acender dois LEDs alternados e acionar um buzzer na troca
 
 */

#include "stm8s.h"
#include "stm8s903k.h"

// Define os pinos utilizados
#define LED_01_PORT		GPIOE
#define LED_01_PIN		GPIO_PIN_5

#define LED_02_PORT		GPIOC
#define LED_02_PIN		GPIO_PIN_2

#define BOTAO_PORT 		GPIOC
#define BOTAO_PIN		GPIO_PIN_1

#define BUZZER_PORT		GPIOC
#define BUZZER_PIN		GPIO_PIN_4

// Protótipos das funções (todos padronizados para minúsculas para consistência)
void InitGPIO(void);
void InitCLOCK(void);
uint8_t ReadButton(void);
void delay_ms(uint16_t ms);
void PlayBuzzerTone(uint16_t duration_ms);

main()
{
	uint8_t estado_led = 0;

	uint8_t current_button;
	uint8_t last_button_state = 1;

	InitCLOCK();
	InitGPIO();

	GPIO_WriteHigh(LED_01_PORT, LED_01_PIN); // LED_01 ligado no início
	GPIO_WriteLow(LED_02_PORT, LED_02_PIN);  // LED_02 desligado no início
	GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);  // Buzzer desligado no início

	while (1)
	{
		current_button = ReadButton();

		// Verifica se o botão foi pressionado (borda de descida)
		if (current_button == 0 && last_button_state == 1)
		{
			// Inverte o estado do LED (toggle)
			estado_led = !estado_led;

			// Liga ou desliga os LEDs de acordo com o novo estado
			if (estado_led) // Se estado_led é 1 (LED_02 deve ligar, LED_01 apagar)
			{
				GPIO_WriteLow(LED_01_PORT, LED_01_PIN);
				GPIO_WriteHigh(LED_02_PORT, LED_02_PIN);
			}
			else // Se estado_led é 0 (LED_01 deve ligar, LED_02 apagar)
			{
				GPIO_WriteHigh(LED_01_PORT, LED_01_PIN);
				GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
			}

			delay_ms(20); // CORRIGIDO: Chamada para 'delay_ms' (minúscula)

			// Aciona o buzzer após a troca de LEDs
			PlayBuzzerTone(10000);
		}
		// Atualiza o last_button_state no final de CADA iteração do loop
		last_button_state = current_button;
	}
}

// Função para a configuração dos pinos
void InitGPIO(void)
{
	// Configura os pinos dos LEDs como saída push-pull, com nível baixo e velocidade rápida
	GPIO_Init(LED_01_PORT, LED_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LED_02_PORT, LED_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

	// Configura o pino do botão como entrada pull up sem interrupção
	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);

	// Configura o pino do Buzzer como saída push-pull
	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}

// Função para configuração de Delay
void delay_ms(uint16_t ms)
{
	volatile uint32_t i;
	// Ajuste o valor de 'i' conforme a velocidade do seu clock
	// Este valor é aproximado e pode precisar de calibração
	for (i = 0; i < (16000UL / 1000UL) * ms; i++); // CORRIGIDO: Adicionado UL para cálculo robusto
}

// função para ler o botão
uint8_t ReadButton (void)
{
	// Lê o nível lógico do pino do botão
	// Se estiver pressionado, retorna 0 (RESET). Se estiver solto, retorna 1 (SET)
	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
}

// Função para acionar o buzzer por uma duração
void PlayBuzzerTone(uint16_t duration_ms)
{
    GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN); // Liga o buzzer
    delay_ms(duration_ms);                   
    GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);  // Desliga o buzzer
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