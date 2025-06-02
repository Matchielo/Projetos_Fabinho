////////////////////////////////////////////////////////////////////////
// Autor: Gilberto Soares 
// Empresa: AGL Eletronicos do Brasil
// Produto: Porteiro Eletronico P11 - PCB P11X2RA REV.00
// Ultima Revisao: Ajuste da frequencia de Buzzer para maior ganho (aprox. 80db); Ajuste no filtro de V_Line para eliminar ruidos em cabo de 300m e na portaria da empresa
// Esta Revisao: Mudar pinagem para utilizacao do micro STM8S003F3 (PCB P11X REV.B0) para a PCB P11R2A REV.00
// PC5 remapeado para TIM2_CH1
// PC6 remapeado para TIM1_CH2
////////////////////////////////////////////////////////////////////////

#include				"stm8s.h"
#include				"stm8s003f3.h"

////////////////////////////////////////////////////////////////////////
/* Pins Defitinioins */
// Output Pins
#define					MicOn        			GPIO_WriteHigh(GPIOB, GPIO_PIN_4)	 						  //Cut MIC         									pin 12 OK
#define					MicOff    				GPIO_WriteLow(GPIOB, GPIO_PIN_4) 								//Release MIC

#define 				BP_386On         	GPIO_WriteHigh(GPIOB, GPIO_PIN_5)  							//Bypass LM386											pin 16 PC6 - changed to pin 11 PB5
#define 				BP_386Off       	GPIO_WriteLow(GPIOB, GPIO_PIN_5)  							//UnBypass LM386

#define 				LineAFOn      		GPIO_WriteHigh(GPIOC, GPIO_PIN_7)  							//Block Line>>AF										pin 17 ok		
#define 				LineAFOff     		GPIO_WriteLow(GPIOC, GPIO_PIN_7)  							//UnBlock Line>>AF

#define 				LockOn       			GPIO_WriteHigh(GPIOD, GPIO_PIN_2)  							//Turns On Lock											pin 15 PC5 - changed to pin 19 PD2
#define					LockOff       		GPIO_WriteLow(GPIOD, GPIO_PIN_2)  							//Turns Off Lock

// Input Pins
#define 				CALL 							GPIO_ReadInputPin(GPIOD, GPIO_PIN_4)						//Read status Call button						pin 1 OK
//#define 				PRL 							GPIO_ReadInputPin(GPIOD, GPIO_PIN_5)						//Read status Parallel jumper				pin 2 OK
//#define 				BOT 							GPIO_ReadInputPin(GPIOD, GPIO_PIN_6)						//Read status Button jumper					pin 3 OK


////////////////////////////////////////////////////////////////////////
/* Variable Definition */
//#define					pwm_call_h 			((uint16_t)650)																	//Call high frequency 3.473kHz
//#define					pwm_call_l 			((uint16_t)850)																	//Call low frequency 1.724kHz
//#define					pwm_call_fbk 		((uint16_t)450)																	//Call feedback	550Hz
//#define					pwm_alm_offh 		((uint16_t)500)																	//Alarm sound OFF HOOK - 735Hz
//#define					pwm_alarm_h 		((uint16_t)625)																	//Alarm sound High frequency ON HOOK - 3.2kHz
//#define					pwm_alarm_l 		((uint16_t)825)																	//Alarm sound Low frequency ON HOOK - 1.6kHz

////////////////////////////////////////////////////////////////////////
/* Global Variable Declaration */	
int							Count_Pulse		= 0;																								// 7 low pulses counting
uint16_t 				AD_VLine			= 0;																							// Voltage V_Line
uint16_t	 			Time					= 0;																							// Voltage V_Line test variable
//uint16_t 				AD_VRef				= 0;																						// Referency voltage
unsigned int 		Deb1_LineAF		= 0;																							// debounce on/off hook
unsigned int 		Deb2_LineAF		= 0;																							// debounce on/off key & AUX.
unsigned int 		Deb1					= 0;																							// debounce on/off hook
unsigned int 		Deb2					= 0;																							// debounce on/off key & AUX.
uint16_t 				Set_PWM_Line	= 0;																							// PWM - signal injection -> Line PC3 (pin 13)
//uint16_t 				Set_PWM_AF		= 0;																						// PWM - signal injection -> AF PC4 (pin 14)
//uint16_t 				Set_PWM_LAF		= 1000;																						// PWM - signal injection -> Line + AF
uint16_t 				Set_PWM_Alarm = 0;																							// PWM - signal injection -> Alarm PA3 (pin 10)
uint16_t 				Time_Key_AUX	= 0;																							// AUX. key counting 
uint16_t 				Time_Beep			= 0;																							// Beep output counting
uint16_t 				VRef					= 0;																							// debug variable
uint16_t 				VStep					= 55;																							// debug variable

