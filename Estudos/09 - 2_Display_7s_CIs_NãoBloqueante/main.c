/* MAIN.C - Contagem Não Bloqueante STM8S903K3 (Refatorado) */

#include "stm8s.h"
#include "stm8s903k.h"
#include "stm8s_tim4.h"
//#include "stm8s_itc.h"

// ---------------------- Definições dos Pinos --------------------------
#define LATCH_01_PORT GPIOC
#define LATCH_01_PIN  GPIO_PIN_2
#define LATCH_02_PORT GPIOC
#define LATCH_02_PIN  GPIO_PIN_1

#define LD_A_PORT GPIOB
#define LD_A_PIN  GPIO_PIN_0
#define LD_B_PORT GPIOB
#define LD_B_PIN  GPIO_PIN_1
#define LD_C_PORT GPIOB
#define LD_C_PIN  GPIO_PIN_2
#define LD_D_PORT GPIOB
#define LD_D_PIN  GPIO_PIN_3

#define BOTAO_14_PORT GPIOD
#define BOTAO_14_PIN  GPIO_PIN_2
#define BOTAO_24_PORT GPIOD
#define BOTAO_24_PIN  GPIO_PIN_3

#define BUZZER_PORT GPIOD
#define BUZZER_PIN  GPIO_PIN_0

// Macro para instrução 'No Operation' (atraso mínimo)
#define NOP() _asm("nop")

// ---------------------- Variáveis Globais --------------------------
volatile uint8_t tempo_restante = 0;
volatile uint8_t em_contagem = 0;
volatile uint16_t contador_ms = 0;

// Variáveis para a sequência de finalização não bloqueante
volatile uint8_t fim_contagem_estado = 0;     // 0 = inativo, >0 = estado atual da sequência
volatile uint16_t contador_ms_sequencia = 0;  // Contador de tempo para a sequência

// ---------------------- Protótipos --------------------------
void InitGPIO(void);
void InitCLOCK(void);
void TIM4_Config(void);
void writeBCD(uint8_t valor);
void pulseLatch(GPIO_TypeDef* porta, uint8_t pino);
void apagarDisplay(void);
void atualizarDisplay(uint8_t valor);

// ---------------------- Main --------------------------
void main(void)
{
    InitCLOCK();
    InitGPIO();
        
     // Configura prioridade (opcional, mas recomendado)
    ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
    TIM4_Config();
    enableInterrupts();
    
    apagarDisplay(); // Garante que o display comece apagado

    while (1)
    {
        // Verifica se o botão 14 foi pressionado
        if (GPIO_ReadInputPin(BOTAO_14_PORT, BOTAO_14_PIN) == RESET)
        {
            // Reinicia a contagem de 14s, interrompendo qualquer contagem ou sequência em andamento
            tempo_restante = 14;
            em_contagem = 1;
            contador_ms = 0;
            fim_contagem_estado = 0; // Garante que a sequência de finalização seja cancelada
            atualizarDisplay(tempo_restante); // ATUALIZAÇÃO IMEDIATA
            // Adicionar um pequeno atraso ou lógica de debouncing se o botão for muito sensível
            while(GPIO_ReadInputPin(BOTAO_14_PORT, BOTAO_14_PIN) == RESET) { NOP(); } // Simples debouncing
        }

        // Verifica se o botão 24 foi pressionado
        if (GPIO_ReadInputPin(BOTAO_24_PORT, BOTAO_24_PIN) == RESET)
        {
            // Reinicia a contagem de 24s, interrompendo qualquer contagem ou sequência em andamento
            tempo_restante = 24;
            em_contagem = 1;
            contador_ms = 0;
            fim_contagem_estado = 0; // Garante que a sequência de finalização seja cancelada
            atualizarDisplay(tempo_restante); // ATUALIZAÇÃO IMEDIATA
            // Adicionar um pequeno atraso ou lógica de debouncing se o botão for muito sensível
            while(GPIO_ReadInputPin(BOTAO_24_PORT, BOTAO_24_PIN) == RESET) { NOP(); } // Simples debouncing
        }
    }
}

