/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

# include "stm8s.h"
# include "stm8s903k.h"

// Defiinição dos pinos para acionamento dos SEGMENTOS LEDs
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

main()
{
	InitCLOCK();
	InitGPIO();
	
	// APAGA TODOS OS LEDS
	GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
  GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
  GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
  GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
  GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
  GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
	
	while (1) // Loop infinito principal
	{
		// Laço para exibir os dígitos de 0 a 9 sequencialmente
		for (uint8_t i = 0; i < 10; i++)
		{
			display_digit(i); // Chama a função genérica para exibir o dígito 'i'
			Delay_ms(1000);   // Espera 1 segundo
		}
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

// Função para ativar um delay
void Delay_ms(uint16_t ms)
{
	volatile uint32_t i;
	for (i = 0; i < (16000UL / 1000UL) * ms; i++);
}

// Função para configurar o clock do sistema
void InitCLOCK(void)
{
    CLK_DeInit(); // Reseta a configuração de clock para o padrão

    CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
    CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
    CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)

    // Aguarda até que o HSI esteja estável
    while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);

    CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
    CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)

    // Configura o HSI como fonte principal de clock
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);

    // Desativa periféricos não usados para economizar energia
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
}