bool 						Flag_Pulse_Toggle	= FALSE;																			// flag - indicates last state was a Key high pulse
bool 						Flag_Key				= FALSE;																				// flag - indicates was detected the Key button pressed
bool						Stay_UnLock		= FALSE;																					// flag - indicates the Key button stil pressed
//bool						Stay_AUX			= FALSE;
bool						Flag_Call			= FALSE;
bool						HoldKey				= FALSE;

////////////////////////////////////////////////////////////////////////
/* Private Function Prototypes -----------------------------------------------*/
static 	void 		TIM1_Config (void);
static 	void 		TIM2_Config (void);
static 	void 		PWM_Set_BzLine (uint16_t Pwm_Set);
static 	void 		PWM_Set_BzAF (uint16_t Pwm_Set);
static 	void 		PWM_Set_Alarm (uint16_t Pwm_Set);
static 	void 		PWM_Set_LineAF (uint16_t Pwm_BzLine);
static	void 		InitGPIO (void);
static	void 		Delay (uint32_t nCount);
static	void 		SetCLK (void);
static	void		InitADC1 (void);
static	void 		UnlockE2prom (void);
static	void 		Lock_On (void);
static  void    Rele_AUX (void);
static 	void    Read_VLine(void);

//////////////////////////////////////////////////////////////////////////////////
//////////  M A I N _____________________________________________________________
//////////////////////////////////////////////////////////////////////////////////
main()
{
	//RemappingBits();
	SetCLK();																														
	InitGPIO();																													
	InitADC1();																														
	TIM1_Config();																															
	TIM2_Config();																														
	LockOff;
	TIM1_CR1 = 0;
	
	while(1)
	{
		// Read the VLine to the following Modes:
		// 1) On Hook; 2) Off Hook; 3) Pressed Call; 4) Pressed Key; 5) Alarm On Hook; 6) Alarm Off Hook
		Read_VLine();
		
		///////////////////////////////////////////////////////////////////////////////////////////////////
		//  Of-Hook Button Verify
		///////////////////////////////////////////////////////////////////////////////////////////////////
		// 
		// Verify if the "Key" or "AUX" button was pressed and if the "Call" button is released }
		if(Flag_Key && !Flag_Call)
		{
			if(AD_VLine > VRef + VStep || AD_VLine < VRef - VStep)       // VStep = 55
			{
				Flag_Pulse_Toggle = TRUE;
			}
			// If the VLine alternates betwin low [3.1 Volts] and high [3.8 Volts] = "Key" button was pressed
			if(Flag_Pulse_Toggle)  // ***
			{
				VRef = AD_VLine;
				Flag_Pulse_Toggle = FALSE;
				Count_Pulse++;
				Time_Key_AUX = 0;
				if(Count_Pulse >= 70)
				{
					Count_Pulse = 0;
					Stay_UnLock = TRUE;						
					Lock_On();
				}
			}
			else																																			
			{
				// If the VLine is constant high [3.8 Volts] by arround 100ms = "AUX" button was pressed
				Time_Key_AUX++;																																									// Debounce filter to the "AUX" button
				if(Time_Key_AUX > 2500 && AD_VLine < 850)
				{
					Count_Pulse = 0;
					Stay_UnLock = TRUE;						
					Lock_On(); //Rele_AUX();					
				}
			}
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////
		// If the VLine is very low, than the phone is On Hook
		///////////////////////////////////////////////////////////////////////////////////////////////////
		// Follow to test the "Call" button
		if(AD_VLine < 40)
		{
			Deb2_LineAF=0;
			Deb1_LineAF++;																																										// Count to debounce
			Flag_Key = FALSE;																																										// If VLine is low, than reset the Flag button pressed (Key or AUX)
			if(Deb1_LineAF > 150)																																							// If VLine is low by more than 150 times, the phone is On Hook
			{
				Deb1_LineAF = 0;																																								// Resets the debounce counter	
				LineAFOff;
				MicOn;																																											// Cut the audio from Line to the AF output
			}
			//If the "Call" button is pressed >> apply debounce filter >> Flag_Call = TRUE
			if(!CALL)
			{
				Deb1++;
				Deb2 = 0;
				if(Deb1 > 250)
				{
					Flag_Call = TRUE;
				}
			}
			//If the "Call" button is released >> reset debounce filter >> Flag_Call = FALSE 
			else
			{
				Deb1 = 0;
				Flag_Call = FALSE;
			}
			
			// If the "Call" button is pressed, generate signal PWM at outpus while pressed
			// If pressed by more than 3s, stop the function
			Time = 0;
			while(Flag_Call)
			{
				Time++;
				PWM_Set_LineAF(457);		// 1100 ; 457 -> 3.473kHz
				Delay(60);
				TIM1_CR1 = 0;
				PWM_Set_LineAF(921);		// 2200 ; 921 -> 1.724kHz 
				Delay(60);
				TIM1_CR1 = 0;
				if(CALL)
				{
					Deb2--;
					if(Deb2 > 250)
					{
						Flag_Call = FALSE;
						InitADC1();		
						Delay(100);
					}
					else
					{
						Deb2 = 0;
					}
				}
				if(Time > 40)
				{
					TIM1_BKR	= 0x00;
				}
			}
			TIM1_Config();
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////
		// If the VLine isn`t low, it may be at the midle level => of-hook. Than, open audio line
		///////////////////////////////////////////////////////////////////////////////////////////////////		
		else
		{
			Deb1_LineAF = 0;
			if(AD_VLine <= 500)
			{	
				Deb2_LineAF++;	
				if(Deb2_LineAF > 150)
				{	
					MicOff;
					Delay(2);
					LineAFOn;
					Flag_Key = FALSE;				
				}	
			}
		}
		///////////////////////////////////////////////////////////////////////////////////////////////////
		// If the VLine is high, then a interphones button is pressed
		///////////////////////////////////////////////////////////////////////////////////////////////////				
		if(AD_VLine > 550 && Flag_Key == FALSE)
		{
			//MicOn;  OBS.: comentado o corte do MIC para manter impedancia baixa na linha e estabilizar mais rapido as tensoes no apertar das teclas KEY e AUX
			//Delay(12);
			VRef = AD_VLine;
			LineAFOff;
			Delay(2);
			Count_Pulse = 0;
			Flag_Key = TRUE;
			Time_Key_AUX = 0;
		}
	}
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// SET PERIFERALS BLOCK
///////////////////////////////////////////////////////////////////////////////////////////////////

// PC6 remapeado para TIM1_CH1

// Configure TIM1 to generate PWM signal at PC3 and PC4 (pins 13 and 14)
// The PWM ports PC3 and PC4 are used join, at the same frequency and Duty Cycle, as follow: [Pin13] Buzzer Line]; [Pin14] Buzzer AF
// PWM TIM1_CH3 and PWM TIM1_CH4
void TIM1_Config(void)
{
  TIM1->EGR   = 0x01;
	TIM1_PSCRH 	= 0x04 >> 8;
  TIM1_PSCRL 	= 0x04;
	TIM1_CCER1 	&= ~0x0B;
	TIM1_CCER1 	|= 0x0B;	
	TIM1_CCER2 	&= ~0x0B;
	TIM1_CCER2 	|= 0x0B;
	TIM1_CCMR1 	&= ~0x60;
	TIM1_CCMR1 	|= 0x60;
	TIM1_CCMR3 	&= ~0x60;
	TIM1_CCMR3 	|= 0x60;
	TIM1_OISR	 	&= ~0x70;
	TIM1_OISR	 	|= 0x70;
	TIM1_CCR3H 	= 0x12C >> 8;
  TIM1_CCR3L 	= 0x12C; 
	TIM1_CCR1H 	= 0x12C >> 8;
  TIM1_CCR1L 	= 0x12C; 	
	TIM1_BKR		= 0x80;
}

/*
void TIM1_Config(void)
{
  TIM1->EGR   = 0x01;
	TIM1_PSCRH 	= 0x04 >> 8;
  TIM1_PSCRL 	= 0x04;
	TIM1_CCER2 	&= ~0x3B;
	TIM1_CCER2 	|= 0x3B;
	TIM1_CCMR3 	&= ~0x60;
	TIM1_CCMR3 	|= 0x60;
	TIM1_CCMR4 	&= ~0x60;
	TIM1_CCMR4 	|= 0x60;
	TIM1_OISR	 	&= ~0x70;
	TIM1_OISR	 	|= 0x70;
	TIM1_CCR3H 	= 0x12C >> 8;
  TIM1_CCR3L 	= 0x12C; 
	TIM1_BKR		= 0x80;
}
*/

// Configure TIM1 to generate PWM signal at PA3 (pin 10)
// PWM TIM2_CH3

// PC5 remapeado para TIM2_CH1

void TIM2_Config(void)
{
	TIM2_PSCR	 	= 0x03;			//set prescaler 
	TIM2_CCER1 	= 0x03; 		//set PWM1 polarity  to High
	TIM2_CCMR1	= 0x60;			//set PWM1 Mode to PWM1
}

/*
{
	TIM2_PSCR	 	= 0x03;			//set prescaler 
	TIM2_CCER2 	= 0x03; 		//set PWM3 polarity  to High
	TIM2_CCMR3	= 0x60;			//set PWM3 Mode to PWM1
}
*/

// SET ADC Convertion to the AD channels 3 and 4
// Pin19 (AIN3 -> VLine) | Pin20 (AIN4 -> VPower)
void	InitADC1 (void)
{
	ADC1_DeInit();
	
	ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS,
						ADC1_CHANNEL_2 | ADC1_CHANNEL_4,
						ADC1_PRESSEL_FCPU_D18,
						ADC1_EXTTRIG_GPIO,
						DISABLE,
						ADC1_ALIGN_RIGHT,
						ADC1_SCHMITTTRIG_CHANNEL2 | ADC1_SCHMITTTRIG_CHANNEL4,
						DISABLE);

	ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_2, ADC1_ALIGN_RIGHT);
	
	ADC1_Cmd(ENABLE);
}

// GPIOS Config - Initialization
// The PWM ports PC3, PC4 and PA3 are used as follow: [Pin13] Buzzer Line]; [Pin14] Buzzer AF; [Pin10] Alarm
void InitGPIO(void)
{
	GPIO_Init(GPIOD, GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);			//Pins 1 and 2 and 3 ([1]CALL Button; [2]Jumper PAR; [3]Jumper BOT)
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);														//Pin 19 -> Lock Output
	GPIO_Init(GPIOB, GPIO_PIN_4 | GPIO_PIN_5 , GPIO_MODE_OUT_PP_LOW_FAST);							//Pin 11 and 12 ([11]LM386 Bypass; [12]MIC ON_OFF)
	GPIO_Init(GPIOC, GPIO_PIN_7 | GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);														//Pin 17 -> Line >> AF Blocker
	GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT); 
}

