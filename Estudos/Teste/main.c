/*
 * ==============================================================================
 * PROJETO: Acionador de LEDs via Rádio Frequência (RF) com Função Toggle
 * ==============================================================================
 *
 * Microcontrolador: STM8S903K3
 * Protocolo de Comunicação RF: HT6P20B
 *
 * Visão Geral da Lógica:
 * Este firmware é projetado para um sistema que recebe sinais de rádio (RF) de
 * um controle remoto (padrão HT6P20B) e usa esses sinais para alternar o estado
 * de três LEDs. O sistema permite o cadastro de novos controles remotos e possui
 * um mecanismo de "cooldown" para evitar que múltiplos comandos sejam executados
 * a partir de um único pacote de sinal RF.
 *
 * Funcionalidades Principais:
 * - Decodificação de Sinal RF: Lê o sinal de rádio através de uma interrupção
 * de timer, decodificando o protocolo HT6P20B.
 * - Armazenamento em EEPROM: Salva o código de um controle remoto na memória
 * EEPROM do microcontrolador para persistência de dados.
 * - Função Toggle: Cada botão do controle remoto aciona uma função que inverte
 * o estado de um LED (ligado/desligado).
 * - Cooldown de RF: Implementa um contador para ignorar sinais repetidos do
 * mesmo pacote RF, garantindo que cada acionamento do controle seja processado
 * apenas uma vez.
 * - Cadastro Simples: Permite cadastrar um novo controle remoto e um código
 * "preset" através de botões físicos.
 * - Feedback ao Usuário: Utiliza LEDs e um buzzer para fornecer feedback visual
 * e sonoro sobre o status do sistema (inicialização, cadastro, comandos).
 *
 * Estrutura do Código:
 * - Inclusão de bibliotecas e definições de pinos.
 * - Variáveis globais para armazenar estados e timers.
 * - Protótipos de funções para organização.
 * - `main()`: A rotina principal, responsável pela inicialização e pelo loop infinito.
 * - Funções auxiliares para configuração (GPIO, Clock, Timers).
 * - Funções de controle de hardware (LEDs, Buzzer).
 * - Funções de lógica de aplicação (Gravação em EEPROM, Busca de Código RF).
 * - Rotina de interrupção do Timer 6 para a leitura RF.
 *
 * ==============================================================================
 */

// Bibliotecas padrão STM8 e protocolo RF
#include "stm8s.h"            // Biblioteca principal do microcontrolador STM8
#include "stm8s903k3.h"       // Definições específicas do modelo STM8S903K3
#include "stm8s_tim1.h"
#include "protocol_ht6p20b.h" // Protocolo para decodificação de comandos RF

// -------------------- Definições de pinos --------------------

// Pinos LE (Latch Enable) para os decodificadores.
#define LATCH_01_PORT		GPIOC	
#define LATCH_01_PIN		GPIO_PIN_4

#define LATCH_02_PORT		GPIOC
#define LATCH_02_PIN		GPIO_PIN_5



// Pinos de Dados BCD (conectados às entradas A, B, C, D do decodificador BCD para 7 segmentos)
// Estes 4 pinos transmitem o valor binário codificado em decimal para o display.

#define BCD_A_ON GPIO_WriteHigh(GPIOB, GPIO_PIN_0)			// Liga Dígito 2 (dezena)
#define BCD_B_ON GPIO_WriteHigh(GPIOB, GPIO_PIN_1)			// Liga Dígito 3 (unidade)
#define BCD_C_ON GPIO_WriteHigh(GPIOB, GPIO_PIN_2)			// Liga Dígito 4 (dezena guichê)
#define BCD_D_ON GPIO_WriteHigh(GPIOB, GPIO_PIN_3)			// Liga Dígito 5 (unidade guichê)

#define BCD_A_OFF GPIO_WriteLow(GPIOB, GPIO_PIN_0)			// Liga Dígito 2 (dezena)
#define BCD_B_OFF GPIO_WriteLow(GPIOB, GPIO_PIN_1)			// Liga Dígito 3 (unidade)
#define BCD_C_OFF GPIO_WriteLow(GPIOB, GPIO_PIN_2)			// Liga Dígito 4 (dezena guichê)
#define BCD_D_OFF GPIO_WriteLow(GPIOB, GPIO_PIN_3)			// Liga Dígito 5 (unidade guichê)

