/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "stm8s903k3.h"
#include "stm8s_tim5.h"
#include "stm8s_itc.h"

#define LED_ON GPIO_WriteHigh(GPIOD, GPIO_PIN_0)
#define LED_OFF GPIO_WriteLow(GPIOD, GPIO_PIN_0)

// Intervalo do pisca em milissegundos
#define BLINK_INTERVAL_MS = 500

// ==============================================================================
// DEFINIÇÃO DOS ESTADOS DA MÁQUINA
// ==============================================================================

typedef enum
{
	STATE_LED_APAGADO,
	STATE_LED_ACESO
} LedState_t;

// ==============================================================================
// VARIÁVEIS GLOBAIS
// ==============================================================================

// "Coração" do sistema: contador de milissegundos incrementado pelo timer.
// 'volatile' é OBRIGATÓRIO para garantir que o compilador sempre leia o valor da memória.
volatile uint32_t system_ticks = 0;

// Variável que guarda o estado atual da nossa máquina. Começa em APAGADO.
volatile LedState_t led_state = STATE_LED_APAGADO;

// Variável para nosso "agendador de tarefas"
static uint32_t tempo_ultima_troca = 0;

// ==============================================================================
// PROTÓTIPOS
// ==============================================================================

void TIM5_Config(void);
void GPIO_Init(void);

// ==============================================================================
// FUNÇÃO PRINCIPAL COM A LÓGICA DA MÁQUINA DE ESTADOS
// ==============================================================================

main()
{
	// Roda o microcontrolador a 16MHz
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	
	//GPIO_Init();
		
	// Inicia o timer e habilita as interrupções globais
	TIM5_Config();
	enableInterrupts();
	
	while (1)
	{
		// O coração da nossa lógica: um switch que executa o código
		// do estado em que o sistema se encontra no momento.
		switch(led_state)
		{
			case STATE_LED_APAGADO:
				// Mantém o LED apagado
				// Evento de Transição: Já passaram 500 ms?
				if(system_ticks - tempo_ultima_troca >= BLINK_INTERVAL_MS)
				{
					// 1. Executa a AÇÃO da transição: Acender o LED
					LED_ON;
					
					// 2. "Zera" o nosso cronômetro para a próxima contagem
					tempo_ultima_troca = system_ticks;
					
					// 3. Executa a TRANSIÇÃO: Muda para o próximo estado
					led_state = STATE_LED_ACESO;
				}
			break; // Fim do code apagado
			
			case STATE_LED_ACESO:
				// Manter o LED aceso
				// Evento de Transição: Já passaram 500 ms?
				if(system_ticks - tempo_ultima_troca >= BLINK_INTERVAL_MS)
				{
					// 1. Executa a AÇÃO da transição: Apagar o LED
					LED_OFF;
					
					// 2. "Zera" o nosso cronômetro
					tempo_ultima_troca = system_ticks;
					
					// 3. Executa a TRANSIÇÃO: Volta para o estado inicial
					led_state = STATE_LED_APAGADO;
				}
			break;
			
			default:
				// Caso a variável de estado por algum motivo tenha um valor inválido,
				// forçamos ela a voltar para um estado conhecido e seguro
				led_state = STATE_LED_APAGADO;
		}
	}
}

void GPIO_Init(void)
{
	// Configura o pino do LED como saída
	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);

}

void TIM5_Config(void) {
    // Habilita o clock para o periférico TIM5
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER5, ENABLE);

    // Configura o TIM5 para gerar uma interrupção a cada 1ms
    // Clock principal (f_master) = 16MHz
    // Prescaler = 16 -> Frequência do contador = 16MHz / 16 = 1.000.000 Hz
    // Período (ARR) = 1000 -> Frequência de interrupção = 1.000.000 Hz / 1000 = 1000 Hz = 1ms
    TIM5_TimeBaseInit(TIM5_PRESCALER_16, 999); // O valor do período é N-1, então 1000-1 = 999

    TIM5_ClearFlag(TIM5_FLAG_UPDATE);
    TIM5_ITConfig(TIM5_IT_UPDATE, ENABLE);
    TIM5_Cmd(ENABLE);
}

// A ISR do TIM5 tem um nome e vetor de interrupção diferente do TIM4
@far @interrupt void TIM5_UPD_OVF_BRK_IRQHandler(void) {
    system_ticks++; // O coração do sistema bate aqui!
    TIM5_ClearITPendingBit(TIM5_IT_UPDATE);
}