// Delay Time Function
// Set to 1.0 ms/Count
void Delay(uint32_t nCount)
{
	unsigned int	conta = 661;
	while (nCount != 0)
	{
		while (conta != 0)
		{
			conta--;
		}
		conta = 661;
		nCount--;
	}
}

// CLOCK Initialization:
// Clock HSI (16Mhz), Prescaler HSI (2) and Prescaler CPU (1)
void SetCLK(void)
{
	CLK_DeInit();
	
	CLK_HSECmd(DISABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSICmd(ENABLE);																																	//HSI Full Clock = 16MHz
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
	
	CLK_ClockSwitchCmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);              												//Divisible by 1; 2; 4; 8
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);																						//Divisible by 1; 2; 4; 8; 16; 32; 64; 128
	
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, DISABLE);
}

// Unlock the EEProm data memory
void UnlockE2prom(void)
{
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
}

// PWM SET FREQUENCY TIM1
// TIM1 -> PWM_CH4 plus PWM_CH3
// Call Buzzer: 1.724kHz and 3.473kHz
// Alarm: 1.600kHz and 3.200kHz 
void PWM_Set_LineAF(uint16_t Pwm_BzLine)
{
	TIM1_ARRH = (Pwm_BzLine >> 8);
	TIM1_ARRL = Pwm_BzLine;
	Set_PWM_Line = Pwm_BzLine / 2;
	TIM1_CCR1H = (Set_PWM_Line >> 8);
	TIM1_CCR1L = Set_PWM_Line;
	TIM1_CCR3H = (Set_PWM_Line >> 8);
	TIM1_CCR3L = Set_PWM_Line;	
	TIM1_CNTRH = 0;
	TIM1_CNTRL = 0;
	TIM1_CR1 |= 0b00000001;
}

