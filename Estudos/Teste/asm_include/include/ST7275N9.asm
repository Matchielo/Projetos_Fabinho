st7/

; ST7275N9.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7275N9

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Port A at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register

; Port C at 0x02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCDR			DS.B 1		; Data Register
.PCDDR			DS.B 1		; Data Direction Register

; Port D at 0x04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PDDR			DS.B 1		; Data Register
.PDDDR			DS.B 1		; Data Direction Register

; Port B at 0x06
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PBDR			DS.B 1		; Data Register
.PBDDR			DS.B 1		; Data Direction Register
.PBICFGR			DS.B 1		; Input Pull-up Configuration Register

; Miscellaneous at 0x09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR			DS.B 1		; Miscellaneous Register

; 8-Bit A/D Converter (ADC) at 0x0a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCDR			DS.B 1		; Data Register
.ADCCSR			DS.B 1		; Control/Status Register

; WatchDog Timer at 0x0c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
reserved1		DS.B 4		; unused

; 16-Bit Timer at 0x11
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TCR2			DS.B 1		; Control Register 2
.TCR1			DS.B 1		; Control Register 1
.TSR			DS.B 1		; Status Register
.TIC1HR			DS.B 1		; Input Capture 1 High Register
.TIC1LR			DS.B 1		; Input Capture 1 Low Register
.TOC1HR			DS.B 1		; Output Compare 1 High Register
.TOC1LR			DS.B 1		; Output Compare 1 Low Register
.TCHR			DS.B 1		; Counter High Register
.TCLR			DS.B 1		; Counter Low Register
.TACHR			DS.B 1		; Alternate Counter High Register
.TACLR			DS.B 1		; Alternate Counter Low Register
.TIC2HR			DS.B 1		; Input Capture 2 High Register
.TIC2LR			DS.B 1		; Input Capture 2 Low Register
.TOC2HR			DS.B 1		; Output Compare 2 High Register
.TOC2LR			DS.B 1		; Output Compare 2 Low Register
reserved2		DS.B 2		; unused

; D/A Converter (DAC) with PWM outputs at 0x22
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWM0			DS.B 1		; Channel 0 PWM Register
.BRM0			DS.B 1		; Channel 0 BRM Register
.PWM1			DS.B 1		; Channel 1 PWM Register
.BRM21			DS.B 1		; Channel 2+1 BRM Register
.PWM2			DS.B 1		; Channel 2 PWM Register
.PWM3			DS.B 1		; Channel 3 PWM Register
.BRM43			DS.B 1		; Channel 4+3 BRM Register
.PWM4			DS.B 1		; Channel 4 PWM Register
reserved3		DS.B 6		; unused

; Serial Communications Interface (SCI) at 0x30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SCISR			DS.B 1		; Status Register
.SCIDR			DS.B 1		; Data Register
.SCIBRR			DS.B 1		; Baud Rate Register
.SCICR1			DS.B 1		; Control Register 1
.SCICR2			DS.B 1		; Control Register 2
reserved4		DS.B 11		; unused

; SYNC Processor (SYNC) at 0x40
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CFGR			DS.B 1		; CONFIGURATION REGISTER
.MCR			DS.B 1		; MUX CONTROL REGISTER
.CCR			DS.B 1		; COUNTER CONTROL REGISTER
.POLR			DS.B 1		; POLARITY REGISTER
.LATR			DS.B 1		; LATCH REGISTER
.HGENR			DS.B 1		; HORIZONTAL SYNC GENERATOR REGISTER
.VGENR			DS.B 1		; VERTICAL SYNC GENERATOR REGISTER
.ENR			DS.B 1		; ENABLE REGISTER

; DDC/DMA Interface at 0x48
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CR			DS.B 1		; DDC/CI Control Register
.SR1			DS.B 1		; DDC/CI Status Register 1
.SR2			DS.B 1		; DDC/CI Status Register 2
reserved5		DS.B 1		; unused
.OAR			DS.B 1		; DDC/CI (7 bits) Slave Address Register
reserved6		DS.B 1		; unused
.DR			DS.B 1		; DDC/CI Data Register
.AHR			DS.B 1		; DDC1/2B Address Pointer High Register
.DCR			DS.B 1		; DDC1/2B Control Register
reserved7		DS.B 8		; unused

; I2C at 0x59
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2CDR			DS.B 1		; Data Register
reserved8		DS.B 1		; unused
.I2COAR			DS.B 1		; Own Address Register
.I2CCCR			DS.B 1		; Clock Control Register
.I2CSR2			DS.B 1		; Status Register 2
.I2CSR1			DS.B 1		; Status Register 1
.I2CCR			DS.B 1		; Control Register

	end
