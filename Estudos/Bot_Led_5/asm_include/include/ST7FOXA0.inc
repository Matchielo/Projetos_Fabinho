; ST7FOXA0.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7FOXA0__
; do nothing
	#else
	#define __ST7FOXA0__ 1

; ST7FOXA0


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

	EXTERN PAOR.b		; Option Register

; Lite Timer (LT)
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

; Auto Reload Timer (ART)
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

; RC Oscillator Calibration Control Register (RCC1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN RCC_CSR.b		; RC Calibration Control/Status Register
	#define RCC_CSR_RCCPGM	0		;Programming Control and Status bit
	#define RCC_CSR_RCCPGM_OR	$01
	#define RCC_CSR_RCCLAT	1		;Latch Access Transfer bit
	#define RCC_CSR_RCCLAT_OR	$02

; 10-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADCCSR.b		; ADC Control/Status Register
	#define ADCCSR_CH0	0		;Channel Selection
	#define ADCCSR_CH0_OR	$01
	#define ADCCSR_CH1	1		;Channel Selection
	#define ADCCSR_CH1_OR	$02
	#define ADCCSR_CH2	2		;Channel Selection
	#define ADCCSR_CH2_OR	$04
	#define ADCCSR_CH_OR	$07
	#define ADCCSR_ADON	5		;ADC Converter On
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_SPEED	6		;ADC clock selection
	#define ADCCSR_SPEED_OR	$40
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

	EXTERN ADCDRH.b		; Data Register High
	#define ADCDRH_D2	0		;ADC Data High
	#define ADCDRH_D2_OR	$01
	#define ADCDRH_D3	1		;ADC Data High
	#define ADCDRH_D3_OR	$02
	#define ADCDRH_D4	2		;ADC Data High
	#define ADCDRH_D4_OR	$04
	#define ADCDRH_D5	3		;ADC Data High
	#define ADCDRH_D5_OR	$08
	#define ADCDRH_D6	4		;ADC Data High
	#define ADCDRH_D6_OR	$10
	#define ADCDRH_D7	5		;ADC Data High
	#define ADCDRH_D7_OR	$20
	#define ADCDRH_D8	6		;ADC Data High
	#define ADCDRH_D8_OR	$40
	#define ADCDRH_D9	7		;ADC Data High
	#define ADCDRH_D9_OR	$80
	#define ADCDRH_D_OR	$ff

	EXTERN ADCDRL.b		; Data Register Low
	#define ADCDRL_D0	0		;ADC Data Low
	#define ADCDRL_D0_OR	$01
	#define ADCDRL_D1	1		;ADC Data Low
	#define ADCDRL_D1_OR	$02
	#define ADCDRL_D_OR	$03
	#define ADCDRL_SLOW	3		;ADC Slow Mode
	#define ADCDRL_SLOW_OR	$08

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

; RC Oscillator Calibration Register (RCC2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN RCCRH.b		; RC oscillator Control Register High
	#define RCCRH_CR2	0		;RC Oscillator Frequency Adjustment bits
	#define RCCRH_CR2_OR	$01
	#define RCCRH_CR3	1		;RC Oscillator Frequency Adjustment bits
	#define RCCRH_CR3_OR	$02
	#define RCCRH_CR4	2		;RC Oscillator Frequency Adjustment bits
	#define RCCRH_CR4_OR	$04
	#define RCCRH_CR5	3		;RC Oscillator Frequency Adjustment bits
	#define RCCRH_CR5_OR	$08
	#define RCCRH_CR6	4		;RC Oscillator Frequency Adjustment bits
	#define RCCRH_CR6_OR	$10
	#define RCCRH_CR7	5		;RC Oscillator Frequency Adjustment bits
	#define RCCRH_CR7_OR	$20
	#define RCCRH_CR8	6		;RC Oscillator Frequency Adjustment bits
	#define RCCRH_CR8_OR	$40
	#define RCCRH_CR9	7		;RC Oscillator Frequency Adjustment bits
	#define RCCRH_CR9_OR	$80
	#define RCCRH_CR_OR	$ff

	EXTERN RCCRL.b		; RC oscillator Control Register Low
	#define RCCRL_LVDRF	2		;LVD reset flag
	#define RCCRL_LVDRF_OR	$04
	#define RCCRL_CR0	5		;RC Oscillator Frequency Adjustment bits
	#define RCCRL_CR0_OR	$20
	#define RCCRL_CR1	6		;RC Oscillator Frequency Adjustment bits
	#define RCCRL_CR1_OR	$40
	#define RCCRL_CR_OR	$60

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

; RC Oscillator Prescaler Register (RCPSCR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PSCR.b		; RC Prescaler Register
	#define PSCR_CK0	5		;Internal RC Prescaler Selection
	#define PSCR_CK0_OR	$20
	#define PSCR_CK1	6		;Internal RC Prescaler Selection
	#define PSCR_CK1_OR	$40
	#define PSCR_CK2	7		;Internal RC Prescaler Selection
	#define PSCR_CK2_OR	$80
	#define PSCR_CK_OR	$e0

; Clock Controller Control/Status Register (CKCNTCSR)
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

	#endif ; __ST7FOXA0__
