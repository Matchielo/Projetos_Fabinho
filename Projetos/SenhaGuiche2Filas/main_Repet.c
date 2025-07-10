/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "stm8s903k.h" 
#include "stm8s.h"
#include "stm8s_gpio.h"
#include "protocol_ht6p20b.h"
#include "stm8s_conf.h"

//#include "main.h"
//#define GPDIDR	PD_IDR
/* Private typedef -----------------------------------------------------------*/

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

/* Private define ------------------------------------------------------------*/
#define CCR4_Val  			((uint16_t)209)
#define timeDelay 			((uint16_t)22500)
#define T_dataTime_MAX 	((uint16_t)650)
#define T_BIT1					((uint16_t)450)
#define	T_MAX_9MS				((uint16_t)1950)     
#define	T_MIN_9MS				((uint16_t)1050)			
#define	T_MAX_4MS				((uint16_t)1200)
#define	T_MIN_4MS				((uint16_t)450)
#define T_BURST_MX 			((uint16_t)450)
#define mask_16_32 			((uint32_t)0xFFFF0000)				//Auxiliar para verificar se código IR é 16 ou 32 Bits
#define maskData 				((uint32_t)0x0F)							//Auxiliar para extração do dado recebido do Rádio
#define TX_9MS 					((uint16_t)1375)
#define TX_4MS 					((uint16_t)810)
#define TX_BURST				((uint8_t)85)
#define TX_BIT0					((uint8_t)110)
#define TX_BIT1					((uint16_t)300)


//#define COD_PIONNER[1]	((uint8_t)11)
//#define COD_PIONNER[2]	((uint8_t)12)
//#define COD_PIONNER[3]	((uint8_t)13)

//@eeprom u8 	RF_Sync0;						// Guarda Endereço do Rádio
//@eeprom u8 	RF_Sync1;						// Guarda Endereço do Rádio
//@eeprom u8 	RF_Sync2;	// Este byte corresponde a dados, por isso não é gravado na eeprom
//@eeprom u8 	RF_Sync3;						// Guarda Anti-Code Rádio 0x05
//@eeprom u32 Charge_IRCode[8];		// Guarda o modelo de controle programado

