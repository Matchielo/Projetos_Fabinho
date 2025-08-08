/* MAIN.C file - STM8S903K3
 * Desenvolvimento de contagem não bloquente
 *
 * Este programa configura um microcontrolador STM8S903K3 para controlar
 * dois displays BCD de 7 segmentos. Ele permite iniciar contagens regressivas
 * de 14 ou 24 segundos através de botões, com feedback de áudio (buzzer)
 * e visual (piscar os displays) ao final de cada contagem.
 * A comunicação com os displays BCD é feita através de pinos de dados e latches.
 *
 * Versão atual: Contagem Não Bloquente com lógica de pausa baseada em flag única.
 *
 * Copyright (c) 2002-2005 STMicroelectronics
 */


// ---------- Bibliotecas ---------- //

#include "stm8s.h"           // Biblioteca principal da SPL. Contém definições gerais para STM8.
#include "stm8s903k.h"       // Definições específicas do seu modelo de MCU (STM8S903K3).
#include "stm8s_tim1.h" // Biblioteca da SPL para o Timer 1
#include "stm8s_tim4.h"      // Biblioteca da SPL para o Timer 4. Usado para gerar interrupções de tempo.
#include "stm8s_itc.h"       // Biblioteca da SPL para o Controlador de Interrupção (ITC). Usado para prioridades de interrupção.
#include "stm8s_flash.h" // Necessário para funções de EEPROM/Flash
#include "protocol_ht6p20b.h"

//
#define EEPROM_CONTROLE_ID  0x4000

// ---------- Definição da Pinagem --------- //
// Pinos LE (Latch Enable) para os decodificadores.
#define LATCH_01_PORT		GPIOC		// Porta C, Pino 02
#define LATCH_01_PIN		GPIO_PIN_2

#define LATCH_02_PORT		GPIOC
#define LATCH_02_PIN		GPIO_PIN_1

// Pinos de Dados BCD (conectados às entradas A, B, C, D do decodificador BCD para 7 segmentos)
// Estes 4 pinos transmitem o valor binário codificado em decimal para o display.
#define BCD_A_PORT	GPIOB		// Porta B, Pino 0 -- BIT A
#define BCD_A_PIN		GPIO_PIN_0

#define BCD_B_PORT	GPIOB		// BIT B
#define BCD_B_PIN		GPIO_PIN_1

#define BCD_C_PORT	GPIOB		// BIT C
#define BCD_C_PIN		GPIO_PIN_2

#define BCD_D_PORT	GPIOB		// BIT D
#define BCD_D_PIN		GPIO_PIN_3

// Pinos para os Botões (Entradas com Pull-up)
#define BOTAO_14S_PORT	GPIOD					// Porta D, pino 2 para o botão de 14 segundos.
#define BOTAO_14S_PIN		GPIO_PIN_2

#define BOTAO_24S_PORT	GPIOD					// Porta D, pino 3 para o botão de 14 segundos.
#define BOTAO_24S_PIN		GPIO_PIN_3

#define BOTAO_PAUSE_PORT	GPIOD
#define BOTAO_PAUSE_PIN		GPIO_PIN_4

// Pino para o Buzzer
#define BUZZER_PORT		GPIOD
#define BUZZER_PIN		GPIO_PIN_0

// Receptor RF (conectado ao PA1)
#define RADIO_DATA_PORT     GPIOA
#define RADIO_DATA_PIN      GPIO_PIN_1

// Botão de Cadastro (PB9)
#define BOTAO_CADASTRO_PORT GPIOB
#define BOTAO_CADASTRO_PIN  GPIO_PIN_7  // PB9 físico

// Macro para instrução 'No Operation' (usada para pequenos atrasos de ciclo de clock ou debouncing).
// 'NOP' significa que a CPU não faz nada por um ciclo de clock.
#define NOP() _asm("nop")

// --- Código RF recebido ---
#define MASCARA_ID_CONTROLE 0xFFFFFF00

// ---------- Variáveis Globais ---------
// 'volatile' informa ao compilador que o valor pode mudar a qualquer momento
// por uma rotina externa (a interrupção), evitando otimizações indevidas.

