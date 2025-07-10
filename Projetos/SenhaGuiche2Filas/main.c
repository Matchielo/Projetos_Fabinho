/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

/* Include standard libraries */
#include "stm8s.h"
#include "stm8s903k3.h"
#include "protocol_ht6p20b.h"

/* Definições  */
// Output Pins
#define setDig1 GPIO_WriteHigh(GPIOE, GPIO_PIN_5);			// Turn On Digit 1
#define setDig2 GPIO_WriteHigh(GPIOC, GPIO_PIN_1);			// Turn On Digit 2
#define setDig3 GPIO_WriteHigh(GPIOC, GPIO_PIN_2);			// Turn On Digit 3
#define setDig4 GPIO_WriteHigh(GPIOC, GPIO_PIN_3);			// Turn On Digit 4
#define setDig5 GPIO_WriteHigh(GPIOC, GPIO_PIN_4);			// Turn On Digit 5
#define setDig6 GPIO_WriteHigh(GPIOC, GPIO_PIN_5);			// Turn On Digit 6

#define resDig1 GPIO_WriteLow(GPIOE, GPIO_PIN_5);			// Turn Off Digit 1
#define resDig2 GPIO_WriteLow(GPIOC, GPIO_PIN_1);			// Turn Off Digit 2
#define resDig3 GPIO_WriteLow(GPIOC, GPIO_PIN_2);			// Turn Off Digit 3
#define resDig4 GPIO_WriteLow(GPIOC, GPIO_PIN_3);			// Turn Off Digit 4
#define resDig5 GPIO_WriteLow(GPIOC, GPIO_PIN_4);			// Turn Off Digit 5
#define resDig6 GPIO_WriteLow(GPIOC, GPIO_PIN_5);			// Turn Off Digit 6

// Input Pins
#define readCh1 GPIO_ReadInputPin(GPIOB, GPIO_PIN_7);		//Read CH1
#define readCh2 GPIO_ReadInputPin(GPIOF, GPIO_PIN_4);		//Read CH2

// Constantes
#define timeDelay 			((uint16_t)22500)
#define control_presetP	0x00
#define control_presetC	0x04
#define control_presetE	0x08
#define dataNull	1000


/* Declaração de variáveis globais */
unsigned int	pwm_call_h 		= 500;											//Call high 3.473kHz
unsigned int	pwm_call_l		= 500;											//Call low 1.724kHz
unsigned int	pwm_call_fbk	= 500;											//Call feedback	550Hz
unsigned int	pwm_alm_offh	= 500;											//Alarm sound OFF HOOK - 735Hz
unsigned int	pwm_alarm_h   = 500;											//Alarm sound High ON HOOK - 3.2kHz
unsigned int	pwm_alarm_l		= 500;											//Alarm sound Low ON HOOK - 1.6kHz
signed int i = 0;
bool	RF_IN_ON = FALSE;

int dataEpromVector2 = 0;
int dataBufferVector2 = 0;

@eeprom uint8_t codGuiche1[4];

bool	sinLed = FALSE;								//sinalisa para ligar LED
bool 	setCountP = FALSE;
bool 	setCountC = FALSE;
bool 	setCountE = FALSE;
bool	setRepeat = FALSE;

u8		stateBot = 0;									//Variável que sinalisa qual função atribuída ao botão
u16 	delayOn = 0;									//Variável ce contagem de tempo base do botão
u8		contMSeg	= 0;								//Variável de contagem de tempo base do botão
u8		contSeg	= 0;									//Variável de contagem de tempo base do botão


uint16_t debounceCh1 = 0;
uint16_t debounceCh2 = 0;
uint16_t counterP = 0;
uint16_t counterC = 0;
uint16_t counterE = 0;
uint16_t repeatCall = 0;
uint8_t digUni = 0;
uint8_t digDez = 0;
uint8_t digCen = 0;
uint8_t guiDez = 0;
uint8_t guiUni = 0;
uint8_t guiFilaP = 0;
uint8_t guiFilaC = 0;
uint8_t guiFilaE = 0;
uint8_t readChannel1 = 0;
uint8_t readChannel2 = 0;
uint8_t numGuiche = 0;
uint8_t ultimaFilaChamada = 0;
uint16_t saveData = 0;

