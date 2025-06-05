; ST7FL15F1.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7FL15F1__
; do nothing
	#else
	#define __ST7FL15F1__ 1

; ST7FL15F1


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

; Analog Comparator
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN VREFCR.b		; Internal Voltage Reference Control Register

	EXTERN CMPCR.b		; Comparator and Internal Reference Control Register

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

	EXTERN SPISR.b		; Status Register

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

	EXTERN ADCDRL.b		; Amplifier Control/Data Register Low
	#define ADCDRL_AMPON	2		;Amplifier Control Bit
	#define ADCDRL_AMPON_OR	$04
	#define ADCDRL_SLOW	3		;ADC Slow Mode
	#define ADCDRL_SLOW_OR	$08

; External Interrupt Control Register (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	#define EICR_IS30	6		;EI3 Sensitivity
	#define EICR_IS30_OR	$40
	#define EICR_IS31	7		;EI3 Sensitivity
	#define EICR_IS31_OR	$80
	#define EICR_IS3_OR	$c0

; Main Clock Control/Status Register (MCC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MCCSR.b		; Main Clock Control/Status Register
	#define MCCSR_SMS	0		;Slow Mode Selection
	#define MCCSR_SMS_OR	$01
	#define MCCSR_MCO	1		;Main Clock Out Enable
	#define MCCSR_MCO_OR	$02

; RC Control Register (RCCR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN RCCR.b		; RC Control Register

; System Integrity Control/Status Register (SICSR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SICSR.b		; System Integrity Control/Status Register
	#define SICSR_AVDIE	0		;Voltage Reset Flag
	#define SICSR_AVDIE_OR	$01
	#define SICSR_AVDF	1		;Voltage Detector Flag
	#define SICSR_AVDF_OR	$02
	#define SICSR_LVDRF	2		;LVD Reset Flag
	#define SICSR_LVDRF_OR	$04
	#define SICSR_LOCKED	3		;PLL Locked Flag
	#define SICSR_LOCKED_OR	$08

; External Interrupt Selection Register (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN EISR.b		; External Interrupt Selection Register
	#define EISR_EI00	0		;EI0 Pin Selection
	#define EISR_EI00_OR	$01
	#define EISR_EI01	1		;EI0 Pin Selection
	#define EISR_EI01_OR	$02
	#define EISR_EI0_OR	$03
	#define EISR_EI10	2		;EI1 Pin Selection
	#define EISR_EI10_OR	$04
	#define EISR_EI11	3		;EI1 Pin Selection
	#define EISR_EI11_OR	$08
	#define EISR_EI1_OR	$0c
	#define EISR_EI20	4		;EI2 Pin Selection
	#define EISR_EI20_OR	$10
	#define EISR_EI21	5		;EI2 Pin Selection
	#define EISR_EI21_OR	$20
	#define EISR_EI2_OR	$30
	#define EISR_EI30	6		;EI3 Pin Selection
	#define EISR_EI30_OR	$40
	#define EISR_EI31	7		;EI3 Pin Selection
	#define EISR_EI31_OR	$80
	#define EISR_EI3_OR	$c0

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

	#endif ; __ST7FL15F1__