volatile uint8_t tempo_restante = 0;	    // Armazena o valor atual da contagem regressiva
volatile uint16_t contador_ms = 0;	    // Contador de milissegundos, incrementado na ISR

// --- NOVAS FLAGS DE CONTROLE (baseadas na lógica Assembly) ---
volatile uint8_t flag_run = 0;              // 0 = Pausado, 1 = Rodando. Controla toda a lógica de tempo.
volatile uint8_t flag_start = 0;            // 0 = Nunca iniciado, 1 = Já iniciado. Permite que o pause só funcione após o primeiro start.

// Variáveis para a sequência de finalização (piscar displays e buzzer)
volatile uint8_t fim_contagem_estado = 0;	    // Estado atual da animação de fim de contagem
volatile uint16_t contador_ms_sequencia = 0;    // Contador de tempo para controlar os estados da animação

// Váriáveis para o rádio
volatile uint8_t rf_estado = 0;         // Estado do decodificador RF
volatile uint8_t rf_bitcount = 0;       // Contador de bits recebidos via RF
volatile uint32_t rf_data = 0;          // Dados recebidos via RF
volatile uint8_t rf_flag_ok = 0;        // Flag que indica que um pacote RF foi recebido corretamente

volatile uint16_t rf_duracao_nivel = 0; // Duração do nível atual do sinal RF (para decodificação)
volatile uint8_t rf_nivel_antigo = 1;   // Último nível lido do pino RF

volatile uint8_t modo_cadastro = 0;     // Flag que indica se está no modo de cadastro do controle remoto

volatile uint16_t tempo_cadastro_ms = 0;  // Timeout para sair do modo cadastro

volatile uint32_t rf_codigo_cadastro = 0; // Armazena o último código lido para cadastro
volatile uint8_t rf_cadastro_cont = 0;    // Contador de confirmações do mesmo código para cadastro

volatile uint16_t rf_tempo_bit = 0;      // Tempo do bit RF (não utilizado no código principal)
volatile uint16_t rf_contador_tempo = 0; // Contador auxiliar para RF (não utilizado no código principal)

// ---------- Definição dos Protótipos -----------
// Funções de inicialização de hardware
void InitGPIO(void);               // Configura os pinos de E/S.
void InitCLOCK(void);              // Configura o clock do sistema.

// Funções de configuração dos timers
void TIM1_Config(void);            // Configura o Timer 1 para RF
void TIM4_Config(void);            // Configura o Timer 4 para gerar interrupções de tempo

// Funções de controle dos displays
void WriteBCD(uint8_t valor);      // Envia um dígito BCD para os pinos
void PulseLatch(GPIO_TypeDef* porta, uint8_t pino); // Pulso de latch para atualizar display
void ApagarDisplay(void);          // Apaga todos os segmentos dos displays
void AtualizarDisplay(uint8_t valor); // Atualiza ambos os displays com um valor de 0 a 99

// Funções de EEPROM
void salvar_codigo_eeprom(uint32_t codigo); // Salva código do controle remoto
uint32_t ler_codigo_eeprom(void);           // Lê código do controle remoto salvo