/* O Código do Modelo Roadstar1 também funciona com alguns modelos LENOXX E BOOSTER */
const u32 COD_PIONNER1[8] = {0xb54a50af, 0xb54ad02f, 0xb54a42bd, 0xb54ac23d, 0xb54a827d, 0xb54a02fd, 0xb54a1ae5, 0xb54a58a7};
const u32 COD_PIONNER2[8] = {0xb54a50af, 0xb54ad02f, 0xb54a42bd, 0xb54ac23d, 0xb54a827d, 0xb54a02fd, 0xb54a1ae5, 0xb54a58a7};
const u32 COD_PIONNER3[8] = {0xb54a50af, 0xb54ad02f, 0xb54a42bd, 0xb54ac23d, 0xb54a827d, 0xb54a02fd, 0xb54a1ae5, 0xb54a58a7};
const u32 COD_ROADSTAR1[8] = {0x10ef4ab5, 0x10ef02fd, 0x10ef38c7, 0x10efca35, 0x10efe01f, 0x10ef807f, 0x10ef2ad5, 0x10efd02f};
const u32 COD_ROADSTAR2[8] = { 0xFFC837, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_POSITRON1[8] = {0x41be30cf, 0x41bed02f, 0x41be906f, 0x41be10ef, 0x41bea05f, 0x41be609f, 0x41bea857, 0x41bef00f};
const u32 COD_POSITRON2[8] = { 0x20DFB04F, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_POSITRON3[8] = { 0xFF00FF, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_POSITRON4[8] = { 0x40BF8877, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_NAPOLI[8] = {0xff28d7, 0xffa857, 0xffe01f, 0xff609f, 0xfff00f, 0xfff00f, 0xff00ff, 0xff30cf};
const u32 COD_CASKA[8] = {0xff40bf, 0xff8a75, 0xff7a85, 0xffa05f, 0xffe01f, 0xffaa55, 0xff609f, 0xff28d7};
const u32 COD_JVC[8] = {0xf121, 0xf1a1, 0xf1c9, 0xf149, 0xf1a9, 0xf129, 0xf1b1, 0xf171};
const u32 COD_BOOSTER1[8] = { 0x2FD48B7, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_BOOSTER2[8] = { 0x10EF4AB5, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_KENWOOD[8] = { 0x9D6228D7, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_SONY[8] = {0x2421, 0x6421, 0x5621, 0x1621, 0x2621, 0x6621, 0x5021, 0x3121};
const u32 COD_H_BUSTER[8] = { 0x40FF0AF5, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_ALPINE[8] = { 0xFF00FF, 2, 3, 4, 5, 6, 7, 8};
const u32 COD_AIKON[8] = { 0x807FB04F, 2, 3, 4, 5, 6, 7, 8};

u8 		RF_Sync0 = 0; // Este vai para a EEPROM
u8 		RF_Sync1 = 0; // Este vai para a EEPROM
u8 		RF_Sync3 = 0; // Este vai para a EEPROM
u32		Charge_IRCode[8]; // Este vai para a EEPROM

u16		dataRf = 0;										//Variável que recebe o dado comando
u8		stateBot = 0;									//Variável que sinalisa qual função atribuída ao botão
u16 	delayOn = 0;									//Variável ce contagem de tempo base do botão
u8		debounce = 2;									//Variável de filtro do botão 
u8		contMSeg	= 0;								//Variável de contagem de tempo base do botão
u8		contSeg	= 0;									//Variável de contagem de tempo base do botão
u8		ModelControl = 0;							//Variável auxiliar para programação do modelo de IR
u8		point_key = 0;								//Ponteiro que indica qual tecla do IR deverá ser transmitida
u8    RadioOff = 0;									//Conta tempo em que a recepção de RF deve ser suspensa

bool	RF_IN_ON = FALSE;
bool	sinLed = FALSE;					//sinalisa para ligar LED
bool	MS4_OK = FALSE;					//sinalisa que 9ms na recepção IR
bool	MS9_OK	= FALSE;				//sinalisa que 4,5ms na recepção IR
bool  RFin	= FALSE;					//sinalisa que foi recebido um comando de Rádio
bool  codsel = FALSE;					//em False recebe o primeiro e, em True, o segundo comando de RF para programar Modelo IR
bool  Flag_TX9MS = FALSE;			//sinalisa 9ms OK em TX IR
bool  Flag_TX4MS = FALSE;			//sinalisa 4,5ms OK em TX IR
bool  Flag_Burst = FALSE;			//sinalisa 560µs OK em TX IR
bool  Flag_TXBIT = FALSE;			//sinalisa para entrar na rotina de envio de dados IR
bool	TX_BIT = FALSE;				//sinalisa se o bit a ser transmitido viaa IR é ZERO ou UM
bool  selected_Bit = FALSE;		//sinalisa se o bit a ser transmitido já foi selecionado
bool	end_IR_TX = FALSE;			//sinalisa fim da transmissão dos BITs de IR
bool	NRepete = FALSE;
bool  FLAG_BIT = FALSE;

u8		nop	=	0;
u16 	delayLed = 0;
u8 		dig_uni = 0;
u8 		dig_dez = 0;
u8 		dig_cen = 0;

u16		IR_PULSO9MS = 0;
u16		IR_PULSO4MS = 0;
u16		IR_PULSO2MS = 0;
u16		IR_BURST = 0;

u16		dataTime	= 0;
u8		somaBit		= 0;
u32   TXdataIR = 0;

u32		dataIR = 1;
u8		IR_Pointer = 0;
u8		bitcont = 0;
u8		pont_cont = 0;
u8		i = 0;
u8		contBit_IRTx = 0;
u8 		length = 0;

/* Private function prototypes -----------------------------------------------*/
static void TIM1_Config(void);
void 	InitGPIO (void);
void 	Delay (uint32_t nCount);
void 	onInt_TM6 (void);
void 	setCLK (void);
void 	UnlockE2prom (void);
void 	resetMem (void);
void 	emparelharRadio (void);
void 	programaControle (void);
void 	mostraCod (void);
void 	clearDisplay (void);
void	contaBit (void);
void  codSony (void);

/* INÍCIO DO LAÇO PRINCIPAL  */
main()
{
	setCLK();						//inicializa Clock para 16Mhz
	Delay(2000000);			//atraso para iniciar portas Proteção SWIM stm8s001j3
	InitGPIO();					//inicializa GPIOs
	onInt_TM6();				//inicializa Timer 6 para 
	TIM1_Config();			//inicializa PWM TIM1 CH1 - Pino 32 stm8s903k3 em 38kHz 50% Duty
	clearDisplay();
	UnlockE2prom();
	RF_IN_ON = FALSE;	
	IR_PULSO9MS = 0;
	while (1)
	{
		// ROTINA DO BOTÃO DO RECEPTOR (EMPARELHA/PROGRAMA/RESETA)
		/*TESTE E FILTRO SE O BOTÃO FOI APERTADO*/
		if(!GPIO_ReadInputPin(GPIOD, GPIO_PIN_7)){					//testa se botão pressionado
			RF_IN_ON = FALSE;
			if(++debounce >= 250){
				--debounce;
				if(!sinLed){
					stateBot = 1;
				}
				if(++delayOn > timeDelay){
					delayOn = 0;
					if(++contMSeg >= 8){
						contMSeg = 0;
						if((++contSeg >= 5)&&(contSeg < 10)) {
							stateBot = 2;
							sinLed = TRUE;
						}
						if(contSeg >= 10){
							while(!GPIO_ReadInputPin(GPIOD, GPIO_PIN_7)){
							stateBot = 3;
							}
						}
					}
				}
			}
		}
		/*TESTA E FILTRA QUANDO O BOTÃO É SOLTO.
		DIRECIONA CONFORME TEMPO QUE O BOTÃO FOI PRESSIONADO*/
		else {
			if(--debounce <= 1){
				++debounce;
				contMSeg = 0;
				contSeg = 0;
				sinLed = FALSE;
				RF_IN_ON = TRUE;
				switch(stateBot){
					case 0:
						break;
					case 1:
						HT_RC_Code_Ready_Overwrite = FALSE;
						emparelharRadio();
						break;
					case 2:
						programaControle();
						sinLed = FALSE;
						contSeg = 0;
						break;
					case 3:
						resetMem();
						sinLed = FALSE;
						contSeg = 0;					
						break;
				}
				stateBot = 0;				
			}
		}
		/*ROTINA DE PISCAGEM DO LED SE BOTÃO PRESSIONADO 5Seg. (MODO DE PROGRAMA MODEL OR)*/
		if(++delayLed > 32000){
			delayLed = 0;
			if(sinLed){
				GPIO_WriteReverse(GPIOC, GPIO_PIN_6);
			}
		}
		/*ROTINA DE RECEPÇÃO DE COMANDO POR RF*/
		if(HT_RC_Code_Ready_Overwrite){
			HT_RC_Code_Ready_Overwrite = FALSE;
			dataRf = 0;
			if(!RFin){
				if(RF_CopyBuffer[0] == RF_Sync0){
					if(RF_CopyBuffer[1] == RF_Sync1){
						if(RF_CopyBuffer[3] == RF_Sync3){
							dataRf = RF_CopyBuffer[2] & maskData;
							RFin = TRUE;
							switch(dataRf){
								case 12:														//Tecla + == 0
									point_key = 0;
									break;
								case 9:															//Tecla - == 1
									point_key = 1;
									break;							
								case 3:															//Tecla << == 2
									point_key = 2;
									break;							
								case 6:															//Tecla >> == 3
									point_key = 3;
									break;							
								case 2:															//Tecla DWN == 4
									point_key = 4;
									break;							
								case 1:															//Tecla UP == 5
									point_key = 5;
									break;							
								case 4:															//Tecla PLAY/PAUSE == 6
									point_key = 6;
									break;							
								case 8:															//Tecla POWER == 7
									point_key = 7;
									break;							
							}
							TXdataIR = Charge_IRCode[point_key];
							if(!(TXdataIR & mask_16_32)){					//Testa se o código é 16 ou 32 Bits
								TXdataIR <<= 16;
								length = 15;
							}
							else {
								length = 31;
							}
							Flag_TX9MS = FALSE;
							if(Charge_IRCode[0] == 0x2421){
								codSony();
							}
							dataRf = 8888;
							mostraCod();
						}
					}
				}
			}
		}
		if(RFin){
			if(!Flag_TX9MS){
				TIM1_CtrlPWMOutputs(ENABLE);				
				if(++IR_PULSO9MS > 1237){
					TIM1_CtrlPWMOutputs(DISABLE);					
					Flag_TX9MS = TRUE;
					Flag_TX4MS = TRUE;
					IR_PULSO9MS = 0;
					IR_PULSO4MS = 0;
				}
			}
			if(Flag_TX4MS){
				if(++IR_PULSO4MS > 656){
					IR_PULSO4MS = 0;
					IR_PULSO2MS = 0;
					Flag_TX4MS = FALSE;
					Flag_Burst = TRUE;
					IR_BURST = 0;
					contBit_IRTx = 0;
					end_IR_TX = FALSE;
				}
			}
		}
		if(Flag_Burst){
			TIM1_CtrlPWMOutputs(ENABLE);
			if(++IR_BURST > 74){
				IR_BURST = 0;
				TIM1_CtrlPWMOutputs(DISABLE);
				Flag_Burst = FALSE;
				Flag_TXBIT = TRUE;
				if(end_IR_TX){
					RFin = FALSE;
					Flag_TXBIT = FALSE;
					clearDisplay();
				}
			}
		}
		if(Flag_TXBIT){
			if(!selected_Bit){
				selected_Bit = TRUE;
				if(TXdataIR & 0x80000000){
					TX_BIT = FALSE;
				}
				else {
					TX_BIT = TRUE;
				}
				if(++contBit_IRTx > length){		// Testa se já deu 16 ou 32 Bits
					end_IR_TX = TRUE;
				}
				else {
					TXdataIR <<= 0x01;
				}
			}
			if(TX_BIT){				//Se TX Bit = 0 conta aqui 2,25ms
				if(++IR_PULSO4MS > 82){
					IR_PULSO4MS = 0;
					selected_Bit = FALSE;
					Flag_Burst = TRUE;
					Flag_TXBIT = FALSE;
				}
			}
			else {						//Se TX Bit = 1 conta 4,5ms
				if(++IR_PULSO2MS > 249){
					IR_PULSO2MS = 0;
					selected_Bit = FALSE;
					Flag_Burst = TRUE;
					Flag_TXBIT = FALSE;
				}
			}
		}
	}
}

/* ROTINA DE EMPARELHAMENTO ENTRE RÁDIO_TX E RECEPTOR */
void emparelharRadio()
{
	bool 	flagSai = 1;
	bool	soltaBot = 1;
	RF_IN_ON = TRUE;
	while(flagSai){
		if(++delayLed > 64000){
			GPIO_WriteReverse(GPIOC, GPIO_PIN_6);
			delayLed = 0;
		}
		else {
			flagSai = 1;
		}
		if(!GPIO_ReadInputPin(GPIOD, GPIO_PIN_7)){					//testa se botão pressionado
			if(++debounce >= 250){
				--debounce;
				soltaBot = 0;
			}
		}	
		else {
			flagSai = 1;
		}
		if(GPIO_ReadInputPin(GPIOD, GPIO_PIN_7)){
			if(!soltaBot){
				if(--debounce <= 1){
					++debounce;
					GPIO_WriteLow(GPIOC, GPIO_PIN_6);
					Delay(400000);					
					flagSai = 0;
				}
			}
		}
		if(HT_RC_Code_Ready_Overwrite){
			RF_Sync0 = RF_CopyBuffer[0];
			RF_Sync1 = RF_CopyBuffer[1];
			//RF_Sync2 = RF_CopyBuffer[2];
			RF_Sync3 = RF_CopyBuffer[3];
			
			dataRf = RF_CopyBuffer[2] & maskData;
			
			RF_IN_ON = FALSE;
			HT_RC_Code_Ready_Overwrite = FALSE;
			debounce = 250;
			soltaBot = 0;
			GPIO_WriteLow(GPIOC, GPIO_PIN_6);
			Delay(400000);			
		}
	}
	GPIO_WriteLow(GPIOC, GPIO_PIN_6);
	//mostraCod();
}

/* ROTINA DE SELEÇÃO/PROGRAMAÇÃO DE CÓDIGO INFRAVERMELHO - PRIMEIRA PARTE */
void programaControle()
{
	IR_PULSO9MS = 0;
	
	while(1)
	{
		dataRf = 0;
		if(!GPIO_ReadInputPin(GPIOD, GPIO_PIN_2)){
			HT_RC_Code_Ready_Overwrite = FALSE;
			IR_PULSO4MS = 0;
			if(MS4_OK == TRUE){
				contaBit();
			}
			if(++IR_PULSO9MS > T_MAX_9MS){				 //Conta sinal até máximo de 9ms
				IR_PULSO9MS = 0;										 //Se passou de 9ms, zera contador
				MS9_OK = FALSE;
			}
			if(IR_PULSO9MS > T_MIN_9MS){
				MS9_OK = TRUE;
			}			
		}
		if(GPIO_ReadInputPin(GPIOD, GPIO_PIN_2)){
			IR_PULSO9MS = 0;
			MS4_OK = FALSE;
			if(MS9_OK == TRUE){
				if(++IR_PULSO4MS > T_MAX_4MS){				 //Conta sinal até máximo de 9ms
					IR_PULSO4MS = 0;										 //Se passou de 9ms, zera contador
					MS9_OK = FALSE;
					MS4_OK = FALSE;
				}
				if(IR_PULSO4MS > T_MIN_4MS){
					MS4_OK = TRUE;
				}			
			}
		}
		//TEMPO PARA PISCAGEM DO LED
		if(++delayLed > 32000){
			delayLed = 0;
			GPIO_WriteReverse(GPIOC, GPIO_PIN_6);
			//if(++RadioOff > 3) {
			//	RF_IN_ON = TRUE;
			//}
		}
		//RECEPÇÃO DE COMANDO PARA PROGRAMAÇÃO
		if(HT_RC_Code_Ready_Overwrite && !MS4_OK){
			HT_RC_Code_Ready_Overwrite = FALSE;
			dataRf = 0;
			if(RF_CopyBuffer[0] == RF_Sync0){
				if(RF_CopyBuffer[1] == RF_Sync1){
					if(RF_CopyBuffer[3] == RF_Sync3){
						dataRf = RF_CopyBuffer[2] & maskData;
						if(!codsel){
							ModelControl = dataRf;
							codsel = TRUE;
							RF_IN_ON = FALSE;
							RadioOff = 0;
							GPIO_WriteLow(GPIOC, GPIO_PIN_6);
							Delay(600000);
						}
						else {
							codsel = FALSE;
							if(ModelControl <= 3){	
								switch(ModelControl){
									case 3:							//Tecla << == 3
										if(dataRf == 1)  ModelControl = 0;	//Tecla UP
										if(dataRf == 2)  ModelControl = 1;	//Tecla DWN 
										if(dataRf == 3)  ModelControl = 2;	//Tecla <<
										if(dataRf == 4)  ModelControl = 3;	//Tecla PLAY/PAUSE
										if(dataRf == 6)  ModelControl = 4;	//Tecla >>
										if(dataRf == 8)  ModelControl = 5;	//Tecla POWER
										if(dataRf == 9)  ModelControl = 6;	//Tecla -
										if(dataRf == 12) ModelControl = 7;	//Tecla +
										break;							
									case 2:							//Tecla DWN == 2 
										if(dataRf == 1)  ModelControl = 8;	//Tecla UP
										if(dataRf == 2)  ModelControl = 9;	//Tecla DWN
										if(dataRf == 3)  ModelControl = 10;	//Tecla <<
										if(dataRf == 4)  ModelControl = 11;	//Tecla PLAY/PAUSE
										if(dataRf == 6)  ModelControl = 12;	//Tecla >>
										if(dataRf == 8)  ModelControl = 13;	//Tecla POWER
										if(dataRf == 9)  ModelControl = 14;	//Tecla -
										if(dataRf == 12) ModelControl = 15;	//Tecla +
										break;						
									case 1:							//Tecla UP == 1
										if(dataRf == 1)  ModelControl = 16;	//Tecla UP
										if(dataRf == 2)  ModelControl = 17;	//Tecla DWN
										if(dataRf == 3)  ModelControl = 18;	//Tecla <<
										if(dataRf == 4)  ModelControl = 19;	//Tecla PLAY/PAUSE
										if(dataRf == 6)  ModelControl = 20;	//Tecla >>
										if(dataRf == 8)  ModelControl = 0;	//Tecla POWER
										if(dataRf == 9)  ModelControl = 0;	//Tecla -
										if(dataRf == 12) ModelControl = 0;	//Tecla +
										break;
								}
							}
							else {
								ModelControl = 100;
							}
							switch(ModelControl){
								case 0:																						//
									break;					
								case 1:																						//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_PIONNER1[i];
									}
									break;
								case 2:																						//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_PIONNER2[i];
									}
									break;				
								case 3:																						//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_PIONNER3[i];
									}
									break;				
								case 4:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_ROADSTAR1[i];
									}
									break;				
								case 5:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_ROADSTAR2[i];
									}
									break;				
								case 6:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_POSITRON1[i];
									}
									break;				
								case 7:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_POSITRON2[i];
									}
									break;				
								case 8:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_POSITRON3[i];
									}
									break;				
								case 9:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_POSITRON4[i];
									}
									break;					
								case 10:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_NAPOLI[i];
									}
									break;
								case 11:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_CASKA[i];
									}
									break;				
								case 12:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_JVC[i];
									}
									break;				
								case 13:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_BOOSTER1[i];
									}
									break;				
								case 14:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_BOOSTER2[i];
									}
									break;				
								case 15:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_KENWOOD[i];
									}
									break;				
								case 16:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_SONY[i];
									}
									break;				
								case 17:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_H_BUSTER[i];
									}
									break;	
								case 18:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_ALPINE[i];
									}
									break;				
								case 19:							//
									for(i = 0; i < 8; i++){
										Charge_IRCode[i] = COD_AIKON[i];
									}
									break;		
							}
							GPIO_WriteLow(GPIOC, GPIO_PIN_6);
							Delay(600000);
							dataRf = ModelControl;
							mostraCod();
							//for(i = 0; i < 8; i++){
							//	IR_Code_TX[i] = Charge_IRCode[i];
							//}
							HT_RC_Code_Ready_Overwrite = FALSE;
							return;
						}
						RF_IN_ON = TRUE;
					}
				}
			}
		}
		if(!GPIO_ReadInputPin(GPIOD, GPIO_PIN_7)){					//testa se botão pressionado
			if(++debounce >= 250){
				--debounce;
				GPIO_WriteLow(GPIOC, GPIO_PIN_6);
				Delay(600000);				
				return;
			}
		}
		else {
			debounce = 0;
		}
	}
} 
/* ROTINA DE SELEÇÃO/PROGRAMAÇÃO DE CÓDIGO INFRAVERMELHO - SEGUNDA PARTE */
void contaBit()
{
	dataIR	= 0;
	MS9_OK  = FALSE;	
	dataTime = 0;
	IR_BURST = 0;
	somaBit	 = 0;

	FLAG_BIT = FALSE;
	while(1){
		if(!GPIO_ReadInputPin(GPIOD, GPIO_PIN_2)){
			if(++IR_BURST > T_BURST_MX){
				MS9_OK = FALSE;
				MS4_OK = FALSE;
				IR_PULSO4MS = 0;
				IR_PULSO9MS = 0;
				return;
			}
			if(FLAG_BIT){								//testa maior tempo => BIT 1
				if(dataTime > T_BIT1){		//se não for BIT 0
					dataTime = 0;
					FLAG_BIT = FALSE;
					dataIR <<= 0x01;
					dataIR += 0x01;
				}
				else {										//se ainda não é maior, então ainda é BIT 0
					dataTime = 0;
					FLAG_BIT = FALSE;
					dataIR <<= 0x01;
				}
			}
		}
		else {
			if(++dataTime > T_dataTime_MAX){
				IR_Pointer = 0;
				pont_cont = 0;
				bitcont = 0;
				return;
			} 
			FLAG_BIT = TRUE;
			IR_BURST = 0;
		}
	}
}

