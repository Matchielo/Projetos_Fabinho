/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "stm8s903k.h"

// Define os pinos utilizados
#define LED_01_PORT		GPIOE 			// Defnie a Porta do LED
#define LED_01_PIN		GPIO_PIN_5		// Define o pino do LED

#define LED_02_PORT 	GPIOC
#define LED_02_PIN		GPIO_PIN_4

#define BOTAO_PORT 		GPIOC			// define a porta do botão
#define BOTAO_PIN		GPIO_PIN_3		// define o pino do botão

// Protótipos das funções
void InitGPIO(void);                // Inicializa os pinos
void InitCLOCK(void);              	// Inicializa o clock do sistema
uint8_t ReadButton(void);          	// Lê o estado do botão
void delay_ms(uint16_t ms);       	// Função de atraso (delay em milissegundos)


main()
{
	uint8_t estado_led = 0;				// Guarda o estado do Led 01 - inicia apagado
	
	uint8_t last_button_state = 1; 		// Guarda o último estado lido do botão (1 = solto)
	uint8_t current_button; 					// Guardará o estado do botão na leitura atual
	
	InitCLOCK();                   		// Configura o clock do microcontrolador
	InitGPIO();                    		// Configura os pinos de entrada e saída
	
	    // Inicializa o estado dos LEDs: LED_01 aceso, LED_02 apagado (corresponde a estado_led = 0)
    GPIO_WriteHigh(LED_01_PORT, LED_01_PIN);
    GPIO_WriteLow(LED_02_PORT, LED_02_PIN);

	while (1) // Loop infinito principal
	{
		// Le o estado do botão
		current_button = ReadButton();
		
		// Verifica se o botão foi pressionado (borda de descida)
		if (current_button == 0 && last_button_state == 1) // Detecção de borda de descida
		{
			// Inverte o estado do LED (toggle)
			estado_led = !estado_led; // 0 vira 1, 1 vira 0

			// Liga/Desliga os LEDs de acordo com o novo estado
			if (estado_led) // Se estado_led é 1 (anteriormente era 0)
			{
				GPIO_WriteHigh(LED_02_PORT, LED_02_PIN); // Liga LED_02
				GPIO_WriteLow(LED_01_PORT, LED_01_PIN);	// Apaga LED_01
			}
			else // Se estado_led é 0 (anteriormente era 1)
			{
				GPIO_WriteHigh(LED_01_PORT, LED_01_PIN); // Liga LED_01
				GPIO_WriteLow(LED_02_PORT, LED_02_PIN); // Apaga LED_02
			}
				
			delay_ms(20); // Aguarda 20 ms para evitar múltiplos disparos (debounce)
		}
        // Atualiza o last_button_state no final de CADA iteração do loop, não apenas dentro do if
        last_button_state = current_button;
	}
}

// Função para a configuração dos pinos
void InitGPIO(void)
{
	// Configura o pino do LED como saída push-pull, com nível baixo e velocidade rápida
	GPIO_Init(LED_01_PORT, LED_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LED_02_PORT, LED_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Configura o pino do botão como entrada com pull-up interno e sem interrupção
	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);	
}

// Função para configuração do Delay
void delay_ms(uint16_t ms)
{
	volatile uint32_t i;
	// Ajuste o valor de 'i' conforme a velocidade do seu clock
	// Este valor é aproximado e pode precisar de calibração
	for (i = 0; i < (16000 / 1000) * ms; i++); // Assumindo clock de 16MHz
}

// função para ler o botão
uint8_t ReadButton(void)
{
	// Lê o nível lógico do pino do botão
	// Se estiver pressionado, retorna 0 (RESET). Se estiver solto, retorna 1 (SET)
	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
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
