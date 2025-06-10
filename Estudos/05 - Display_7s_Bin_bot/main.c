/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

# include "stm8s.h"
# include "stm8s903k.h" 
# include "stm8s_tim4.h" 

// Definição dos pinos para acionamento dos SEGMENTOS LEDs (Display de Anodo Comum)
#define SEG_A_PORT			GPIOC
#define SEG_A_PIN			GPIO_PIN_6

#define SEG_B_PORT			GPIOC
#define SEG_B_PIN			GPIO_PIN_7

#define SEG_C_PORT			GPIOD
#define SEG_C_PIN			GPIO_PIN_0

#define SEG_D_PORT			GPIOD
#define SEG_D_PIN			GPIO_PIN_1

#define SEG_E_PORT			GPIOD
#define SEG_E_PIN			GPIO_PIN_2

#define SEG_F_PORT			GPIOD
#define SEG_F_PIN			GPIO_PIN_3

#define SEG_G_PORT			GPIOD
#define SEG_G_PIN			GPIO_PIN_4

// Definir pino do Botão
#define BOTAO_PORT		GPIOC
#define BOTAO_PIN			GPIO_PIN_4


// --- Tabela de Padrões Binários para Dígitos (0-9) ---

// Exemplo: Dígito 0 (a,b,c,d,e,f ON; g,dp OFF)
// Bits:    DP G F E D C B A
// Value:   1  1 0 0 0 0 0 0  (0b11000000 = 0xC0)

const uint8_t digit_patterns[] =
{
//   			  DP GFEDCBA  Hex
    0xC0, // 0b11000000, // 0 - dp,g OFF; a,b,c,d,e,f ON
    0xF9, // 0b11111001, // 1 - dp,a,d,e,f,g OFF; b,c ON
    0xA4, // 0b10100100, // 2 - dp,c,f OFF; a,b,d,e,g ON
    0xB0, // 0b10110000, // 3 - dp,e,f OFF; a,b,c,d,g ON
    0x99, // 0b10011001, // 4 - dp,a,d,e OFF; b,c,f,g ON
    0x92, // 0b10010010, // 5 - dp,b,e OFF; a,c,d,f,g ON
    0x82, // 0b10000010, // 6 - dp,b OFF; a,c,d,e,f,g ON
    0xF8, // 0b11111000, // 7 - dp,d,e,f,g OFF; a,b,c ON
    0x80, // 0b10000000, // 8 - dp OFF; a,b,c,d,e,f,g ON
    0x90  // 0b10010000, // 9 - dp,e OFF; a,b,c,d,f,g ON
};

// Protótipo das funções
void InitCLOCK(void);
void InitGPIO(void);
void Delay_ms(uint16_t ms);
void display_digit(uint8_t digit_value);
void mostrardigitos(void);
uint8_t ReadButton(void);

void Delay_ms_Timer(uint16_t ms);
void InitTIM4(void); 

main()
{
	InitCLOCK();
	InitTIM4();     // AGORA CHAMA INITTIM4
	InitGPIO();
	
	while (1)
	{
		mostrardigitos();
	}
}


//--------------------------------------------------------------------------------------------------
// Implementação das Funções
//--------------------------------------------------------------------------------------------------

// Função para o Botão
// Retorna 0 se o botão estiver pressionado (LOW), 1 se estiver solto (HIGH)
// Assume que o pino do botão está configurado com pull-up (GPIO_MODE_IN_PU_NO_IT)
// e o botão conecta o pino ao GND quando pressionado.
uint8_t ReadButton(void)
{
	// GPIO_ReadInputPin retorna SET (1) se o pino for HIGH, RESET (0) se for LOW.
	// Queremos 0 para "pressionado" (LOW) e 1 para "solto" (HIGH).
	// Então, se o pino é RESET (LOW), a função retorna 1 (true), que invertido é 0.
	// Se o pino é SET (HIGH), a função retorna 0 (false), que invertido é 1.
	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
}

void mostrardigitos(void)
{
	int i;
	// Laço para exibir os dígitos de 0 a 9 sequencialmente
		for (i = 0; i < 10; i++)
		{
			display_digit(i); // Chama a função genérica para exibir o dígito 'i'
			Delay_ms_Timer(1000);   // Espera 1 segundo
		}
}
// Configuração dos pinos do segmento
void InitGPIO(void)
{
	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
}

// Função para exibir o Dígito no display
void display_digit(uint8_t digit_value)
{
    // Declaração de 'pattern' no início da função para compatibilidade C89
    uint8_t pattern;

	// Verifica se o valor é válido (0-9)
	// Se o valor não estiver dentro do intervalo, apaga o display
	if (digit_value > 9)
	{
		GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
		return;
	}

	// Obtém o padrão de bits da tabela para o dígito desejado
	pattern = digit_patterns[digit_value];

	// Controla cada segmento individualmente, usando a lógica de Ânodo Comum (0=ON, 1=OFF)
	// O operador '!' inverte o bit para que 0 no 'pattern' resulte em TRUE (acender)
	// e 1 no 'pattern' resulte em FALSE (apagar).
	// O operador '>> N' desloca o bit N para a posição 0.
	// O operador '& 0x01' isola o bit 0 após o deslocamento.

	// Segmento A (controlado pelo Bit 0 do 'pattern')
	if (!((pattern >> 0) & 0x01))
		{ GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN); }
	else
		{ GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN); }

	// Segmento B (controlado pelo Bit 1 do 'pattern')
	if (!((pattern >> 1) & 0x01))
		{ GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN); }
	else
		{ GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN); }

	// Segmento C (controlado pelo Bit 2 do 'pattern')
	if (!((pattern >> 2) & 0x01))
		{ GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN); }
	else
		{ GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN); }

	// Segmento D (controlado pelo Bit 3 do 'pattern')
	if (!((pattern >> 3) & 0x01))
		{ GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN); }
	else
		{ GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN); }

	// Segmento E (controlado pelo Bit 4 do 'pattern')
	if (!((pattern >> 4) & 0x01))
		{ GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN); }
	else
		{ GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN); }

	// Segmento F (controlado pelo Bit 5 do 'pattern')
	if (!((pattern >> 5) & 0x01))
		{ GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN); }
	else
		{ GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN); }

	// Segmento G (controlado pelo Bit 6 do 'pattern')
	if (!((pattern >> 6) & 0x01))
		{ GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN); }
	else
		{ GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN); }
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