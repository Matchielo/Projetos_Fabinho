/* 
 * Este projeto é um sistema embarcado para gerenciamento de filas com display de 7 segmentos,
 * cadastro e acionamento de comandos via RF (controle remoto), feedback sonoro (buzzer) e visual.
 * Aplicação típica: painel de senhas para atendimento em guichês, onde operadores podem chamar clientes
 * usando botões físicos ou controles remotos RF, e o display mostra o número chamado e o guichê.
 */

// Bibliotecas padrão STM8 e protocolo RF HT6P20B
#include "stm8s.h"           // Biblioteca principal do microcontrolador STM8
#include "stm8s903k3.h"      // Definições específicas do modelo STM8S903K3
#include "protocol_ht6p20b.h"// Protocolo para decodificação de comandos RF

// -------------------- Definições de pinos --------------------
// Macros para controle dos dígitos do display de 7 segmentos.
// Cada macro ativa/desativa um dígito, permitindo multiplexação do display.
#define setDig1 GPIO_WriteHigh(GPIOE, GPIO_PIN_5);			// Liga Dígito 1 (centena)
#define setDig2 GPIO_WriteHigh(GPIOC, GPIO_PIN_1);			// Liga Dígito 2 (dezena)
#define setDig3 GPIO_WriteHigh(GPIOC, GPIO_PIN_2);			// Liga Dígito 3 (unidade)
#define setDig4 GPIO_WriteHigh(GPIOC, GPIO_PIN_3);			// Liga Dígito 4 (dezena guichê)
#define setDig5 GPIO_WriteHigh(GPIOC, GPIO_PIN_4);			// Liga Dígito 5 (unidade guichê)
#define setDig6 GPIO_WriteHigh(GPIOC, GPIO_PIN_5);			// Liga Dígito 6 (extra, não usado)

#define resDig1 GPIO_WriteLow(GPIOE, GPIO_PIN_5);			// Desliga Dígito 1
#define resDig2 GPIO_WriteLow(GPIOC, GPIO_PIN_1);			// Desliga Dígito 2
#define resDig3 GPIO_WriteLow(GPIOC, GPIO_PIN_2);			// Desliga Dígito 3
#define resDig4 GPIO_WriteLow(GPIOC, GPIO_PIN_3);			// Desliga Dígito 4
#define resDig5 GPIO_WriteLow(GPIOC, GPIO_PIN_4);			// Desliga Dígito 5
#define resDig6 GPIO_WriteLow(GPIOC, GPIO_PIN_5);			// Desliga Dígito 6

// Macros para leitura dos botões físicos
#define readCh1 GPIO_ReadInputPin(GPIOB, GPIO_PIN_7);		// Botão CH1: Cadastro RF (usado para cadastrar controles remotos)
#define readCh2 GPIO_ReadInputPin(GPIOF, GPIO_PIN_4);		// Botão CH2: Cadastro Preset (usado para cadastrar controle mestre/preset)

// Constantes de controle do sistema
#define timeDelay 			((uint16_t)22500) // Delay padrão para efeitos visuais/sonoros
#define control_presetP	0x00                // Código para preset fila P
#define control_presetC	0x04                // Código para preset fila C
#define control_presetE	0x08                // Código para preset fila E
#define dataNull	1000                    // Valor especial para "apagar" display

/* -------------------- Variáveis globais -------------------- */
// PWM para buzzer e alarmes (valores de frequência)
// Permite gerar diferentes tons para feedback sonoro ao usuário.
unsigned int	pwm_call_h 		= 500;	// Frequência chamada alta
unsigned int	pwm_call_l		= 500;	// Frequência chamada baixa
unsigned int	pwm_call_fbk	= 500;	// Frequência feedback
unsigned int	pwm_alm_offh	= 500;	// Frequência alarme off-hook
unsigned int	pwm_alarm_h   = 500;	// Frequência alarme alta
unsigned int	pwm_alarm_l		= 500;	// Frequência alarme baixa

signed int i = 0;                // Variável auxiliar para loops
bool	RF_IN_ON = FALSE;        // Flag para habilitar leitura RF (usada na interrupção do Timer 6)

