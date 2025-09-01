st7/

; ST7FL19F1.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST7FL19F1

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

; Port C at 0x06
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCDR			DS.B 1		; Data Register
.PCDDR			DS.B 1		; Data Direction Register

; Lite Timer at 0x08
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.LTCSR2			DS.B 1		; Lite Timer Control/Status Register 2
.LTARR			DS.B 1		; Lite Timer Auto-Reload Register
.LTCNTR			DS.B 1		; Lite Timer Counter Register
.LTCSR1			DS.B 1		; Lite Timer Control/Status Register 1
.LTICR			DS.B 1		; Lite Timer Input Capture Register

; Auto Reload Timer at 0x0d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ATCSR			DS.B 1		; Timer Control/Status Register1
.CNTR1H			DS.B 1		; Counter Value High
.CNTR1L			DS.B 1		; Counter Value Low
.ATR1H			DS.B 1		; Autoreload Register High
.ATR1L			DS.B 1		; Autoreload Register Low
.PWMCR			DS.B 1		; PWM Output Control Register
.PWM0CSR			DS.B 1		; PWM 0 Control/Status Register
.PWM1CSR			DS.B 1		; PWM 1 Control/Status Register
.PWM2CSR			DS.B 1		; PWM 2 Control/Status Register
.PWM3CSR			DS.B 1		; PWM 3 Control/Status Register
.DCR0H			DS.B 1		; PWM0 Duty Cycle Value High
.DCR0L			DS.B 1		; PWM0 Duty Cycle Value Low
.DCR1H			DS.B 1		; PWM1 Duty Cycle Value High
.DCR1L			DS.B 1		; PWM1 Duty Cycle Value Low
.DCR2H			DS.B 1		; PWM2 Duty Cycle Value High
.DCR2L			DS.B 1		; PWM2 Duty Cycle Value Low
.DCR3H			DS.B 1		; PWM3 Duty Cycle Value High
.DCR3L			DS.B 1		; PWM3 Duty Cycle Value Low
.ATICRH			DS.B 1		; Input Capture Data High
.ATICRL			DS.B 1		; Input Capture Data Low
.ATCSR2			DS.B 1		; Timer Control/Status Register 2
.BREAKCR			DS.B 1		; Break Control Register
.ATR2H			DS.B 1		; Autoreload Register 2 High
.ATR2L			DS.B 1		; Autoreload Register 2 Low
.DTGR			DS.B 1		; Dead Time Generator Register
.BREAKEN			DS.B 1		; Break Enable Register
reserved1		DS.B 5		; unused

; Analog Comparator at 0x2c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.VREFCR			DS.B 1		; Internal Voltage Reference Control Register
.CMPCR			DS.B 1		; Comparator and Internal Reference Control Register

; WatchDog Timer at 0x2e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register

; Flash at 0x2f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

; EEPROM at 0x30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EECSR			DS.B 1		; Data EEPROM Control Status Register

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
reserved2		DS.B 1		; unused

; External Interrupt Selection Register (ITC) at 0x3c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EISR			DS.B 1		; External Interrupt Selection Register
reserved3		DS.B 12		; unused

; Auto Wake Up from Halt Mode (AWU) at 0x49
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AWUPR			DS.B 1		; AWU HALT prescaler Register
.AWUCSR			DS.B 1		; AWU HALT Control/Status Register

	end
