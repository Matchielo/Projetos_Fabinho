; ST72216G1.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST72216G1__
; do nothing
	#else
	#define __ST72216G1__ 1

; ST72216G1


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

	EXTERN SPIDR.b		; SPI Data I/O Register

	EXTERN SPICR.b		; SPI Control Register
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
	#define SPICR_SPE	6		;Serial Peripheral Output Enable
	#define SPICR_SPE_OR	$40
	#define SPICR_SPIE	7		;Serial Peripheral Interrupt Enable
	#define SPICR_SPIE_OR	$80

	EXTERN SPICSR.b		; SPI Control Status Register

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

; Clock,Reset,Supply Control/Status
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CRSR.b		; Clock/Reset/Supply Control/Status Register
	#define CRSR_WDGRF	0		;Watchdog Reset Flag
	#define CRSR_WDGRF_OR	$01
	#define CRSR_CSSD	1		;Clock Security System Detection
	#define CRSR_CSSD_OR	$02
	#define CRSR_CSSIE	2		;Clock Security System Interrupt
	#define CRSR_CSSIE_OR	$04
	#define CRSR_LVDRF	4		;LVD Reset Flag
	#define CRSR_LVDRF_OR	$10

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

	EXTERN TASR.b		; Status Register
	#define TASR_OCF2	3		;Output Compare Flag 2
	#define TASR_OCF2_OR	$08
	#define TASR_ICF2	4		;Input Capture Flag 2
	#define TASR_ICF2_OR	$10
	#define TASR_TOF	5		;Timer Overflow
	#define TASR_TOF_OR	$20
	#define TASR_OCF1	6		;Output Compare Flag 1
	#define TASR_OCF1_OR	$40
	#define TASR_ICF1	7		;Input Capture Flag 1
	#define TASR_ICF1_OR	$80

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
	#define ADCCSR_CH3	3		;Channel Selection
	#define ADCCSR_CH3_OR	$08
	#define ADCCSR_CH_OR	$0f
	#define ADCCSR_ADON	5		;A/D Converter
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

	#endif ; __ST72216G1__