main()
{
    // Inicializa o clock do sistema
    InitCLOCK();		
    // Inicializa os pinos de entrada/saída
    InitGPIO();			

    // Configura prioridades das interrupções dos timers
    ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
    ITC_SetSoftwarePriority(ITC_IRQ_TIM1_OVF, ITC_PRIORITYLEVEL_2);

    // Inicializa Timer 1 (RF) e Timer 4 (tempo base)
    TIM1_Config(); 		 		 
    TIM4_Config();				
    onInt_TM6(); // Configura Timer 6 para interrupção de RF

    // Habilita interrupções globais
    enableInterrupts();		

    // Apaga displays ao ligar o aparelho
    ApagarDisplay();		

    // --- Loop Infinito Principal ---
    while (1)
    {
        // Botão de 14 segundos: inicia contagem regressiva de 14s
        if(GPIO_ReadInputPin(BOTAO_14S_PORT, BOTAO_14S_PIN) == RESET)
        {
            tempo_restante = 14;						
            contador_ms = 0;								
            fim_contagem_estado = 0;        
            flag_start = 1;                 
            flag_run = 1;                   
            
            AtualizarDisplay(tempo_restante);
            
            // Debounce: espera botão ser solto
            while(GPIO_ReadInputPin(BOTAO_14S_PORT, BOTAO_14S_PIN) == RESET);
        }
        
        // Botão de 24 segundos: inicia contagem regressiva de 24s
        if(GPIO_ReadInputPin(BOTAO_24S_PORT, BOTAO_24S_PIN) == RESET)
        { 
            tempo_restante = 24;
            contador_ms = 0;
            fim_contagem_estado = 0;        
            flag_start = 1;                 
            flag_run = 1;                   
            
            AtualizarDisplay(tempo_restante);

            while(GPIO_ReadInputPin(BOTAO_24S_PORT, BOTAO_24S_PIN) == RESET);
        }
        
        // Botão de pausa/continua: alterna entre pausar e continuar a contagem
        if(GPIO_ReadInputPin(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN) == RESET)
        {
            if (flag_start == 1)
            {
                flag_run = !flag_run;

                // Se pausou durante animação final, desliga buzzer
                if (flag_run == 0 && fim_contagem_estado > 0)
                {
                    GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
                }
            }
            
            while(GPIO_ReadInputPin(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN) == RESET);
        }
        
        // Botão de cadastro: entra no modo cadastro do controle remoto
        if(GPIO_ReadInputPin(BOTAO_CADASTRO_PORT, BOTAO_CADASTRO_PIN) == RESET && modo_cadastro == 0)
        {
                volatile long i;
                modo_cadastro = 1;
                tempo_cadastro_ms = 5000; // 5 segundos para receber o sinal RF
        
                GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
                for(i = 0; i < 30000; i++);
                GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
        
                while(GPIO_ReadInputPin(BOTAO_CADASTRO_PORT, BOTAO_CADASTRO_PIN) == RESET); // Debounce
        }

        // Processa pacote RF recebido pelo protocolo HT6P20B
        if (HT_RC_Code_Ready_Overwrite)
        {
            HT_RC_Code_Ready_Overwrite = FALSE;
            uint32_t codigo = HT_RC_Buffer_Overwrite; // ou use RF_CopyBuffer se for array

            // Aqui segue sua lógica de cadastro e comando, igual ao que já faz
            // Exemplo:
            if (modo_cadastro == 1)
            {
                // Cadastro robusto: exige dois sinais iguais para gravar
                if (rf_codigo_cadastro == (codigo & MASCARA_ID_CONTROLE)) {
                    rf_cadastro_cont++;
                } else {
                    rf_codigo_cadastro = (codigo & MASCARA_ID_CONTROLE);
                    rf_cadastro_cont = 1;
                }

                if (rf_cadastro_cont >= 2) {
                    volatile long j;
                    uint8_t i;

                    salvar_codigo_eeprom(codigo);
                    modo_cadastro = 0;
                    rf_cadastro_cont = 0;
                    rf_codigo_cadastro = 0;

                    // Confirmação visual/auditiva
                    for (i = 0; i < 2; i++) {
                        ApagarDisplay();
                        GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
                        for (j = 0; j < 20000; j++);
                        GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
                        AtualizarDisplay(0);
                        for (j = 0; j < 20000; j++);
                    }
                    GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
                    ApagarDisplay();
                }
            }
            else
            {
                // Verifica se o código recebido é igual ao salvo na EEPROM
                uint32_t id_salvo = ler_codigo_eeprom();
                if ((codigo & MASCARA_ID_CONTROLE) == id_salvo)
                {
                    uint8_t comando = codigo & 0x00000F00;
                    switch (comando)
                    {
                        case 0x0100: // Botão 1 = 14s
                            tempo_restante = 14;
                            contador_ms = 0;
                            fim_contagem_estado = 0;
                            flag_start = 1;
                            flag_run = 1;
                            AtualizarDisplay(tempo_restante);
                            break;
                        case 0x0200: // Botão 2 = 24s
                            tempo_restante = 24;
                            contador_ms = 0;
                            fim_contagem_estado = 0;
                            flag_start = 1;
                            flag_run = 1;
                            AtualizarDisplay(tempo_restante);
                            break;
                        case 0x0400: // Botão 3 = Pausa
                            if(flag_start == 1)
                            {
                                flag_run = !flag_run;
                                if(flag_run == 0 && fim_contagem_estado > 0)
                                {
                                    GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
                                }
                            }
                            break;
                    }
                }
            }
        }
    }
}