// PWM SET FREQUENCY TIM2
// TIM2 -> PWM_CH3
// Feedback action Lock: 550Hz
// Feedback Alarm/Tamper: 735Hz
void PWM_Set_Alarm(uint16_t Pwm_Alarm)
{
	TIM2_ARRH = (Pwm_Alarm >> 8);
	TIM2_ARRL = Pwm_Alarm;
	Set_PWM_Alarm = Pwm_Alarm / 2;
	TIM2_CCR1H = (Set_PWM_Alarm >> 8);
	TIM2_CCR1L = Set_PWM_Alarm;
	TIM2_CNTRH = 0;
	TIM2_CNTRL = 0;
	TIM2_CR1 |= 0b00000001;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// KeyLock output turn on
///////////////////////////////////////////////////////////////////////////////////////////////////
void Lock_On()
{
	int Count_Pulse = 0;
	unsigned int Deb1 = 0;
	unsigned int Count_OnLock = 0;
	while(Stay_UnLock && Count_OnLock < 12)
	{
		Count_OnLock++;
		for(Count_Pulse = 0; Count_Pulse < 5; Count_Pulse++)
		{
			LockOn;
			Delay(3);
			LockOff;
			Delay(50);			
		}
		Read_VLine();
		if(AD_VLine < 500)
		{
			Stay_UnLock = FALSE;
		}	
	}
	while(Stay_UnLock)
	{
		Read_VLine();
		if(AD_VLine > 500)
		{
			Deb1 = 0;
		}			
		else
		{
			Deb1++;
			if(Deb1 > 1000)
			{
				Stay_UnLock = FALSE;
			}
		}
	}
	Flag_Key = FALSE;
	Time_Beep = 0;
	HoldKey = TRUE;
	LineAFOn;
	
	while(HoldKey)
	{
		int		t = 0;
		for(t = 0; t < 2; t++)
		{
			//PWM_Set_Alarm(1879);														 	// 528Hz (D� em 5� oitava) [otiginal -> 1804 = 550Hz]
			for(Time_Beep = 0; Time_Beep < 7500; Time_Beep++)	//400ms
			{
				Read_VLine();
				if(AD_VLine > 500)
				{
					break;
					LineAFOff;					
				}
			}
			//TIM2_CR1 = 0;
			for(Time_Beep = 0; Time_Beep < 4500; Time_Beep++) //400ms
			{
				Read_VLine();
				if(AD_VLine > 500)
				{
					break;
					LineAFOff;
				}
			}
		}
		HoldKey = FALSE;		
	}
}

/*
///////////////////////////////////////////////////////////////////////////////////////////////////
// Auxiliary output turn on
///////////////////////////////////////////////////////////////////////////////////////////////////
void Rele_AUX()
{
	int Count_Pulse = 0;
	unsigned int Deb1 = 0;
	unsigned int Count_OnLock = 0;
	while(Stay_UnLock && Count_OnLock < 17)
	{
		Count_OnLock++;
		for(Count_Pulse = 0; Count_Pulse < 3; Count_Pulse++)
		{
			LockOn;
			Delay(3);
			LockOff;
			Delay(50);			
		}
		Read_VLine();
		if(AD_VLine < 600)
		{
			Stay_UnLock = FALSE;
		}	
	}
	while(Stay_UnLock)
	{
		Read_VLine();
		if(AD_VLine > 600)
		{
			Deb1 = 0;
		}			
		else
		{
			Deb1++;
			if(Deb1 > 1000)
			{
				Stay_UnLock = FALSE;
			}
		}
	}
	Flag_Key = FALSE;
	Delay(1000);
}
*/

void Read_VLine()
{
	ADC1_StartConversion();
	while(ADC1_GetFlagStatus(ADC1_FLAG_EOC) == FALSE);
	AD_VLine = ADC1_GetConversionValue();
	ADC1_ClearFlag(ADC1_FLAG_EOC);
}