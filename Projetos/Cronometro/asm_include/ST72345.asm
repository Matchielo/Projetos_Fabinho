st7/

; ST72345.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST72345

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

; Port D at 0x09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PDDR			DS.B 1		; Data Register
.PDDDR			DS.B 1		; Data Direction Register
.PDOR			DS.B 1		; Option Register

; Port E at 0x0c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PEDR			DS.B 1		; Data Register
.PEDDR			DS.B 1		; Data Direction Register
.PEOR			DS.B 1		; Option Register

; Port F at 0x0f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PFDR			DS.B 1		; Data Register
.PFDDR			DS.B 1		; Data Direction Register
.PFOR			DS.B 1		; Option Register
reserved1		DS.B 5		; unused

; RC Control Register (RCCR) at 0x17
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RCCRH			DS.B 1		; RCC Control High Register
.RCCRL			DS.B 1		; RCC Control Low Register
reserved2		DS.B 7		; unused

; EEPROM at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EECSR			DS.B 1		; Data EEPROM Control Status Register

; Serial Peripheral Interface (SPI) at 0x21
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPICSR			DS.B 1		; Control/Status Register

; Interrupt Software Priority (ITC) at 0x24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Interrupt Software Priority Register 3
.EICR			DS.B 1		; External Interrupt Control Register

; Flash at 0x29
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

; WatchDog Control Register at 0x2a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register

; Main Clock Control/Status Register (MCC) at 0x2b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SICSR			DS.B 1		; System Integrity Control/Status Register
.MCCSR			DS.B 1		; Main Clock Control/Status Register
.MCCBCR			DS.B 1		; MCC Beep Control Register

; Auto Wake Up (AWU) at 0x2e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AWUCSR			DS.B 1		; Control/Status Register
.AWUPR			DS.B 1		; Prescaler Register

; Window Watchdog Control Register (WWDG) at 0x30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WWDGCR			DS.B 1		; Window Watchdog Control Register

; 16-Bit Timer A at 0x31
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TACR2			DS.B 1		; Control Register 2
.TACR1			DS.B 1		; Control Register 1
.TACSR			DS.B 1		; Control/Status Register
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
reserved3		DS.B 1		; unused

; 16-Bit Timer B at 0x41
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBCR2			DS.B 1		; Control Register 2
.TBCR1			DS.B 1		; Control Register 1
.TBCSR			DS.B 1		; Control/Status Register
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
reserved4		DS.B 1		; unused
.SCIERPR			DS.B 1		; Ext. Receive Prescaler Reg.
.SCIETPR			DS.B 1		; Ext. Transmit Prescaler Reg.

; I2C Bus Interface (I2CMMS) at 0x58
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2CCR			DS.B 1		; Control Register
.I2CSR1			DS.B 1		; Status Register 1
.I2CSR2			DS.B 1		; Status Register 2
.I2CCCR			DS.B 1		; Clock Control Register
.I2COAR1			DS.B 1		; Own Address Register 1
.I2COAR2			DS.B 1		; Own Address Register 2
.I2CDR			DS.B 1		; Data Register
reserved5		DS.B 1		; unused

; I2C Triple Slave Interface with DMA (I2C3SNS) at 0x60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2C3SCR1			DS.B 1		; Control Register 1
.I2C3sCR2			DS.B 1		; Control Register 2
.I2C3SSR			DS.B 1		; Status Register
.I2C3SBCR			DS.B 1		; Byte Count Register
.I2C3SSAR1			DS.B 1		; Slave Address Register 1
.I2C3SCAR1			DS.B 1		; Current Address Register 1
.I2C3SSAR2			DS.B 1		; Slave Address Register 2
.I2C3SCAR2			DS.B 1		; Current Address Register 2
.I2C3SSAR3			DS.B 1		; Slave Address Register 3
.I2C3SCAR3			DS.B 1		; Current Address Register 3
reserved6		DS.B 6		; unused

; 10-Bit A/D Converter (ADC) at 0x70
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCCSR			DS.B 1		; Control/Status Register
.ADCDRH			DS.B 1		; Data High Register
.ADCDRL			DS.B 1		; Data low Register

	end
