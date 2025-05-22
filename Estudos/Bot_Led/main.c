/* MAIN.C file
 * 
 * Projeto: LED com botão - STM8S903K3
 */

#include "stm8s.h"
#include "stm8s903k.h" 

// Declaração das funções locais
void InitGPIO(void);
void InitCLOCK(void);
uint8_t ReadButton(void);

// Define o pino de entrada e porta (botão)
#define INPUT_PORT GPIOC
#define INPUT_PIN  GPIO_PIN_3

// Define o pino de saída e porta (LED)
#define LED_PORT   GPIOE
#define LED_PIN    GPIO_PIN_5

void main(void)
{
    InitCLOCK();
    InitGPIO();

    while (1)
    {
        if (ReadButton()) {
            // Se botão pressionado (nível alto, pois entrada está flutuante)
            GPIO_WriteHigh(LED_PORT, LED_PIN);
        } else {
            // Se botão não pressionado
            GPIO_WriteLow(LED_PORT, LED_PIN);
        }
    }
}

// Configura os pinos
void InitGPIO(void)
{
    // LED como saída push-pull, nível baixo inicial, velocidade rápida
    GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

    // Botão como entrada com pull-up e sem interrupção
    GPIO_Init(INPUT_PORT, INPUT_PIN, GPIO_MODE_IN_PU_NO_IT);
}

// Lê o estado do botão
uint8_t ReadButton(void)
{
    // Quando pressionado, o pino vai para nível baixo (0)
    return (GPIO_ReadInputPin(INPUT_PORT, INPUT_PIN) == RESET);
}

// Configura o clock do sistema
void InitCLOCK(void)
{
    CLK_DeInit(); 

    CLK_HSECmd(DISABLE);
    CLK_LSICmd(DISABLE);
    CLK_HSICmd(ENABLE);  // Clock interno de 16 MHz
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

    CLK_ClockSwitchCmd(ENABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);

    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

    // Ativa somente os periféricos necessários
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
}