// ---------- Rotina de Interrupção (ISR) do Timer 1 -----------
// Interrupção do Timer 1: decodifica sinal RF recebido no pino PA1
@far @interrupt void TIM1_UPD_OVF_IRQHandler(void)
{
    uint8_t nivel_atual;

    TIM1_ClearITPendingBit(TIM1_IT_UPDATE);

    // Lê o nível do pino RF
    nivel_atual = GPIO_ReadInputPin(RADIO_DATA_PORT, RADIO_DATA_PIN);

    // Se o nível não mudou, só incrementa a duração
    if (nivel_atual == rf_nivel_antigo)
    {
        rf_duracao_nivel++;

        // Proteção: se ficar muito tempo sem borda, reseta decodificação
        if (rf_duracao_nivel > 2000) { // 2000 * 40us = 80ms safety
            rf_duracao_nivel = 0;
            rf_bitcount = 0;
            rf_data = 0;
            rf_estado = 0;
        }
    }
    else
    {
        // Borda detectada: decodifica bit conforme duração do nível anterior
        if (nivel_atual == 0)
        {
            // Decodificação dos bits conforme duração do pulso
            if (rf_duracao_nivel > 40 && rf_duracao_nivel < 80)
            {
                rf_data <<= 1; // Bit 0
                rf_bitcount++;
            }
            else if (rf_duracao_nivel >= 80 && rf_duracao_nivel < 120)
            {
                rf_data <<= 1;
                rf_data |= 1; // Bit 1
                rf_bitcount++;
            }
            else if (rf_duracao_nivel >= 180 && rf_duracao_nivel < 350)
            {
                // Pulso piloto/sincronismo: reseta decodificação
                rf_bitcount = 0;
                rf_data = 0;
            }
            else
            {
                // Duração inválida: reseta decodificação
                rf_bitcount = 0;
                rf_data = 0;
            }
        }

        // Prepara para próxima contagem
        rf_duracao_nivel = 0;
        rf_nivel_antigo = nivel_atual;
    }
  
    // Se leu 28 bits, sinaliza recepção completa
    if (rf_bitcount == 28)
    {
        rf_flag_ok = 1;
        rf_bitcount = 0;   // Prepara para próxima recepção
    }
}