// - Configuração do PWM TIM5_CH3 p/ Buzzer ----
	/*ld		a,#50									        ;Carrega variável alta que define a freq. do PWM		
	ld		fh,a													;
	ld		a,#25													;Carrega variável alta que define Dutt Cycle do PWM
	ld		vh,a													;
	ld		a,#39													;Carrega variável baixa que define a freq. do PWM	
	ld		fl,a													;
	ld		a,#18													;Carrega variável baixa que define Dutt Cycle do PWM
	ld		vl,a													;
	ld		a,#0													;Programa o prescaler do TIM5*/
uint8_t fh  = 50;	
uint8_t vh  = 25;
uint8_t fl	= 39;
uint8_t vl	= 18;


/* Private function prototypes -----------------------------------------------*/
static 	void TIM1_Config(void);
void 		InitGPIO (void);
void 		Delay (uint32_t nCount);
void 		SetCLK (void);
void		InitADC (void);
void 		UnlockE2prom (void);
void		onInt_TM6 (void);
void 		showDisplay (uint16_t);
void 		save_code_to_eeprom (void); //save_code_to_eeprom(uint8_t*, uint8_t);
uint8_t searchCode (void);
void 		buzzerOnHi(void);
void 		buzzerOnLow(void);
void 		turnOffbuzzer(void);
void 		showCharP(void); 
void 		showCharC(void);
void 		showCharE(void); 
void 		save_preset_to_eeprom(void);

main()
{
	SetCLK(); 			// Init Clock to 16Mhz
	InitGPIO();			//
	InitADC();			// Init adc conv. to set siren volum.
	UnlockE2prom(); // Unlick inside eeprom
	TIM1_Config();  // Config PWM siren
	onInt_TM6();		// Config TIM6 to 50us interrupt receiving RF
	
	// Read Key to Delete control guiche
	readChannel1 = readCh1;
	if (readChannel1 == 0)
	{
		uint16_t i;
		Delay(100);
		for (i = 4; i <= 400; i++)
		{
			codGuiche1[i] = 0x00;
		}
	}
	
	showDisplay(888);
	buzzerOnHi();
	Delay(100000);		
	showDisplay(dataNull);
	buzzerOnLow();
	Delay(100000);
	showDisplay(888);
	buzzerOnHi();
	Delay(100000);
	showDisplay(dataNull);
	buzzerOnLow();
	Delay(100000);
	showDisplay(0);
	turnOffbuzzer();
	
	while (1)
	{
		//Delay(100000);
		RF_IN_ON = TRUE;
		HT_RC_Code_Ready_Overwrite = FALSE;
		
		// CONTADOR FILA P //////////////////////////////////////////////////////////
		if (setCountP == TRUE)
		{
			if (++counterP >= 1000)
			{
				counterP = 0;
				setCountP = FALSE;
			}
			else 
			{
				setCountP = FALSE;
			}
			
			showCharP();
			
			showDisplay(dataNull);
			buzzerOnHi();
			Delay(100000);		
			showDisplay(counterP);
			buzzerOnLow();
			Delay(100000);
			showDisplay(dataNull);
			buzzerOnHi();
			Delay(100000);
			showDisplay(counterP);
			turnOffbuzzer();
		}
		// CONTADOR FILA C //////////////////////////////////////////////////////////		
		if (setCountC == TRUE)
		{
			if (++counterC >= 1000)
			{
				counterC = 0;
				setCountC = FALSE;
			}
			else 
			{
				setCountC = FALSE;
			}
			
			showCharC();
			
			showDisplay(dataNull);
			buzzerOnHi();
			Delay(100000);		
			showDisplay(counterC);
			buzzerOnLow();
			Delay(100000);
			showDisplay(dataNull);
			buzzerOnHi();
			Delay(100000);
			showDisplay(counterC);
			turnOffbuzzer();
		}
		// CONTADOR FILA E //////////////////////////////////////////////////////////		
		if (setCountE == TRUE)
		{
			if (++counterE >= 1000)
			{
				counterE = 0;
				setCountE = FALSE;
			}
			else 
			{
				setCountE = FALSE;
			}
			
			showCharE();
			
			showDisplay(dataNull);
			buzzerOnHi();
			Delay(100000);		
			showDisplay(counterE);
			buzzerOnLow();
			Delay(100000);
			showDisplay(dataNull);
			buzzerOnHi();
			Delay(100000);
			showDisplay(counterE);
			turnOffbuzzer();
		}
		// REPETE ULTIMA FILA /////////////////////////////////////////////////////////		
		if (setRepeat == TRUE)
		{	
			if (ultimaFilaChamada == 0) numGuiche = guiFilaP;
			if (ultimaFilaChamada == 1) numGuiche = guiFilaC;
			if (ultimaFilaChamada == 2) numGuiche = guiFilaE;
			
			saveData = repeatCall;
			showDisplay(dataNull);
			buzzerOnHi();
			Delay(100000);		
			showDisplay(saveData);
			buzzerOnLow();
			Delay(100000);
			showDisplay(dataNull);
			buzzerOnHi();
			Delay(100000);
			showDisplay(saveData);
			turnOffbuzzer();
			setRepeat = FALSE;
		}		
		
		// Read Key to proggram control guiche
		readChannel1 = readCh1;
		if (readChannel1 == 0)
		{
			if (++debounceCh1 >= 250)
			{
				--debounceCh1;
				if (Code_Ready == TRUE)
				{
					save_code_to_eeprom();
					setCountP = FALSE;
					setCountC = FALSE;
					setCountE = FALSE;
					setRepeat = FALSE;
					Code_Ready = FALSE;
				}
			}
		}
		else
		{
			debounceCh1 = 0;
		}
		
		// Read Key to proggram control preset		
		readChannel2 = readCh2;
		if (readChannel2 == 0)
		{
			if (++debounceCh2 >= 250)
			{
				--debounceCh2;
				if (Code_Ready == TRUE)
				{
					save_preset_to_eeprom();
					setCountP = FALSE;
					setCountC = FALSE;
					setCountE = FALSE;
					setRepeat = FALSE;
					Code_Ready = FALSE;
				}
			}
		}
		else
		{
			debounceCh2 = 0;
		}		
		
		// Read RF command
		if (Code_Ready == TRUE)
		{
			searchCode();
			Code_Ready = FALSE;
		}
	}
}

