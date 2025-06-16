/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "stm8s903k.h"
#include "stm8s_tim4.h"

// Define os Pinos LD de comunicação on/off
#define LATCH_01_PORT				GPIOC
#define LATCH_01_PIN				GPIO_PIN_2

#define LATCH_02_PORT				GPIOC
#define LATCH_02_PIN				GPIO_PIN_1

// MPinos comuns compartilhados
#define LD_A_PORT			GPIOB
#define LD_A_PIN			GPIO_PIN_0

#define LD_B_PORT			GPIOB
#define LD_B_PIN			GPIO_PIN_1

#define LD_C_PORT			GPIOB
#define LD_C_PIN			GPIO_PIN_2

#define LD_D_PORT			GPIOB
#define LD_D_PIN			GPIO_PIN_3

#define setA					GPIO_WriteHigh(LD_A_PORT, LD_A_PIN)


// Protótipo das funções
void InitCLOCK(void);
void InitGPIO(void);

void CONTAGEM (void);
void pulseLatch(void);

// Timer 4
void Delay_ms_Timer(uint16_t ms);
void InitTIM4(void); 


main()
{
	InitCLOCK();
	InitTIM4();     
	InitGPIO();
	
	while (1)
	{
	CONTAGEM();
	/*GPIO_WriteLow(LD_A_PORT, LD_A_PIN);   	// A = 0
	GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);  		// B = 1
	GPIO_WriteLow(LD_C_PORT, LD_C_PIN);   	// C = 0
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 0*/

	}
}

//--------------------------------------------------------------------------------------------------
// Implementação das Funções
//--------------------------------------------------------------------------------------------------

void pulseLatch(void)
{
    GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
    Delay_ms_Timer(1);
    GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN);
    Delay_ms_Timer(1);
    GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
}

void CONTAGEM (void)
{
	
	// N°0 --- bx0000
	GPIOdataDigito = unidade;
	GPIO_WriteLow(LD_A_PORT, LD_A_PIN);			// A = 0
	GPIO_WriteLow(LD_B_PORT, LD_B_PIN); 	  // B = 0
	GPIO_WriteLow(LD_C_PORT, LD_C_PIN);     // C = 0
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  		// D = 0
//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°1 --- bx0001
	GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);   	// A = 1
	GPIO_WriteLow(LD_B_PORT, LD_B_PIN);  	// B = 0
	GPIO_WriteLow(LD_C_PORT, LD_C_PIN);		// C = 0
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 0
	//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°2 --- bx0010
	GPIO_WriteLow(LD_A_PORT, LD_A_PIN);   	// A = 0
	GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);  		// B = 1
	GPIO_WriteLow(LD_C_PORT, LD_C_PIN);   	// C = 0
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 0
	//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°3 --- bx0011
	GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);   	// A = 1
	GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);  		// B = 1
	GPIO_WriteLow(LD_C_PORT, LD_C_PIN);   	// C = 0
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 0
	//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°4 --- bx0100
	GPIO_WriteLow(LD_A_PORT, LD_A_PIN);   	// A = 0
	GPIO_WriteLow(LD_B_PORT, LD_B_PIN);  	// B = 0
	GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);   	// C = 1
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 0
	//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°5 --- bx0101
	GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);   	// A = 1
	GPIO_WriteLow(LD_B_PORT, LD_B_PIN);  	// B = 0
	GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);   	// C = 1
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 0
	//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°6 --- bx0110
	GPIO_WriteLow(LD_A_PORT, LD_A_PIN);   	// A = 0
	GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);  		// B = 1
	GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);   	// C = 1
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 0
	//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°7 --- bx0111
	GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);   	// A = 1
	GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);  		// B = 1
	GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);   	// C = 1
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 0
	//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°8 --- bx1000
	GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);   	// A = 0
	GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);  		// B = 0
	GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);   	// C = 0
	GPIO_WriteLow(LD_D_PORT, LD_D_PIN);  	// D = 1
	//pulseLatch();
	Delay_ms_Timer(1000);
	
	// N°9 --- bx1001
	GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);   	// A = 1
	GPIO_WriteLow(LD_B_PORT, LD_B_PIN);  	// B = 0
	GPIO_WriteLow(LD_C_PORT, LD_C_PIN);   	// C = 0
	GPIO_WriteHigh(LD_D_PORT, LD_D_PIN);  		// D = 1
	//pulseLatch();
	Delay_ms_Timer(1000);
	
}

// Função de atraso em milissegundos usando o Timer 4
void Delay_ms_Timer(uint16_t ms)
{
	while(ms--) // Loop para o número de milissegundos
	{
		TIM4_SetCounter(0); 										// Reinicia o contador do timer
		TIM4_ClearFlag(TIM4_FLAG_UPDATE); 			// Limpa a flag de estouro (update event)
		
		// Espera a flag de estouro (update event) ser setada pelo hardware
		// Isso indica que 1ms passou desde o último ClearFlag
		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
	}
}

// Função para inicializar o Timer 4
void InitTIM4(void)
{
	// Configura o prescaler do TIM4
	// Para 16MHz, um prescaler de 128 (16MHz / 128 = 125kHz)
 	// Cada tick do timer será 1/125kHz = 8us
	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
	
	// Define o período (Auto-Reload Register - ARR)
	// Para ter um estouro a cada 1ms (1000us), e cada tick é 8us:
	// 1000us / 8us = 125
	TIM4_SetAutoreload(125); // O timer contará de 0 a 124, estourando em 125 (125 ticks)
	
	// Desativa a interrupção de update (não precisamos de interrupção para este delay)
	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
	
	// Habilita o TIM4
	TIM4_Cmd(ENABLE);
}

void InitGPIO(void)
{
	// Definição para configurar os Pinos para aceender os LEDs
	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	
	// Definiição para configurar os pinos para controlar o LD
	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
}

// Função para configurar o clock do sistema
void InitCLOCK(void)
{
 	CLK_DeInit(); // Reseta a configuração de clock para o padrão

 	CLK_HSECmd(DISABLE); 	// Desativa o oscilador externo (High-Speed External)
 	CLK_LSICmd(DISABLE); 	// Desativa o clock lento interno (Low-Speed Internal)
 	CLK_HSICmd(ENABLE); 	// Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)

 	// Aguarda até que o HSI esteja estável e pronto para uso
 	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

 	CLK_ClockSwitchCmd(ENABLE); 	 	 	 	 	 	 // Habilita a troca de clock automática
 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); 	// Prescaler HSI = 1 (clock total de 16MHz)
 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 	 	 // Prescaler CPU = 1 (CPU também roda a 16MHz)

 	// Configura o HSI como fonte principal de clock
 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

 	// Desativa clocks de periféricos não usados para economizar energia
 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se for usar ADC, habilite.
 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    // CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, ENABLE); // DESABILITADO O CLOCK PARA O TIMER 6
 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);  // HABILITADO O CLOCK PARA O TIMER 4
}