// Buzzer acionado com nível ALTO (padrão sourcing)
#define BUZZER_ON  GPIO_WriteHigh(GPIOC, GPIO_PIN_6)  // Liga buzzer (HIGH = ON)
#define BUZZER_OFF GPIO_WriteLow(GPIOC, GPIO_PIN_6)   // Desliga buzzer (LOW = OFF)

// Leitura de botões com pull-up interno ativado (nível 0 = pressionado)
#define readCh1 GPIO_ReadInputPin(GPIOD, GPIO_PIN_5)  // Botão CH1 - Cadastro RF

// -------------------- Variáveis globais --------------------
// Armazena estado lógico dos LEDs para função toggle
// Armazenam o estado lógico dos LEDs (TRUE = ligado, FALSE = desligado)
// Essenciais para a função de toggle, pois refletem o estado atual sem precisar ler o pino.
bool led1State = FALSE;      // Estado atual do LED1
bool led2State = FALSE;      // Estado atual do LED2
bool led3State = FALSE;      // Estado atual do LED3

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
@eeprom uint8_t codControler[4];  // Código RF cadastrado

// 'volatile' informa ao compilador que o valor pode mudar a qualquer momento
// por uma rotina externa (a interrupção), evitando otimizações indevidas.

volatile uint8_t tempo_restante = 0;	    // Armazena o valor atual da contagem regressiva
volatile uint16_t contador_ms = 0;	    // Contador de milissegundos, incrementado na ISR

// --- NOVAS FLAGS DE CONTROLE (baseadas na lógica Assembly) ---
volatile uint8_t flag_run = 0;              // 0 = Pausado, 1 = Rodando. Controla toda a lógica de tempo.
volatile uint8_t flag_start = 0;            // 0 = Nunca iniciado, 1 = Já iniciado. Permite que o pause só funcione após o primeiro start.

// Variáveis para a sequência de finalização (piscar displays e buzzer)
volatile uint8_t fim_contagem_estado = 0;	    // Máquina de estados da animação final (0 = inativo, >0 = estado atual)
volatile uint16_t contador_ms_sequencia = 0;    // Contador de tempo para a animação

// Macro para instrução 'No Operation' (usada para pequenos atrasos de ciclo de clock ou debouncing).
// 'NOP' significa que a CPU não faz nada por um ciclo de clock.
#define NOP() _asm("nop")


// -------------------- Protótipos de funções --------------------
void InitGPIO(void);
void Delay(uint32_t nCount);
void SetCLK(void);

void BOT_14S(void);
void BOT_24S(void);
void BOT_PAUSE(void);
void ApagarDisplay(void);

void onInt_TM6(void);
void TIM1_Config(void);

void UnlockE2prom(void);
void save_code_to_eeprom(void);
void save_preset_to_eeprom(void);
uint8_t searchCode(void);

void BuzzerBeep(uint16_t duration);
void WriteBCD(uint8_t valor);      // Converte e envia um dígito para os pinos BCD.
void PulseLatch(GPIO_TypeDef* porta, uint8_t pino); // Gera um pulso no pino de latch do display.
void ApagarDisplay(void);          // Apaga todos os segmentos dos displays.
void AtualizarDisplay(uint8_t valor); // Atualiza ambos os displays com um valor de 0 a 99.
void PiscaDisplay(void);

// -------------------- Função principal --------------------

// ==============================================================================
// FUNÇÃO: main()
// ==============================================================================
/*
 * Ponto de entrada do programa.
 *
 * Responsável por:
 * 1. Chamar todas as rotinas de inicialização e configuração (periféricos, clocks).
 * 2. Realizar uma checagem inicial de reset de fábrica (pressionar CH1 no boot).
 * 3. Executar uma rotina de feedback visual com os LEDs.
 * 4. Iniciar o loop infinito (`while(1)`), onde o programa executa sua lógica
 * principal de forma contínua:
 * - Decrementar o timer de cooldown.
 * - Monitorar os botões de cadastro.
 * - Processar comandos RF recebidos.
 *
 * Esta função é o coração do programa, coordenando todas as demais ações.
 */
 