/* ROTINA DE CONFIGURAÇÃO DE GPIOS */
void InitGPIO(void)
{
	PA_DDR = 0b00000000;							//PA1 = RF_IN.
	PA_CR1 = 0b00000000;							
	
	PB_DDR = 0b00001111;							//PB0 a PB3 BCD->7seg. PB4 e PB5 RTC I2C. PB6 = SQ_RTC. PR4 e PB5 = I2C
	PB_CR1 = 0b00111111;							
	PB_ODR = 0b00000000;
	PB_CR2 = 0b00000000;
	
	PC_DDR = 0b11111110;							//PC1 a PC5 -> Dig_2 a Dig_6. PC6=RL1. PC7=RL2
	PC_CR1 = 0b11111110;
	PC_ODR = 0b00000000;
	
	PD_DDR = 0b00001001;							//PD0=";". PD2=POT. PD3=Buzzer. PD4 a PD7 =E1, E2, E3, E4
	PD_CR1 = 0b11111001;
	PD_ODR = 0b00000000;
	
	PE_DDR = 0b00100000;							//PE5 = Dig1
	PE_CR1 = 0b00100000;	
	PE_ODR = 0b00000000;
	
	PF_DDR = 0b00000000;
	PF_CR1 = 0b00000000;

}

/* ROTINA DE DELAY */
void Delay(uint32_t nCount)
{
  // Decrement nCount value
  while (nCount != 0)
  {
    nCount--;
  }
}

