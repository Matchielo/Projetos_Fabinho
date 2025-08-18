st7/

; ST7FLITE02.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7FLITE02

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
.LTICR			DS.B 1		; Lite Timer Input Capture Register

; Auto Reload Timer at 0x0d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ATCSR			DS.B 1		; Timer Control/Satatus Register
.CNTRH			DS.B 1		; Counter Register High
.CNTRL			DS.B 1		; Counter Register Low
.ARTH			DS.B 1		; Auto-Reload Register High
.ARTL			DS.B 1		; Auto-Reload Register Low
.PWMOCR			DS.B 1		; PWM Output Control Register
.PWM0CSR			DS.B 1		; PWM 0 Control/Status Register
reserved2		DS.B 3		; unused
.DCR0H			DS.B 1		; PWM 0 Duty Cycle Register High
.DCR0L			DS.B 1		; PWM 0 Duty Cycle Register Low
reserved3		DS.B 22		; unused

; Flash at 0x2f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register
reserved4		DS.B 1		; unused

; Serial Peripheral Interface (SPI) at 0x31
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPISR			DS.B 1		; Status Register
reserved5		DS.B 3		; unused

; Interrupt Control Register (ITC) at 0x37
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

	end
