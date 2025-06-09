; ST7FLITEUS2.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7FLITEUS2__
; do nothing
	#else
	#define __ST7FLITEUS2__ 1

; ST7FLITEUS2


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

	EXTERN PAOR.b		; Option Register

; Lite Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN LTCSR.b		; Lite Timer Control/Status Register
	#define LTCSR_WDGD	0		;Watchdog Reset Delay
	#define LTCSR_WDGD_OR	$01
	#define LTCSR_WDGE	1		;Watchdog Enable
	#define LTCSR_WDGE_OR	$02
	#define LTCSR_WDGRF	2		;Watchdog Force Reset/Reset Status Flag
	#define LTCSR_WDGRF_OR	$04
	#define LTCSR_TBF	3		;Timebase Interrupt Flag
	#define LTCSR_TBF_OR	$08
	#define LTCSR_TBIE	4		;Timebase Interrupt Enable
	#define LTCSR_TBIE_OR	$10
	#define LTCSR_TB	5		;Timebase period selection
	#define LTCSR_TB_OR	$20
	#define LTCSR_ICF	6		;Input Capture Flag
	#define LTCSR_ICF_OR	$40
	#define LTCSR_ICIE	7		;Input Capture Interrupt Enable
	#define LTCSR_ICIE_OR	$80

	EXTERN LTICR.b		; Lite Timer Input Capture Register
	#define LTICR_ICR0	0		;Input Capture Value
	#define LTICR_ICR0_OR	$01
	#define LTICR_ICR1	1		;Input Capture Value
	#define LTICR_ICR1_OR	$02
	#define LTICR_ICR2	2		;Input Capture Value
	#define LTICR_ICR2_OR	$04
	#define LTICR_ICR3	3		;Input Capture Value
	#define LTICR_ICR3_OR	$08
	#define LTICR_ICR4	4		;Input Capture Value
	#define LTICR_ICR4_OR	$10
	#define LTICR_ICR5	5		;Input Capture Value
	#define LTICR_ICR5_OR	$20
	#define LTICR_ICR6	6		;Input Capture Value
	#define LTICR_ICR6_OR	$40
	#define LTICR_ICR7	7		;Input Capture Value
	#define LTICR_ICR7_OR	$80
	#define LTICR_ICR_OR	$ff

; Auto Reload Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ATCSR.b		; Timer Control/Status Register1
	#define ATCSR_CMPIE	0		;Compare Interrupt Enable
	#define ATCSR_CMPIE_OR	$01
	#define ATCSR_OVFIE	1		;Overflow Interrupt Enable
	#define ATCSR_OVFIE_OR	$02
	#define ATCSR_OVF	2		;Overflow Flag
	#define ATCSR_OVF_OR	$04
	#define ATCSR_CK0	3		;Counter Clock Selection
	#define ATCSR_CK0_OR	$08
	#define ATCSR_CK1	4		;Counter Clock Selection
	#define ATCSR_CK1_OR	$10
	#define ATCSR_CK_OR	$18

	EXTERN CNTRH.b		; Counter Value High

	EXTERN CNTRL.b		; Counter Value Low

	EXTERN ATRH.b		; Autoreload Register High

	EXTERN ATRL.b		; Autoreload Register Low

	EXTERN PWMCR.b		; PWM Output Control Register
	#define PWMCR_OE0	0		;PWM Mode Enable
	#define PWMCR_OE0_OR	$01

	EXTERN PWM0CSR.b		; PWM 0 Control/Status Register
	#define PWM0CSR_CMPF0	0		;PWM0 Compare Flag
	#define PWM0CSR_CMPF0_OR	$01
	#define PWM0CSR_OP0	1		;PWM0 Output Polarity
	#define PWM0CSR_OP0_OR	$02

	EXTERN DCR0H.b		; PWM0 Duty Cycle Value High

	EXTERN DCR0L.b		; PWM0 Duty Cycle Value Low

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