/* Restaura a memória ao padrão de fábrica */
void resetMem(void)
{
	//GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
	++nop;
}

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

/* ROTINA DE CONFIGURAÇÃO DO CLOCK PARA 16MHz */
void setCLK(void)
{
	CLK_CKDIVR = 0b00000000;
}

/* ROTINA DE DESTRAVA DA EEPROM */
void UnlockE2prom(void)
{
	FLASH_DUKR = 0xAE;
	FLASH_DUKR = 0x56;
}

/* ROTINA DA INTERRUPÇÃO DE 50us DO RF */
@far @interrupt void TIM6_UPD_IRQHandler (void)
{
	//GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
	if(RF_IN_ON){
		Read_RF_6P20();
	}
	//GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
	TIM6_SR = 0;		
}

/* ROTINA DE CONFIGURAÇÃO DO PWM A 38KHz PARA INFRAVERMELHO */
static void TIM1_Config(void)
{
  TIM1_DeInit();
  /* Time Base configuration */
  /*
  TIM1_Period = 418 => (38KhZ)
  TIM1_Prescaler = 0
  TIM1_CounterMode = TIM1_COUNTERMODE_UP
  TIM1_RepetitionCounter = 0
  */
  TIM1_TimeBaseInit(0, TIM1_COUNTERMODE_UP, 418, 0);
  /* Channel 1, 2,3 and 4 Configuration in PWM mode */
  /*
  TIM1_OCMode = TIM1_OCMODE_PWM2
  TIM1_OutputState = TIM1_OUTPUTSTATE_ENABLE
  TIM1_Pulse = CCR4_Val
  TIM1_OCPolarity = TIM1_OCPOLARITY_LOW
  TIM1_OCIdleState = TIM1_OCIDLESTATE_SET
	*/
  /*TIM1_Pulse = CCR4_Val*/
  TIM1_OC4Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, CCR4_Val, TIM1_OCPOLARITY_LOW,
               TIM1_OCIDLESTATE_SET);							 

  /* TIM1 counter enable */
  TIM1_Cmd(ENABLE);

  /* TIM1 Main Output Enable */
  //TIM1_CtrlPWMOutputs(ENABLE);
}