// ---------------------- Interrupção Timer4 (a cada 1ms) --------------------------
INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
    TIM4_ClearITPendingBit(TIM4_IT_UPDATE);

    // --- Lógica Principal da Contagem ---
    if (em_contagem)
    {
        contador_ms++;
        if (contador_ms >= 1000) // Passou 1 segundo
        {
            contador_ms = 0;

            if (tempo_restante > 0)
            {
                tempo_restante--;
                atualizarDisplay(tempo_restante);
            }
            
            if (tempo_restante == 0) // Se a contagem acabou de zerar
            {
                em_contagem = 0;
                fim_contagem_estado = 1;        // Dispara a sequência de finalização
                contador_ms_sequencia = 0;      // Zera o contador da sequência
            }
        }
    }
    
    // --- Sequenciador de Finalização (NÃO BLOQUEANTE) ---
    if (fim_contagem_estado > 0)
    {
        contador_ms_sequencia++;
        
        switch (fim_contagem_estado)
        {
            case 1: // Estado 1: Apaga o display (Blink 1)
                if(contador_ms_sequencia == 1) { apagarDisplay(); }
                if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 2; }
                break;
            
            case 2: // Estado 2: Mostra "00" (Blink 1)
                if(contador_ms_sequencia == 1) { atualizarDisplay(0); }
                if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 3; }
                break;

            case 3: // Estado 3: Apaga o display (Blink 2)
                if(contador_ms_sequencia == 1) { apagarDisplay(); }
                if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 4; }
                break;
                
            case 4: // Estado 4: Mostra "00" (Blink 2)
                if(contador_ms_sequencia == 1) { atualizarDisplay(0); }
                if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 5; }
                break;
                
            case 5: // Estado 5: Apaga o display (Blink 3)
                if(contador_ms_sequencia == 1) { apagarDisplay(); }
                if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 6; }
                break;
                
            case 6: // Estado 6: Mostra "00" (Blink 3) e liga o Buzzer
                if(contador_ms_sequencia == 1) { 
                    atualizarDisplay(0); 
                    GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
                }
                if(contador_ms_sequencia >= 1000) { // Deixa o som por 300ms
                    GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
                    apagarDisplay();
                    contador_ms_sequencia = 0;
                    fim_contagem_estado = 0; // Fim da sequência
                }
                break;
        }
    }
}

// ---------------------- Funções Auxiliares --------------------------
void InitGPIO(void)
{
    GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

    GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

    GPIO_Init(BOTAO_14_PORT, BOTAO_14_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BOTAO_24_PORT, BOTAO_24_PIN, GPIO_MODE_IN_PU_NO_IT);

    GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}
void InitCLOCK(void)
{
    CLK_DeInit(); // Reseta todas as configurações do clock para os valores padrão de fábrica.

    CLK_HSECmd(DISABLE); // Desabilita o oscilador externo de alta velocidade (HSE), se houver.
    CLK_LSICmd(DISABLE); // Desabilita o oscilador interno de baixa velocidade (LSI), usado para RTC/AWU.
    CLK_HSICmd(ENABLE);  // Habilita o oscilador interno de alta velocidade (HSI).

    // Loop de espera: aguarda até que o HSI esteja pronto e estável para uso.
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

    CLK_ClockSwitchCmd(ENABLE);          // Permite a troca da fonte de clock.
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // Define o prescaler do HSI para DIV1 (16MHz / 1 = 16MHz).
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // Define o prescaler da CPU para DIV1 (CPU roda na velocidade do clock do sistema).
    // Configura a troca automática para a fonte HSI quando estiver pronta.
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

    // Desabilita os clocks de periféricos não utilizados para economizar energia e reduzir ruído.
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE); // Habilita o clock para o Timer 4, pois ele será usado.
}

void TIM4_Config(void)
{
    // Frequência do Timer4 = 16MHz / 128 = 125.000 Hz
    // Período de overflow = 125 ticks
    // Frequência da Interrupção = 125.000 / 125 = 1000 Hz (a cada 1ms)
    TIM4_DeInit();
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124); // 124 para dar 125 ciclos
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    TIM4_Cmd(ENABLE);
}

void writeBCD(uint8_t valor)
{
    (valor & 0x01) ? GPIO_WriteHigh(LD_A_PORT, LD_A_PIN) : GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
    (valor & 0x02) ? GPIO_WriteHigh(LD_B_PORT, LD_B_PIN) : GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
    (valor & 0x04) ? GPIO_WriteHigh(LD_C_PORT, LD_C_PIN) : GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
    (valor & 0x08) ? GPIO_WriteHigh(LD_D_PORT, LD_D_PIN) : GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
}

void pulseLatch(GPIO_TypeDef* porta, uint8_t pino)
{
    GPIO_WriteHigh(porta, pino);
    // Atraso mínimo com NOPs para garantir que o pulso seja registrado pelo CI latch
    NOP(); NOP(); NOP(); NOP();
    GPIO_WriteLow(porta, pino);
}

void apagarDisplay(void)
{
    // Coloca 0000 nas linhas BCD e pulsa os dois latches
    GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
    GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
    GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
    GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
    pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
    pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
}

void atualizarDisplay(uint8_t valor)
{
    uint8_t unidades = valor % 10;
    uint8_t dezenas = valor / 10;

    // Envia o valor das unidades para o primeiro display
    writeBCD(unidades);
    pulseLatch(LATCH_01_PORT, LATCH_01_PIN);

    // Envia o valor das dezenas para o segundo display
    writeBCD(dezenas);
    pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
}