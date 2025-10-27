/* Meu novo main.c para o placar com latches */

// A biblioteca principal do STM8S, sempre necessária.
#include "stm8s.h"
#include "stm8s_tim6.h" // Para o nosso relógio "System Tick" de 1ms

// ============================================================================
// DEFINIÇÕES DE HARDWARE 
// ============================================================================


// --- Pinos de Seleção dos Dígitos (ativo-baixo) ---
// Ligam e desligam cada um dos 8 dígitos individualmente.
// Mapeamento corrigido de acordo com o seu arquivo waiter.asm

// --- Pinos Latch (Saída) ---
// Display 1 (Dígitos da Dezena e Unidade)
#define DIGIT_1_PORT    GPIOE
#define DIGIT_1_PIN     GPIO_PIN_5  // Unidade
#define DIGIT_2_PORT    GPIOC
#define DIGIT_2_PIN     GPIO_PIN_1  // Dezena


// --- Pinos Botões (Entrada) ---
#define BOTAO_1_PORT	GPIOB
#define BOTAO_1_PIN		GPIO_PIN_7

#define	BOTAO_2_PORT	GPIOF
#define BOTAO_2_PIN		GPIO_PIN_4

// --- Pinos BCD (Saída) ---
// Pinos comuns compartilhados para o decodificador
#define BCD_PORT			GPIOB

#define BCD_A_PIN			GPIO_PIN_0 // LD_A
#define BCD_B_PIN			GPIO_PIN_1 // LD_B
#define BCD_C_PIN			GPIO_PIN_2 // LD_C
#define BCD_D_PIN			GPIO_PIN_3 // LD_D

// ==============================================================================
// DEFINIÇÕES - LÓGICA
// ==============================================================================

// Tempo em milissegundos para o debounce do botão
#define DEBOUNCE_MS     50 

// Macro para NOP (usada no pulso do latch)
#define NOP() _asm("nop")

// ============================================================================
// VARIÁVEIS GLOBAIS
// ============================================================================

/* * O relógio global. 
 * 'volatile' é CRUCIAL: diz ao compilador que esta variável pode
 * mudar a qualquer momento (pela interrupção do TIM6), então ele
 * não deve "otimizar" a leitura dela.
 */
 
volatile uint32_t g_system_ticks = 0;

// Contadores para os displays
uint8_t g_contador_1 = 0;
uint8_t g_contador_2 = 0;


/* * Flags de "trabalho sujo". Quando um botão muda um contador,
 * ele levanta a flag. O main() vê a flag e atualiza o display.
 * Começa em TRUE para forçar uma atualização no boot.
 */
 
bool g_display_1_atualizar = TRUE;
bool g_display_2_atualizar = TRUE;

// Definição dos estados possíveis para Estado de Máquina (FSM) dos Botões
typedef enum 
{
	ESTADO_SOLTO,
	ESTADO_AGUARDANDO,
	ESTADO_PRESSIONADO
}BotaoEstado_t;


// ============================================================================
// PROTÓTIPOS DE FUNÇÕES
// ============================================================================

// Funções de Inicialização
void InitGPIO(void);
void InitCLOCK(void);
void setup_tim6(void);

// Função Utilitária
void WriteBCD(uint8_t valor);

// Funções de Lógica do Loop
void GerenciarBotoes(void);
void AtualizarDisplays(void);

// ============================================================================
// FUNÇÃO PRINCIPAL
// ============================================================================
void main(void)
{
    // 1. Inicializa os periféricos
    InitCLOCK();		// Configura o clock da CPU para 16MHz (do HSI interno)
    InitGPIO();			// Configura todos os pinos de Entrada (botões) e Saída (BCD, Latches)
		setup_tim6();		// Configura e liga o TIM6 para gerar uma interrupção a cada 1ms
		
		// Habilita as interrupções globais. Sem isso, o TIM6 não funciona!
    rim(); // enableInterrupts(); // "Request Interrupt Master"
    
    // 2. Loop principal para multiplexação
    while (1)
    {
			// Tarefa 1: Verificar se os botões foram apertados
			GerenciarBotoes();
			
			// Tarefa 2: Se um botão mudou um valor, atualizar o display
			AtualizarDisplays();
    }
}

// ============================================================================
// FUNÇÕES DE INICIALIZAÇÃO
// ============================================================================

