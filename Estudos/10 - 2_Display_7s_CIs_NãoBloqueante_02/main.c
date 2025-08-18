/* 
 * Projeto para acionar LEDs via rádio (RF) com função toggle
 * Corrigido para evitar repetição de sinal RF
 * Microcontrolador: STM8S903K3
 * Protocolo: HT6P20B
 *
 * A lógica central:
 * - Recebe um código RF (HT6P20B) e compara com o salvo na EEPROM
 * - Se for um controle válido, executa ação (toggle do LED)
 * - Usa cooldown para evitar múltiplos acionamentos vindos do mesmo pacote RF
 * - Também permite cadastrar/alterar o controle RF e um "preset"
 */

// Bibliotecas padrão STM8 e protocolo RF
#include "stm8s.h"            // Biblioteca principal do microcontrolador STM8
#include "stm8s903k3.h"       // Definições específicas do modelo STM8S903K3
#include "protocol_ht6p20b.h" // Protocolo para decodificação de comandos RF

// -------------------- Definições de pinos --------------------
// LEDs são acionados em nível BAIXO (LOW = aceso) por estarem provavelmente ligados em configuração "sinking"
// Isso é comum em hardware onde o lado positivo já está conectado ao Vcc através de resistor

// Macros para controle dos LEDs
#define LED1_ON    GPIO_WriteLow(GPIOD, GPIO_PIN_2)   // Liga LED1 (PD2)
#define LED1_OFF   GPIO_WriteHigh(GPIOD, GPIO_PIN_2)  // Desliga LED1 (PD2)
#define LED2_ON    GPIO_WriteLow(GPIOD, GPIO_PIN_3)   // Liga LED2 (PD3)
#define LED2_OFF   GPIO_WriteHigh(GPIOD, GPIO_PIN_3)  // Desliga LED2 (PD3)
#define LED3_ON    GPIO_WriteLow(GPIOD, GPIO_PIN_4)   // Liga LED3 (PD4)
#define LED3_OFF   GPIO_WriteHigh(GPIOD, GPIO_PIN_4)  // Desliga LED3 (PD4)

// Buzzer acionado com nível ALTO (padrão sourcing)
#define BUZZER_ON  GPIO_WriteHigh(GPIOD, GPIO_PIN_0)  // Liga buzzer (PD0)
#define BUZZER_OFF GPIO_WriteLow(GPIOD, GPIO_PIN_0)   // Desliga buzzer (PD0)

// Leitura de botões com pull-up interno ativado (nível 0 = pressionado)
#define readCh1 GPIO_ReadInputPin(GPIOB, GPIO_PIN_7)  // Botão CH1 - Cadastro RF (PB7)
#define readCh2 GPIO_ReadInputPin(GPIOF, GPIO_PIN_4)  // Botão CH2 - Cadastro Preset (PF4)

// -------------------- Variáveis globais --------------------
// Armazena estado lógico dos LEDs para função toggle
bool led1State = FALSE;      // Estado atual do LED1
bool led2State = FALSE;      // Estado atual do LED2
bool led3State = FALSE;      // Estado atual do LED3

bool RF_IN_ON = FALSE;       // Flag para habilitar leitura RF

uint16_t debounceCh1 = 0;    // Debounce botão CH1
uint16_t debounceCh2 = 0;    // Debounce botão CH2
uint16_t rf_cooldown = 0;    // Timer de cooldown para evitar repetição de comandos RF

// Vetor EEPROM para armazenar códigos RF cadastrados
@eeprom uint8_t codControler[4];  // Código RF cadastrado

// -------------------- Protótipos de funções --------------------
void InitGPIO(void);                 // Inicializa GPIOs
void Delay(uint32_t nCount);         // Delay simples (busy-wait)
void SetCLK(void);                   // Configura clock principal
void ToggleLED1(void);               // Alterna estado do LED1
void ToggleLED2(void);               // Alterna estado do LED2
void ToggleLED3(void);               // Alterna estado do LED3
void onInt_TM6(void);                // Configura Timer 6 para RF
void UnlockE2prom(void);             // Destrava EEPROM para escrita
void save_code_to_eeprom(void);      // Salva código RF na EEPROM
void save_preset_to_eeprom(void);    // Salva código preset na EEPROM
uint8_t searchCode(void);            // Busca código RF na EEPROM e executa ação
void BuzzerBeep(uint16_t duration);  // Aciona buzzer por tempo

