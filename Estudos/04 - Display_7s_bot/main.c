/* MAIN.C file
 *
 * Copyright (c) 2002-2005 STMicroelectronics
 */

# include "stm8s.h"
# include "stm8s903k.h" // Inclui o cabeçalho específico para o seu microcontrolador
# include "stm8s_tim4.h" // AGORA INCLUIMOS O CABEÇALHO DO TIMER 4

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

// Protótipos das funções
void InitGPIO(void);
void InitCLOCK(void);

void Delay_ms_Timer(uint16_t ms);
void InitTIM4(void); // PROTÓTIPO AGORA É PARA O TIMER 4

void Display_7s(int SEG);
void contarDigitos(void);
uint8_t ReadButton(void);
void Display_Off(void);


void main()
{
	uint8_t last_button_state = 1; 			// Guarda o último estado lido do botão (1 = solto)
	uint8_t current_button; 					  // Guardará o estado do botão na leitura atual
	uint8_t button_action_pending = 0;	// variável de controle para debounce

	InitCLOCK();    // Inicializa o clock do sistema
 	InitTIM4();     // AGORA CHAMA INITTIM4
 	InitGPIO();     // Inicializa os pinos GPIO para o display e botão
	Display_Off();  // Garante que o display comece apagado

 	while (1)
 	{
		current_button = ReadButton(); 		// Lê o estado atual do botão
		
		// Lógica de debounce para detectar um único pressionamento
		if (last_button_state == 1 && current_button == 0) // Se o botão acabou de ser pressionado
		{
			if (button_action_pending == 0) // Garante que a ação ocorre uma vez por pressionamento
			{
				contarDigitos();            // Chama a função de contagem
				button_action_pending = 1;  // Sinaliza que a ação está pendente
			}	
		}
		
		// Reseta a flag quando o botão é solto
		else if (last_button_state == 0 && current_button == 1) // Se o botão acabou de ser solto
		{
			button_action_pending = 0; // Permite uma nova ação no próximo pressionamento
		}
		
		// Atualiza o estado do botão para a próxima iteração
		last_button_state = current_button;
		Delay_ms_Timer(20); // Pequeno atraso para ajudar no debounce
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

// Função para fazer a contagem dos dígitos no Display
void contarDigitos(void)
{
 	int i; // Variável 'i' declarada aqui para conformidade C89

 	for (i = 0; i < 10; i++)
 	{
 	 	Display_7s(i);        // Exibe o dígito atual
 	 	Delay_ms_Timer(1000); // Espera 1 segundo
 	}
		
	Display_Off(); // Apaga o display após terminar a contagem
}

// Função para apagar todos os segmentos do display (Anodo Comum)
void Display_Off(void)
{
    // Para apagar um display de anodo comum, todos os pinos de segmento devem ser HIGH.
    GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
    GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
    GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
    GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
    GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
    GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
    GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
}

// Configuração dos pinos do segmento e do botão
void InitGPIO(void)
{
	// Configurações para os pinos dos segmentos (saída push-pull, estado inicial LOW)
	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

	// Configura o pino do Botão como entrada com pull-up e sem interrupção externa
	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

// Função para exibir um dígito no display de 7 segmentos (Anodo Comum)
void Display_7s(int SEG)
{
	// Por padrão, para anodo comum, setamos todos os segmentos como HIGH (desligados)
	// e depois ligamos (LOW) apenas os necessários para o dígito.
	GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
	GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
	GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
	GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);

	switch (SEG) {
		case 0: // Digito 0 (todos menos G)
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		break;		
		
		case 1: // Digito 1 (B e C)
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		break;
		
		case 2: // Digito 2 (A, B, G, E, D)
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		break;
		
		case 3: // Digito 3 (A, B, G, C, D)
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		break;
		
		case 4: // Digito 4 (F, G, B, C)
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		break;
		
		case 5: // Digito 5 (A, F, G, C, D)
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		break;
		
		case 6: // Digito 6 (A, F, G, E, C, D)
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		break;
		
		case 7: // Digito 7 (A, B, C)
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		break;
		
		case 8: // Digito 8 (Todos os segmentos)
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		break;
		
		case 9: // Digito 9 (A, B, G, F, C, D)
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		break;
		
		default: // Em caso de número inválido, apaga o display
 	 	Display_Off(); 
		break;
	}
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