/* MAIN.C file - STM8S903K3
 * Desenvolvimento de contagem não bloquente 
 * 
 * Este programa configura um microcontrolador STM8S903K3 para controlar
 * dois displays BCD de 7 segmentos. Ele permite iniciar contagens regressivas
 * de 14 ou 24 segundos através de botões, com feedback de áudio (buzzer)
 * e visual (piscar os displays) ao final de cada contagem.
 * A comunicação com os displays BCD é feita através de pinos de dados e latches.
 *
 * Versão atual: Contagem Não Bloquente (com interrupção).
 *
 * Copyright (c) 2002-2005 STMicroelectronics
 */


// ---------- Bibliotecas ---------- //

#include "stm8s.h"           // Biblioteca principal da SPL. Contém definições gerais para STM8.
#include "stm8s903k.h"       // Definições específicas do seu modelo de MCU (STM8S903K3).
#include "stm8s_tim4.h"      // Biblioteca da SPL para o Timer 4. Usado para gerar interrupções de tempo.
#include "stm8s_itc.h"       // Biblioteca da SPL para o Controlador de Interrupção (ITC). Usado para prioridades de interrupção.


// ---------- Definição da Pinagem --------- //
// Macros para associar nomes legíveis a pinos específicos do microcontrolador.

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

// Pino para o Buzzer
#define BUZZER_PORT		GPIOD
#define BUZZER_PIN		GPIO_PIN_0

// Macro para instrução 'No Operation' (usada para pequenos atrasos de ciclo de clock ou debouncing).
// 'NOP' significa que a CPU não faz nada por um ciclo de clock.
#define NOP() _asm("nop")

// ---------- Variáveis Globais ---------

// Variáveis declaradas fora de qualquer função. Elas são acessíveis por todas as funções.
// 'volatile' é crucial: informa ao compilador que o valor dessas variáveis pode mudar
// a qualquer momento por algo externo (neste caso, a Rotina de Serviço de Interrupção - ISR).
// Isso impede que o compilador faça otimizações que poderiam usar valores "antigos" da variável.

volatile uint8_t tempo_restante = 0;		// Armazena o valor atual da contagem regressiva
volatile uint8_t em_contagem = 0;		// Flag(Sinalizador): 1 se a contagem ativa, 0 se não
volatile uint8_t contador_ms = 0;		// Cotador milessegundos. Incrementado no IRS a cada 1ms
																		// Quando chega a 1000ms 1 segundo se passou

// Variáveis para a sequência de finalização (piscar displays e buzzer)
volatile uint8_t fim_contagem_estado = 0;		//variável de estado 
																						// 0 = inativo, >0 = estado atual da sequência (1 a 6).
volatile uint8_t contador_ms_sequencia = 0; // Contador de milissegundos para controlar o tempo de cada estado da sequência.



main()
{
	while (1);
}