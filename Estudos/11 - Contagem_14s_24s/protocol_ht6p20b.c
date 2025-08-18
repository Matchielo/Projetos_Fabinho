/*
	*!<
	* @file			: protocol_ht6p20b.c
	* @author		: Roberto S. Dias
	* @Date			: 24 de Marco de 2021 - hours: 22:06
	* @Version	: V0.0.0
	* @brief		: File protocol_ht6p20b.c
	*!>
*/
//
/*
	*!<
  * @brief			: Includes - Inclusion of necessary files in the project sheet
  * @param			: None
  * @return val	: None
	*!>
*/
//
//#include "main.h"
#include "STM8S903k.h" 
#include "stm8s.h"
#include "stm8s_gpio.h"
#include "protocol_ht6p20b.h"

#define rf_read GPIO_ReadInputPin(GPIOA, GPIO_PIN_1) 

	typedef enum
	{
		PIN_0    = (0x01), 
    PIN_1    = (0x02),  
		PIN_2    = (0x04),  
    PIN_3    = (0x08),  
		PIN_4    = (0x10),  
    PIN_5    = (0x20),  
		PIN_6    = (0x40),  
    PIN_7    = (0x80),  
		PIN_ALL  = (0xFF)   
	}Pin_TypeDef;

void HT_FallingEdge (void);
void HT_RisingEdge (void);
void HT_SearchPilot (void);
void HT_ReceptionStart (void);

@tiny uint8_t RF_CopyBuffer[4];       // Definição da variável (instância real) //@tiny uint8_t RF_CopyBuffer[4];
@tiny uint8_t RF_OldBuffer[4];
// 
@tiny uint8_t HT_StateRegister = 3;			//!< State Register 
@tiny uint8_t HT_TimeCounter = 0;				//!< Time Counter 
@tiny uint8_t HT_Pointer;								//!< Buffer Pointer 
@tiny uint8_t HT_BitCounter;						//!< Received Bit Counter
@tiny uint8_t HT_BitTime;								//!< Received Bit Timer
@tiny uint8_t HT_Buffer[4];							//!< Received Buffer
@tiny uint16_t RF_Blocker = 0;					//!< Received Blocker
@tiny uint8_t RF_SampleBit;
@tiny uint8_t RF_HTBitSave;
//@tiny uint8_t IN_RF_DATA;
//
@tiny bool HT_RC_Code_Ready = FALSE;
@tiny bool HT_RC_Code_Ready_Overwrite = FALSE;
@tiny bool HCS_RC_Code_Ready_Overwrite = FALSE;
@tiny bool Code_Ready = FALSE;
//
/*
*!<
* @brief 			: Read RF pin, protocol ht6p20B
* @Attributes : None
* @param 			: None
* @return val	: None
*!>
*/
void Read_RF_6P20(void)																		/*!< Call every 50us Int Timer 4 */
{
	//num2++;
	//if((HT_RC_Code_Ready_Overwrite)||(RF_Blocker)) return;
	if ((HT_RC_Code_Ready_Overwrite)||(HCS_RC_Code_Ready_Overwrite)) return;
	if (Code_Ready == TRUE) return;
	//if ((HT_RC_Code_Ready_Overwrite)) return;
	RF_SampleBit=0;
	//
	if(rf_read){
	RF_SampleBit++; //if(IN_RF_DATA) RF_SampleBit++; //*!< sampling RF pin verify
	}
	//
	switch(HT_StateRegister)
	{
		case 1:  HT_FallingEdge();					//!< Search Falling :::....Edge 
			break;
		case 2:  HT_RisingEdge();						//!< Search Rising ....::: Edge 
			break;
		case 3:  HT_SearchPilot();					//!< Search Pilot Preriod 
			break;
		default: HT_ReceptionStart();				//!< Start Reception 
			break;
	}
}
//
//
// Reset.	( HT_StateRegister 0)	- 0, 3, 1, 2, fica entre 1 e 2 at? terminar os 28 Bits
void HT_ReceptionStart(void)
{	
	HT_StateRegister	= 3;
	HT_TimeCounter		= 0;
}