int dataEpromVector2 = 0;        // Auxiliar para comparação de códigos RF
int dataBufferVector2 = 0;       // Auxiliar para comparação de códigos RF

// Vetor EEPROM para armazenar códigos RF cadastrados (cada controle ocupa 4 bytes)
// Permite cadastrar múltiplos controles remotos para diferentes guichês.
@eeprom uint8_t codGuiche1[4];   // Atenção: tamanho pequeno, ideal aumentar para múltiplos controles

bool	sinLed = FALSE;		    // Sinaliza para ligar LED (não utilizado no trecho)
bool 	setCountP = FALSE;	    // Sinaliza incremento fila P (quando um cliente é chamado)
bool 	setCountC = FALSE;	    // Sinaliza incremento fila C
bool 	setCountE = FALSE;	    // Sinaliza incremento fila E
bool	setRepeat = FALSE;	    // Sinaliza repetição última fila (chamada repetida)

u8		stateBot = 0;           // Estado do botão (não utilizado no trecho)
u16 	delayOn = 0;            // Delay auxiliar
u8		contMSeg	= 0;        // Contador de milissegundos
u8		contSeg	= 0;           // Contador de segundos

uint16_t debounceCh1 = 0;        // Debounce botão CH1 (evita múltiplos cadastros por ruído)
uint16_t debounceCh2 = 0;        // Debounce botão CH2
uint16_t counterP = 0;           // Contador fila P (número de clientes chamados)
uint16_t counterC = 0;           // Contador fila C
uint16_t counterE = 0;           // Contador fila E
uint16_t repeatCall = 0;         // Valor para repetição de chamada
uint8_t digUni = 0;              // Dígito unidade display
uint8_t digDez = 0;              // Dígito dezena display
uint8_t digCen = 0;              // Dígito centena display
uint8_t guiDez = 0;              // Dígito dezena guichê
uint8_t guiUni = 0;              // Dígito unidade guichê
uint8_t guiFilaP = 0;            // Guichê fila P (identifica qual guichê chamou o cliente)
uint8_t guiFilaC = 0;            // Guichê fila C
uint8_t guiFilaE = 0;            // Guichê fila E
uint8_t readChannel1 = 0;        // Estado botão CH1
uint8_t readChannel2 = 0;        // Estado botão CH2
uint8_t numGuiche = 0;           // Número do guichê atual
uint8_t ultimaFilaChamada = 0;   // Última fila chamada (0=P, 1=C, 2=E)
uint16_t saveData = 0;           // Dados para salvar no display

// Configuração PWM para buzzer (TIM5_CH3)
// Permite gerar tons diferentes para feedback sonoro.
uint8_t fh  = 50;	
uint8_t vh  = 25;
uint8_t fl	= 39;
uint8_t vl	= 18;

// -------------------- Protótipos de funções --------------------
// Funções para inicialização de periféricos, exibição no display, cadastro e busca de códigos RF,
// além de controle do buzzer para feedback sonoro.
static 	void TIM1_Config(void);           // Configura PWM da sirene
void 		InitGPIO (void);               // Inicializa GPIOs (entradas e saídas)
void 		Delay (uint32_t nCount);       // Delay simples (busy-wait)
void 		SetCLK (void);                 // Configura clock principal
void		InitADC (void);                // Inicializa ADC (volume sirene)
void 		UnlockE2prom (void);           // Destrava EEPROM para escrita
void		onInt_TM6 (void);              // Configura Timer 6 para RF
void 		showDisplay (uint16_t);        // Mostra valor no display
void 		save_code_to_eeprom (void);    // Salva código RF na EEPROM
uint8_t searchCode (void);                // Busca código RF na EEPROM
void 		buzzerOnHi(void);              // Liga buzzer com PWM alto
void 		buzzerOnLow(void);             // Liga buzzer com PWM baixo
void 		turnOffbuzzer(void);           // Desliga buzzer
void 		showCharP(void);               // Exibe caractere "P" no display
void 		showCharC(void);               // Exibe caractere "C" no display
void 		showCharE(void);               // Exibe caractere "E" no display
void 		save_preset_to_eeprom(void);   // Salva código preset na EEPROM

