st7/

; ST7FLITEBC.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7FLITEBC

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Port A at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register
.PAOR			DS.B 1		; Option Register

; Port B at 0x03
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PBDR			DS.B 1		; Data Register
.PBDDR			DS.B 1		; Data Direction Register
.PBOR			DS.B 1		; Option Register
reserved1		DS.B 5		; unused

; Lite Timer at 0x0b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.LTCSR			DS.B 1		; Lite Timer Control/Status Register
reserved2		DS.B 1		; unused

; Auto Reload Timer at 0x0d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ATCSR			DS.B 1		; Timer Control/Satatus Register
reserved3		DS.B 1		; unused
.CNTR			DS.B 1		; Counter Register
reserved4		DS.B 1		; unused
.ATR			DS.B 1		; Auto-Reload Register
.PWMCR			DS.B 1		; PWM Output Control Register
.PWM0CSR			DS.B 1		; PWM 0 Control/Status Register
reserved5		DS.B 4		; unused
.DCR0			DS.B 1		; PWM 0 Duty Cycle Register
reserved6		DS.B 22		; unused

; Flash at 0x2f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register
reserved7		DS.B 4		; unused

; 8-Bit A/D Converter (ADC) at 0x34
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCCSR1			DS.B 1		; ADC Control/Status Register 1
.ADCDR			DS.B 1		; ADC Data Register
.ADCCSR2			DS.B 1		; ADC Control/Status Register 2

; External Interrupt Control Register (ITC) at 0x37
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EICR			DS.B 1		; External Interrupt Control Register

; Main Clock Control/Status Register (MCC) at 0x38
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MCCSR			DS.B 1		; Main Clock Control/Status Register
reserved8		DS.B 1		; unused

; System Integrity Control/Status Register (SICSR) at 0x3a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SICSR			DS.B 1		; System Integrity Control/Status Register
reserved9		DS.B 1		; unused

; External Interrupt Selection Register (ITC) at 0x3c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EISR			DS.B 1		; External Interrupt Selection Register

	end
