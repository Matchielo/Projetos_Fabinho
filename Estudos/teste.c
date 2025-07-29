/* MAIN.C - Contagem Não Bloqueante STM8S903K3 */

#include "stm8s.h"           // Biblioteca principal da SPL. Contém definições gerais para STM8.
#include "stm8s903k.h"       // Definições específicas do seu modelo de MCU (STM8S903K3).
#include "stm8s_tim4.h"      // Biblioteca da SPL para o Timer 4. Usado para gerar interrupções de tempo.
#include "stm8s_itc.h"       // Biblioteca da SPL para o Controlador de Interrupção (ITC). Usado para prioridades de interrupção.

// --- 1. Definições de Pinos e Constantes ---
// Macros para associar nomes legíveis a pinos específicos do microcontrolador.
// Isso facilita a leitura e a manutenção do código. Se você mudar a conexão física,
// só precisa alterar a definição aqui, não em todo o código.

// Pinos de Latch para os Displays BCD (ex: 74HC595 ou similar, se for um registrador de deslocamento)
// Ou, se for um decodificador BCD para 7 segmentos com latch (ex: 74HC4511), estes seriam os pinos LE (Latch Enable).
#define LATCH_01_PORT GPIOC   // Porta C, pino 2 para o latch do display de Unidades.
#define LATCH_01_PIN  GPIO_PIN_2

#define LATCH_02_PORT GPIOC   // Porta C, pino 1 para o latch do display de Dezenas.
#define LATCH_02_PIN  GPIO_PIN_1

// Pinos de Dados BCD (conectados às entradas A, B, C, D do decodificador BCD para 7 segmentos)
// Estes 4 pinos transmitem o valor binário codificado em decimal para o display.
#define LD_A_PORT GPIOB       // Porta B, pino 0 para o bit A (LSB).
#define LD_A_PIN  GPIO_PIN_0
#define LD_B_PORT GPIOB       // Porta B, pino 1 para o bit B.
#define LD_B_PIN  GPIO_PIN_1
#define LD_C_PORT GPIOB       // Porta B, pino 2 para o bit C.
#define LD_C_PIN  GPIO_PIN_2
#define LD_D_PORT GPIOB       // Porta B, pino 3 para o bit D (MSB).
#define LD_D_PIN  GPIO_PIN_3

// Pinos para os Botões (Entradas com Pull-up)
// O microcontrolador lê o estado desses pinos. Configurados com pull-up,
// o pino é HIGH quando solto e LOW quando o botão é pressionado (conectado ao GND).
#define BOTAO_14_PORT GPIOD   // Porta D, pino 2 para o botão de 14 segundos.
#define BOTAO_14_PIN  GPIO_PIN_2
#define BOTAO_24_PORT GPIOD   // Porta D, pino 3 para o botão de 24 segundos.
#define BOTAO_24_PIN  GPIO_PIN_3

// Pino para o Buzzer (Saída)
#define BUZZER_PORT GPIOD     // Porta D, pino 0 para o buzzer ou um LED de feedback.
#define BUZZER_PIN  GPIO_PIN_0

// Macro para instrução 'No Operation' (usada para pequenos atrasos de ciclo de clock ou debouncing).
// 'NOP' significa que a CPU não faz nada por um ciclo de clock.
#define NOP() _asm("nop")

// --- 2. Variáveis Globais (Voláteis) ---
// Variáveis declaradas fora de qualquer função. Elas são acessíveis por todas as funções.
// 'volatile' é crucial: informa ao compilador que o valor dessas variáveis pode mudar
// a qualquer momento por algo externo (neste caso, a Rotina de Serviço de Interrupção - ISR).
// Isso impede que o compilador faça otimizações que poderiam usar valores "antigos" da variável.

volatile uint8_t tempo_restante = 0; // Armazena o valor atual da contagem regressiva (0-255).
volatile uint8_t em_contagem = 0;    // Flag (sinalizador): 1 se a contagem está ativa, 0 se não.
volatile uint16_t contador_ms = 0;   // Contador de milissegundos. Incrementado na ISR a cada 1ms.
                                     // Quando chega a 1000, 1 segundo se passou.

// Variáveis para a sequência de finalização (piscar displays e buzzer)
volatile uint8_t fim_contagem_estado = 0;     // Variável de estado para a máquina de estados da finalização.
                                              // 0 = inativo, >0 = estado atual da sequência (1 a 6).
volatile uint16_t contador_ms_sequencia = 0;  // Contador de milissegundos para controlar o tempo de cada estado da sequência.

// --- 3. Protótipos das Funções ---
// Declaração de todas as funções que serão definidas posteriormente no arquivo.
// Isso permite que você chame uma função antes de sua definição completa.

