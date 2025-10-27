; ST7FOXK1.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST7FOXK1__
; do nothing
	#else
	#define __ST7FOXK1__ 1

; ST7FOXK1


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

	EXTERN PAOR.b		; Option Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBDDR.b		; Data Direction Register

	EXTERN PBOR.b		; Option Register

; Port C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PCDR.b		; Data Register

	EXTERN PCDDR.b		; Data Direction Register

	EXTERN PCOR.b		; Option Register

; Lite Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN LTCSR2.b		; Lite Timer Control/Status Register 2
	#define LTCSR2_TB2F	0		;Timebase 2 Interrupt Flag
	#define LTCSR2_TB2F_OR	$01
	#define LTCSR2_TB2IE	1		;Timebase 2 Interrupt enable
	#define LTCSR2_TB2IE_OR	$02

	EXTERN LTARR.b		; Lite Timer Auto-Reload Register
	#define LTARR_AR0	0		;Counter 2 Reload Value
	#define LTARR_AR0_OR	$01
	#define LTARR_AR1	1		;Counter 2 Reload Value
	#define LTARR_AR1_OR	$02
	#define LTARR_AR2	2		;Counter 2 Reload Value
	#define LTARR_AR2_OR	$04
	#define LTARR_AR3	3		;Counter 2 Reload Value
	#define LTARR_AR3_OR	$08
	#define LTARR_AR4	4		;Counter 2 Reload Value
	#define LTARR_AR4_OR	$10
	#define LTARR_AR5	5		;Counter 2 Reload Value
	#define LTARR_AR5_OR	$20
	#define LTARR_AR6	6		;Counter 2 Reload Value
	#define LTARR_AR6_OR	$40
	#define LTARR_AR7	7		;Counter 2 Reload Value
	#define LTARR_AR7_OR	$80
	#define LTARR_AR_OR	$ff

	EXTERN LTCNTR.b		; Lite Timer Counter Register
	#define LTCNTR_CNT0	0		;Counter 2 Reload Value
	#define LTCNTR_CNT0_OR	$01
	#define LTCNTR_CNT1	1		;Counter 2 Reload Value
	#define LTCNTR_CNT1_OR	$02
	#define LTCNTR_CNT2	2		;Counter 2 Reload Value
	#define LTCNTR_CNT2_OR	$04
	#define LTCNTR_CNT3	3		;Counter 2 Reload Value
	#define LTCNTR_CNT3_OR	$08
	#define LTCNTR_CNT4	4		;Counter 2 Reload Value
	#define LTCNTR_CNT4_OR	$10
	#define LTCNTR_CNT5	5		;Counter 2 Reload Value
	#define LTCNTR_CNT5_OR	$20
	#define LTCNTR_CNT6	6		;Counter 2 Reload Value
	#define LTCNTR_CNT6_OR	$40
	#define LTCNTR_CNT7	7		;Counter 2 Reload Value
	#define LTCNTR_CNT7_OR	$80
	#define LTCNTR_CNT_OR	$ff

	EXTERN LTCSR1.b		; Lite Timer Control/Status Register 1
	#define LTCSR1_TB1F	3		;Timebase Interrupt Flag.
	#define LTCSR1_TB1F_OR	$08
	#define LTCSR1_TB1IE	4		;Timebase Interrupt enable.
	#define LTCSR1_TB1IE_OR	$10
	#define LTCSR1_TB	5		;Timebase period selection.
	#define LTCSR1_TB_OR	$20
	#define LTCSR1_ICF	6		;Input Capture Flag.
	#define LTCSR1_ICF_OR	$40
	#define LTCSR1_ICIE	7		;Input Capture Interrupt Enable
	#define LTCSR1_ICIE_OR	$80

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
	#define ATCSR_OVFIE1	1		;Overflow Interrupt Enable
	#define ATCSR_OVFIE1_OR	$02
	#define ATCSR_OVF1	2		;Overflow Flag
	#define ATCSR_OVF1_OR	$04
	#define ATCSR_CK0	3		;Counter Clock Selection
	#define ATCSR_CK0_OR	$08
	#define ATCSR_CK1	4		;Counter Clock Selection
	#define ATCSR_CK1_OR	$10
	#define ATCSR_CK_OR	$18
	#define ATCSR_ICIE	5		;Input Capture Interrupt Enable
	#define ATCSR_ICIE_OR	$20
	#define ATCSR_ICF	6		;Input Capture Flag.
	#define ATCSR_ICF_OR	$40

	EXTERN CNTR1H.b		; Counter Value High

	EXTERN CNTR1L.b		; Counter Value Low

	EXTERN ATR1H.b		; Autoreload Register High

	EXTERN ATR1L.b		; Autoreload Register Low

	EXTERN PWMCR.b		; PWM Output Control Register
	#define PWMCR_OE0	0		;PWM Mode Enable
	#define PWMCR_OE0_OR	$01
	#define PWMCR_OE1	2		;PWM Mode Enable
	#define PWMCR_OE1_OR	$04
	#define PWMCR_OE2	4		;PWM Mode Enable
	#define PWMCR_OE2_OR	$10
	#define PWMCR_OE3	6		;PWM Mode Enable
	#define PWMCR_OE3_OR	$40

	EXTERN PWM0CSR.b		; PWM 0 Control/Status Register
	#define PWM0CSR_CMPF0	0		;PWM0 Compare Flag
	#define PWM0CSR_CMPF0_OR	$01
	#define PWM0CSR_OP0	1		;PWM0 Output Polarity
	#define PWM0CSR_OP0_OR	$02

	EXTERN PWM1CSR.b		; PWM 1 Control/Status Register
	#define PWM1CSR_CMPF1	0		;PWM1 Compare Flag
	#define PWM1CSR_CMPF1_OR	$01
	#define PWM1CSR_OP1	1		;PWM1 Output Polarity
	#define PWM1CSR_OP1_OR	$02

	EXTERN PWM2CSR.b		; PWM 2 Control/Status Register
	#define PWM2CSR_CMPF2	0		;PWM2 Compare Flag
	#define PWM2CSR_CMPF2_OR	$01
	#define PWM2CSR_OP2	1		;PWM2 Output Polarity
	#define PWM2CSR_OP2_OR	$02

	EXTERN PWM3CSR.b		; PWM 3 Control/Status Register
	#define PWM3CSR_CMPF3	0		;PWM3 Compare Flag
	#define PWM3CSR_CMPF3_OR	$01
	#define PWM3CSR_OP3	1		;PWM3 Output Polarity
	#define PWM3CSR_OP3_OR	$02
	#define PWM3CSR_OPEDGE	2		;One Pulse Edge Selection
	#define PWM3CSR_OPEDGE_OR	$04
	#define PWM3CSR_OP_EN	3		;One Pulse Mode Enable
	#define PWM3CSR_OP_EN_OR	$08

	EXTERN DCR0H.b		; PWM0 Duty Cycle Value High

	EXTERN DCR0L.b		; PWM0 Duty Cycle Value Low

	EXTERN DCR1H.b		; PWM1 Duty Cycle Value High

	EXTERN DCR1L.b		; PWM1 Duty Cycle Value Low

	EXTERN DCR2H.b		; PWM2 Duty Cycle Value High

	EXTERN DCR2L.b		; PWM2 Duty Cycle Value Low

	EXTERN DCR3H.b		; PWM3 Duty Cycle Value High

	EXTERN DCR3L.b		; PWM3 Duty Cycle Value Low

	EXTERN ATICRH.b		; Input Capture Data High

	EXTERN ATICRL.b		; Input Capture Data Low

	EXTERN ATCSR2.b		; Timer Control/Status Register 2
	#define ATCSR2_TRAN1	0		;Transfer enable 1
	#define ATCSR2_TRAN1_OR	$01
	#define ATCSR2_TRAN2	1		;Transfer enable 2
	#define ATCSR2_TRAN2_OR	$02
	#define ATCSR2_ENCNTR2	2		;Enable counter 2 for PWM2/3
	#define ATCSR2_ENCNTR2_OR	$04
	#define ATCSR2_OVF2	3		;Overflow Flag
	#define ATCSR2_OVF2_OR	$08
	#define ATCSR2_OVFIE2	4		;Overflow interrupt 2 enable
	#define ATCSR2_OVFIE2_OR	$10
	#define ATCSR2_ICS	5		;Input Capture Shorted
	#define ATCSR2_ICS_OR	$20
	#define ATCSR2_FORCE1	6		;Force Counter 1 Overflow
	#define ATCSR2_FORCE1_OR	$40
	#define ATCSR2_FORCE2	7		;Force Counter 2 Overflow
	#define ATCSR2_FORCE2_OR	$80

	EXTERN BREAKCR.b		; Break Control Register
	#define BREAKCR_PWM0	0		;Break Pattern
	#define BREAKCR_PWM0_OR	$01
	#define BREAKCR_PWM1	1		;Break Pattern
	#define BREAKCR_PWM1_OR	$02
	#define BREAKCR_PWM2	2		;Break Pattern
	#define BREAKCR_PWM2_OR	$04
	#define BREAKCR_PWM3	3		;Break Pattern
	#define BREAKCR_PWM3_OR	$08
	#define BREAKCR_BPEN	4		;Break Pin Enable
	#define BREAKCR_BPEN_OR	$10
	#define BREAKCR_BA	5		;Break Active
	#define BREAKCR_BA_OR	$20
	#define BREAKCR_BREDGE	6		;Break Input Edge Selection
	#define BREAKCR_BREDGE_OR	$40
	#define BREAKCR_BRSEL	7		;Break Input Selection
	#define BREAKCR_BRSEL_OR	$80

	EXTERN ATR2H.b		; Autoreload Register 2 High

	EXTERN ATR2L.b		; Autoreload Register 2 Low

	EXTERN DTGR.b		; Dead Time Generator Register
	#define DTGR_DT0	0		;Dead Time Value
	#define DTGR_DT0_OR	$01
	#define DTGR_DT1	1		;Dead Time Value
	#define DTGR_DT1_OR	$02
	#define DTGR_DT2	2		;Dead Time Value
	#define DTGR_DT2_OR	$04
	#define DTGR_DT3	3		;Dead Time Value
	#define DTGR_DT3_OR	$08
	#define DTGR_DT4	4		;Dead Time Value
	#define DTGR_DT4_OR	$10
	#define DTGR_DT5	5		;Dead Time Value
	#define DTGR_DT5_OR	$20
	#define DTGR_DT6	6		;Dead Time Value
	#define DTGR_DT6_OR	$40
	#define DTGR_DT_OR	$7f
	#define DTGR_DTE	7		;Dead Time Enable
	#define DTGR_DTE_OR	$80

	EXTERN BREAKEN.b		; Break Enable Register
	#define BREAKEN_BREN1	0		;Break Enable for Counter 1
	#define BREAKEN_BREN1_OR	$01
	#define BREAKEN_BREN2	1		;Break Enable for Counter 2
	#define BREAKEN_BREN2_OR	$02