// -------------------- Função principal --------------------
main()
{
    SetCLK(); 			// Inicializa clock 16MHz para máxima performance do sistema
    InitGPIO();			// Configura todos os GPIOs (entradas para botões e RF, saídas para display e buzzer)
    InitADC();			// Inicializa ADC para leitura de volume da sirene (caso implementado)
    UnlockE2prom(); 	// Destrava EEPROM para permitir gravação de códigos RF
    TIM1_Config();  	// Configura PWM da sirene (caso implementado)
    onInt_TM6();		// Configura Timer 6 para interrupção periódica (decodificação RF)

    // Botão para apagar controles cadastrados (pressione CH1 na inicialização)
    // Permite resetar todos os controles RF cadastrados, útil para manutenção ou troca de controles.
    readChannel1 = readCh1;
    if (readChannel1 == 0)
    {
        uint16_t i;
        Delay(100); // Debounce simples
        for (i = 4; i <= 400; i++)
        {
            codGuiche1[i] = 0x00; // Apaga todos os códigos RF da EEPROM
        }
    }

    // Efeito inicial no display e buzzer (animação de inicialização)
    // Indica ao usuário que o sistema está pronto para uso.
    showDisplay(888);      // Mostra 888 no display (teste visual)
    buzzerOnHi();          // Liga buzzer (teste sonoro)
    Delay(100000);		
    showDisplay(dataNull); // Apaga display
    buzzerOnLow();         // Buzzer baixo
    Delay(100000);
    showDisplay(888);
    buzzerOnHi();
    Delay(100000);
    showDisplay(dataNull);
    buzzerOnLow();
    Delay(100000);
    showDisplay(0);        // Mostra 0 no display (pronto para uso)
    turnOffbuzzer();       // Desliga buzzer

    while (1)
    {
        RF_IN_ON = TRUE; // Habilita leitura RF (usado na interrupção do Timer 6)
        HT_RC_Code_Ready_Overwrite = FALSE; // Reseta flag do protocolo RF

        // Controle de contadores das filas (incrementa e mostra no display)
        // Cada fila representa um tipo de atendimento (P, C, E).
        if (setCountP == TRUE)
        {
            if (++counterP >= 1000)
            {
                counterP = 0;
                setCountP = FALSE;
            }
            else 
            {
                setCountP = FALSE;
            }
            showCharP();           // Exibe "P" no display (identifica fila)
            showDisplay(dataNull); // Apaga display para efeito visual
            buzzerOnHi();          // Liga buzzer (feedback sonoro)
            Delay(100000);		
            showDisplay(counterP); // Mostra contador P (número chamado)
            buzzerOnLow();         // Buzzer baixo
            Delay(100000);
            showDisplay(dataNull);
            buzzerOnHi();
            Delay(100000);
            showDisplay(counterP);
            turnOffbuzzer();
        }
        // Controle fila C (mesma lógica da fila P)
        if (setCountC == TRUE)
        {
            if (++counterC >= 1000)
            {
                counterC = 0;
                setCountC = FALSE;
            }
            else 
            {
                setCountC = FALSE;
            }
            showCharC();
            showDisplay(dataNull);
            buzzerOnHi();
            Delay(100000);		
            showDisplay(counterC);
            buzzerOnLow();
            Delay(100000);
            showDisplay(dataNull);
            buzzerOnHi();
            Delay(100000);
            showDisplay(counterC);
            turnOffbuzzer();
        }
        // Controle fila E (mesma lógica das anteriores)
        if (setCountE == TRUE)
        {
            if (++counterE >= 1000)
            {
                counterE = 0;
                setCountE = FALSE;
            }
            else 
            {
                setCountE = FALSE;
            }
            showCharE();
            showDisplay(dataNull);
            buzzerOnHi();
            Delay(100000);		
            showDisplay(counterE);
            buzzerOnLow();
            Delay(100000);
            showDisplay(dataNull);
            buzzerOnHi();
            Delay(100000);
            showDisplay(counterE);
            turnOffbuzzer();
        }
        // Repete última fila chamada (mostra valor salvo em repeatCall)
        // Permite repetir a chamada anterior, útil para casos de erro ou confirmação.
        if (setRepeat == TRUE)
        {	
            // Seleciona guichê conforme última fila chamada
            if (ultimaFilaChamada == 0) numGuiche = guiFilaP;
            if (ultimaFilaChamada == 1) numGuiche = guiFilaC;
            if (ultimaFilaChamada == 2) numGuiche = guiFilaE;
            
            saveData = repeatCall;
            showDisplay(dataNull);
            buzzerOnHi();
            Delay(100000);		
            showDisplay(saveData);
            buzzerOnLow();
            Delay(100000);
            showDisplay(dataNull);
            buzzerOnHi();
            Delay(100000);
            showDisplay(saveData);
            turnOffbuzzer();
            setRepeat = FALSE;
        }		
        
        // Cadastro de controle via botão CH1 (PB7)
        // Permite cadastrar novos controles RF para chamar clientes.
        readChannel1 = readCh1;
        if (readChannel1 == 0)
        {
            if (++debounceCh1 >= 250) // Debounce simples
            {
                --debounceCh1;
                if (Code_Ready == TRUE) // Só cadastra se chegou código RF novo
                {
                    save_code_to_eeprom(); // Salva novo código RF na EEPROM
                    setCountP = FALSE;
                    setCountC = FALSE;
                    setCountE = FALSE;
                    setRepeat = FALSE;
                    Code_Ready = FALSE;
                }
            }
        }
        else
        {
            debounceCh1 = 0;
        }
        
        // Cadastro de controle preset via botão CH2 (PF4)
        // Permite cadastrar um controle mestre/preset para funções especiais.
        readChannel2 = readCh2;
        if (readChannel2 == 0)
        {
            if (++debounceCh2 >= 250)
            {
                --debounceCh2;
                if (Code_Ready == TRUE)
                {
                    save_preset_to_eeprom(); // Salva código preset na EEPROM
                    setCountP = FALSE;
                    setCountC = FALSE;
                    setCountE = FALSE;
                    setRepeat = FALSE;
                    Code_Ready = FALSE;
                }
            }
        }
        else
        {
            debounceCh2 = 0;
        }		
        
        // Verifica se chegou comando RF (Code_Ready == TRUE)
        // Quando um controle RF envia comando, busca na EEPROM e executa a ação correspondente.
        if (Code_Ready == TRUE)
        {
            searchCode(); // Busca código na EEPROM e executa a ação correspondente
            Code_Ready = FALSE;
        }
    }
}