// -------------------- Função principal --------------------
main()
{
    SetCLK();        // Ajusta clock para 16 MHz (máxima velocidade para leitura RF)
    InitGPIO();      // Configura entradas e saídas
    UnlockE2prom();  // Permite gravação na EEPROM
    onInt_TM6();     // Ativa Timer 6 para interrupção periódica usada na leitura RF
    
    // Se CH1 for mantido pressionado na inicialização, apaga códigos RF da EEPROM
    // Isso é útil para resetar o sistema sem precisar interface externa
    if (readCh1 == 0)
    {
        uint16_t i;
        Delay(100); // Debounce simples
        for (i = 0; i < 4; i++)
        {
            codControler[i] = 0x00; // Apaga todos os códigos RF da EEPROM
        }
    }
    
    // Efeito visual inicial - LEDs piscam 3x
    // Além de sinalizar que o sistema ligou, ajuda a detectar se o micro está travando no boot
    LED1_ON;
    LED2_ON;
    LED3_ON;
    Delay(100000);
    LED1_OFF;
    LED2_OFF;
    LED3_OFF;
    Delay(100000);
    LED1_ON;
    LED2_ON;
    LED3_ON;
    Delay(100000);
    LED1_OFF;
    LED2_OFF;
    LED3_OFF;
    Delay(100000);
    LED1_ON;
    LED2_ON;
    LED3_ON;
    Delay(100000);
    LED1_OFF;
    LED2_OFF;
    LED3_OFF;
    Delay(100000);
    
    // Loop principal
    while (1)
    {
        // Decrementa o timer de cooldown a cada passagem do loop
        if (rf_cooldown > 0)
        {
            rf_cooldown--;
        }

        RF_IN_ON = TRUE; // Habilita leitura RF
        HT_RC_Code_Ready_Overwrite = FALSE; // Reseta flag do protocolo RF

        // Controle via botão CH1 - Cadastro de controle RF
        if (readCh1 == 0)
        {
            if (++debounceCh1 >= 250)
            {
                --debounceCh1;
                
                LED1_ON;                // Indica cadastro em andamento
                BuzzerBeep(50000);      // Buzzer curto para feedback
                
                if (Code_Ready == TRUE) // Se chegou código RF novo
                {
                    save_code_to_eeprom(); // Salva código na EEPROM
                    Code_Ready = FALSE;
                    
                    LED2_ON;            // Indica cadastro concluído
                    BuzzerBeep(100000); // Buzzer longo para confirmação
                    Delay(200000);
                    LED1_OFF;
                    LED2_OFF;
                }
                else
                {
                    Delay(100000);
                    LED1_OFF;
                }
            }
        }
        else
        {
            debounceCh1 = 0;
        }

        // Verifica se chegou comando RF E se o cooldown já terminou
        if (Code_Ready == TRUE && rf_cooldown == 0)
        {
            searchCode(); // Busca código na EEPROM e executa a ação
            Code_Ready = FALSE;
            
            // RECARREGA O COOLDOWN para ignorar os sinais repetidos do controle
            rf_cooldown = 3000;
        }
        else if (Code_Ready == TRUE && rf_cooldown > 0)
        {
            // Se chegou um código mas ainda estamos no cooldown, apenas o descarte
            Code_Ready = FALSE;
        }
    }
}

// -------------------- Funções auxiliares --------------------

// Alterna o estado do LED1
void ToggleLED1(void)
{
    if (led1State)
    {
        LED1_OFF; // Desliga LED1
        // led1State = FALSE;
    }
    else
    {
        LED1_ON;  // Liga LED1
        // led1State = TRUE;
    }
    Delay(100000); // Pequeno delay para efeito visual
}

// Alterna o estado do LED2
void ToggleLED2(void)
{
    if (led2State)
    {
        LED2_OFF; // Desliga LED2
        // led2State = FALSE;
    }
    else
    {
        LED2_ON;  // Liga LED2
        // led2State = TRUE;
    }
    Delay(100000); // Pequeno delay para efeito visual
}

// Alterna o estado do LED3
void ToggleLED3(void)
{
    if (led3State)
    {
        LED3_OFF; // Desliga LED3
        // led3State = FALSE;
    }
    else
    {
        LED3_ON;  // Liga LED3
        // led3State = TRUE;
    }
    Delay(100000); // Pequeno delay para efeito visual
}

// Toca buzzer por tempo específico
void BuzzerBeep(uint16_t duration)
{
    BUZZER_ON;        // Liga buzzer
    Delay(duration);  // Mantém por 'duration'
    BUZZER_OFF;       // Desliga buzzer
}

