; ST72264G2.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST72264G2__
; do nothing
	#else
	#define __ST72264G2__ 1

; ST72264G2


; Port C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PCDR.b		; Data Register

	EXTERN PCDDR.b		; Data Direction Register

	EXTERN PCOR.b		; Option Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBDDR.b		; Data Direction Register

	EXTERN PBOR.b		; Option Register

; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

	EXTERN PAOR.b		; Option Register

; Interrupt Software Priority (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;External IT 0 Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;External IT 0 Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;External IT 1 Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;External IT 1 Priority Level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;Clock Filter IT Priority Level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;Clock Filter IT Priority Level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;SPI IT Priority Level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;SPI IT Priority Level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR1.b		; Interrupt Software Priority Register 1
	#define ISPR1_I0_4	0		;Timer A IT Priority Level
	#define ISPR1_I0_4_OR	$01
	#define ISPR1_I1_4	1		;Timer A IT Priority Level
	#define ISPR1_I1_4_OR	$02
	#define ISPR1_I_4_OR	$03
	#define ISPR1_I0_5	2		;MCC IT Priority Level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;MCC IT Priority Level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;Timer B IT Priority Level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;Timer B IT Priority Level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;AVD IT Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;AVD IT Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_10	4		;SCI IT Priority Level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;SCI IT Priority Level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30
	#define ISPR2_I0_11	6		;I2C IT Priority Level
	#define ISPR2_I0_11_OR	$40
	#define ISPR2_I1_11	7		;I2C IT Priority Level
	#define ISPR2_I1_11_OR	$80
	#define ISPR2_I_11_OR	$c0

	EXTERN ISPR3.b		; Not used

; Miscellaneous 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR1.b		; Miscellaneous Register 1
	#define MISCR1_SMS	0		;Slow Mode Select
	#define MISCR1_SMS_OR	$01
	#define MISCR1_CP0	1		;CPU Clock Prescaler
	#define MISCR1_CP0_OR	$02
	#define MISCR1_CP1	2		;CPU Clock Prescaler
	#define MISCR1_CP1_OR	$04
	#define MISCR1_CP_OR	$06
	#define MISCR1_IS00	3		;EI0 Sensibility
	#define MISCR1_IS00_OR	$08
	#define MISCR1_IS01	4		;EI0 Sensibility
	#define MISCR1_IS01_OR	$10
	#define MISCR1_IS0_OR	$18
	#define MISCR1_MCO	5		;Main Clock Out
	#define MISCR1_MCO_OR	$20
	#define MISCR1_IS10	6		;EI1 Sensibility
	#define MISCR1_IS10_OR	$40
	#define MISCR1_IS11	7		;EI1 Sensibility
	#define MISCR1_IS11_OR	$80
	#define MISCR1_IS1_OR	$c0

; Serial Peripheral Interface (SPI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SPIDR.b		; Data I/O Register

	EXTERN SPICR.b		; Control Register
	#define SPICR_SPR0	0		;Baud Rate
	#define SPICR_SPR0_OR	$01
	#define SPICR_SPR1	1		;Baud Rate
	#define SPICR_SPR1_OR	$02
	#define SPICR_SPR2	5		;Baud Rate
	#define SPICR_SPR2_OR	$20
	#define SPICR_SPR_OR	$23
	#define SPICR_CPHA	2		;Clock Phase
	#define SPICR_CPHA_OR	$04
	#define SPICR_CPOL	3		;Clock Polarity
	#define SPICR_CPOL_OR	$08
	#define SPICR_MSTR	4		;Master Bit
	#define SPICR_MSTR_OR	$10
	#define SPICR_SPE	6		;Serial Peripheral Output
	#define SPICR_SPE_OR	$40
	#define SPICR_SPIE	7		;Serial Peripheral Interrupt
	#define SPICR_SPIE_OR	$80

	EXTERN SPICSR.b		; Control/Status Register
	#define SPICSR_SSI	0		;SS Internal Mode
	#define SPICSR_SSI_OR	$01
	#define SPICSR_SSM	1		;SS Management
	#define SPICSR_SSM_OR	$02
	#define SPICSR_SOD	2		;SPI Output Disable
	#define SPICSR_SOD_OR	$04
	#define SPICSR_MODF	4		;Mode Fault Flag
	#define SPICSR_MODF_OR	$10
	#define SPICSR_OVR	5		;SPI Overrun error
	#define SPICSR_OVR_OR	$20
	#define SPICSR_WCOL	6		;Write Collision Status
	#define SPICSR_WCOL_OR	$40
	#define SPICSR_SPIF	7		;Data Transfer Flag
	#define SPICSR_SPIF_OR	$80

; WatchDog Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN WDGCR.b		; Control Register
	#define WDGCR_WDGA	7		;Activation Bit
	#define WDGCR_WDGA_OR	$80
	#define WDGCR_T0	0		;7-bit Timer
	#define WDGCR_T0_OR	$01
	#define WDGCR_T1	1		;7-bit Timer
	#define WDGCR_T1_OR	$02
	#define WDGCR_T2	2		;7-bit Timer
	#define WDGCR_T2_OR	$04
	#define WDGCR_T3	3		;7-bit Timer
	#define WDGCR_T3_OR	$08
	#define WDGCR_T4	4		;7-bit Timer
	#define WDGCR_T4_OR	$10
	#define WDGCR_T5	5		;7-bit Timer
	#define WDGCR_T5_OR	$20
	#define WDGCR_T6	6		;7-bit Timer
	#define WDGCR_T6_OR	$40
	#define WDGCR_T_OR	$7f

; System Integrity Control/Status Register (SICSR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SICSR.b		; System Integrity Control/Status Register
	#define SICSR_WDGRF	0		;Watchdog Reset Flag
	#define SICSR_WDGRF_OR	$01
	#define SICSR_CSSD	1		;Clock security system detection
	#define SICSR_CSSD_OR	$02
	#define SICSR_CSSIE	2		;Clock security system interrupt enable
	#define SICSR_CSSIE_OR	$04
	#define SICSR_LVDRF	4		;LVD Reset Flag
	#define SICSR_LVDRF_OR	$10
	#define SICSR_AVDF	5		;Voltage Detector Flag
	#define SICSR_AVDF_OR	$20
	#define SICSR_AVDIE	6		;Voltage Detector Interrupt Enable
	#define SICSR_AVDIE_OR	$40

; Main Clock Control/Status Register (MCC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MCCSR.b		; Main Clock Control/Status Register
	#define MCCSR_OIF	0		;Oscillator Interrupt Flag
	#define MCCSR_OIF_OR	$01
	#define MCCSR_OIE	1		;Oscillator Interrupt
	#define MCCSR_OIE_OR	$02
	#define MCCSR_TB0	2		;Time Base Control
	#define MCCSR_TB0_OR	$04
	#define MCCSR_TB1	3		;Time Base Control
	#define MCCSR_TB1_OR	$08
	#define MCCSR_TB_OR	$0c

; I2C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN I2CCR.b		; Control Register
	#define I2CCR_ITE	0		;I2C Interrupt
	#define I2CCR_ITE_OR	$01
	#define I2CCR_STOP	1		;Generation of a Stop Condition
	#define I2CCR_STOP_OR	$02
	#define I2CCR_ACK	2		;Acknowledge
	#define I2CCR_ACK_OR	$04
	#define I2CCR_START	3		;Generation of a Start Condition
	#define I2CCR_START_OR	$08
	#define I2CCR_ENGC	4		;General Call
	#define I2CCR_ENGC_OR	$10
	#define I2CCR_PE	5		;Peripheral I2C
	#define I2CCR_PE_OR	$20

	EXTERN I2CSR1.b		; Status Register 1
	#define I2CSR1_SB	0		;Start Bit
	#define I2CSR1_SB_OR	$01
	#define I2CSR1_M_SL	1		;Master/Slave Mode
	#define I2CSR1_M_SL_OR	$02
	#define I2CSR1_ADSL	2		;Address Matched
	#define I2CSR1_ADSL_OR	$04
	#define I2CSR1_BTF	3		;Byte Transfer
	#define I2CSR1_BTF_OR	$08
	#define I2CSR1_BUSY	4		;Bus Busy
	#define I2CSR1_BUSY_OR	$10
	#define I2CSR1_TRA	5		;Transmitter/Receiver
	#define I2CSR1_TRA_OR	$20
	#define I2CSR1_ADD10	6		;10-Bit Addressing Mode
	#define I2CSR1_ADD10_OR	$40
	#define I2CSR1_EVF	7		;Event Flag
	#define I2CSR1_EVF_OR	$80

	EXTERN I2CSR2.b		; Status Register 2
	#define I2CSR2_GCAL	0		;General Call
	#define I2CSR2_GCAL_OR	$01
	#define I2CSR2_BERR	1		;Bus Error
	#define I2CSR2_BERR_OR	$02
	#define I2CSR2_ARLO	2		;Arbitration Lost
	#define I2CSR2_ARLO_OR	$04
	#define I2CSR2_STOPF	3		;Stop Detection
	#define I2CSR2_STOPF_OR	$08
	#define I2CSR2_AF	4		;Acknowledge Failure
	#define I2CSR2_AF_OR	$10

	EXTERN I2CCCR.b		; Clock Control Register
	#define I2CCCR_CC0	0		;7-bit Clock Divider
	#define I2CCCR_CC0_OR	$01
	#define I2CCCR_CC1	1		;7-bit Clock Divider
	#define I2CCCR_CC1_OR	$02
	#define I2CCCR_CC2	2		;7-bit Clock Divider
	#define I2CCCR_CC2_OR	$04
	#define I2CCCR_CC3	3		;7-bit Clock Divider
	#define I2CCCR_CC3_OR	$08
	#define I2CCCR_CC4	4		;7-bit Clock Divider
	#define I2CCCR_CC4_OR	$10
	#define I2CCCR_CC5	5		;7-bit Clock Divider
	#define I2CCCR_CC5_OR	$20
	#define I2CCCR_CC6	6		;7-bit Clock Divider
	#define I2CCCR_CC6_OR	$40
	#define I2CCCR_CC_OR	$7f
	#define I2CCCR_FM_SM	7		;Fast Mode Select
	#define I2CCCR_FM_SM_OR	$80

	EXTERN I2COAR1.b		; Own Address Register 1
	#define I2COAR1_ADD0	0		;Direction Bit (7-bit address) or Interface Address (10-bit address)
	#define I2COAR1_ADD0_OR	$01
	#define I2COAR1_ADD1	1		;Interface Address
	#define I2COAR1_ADD1_OR	$02
	#define I2COAR1_ADD2	2		;Interface Address
	#define I2COAR1_ADD2_OR	$04
	#define I2COAR1_ADD3	3		;Interface Address
	#define I2COAR1_ADD3_OR	$08
	#define I2COAR1_ADD4	4		;Interface Address
	#define I2COAR1_ADD4_OR	$10
	#define I2COAR1_ADD5	5		;Interface Address
	#define I2COAR1_ADD5_OR	$20
	#define I2COAR1_ADD6	6		;Interface Address
	#define I2COAR1_ADD6_OR	$40
	#define I2COAR1_ADD7	7		;Interface Address
	#define I2COAR1_ADD7_OR	$80
	#define I2COAR1_ADD_OR	$fe

	EXTERN I2COAR2.b		; Own Address Register 2
	#define I2COAR2_ADD8	1		;Interface Address (10-bit addressing mode)
	#define I2COAR2_ADD8_OR	$02
	#define I2COAR2_ADD9	2		;Interface Address (10-bit addressing mode)
	#define I2COAR2_ADD9_OR	$04
	#define I2COAR2_ADD_OR	$06
	#define I2COAR2_FR0	6		;Frequency Bits
	#define I2COAR2_FR0_OR	$40
	#define I2COAR2_FR1	7		;Frequency Bits
	#define I2COAR2_FR1_OR	$80
	#define I2COAR2_FR_OR	$c0

	EXTERN I2CDR.b		; Data Register

; 16-Bit Timer A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TACR2.b		; Control Register 2
	#define TACR2_EXEDG	0		;External Clock Edge
	#define TACR2_EXEDG_OR	$01
	#define TACR2_IEDG2	1		;Input Edge 2
	#define TACR2_IEDG2_OR	$02
	#define TACR2_CC0	2		;Clock Control
	#define TACR2_CC0_OR	$04
	#define TACR2_CC1	3		;Clock Control
	#define TACR2_CC1_OR	$08
	#define TACR2_CC_OR	$0c
	#define TACR2_PWM	4		;Pulse Width Modulation
	#define TACR2_PWM_OR	$10
	#define TACR2_OPM	5		;One Pulse Mode
	#define TACR2_OPM_OR	$20
	#define TACR2_OC2E	6		;Output Compare 2 Output Pin
	#define TACR2_OC2E_OR	$40
	#define TACR2_OC1E	7		;Output Compare 1 Output Pin
	#define TACR2_OC1E_OR	$80

	EXTERN TACR1.b		; Control Register 1
	#define TACR1_OLVL1	0		;Output Level 1
	#define TACR1_OLVL1_OR	$01
	#define TACR1_IEDG1	1		;Input Edge 1
	#define TACR1_IEDG1_OR	$02
	#define TACR1_OLVL2	2		;Output Level 2
	#define TACR1_OLVL2_OR	$04
	#define TACR1_FOLV1	3		;Forced Output Compare 1
	#define TACR1_FOLV1_OR	$08
	#define TACR1_FOLV2	4		;Forced Output Compare 2
	#define TACR1_FOLV2_OR	$10
	#define TACR1_TOIE	5		;Timer Overflow Interrupt
	#define TACR1_TOIE_OR	$20
	#define TACR1_OCIE	6		;Output Compare Interrupt
	#define TACR1_OCIE_OR	$40
	#define TACR1_ICIE	7		;Input Capture Interrupt
	#define TACR1_ICIE_OR	$80

	EXTERN TACSR.b		; Status Register
	#define TACSR_TIMD	2		;Timer prescaler,counter and outputs enable/disable
	#define TACSR_TIMD_OR	$04
	#define TACSR_OCF2	3		;Output Compare Flag 2
	#define TACSR_OCF2_OR	$08
	#define TACSR_ICF2	4		;Input Capture Flag 2
	#define TACSR_ICF2_OR	$10
	#define TACSR_TOF	5		;Timer Overflow
	#define TACSR_TOF_OR	$20
	#define TACSR_OCF1	6		;Output Compare Flag 1
	#define TACSR_OCF1_OR	$40
	#define TACSR_ICF1	7		;Input Capture Flag 1
	#define TACSR_ICF1_OR	$80

	EXTERN TAIC1HR.b		; Input Capture 1 High Register

	EXTERN TAIC1LR.b		; Input Capture 1 Low Register

	EXTERN TAOC1HR.b		; Output Compare 1 High Register

	EXTERN TAOC1LR.b		; Output Compare 1 Low Register

	EXTERN TACHR.b		; Counter High Register

	EXTERN TACLR.b		; Counter Low Register

	EXTERN TAACHR.b		; Alternate Counter High Register

	EXTERN TAACLR.b		; Alternate Counter Low Register

	EXTERN TAIC2HR.b		; Input Capture 2 High Register

	EXTERN TAIC2LR.b		; Input Capture 2 Low Register

	EXTERN TAOC2HR.b		; Output Compare 2 High Register

	EXTERN TAOC2LR.b		; Output Compare 2 Low Register

; Miscellaneous 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR2.b		; Miscellaneous Register 2
	#define MISCR2_SSI	0		;Internal Mode
	#define MISCR2_SSI_OR	$01
	#define MISCR2_SSM	1		;Mode Selection
	#define MISCR2_SSM_OR	$02
	#define MISCR2_SOP	2		;SPI Slave Output Disable
	#define MISCR2_SOP_OR	$04
	#define MISCR2_MOD	3		;SPI Master Output Disable
	#define MISCR2_MOD_OR	$08

; 16-Bit Timer B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TBCR2.b		; Control Register 2
	#define TBCR2_EXEDG	0		;External Clock Edge
	#define TBCR2_EXEDG_OR	$01
	#define TBCR2_IEDG2	1		;Input Edge 2
	#define TBCR2_IEDG2_OR	$02
	#define TBCR2_CC0	2		;Clock Control
	#define TBCR2_CC0_OR	$04
	#define TBCR2_CC1	3		;Clock Control
	#define TBCR2_CC1_OR	$08
	#define TBCR2_CC_OR	$0c
	#define TBCR2_PWM	4		;Pulse Width Modulation
	#define TBCR2_PWM_OR	$10
	#define TBCR2_OPM	5		;One Pulse Mode
	#define TBCR2_OPM_OR	$20
	#define TBCR2_OC2E	6		;Output Compare 2 Output Pin
	#define TBCR2_OC2E_OR	$40
	#define TBCR2_OC1E	7		;Output Compare 1 Output Pin
	#define TBCR2_OC1E_OR	$80

	EXTERN TBCR1.b		; Control Register 1
	#define TBCR1_OLVL1	0		;Output Level 1
	#define TBCR1_OLVL1_OR	$01
	#define TBCR1_IEDG1	1		;Input Edge 1
	#define TBCR1_IEDG1_OR	$02
	#define TBCR1_OLVL2	2		;Output Level 2
	#define TBCR1_OLVL2_OR	$04
	#define TBCR1_FOLV1	3		;Forced Output Compare 1
	#define TBCR1_FOLV1_OR	$08
	#define TBCR1_FOLV2	4		;Forced Output Compare 2
	#define TBCR1_FOLV2_OR	$10
	#define TBCR1_TOIE	5		;Timer Overflow Interrupt
	#define TBCR1_TOIE_OR	$20
	#define TBCR1_OCIE	6		;Output Compare Interrupt
	#define TBCR1_OCIE_OR	$40
	#define TBCR1_ICIE	7		;Input Capture Interrupt
	#define TBCR1_ICIE_OR	$80

	EXTERN TBCSR.b		; Status Register
	#define TBCSR_TIMD	2		;Timer prescaler,counter and outputs enable/disable
	#define TBCSR_TIMD_OR	$04
	#define TBCSR_OCF2	3		;Output Compare Flag 2
	#define TBCSR_OCF2_OR	$08
	#define TBCSR_ICF2	4		;Input Capture Flag 2
	#define TBCSR_ICF2_OR	$10
	#define TBCSR_TOF	5		;Timer Overflow
	#define TBCSR_TOF_OR	$20
	#define TBCSR_OCF1	6		;Output Compare Flag 1
	#define TBCSR_OCF1_OR	$40
	#define TBCSR_ICF1	7		;Input Capture Flag 1
	#define TBCSR_ICF1_OR	$80

	EXTERN TBIC1HR.b		; Input Capture 1 High Register

	EXTERN TBIC1LR.b		; Input Capture 1 Low Register

	EXTERN TBOC1HR.b		; Output Compare 1 High Register

	EXTERN TBOC1LR.b		; Output Compare 1 Low Register

	EXTERN TBCHR.b		; Counter High Register

	EXTERN TBCLR.b		; Counter Low Register

	EXTERN TBACHR.b		; Alternate Counter High Register

	EXTERN TBACLR.b		; Alternate Counter Low Register

	EXTERN TBIC2HR.b		; Input Capture 2 High Register

	EXTERN TBIC2LR.b		; Input Capture 2 Low Register

	EXTERN TBOC2HR.b		; Output Compare 2 High Register

	EXTERN TBOC2LR.b		; Output Compare 2 Low Register

; Serial Communications Interface (SCI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SCISR.b		; Status Register
	#define SCISR_PE	0		;Parity Error
	#define SCISR_PE_OR	$01
	#define SCISR_FE	1		;Framing Error
	#define SCISR_FE_OR	$02
	#define SCISR_NF	2		;Noise Flag
	#define SCISR_NF_OR	$04
	#define SCISR_OR	3		;Overrun Error
	#define SCISR_OR_OR	$08
	#define SCISR_IDLE	4		;Idle line detect
	#define SCISR_IDLE_OR	$10
	#define SCISR_RDRF	5		;Received Data Ready Flag
	#define SCISR_RDRF_OR	$20
	#define SCISR_TC	6		;Transmission Complete
	#define SCISR_TC_OR	$40
	#define SCISR_TDRE	7		;Transmission Data Register Empty
	#define SCISR_TDRE_OR	$80

	EXTERN SCIDR.b		; Data Register

	EXTERN SCIBRR.b		; Baud Rate Register
	#define SCIBRR_SCR0	0		;Receiver Rate Divisor
	#define SCIBRR_SCR0_OR	$01
	#define SCIBRR_SCR1	1		;Receiver Rate Divisor
	#define SCIBRR_SCR1_OR	$02
	#define SCIBRR_SCR2	2		;Receiver Rate Divisor
	#define SCIBRR_SCR2_OR	$04
	#define SCIBRR_SCR_OR	$07
	#define SCIBRR_SCT0	3		;Transmitter Rate Divisor
	#define SCIBRR_SCT0_OR	$08
	#define SCIBRR_SCT1	4		;Transmitter Rate Divisor
	#define SCIBRR_SCT1_OR	$10
	#define SCIBRR_SCT2	5		;Transmitter Rate Divisor
	#define SCIBRR_SCT2_OR	$20
	#define SCIBRR_SCT_OR	$38
	#define SCIBRR_SCP0	6		;First SCI Prescaler
	#define SCIBRR_SCP0_OR	$40
	#define SCIBRR_SCP1	7		;First SCI Prescaler
	#define SCIBRR_SCP1_OR	$80
	#define SCIBRR_SCP_OR	$c0

	EXTERN SCICR1.b		; Control Register 1
	#define SCICR1_PIE	0		;Parity Interrupt Enable
	#define SCICR1_PIE_OR	$01
	#define SCICR1_PS	1		;Parity Selection
	#define SCICR1_PS_OR	$02
	#define SCICR1_PCE	2		;Parity Control Enable
	#define SCICR1_PCE_OR	$04
	#define SCICR1_WAKE	3		;Wake-up Method
	#define SCICR1_WAKE_OR	$08
	#define SCICR1_M	4		;Word Length
	#define SCICR1_M_OR	$10
	#define SCICR1_SCID	5		;Sci prescaler and outputs enable/disable
	#define SCICR1_SCID_OR	$20
	#define SCICR1_T8	6		;Transmit Data Bit 8
	#define SCICR1_T8_OR	$40
	#define SCICR1_R8	7		;Receive Data Bit 8
	#define SCICR1_R8_OR	$80

	EXTERN SCICR2.b		; Control Register 2
	#define SCICR2_SBK	0		;Send Break
	#define SCICR2_SBK_OR	$01
	#define SCICR2_RWU	1		;Receiver Wake-up Mode
	#define SCICR2_RWU_OR	$02
	#define SCICR2_RE	2		;Receiver
	#define SCICR2_RE_OR	$04
	#define SCICR2_TE	3		;Transmitter
	#define SCICR2_TE_OR	$08
	#define SCICR2_ILIE	4		;Idle Line Interrupt
	#define SCICR2_ILIE_OR	$10
	#define SCICR2_RIE	5		;Receiver Interrupt
	#define SCICR2_RIE_OR	$20
	#define SCICR2_TCIE	6		;Transmission Complete Interrupt
	#define SCICR2_TCIE_OR	$40
	#define SCICR2_TIE	7		;Transmitter Interrupt
	#define SCICR2_TIE_OR	$80

	EXTERN SCIERPR.b		; Ext. Receive Prescaler Reg.

	EXTERN SCIETPR.b		; Ext. Transmit Prescaler Reg.

; 10-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADCDRL.b		; ADC Data Register Low

	EXTERN ADCDRH.b		; ADC Data Register High

	EXTERN ADCCSR.b		; ADC Control/Status Register
	#define ADCCSR_CH0	0		;Channel Selection
	#define ADCCSR_CH0_OR	$01
	#define ADCCSR_CH1	1		;Channel Selection
	#define ADCCSR_CH1_OR	$02
	#define ADCCSR_CH2	2		;Channel Selection
	#define ADCCSR_CH2_OR	$04
	#define ADCCSR_CH_OR	$07
	#define ADCCSR_SLOW	4		;ADC Clock Selection
	#define ADCCSR_SLOW_OR	$10
	#define ADCCSR_ADON	5		;A/D Start Converter
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_SPEED	6		;ADC Clock Selection
	#define ADCCSR_SPEED_OR	$40
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

	#endif ; __ST72264G2__