void InitGPIO(void)
{
	// --- Entradas ---
	// Modo "Input, Pull-Up, No Interrupt".
	// Pull-Up significa que o pino lê '1' (HIGH) quando solto
	// e '0' (LOW) quando pressionado (pois o botão aterra o pino).
	
	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT); // RF
	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); // CH1
	GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // CH2

	// --- Saídas ---
	// Pinos de dados (Barramento BCD) - Inicializados em nível baixo
	// Começam em LOW (0) e são Push-Pull (forte)
	GPIO_Init(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Pinos de LATCCHES dos displays - Inicializados em nível ALTO (desligados)
	GPIO_Init(GPIOC, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
	
	// Pinos dos LEDs da fila
	// Começam em LOW (0) e são Push-Pull (forte)
	GPIO_Init(GPIOD, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
	
	// Pino do Buzzer
	GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
}

void InitCLOCK(void)
{
	// Reseta o clock para o padrão
	CLK_DeInit();
	
	// Configura o HSI (High Speed Internal) para 16MHz
	// e o prescaler da CPU para 1 (CPU roda a 16MHz)
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
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

// ---------------------- Função para Escrever um Valor BCD --------------------------
// Converte um valor decimal (0-9) para sua representação BCD de 4 bits
// e define os estados dos pinos LD_A a LD_D de acordo.
void WriteBCD(uint8_t valor)
{
	// Verifica cada bit do 'valor' e define o pino correspondente como HIGH ou LOW.
	// Ex: se valor é 5 (0101 binário), LD_A e LD_C serão HIGH, LD_B e LD_D serão LOW.
	if(valor & 0x01) GPIO_WriteHigh(BCD_PORT, BCD_A_PIN); else GPIO_WriteLow(BCD_PORT, BCD_A_PIN); // Bit 0 (1)
	if(valor & 0x02) GPIO_WriteHigh(BCD_PORT, BCD_B_PIN); else GPIO_WriteLow(BCD_PORT, BCD_B_PIN); // Bit 1 (2)
	if(valor & 0x04) GPIO_WriteHigh(BCD_PORT, BCD_C_PIN); else GPIO_WriteLow(BCD_PORT, BCD_C_PIN); // Bit 2 (4)
	if(valor & 0x08) GPIO_WriteHigh(BCD_PORT, BCD_D_PIN); else GPIO_WriteLow(BCD_PORT, BCD_D_PIN); // Bit 3 (8)
}

// ==============================================================================
// IMPLEMENTAÇÃO - FUNÇÕES DE LÓGICA
// ==============================================================================

void GerenciarBotoes(void)
{
	// --- Variáveis "static" guardam seu valor entre as chamadas da função ---
	static BotaoEstado_t s_estado_b1 = ESTADO_SOLTO;
	static uint32_t s_tempo_b1 = 0;
	
	static BotaoEstado_t s_estado_b2 = ESTADO_SOLTO;
	static uint32_t s_tempo_b2 = 0;

	bool b1_pressionado = FALSE; 
	bool b2_pressionado = FALSE; 
		
	// Pega o tempo atual UMA vez (otimização)
	uint32_t tempo_atual = g_system_ticks;

	// --- MÁQUINA DE ESTADOS: BOTÃO 1 ---
	b1_pressionado = (GPIO_ReadInputPin(BOTAO_1_PORT, BOTAO_1_PIN) == 0);
	
	switch (s_estado_b1)
	{
		case ESTADO_SOLTO:
			if (b1_pressionado) {
				s_estado_b1 = ESTADO_AGUARDANDO;
				s_tempo_b1 = tempo_atual; // Marca o tempo do aperto
			}
		break;
				
		case ESTADO_AGUARDANDO:
			if (!b1_pressionado) {
				// Usuário soltou antes do debounce. Foi só um ruído.
				s_estado_b1 = ESTADO_SOLTO;
			} 
			else if (tempo_atual - s_tempo_b1 >= DEBOUNCE_MS) {
				// Apertado pelo tempo certo! É um aperto válido.
				s_estado_b1 = ESTADO_PRESSIONADO;
				
				// === EXECUTA A AÇÃO UMA ÚNICA VEZ ===
				g_contador_1++;
				if (g_contador_1 > 9) g_contador_1 = 0; // Gira de 0-9
				g_display_1_atualizar = TRUE; // Avisa o main() para atualizar
			}
		break;
				
		case ESTADO_PRESSIONADO:
			if (!b1_pressionado) {
				// Usuário finalmente soltou
				s_estado_b1 = ESTADO_SOLTO;
			}
			break;
	}
	
	// --- MÁQUINA DE ESTADOS: BOTÃO 2 --
	b2_pressionado = (GPIO_ReadInputPin(BOTAO_2_PORT, BOTAO_2_PIN) == 0);
	
	switch (s_estado_b2)
	{
		case ESTADO_SOLTO:
			if (b2_pressionado) 
			{
				s_estado_b2 = ESTADO_AGUARDANDO;
				s_tempo_b2 = tempo_atual;
			}
		break;
				
		case ESTADO_AGUARDANDO:
			if (!b2_pressionado) 
			{
				s_estado_b2 = ESTADO_SOLTO;
			} 
			else if (tempo_atual - s_tempo_b2 >= DEBOUNCE_MS) 
			{
				s_estado_b2 = ESTADO_PRESSIONADO;
				
				// === EXECUTA A AÇÃO UMA ÚNICA VEZ ===
				g_contador_2++;
				if (g_contador_2 > 9) g_contador_2 = 0;
				g_display_2_atualizar = TRUE;
			}
		break;
				
		case ESTADO_PRESSIONADO:
			if (!b2_pressionado) 
			{
				s_estado_b2 = ESTADO_SOLTO;
			}
		break;
	}
}

void AtualizarDisplays(void)
{
	// Verifica se o Display 1 (LATCH_01) precisa ser atualizado
	if (g_display_1_atualizar) 
	{
		g_display_1_atualizar = FALSE; // Baixa a flag
		
		WriteBCD(g_contador_1); // Coloca o dado BCD nos pinos
		
		// Pulsa o Latch 1 (High -> Pausa -> Low)
		GPIO_WriteHigh(DIGIT_1_PORT, DIGIT_1_PIN);
		NOP(); NOP(); NOP(); // Pausa minúscula para o latch (MC14543B)
		GPIO_WriteLow(DIGIT_1_PORT, DIGIT_1_PIN);
	}
	
	// Verifica se o Display 2 (LATCH_02) precisa ser atualizado
	if (g_display_2_atualizar) 
	{
		g_display_2_atualizar = FALSE;
		
		WriteBCD(g_contador_2);
		
		// Pulsa o Latch 2
		GPIO_WriteHigh(DIGIT_2_PORT, DIGIT_2_PIN);
		NOP(); NOP(); NOP();
		GPIO_WriteLow(DIGIT_2_PORT, DIGIT_2_PIN);
	}
}