////////////////////////////////////////////////////////////////////////////////
// Grava o novo código para controlde de Preset
void save_preset_to_eeprom(void)
{
	int i = 0;
	codGuiche1[i] 		= RF_CopyBuffer[0];
	codGuiche1[i + 1] = RF_CopyBuffer[1];
	codGuiche1[i + 2] = RF_CopyBuffer[2];
	codGuiche1[i + 3] = RF_CopyBuffer[3];
	
	showDisplay(888);
	buzzerOnHi();
	Delay(100000);		
	showDisplay(dataNull);
	buzzerOnLow();
	Delay(100000);
	showDisplay(888);
	buzzerOnHi();
	Delay(100000);
	showDisplay(dataNull);
	buzzerOnLow();
	Delay(100000);
	showDisplay(0);
	turnOffbuzzer();
	
	return;
}


////////////////////////////////////////////////////////////////////////////////
// Grava o novo código na próxima posição livre da EEPROM
void save_code_to_eeprom(void)
{
	uint16_t i = 4;
	if (searchCode() == 0)
	{
		return;
	}
	while (i < 400)
	{
		if ((codGuiche1[i] + codGuiche1[i + 1] + codGuiche1[i + 2] + codGuiche1[i + 3]) == 0x0000)
		{
			codGuiche1[i] 		= RF_CopyBuffer[0];
			codGuiche1[i + 1] = RF_CopyBuffer[1];
			codGuiche1[i + 2] = RF_CopyBuffer[2];
			codGuiche1[i + 3] = RF_CopyBuffer[3];
			
			showDisplay(888);
			buzzerOnHi();
			Delay(100000);		
			showDisplay(dataNull);
			buzzerOnLow();
			Delay(100000);
			showDisplay(888);
			buzzerOnHi();
			Delay(100000);
			showDisplay(dataNull);
			buzzerOnLow();
			Delay(100000);
			showDisplay(0);
			turnOffbuzzer();
			
			return;
		}
		i = i + 4;
	}
}