void mostraCod(void)
{
	dig_cen = dataRf /100;
	if(dig_cen == 0) dig_cen = 15;
	dig_dez = dataRf / 10;
	if(dig_dez == 0 && dig_cen == 15) dig_dez = 15;
	dig_uni = dataRf % 10;
	PB_ODR = dig_cen; //GPIO_Write(GPIOB, dig_cen);
	PC_ODR |= PIN_1; //GPIO_WriteHigh(GPIOC, GPIO_PIN_2);
	++nop; //GPIO_WriteLow(GPIOC, GPIO_PIN_2);
	PC_ODR &= ~PIN_1; //GPIO_Write(GPIOB, dig_dez);
	++nop; //GPIO_WriteHigh(GPIOC, GPIO_PIN_3);
	PB_ODR = dig_dez; //GPIO_WriteLow(GPIOC, GPIO_PIN_3);
	PC_ODR |= PIN_2; //GPIO_Write(GPIOB, dig_uni);
	++nop; //GPIO_WriteHigh(GPIOC, GPIO_PIN_4);
	PC_ODR &= ~PIN_2; //GPIO_WriteLow(GPIOC, GPIO_PIN_4);
	++nop;
	PB_ODR = dig_uni;
	PC_ODR |= PIN_3;
	++nop;
	PC_ODR &= ~PIN_3;
}

