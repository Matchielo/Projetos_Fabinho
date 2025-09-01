st7/

; ST7FLITE20.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST7FLITE20

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
reserved1		DS.B 2		; unused

; Lite Timer at 0x08
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.LTCSR2			DS.B 1		; Lite Timer Control/Status Register 2
.LTAAR			DS.B 1		; Lite Timer Auto-Reload Register
.LTCNTR			DS.B 1		; Lite Timer Counter Register
.LTCSR1			DS.B 1		; Lite Timer Control/Status Register 1
.LTICR			DS.B 1		; Lite Timer Input Capture Register

; Auto Reload Timer at 0x0d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ATCSR			DS.B 1		; Timer Control/Status Register
.CNTRH			DS.B 1		; Counter Register High
.CNTRL			DS.B 1		; Counter Register Low
.ATRH			DS.B 1		; Auto-Reload Register High
.ATRL			DS.B 1		; Auto-Reload Register Low
.PWMCR			DS.B 1		; PWM Output Control Register
.PWM0CSR			DS.B 1		; PWM 0 Control/Status Register
.PWM1CSR			DS.B 1		; PWM 1 Control/Status Register
.PWM2CSR			DS.B 1		; PWM 2 Control/Status Register
.PWM3CSR			DS.B 1		; PWM 3 Control/Status Register
.DCR0H			DS.B 1		; PWM 0 Duty Cycle Register High
.DCR0L			DS.B 1		; PWM 0 Duty Cycle Register Low
.DCR1H			DS.B 1		; PWM 1 Duty Cycle Register High
.DCR1L			DS.B 1		; PWM 1 Duty Cycle Register Low
.DCR2H			DS.B 1		; PWM 2 Duty Cycle Register High
.DCR2L			DS.B 1		; PWM 2 Duty Cycle Register Low
.DCR3H			DS.B 1		; PWM 3 Duty Cycle Register High
.DCR3L			DS.B 1		; PWM 3 Duty Cycle Register Low
.ATICRH			DS.B 1		; Input Capture Register High
.ATICRL			DS.B 1		; Input Capture Register Low
.TRANCR			DS.B 1		; Transfer Control Register
.BREAKCR			DS.B 1		; Break Control Register
reserved2		DS.B 11		; unused

; WatchDog Timer at 0x2e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register

; Flash at 0x2f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register
reserved3		DS.B 1		; unused

; Serial Peripheral Interface (SPI) at 0x31
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPISR			DS.B 1		; Status Register

; 10-Bit A/D Converter (ADC) at 0x34
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCCSR			DS.B 1		; ADC Control/Status Register
.ADCDRH			DS.B 1		; Data Register High
.ADCDRL			DS.B 1		; Amplifier Control/Data Register Low

; External Interrupt Control Register (ITC) at 0x37
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EICR			DS.B 1		; External Interrupt Control Register

; Main Clock Control/Status Register (MCC) at 0x38
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MCCSR			DS.B 1		; Main Clock Control/Status Register

; RC Control Register (RCCR) at 0x39
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RCCR			DS.B 1		; RC Control Register

; System Integrity Control/Status Register (SICSR) at 0x3a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SICSR			DS.B 1		; System Integrity Control/Status Register
reserved4		DS.B 1		; unused

; External Interrupt Selection Register (ITC) at 0x3c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EISR			DS.B 1		; External Interrupt Selection Register
reserved5		DS.B 12		; unused

; Auto Wake Up from Halt Mode (AWU) at 0x49
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AWUPR			DS.B 1		; AWU HALT prescaler Register
.AWUCSR			DS.B 1		; AWU HALT Control/Status Register

	end