// -------------------- Funções auxiliares --------------------

// Salva código de preset na EEPROM (posição fixa)
// Usado para cadastrar um controle mestre/preset, normalmente para funções administrativas.
void save_preset_to_eeprom(void)
{
    int i = 0;
    // Copia os 4 bytes do código RF recebido para a EEPROM
    codGuiche1[i] 		= RF_CopyBuffer[0];
    codGuiche1[i + 1] = RF_CopyBuffer[1];
    codGuiche1[i + 2] = RF_CopyBuffer[2];
    codGuiche1[i + 3] = RF_CopyBuffer[3];
    
    // Feedback visual/sonoro de cadastro
    showDisplay(888);   // Indica cadastro no display
    buzzerOnHi();       // Feedback sonoro
    Delay(100000);		
    showDisplay(dataNull);
    buzzerOnLow();
    Delay(100000);
    showDisplay(888);
    buzzerOnHi();
    Delay(100000);
    showDisplay(dataNull);
    buzzerOnLow();
    Delay(100000);
    showDisplay(0);
    turnOffbuzzer();
    
    return;
}

// Salva novo código RF na próxima posição livre da EEPROM
// Permite cadastrar múltiplos controles RF, cada um associado a um guichê.
void save_code_to_eeprom(void)
{
    uint16_t i = 4;
    if (searchCode() == 0) // Evita duplicidade de cadastro
    {
        return;
    }
    while (i < 400)
    {
        // Procura posição livre (todos bytes zero)
        if ((codGuiche1[i] + codGuiche1[i + 1] + codGuiche1[i + 2] + codGuiche1[i + 3]) == 0x0000)
        {
            // Salva os 4 bytes do código RF recebido
            codGuiche1[i] 	  = RF_CopyBuffer[0];
            codGuiche1[i + 1] = RF_CopyBuffer[1];
            codGuiche1[i + 2] = RF_CopyBuffer[2];
            codGuiche1[i + 3] = RF_CopyBuffer[3];
            
            // Feedback visual/sonoro de cadastro
            showDisplay(888);   // Indica cadastro no display
            buzzerOnHi();       // Feedback sonoro
            Delay(100000);		
            showDisplay(dataNull);
            buzzerOnLow();
            Delay(100000);
            showDisplay(888);
            buzzerOnHi();
            Delay(100000);
            showDisplay(dataNull);
            buzzerOnLow();
            Delay(100000);
            showDisplay(0);
            turnOffbuzzer();
            
            return;
        }
        i = i + 4;
    }
}

