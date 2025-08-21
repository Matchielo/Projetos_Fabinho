st7/

; ST72774J7.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST72774J7

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Port A at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register

; Port B at 0x02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PBDR			DS.B 1		; Data Register
.PBDDR			DS.B 1		; Data Direction Register

; Port C at 0x04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCDR			DS.B 1		; Data Register
.PCDDR			DS.B 1		; Data Direction Register

; Port D at 0x06
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PDDR			DS.B 1		; Data Register
.PDDDR			DS.B 1		; Data Direction Register

; WatchDog Timer at 0x08
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register

; Miscellaneous at 0x09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR			DS.B 1		; Miscellaneous Register

; 8-Bit A/D Converter (ADC) at 0x0a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCDR			DS.B 1		; Data Register
.ADCCSR			DS.B 1		; Control/Status Register

; DDC1/2B Interface at 0x0c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.DCR			DS.B 1		; DDC1/2B Control Register
.AHR			DS.B 1		; DDC1/2B Address Pointer High Register

; Timing Measurement Unit(TMU) at 0x0e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TMUCSR			DS.B 1		; Control Status Register
.TMUT1CR			DS.B 1		; T1 Counter Register
.TMUT2CR			DS.B 1		; T2 Counter Register

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
reserved1		DS.B 5		; unused

; Universal Serial Bus (USB) at 0x25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.USBPIDR			DS.B 1		; PID Register
.USBDMAR			DS.B 1		; DMA Address Register
.USBIDR			DS.B 1		; Interrupt/DMA Register
.USBISTR			DS.B 1		; Interrupt Status Register
.USBIMR			DS.B 1		; Interrupt Mask Register
.USBCTLR			DS.B 1		; Control Register
.USBDADDR			DS.B 1		; Device Address Register
.USBEP0RA			DS.B 1		; Endpoint 0 Register A
.USBEP0RB			DS.B 1		; Endpoint 0 Register B
.USBEP1RA			DS.B 1		; Endpoint 1 Register A
.USBEP1RB			DS.B 1		; Endpoint 1 Register B
.USBEP2RA			DS.B 1		; Endpoint 2 Register A
.USBEP2RB			DS.B 1		; Endpoint 2 Register B

; D/A Converter (DAC) with PWM outputs at 0x32
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWM1			DS.B 1		; Channel 1 PWM Register
.BRM21			DS.B 1		; Channel 2+1 BRM Register
.PWM2			DS.B 1		; Channel 2 PWM Register
.PWM3			DS.B 1		; Channel 3 PWM Register
.BRM43			DS.B 1		; Channel 4+3 BRM Register
.PWM4			DS.B 1		; Channel 4 PWM Register
.PWM5			DS.B 1		; Channel 5 PWM Register
.BRM65			DS.B 1		; Channel 5+6 BRM Register
.PWM6			DS.B 1		; Channel 6 PWM Register
.PWM7			DS.B 1		; Channel 7 PWM Register
.BRM87			DS.B 1		; Channel 7+8 BRM Register
.PWM8			DS.B 1		; Channel 8 PWM Register
.PWMCR			DS.B 1		; Output Enable Register
reserved2		DS.B 1		; unused

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
reserved3		DS.B 8		; unused

; DDC/CI Interface at 0x50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CR			DS.B 1		; DDC/CI Control Register
.SR1			DS.B 1		; DDC/CI Status Register 1
.SR2			DS.B 1		; DDC/CI Status Register 2
reserved4		DS.B 1		; unused
.OAR			DS.B 1		; DDC/CI (7 bits) Slave Address Register
reserved5		DS.B 1		; unused
.DR			DS.B 1		; DDC/CI Data Register
reserved6		DS.B 2		; unused

; I2C at 0x59
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2CDR			DS.B 1		; Data Register
reserved7		DS.B 2		; unused
.I2CCCR			DS.B 1		; Clock Control Register
.I2CSR2			DS.B 1		; Status Register 2
.I2CSR1			DS.B 1		; Status Register 1
.I2CCR			DS.B 1		; Control Register

	end
