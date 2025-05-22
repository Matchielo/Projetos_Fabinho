#include "stm8s.h"
#include "stm8s903k.h"

// Define os pinos utilizados
#define INPUT_PORT GPIOC            // Porta do botão
#define INPUT_PIN  GPIO_PIN_3       // Pino do botão: PC3

#define LED_PORT   GPIOE            // Porta do LED
#define LED_PIN    GPIO_PIN_5       // Pino do LED: PE5

// Protótipos das funções
void InitGPIO(void);                // Inicializa os pinos
void InitCLOCK(void);              	// Inicializa o clock do sistema
uint8_t ReadButton(void);          	// Lê o estado do botão
void delay_ms(uint16_t ms);       	// Função de atraso (delay em milissegundos)

void main(void)
{
    uint8_t led_state = 0;        	// Guarda o estado atual do LED (0 = desligado, 1 = ligado)
		uint8_t last_button_state = 1; 	// Guarda o último estado lido do botão (1 = solto)
		uint8_t current_button; 

		InitCLOCK();                   	// Configura o clock do microcontrolador
    InitGPIO();                    	// Configura os pinos de entrada e saída
		
		GPIO_WriteHigh(LED_PORT, LED_PIN);
    while (1)
    {
        current_button = ReadButton();

        // Verifica se o botão foi pressionado (borda de descida)
        if (last_button_state == 1 && current_button == 0)
        {
            led_state = !led_state; // Inverte o estado do LED (toggle)

            // Liga ou desliga o LED de acordo com o novo estado
            if (led_state)
                GPIO_WriteHigh(LED_PORT, LED_PIN);  // Liga o LED
            else
                GPIO_WriteLow(LED_PORT, LED_PIN);   // Desliga o LED

            delay_ms(20); // Aguarda 20 ms para evitar múltiplos disparos (debounce)
        }

        last_button_state = current_button; // Atualiza o último estado do botão
    }
}

// Função para configurar os pinos de entrada e saída
void InitGPIO(void)
{
    // Configura o pino do LED como saída push-pull, com nível baixo e velocidade rápida
    GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

    // Configura o pino do botão como entrada com pull-up interno e sem interrupção
    GPIO_Init(INPUT_PORT, INPUT_PIN, GPIO_MODE_IN_PU_NO_IT);
}

// Função para ler o botão
uint8_t ReadButton(void)
{
    // Lê o nível lógico do pino do botão
    // Se estiver pressionado, retorna 0 (RESET). Se estiver solto, retorna 1 (SET)
    return (GPIO_ReadInputPin(INPUT_PORT, INPUT_PIN) == RESET);
}

// Função de atraso em milissegundos
void delay_ms(uint16_t ms)
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