main()
{
		SetCLK();        // Ajusta clock para 16 MHz (máxima velocidade ? leitura RF mais precisa)
    InitGPIO();      // Configura entradas e saídas
    UnlockE2prom();  // Permite gravação na EEPROM
    onInt_TM6();     // Ativa Timer 6 para interrupção periódica usada na leitura RF
		TIM1_Config();
		ITC_SetSoftwarePriority(ITC_IRQ_TIM1_OVF, ITC_PRIORITYLEVEL_1);
		
		enableInterrupts();	
		
	  PiscaDisplay();
    
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
   
    
    // Loop principal do programa. O código dentro deste laço executa
		// continuamente enquanto o microcontrolador estiver energizado.
    while (1)
    {
			// Decrementa o timer de cooldown, permitindo que novos comandos RF
			// sejam processados após o término do período de espera.
			if (rf_cooldown > 0)
			{
					rf_cooldown--;
			}
			
			RF_IN_ON = TRUE; // Habilita leitura RF na leitura da interrupção
			HT_RC_Code_Ready_Overwrite = FALSE; // Reseta flag do protocolo RF
			
			// Controle via botão CH1 - Cadastro de controle RF
			// Lógica de controle para o botão CH1 (Cadastro de Controle RF)
			// Se o botão for pressionado por um tempo suficiente (debounce).
			if (readCh1 == 0)
			{
					if (++debounceCh1 >= 250)
					{
							--debounceCh1;

						 //BuzzerBeep(50000);
						 Delay(200000);
							
							if (Code_Ready == TRUE)
							{
									save_code_to_eeprom(); // Salva o código recebido.
									Code_Ready = FALSE;
									
									BuzzerBeep(100000);
								//  Delay(200000);
							}
							else
							{
									Delay(100000);
							}
					}
			}
			else
			{
					debounceCh1 = 0;	// Reseta o contador se o botão for solto.
			}

			// Verifica se chegou comando RF E se o cooldown já terminou
			if (Code_Ready == TRUE && rf_cooldown == 0)
			{
					searchCode(); // Busca código na EEPROM e executa a ação
					Code_Ready = FALSE;	// Reseta a flag para o próximo comando.
					
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

// ==============================================================================
// FUNÇÃO: BOT_14S ()
// ==============================================================================
/*
 * Inverte o estado do LED1.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Acessa a variável global `led1State`.
 * - Inverte o valor da variável (de TRUE para FALSE ou vice-versa).
 * - Baseado no novo valor da variável, chama a macro `LED1_ON` ou `LED1_OFF`.
 * - Isso garante que o estado lógico e o estado físico do LED estejam sempre
 * sincronizados.
 */
void BOT_14S(void)
{
	tempo_restante = 14;						// Define o tempo inicial da contagem.
	contador_ms = 0;								// Zera o contador de mls para um novo segundo inicial.
	fim_contagem_estado = 0;        // Cancela qualquer animação final que esteja ocorrendo
	flag_start = 1;                 // Habilita o botão de pause
	flag_run = 1;                   // Inicia a contagem na ISR
			
	AtualizarDisplay(tempo_restante);
}

// ==============================================================================
// FUNÇÃO: BOT_24S()
// ==============================================================================
/*
 * Inverte o estado do LED2.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Similar à função ToggleLED1, mas opera sobre a variável `led2State` e as
 * macros de controle do LED2.
 */
void BOT_24S(void)
{
	tempo_restante = 24;						// Define o tempo inicial da contagem.
	contador_ms = 0;								// Zera o contador de mls para um novo segundo inicial.
	fim_contagem_estado = 0;        // Cancela qualquer animação final que esteja ocorrendo
	flag_start = 1;                 // Habilita o botão de pause
	flag_run = 1;                   // Inicia a contagem na ISR
			
	AtualizarDisplay(tempo_restante);
}

// ==============================================================================
// FUNÇÃO: BOT_PAUSE()
// ==============================================================================
/*
 * Inverte o estado do LED3.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Similar à função ToggleLED1, mas opera sobre a variável `led3State` e as
 * macros de controle do LED3.
 */
void BOT_PAUSE(void)
{
	// Só permite pausar se a contagem já tiver sido iniciada alguma vez
	if (flag_start == 1)
	{
		// O "coração" do toggle: inverte o estado da flag de 0 para 1 ou de 1 para 0
		flag_run = !flag_run;

		// Se pausou durante a animação final, garante que o buzzer desligue
		if (flag_run == 0 && fim_contagem_estado > 0)
		{
			BuzzerBeep(100000);
		}
	}
}

// ==============================================================================
// FUNÇÃO: BuzzerBeep()
// ==============================================================================
/*
 * Gera um som no buzzer por um período de tempo.
 *
 * Parâmetros:
 * - `duration`: Um valor `uint16_t` que representa a duração do beep em unidades
 * da função de delay (um valor maior resulta em um som mais longo).
 *
 * Lógica:
 * - Liga o buzzer usando a macro `BUZZER_ON`.
 * - Chama a função `Delay()` com a duração especificada.
 * - Desliga o buzzer usando a macro `BUZZER_OFF`.
 * A função é bloqueante, ou seja, o microcontrolador não executa outras
 * tarefas enquanto o atraso está ativo.
 */
void BuzzerBeep(uint16_t duration)
{
    BUZZER_ON;
    Delay(duration);
    BUZZER_OFF;
}

// ==============================================================================
// FUNÇÃO: save_code_to_eeprom()
// ==============================================================================
/*
 * Salva o código RF recebido na EEPROM, na posição padrão de controle.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Idêntica à função `save_preset_to_eeprom()`, mas é chamada por um
 * evento diferente (pressionar o botão CH1).
 * - Copia os 4 bytes do `RF_CopyBuffer` para a EEPROM.
 */
void save_code_to_eeprom(void)
{
	int i = 0;
	codControler[i]     = RF_CopyBuffer[0];
	codControler[i + 1] = RF_CopyBuffer[1];
	codControler[i + 2] = RF_CopyBuffer[2];
	codControler[i + 3] = RF_CopyBuffer[3];
}

// ==============================================================================
// FUNÇÃO: searchCode()
// ==============================================================================
/*
 * Compara o código RF recebido com o código salvo na EEPROM e executa a ação.
 *
 * Parâmetros: Nenhum.
 * Retorno: `uint8_t` (0 para sucesso, 1 para falha).
 *
 * Lógica:
 * 1. Isola o ID do controle remoto: Aplica uma máscara (`& 0xFC`) para ignorar
 * os bits que correspondem aos botões do controle, comparando apenas o ID
 * único do controle remoto.
 * 2. Valida o ID: Compara os 4 bytes do código recebido com os 4 bytes salvos.
 * A comparação do terceiro byte usa a máscara.
 * 3. Identifica o Botão: Se o ID do controle for válido, usa uma máscara
 * diferente (`& 0x03`) para identificar qual botão foi pressionado (1, 2, 3)
 * e chama a função `ToggleLEDx()` correspondente.
 * 4. Feedback: Toca o buzzer para indicar sucesso ou falha na comparação.
 */
uint8_t searchCode(void)
{
	int i = 0;
	uint8_t id_salvo_mascarado;
	uint8_t id_recebido_mascarado;

	// 1. Aplica a máscara para pegar SOMENTE o ID do controle, ignorando os botões.
	id_salvo_mascarado    = codControler[i + 2] & 0xFC;
	id_recebido_mascarado = RF_CopyBuffer[2] & 0xFC;
	
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
			BOT_14S();
			//BuzzerBeep(100000);
		}
		else if ((RF_CopyBuffer[2] & 0x03) == 0x02) // Tecla 2
		{
			BOT_24S();
			//BuzzerBeep(100000);
		}
		else if ((RF_CopyBuffer[2] & 0x03) == 0x03) // Tecla 3 (ou 4 dependendo do controle)
		{
			BOT_PAUSE();
			//BuzzerBeep(30000);
		}
		
		return 0; // Código encontrado e ação executada
	}
	else
	{
		// Código não encontrado
		//BuzzerBeep(15000);
		return 1;
	}
}

// ==============================================================================
// FUNÇÃO: InitGPIO()
// ==============================================================================
/*
 * Inicializa e configura os pinos de entrada e saída.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Configura os pinos dos botões CH1 e CH2 como entradas com pull-up interno
 * (`GPIO_MODE_IN_PU_NO_IT`).
 * - Configura os pinos do buzzer e dos LEDs como saídas `Push-Pull` de alta
 * velocidade (`GPIO_MODE_OUT_PP_LOW_FAST`).
 */
void InitGPIO(void)
{
    // Entradas com pull-up interno
    GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT); // Botão CH1
    GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // Botão CH2
    
    // Saídas
    GPIO_Init(GPIOA, GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PA2: Display | PA3: PWM buzzer
    GPIO_Init(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PB0~PB3: BCD/7Seg
    GPIO_Init(GPIOC, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch
    GPIO_Init(GPIOD, GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch 0
}

// ==============================================================================
// FUNÇÃO: Delay()
// ==============================================================================
/*
 * Função de atraso simples (busy-wait).
 *
 * Parâmetros:
 * - `nCount`: Um valor `uint32_t` para o contador.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Simplesmente decrementa o contador em um loop até que ele chegue a zero.
 * É uma função bloqueante, o microcontrolador não executa outras tarefas
 * enquanto este loop está rodando.
 */
void Delay(uint32_t nCount)
{
    while (nCount != 0)
    {
        nCount--;
    }
}

// ==============================================================================
// FUNÇÃO: SetCLK()
// ==============================================================================
/*
 * Configura o clock principal do microcontrolador.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Escreve `0b00000000` no registrador `CLK_CKDIVR`.
 * - Isso configura o prescaler do clock para não dividir a frequência,
 * resultando na frequência máxima de 16 MHz.
 */
void SetCLK(void)
{
    CLK_CKDIVR = 0b00000000; // Sem divisão, máxima frequência
}

// ==============================================================================
// FUNÇÃO: UnlockE2prom()
// ==============================================================================
/*
 * Destrava a memória EEPROM para gravação.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Chama a função `FLASH_Unlock()` da biblioteca STM8 com o tipo de memória
 * `FLASH_MEMTYPE_DATA`.
 * - Isso desprotege a EEPROM contra escritas acidentais, permitindo que a
 * função `save_code_to_eeprom()` grave dados nela.
 */
void UnlockE2prom(void)
{
    FLASH_Unlock(FLASH_MEMTYPE_DATA);
}

// ==============================================================================
// FUNÇÃO: onInt_TM6()
// ==============================================================================
/*
 * Configura o Timer 6 para gerar interrupções periódicas.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Habilita o Timer 6 (`TIM6_CR1`).
 * - Habilita a interrupção do timer (`TIM6_IER`).
 * - Configura o prescaler (`TIM6_PSCR`) e o valor de recarga (`TIM6_ARR`)
 * para que a interrupção ocorra a cada 50 microssegundos. Este é o intervalo
 * necessário para a decodificação precisa do protocolo RF HT6P20B.
 * - Limpa a flag de status (`TIM6_SR`).
 * - Habilita as interrupções globais com a instrução de assembly `RIM`.
 */
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

// ==============================================================================
// FUNÇÃO: TIM6_UPD_IRQHandler
// ==============================================================================
/*
 * Rotina de Tratamento de Interrupção do Timer 6.
 *
 * Parâmetros: Nenhum.
 * Retorno: Nenhum.
 *
 * Lógica:
 * - Esta função é executada automaticamente pelo hardware do STM8 a cada
 * 50 microssegundos, conforme configurado em `onInt_TM6()`.
 * - Ela verifica a flag global `RF_IN_ON`.
 * - Se a flag estiver ativada, a função `Read_RF_6P20()` é chamada para
 * processar o sinal RF vindo da antena.
 * - Finalmente, a flag de interrupção do timer é limpa (`TIM6_SR = 0`)
 * para que a próxima interrupção possa ocorrer.
 */
@far @interrupt void TIM6_UPD_IRQHandler (void)
{
    if(RF_IN_ON)
    {
        Read_RF_6P20(); // Decodifica sinal RF recebido pela antena
    }
    TIM6_SR = 0;
}

// ---------- Função de Configuração do Timer 1 (TIM1) -----------
// Configura o TIM1 para gerar uma interrupção em um intervalo de tempo específico.
void TIM1_Config(void)
{
	// 1. Desinicializa o TIM1 para garantir um estado limpo.
	TIM1_DeInit();
	
	// 2. Habilita o clock do periférico TIM1.
	// Esta linha é essencial para que o TIM1 tenha energia e comece a funcionar.
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	
	// 3. Configura a base de tempo.
	// O clock do TIM1 é derivado do clock principal do microcontrolador (f_CPU).
	// Assumindo que f_CPU = 16MHz, o prescaler divide este clock.
	//
	// TIM1_TimeBaseInit(Prescaler, ModoContador, Periodo, RepetitionCounter)
	// - Prescaler: 128. O clock do timer será (16.000.000 / 128) = 125.000 Hz.
	// - Periodo (valor de recarga): 124. A interrupção ocorre quando o contador atinge 124.
	// - A frequência da interrupção é: (125.000 Hz) / (124 + 1) = 1000 Hz.
	// - Isso significa que a interrupção ocorre a cada 1ms.
	TIM1_TimeBaseInit(128, TIM1_COUNTERMODE_UP, 124, 0);

	// 4. Habilita a interrupção de atualização (overflow).
	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);

	// 5. Inicia o Timer 1.
	TIM1_Cmd(ENABLE);
}

// ---------- Rotina de Interrupção (ISR) do Timer 1 -----------
// Esta função é executada quando o TIM1 atinge seu valor de recarga.
// O manipulador de interrupção para o Timer 1 é o vetor 24.
@far @interrupt void TIM1_UPD_IRQHandler (void)
{
	// 1. Limpa a flag da interrupção do Timer 1 (obrigatório).
	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
	
	// 2. O "PORTÃO": Se a flag_run for 0 (pausado), não faz mais nada.
	// Pausa tanto a contagem normal quanto a animação final.
	if (flag_run == 0)
	{
		return; // Sai da interrupção imediatamente.
	}
	
	// ---- O CÓDIGO ABAIXO SÓ É EXECUTADO SE flag_run == 1 ----
	
	// Lógica de contagem principal (só executa antes da animação final)
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
			
			if (tempo_restante == 0) // Transição para a animação final
			{
				// A flag_run continua em 1 para permitir que a animação (que é baseada em tempo) rode.
				// O botão de pause poderá pausar a animação.
				fim_contagem_estado = 1;
				contador_ms_sequencia = 0;
				//BUZZER_ON;
				//Delay(300000);
				//BUZZER_OFF;
			}
		}
	}
	
	// Sequenciador de Finalização (só executa quando ativado)
	if(fim_contagem_estado > 0)
	{
		// Reseta todas as flags para o estado inicial
		fim_contagem_estado = 0;
		flag_run = 0;
		flag_start = 0;
	}
		
		
}
void WriteBCD(uint8_t valor)
{
	(valor & 0x01) ? BCD_A_ON : BCD_A_OFF;
	(valor & 0x02) ? BCD_B_ON : BCD_B_OFF;
	(valor & 0x04) ? BCD_C_ON : BCD_C_OFF;
	(valor & 0x08) ? BCD_D_ON : BCD_D_OFF;
}

void PulseLatch(GPIO_TypeDef* porta, uint8_t pino)
{
	GPIO_WriteHigh(porta, pino);
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(porta, pino);
}


void AtualizarDisplay(uint8_t valor)
{
	uint8_t unidades = valor % 10;
	uint8_t dezenas = valor / 10;
	
	WriteBCD(unidades);
	PulseLatch(LATCH_01_PORT, LATCH_01_PIN);
	
	WriteBCD(dezenas);
	PulseLatch(LATCH_02_PORT, LATCH_02_PIN);
}

void ApagarDisplay(void)
{
	BCD_A_ON;
	BCD_B_ON;
	BCD_C_ON;
	BCD_D_ON;
	PulseLatch(LATCH_01_PORT,LATCH_01_PIN);
	PulseLatch(LATCH_02_PORT,LATCH_02_PIN);
}

void PiscaDisplay(void)
{
	AtualizarDisplay(0);
	Delay(200000);
	ApagarDisplay();
	Delay(200000);
	AtualizarDisplay(0);
	Delay(200000);
	ApagarDisplay();
	Delay(200000);
	AtualizarDisplay(0);
}