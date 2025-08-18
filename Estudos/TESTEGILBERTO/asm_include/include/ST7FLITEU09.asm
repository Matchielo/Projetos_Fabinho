st7/

; ST7FLITEU09.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7FLITEU09

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Port A at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register
.PAOR			DS.B 1		; Option Register
reserved1		DS.B 8		; unused

; Lite Timer at 0x0b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.LTCSR			DS.B 1		; Lite Timer Control/Status Register
.LTICR			DS.B 1		; Lite Timer Input Capture Register

; Auto Reload Timer at 0x0d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ATCSR			DS.B 1		; Timer Control/Status Register1
.CNTRH			DS.B 1		; Counter Value High
.CNTRL			DS.B 1		; Counter Value Low
.ATRH			DS.B 1		; Autoreload Register High
.ATRL			DS.B 1		; Autoreload Register Low
.PWMCR			DS.B 1		; PWM Output Control Register
.PWM0CSR			DS.B 1		; PWM 0 Control/Status Register
reserved2		DS.B 3		; unused
.DCR0H			DS.B 1		; PWM0 Duty Cycle Value High
.DCR0L			DS.B 1		; PWM0 Duty Cycle Value Low
reserved3		DS.B 22		; unused

; Flash at 0x2f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

; EEPROM at 0x30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EECSR			DS.B 1		; Data EEPROM Control Status Register
reserved4		DS.B 3		; unused

; 10-Bit A/D Converter (ADC) at 0x34
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCCSR			DS.B 1		; ADC Control/Status Register
.ADCDRH			DS.B 1		; Data Register High
.ADCDRL			DS.B 1		; Data Register Low

; External Interrupt Control Register 1 (ITC1) at 0x37
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EICR1			DS.B 1		; External Interrupt Control Register 1

; Main Clock Control/Status Register (MCC) at 0x38
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MCCSR			DS.B 1		; Main Clock Control/Status Register

; RC Oscillator Control Register (RCCR) at 0x39
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RCCR			DS.B 1		; RC Control Register

; System Integrity Control/Status Register (SICSR) at 0x3a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SICSR			DS.B 1		; System Integrity Control/Status Register
reserved5		DS.B 2		; unused

; External Interrupt Control Register 2 (ITC2) at 0x3d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EICR2			DS.B 1		; External Interrupt Control Register 2

; AVD Threshold Selection Register (AVDTHCR) at 0x3e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AVDTHCR			DS.B 1		; AVD Threshold Selection Register / RC prescaler

; Clock Controller Control/Status (CKCNTCSR) at 0x3f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CKCNTCSR			DS.B 1		; Clock Controller Control/Status Register
reserved6		DS.B 7		; unused

; Multiplexed IO Reset Control Register (MUXCR) at 0x47
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MUXCR0			DS.B 1		; Multiplexed IO Reset Register Low
.MUXCR1			DS.B 1		; Multiplexed IO Reset Register High

; Auto Wake Up from Halt Mode (AWU) at 0x49
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AWUPR			DS.B 1		; AWU HALT prescaler Register
.AWUCSR			DS.B 1		; AWU HALT Control/Status Register

	end