void clearDisplay()
{
	PB_ODR = 15;
	PC_ODR = 0b00101110;
	PE_ODR |= PIN_5;
	++nop;
	PC_ODR = 0b00000000;
	PE_ODR &= ~PIN_5;
}

void codSony()
{
	TXdataIR <<= 0x01;
	while(1)
	{
		if(!Flag_TX9MS){
			TIM1_CtrlPWMOutputs(ENABLE);				
			if(++IR_PULSO9MS > 980){
				TIM1_CtrlPWMOutputs(DISABLE);					
				IR_BURST = 0;
				IR_PULSO9MS = 0;
				IR_PULSO4MS = 0;
				IR_PULSO2MS = 0;
				contBit_IRTx = 0;
				end_IR_TX = FALSE;
				Flag_TX9MS = TRUE;
				Flag_Burst = TRUE;
			}
		}
		if(Flag_Burst){
			TIM1_CtrlPWMOutputs(DISABLE);
			if(++IR_BURST > 255){
				IR_BURST = 0;
				TIM1_CtrlPWMOutputs(ENABLE);
				Flag_Burst = FALSE;
				Flag_TXBIT = TRUE;
			}
		}
		if(Flag_TXBIT){
			if(!selected_Bit){
				selected_Bit = TRUE;
				if(TXdataIR & 0x80000000){
					TX_BIT = FALSE; // Resultado BIT = 1
				}
				else {
					TX_BIT = TRUE; // Resultado BIT = 0
				}
				if(++contBit_IRTx > 14){		// Testa se já deu 15 Bits da Sony
					end_IR_TX = TRUE;
				}
				else {
					TXdataIR <<= 0x01;
				}
			}
			if(TX_BIT){				//Se TX Bit = 0 conta aqui 2,25ms
				if(++IR_PULSO4MS > 333){
					IR_PULSO4MS = 0;
					selected_Bit = FALSE;
					Flag_Burst = TRUE;
					Flag_TXBIT = FALSE;
					if(end_IR_TX){
						TIM1_CtrlPWMOutputs(DISABLE);
						IR_BURST = 0;
						IR_PULSO9MS = 0;
						IR_PULSO4MS = 0;
						IR_PULSO2MS = 0;
						contBit_IRTx = 0;
						end_IR_TX = FALSE;
						Flag_TX9MS = FALSE;
						Flag_Burst = FALSE;
						RFin = FALSE;
						Flag_TXBIT = FALSE;						
						return;
					}
				}
			}
			else {						//Se TX Bit = 1 conta 4,5ms
				if(++IR_PULSO2MS > 643){
					IR_PULSO2MS = 0;
					selected_Bit = FALSE;
					Flag_Burst = TRUE;
					Flag_TXBIT = FALSE;
					if(end_IR_TX){
						TIM1_CtrlPWMOutputs(DISABLE);
						IR_BURST = 0;
						IR_PULSO9MS = 0;
						IR_PULSO4MS = 0;
						IR_PULSO2MS = 0;
						contBit_IRTx = 0;
						end_IR_TX = FALSE;
						Flag_TX9MS = FALSE;
						Flag_Burst = FALSE;
						RFin = FALSE;
					  Flag_TXBIT = FALSE;
						return;
					}
				}
			}
		}
	}
}