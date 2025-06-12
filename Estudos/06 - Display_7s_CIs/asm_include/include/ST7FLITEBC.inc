; ST7FLITEBC.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7FLITEBC__
; do nothing
	#else
	#define __ST7FLITEBC__ 1

; ST7FLITEBC


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

	EXTERN LTCSR.b		; Lite Timer Control/Status Register

; Auto Reload Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ATCSR.b		; Timer Control/Satatus Register

	EXTERN CNTR.b		; Counter Register

	EXTERN ATR.b		; Auto-Reload Register

	EXTERN PWMCR.b		; PWM Output Control Register
	#define PWMCR_OE0	0		;PWM Mode Enable
	#define PWMCR_OE0_OR	$01

	EXTERN PWM0CSR.b		; PWM 0 Control/Status Register

	EXTERN DCR0.b		; PWM 0 Duty Cycle Register

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

; 8-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADCCSR1.b		; ADC Control/Status Register 1
	#define ADCCSR1_CH0	0		;Channel Selection
	#define ADCCSR1_CH0_OR	$01
	#define ADCCSR1_CH1	1		;Channel Selection
	#define ADCCSR1_CH1_OR	$02
	#define ADCCSR1_CH2	2		;Channel Selection
	#define ADCCSR1_CH2_OR	$04
	#define ADCCSR1_CH_OR	$07
	#define ADCCSR1_ADON	5		;ADC Converter On
	#define ADCCSR1_ADON_OR	$20
	#define ADCCSR1_EOC	7		;End of Conversion
	#define ADCCSR1_EOC_OR	$80

	EXTERN ADCDR.b		; ADC Data Register

	EXTERN ADCCSR2.b		; ADC Control/Status Register 2
	#define ADCCSR2_SLOW	3		;ADC Slow Mode
	#define ADCCSR2_SLOW_OR	$08

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

; System Integrity Control/Status Register (SICSR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SICSR.b		; System Integrity Control/Status Register
	#define SICSR_LVDRF	4		;LVD Reset Flag
	#define SICSR_LVDRF_OR	$10

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

	#endif ; __ST7FLITEBC__
