st7/

; ST72589C.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST72589C

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Port A at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register
.PAOR			DS.B 1		; Option Register
reserved1		DS.B 1		; unused

; Port B at 0x04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PBDR			DS.B 1		; Data Register
.PBDDR			DS.B 1		; Data Direction Register
.PBOR			DS.B 1		; Option Register
reserved2		DS.B 1		; unused

; Port C at 0x08
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCDR			DS.B 1		; Data Register
.PCDDR			DS.B 1		; Data Direction Register
.PCOR			DS.B 1		; Option Register
reserved3		DS.B 1		; unused

; Port D at 0x0c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PDDR			DS.B 1		; Data Register
.PDDDR			DS.B 1		; Data Direction Register
.PDOR			DS.B 1		; Option Register
reserved4		DS.B 13		; unused

; Interrupt Software Priority (ITC) at 0x1c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Interrupt Software Priority Register 3

; Miscellaneous 1 at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR1			DS.B 1		; Miscellaneous Register 1

; Serial Peripheral Interface (SPI) at 0x21
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPISR			DS.B 1		; Status Register

; WatchDog Timer at 0x24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
reserved5		DS.B 1		; unused

; Main Clock Control/Status at 0x26
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MCCSR			DS.B 1		; Main Clock Control/Status Register
reserved6		DS.B 1		; unused

; I2C at 0x28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2CCR			DS.B 1		; Control Register
.I2CSR1			DS.B 1		; Status Register 1
.I2CSR2			DS.B 1		; Status Register 2
.I2CCCR			DS.B 1		; Clock Control Register
.I2COAR1			DS.B 1		; Own Address Register 1
.I2COAR2			DS.B 1		; Own Address Register 2
.I2CDR			DS.B 1		; Data Register
reserved7		DS.B 2		; unused

; 16-Bit Timer A at 0x31
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TACR2			DS.B 1		; Control Register 2
.TACR1			DS.B 1		; Control Register 1
.TASR			DS.B 1		; Status Register
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

; Miscellaneous 2 at 0x40
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR2			DS.B 1		; Miscellaneous Register 2

; 16-Bit Timer B at 0x41
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBCR2			DS.B 1		; Control Register 2
.TBCR1			DS.B 1		; Control Register 1
.TBSR			DS.B 1		; Status Register
.TBIC1HR			DS.B 1		; Input Capture 1 High Register
.TBIC1LR			DS.B 1		; Input Capture 1 Low Register
.TBOC1HR			DS.B 1		; Output Compare 1 High Register
.TBOC1LR			DS.B 1		; Output Compare 1 Low Register
.TBCHR			DS.B 1		; Counter High Register
.TBCLR			DS.B 1		; Counter Low Register
.TBACHR			DS.B 1		; Alternate Counter High Register
.TBACLR			DS.B 1		; Alternate Counter Low Register
.TBIC2HR			DS.B 1		; Input Capture 2 High Register
.TBIC2LR			DS.B 1		; Input Capture 2 Low Register
.TBOC2HR			DS.B 1		; Output Compare 2 High Register
.TBOC2LR			DS.B 1		; Output Compare 2 Low Register

; Serial Communications Interface (SCI) at 0x50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SCISR			DS.B 1		; Status Register
.SCIDR			DS.B 1		; Data Register
.SCIBRR			DS.B 1		; Baud Rate Register
.SCICR1			DS.B 1		; Control Register 1
.SCICR2			DS.B 1		; Control Register 2
.SCIERPR			DS.B 1		; Ext. Receive Prescaler Reg.
reserved8		DS.B 1		; unused
.SCIETPR			DS.B 1		; Ext. Transmit Prescaler Reg.
reserved9		DS.B 2		; unused

; Controller Area Network (CAN) at 0x5a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CANISR			DS.B 1		; Interrupt Status Register
.CANICR			DS.B 1		; Interrupt Control Register
.CANCSR			DS.B 1		; Control/Status Register
.CANBRPR			DS.B 1		; Baud Rate Prescaler Register
.CANBTR			DS.B 1		; Bit Timing Register
.CANPSR			DS.B 1		; Page Selection Register
.CANPR0			DS.B 1		; Address 60h Paged Register see datasheet
.CANPR1			DS.B 1		; Address 61h Paged Register see datasheet
.CANPR2			DS.B 1		; Address 62h Paged Register see datasheet
.CANPR3			DS.B 1		; Address 63h Paged Register see datasheet
.CANPR4			DS.B 1		; Address 64h Paged Register see datasheet
.CANPR5			DS.B 1		; Address 65h Paged Register see datasheet
.CANPR6			DS.B 1		; Address 66h Paged Register see datasheet
.CANPR7			DS.B 1		; Address 67h Paged Register see datasheet
.CANPR8			DS.B 1		; Address 68h Paged Register see datasheet
.CANPR9			DS.B 1		; Address 69h Paged Register see datasheet
.CANPR10			DS.B 1		; Address 6Ah Paged Register see datasheet
.CANPR11			DS.B 1		; Address 6Bh Paged Register see datasheet
.CANPR12			DS.B 1		; Address 6Ch Paged Register see datasheet
.CANPR13			DS.B 1		; Address 6Dh Paged Register see datasheet
.CANPR14			DS.B 1		; Address 6Eh Paged Register see datasheet
.CANPR15			DS.B 1		; Address 6Fh Paged Register see datasheet

; 8-Bit A/D Converter (ADC) at 0x70
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCDR			DS.B 1		; Data Register
.ADCCSR			DS.B 1		; Control/Status Register
reserved10		DS.B 2		; unused

; D/A Converter (DAC) with PWM outputs at 0x74
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWM0			DS.B 1		; Channel 0 PWM Register
.BRM10			DS.B 1		; Channel 1+0 BRM Register
.PWM1			DS.B 1		; Channel 1 PWM Register
.PWM2			DS.B 1		; Channel 2 PWM Register
.BRM32			DS.B 1		; Channel 3+2 BRM Register
.PWM3			DS.B 1		; Channel 3 PWM Register

	end
