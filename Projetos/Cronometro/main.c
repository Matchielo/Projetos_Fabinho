/**
 ******************************************************************************
 * @file    main.c
 * @author  Seu Nome (Refatorado por Gemini AI em Marília, 04/09/2025)
 * @brief   Firmware para Placar de Basquete com relógio principal e shot clock.
 * Arquitetura baseada em Máquina de Estados e pulso de 1Hz via RTC externo.
 ******************************************************************************
 */
 
#include "stm8s.h"
#include "stm8s_tim6.h"
#include "protocol_ht6p20b.h" // Protocolo para decodificação de comandos RF

// ============================================================================
// DEFINIÇÕES DO DS1307
// ============================================================================

// --- Configurações do RTC ---
#define DS1307_SECONDS_REG  0x00
#define DS1307_ADDRESS   		0xD0
#define DS1307_CTRL_REG  		0x07

#define SQW_PIN_PORT     GPIOB
#define SQW_PIN          GPIO_PIN_6

// ============================================================================
// DEFINIÇÕES DOS PINOS DO DISPLAY
// ============================================================================

// --- LATCHES - CONTADOR DE JOGO (4 DÍGITOS) ---
#define LATCH_01_PORT GPIOE
#define LATCH_01_PIN  GPIO_PIN_5
#define LATCH_02_PORT GPIOC
#define LATCH_02_PIN  GPIO_PIN_1
#define LATCH_03_PORT GPIOC
#define LATCH_03_PIN  GPIO_PIN_2
#define LATCH_04_PORT GPIOC
#define LATCH_04_PIN  GPIO_PIN_3

// LATCHES - CONTADOR 14/24 SEGUNDOS
#define LATCH_05_PORT GPIOC
#define LATCH_05_PIN  GPIO_PIN_4
#define LATCH_06_PORT GPIOC
#define LATCH_06_PIN  GPIO_PIN_5

// --- PINOS BCD (COMUM PARA TODOS DISPLAYS) ---
#define LD_A_PORT  GPIOB
#define LD_A_PIN   GPIO_PIN_0
#define LD_B_PORT  GPIOB
#define LD_B_PIN   GPIO_PIN_1
#define LD_C_PORT  GPIOB
#define LD_C_PIN   GPIO_PIN_2
#define LD_D_PORT  GPIOB
#define LD_D_PIN   GPIO_PIN_3

// --- PINO DO RELÉ (ALARME) ---
#define RELE_PORT	 GPIOC
#define RELE_PIN	 GPIO_PIN_6

// Botão para cadastro dos controles
#define Cadastro_PORT GPIOD
#define Cadastro_PIN GPIO_PIN_5

// Macro para atraso mínimo
#define NOP() _asm("nop")

// ============================================================================
// VARIÁVEIS GLOBAIS
// ============================================================================

// --- Configurações do Placar ---
#define MAIN_CLOCK_START_SECONDS (20 * 60) // 20 minutos

uint8_t last_state = 0;

// VARIÁVEIS PARA A CONTAGEM MINUTOS

volatile uint16_t seg_valor = 5;  // 20 minutos

// Dígitos
volatile uint8_t seg_unidades = 0;
volatile uint8_t seg_dezenas  = 0;
volatile uint8_t min_unidades = 0;
volatile uint8_t min_dezenas  = 0;


// Flag de controle para habilitar/desabilitar a leitura de sinais RF.
// Desabilita a leitura durante certas operações (ex: debounce de botões) para evitar
// que um sinal RF recebido interfira na rotina de cadastro.
bool RF_IN_ON = FALSE;       // Flag para habilitar leitura RF

// Contadores para o algoritmo de debounce dos botões.
// Evitam que um único toque no botão seja interpretado como múltiplos pressionamentos.
uint16_t debounceCh1 = 0;    // Debounce botão CH1
uint16_t debounceCh2 = 0;    // Debounce botão CH2

// Timer de cooldown para o sinal RF.
// Após um comando RF ser processado, este contador é carregado com um valor
// e só permite outro comando quando chegar a zero, ignorando sinais repetidos
// enviados pelo controle remoto.
uint16_t rf_cooldown = 0;    // Timer de cooldown para evitar repetição de comandos RF

// Vetor na EEPROM para armazenar o código RF do controle remoto cadastrado.
// A diretiva `@eeprom` garante que esta variável será salva na memória não-volátil.
@eeprom uint8_t CodControler[4];  // Código RF cadastrado


// --- NOVAS FLAGS DE CONTROLE (baseadas na lógica Assembly) ---
volatile uint8_t flag_run = 0;              // 0 = Pausado, 1 = Rodando. Controla toda a lógica de tempo.
volatile uint8_t flag_start = 0;            // 0 = Nunca iniciado, 1 = Já iniciado. Permite que o pause só funcione após o primeiro start.

// Variáveis para a sequência de finalização (piscar displays e buzzer)
volatile uint8_t fim_contagem_estado = 0;	    // Máquina de estados da animação final (0 = inativo, >0 = estado atual)