// Salva código de preset na EEPROM (posição fixa)
void save_preset_to_eeprom(void)
{
    int i = 0;
    codControler[i]     = RF_CopyBuffer[0];
    codControler[i + 1] = RF_CopyBuffer[1];
    codControler[i + 2] = RF_CopyBuffer[2];
    codControler[i + 3] = RF_CopyBuffer[3];
}

// Salva novo código RF na EEPROM
void save_code_to_eeprom(void)
{
    int i = 0;
    codControler[i]     = RF_CopyBuffer[0];
    codControler[i + 1] = RF_CopyBuffer[1];
    codControler[i + 2] = RF_CopyBuffer[2];
    codControler[i + 3] = RF_CopyBuffer[3];
}

// Busca código RF na EEPROM e executa ação correspondente
uint8_t searchCode(void)
{
    int i = 0;
    uint8_t id_salvo_mascarado;
    uint8_t id_recebido_mascarado;

    // 1. Aplica a máscara para pegar SOMENTE o ID do controle, ignorando os botões.
    id_salvo_mascarado    = codControler[i + 2] & 0xFC;
    id_recebido_mascarado = RF_CopyBuffer[2]  & 0xFC;
    
    // 2. Compara o ID completo do controle
    if (codControler[i]     == RF_CopyBuffer[0] && 
        codControler[i + 1] == RF_CopyBuffer[1] &&
        id_salvo_mascarado  == id_recebido_mascarado && // Compara usando a máscara
        codControler[i + 3] == RF_CopyBuffer[3])
    {
        // SUCESSO! O controle é o cadastrado.
        // 3. AGORA, verificamos qual botão foi pressionado.
        if ((RF_CopyBuffer[2] & 0x03) == 0x01) // Tecla 1
        {
            led1State = !led1State; // Alterna estado lógico
            ToggleLED1();           // Alterna LED1
            BuzzerBeep(30000);      // Feedback sonoro
        }
        else if ((RF_CopyBuffer[2] & 0x03) == 0x02) // Tecla 2
        {
            ToggleLED2();           // Alterna LED2
            led2State = !led2State; // Alterna estado lógico
            BuzzerBeep(30000);      // Feedback sonoro
        }
        else if ((RF_CopyBuffer[2] & 0x03) == 0x03) // Tecla 3 (ou 4 dependendo do controle)
        {
            ToggleLED3();           // Alterna LED3
            led3State = !led3State; // Alterna estado lógico
            BuzzerBeep(30000);      // Feedback sonoro
        }
        
        return 0; // Código encontrado e ação executada
    }
    else
    {
        // Código não encontrado
        BuzzerBeep(15000); // Feedback de erro
        return 1;
    }
}

// Configuração dos GPIOs
void InitGPIO(void)
{
    // Entradas com pull-up interno
    GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); // Botão CH1
    GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // Botão CH2
    
    // Saídas
    GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); // Buzzer no PD0
    GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); // LED1 no PD2
    GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // LED2 no PD3
    GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST); // LED3 no PD4
}

// Função de delay simples (busy-wait)
void Delay(uint32_t nCount)
{
    while (nCount != 0)
    {
        nCount--;
    }
}

// Configuração do clock principal (16MHz)
void SetCLK(void)
{
    CLK_CKDIVR = 0b00000000; // Sem divisão, máxima frequência
}

// Destrava EEPROM para escrita
void UnlockE2prom(void)
{
    FLASH_Unlock(FLASH_MEMTYPE_DATA);
}

// Configura Timer 6 para interrupção de 50us (usado para decodificação RF)
void onInt_TM6(void)
{
    TIM6_CR1  = 0b00000001; // Liga Timer 6
    TIM6_IER  = 0b00000001; // Habilita interrupção
    TIM6_CNTR = 0b00000001; // Inicializa contador
    TIM6_ARR  = 0b00000001; // Valor inicial do ARR
    TIM6_SR   = 0b00000001; // Limpa flag de status
    TIM6_PSCR = 0b00000010; // Prescaler
    TIM6_ARR  = 198;        // Valor para gerar 50us (com 16MHz)
    TIM6_IER  |= 0x00;
    TIM6_CR1  |= 0x00;
    #asm
    RIM             // Habilita interrupções globais
    #endasm
}

// Interrupção Timer 6 para RF (chama decodificador do protocolo HT6P20B)
@far @interrupt void TIM6_UPD_IRQHandler (void)
{
    if(RF_IN_ON)
    {
        Read_RF_6P20(); // Decodifica sinal RF recebido pela antena
    }
    TIM6_SR = 0;
}