// Busca código RF na EEPROM e executa ação correspondente
// Quando um comando RF é recebido, verifica se está cadastrado e executa a ação (chamar cliente, repetir chamada, etc).
uint8_t searchCode(void)
{
    uint16_t i = 0;
    numGuiche = 1;
    dataEpromVector2 = codGuiche1[i + 2] & 0xFC;
    dataBufferVector2 = RF_CopyBuffer[2] & 0xFC;	
    
    // Decodificação do controle de rolagem rápida (posição fixa)
    if ( codGuiche1[i]     == RF_CopyBuffer[0] && 
             codGuiche1[i + 1] == RF_CopyBuffer[1] &&
             dataEpromVector2 == dataBufferVector2 &&
             codGuiche1[i + 3] == RF_CopyBuffer[3]
            )
    {
        // Executa ação conforme tecla do controle RF
        if ((RF_CopyBuffer[2] & 0x03) == 0x01) // Tecla 1
        {
            counterP++;
            showDisplay(counterP);
        }
        if ((RF_CopyBuffer[2] & 0x03) == 0x02) // Tecla 2
        {
            counterC++;
            showDisplay(counterC);
        }
        //if ((RF_CopyBuffer[2] & 0x03) == 0x03) // Tecla 3
        //{
        //	counterE++;
        //	showDisplay(counterE);
        //}
        return 1;
    }
    
    // Decodificação dos controles de chamada (busca em todas posições cadastradas)
    i = 4;
    while (i < 400)
    {
        dataEpromVector2 = codGuiche1[i + 2] & 0xFC;
        dataBufferVector2 = RF_CopyBuffer[2] & 0xFC;
        if ( codGuiche1[i]     == RF_CopyBuffer[0] && 
                 codGuiche1[i + 1] == RF_CopyBuffer[1] &&
                 dataEpromVector2 == dataBufferVector2 &&
                 codGuiche1[i + 3] == RF_CopyBuffer[3]
                )
        {
            // Executa ação conforme tecla do controle RF
            if ((RF_CopyBuffer[2] & 0x03) == 0x01)
            {
                setCountP = TRUE;
                guiFilaP = numGuiche;
                ultimaFilaChamada = 0; // 0 = P
                return 0;
            }
            if ((RF_CopyBuffer[2] & 0x03) == 0x02)
            {
                setCountC = TRUE;
                guiFilaC = numGuiche;
                ultimaFilaChamada = 1; // 1 = C
                return 0;
            }
            if ((RF_CopyBuffer[2] & 0x03) == 0x03)
            {
                setRepeat = TRUE;
                /*
                setCountE = TRUE;
                guiFilaE = numGuiche;
                ultimaFilaChamada = 2; // 2 = E 
                */
                return 0; 
            }
            //if ((RF_CopyBuffer[2] & 0x03) == 0x00)
            //{
            //	setRepeat = TRUE;
            //	return 0;
            //}			
        }
        i = i + 4;
        numGuiche++;
        if (numGuiche > 99) numGuiche = 99;
    }
    return 1;
}