volatile uint8_t tempo_restante = 0;	    // Armazena o valor atual da contagem regressiva
volatile uint8_t unidade = 0;
volatile uint8_t dezena = 0;

uint8_t rele_time = 0;

// ============================================================================
// PROTÓTIPOS
// ============================================================================
void I2C_Init_DS1307(void);
void DS1307_Write(uint8_t reg, uint8_t data);
uint8_t DS1307_Read(uint8_t reg);
void DS1307_StartOscillator(void);
void DS1307_EnableSQW_1Hz(void);

void WriteBCD(uint8_t valor);
void Contagem_Placar(void);
void InitGPIO(void);
void setup_tim6(void);
void Delay_ms_Timer(uint16_t ms);

void contador_placar(void);
void Display_Off(void);
void Piscar_Display(void);


// ============================================================================
// FUNÇÃO PRINCIPAL
// ============================================================================
void main(void)
{
	// Configura o divisor do clock interno HSI (High-Speed Internal)
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);

	// Inicializa I2C e DS1307
	I2C_Init_DS1307();
	DS1307_StartOscillator();
	DS1307_EnableSQW_1Hz();
	
	//UnlockE2prom();
	InitGPIO();
	setup_tim6();
	
	//ITC_SetSoftwarePriority(ITC_IRQ_TIM1_OVF, ITC_PRIORITYLEVEL_1);
	//enableInterrupts();	

	// Atualiza o display inicialmente
	Contagem_Placar();		
	
	while (1)
	{
		contador_placar();
	
	}
}

void contador_placar(void)
{
    // Detecta borda de descida do SQW (1Hz)
    if (GPIO_ReadInputPin(SQW_PIN_PORT, SQW_PIN) == RESET && last_state == 0)
    {
        last_state = 1;

        if (seg_valor > 0)
        {
            seg_valor--;

            if (seg_valor == 0)
            {
                Contagem_Placar();
                Piscar_Display();   // <--- Pisca 3 vezes ao chegar em zero
               // GPIO_WriteHigh(RELE_PORT, RELE_PIN); // Liga o relé
                //Delay_ms_Timer(1000);
                //GPIO_WriteLow(RELE_PORT, RELE_PIN);  // Desliga o relé
            }
            else
            {
                Contagem_Placar();
            }
        }
        else
        {
            seg_valor = 0;
            Contagem_Placar();
        }
    }
    else if (GPIO_ReadInputPin(SQW_PIN_PORT, SQW_PIN) != RESET && last_state == 1)
    {
        last_state = 0;
    }
}

void Display_Off(void)
{
	// Envia um código BCD inválido (15 = 0b1111) que apaga os segmentos na maioria dos decodificadores.
	WriteBCD(15);

	// Pulsa todos os latches para registrar o estado "apagado" em todos os displays
	GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN);
	GPIO_WriteHigh(LATCH_02_PORT, LATCH_02_PIN);
	GPIO_WriteHigh(LATCH_03_PORT, LATCH_03_PIN);
	GPIO_WriteHigh(LATCH_04_PORT, LATCH_04_PIN);
//  GPIO_WriteHigh(LATCH_05_PORT, LATCH_05_PIN);
//  GPIO_WriteHigh(LATCH_06_PORT, LATCH_06_PIN);
	
	NOP(); NOP(); // Pequena pausa
	
	GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
	GPIO_WriteLow(LATCH_02_PORT, LATCH_02_PIN);
	GPIO_WriteLow(LATCH_03_PORT, LATCH_03_PIN);
	GPIO_WriteLow(LATCH_04_PORT, LATCH_04_PIN);
//  GPIO_WriteLow(LATCH_05_PORT, LATCH_05_PIN);
//  GPIO_WriteLow(LATCH_06_PORT, LATCH_06_PIN);
}

void Piscar_Display(void)
{
	uint8_t i;
	for (i = 0; i < 3; i++)
	{
		// Apaga os dígitos
		Display_Off();
		Delay_ms_Timer(500);  // Espera 300ms

		// Mostra os dígitos novamente
		Contagem_Placar();
		Delay_ms_Timer(500);  // Espera 300ms
	}
}


// ============================================================================
// INICIALIZAÇÃO DO I2C
// ============================================================================
void I2C_Init_DS1307(void)
{
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);

	I2C_DeInit();
	I2C_Init(100000, DS1307_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
	I2C_Cmd(ENABLE);
}

// ============================================================================
// FUNÇÕES PARA O DS1307
// ============================================================================
void DS1307_Write(uint8_t reg, uint8_t data)
{
	I2C_GenerateSTART(ENABLE);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

	I2C_Send7bitAddress(DS1307_ADDRESS, I2C_DIRECTION_TX);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

	I2C_SendData(reg);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	I2C_SendData(data);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	I2C_GenerateSTOP(ENABLE);
}

uint8_t DS1307_Read(uint8_t reg)
{
	uint8_t value;

	I2C_GenerateSTART(ENABLE);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

	I2C_Send7bitAddress(DS1307_ADDRESS, I2C_DIRECTION_TX);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

	I2C_SendData(reg);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	I2C_GenerateSTART(ENABLE);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

	I2C_Send7bitAddress(DS1307_ADDRESS, I2C_DIRECTION_RX);
	while (!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));

	value = I2C_ReceiveData();
	I2C_AcknowledgeConfig(I2C_ACK_NONE);
	I2C_GenerateSTOP(ENABLE);

	return value;
}