////////////////////////////////////////////////////////////////////////////////
// Busca código na memória EEPROM
uint8_t searchCode(void)
{
	uint16_t i = 0;
	numGuiche = 1;
	dataEpromVector2 = codGuiche1[i + 2] & 0xFC;	// Carrega endereço com dados mascarados
	dataBufferVector2 = RF_CopyBuffer[2] & 0xFC;	// Carrega endereço com dados mascarados	
	
	// Rotina de decodificação do controle de rolagem rápida
	if ( codGuiche1[i]     == RF_CopyBuffer[0] && 
			 codGuiche1[i + 1] == RF_CopyBuffer[1] &&
			 dataEpromVector2 == dataBufferVector2 && // Teste com os dados mascarados
			 codGuiche1[i + 3] == RF_CopyBuffer[3]
			)
	{
		if ((RF_CopyBuffer[2] & 0x03) == 0x01) // Tecla 1
		{
			counterP++;
			showDisplay(counterP);
		}
		if ((RF_CopyBuffer[2] & 0x03) == 0x02) // Tecla 2
		{
			counterC++;
			showDisplay(counterC);
		}
		//if ((RF_CopyBuffer[2] & 0x03) == 0x03) // Tecla 3
		//{
		//	counterE++;
		//	showDisplay(counterE);
		//}
		return 1;
	}
	
	// Rotina de decodificação dos controles de chamada
	i = 4;
	while (i < 400)
	{
		dataEpromVector2 = codGuiche1[i + 2] & 0xFC;	// Carrega endereço com dados mascarados
		dataBufferVector2 = RF_CopyBuffer[2] & 0xFC;	// Carrega endereço com dados mascarados
		if ( codGuiche1[i]     == RF_CopyBuffer[0] && 
				 codGuiche1[i + 1] == RF_CopyBuffer[1] &&
				 dataEpromVector2 == dataBufferVector2 && // Teste com os dados mascarados
				 codGuiche1[i + 3] == RF_CopyBuffer[3]
				)
		{
			if ((RF_CopyBuffer[2] & 0x03) == 0x01)
			{
				setCountP = TRUE;
				guiFilaP = numGuiche;
				ultimaFilaChamada = 0; // 0 = P
				return 0;
			}
			if ((RF_CopyBuffer[2] & 0x03) == 0x02)
			{
				setCountC = TRUE;
				guiFilaC = numGuiche;
				ultimaFilaChamada = 1; // 1 = C
				return 0;
			}
			if ((RF_CopyBuffer[2] & 0x03) == 0x03)
			{
				setRepeat = TRUE;
				/*
				setCountE = TRUE;
				guiFilaE = numGuiche;
				ultimaFilaChamada = 2; // 2 = E 
				*/
				return 0; 
			}
			//if ((RF_CopyBuffer[2] & 0x03) == 0x00)
			//{
			//	setRepeat = TRUE;
			//	return 0;
			//}			
		}
		i = i + 4;
		numGuiche++;
		if (numGuiche > 99) numGuiche = 99;
	}
	return 1;
}

////////////////////////////////////////////////////////////////////////////////
/* LOADS DIGITS TO DISPLAY AND SHOWS IT EFECTS */
void showDisplay(uint16_t data)
{
	repeatCall = data;
	if (data == dataNull)
	{
		PB_ODR = PB_ODR & 0xF0 | 0x0F;
		setDig1;
		Delay(10);
		resDig1;
		PB_ODR = PB_ODR & 0xF0 | 0x0F;
		setDig2;
		Delay(10);
		resDig2;
		PB_ODR = PB_ODR & 0xF0 | 0x0F;
		setDig3;
		Delay(10);
		resDig3;
		
		PB_ODR = PB_ODR & 0xF0 | 0x0F;
		setDig4;
		Delay(10);
		resDig4;
		PB_ODR = PB_ODR & 0xF0 | 0x0F;
		setDig5;
		Delay(10);
		resDig5;		
	}
	else 
	{
		digCen = data / 100;
		digDez = (data % 100) / 10;
		digUni = (data % 100) % 10;
		PB_ODR = PB_ODR & 0xF0 | digCen & 0x0F;
		setDig1;
		Delay(10);
		resDig1;
		PB_ODR = PB_ODR & 0xF0 | digDez & 0x0F;
		setDig2;
		Delay(10);
		resDig2;
		PB_ODR = PB_ODR & 0xF0 | digUni & 0x0F;
		setDig3;
		Delay(10);
		resDig3;
		
		guiDez = numGuiche / 10;
		guiUni = numGuiche % 10;
		PB_ODR = PB_ODR & 0xF0 | guiDez & 0x0F;
		setDig4;
		Delay(10);
		resDig4;
		PB_ODR = PB_ODR & 0xF0 | guiUni & 0x0F;
		setDig5;
		Delay(10);
		resDig5;
	}
	Code_Ready = FALSE;
}

