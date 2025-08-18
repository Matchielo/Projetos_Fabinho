; ST7FL09.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7FL09__
; do nothing
	#else
	#define __ST7FL09__ 1

; ST7FL09


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

	EXTERN LTICR.b		; Lite Timer Input Capture Register

; Auto Reload Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ATCSR.b		; Timer Control/Satatus Register

	EXTERN CNTRH.b		; Counter Register High

	EXTERN CNTRL.b		; Counter Register Low

	EXTERN ARTH.b		; Auto-Reload Register High

	EXTERN ARTL.b		; Auto-Reload Register Low

	EXTERN PWMOCR.b		; PWM Output Control Register
	#define PWMOCR_OE0	0		;PWM Mode Enable
	#define PWMOCR_OE0_OR	$01

	EXTERN PWM0CSR.b		; PWM 0 Control/Status Register

	EXTERN DCR0H.b		; PWM 0 Duty Cycle Register High

	EXTERN DCR0L.b		; PWM 0 Duty Cycle Register Low

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

; EEPROM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN EECSR.b		; Data EEPROM Control Status Register
	#define EECSR_E2PGM	0		;Programming Control and status
	#define EECSR_E2PGM_OR	$01
	#define EECSR_E2LAT	1		;Latch Access Transfer
	#define EECSR_E2LAT_OR	$02

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
	#define ADCCSR1_SPEED	6		;ADC clock selection
	#define ADCCSR1_SPEED_OR	$40
	#define ADCCSR1_EOC	7		;End of Conversion
	#define ADCCSR1_EOC_OR	$80

	EXTERN ADCDR.b		; ADC Data Register

	EXTERN ADCCSR2.b		; ADC Control/Status Register 2
	#define ADCCSR2_SLOW	3		;ADC Slow Mode
	#define ADCCSR2_SLOW_OR	$08

; Interrupt Control Register (ITC)
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

	#endif ; __ST7FL09__