// -------------------- Funções de exibição --------------------

// Mostra valor no display (centena, dezena, unidade, guichê)
// Exibe o número chamado e o guichê correspondente.
void showDisplay(uint16_t data)
{
    repeatCall = data;
    if (data == dataNull)
    {
        // Apaga todos os dígitos do display
        PB_ODR = PB_ODR & 0xF0 | 0x0F;
        setDig1;
        Delay(10);
        resDig1;
        PB_ODR = PB_ODR & 0xF0 | 0x0F;
        setDig2;
        Delay(10);
        resDig2;
        PB_ODR = PB_ODR & 0xF0 | 0x0F;
        setDig3;
        Delay(10);
        resDig3;
        
        PB_ODR = PB_ODR & 0xF0 | 0x0F;
        setDig4;
        Delay(10);
        resDig4;
        PB_ODR = PB_ODR & 0xF0 | 0x0F;
        setDig5;
        Delay(10);
        resDig5;		
    }
    else 
    {
        // Mostra valor nos dígitos do display
        digCen = data / 100;
        digDez = (data % 100) / 10;
        digUni = (data % 100) % 10;
        PB_ODR = PB_ODR & 0xF0 | digCen & 0x0F;
        setDig1;
        Delay(10);
        resDig1;
        PB_ODR = PB_ODR & 0xF0 | digDez & 0x0F;
        setDig2;
        Delay(10);
        resDig2;
        PB_ODR = PB_ODR & 0xF0 | digUni & 0x0F;
        setDig3;
        Delay(10);
        resDig3;
        
        guiDez = numGuiche / 10;
        guiUni = numGuiche % 10;
        PB_ODR = PB_ODR & 0xF0 | guiDez & 0x0F;
        setDig4;
        Delay(10);
        resDig4;
        PB_ODR = PB_ODR & 0xF0 | guiUni & 0x0F;
        setDig5;
        Delay(10);
        resDig5;
    }
    Code_Ready = FALSE; // Limpa flag após exibição
}

// Exibe caractere "P" no display (fila P)
void showCharP(void) 
{
    PC_ODR &= ~0xC0; 
    PC_ODR |= 0xC0;
    PD_ODR &= ~0x3D;
    PD_ODR |= 0x38;
}

// Exibe caractere "C" no display (fila C)
void showCharC(void)
{
    PC_ODR &= ~0xC0;
    PC_ODR |= 0x40;
    PD_ODR &= ~0x3D;
    PD_ODR |= 0x1C;	
}

// Exibe caractere "E" no display (fila E)
void showCharE(void)
{
    PC_ODR &= ~0xC0;
    PC_ODR |= 0x40;
    PD_ODR &= ~0x3D;
    PD_ODR |= 0x3C;	
}

// -------------------- PWM e Buzzer --------------------

// Configura PWM da sirene (TIM1)
// Permite gerar tons para sirene de chamada.
static void TIM1_Config(void)
{
    // Implementação omitida (deve configurar TIM1 para PWM da sirene)
}

// Configura PWM do buzzer (TIM5)
// Permite gerar tons para feedback sonoro ao usuário.
static void TIM5_Config(void)
{
    // Reset do timer
    TIM5_DeInit();

    // Prescaler = 0 ? f_timer = 16 MHz
    TIM5_PSCR = 0;

    // ARR = fh00h (define o período do PWM)
    TIM5_ARRH = fh;
    TIM5_ARRL = 0x00;

    // CCR3 = vh00h (define largura do pulso)
    TIM5_CCR3H = vh;
    TIM5_CCR3L = 0x00;

    // PWM Mode 1 com preload (0x78 = 01111000)
    TIM5_CCMR3 = 0x78;

    // Habilita canal 3 com polaridade invertida (CC3E=1, CC3P=1)
    TIM5_CCER2 = 0x03;

    // Ativa ARPE (Auto Reload Preload Enable)
    TIM5_CR1 |= (1 << 7);

    // Liga o contador
    TIM5_CR1 |= TIM5_CR1_CEN;
}

