; ST72272K4.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST72272K4__
; do nothing
	#else
	#define __ST72272K4__ 1

; ST72272K4


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

; Port C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PCDR.b		; Data Register

	EXTERN PCDDR.b		; Data Direction Register

; Port D
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PDDR.b		; Data Register

	EXTERN PDDDR.b		; Data Direction Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBDDR.b		; Data Direction Register

	EXTERN PBICFGR.b		; Input Pull-up Configuration Register

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR.b		; Miscellaneous Register
	#define MISCR_POC0	0		;PWM/BRM Output Configuration Bit
	#define MISCR_POC0_OR	$01
	#define MISCR_SMS	5		;Slow Mode Select
	#define MISCR_SMS_OR	$20

; 8-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADCDR.b		; Data Register

	EXTERN ADCCSR.b		; Control/Status Register
	#define ADCCSR_CH0	0		;Channel Selection
	#define ADCCSR_CH0_OR	$01
	#define ADCCSR_CH1	1		;Channel Selection
	#define ADCCSR_CH1_OR	$02
	#define ADCCSR_CH2	2		;Channel Selection
	#define ADCCSR_CH2_OR	$04
	#define ADCCSR_CH_OR	$07
	#define ADCCSR_ADON	5		;A/D Converter
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

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

; Interrupt Register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ITRFRE.b		; Interrupt Register
	#define ITRFRE_EI0ITE	3		;Interrupt Bit
	#define ITRFRE_EI0ITE_OR	$08
	#define ITRFRE_EI0F	7		;Falling Edge Detector Flag
	#define ITRFRE_EI0F_OR	$80

; 16-Bit Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TCR2.b		; Control Register 2
	#define TCR2_EXEDG	0		;External Clock Edge
	#define TCR2_EXEDG_OR	$01
	#define TCR2_IEDG2	1		;Input Edge 2
	#define TCR2_IEDG2_OR	$02
	#define TCR2_CC0	2		;Clock Control
	#define TCR2_CC0_OR	$04
	#define TCR2_CC1	3		;Clock Control
	#define TCR2_CC1_OR	$08
	#define TCR2_CC_OR	$0c
	#define TCR2_PWM	4		;Pulse Width Modulation
	#define TCR2_PWM_OR	$10
	#define TCR2_OPM	5		;One Pulse Mode
	#define TCR2_OPM_OR	$20
	#define TCR2_OC2E	6		;Output Compare 2 Output Pin
	#define TCR2_OC2E_OR	$40
	#define TCR2_OC1E	7		;Output Compare 1 Output Pin
	#define TCR2_OC1E_OR	$80

	EXTERN TCR1.b		; Control Register 1
	#define TCR1_OLVL1	0		;Output Level 1
	#define TCR1_OLVL1_OR	$01
	#define TCR1_IEDG1	1		;Input Edge 1
	#define TCR1_IEDG1_OR	$02
	#define TCR1_OLVL2	2		;Output Level 2
	#define TCR1_OLVL2_OR	$04
	#define TCR1_FOLV1	3		;Forced Output Compare 1
	#define TCR1_FOLV1_OR	$08
	#define TCR1_FOLV2	4		;Forced Output Compare 2
	#define TCR1_FOLV2_OR	$10
	#define TCR1_TOIE	5		;Timer Overflow Interrupt
	#define TCR1_TOIE_OR	$20
	#define TCR1_OCIE	6		;Output Compare Interrupt
	#define TCR1_OCIE_OR	$40
	#define TCR1_ICIE	7		;Input Capture Interrupt
	#define TCR1_ICIE_OR	$80

	EXTERN TSR.b		; Status Register
	#define TSR_OCF2	3		;Output Compare Flag 2
	#define TSR_OCF2_OR	$08
	#define TSR_ICF2	4		;Input Capture Flag 2
	#define TSR_ICF2_OR	$10
	#define TSR_TOF	5		;Timer Overflow
	#define TSR_TOF_OR	$20
	#define TSR_OCF1	6		;Output Compare Flag 1
	#define TSR_OCF1_OR	$40
	#define TSR_ICF1	7		;Input Capture Flag 1
	#define TSR_ICF1_OR	$80

	EXTERN TIC1HR.b		; Input Capture 1 High Register

	EXTERN TIC1LR.b		; Input Capture 1 Low Register

	EXTERN TOC1HR.b		; Output Compare 1 High Register

	EXTERN TOC1LR.b		; Output Compare 1 Low Register

	EXTERN TCHR.b		; Counter High Register

	EXTERN TCLR.b		; Counter Low Register

	EXTERN TACHR.b		; Alternate Counter High Register

	EXTERN TACLR.b		; Alternate Counter Low Register

	EXTERN TIC2HR.b		; Input Capture 2 High Register

	EXTERN TIC2LR.b		; Input Capture 2 Low Register

	EXTERN TOC2HR.b		; Output Compare 2 High Register

	EXTERN TOC2LR.b		; Output Compare 2 Low Register