// ---------- Rotina de Interrupção (ISR) do Timer 4 -----------
// Interrupção do Timer 4: chamada a cada 1ms, controla contagem e animação final
INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
{
    // Limpa a flag da interrupção
    TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
    
    // Timeout para modo cadastro do controle remoto
    if (modo_cadastro == 1 && tempo_cadastro_ms > 0)
    {
        tempo_cadastro_ms--;
        if (tempo_cadastro_ms == 0)
        {
            volatile long i;
            modo_cadastro = 0;
            rf_cadastro_cont = 0;
            rf_codigo_cadastro = 0;

            // Sinal de falha: buzzer longo
            GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
            for (i = 0; i < 60000; i++);
            GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
        }
    }

    // Se está pausado, não executa contagem nem animação
    if (flag_run == 0)
    {
        return;
    }
    
    // Lógica de contagem principal (antes da animação final)
    if (fim_contagem_estado == 0)
    {
        contador_ms++;
        if (contador_ms >= 1000) // 1 segundo se passou
        {
            contador_ms = 0;
            if (tempo_restante > 0)
            {
                tempo_restante--;
                AtualizarDisplay(tempo_restante);
            }
            
            if (tempo_restante == 0) // Inicia animação final
            {
                fim_contagem_estado = 1;
                contador_ms_sequencia = 0;
            }
        }
    }
    
    // Sequenciador de animação final (pisca displays e buzzer)
    if(fim_contagem_estado > 0)
    {
        contador_ms_sequencia++;
        
        switch(fim_contagem_estado)
        {
            case 1: // Estado 1: Apaga o display
                if(contador_ms_sequencia == 1){ ApagarDisplay(); }
                if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 2; }
                break;
            
            case 2:	// Estado 2: Mostra "00"
                if(contador_ms_sequencia == 1){ AtualizarDisplay(0); }	
                if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 3; }
                break;
            
            case 3:	// Estado 3: Apaga o display
                if(contador_ms_sequencia == 1){ ApagarDisplay(); }
                if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 4; }
                break;
            
            case 4:	// Estado 4: Mostra "00"
                if(contador_ms_sequencia == 1){ AtualizarDisplay(0); }	
                if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 5; }
                break;
            
            case 5:	// Estado 5: Apaga o display
                if(contador_ms_sequencia == 1){ ApagarDisplay(); }
                if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 6; }
                break;
            
            case 6:	// Estado 6: Mostra "00", liga o Buzzer e finaliza tudo.
                if(contador_ms_sequencia == 1){
                    AtualizarDisplay(0);
                    GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
                }	
                if(contador_ms_sequencia >= 1000){ // Mantém por 1 segundo
                    GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
                    ApagarDisplay();
                    
                    // Reseta todas as flags para o estado inicial
                    fim_contagem_estado = 0;
                    flag_run = 0;
                    flag_start = 0;
                }
                break;
        }
    }
}

// --- Funções Auxiliares de Hardware e Display ---