void InitGPIO(void);               // Configura os pinos de E/S.
void InitCLOCK(void);              // Configura o clock do sistema.
void TIM4_Config(void);            // Configura o Timer 4 para gerar interrupções.
void writeBCD(uint8_t valor);      // Converte e envia um dígito para os pinos BCD.
void pulseLatch(GPIO_TypeDef* porta, uint8_t pino); // Gera um pulso no pino de latch do display.
void apagarDisplay(void);          // Apaga todos os segmentos dos displays.
void atualizarDisplay(uint8_t valor); // Atualiza ambos os displays com um valor de 0 a 99.

// --- 4. Função Principal (main) ---
// É o ponto de entrada do programa. O microcontrolador começa a executar daqui após o reset.

void main(void)
{
    // --- 4.1. Inicialização de Hardware ---
    InitCLOCK();       // Configura o oscilador interno (HSI) para 16MHz e distribui clocks.
    InitGPIO();        // Configura os pinos para displays, botões e buzzer.
        
    // Configura a prioridade da interrupção do Timer 4 (opcional, mas boa prática).
    // Nível 1 é uma prioridade média. Isso é importante em sistemas com múltiplas interrupções.
    ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
    
    TIM4_Config();     // Configura o Timer 4 para gerar uma interrupção a cada 1 milissegundo.
    enableInterrupts(); // **HABILITA AS INTERRUPÇÕES GLOBAIS DA CPU.**
                        // Sem isso, mesmo que o Timer 4 gere interrupções, a CPU as ignora.
    
    apagarDisplay();   // Garante que os displays comecem desligados ao ligar o aparelho.

    // --- 4.2. Loop Infinito Principal ---
    // O microcontrolador passa 99% do tempo executando o código dentro deste loop.
    // Ele é "não bloqueante" porque não usa funções de 'delay()' que parariam a CPU.
    // Ele apenas verifica rapidamente as condições e, se necessário, ajusta flags.
    while (1)
    {
        // --- 4.2.1. Lógica do Botão 14 Segundos ---
        // Verifica se o botão 14 foi pressionado.
        // 'GPIO_ReadInputPin' lê o estado do pino. 'RESET' (ou 0) indica que o botão está pressionado (pino conectado ao GND).
        if (GPIO_ReadInputPin(BOTAO_14_PORT, BOTAO_14_PIN) == RESET)
        {
            // --- Reinicia a Contagem (interrompendo qualquer coisa em andamento) ---
            tempo_restante = 14;     // Define o tempo inicial da contagem.
            em_contagem = 1;         // Ativa a flag de contagem, indicando que a contagem deve começar.
            contador_ms = 0;         // Zera o contador de milissegundos para um novo segundo inicial.
            fim_contagem_estado = 0; // **CRUCIAL:** Cancela qualquer sequência de finalização que esteja rolando.
                                     // Isso permite que a nova contagem comece imediatamente.
            atualizarDisplay(tempo_restante); // Atualiza o display imediatamente para mostrar o novo valor.

            // --- Debouncing de Software Simples ---
            // Espera até que o botão seja solto. Isso evita que um único pressionamento
            // seja interpretado como múltiplos pressionamentos rápidos pelo MCU.
            while(GPIO_ReadInputPin(BOTAO_14_PORT, BOTAO_14_PIN) == RESET) { NOP(); }
        }

        // --- 4.2.2. Lógica do Botão 24 Segundos ---
        // Exatamente igual à lógica do botão de 14s, mas para 24 segundos.
        if (GPIO_ReadInputPin(BOTAO_24_PORT, BOTAO_24_PIN) == RESET)
        {
            tempo_restante = 24;
            em_contagem = 1;
            contador_ms = 0;
            fim_contagem_estado = 0; // Cancela sequência de finalização.
            atualizarDisplay(tempo_restante);

            while(GPIO_ReadInputPin(BOTAO_24_PORT, BOTAO_24_PIN) == RESET) { NOP(); }
        }
    }
}

// --- 5. Rotina de Serviço de Interrupção (ISR) do Timer 4 ---
// Esta função é executada **automaticamente** pelo microcontrolador a cada 1 milissegundo.
// 'INTERRUPT_HANDLER' é uma macro específica do compilador Cosmic para definir ISRs.
// 'TIM4_UPD_OVF_IRQHandler' é o nome da função.
// '23' é o número do vetor de interrupção para o Timer 4 (consulte o datasheet ou stm8_interrupt_vector.c).

INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
    // --- 5.1. Limpeza da Flag de Interrupção ---
    // **ESSENCIAL!** Se esta linha não for executada, o microcontrolador pensará que a
    // interrupção ainda está pendente e chamará esta ISR repetidamente, travando o sistema.
    TIM4_ClearITPendingBit(TIM4_IT_UPDATE);

    // --- 5.2. Lógica Principal da Contagem Regressiva ---
    // Esta parte é executada apenas se a flag 'em_contagem' estiver ativa.
    if (em_contagem)
    {
        contador_ms++; // Incrementa o contador de milissegundos a cada interrupção (a cada 1ms).

        if (contador_ms >= 1000) // Se 1000ms (1 segundo) se passaram:
        {
            contador_ms = 0; // Reseta o contador de milissegundos.

            if (tempo_restante > 0) // Se ainda há tempo na contagem:
            {
                tempo_restante--; // Decrementa o tempo restante.
                atualizarDisplay(tempo_restante); // Atualiza o display com o novo valor.
            }
            
            if (tempo_restante == 0) // Se a contagem acabou de chegar a zero:
            {
                em_contagem = 0;         // Desativa a flag de contagem.
                fim_contagem_estado = 1; // Ativa a máquina de estados da finalização (começa no estado 1).
                contador_ms_sequencia = 0; // Zera o contador de tempo para a sequência.
            }
        }
    }
    
    // --- 5.3. Sequenciador de Finalização (Máquina de Estados Não Bloqueante) ---
    // Esta seção é executada apenas se a contagem terminou ('fim_contagem_estado > 0').
    // Ela gerencia a sequência de piscar o display e o buzzer sem bloquear a CPU.
    if (fim_contagem_estado > 0)
    {
        contador_ms_sequencia++; // Incrementa o contador de tempo para a sequência.
        
        switch (fim_contagem_estado) // Verifica o estado atual da sequência.
        {
            case 1: // Estado 1: Apaga o display (Início do primeiro pisca).
                if(contador_ms_sequencia == 1) { apagarDisplay(); } // Apenas na primeira vez neste estado.
                if(contador_ms_sequencia >= 200) { // Espera 200ms.
                    contador_ms_sequencia = 0;     // Reseta o contador.
                    fim_contagem_estado = 2;       // Vai para o próximo estado.
                }
                break; // Sai do switch.
            
            case 2: // Estado 2: Mostra "00" (Acende o display após o primeiro pisca).
                if(contador_ms_sequencia == 1) { atualizarDisplay(0); }
                if(contador_ms_sequencia >= 200) { // Espera 200ms.
                    contador_ms_sequencia = 0;
                    fim_contagem_estado = 3;
                }
                break;

            case 3: // Estado 3: Apaga o display (Início do segundo pisca).
                if(contador_ms_sequencia == 1) { apagarDisplay(); }
                if(contador_ms_sequencia >= 200) {
                    contador_ms_sequencia = 0;
                    fim_contagem_estado = 4;
                }
                break;
                
            case 4: // Estado 4: Mostra "00" (Acende o display após o segundo pisca).
                if(contador_ms_sequencia == 1) { atualizarDisplay(0); }
                if(contador_ms_sequencia >= 200) {
                    contador_ms_sequencia = 0;
                    fim_contagem_estado = 5;
                }
                break;
                
            case 5: // Estado 5: Apaga o display (Início do terceiro pisca).
                if(contador_ms_sequencia == 1) { apagarDisplay(); }
                if(contador_ms_sequencia >= 200) {
                    contador_ms_sequencia = 0;
                    fim_contagem_estado = 6;
                }
                break;
                
            case 6: // Estado 6: Mostra "00" (Acende o display após o terceiro pisca) e liga o Buzzer.
                if(contador_ms_sequencia == 1) { 
                    atualizarDisplay(0); 
                    GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN); // Liga o buzzer.
                }
                if(contador_ms_sequencia >= 300) { // Mantém o buzzer e display acesos por 300ms.
                    GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN); // Desliga o buzzer.
                    apagarDisplay();                         // Apaga o display.
                    contador_ms_sequencia = 0;               // Reseta o contador.
                    fim_contagem_estado = 0;                 // **Fim da sequência!** Volta ao estado inativo.
                }
                break;
        }
    }
}

// --- 6. Funções Auxiliares de Hardware e Display ---

// 6.1. Função: InitGPIO
// Configura os pinos como entrada ou saída e seu modo de operação.
void InitGPIO(void)
{
    // Pinos de Dados BCD (LD_A a LD_D): Saídas Push-Pull, velocidade rápida, inicialmente LOW.
    GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

    // Pinos de Latch (LATCH_01, LATCH_02): Saídas Push-Pull, velocidade rápida, inicialmente LOW.
    GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

    // Pinos dos Botões (BOTAO_14, BOTAO_24): Entradas com Pull-up interno, SEM interrupção.
    // O pull-up garante que o pino esteja HIGH quando o botão não está pressionado.
    // "NO_IT" significa que não geram interrupções (a leitura é por polling no main loop).
    GPIO_Init(BOTAO_14_PORT, BOTAO_14_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BOTAO_24_PORT, BOTAO_24_PIN, GPIO_MODE_IN_PU_NO_IT);

    // Pino do Buzzer: Saída Push-Pull, velocidade rápida, inicialmente LOW (desligado).
    GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}