; D/A Converter (DAC) with PWM outputs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PWM1.b		; Channel 1 PWM Register
	#define PWM1_POL	6		;Polarity Bit
	#define PWM1_POL_OR	$40
	#define PWM1_P0	0		;Pulse Binary Weight for Channel 1
	#define PWM1_P0_OR	$01
	#define PWM1_P1	1		;Pulse Binary Weight for Channel 1
	#define PWM1_P1_OR	$02
	#define PWM1_P2	2		;Pulse Binary Weight for Channel 1
	#define PWM1_P2_OR	$04
	#define PWM1_P3	3		;Pulse Binary Weight for Channel 1
	#define PWM1_P3_OR	$08
	#define PWM1_P4	4		;Pulse Binary Weight for Channel 1
	#define PWM1_P4_OR	$10
	#define PWM1_P5	5		;Pulse Binary Weight for Channel 1
	#define PWM1_P5_OR	$20
	#define PWM1_P_OR	$3f

	EXTERN BRM21.b		; Channel 2+1 BRM Register
	#define BRM21_B4	4		;BRM Bits (Channel 2)
	#define BRM21_B4_OR	$10
	#define BRM21_B5	5		;BRM Bits (Channel 2)
	#define BRM21_B5_OR	$20
	#define BRM21_B6	6		;BRM Bits (Channel 2)
	#define BRM21_B6_OR	$40
	#define BRM21_B7	7		;BRM Bits (Channel 2)
	#define BRM21_B7_OR	$80
	#define BRM21_B_4_7_OR	$f0
	#define BRM21_B0	0		;BRM Bits (Channel 1)
	#define BRM21_B0_OR	$01
	#define BRM21_B1	1		;BRM Bits (Channel 1)
	#define BRM21_B1_OR	$02
	#define BRM21_B2	2		;BRM Bits (Channel 1)
	#define BRM21_B2_OR	$04
	#define BRM21_B3	3		;BRM Bits (Channel 1)
	#define BRM21_B3_OR	$08
	#define BRM21_B_0_3_OR	$0f

	EXTERN PWM2.b		; Channel 2 PWM Register
	#define PWM2_POL	6		;Polarity Bit
	#define PWM2_POL_OR	$40
	#define PWM2_P0	0		;Pulse Binary Weight for Channel 2
	#define PWM2_P0_OR	$01
	#define PWM2_P1	1		;Pulse Binary Weight for Channel 2
	#define PWM2_P1_OR	$02
	#define PWM2_P2	2		;Pulse Binary Weight for Channel 2
	#define PWM2_P2_OR	$04
	#define PWM2_P3	3		;Pulse Binary Weight for Channel 2
	#define PWM2_P3_OR	$08
	#define PWM2_P4	4		;Pulse Binary Weight for Channel 2
	#define PWM2_P4_OR	$10
	#define PWM2_P5	5		;Pulse Binary Weight for Channel 2
	#define PWM2_P5_OR	$20
	#define PWM2_P_OR	$3f

	EXTERN PWM3.b		; Channel 3 PWM Register
	#define PWM3_POL	6		;Polarity Bit
	#define PWM3_POL_OR	$40
	#define PWM3_P0	0		;Pulse Binary Weight for Channel 3
	#define PWM3_P0_OR	$01
	#define PWM3_P1	1		;Pulse Binary Weight for Channel 3
	#define PWM3_P1_OR	$02
	#define PWM3_P2	2		;Pulse Binary Weight for Channel 3
	#define PWM3_P2_OR	$04
	#define PWM3_P3	3		;Pulse Binary Weight for Channel 3
	#define PWM3_P3_OR	$08
	#define PWM3_P4	4		;Pulse Binary Weight for Channel 3
	#define PWM3_P4_OR	$10
	#define PWM3_P5	5		;Pulse Binary Weight for Channel 3
	#define PWM3_P5_OR	$20
	#define PWM3_P_OR	$3f

	EXTERN BRM43.b		; Channel 4+3 BRM Register
	#define BRM43_B4	4		;BRM Bits (Channel 4)
	#define BRM43_B4_OR	$10
	#define BRM43_B5	5		;BRM Bits (Channel 4)
	#define BRM43_B5_OR	$20
	#define BRM43_B6	6		;BRM Bits (Channel 4)
	#define BRM43_B6_OR	$40
	#define BRM43_B7	7		;BRM Bits (Channel 4)
	#define BRM43_B7_OR	$80
	#define BRM43_B_4_7_OR	$f0
	#define BRM43_B0	0		;BRM Bits (Channel 3)
	#define BRM43_B0_OR	$01
	#define BRM43_B1	1		;BRM Bits (Channel 3)
	#define BRM43_B1_OR	$02
	#define BRM43_B2	2		;BRM Bits (Channel 3)
	#define BRM43_B2_OR	$04
	#define BRM43_B3	3		;BRM Bits (Channel 3)
	#define BRM43_B3_OR	$08
	#define BRM43_B_0_3_OR	$0f

	EXTERN PWM4.b		; Channel 4 PWM Register
	#define PWM4_POL	6		;Polarity Bit
	#define PWM4_POL_OR	$40
	#define PWM4_P0	0		;Pulse Binary Weight for Channel 4
	#define PWM4_P0_OR	$01
	#define PWM4_P1	1		;Pulse Binary Weight for Channel 4
	#define PWM4_P1_OR	$02
	#define PWM4_P2	2		;Pulse Binary Weight for Channel 4
	#define PWM4_P2_OR	$04
	#define PWM4_P3	3		;Pulse Binary Weight for Channel 4
	#define PWM4_P3_OR	$08
	#define PWM4_P4	4		;Pulse Binary Weight for Channel 4
	#define PWM4_P4_OR	$10
	#define PWM4_P5	5		;Pulse Binary Weight for Channel 4
	#define PWM4_P5_OR	$20
	#define PWM4_P_OR	$3f

; I2C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN I2CDR.b		; Data Register

	EXTERN I2COAR.b		; Own Address Register
	#define I2COAR_ADD0	0		;Address Direction Bit
	#define I2COAR_ADD0_OR	$01
	#define I2COAR_ADD1	1		;Interface Address
	#define I2COAR_ADD1_OR	$02
	#define I2COAR_ADD2	2		;Interface Address
	#define I2COAR_ADD2_OR	$04
	#define I2COAR_ADD3	3		;Interface Address
	#define I2COAR_ADD3_OR	$08
	#define I2COAR_ADD4	4		;Interface Address
	#define I2COAR_ADD4_OR	$10
	#define I2COAR_ADD5	5		;Interface Address
	#define I2COAR_ADD5_OR	$20
	#define I2COAR_ADD6	6		;Interface Address
	#define I2COAR_ADD6_OR	$40
	#define I2COAR_ADD7	7		;Interface Address
	#define I2COAR_ADD7_OR	$80
	#define I2COAR_ADD_OR	$fe

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

	#endif ; __ST72272K4__
