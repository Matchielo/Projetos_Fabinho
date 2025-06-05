; ST7FLITE10.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7FLITE10__
; do nothing
	#else
	#define __ST7FLITE10__ 1

; ST7FLITE10


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

; Lite Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN LTCSR2.b		; Lite Timer Control/Status Register 2

	EXTERN LTAAR.b		; Lite Timer Auto-Reload Register

	EXTERN LTCNTR.b		; Lite Timer Counter Register

	EXTERN LTCSR1.b		; Lite Timer Control/Status Register 1

	EXTERN LTICR.b		; Lite Timer Input Capture Register

; Auto Reload Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ATCSR.b		; Timer Control/Status Register

	EXTERN CNTRH.b		; Counter Register High

	EXTERN CNTRL.b		; Counter Register Low

	EXTERN ATRH.b		; Auto-Reload Register High

	EXTERN ATRL.b		; Auto-Reload Register Low

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

	EXTERN PWM1CSR.b		; PWM 1 Control/Status Register

	EXTERN PWM2CSR.b		; PWM 2 Control/Status Register

	EXTERN PWM3CSR.b		; PWM 3 Control/Status Register

	EXTERN DCR0H.b		; PWM 0 Duty Cycle Register High

	EXTERN DCR0L.b		; PWM 0 Duty Cycle Register Low

	EXTERN DCR1H.b		; PWM 1 Duty Cycle Register High

	EXTERN DCR1L.b		; PWM 1 Duty Cycle Register Low

	EXTERN DCR2H.b		; PWM 2 Duty Cycle Register High

	EXTERN DCR2L.b		; PWM 2 Duty Cycle Register Low

	EXTERN DCR3H.b		; PWM 3 Duty Cycle Register High

	EXTERN DCR3L.b		; PWM 3 Duty Cycle Register Low

	EXTERN ATICRH.b		; Input Capture Register High

	EXTERN ATICRL.b		; Input Capture Register Low

	EXTERN TRANCR.b		; Transfer Control Register
	#define TRANCR_TRAN	0		;Transfer Enable
	#define TRANCR_TRAN_OR	$01

	EXTERN BREAKCR.b		; Break Control Register
	#define BREAKCR_BPIN	4		;Break Pin Enable
	#define BREAKCR_BPIN_OR	$10
	#define BREAKCR_BA	5		;Break Active
	#define BREAKCR_BA_OR	$20

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

	#endif ; __ST7FLITE10__