; External Interrupt Control Register 1 (ITC1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN EICR1.b		; External Interrupt Control Register 1
	#define EICR1_IS00	0		;EI0 Sensitivity
	#define EICR1_IS00_OR	$01
	#define EICR1_IS01	1		;EI0 Sensitivity
	#define EICR1_IS01_OR	$02
	#define EICR1_IS0_OR	$03
	#define EICR1_IS10	2		;EI1 Sensitivity
	#define EICR1_IS10_OR	$04
	#define EICR1_IS11	3		;EI1 Sensitivity
	#define EICR1_IS11_OR	$08
	#define EICR1_IS1_OR	$0c
	#define EICR1_IS20	4		;EI2 Sensitivity
	#define EICR1_IS20_OR	$10
	#define EICR1_IS21	5		;EI2 Sensitivity
	#define EICR1_IS21_OR	$20
	#define EICR1_IS2_OR	$30

; Main Clock Control/Status Register (MCC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MCCSR.b		; Main Clock Control/Status Register
	#define MCCSR_SMS	0		;Slow Mode Selection
	#define MCCSR_SMS_OR	$01
	#define MCCSR_MCO	1		;Main Clock Out Enable
	#define MCCSR_MCO_OR	$02

; RC Oscillator Control Register (RCCR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN RCCR.b		; RC Control Register

; System Integrity Control/Status Register (SICSR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SICSR.b		; System Integrity Control/Status Register
	#define SICSR_AVDIE	0		;Voltage Detector Interrupt Enable
	#define SICSR_AVDIE_OR	$01
	#define SICSR_AVDF	1		;Voltage Detector Flag
	#define SICSR_AVDF_OR	$02
	#define SICSR_LVDRF	2		;LVD Reset Flag
	#define SICSR_LVDRF_OR	$04
	#define SICSR_CR0	5		;RC Oscillator Frequency Adjustment Bits
	#define SICSR_CR0_OR	$20
	#define SICSR_CR1	6		;RC Oscillator Frequency Adjustment Bits
	#define SICSR_CR1_OR	$40
	#define SICSR_CR_OR	$60

; External Interrupt Control Register 2 (ITC2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN EICR2.b		; External Interrupt Control Register 2
	#define EICR2_IS30	0		;EI3 Sensitivity
	#define EICR2_IS30_OR	$01
	#define EICR2_IS31	1		;EI3 Sensitivity
	#define EICR2_IS31_OR	$02
	#define EICR2_IS3_OR	$03
	#define EICR2_IS40	2		;EI4 Sensitivity
	#define EICR2_IS40_OR	$04
	#define EICR2_IS41	3		;EI4 Sensitivity
	#define EICR2_IS41_OR	$08
	#define EICR2_IS4_OR	$0c

; AVD Threshold Selection Register (AVDTHCR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN AVDTHCR.b		; AVD Threshold Selection Register / RC prescaler
	#define AVDTHCR_AVD0	0		;AVD Threshold Selection
	#define AVDTHCR_AVD0_OR	$01
	#define AVDTHCR_AVD1	1		;AVD Threshold Selection
	#define AVDTHCR_AVD1_OR	$02
	#define AVDTHCR_AVD_OR	$03
	#define AVDTHCR_CK0	5		;Internal RC Prescaler Selection
	#define AVDTHCR_CK0_OR	$20
	#define AVDTHCR_CK1	6		;Internal RC Prescaler Selection
	#define AVDTHCR_CK1_OR	$40
	#define AVDTHCR_CK_OR	$60

; Clock Controller Control/Status (CKCNTCSR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CKCNTCSR.b		; Clock Controller Control/Status Register
	#define CKCNTCSR_RC_AWU	0		;RC/AWU Selection
	#define CKCNTCSR_RC_AWU_OR	$01
	#define CKCNTCSR_RC_FLAG	2		;RC Selection
	#define CKCNTCSR_RC_FLAG_OR	$04
	#define CKCNTCSR_AWU_FLAG	3		;AWU Selection
	#define CKCNTCSR_AWU_FLAG_OR	$08

; Multiplexed IO Reset Control Register (MUXCR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MUXCR0.b		; Multiplexed IO Reset Register Low

	EXTERN MUXCR1.b		; Multiplexed IO Reset Register High

; Auto Wake Up from Halt Mode (AWU)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN AWUPR.b		; AWU HALT prescaler Register
	#define AWUPR_AWUPR0	0		;Auto Wake Up prescaler
	#define AWUPR_AWUPR0_OR	$01
	#define AWUPR_AWUPR1	1		;Auto Wake Up prescaler
	#define AWUPR_AWUPR1_OR	$02
	#define AWUPR_AWUPR2	2		;Auto Wake Up prescaler
	#define AWUPR_AWUPR2_OR	$04
	#define AWUPR_AWUPR3	3		;Auto Wake Up prescaler
	#define AWUPR_AWUPR3_OR	$08
	#define AWUPR_AWUPR4	4		;Auto Wake Up prescaler
	#define AWUPR_AWUPR4_OR	$10
	#define AWUPR_AWUPR5	5		;Auto Wake Up prescaler
	#define AWUPR_AWUPR5_OR	$20
	#define AWUPR_AWUPR6	6		;Auto Wake Up prescaler
	#define AWUPR_AWUPR6_OR	$40
	#define AWUPR_AWUPR7	7		;Auto Wake Up prescaler
	#define AWUPR_AWUPR7_OR	$80
	#define AWUPR_AWUPR_OR	$ff

	EXTERN AWUCSR.b		; AWU HALT Control/Status Register
	#define AWUCSR_AWUEN	0		;Auto Wake Up from HALT mode enable
	#define AWUCSR_AWUEN_OR	$01
	#define AWUCSR_AWUMSR	1		;Auto Wake Up Measurement
	#define AWUCSR_AWUMSR_OR	$02

	#endif ; __ST7FLITEUS2__