; External Interrupt Control/Selection Register (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;AWU IT Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;AWU IT Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;AVD IT Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;AVD IT Priority Level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;External IT 0 Priority Level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;External IT 0 Priority Level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;External IT 1 Priority Level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;External IT 1 Priority Level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR1.b		; Interrupt Software Priority Register 1
	#define ISPR1_I0_4	0		;External IT 2 Priority Level
	#define ISPR1_I0_4_OR	$01
	#define ISPR1_I1_4	1		;External IT 2 Priority Level
	#define ISPR1_I1_4_OR	$02
	#define ISPR1_I_4_OR	$03
	#define ISPR1_I0_5	2		;AT Timer Output Compare IT Priority Level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;AT Timer Output Compare IT Priority Level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;AT Timer Input Capture IT Priority Level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;AT Timer Input Capture IT Priority Level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;AT Timer Overflow 1 IT Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;AT Timer Overflow 1 IT Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;AT Timer Overflow 2 IT Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;AT Timer Overflow 2 IT Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_9	2		;I2C IT Priority Level
	#define ISPR2_I0_9_OR	$04
	#define ISPR2_I1_9	3		;I2C IT Priority Level
	#define ISPR2_I1_9_OR	$08
	#define ISPR2_I_9_OR	$0c
	#define ISPR2_I0_10	4		;Lite Timer RTC IT Priority Level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;Lite Timer RTC IT Priority Level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30
	#define ISPR2_I0_11	6		;Lite Timer Input Capture IT Priority Level
	#define ISPR2_I0_11_OR	$40
	#define ISPR2_I1_11	7		;Lite Timer Input Capture IT Priority Level
	#define ISPR2_I1_11_OR	$80
	#define ISPR2_I_11_OR	$c0

	EXTERN ISPR3.b		; Interrupt Software Priority Register 3
	#define ISPR3_I0_12	0		;Lite Timer RTC2 IT Priority Level
	#define ISPR3_I0_12_OR	$01
	#define ISPR3_I1_12	1		;Lite Timer RTC2 IT Priority Level
	#define ISPR3_I1_12_OR	$02
	#define ISPR3_I_12_OR	$03

	EXTERN EICR.b		; External Interrupt Control Register
	#define EICR_IS00	0		;EI0 Sensitivity
	#define EICR_IS00_OR	$01
	#define EICR_IS01	1		;EI0 Sensitivity
	#define EICR_IS01_OR	$02
	#define EICR_IS0_OR	$03
	#define EICR_IS10	2		;EI1 Sensitivity
	#define EICR_IS10_OR	$04
	#define EICR_IS11	3		;EI1 Sensitivity
	#define EICR_IS11_OR	$08
	#define EICR_IS1_OR	$0c
	#define EICR_IS20	4		;EI2 Sensitivity
	#define EICR_IS20_OR	$10
	#define EICR_IS21	5		;EI2 Sensitivity
	#define EICR_IS21_OR	$20
	#define EICR_IS2_OR	$30

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
	#define ADCCSR_CH3	3		;Channel Selection
	#define ADCCSR_CH3_OR	$08
	#define ADCCSR_CH_OR	$0f
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

; Auto Wake Up from Halt Mode (AWU)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN AWUCSR.b		; Auto Wake Up from HALT Control/Status Register
	#define AWUCSR_AWUEN	0		;Auto Wake Up from HALT mode enable
	#define AWUCSR_AWUEN_OR	$01
	#define AWUCSR_AWUM	1		;Auto Wake Up Measurement
	#define AWUCSR_AWUM_OR	$02
	#define AWUCSR_AWUF	2		;Auto Wake Up Flag
	#define AWUCSR_AWUF_OR	$04

	EXTERN AWUPR.b		; Auto Wake Up from HALT prescaler Register
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

; Clock Controller Control/Status (CKCNTCSR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CKCNTCSR.b		; Clock Controller Control/Status Register
	#define CKCNTCSR_RC_AWU	0		;RC/AWU Selection
	#define CKCNTCSR_RC_AWU_OR	$01
	#define CKCNTCSR_RC_FLAG	2		;RC Selection
	#define CKCNTCSR_RC_FLAG_OR	$04
	#define CKCNTCSR_AWU_FLAG	3		;AWU Selection
	#define CKCNTCSR_AWU_FLAG_OR	$08

; I2C Bus Interface (I2C)
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
	#define I2COAR2_FR_1_0_	6		;Frequency Bits
	#define I2COAR2_FR_1_0__OR	$40

	EXTERN I2CDR.b		; Data Register

	#endif ; __ST7FOXK1__
