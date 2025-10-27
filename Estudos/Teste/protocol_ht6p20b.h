/*
	*!<
	* @file			: protocol_ht6p20b.h
	* @author		: Roberto S. Dias
	* @Date			: 24 de Marco de 2021 - hours: 19:27
	* @Version	: V0.0.0
	* @brief		: File protocol_ht6p20b.h
	*!>
*/
//
/*
	*!<
	* @brief				: #ifndef avoid multiple inclusions of the same library,if not
	*								  defined, then define and include
	* @param				: None
	* @return val		: None
	* @define				: __PROTOCOL_HT6P20B_H
	*!>
*/
//
#ifndef __PROTOCOL_HT6P20B_H		/*!< Open __PROTOCOL_HT6P20B_H */
#define __PROTOCOL_HT6P20B_H
//
/*
	*!<
  * @brief			: Includes - Inclusion of necessary files in the project sheet
  * @param			: None
  * @return val	: None
	*!>
*/
//
//extern uint16_t RF_Blocker;						/*!< Received Blocker */
//extern @tiny Boolean_t HT_RC_Code_Ready_Overwrite;
extern @tiny uint8_t RF_CopyBuffer[4]; // Declaração real (memória alocada aqui) //extern @tiny uint8_t RF_CopyBuffer[4];
extern @tiny uint8_t RF_OldBuffer[4];
extern @tiny uint8_t HT_Buffer[4];
extern @tiny bool HT_RC_Code_Ready;
extern @tiny bool HT_RC_Code_Ready_Overwrite;
extern @tiny bool Code_Ready;
//extern @tiny uint8_t IN_RF_DATA;

/*
	*!<
  * @brief			: defines - definitions of necessary files in the project sheet
  * @param			: None
  * @return val	: None
	*!>
*/
#define DEFAULT_TIMER_RFBLOCKER 500 /*!< every 1ms * 500 = 500mS */
//
#define HT_PILOT_MIN 160			// 160 * 0,000050 = 0,008 S ,  8,0 mS
#define HT_PILOT_MAX 276			// 276 * 0,000050 = 0,0138 S , 13,8 mS 
#define HT_BIT_MIN 6					// 6   * 0,000050 = 0,000300 S, 300 uS 
#define HT_BIT_MAX 25					// 25  * 0,000050 = 0,001250 S , 1,25 mS
#define HT_BITS_TARGET 28 		//Consider Anti Code 0101 - Disregard When Writing(Write 24 Bits - 3 Bytes)

#define GPAIDR	PA_IDR
/*
    TE   TE   TE											  TE   TE   TE
						+----+									  		 +----+----+   
						|		 |												 |	  		 | 
	+----+----+		 +--  Bit Logic 1     +----+		     +--  Bit Logic 0
	|      BIT		 |										|      BIT		 |
*/

//
/*
*!<
* @brief			: Functions of Tim1 - Base Time Prototypes
* @param			: None
* @return val	: None
*!>
*/
void Read_RF_6P20(void);
void HT_ReceptionStart(void);
void HT_SearchPilot(void);
void HT_FallingEdge(void);
void HT_RisingEdge(void);
void HT_ThreatCode(void);
//
//
//
#endif /* Close __PROTOCOL_HT6P20B_H */
//
//
//
/*
	*!<
	* @brief: Descriptions containing the revision controls
	* @Revision Author(Autor da Revisao): Roberto S. Dias
	* @Revision Date(Data da Revisao): 23 de Marco de 2021 - hours: 19:27
	* @Previous Revision control(Revisao Anterior): V0.0.0
	* @Current Revision (Revisao Atual): V0.0.0
	* @Update Description (Descricao da Atualizacao): Start Implementation
	* @Lessons Learned (Licoes Aprendidas):
	*!>
*/