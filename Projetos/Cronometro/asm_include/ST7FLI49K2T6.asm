st7/

; ST7FLI49K2T6.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST7FLI49K2T6

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
.PCOR			DS.B 1		; Option Register
reserved1		DS.B 3		; unused

; Lite Timer at 0x0c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.LTCSR2			DS.B 1		; Lite Timer Control/Status Register 2
.LTARR			DS.B 1		; Lite Timer Auto-Reload Register
.LTCNTR			DS.B 1		; Lite Timer Counter Register
.LTCSR1			DS.B 1		; Lite Timer Control/Status Register 1
.LTICR			DS.B 1		; Lite Timer Input Capture Register

; Auto Reload Timer at 0x11
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
reserved2		DS.B 1		; unused
.BREAKCR2			DS.B 1		; Break Control Register 2

; External Interrupt Control/Selection Register (ITC) at 0x2d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Interrupt Software Priority Register 3
.EICR			DS.B 1		; External Interrupt Control Register
reserved3		DS.B 1		; unused

; WatchDog Timer at 0x33
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register

; Flash at 0x34
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

; EEPROM at 0x35
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EECSR			DS.B 1		; Data EEPROM Control Status Register

; 10-Bit A/D Converter (ADC) at 0x36
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCCSR			DS.B 1		; ADC Control/Status Register
.ADCDRH			DS.B 1		; Data Register High
.ADCDRL			DS.B 1		; Data Register Low
reserved4		DS.B 1		; unused

; Main Clock Control/Status Register (MCC) at 0x3a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MCCSR			DS.B 1		; Main Clock Control/Status Register

; RC Control Register (RCCR) at 0x3b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RCCR			DS.B 1		; RC Control Register

; System Integrity Control/Status Register (SI) at 0x3c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SICSR			DS.B 1		; System Integrity Control/Status Register

; AVD Threshold Selection Register (AVDTHCR) at 0x3d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AVDTHCR			DS.B 1		; AVD Threshold Selection Register / RC prescaler
reserved5		DS.B 10		; unused

; Auto Wake Up from Halt Mode (AWU) at 0x48
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AWUCSR			DS.B 1		; Auto Wake Up from HALT Control/Status Register
.AWUPR			DS.B 1		; Auto Wake Up from HALT prescaler Register
reserved6		DS.B 7		; unused

; Clock Controller Control/Status (CKCNTCSR) at 0x51
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CKCNTCSR			DS.B 1		; Clock Controller Control/Status Register

;  Analog Comparator (CMP) at 0x52
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.VREFCR			DS.B 1		; Internal Voltage Reference Register
.CMPACR			DS.B 1		; Comparator A Control Register
.CMPBCR			DS.B 1		; Comparator B Control Register

; 16-Bit Timer  at 0x55
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TACR2			DS.B 1		; Control Register 2
.TACR1			DS.B 1		; Control Register 1
.TACSR			DS.B 1		; Status Register
.TAIC1HR			DS.B 1		; Input Capture 1 High Register
.TAIC1LR			DS.B 1		; Input Capture 1 Low Register
.TAOC1HR			DS.B 1		; Output Compare 1 High Register
.TAOC1LR			DS.B 1		; Output Compare 1 Low Register
.TACHR			DS.B 1		; Counter High Register
.TACLR			DS.B 1		; Counter Low Register
.TAACHR			DS.B 1		; Alternate Counter High Register
.TAACLR			DS.B 1		; Alternate Counter Low Register
.TAIC2HR			DS.B 1		; Input Capture 2 High Register
.TAIC2LR			DS.B 1		; Input Capture 2 Low Register
.TAOC2HR			DS.B 1		; Output Compare 2 High Register
.TAOC2LR			DS.B 1		; Output Compare 2 Low Register

; I2C Bus Interface (I2C) at 0x64
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2CCR			DS.B 1		; Control Register
.I2CSR1			DS.B 1		; Status Register 1
.I2CSR2			DS.B 1		; Status Register 2
.I2CCCR			DS.B 1		; Clock Control Register
.I2COAR1			DS.B 1		; Own Address Register 1
.I2COAR2			DS.B 1		; Own Address Register 2
.I2CDR			DS.B 1		; Data Register
reserved7		DS.B 5		; unused

; Serial Peripheral Interface (SPI) at 0x70
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPICSR			DS.B 1		; Control/Status Register

	end
