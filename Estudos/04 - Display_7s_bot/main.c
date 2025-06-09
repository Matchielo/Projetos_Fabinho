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

// Definir pino do Botão
#define BOTAO_PORT		GPIOC
#define BOTAO_PIN			GPIO_PIN_4

// Protótipos das funções
void InitGPIO(void);
void Delay_ms(uint16_t ms);
void InitCLOCK(void);
void Display_7s(int SEG);
void contarDigitos(void);
uint8_t ReadButton(void);
void Display_Off(void);


void main()
{
	uint8_t last_button_state = 1; 			// Guarda o último estado lido do botão (1 = solto)
	uint8_t current_button; 					  // Guardará o estado do botão na leitura atual
	uint8_t button_action_pending = 0;	// variável de controle

		InitCLOCK();
    InitGPIO();
		Display_Off();

    while (1)
    {
				current_button = ReadButton(); 		// CB recebe o valor do estado do Botão atual
			
			if (last_button_state == 1 && current_button == 0)
			{
				// Se o botão foi pressionado
				if (button_action_pending == 0) // Garante que a ação ocorre uma vez por pressionamento
				{
					contarDigitos();
					button_action_pending = 1;
				}	
			}
			
			// reseta o flag quando o botão for solto
			else if (last_button_state == 0 && current_button == 1)
			{
				button_action_pending = 0; // permite uma nova ação no próximo pressionamento
				
			}
			
			// **Atualiza o estado do botão para a próxima iteração**
					last_button_state = current_button;
					Delay_ms(20);
    }
}

// Função para o Botão
uint8_t ReadButton(void)
{
	// Le o nível lógico do botão
	// Se estiver pressionado, retorna 0 (RESET). Se estiver solto, retorna 1 (SET)
	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
}
// Função Laço for para fazer a contagem do Display
void contarDigitos(void)
{
    // A variável 'i' deve ser declarada aqui, dentro desta função,
    // para estar em conformidade com compiladores C89.
    int i; 

    for (i = 0; i < 10; i++)
    {
        Display_7s(i);
        Delay_ms(1000); // Espera 1 segundo
    }
		
		Display_Off(); // Apaga o display após terminar a contagem
}

// Função para apagar todos os segmentos do display
void Display_Off(void)
{
    // Assume Anodo Comum: HIGH apaga o segmento
    GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
    GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
    GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
    GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
    GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
    GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
    GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
}

// Configuração dos pinos do segmento
void InitGPIO(void)
{
	// Seguimentos
	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

	// Configura os pinos do Botão
	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
}

void Display_7s(int SEG)
{
	switch (SEG) {
		// Digito 0
		case 0:
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
		break;		
		// Digito 1
		case 1:
		GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
		break;
		
		// Digito 2
		case 2:
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		break;
		
		// Digito 3
		case 3:
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		break;
		
		// Digito 4
		case 4:
		GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		break;
		
		// Digito 5
		case 5:
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		break;
		
		// Digito 6
		case 6:
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		break;
		
		// Digito 7
		case 7:
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
		break;
		
		// Digito 8
		case 8:
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		break;
		
		// Digito 9
		case 9:
		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
		break;
		
		default:
    Display_Off(); // Em caso de número inválido, apaga o display
		break;
	}
}

void Delay_ms(uint16_t ms)
{
	volatile uint32_t i;
	for (i = 0; i < (16000UL / 100UL) * ms; i++);
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