// Liga buzzer com PWM alto (frequência para efeito sonoro)
void buzzerOnHi(void)
{
    TIM5_ARRH = fl;
    TIM5_ARRL = 0x00;
    TIM5_CCR3H = vl;
    TIM5_CCR3L = 0x00;
    TIM5_CR1 |= TIM5_CR1_CEN;
    TIM5_CCMR3 |= (1 << 5);
}

// Liga buzzer com PWM baixo (frequência para efeito sonoro)
void buzzerOnLow(void)
{
    TIM5_DeInit();
    TIM5_PSCR = 0x00;
    TIM5_ARRH = fh;
    TIM5_ARRL = 0x00;
    TIM5_CCR3H = vh;
    TIM5_CCR3L = 0x00;
    TIM5_CCMR3 = 0x70;
    TIM5_CCMR3 = 0x78;
    TIM5_CCER2 = 0x03;
    TIM5_CR1 |= (1 << 7);
    TIM5_CR1 |= (1 << 0);
}

// Desliga buzzer
void turnOffbuzzer(void)
{
    TIM5_CR1 &= ~(1 << 0);
    TIM5_CCMR3 &= ~(1 << 5);
}

// -------------------- Configuração de periféricos --------------------

// Configura Timer 6 para interrupção de 50us (usado para decodificação RF)
// Timer 6 é usado para gerar interrupções periódicas e decodificar sinais RF recebidos pela antena.
void onInt_TM6(void)
{
    TIM6_CR1  = 0b00000001; // Liga Timer 6
    TIM6_IER  = 0b00000001; // Habilita interrupção
    TIM6_CNTR = 0b00000001; // Inicializa contador
    TIM6_ARR	= 0b00000001; // Valor inicial do ARR
    TIM6_SR		= 0b00000001; // Limpa flag de status
    TIM6_PSCR = 0b00000010; // Prescaler
    TIM6_ARR  = 198;        // Valor para gerar 50us (com 16MHz)
    TIM6_IER	|= 0x00;
    TIM6_CR1	|= 0x00;
    #asm
    RIM        // Habilita interrupções globais
    #endasm
}

// Configuração do ADC (volume sirene)
// Permite ajustar o volume da sirene via hardware (caso implementado).
void	InitADC (void)
{
    // Implementação omitida (deve configurar ADC para leitura de volume)
}

// Configuração dos GPIOs (entradas e saídas do sistema)
// Define quais pinos são usados para botões, RF, display e buzzer.
void InitGPIO(void)
{
    // Entradas
    GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT); // Entrada RF (antena)
    GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); // Botão CH1 (Cadastro RF)
    GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // Botão CH2 (Cadastro Preset)

    // Saídas
    GPIO_Init(GPIOA, GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PA2: Display | PA3: PWM buzzer
    GPIO_Init(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PB0~PB3: BCD/7Seg
    GPIO_Init(GPIOC, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch
    GPIO_Init(GPIOD, GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch 0
}

// Função de delay simples (busy-wait)
// Usada para criar efeitos visuais/sonoros e debounce de botões.
void Delay(uint32_t nCount)
{
  while (nCount != 0)
  {
    nCount--;
  }
}

// Configuração do clock principal (16MHz)
// Garante máxima performance do microcontrolador.
void SetCLK(void)
{
    CLK_CKDIVR = 0b00000000; // Sem divisão, máxima frequência
}

// Destrava EEPROM para escrita
// Permite gravar códigos RF na memória não volátil.
void UnlockE2prom(void)
{
    FLASH_Unlock(FLASH_MEMTYPE_DATA);
}

// Interrupção Timer 6 para RF (chama decodificador do protocolo HT6P20B)
// Decodifica sinais RF recebidos pela antena e atualiza variáveis do sistema.
@far @interrupt void TIM6_UPD_IRQHandler (void)
{
    if(RF_IN_ON)
    {
        Read_RF_6P20(); // Decodifica sinal RF recebido pela antena
    }
    TIM6_SR = 0;		
}