void DS1307_StartOscillator(void) 
{
	uint8_t segundos = DS1307_Read(DS1307_SECONDS_REG);
	if (segundos & 0x80) 
	{ // Verifica se o bit CH (Clock Halt) está em 1
		DS1307_Write(DS1307_SECONDS_REG, segundos & 0x7F); // Zera o bit CH
	}
}

void DS1307_EnableSQW_1Hz(void)
{
	DS1307_Write(DS1307_CTRL_REG, 0x10);  // SQWE=1, RS1=0, RS0=0 ? 1Hz
}

// ============================================================================
// CONTROLE DE BCD E DISPLAY
// ============================================================================
void WriteBCD(uint8_t valor)
{
	if (valor & 0x01) GPIO_WriteHigh(LD_A_PORT, LD_A_PIN); else GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
	if (valor & 0x02) GPIO_WriteHigh(LD_B_PORT, LD_B_PIN); else GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
	if (valor & 0x04) GPIO_WriteHigh(LD_C_PORT, LD_C_PIN); else GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
	if (valor & 0x08) GPIO_WriteHigh(LD_D_PORT, LD_D_PIN); else GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
}

void Contagem_Placar(void)
{
	// --- Escrita nos Displays (Multiplexação) ---
	// A multiplexação deve ser feita em um timer para não travar o código.
	// Para este exemplo, faremos de forma sequencial, o que pode causar
	// um pequeno flicker, mas é funcional para começar.
		
	uint8_t minutos = seg_valor / 60;
	uint8_t segundos = seg_valor % 60;

	seg_unidades  = segundos % 10;
	seg_dezenas   = segundos / 10;
	min_unidades  = minutos % 10;
	min_dezenas   = minutos / 10;

	// Unidades dos segundos
	WriteBCD(seg_unidades);
	GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN);
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);

	// Dezenas dos segundos
	WriteBCD(seg_dezenas);
	GPIO_WriteHigh(LATCH_02_PORT, LATCH_02_PIN);
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_02_PORT, LATCH_02_PIN);

	// Unidades dos minutos
	WriteBCD(min_unidades);
	GPIO_WriteHigh(LATCH_03_PORT, LATCH_03_PIN);
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_03_PORT, LATCH_03_PIN);

	// Dezenas dos minutos
	WriteBCD(min_dezenas);
	GPIO_WriteHigh(LATCH_04_PORT, LATCH_04_PIN);
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_04_PORT, LATCH_04_PIN);
	
	// CONTADOR 24S E 14S
	
	unidade = tempo_restante % 10;
	dezena = tempo_restante / 10;
	
	WriteBCD(unidade);
	GPIO_WriteHigh(LATCH_05_PORT, LATCH_05_PIN);
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_05_PORT, LATCH_05_PIN);	
	
	WriteBCD(dezena);
	GPIO_WriteHigh(LATCH_06_PORT, LATCH_06_PIN);
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_06_PORT, LATCH_06_PIN);	
	
}

void InitGPIO(void)
{
	// Pinos BCD
	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_Init(RELE_PORT, RELE_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_Init(Cadastro_PORT, Cadastro_PIN, GPIO_MODE_IN_PU_NO_IT);
	
	// Pinos de Latch
	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_03_PORT, LATCH_03_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_04_PORT, LATCH_04_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_Init(LATCH_05_PORT, LATCH_05_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_06_PORT, LATCH_06_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Pino de entrada do pulso do RTC (com interrupção)
	GPIO_Init(SQW_PIN_PORT, SQW_PIN, GPIO_MODE_IN_FL_IT);
}

void setup_tim6(void)
{
	// 1. Habilitar o clock do TIM6
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, ENABLE);

	// 2. Configurar o Prescaler para 64 (TIM6_PRESCALER_64)
	TIM6_PrescalerConfig(TIM6_PRESCALER_64, TIM6_PSCRELOADMODE_IMMEDIATE);

	// 3. Configurar o valor do período (ARR) para 249
	// A interrupção ocorrerá a cada 1ms
	TIM6_SetCounter(0); // Zera o contador
	TIM6_SetAutoreload(249);

	// 4. Habilitar a interrupção do tipo "Update"
	TIM6_ITConfig(TIM6_IT_UPDATE, ENABLE);

	// 5. Habilitar o temporizador
	TIM6_Cmd(ENABLE);

	// 6. Habilitar as interrupções globais no main.c, se ainda não o fez
	// A chamada 'enableInterrupts()' ou 'rim()' deve estar no seu main()
}

void Delay_ms_Timer(uint16_t ms)
{
	while(ms--)
	{
		TIM6_SetCounter(0);
		TIM6_ClearFlag(TIM6_FLAG_UPDATE);
		while(TIM6_GetFlagStatus(TIM6_FLAG_UPDATE) == RESET);
	}
}