// Localiza periodo piloto. (HT_StateRegister 3)
void HT_SearchPilot(void)
{
	if (RF_SampleBit)											// Detects Level 1 / Detecta Nivel 1
	{
		if (HT_TimeCounter>HT_PILOT_MIN)	  // Yes, Check Time at 0 is Greater than Minimum Acceptable / 
																				// Sim, Verifica Tempo em 0 ? Maior que o Minimo Aceitavel
		{	// Passou pelo periodo piloto.
			HT_StateRegister = 1;								// Sim, vai proximo Estado
			HT_TimeCounter = 0;
			HT_BitCounter = 0;
			HT_Pointer = 0;
			HT_Buffer[3] = 0;
		}
		else  HT_ReceptionStart();					// No, Underflow.
	}
	else if (++HT_TimeCounter > HT_PILOT_MAX) HT_ReceptionStart(); // HT_TimeCounter--;
}

// Localiza borda de descida. (HT_StateRegister 1)
void HT_FallingEdge(void)
{		// Borda Descida;
	if (!RF_SampleBit)
	{	// Encontrada.
		if (HT_TimeCounter<HT_BIT_MIN)
		{
			HT_ReceptionStart();	// Underflow.
			return;
		}
		if(!HT_BitCounter)
			HT_BitTime = (HT_TimeCounter+3);	//(HT_TimeCounter+3);
		HT_TimeCounter = 0;
		HT_StateRegister++;							// Proxima etapa.
	}
	else if(++HT_TimeCounter>HT_BIT_MAX) HT_ReceptionStart();	// Overflow.
}

// Localiza borda de subida e salva bit. (HT_StateRegister 2)
void HT_RisingEdge(void)
{		// Borda Subida;
	if (RF_SampleBit)
	{	// Encontrada.
		if (HT_TimeCounter<HT_BIT_MIN)
		{
			HT_ReceptionStart();													// Underflow ou overflow.
			return;
		}
		RF_HTBitSave=0;
		if(HT_TimeCounter>HT_BitTime) RF_HTBitSave=1;
		HT_TimeCounter = 0;
		HT_StateRegister--;
		HT_Buffer[HT_Pointer]<<= 1;              				// rotate 
		if (RF_HTBitSave)	HT_Buffer[HT_Pointer]+=0x01; 	// Adiciona 1.
		//
		if ((++HT_BitCounter&7)==0) HT_Pointer++;
		if (HT_BitCounter==HT_BITS_TARGET)
		{	// Chegou todos os Bits do codigo.
			if(HT_Buffer[3]==0x05)			// Valida o 0101 do final do codigo HT6P20
			{
				if (HT_RC_Code_Ready)
				{
					HT_RC_Code_Ready = FALSE;
					HT_RC_Code_Ready_Overwrite = TRUE;
					Code_Ready = TRUE;
					
					RF_CopyBuffer[0] = HT_Buffer[0];
					RF_CopyBuffer[1] = HT_Buffer[1];
					RF_CopyBuffer[2] = HT_Buffer[2];
					RF_CopyBuffer[3] = HT_Buffer[3];
					
					//if(Timer_RFBlocker.Time_Counters) Timer_RFBlocker.Time_Counters = DEFAULT_TIMER_RFBLOCKER;
					//if(RF_Blocker) RF_Blocker = DEFAULT_TIMER_RFBLOCKER;
				}
				else
				{
					HT_RC_Code_Ready_Overwrite = FALSE;
					HT_RC_Code_Ready = TRUE;
					RF_OldBuffer[0] = HT_Buffer[0];
					RF_OldBuffer[1] = HT_Buffer[1];
					RF_OldBuffer[2] = HT_Buffer[2];
					RF_OldBuffer[3] = HT_Buffer[3];
				}
			}
			HT_ReceptionStart();
		}	
	}
	else if(++HT_TimeCounter>HT_BIT_MAX) HT_ReceptionStart(); // HT_StateRegister=3;
}