////////////////////////////////////////////////////////////////////////////////
/* LOADS "P" CHARACTER TO DISPLAY AND SHOWS IT EFECTS */// A-B-E-F-G
void showCharP(void) 
{
	PC_ODR &= ~0xC0; 
	PC_ODR |= 0xC0;
	PD_ODR &= ~0x3D;
	PD_ODR |= 0x38;
}
////////////////////////////////////////////////////////////////////////////////
/* LOADS "C" CHARACTER TO DISPLAY AND SHOWS IT EFECTS */// A-D-E-F
void showCharC(void)
{
	PC_ODR &= ~0xC0;
	PC_ODR |= 0x40;
	PD_ODR &= ~0x3D;
	PD_ODR |= 0x1C;	
}
////////////////////////////////////////////////////////////////////////////////
/* LOADS "E" CHARACTER TO DISPLAY AND SHOWS IT EFECTS */// A-D-E-F-G
void showCharE(void)
{
	PC_ODR &= ~0xC0;
	PC_ODR |= 0x40;
	PD_ODR &= ~0x3D;
	PD_ODR |= 0x3C;	
}

////////////////////////////////////////////////////////////////////////////////
/*@brief  Configure TIM1 to generate PWM signal */
static void TIM1_Config(void)
{
	;
	/*
	TIM1_DeInit();
	
	TIM1_TimeBaseInit(16, TIM1_COUNTERMODE_UP, 1000, 1);

	TIM1_OC3Init(TIM1_OCMODE_PWM1,
							 TIM1_OUTPUTSTATE_ENABLE,
							 TIM1_OUTPUTNSTATE_DISABLE,
							 750,
							 TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_LOW,
							 TIM1_OCIDLESTATE_RESET, TIM1_OCNIDLESTATE_RESET);

	TIM1_OC4Init(TIM1_OCMODE_PWM1,
							 TIM1_OUTPUTSTATE_ENABLE,
							 500,
							 TIM1_OCPOLARITY_LOW,
							 TIM1_OCIDLESTATE_SET);
	
	TIM1_CtrlPWMOutputs(ENABLE);
	
	TIM1_Cmd(ENABLE);
	*/
}

////////////////////////////////////////////////////////////////////////////////
/*@brief  Configure TIM5 to generate PWM signal */
static void TIM5_Config(void)
{
// Reset do timer
	TIM5_DeInit();

	// Prescaler = 0 ? f_timer = 16 MHz
	TIM5_PSCR = 0;

	// ARR = fh00h (define o período do PWM)
	TIM5_ARRH = fh;
	TIM5_ARRL = 0x00;

	// CCR3 = vh00h (define largura do pulso)
	TIM5_CCR3H = vh;
	TIM5_CCR3L = 0x00;

	// PWM Mode 1 com preload (0x78 = 01111000)
	TIM5_CCMR3 = 0x78;

	// Habilita canal 3 com polaridade invertida (CC3E=1, CC3P=1)
	TIM5_CCER2 = 0x03;

	// Ativa ARPE (Auto Reload Preload Enable)
	TIM5_CR1 |= (1 << 7);

	// Liga o contador
	TIM5_CR1 |= TIM5_CR1_CEN;

}