// 6.2. Função: InitCLOCK
// Configura o relógio principal do microcontrolador.
void InitCLOCK(void)
{
    CLK_DeInit(); // Reseta todas as configurações de clock.
    CLK_HSECmd(DISABLE); // Desabilita oscilador externo (HSE).
    CLK_LSICmd(DISABLE); // Desabilita oscilador interno de baixa frequência (LSI).
    CLK_HSICmd(ENABLE);  // Habilita o oscilador interno de alta frequência (HSI).

    // Espera até que o HSI esteja pronto e estável.
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

    CLK_ClockSwitchCmd(ENABLE);          // Permite a troca da fonte de clock.
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // HSI a 16MHz (16MHz / 1 = 16MHz).
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // CPU roda na velocidade do clock do sistema (16MHz).
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

    // Habilita clocks para periféricos usados e desabilita para os não usados.
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE); // Habilita o clock para o Timer 4.
}

// 6.3. Função: TIM4_Config
// Configura o Timer 4 para gerar uma interrupção a cada 1 milissegundo.
// Clock do Timer 4: 16 MHz (HSI) / 128 (Prescaler) = 125.000 Hz.
// Período de Autoreload: 124 (ou seja, 125 ciclos de 0 a 124).
// Frequência de Interrupção = 125.000 Hz / 125 = 1.000 Hz (1ms por interrupção).
void TIM4_Config(void)
{
    TIM4_DeInit(); // Reseta o Timer 4.
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124); // Define prescaler e autoreload.
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE); // **HABILITA A INTERRUPÇÃO DE UPDATE DO TIMER 4.**
                                          // Isso faz a ISR ser chamada a cada 1ms.
    TIM4_Cmd(ENABLE); // Habilita o Timer 4 para começar a contar.
}

// 6.4. Função: writeBCD
// Converte um valor de 0-9 para o formato BCD de 4 bits e o envia para os pinos do display.
void writeBCD(uint8_t valor)
{
    // Usa operações bit a bit ('&') para verificar cada bit do 'valor' (de 0 a 9)
    // e setar os pinos LD_A a LD_D (que correspondem a 1, 2, 4, 8) para HIGH ou LOW.
    (valor & 0x01) ? GPIO_WriteHigh(LD_A_PORT, LD_A_PIN) : GPIO_WriteLow(LD_A_PORT, LD_A_PIN); // Bit 0 (1)
    (valor & 0x02) ? GPIO_WriteHigh(LD_B_PORT, LD_B_PIN) : GPIO_WriteLow(LD_B_PORT, LD_B_PIN); // Bit 1 (2)
    (valor & 0x04) ? GPIO_WriteHigh(LD_C_PORT, LD_C_PIN) : GPIO_WriteLow(LD_C_PORT, LD_C_PIN); // Bit 2 (4)
    (valor & 0x08) ? GPIO_WriteHigh(LD_D_PORT, LD_D_PIN) : GPIO_WriteLow(LD_D_PORT, LD_D_PIN); // Bit 3 (8)
}

// 6.5. Função: pulseLatch
// Gera um pulso curto (HIGH -> LOW) em um pino de latch específico.
// Este pulso é necessário para que o CI de latch ou decodificador BCD "capture"
// os dados presentes nos pinos LD_A-LD_D e os exiba no display.
void pulseLatch(GPIO_TypeDef* porta, uint8_t pino)
{
    GPIO_WriteHigh(porta, pino); // Define o pino de latch para HIGH.
    NOP(); NOP(); NOP(); NOP(); // Pequeno atraso para garantir que o pulso seja longo o suficiente.
    GPIO_WriteLow(porta, pino);  // Define o pino de latch para LOW, completando o pulso.
}

// 6.6. Função: apagarDisplay
// Envia o valor BCD 0000 (todos os bits LOW) para os displays e pulsa ambos os latches.
// Isso garante que todos os segmentos dos displays estejam apagados.
void apagarDisplay(void)
{
    GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
    GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
    GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
    GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
    pulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Aplica o 0000 no display das unidades.
    pulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Aplica o 0000 no display das dezenas.
}

// 6.7. Função: atualizarDisplay
// Divide um número de 0 a 99 em dezenas e unidades e os exibe nos displays.
void atualizarDisplay(uint8_t valor)
{
    uint8_t unidades = valor % 10; // Calcula o dígito das unidades (ex: 14 % 10 = 4).
    uint8_t dezenas = valor / 10;  // Calcula o dígito das dezenas (ex: 14 / 10 = 1).

    writeBCD(unidades);          // Envia o dígito das unidades para os pinos BCD.
    pulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades.

    writeBCD(dezenas);           // Envia o dígito das dezenas para os pinos BCD.
    pulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das dezenas.
}