void InitGPIO(void)
{
    // Inicializa todos os pinos usados como saída ou entrada com pull-up
    GPIO_Init(BCD_A_PORT, BCD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(BCD_B_PORT, BCD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(BCD_C_PORT, BCD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(BCD_D_PORT, BCD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
        
    GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
        
    GPIO_Init(BOTAO_14S_PORT, BOTAO_14S_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BOTAO_24S_PORT, BOTAO_24S_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN, GPIO_MODE_IN_PU_NO_IT);
        
    GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
        
    GPIO_Init(RADIO_DATA_PORT, RADIO_DATA_PIN, GPIO_MODE_IN_PU_NO_IT);
    GPIO_Init(BOTAO_CADASTRO_PORT, BOTAO_CADASTRO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

void InitCLOCK(void)
{
    // Configura o clock do sistema para 16MHz e habilita apenas os periféricos necessários
    CLK_DeInit();
    CLK_HSECmd(DISABLE);
    CLK_LSICmd(DISABLE);
    CLK_HSICmd(ENABLE);
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
    CLK_ClockSwitchCmd(ENABLE);
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
}

void TIM1_Config(void)
{
    // Configura Timer 1 para gerar interrupção a cada ~40us (usado para RF)
    TIM1_DeInit();
    TIM1_TimeBaseInit(15, TIM1_COUNTERMODE_UP, 39, 0); // 40 µs
    TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
    TIM1_Cmd(ENABLE);
}

void TIM4_Config(void)
{
    // Configura Timer 4 para gerar interrupção a cada 1ms (usado para contagem e animação)
    TIM4_DeInit();
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124);
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
    TIM4_Cmd(ENABLE);
}

// Envia o valor BCD para os pinos do decodificador (A, B, C, D)
void WriteBCD(uint8_t valor)
{
    // Escreve cada bit do valor nos pinos correspondentes
    (valor & 0x01) ? GPIO_WriteHigh(BCD_A_PORT, BCD_A_PIN) : GPIO_WriteLow(BCD_A_PORT, BCD_A_PIN); // Bit A
    (valor & 0x02) ? GPIO_WriteHigh(BCD_B_PORT, BCD_B_PIN) : GPIO_WriteLow(BCD_B_PORT, BCD_B_PIN); // Bit B
    (valor & 0x04) ? GPIO_WriteHigh(BCD_C_PORT, BCD_C_PIN) : GPIO_WriteLow(BCD_C_PORT, BCD_C_PIN); // Bit C
    (valor & 0x08) ? GPIO_WriteHigh(BCD_D_PORT, BCD_D_PIN) : GPIO_WriteLow(BCD_D_PORT, BCD_D_PIN); // Bit D
}

// Gera um pulso de latch para atualizar o display
void PulseLatch(GPIO_TypeDef* porta, uint8_t pino)
{
    // Sobe o pino, espera alguns ciclos e desce o pino para gerar pulso de latch
    GPIO_WriteHigh(porta, pino); 
    NOP(); NOP(); NOP(); NOP();  
    GPIO_WriteLow(porta, pino);  
}

// Apaga todos os segmentos dos displays (zera os pinos BCD e atualiza ambos os latches)
void ApagarDisplay(void)
{
    GPIO_WriteLow(BCD_A_PORT, BCD_A_PIN);
    GPIO_WriteLow(BCD_B_PORT, BCD_B_PIN);
    GPIO_WriteLow(BCD_C_PORT, BCD_C_PIN);
    GPIO_WriteLow(BCD_D_PORT, BCD_D_PIN);
    PulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Atualiza display 1
    PulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Atualiza display 2
}

// Atualiza os dois displays com um valor de 0 a 99
void AtualizarDisplay(uint8_t valor)
{
    uint8_t unidades = valor % 10; // Extrai o dígito das unidades
    uint8_t dezenas = valor / 10;  // Extrai o dígito das dezenas

    WriteBCD(unidades);                    // Envia unidades para os pinos BCD
    PulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Atualiza display das unidades

    WriteBCD(dezenas);                     // Envia dezenas para os pinos BCD
    PulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Atualiza display das dezenas
}

// Salva o código do controle remoto na EEPROM (apenas os 24 bits de ID)
void salvar_codigo_eeprom(uint32_t codigo)
{
    uint32_t id = codigo & MASCARA_ID_CONTROLE; // Mascara para pegar só o ID
    FLASH_Unlock(FLASH_MEMTYPE_DATA);           // Desbloqueia EEPROM para escrita
    FLASH_ProgramByte(EEPROM_CONTROLE_ID,     (uint8_t)(id >> 24)); // Byte mais significativo
    FLASH_ProgramByte(EEPROM_CONTROLE_ID + 1, (uint8_t)(id >> 16));
    FLASH_ProgramByte(EEPROM_CONTROLE_ID + 2, (uint8_t)(id >> 8));
    FLASH_ProgramByte(EEPROM_CONTROLE_ID + 3, (uint8_t)(id));       // Byte menos significativo
    FLASH_Lock(FLASH_MEMTYPE_DATA);            // Bloqueia EEPROM novamente
}

// Lê o código do controle remoto salvo na EEPROM
uint32_t ler_codigo_eeprom(void)
{
    uint32_t codigo = 0;
    codigo |= ((uint32_t)FLASH_ReadByte(EEPROM_CONTROLE_ID)) << 24;     // Byte mais significativo
    codigo |= ((uint32_t)FLASH_ReadByte(EEPROM_CONTROLE_ID + 1)) << 16;
    codigo |= ((uint32_t)FLASH_ReadByte(EEPROM_CONTROLE_ID + 2)) << 8;
    codigo |= ((uint32_t)FLASH_ReadByte(EEPROM_CONTROLE_ID + 3));       // Byte menos significativo
    return codigo;
}

// No setup:
onInt_TM6(); // Configura Timer 6 para interrupção de RF

// Na ISR do Timer 6:
@far @interrupt void TIM6_UPD_IRQHandler (void)
{
    if(RF_IN_ON)
    {
        Read_RF_6P20();
    }
    TIM6_SR = 0;		
}

bool RF_IN_ON = TRUE; // Habilita leitura RF