////////////////////////////////////////////////////////////////////////////////
/* Activate TIM5 to set ON PWM signal High*/
void buzzerOnHi(void)
{
	// Define nova frequência do PWM
	TIM5_ARRH = fl;
	TIM5_ARRL = 0x00;

	// Define novo duty cycle
	TIM5_CCR3H = vl;
	TIM5_CCR3L = 0x00;

	// Ativa o contador, se ainda não estiver ligado
	TIM5_CR1 |= TIM5_CR1_CEN;

	// Habilita preload de CCR3 (bit OC3PE no TIM5_CCMR3)
	TIM5_CCMR3 |= (1 << 5);
}
////////////////////////////////////////////////////////////////////////////////
/* Activate TIM5 to set ON PWM signal Low*/
void buzzerOnLow(void)
{
	// Reset do TIM5
	TIM5_DeInit();

	// Prescaler = 0 (timer rodando a 16 MHz)
	TIM5_PSCR = 0x00;

	// ARR = fh00h (define frequência)
	TIM5_ARRH = fh;
	TIM5_ARRL = 0x00;

	// CCR3 = vh00h (define duty cycle)
	TIM5_CCR3H = vh;
	TIM5_CCR3L = 0x00;

	// Primeiro configura CCMR3 com preload desabilitado (OC3PE = 0)
	TIM5_CCMR3 = 0x70;  // OC3M = 111 (PWM1), OC3PE = 0

	// Depois ativa preload (OC3PE = 1)
	TIM5_CCMR3 = 0x78;  // OC3M = 111 (PWM1), OC3PE = 1

	// Ativa canal 3 com polaridade invertida (CC3E = 1, CC3P = 1)
	TIM5_CCER2 = 0x03;

	// Ativa ARPE (bit 7) e contador (bit 0)
	TIM5_CR1 |= (1 << 7);  // ARPE = 1
	TIM5_CR1 |= (1 << 0);  // CEN = 1
}
////////////////////////////////////////////////////////////////////////////////
/* Activate TIM5 to set ON PWM signal Low*/
void turnOffbuzzer(void)
{
	TIM5_CR1 &= ~(1 << 0);     // Desliga o contador (CEN = 0)
	TIM5_CCMR3 &= ~(1 << 5);   // Desativa preload (OC3PE = 0)
}


////////////////////////////////////////////////////////////////////////////////
/* ROTINA DE CONFIGURAÇÃO DA INTERRUPÇÃO DE 50us DO RF*/
void onInt_TM6(void)
{
	TIM6_CR1  = 0b00000001;
	TIM6_IER  = 0b00000001;
	TIM6_CNTR = 0b00000001;
	TIM6_ARR	= 0b00000001;
	TIM6_SR		= 0b00000001;
	TIM6_PSCR = 0b00000010;
	TIM6_ARR  = 198;
	TIM6_IER	|= 0x00;
	TIM6_CR1	|= 0x00;
	#asm
	RIM
	#endasm
}

////////////////////////////////////////////////////////////////////////////////
/*@brief  Configure TIM2 to generate PWM signal
  @param  None
  @retval None
*/

////////////////////////////////////////////////////////////////////////////////
/* ROTINA DE CONFIGURAÇÃO DO CONVERSOR AD  */
void	InitADC (void)
{
	;
}

////////////////////////////////////////////////////////////////////////////////
/* ROTINA DE CONFIGURAÇÃO DE GPIOS */
/*  */
void InitGPIO(void)
{
	// GPIOs INPUTS --------------------------------------------------------------
	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT); // RF Module Input
	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); // CH1 tact switch key
	GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // CH2 tact switch key

	// GPIOs OUTPUTS -------------------------------------------------------------
	GPIO_Init(GPIOA, GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PA2 => Barr Pin 5 Display out | PA3 => PWM TIM5_CH3
	GPIO_Init(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	// PB0 ~ PB3 = BCD/7Seg | PB6 => Eeprom Write Protect / Mode Write
	GPIO_Init(GPIOC, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch	1 to 5
	GPIO_Init(GPIOD, GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch	0 		
	
}

////////////////////////////////////////////////////////////////////////////////
/* ROTINA DE DELAY */
void Delay(uint32_t nCount)
{
  // Decrement nCount value
  while (nCount != 0)
  {
    nCount--;
  }
}

////////////////////////////////////////////////////////////////////////////////
/* ROTINA DE CONFIGURAÇÃO DO CLOCK */
void SetCLK(void)
{
	CLK_CKDIVR = 0b00000000;
}

////////////////////////////////////////////////////////////////////////////////
/* ROTINA DE DESTRAVA DA EEPROM */
void UnlockE2prom(void)
{
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
}

////////////////////////////////////////////////////////////////////////////////
/* ROTINA DA INTERRUPÇÃO DE 50us DO RF */
@far @interrupt void TIM6_UPD_IRQHandler (void)
{
	//GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
	if(RF_IN_ON)
	{
		Read_RF_6P20();
	}
	//GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
	TIM6_SR = 0;		
}