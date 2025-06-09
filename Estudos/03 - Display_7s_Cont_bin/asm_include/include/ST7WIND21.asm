st7/

; ST7WIND21.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7WIND21

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
reserved1		DS.B 12		; unused

; WatchDog Timer at 0x12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
.WDGCSR			DS.B 1		; Status Register
reserved2		DS.B 3		; unused

; Serial Peripheral Interface (SPI) at 0x17
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPISR			DS.B 1		; Status Register

; 16-Bit Timer at 0x1a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.T16CR2			DS.B 1		; Control Register 2
.T16CR1			DS.B 1		; Control Register 1
.T16CSR			DS.B 1		; Control/Status Register
.T16IC1HR			DS.B 1		; Input Capture 1 High Register
.T16IC1LR			DS.B 1		; Input Capture 1 Low Register
.TA16C1HR			DS.B 1		; Output Compare 1 High Register
.TA16C1LR			DS.B 1		; Output Compare 1 Low Register
.T16CHR			DS.B 1		; Counter High Register
.T16CLR			DS.B 1		; Counter Low Register
.T16ACHR			DS.B 1		; Alternate Counter High Register
.T16ACLR			DS.B 1		; Alternate Counter Low Register
.T16IC2HR			DS.B 1		; Input Capture 2 High Register
.T16IC2LR			DS.B 1		; Input Capture 2 Low Register
.T16OC2HR			DS.B 1		; Output Compare 2 High Register
.T16OC2LR			DS.B 1		; Output Compare 2 Low Register

; TimeBase Unit (TBU) at 0x29
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBUCV			DS.B 1		; TBU Counter Value Register
.TBUCSR			DS.B 1		; TBU Control/Status Register
reserved3		DS.B 1		; unused

; Clock Management at 0x2c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CMCR0			DS.B 1		; Clock Management Control Register 0
.CMCR1			DS.B 1		; Clock Management Control Register 1
.CMR			DS.B 1		; Clock Mode Register
reserved4		DS.B 1		; unused

; Interrupt Software Priority (ITC) at 0x30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
reserved5		DS.B 1		; unused
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Interrupt Software Priority Register 3
.EICR			DS.B 1		; External Interrupt Control Register
.PAEIENR			DS.B 1		; Port A External Interrupt Enable Register
.PBEIENR			DS.B 1		; Port B External Interrupt Enable Register
reserved6		DS.B 1		; unused
.PAEISR			DS.B 1		; Port A External Interrupt Status Register
.PBEISR			DS.B 1		; Port B External Interrupt Status Register
reserved7		DS.B 30		; unused
.PGEICR			DS.B 1		; Port G External Interrupt Control Register
.PGEIENR			DS.B 1		; Port G External Interrupt Enable Register
.PGEISR			DS.B 1		; Port G External Interrupt Status Register
gobackup1		DS.B {-32}		; go back up

; Auto Wake Up at 0x3b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AWUCSR			DS.B 1		; Auto Wake Up from HALT Control/Status Register
.AWUPR			DS.B 1		; Auto Wake Up from HALT prescaler Register

; USB  at 0x3d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.USBISTR			DS.B 1		; Interrupt Status Register
.USBIMR			DS.B 1		; Interrupt Mask Register
.USBCTLR			DS.B 1		; Control Register
.USBDADDR			DS.B 1		; Device Address Register
.USBSR0			DS.B 1		; Status Register
.USBSR1			DS.B 1		; Error Status Register
.USBEP0R			DS.B 1		; Endpoint 0 Register
.USBCNT0RXR			DS.B 1		; Endpoint 0 Reception Counter Register
.USBCNT0TXR			DS.B 1		; Endpoint 0 Transmission Counter Register
.USBEP1RXR			DS.B 1		; Endpoint 1 Reception Register
.USBCNT1RXR			DS.B 1		; Endpoint 1 Reception Counter Register
.USBEP1TXR			DS.B 1		; Endpoint 1 Transmission Register
.USBCNT1TXR			DS.B 1		; Endpoint 1 Transmission Counter Register
.USBEP2RXR			DS.B 1		; Endpoint 2 Reception Register
.USBCNT2RXR			DS.B 1		; Endpoint 2 Reception Counter Register
.USBEP2TXR			DS.B 1		; Endpoint 2 Transmission Register
.USBCNT2TXR			DS.B 1		; Endpoint 2 Transmission Counter Register

;  PS/2 interface 0 at 0x4e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PS2CR0			DS.B 1		; PS/2 Control register 0
.PS2CSR0			DS.B 1		; PS/2 Config/Status register 0
.PS2DR0			DS.B 1		; PS/2 Data register 0

;  PS/2 interface 1 at 0x51
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PS2CR1			DS.B 1		; PS/2 Control register 1
.PS2CSR1			DS.B 1		; PS/2 Config/Status register 1
.PS2DR1			DS.B 1		; PS/2 Data register 1

; Port G at 0x54
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PAGPUCR			DS.B 1		; Port A & G Pull-Up Control Rgister
.PGDR			DS.B 1		; Data Register
.PGDDR			DS.B 1		; Data Direction Register
.PGOR			DS.B 1		; Option Register
reserved8		DS.B 8		; unused

;  RF Interface  at 0x60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RFPAGER			DS.B 1		; RF Page Selection Register
.RFCSR
.RFREGCR0
.RX0CFHR
.RX1CFHR
				DS.B 1		; RFCSR, RFREGCR0, RX0CFHR, RX1CFHR - RFP Paged Register
.RX0CSR
.RFREGCR1
.RX0CFLR
.RX1CFLR
				DS.B 1		; RX0CSR, RFREGCR1, RX0CFLR, RX1CFLR - RFP Paged Register
.RX0RSSHR
.RFSYNR
.RX0OFFHR
.RX1OFFHR
				DS.B 1		; RX0RSSHR, RFSYNR, RX0OFFHR, RX1OFFHR - RFP Paged Register
.RX0RSSLR
.RX0OFFLR
.RX1OFFLR
				DS.B 1		; RX0RSSLR, RX0OFFLR, RX1OFFLR - RFP Paged Register
.RX1CSR			DS.B 1		; RFP Paged Register
.RX1RSSHR			DS.B 1		; RFP Paged Register
.RX1RSSLR
.RFTSWR
.RX0DRR
.RX1DRR
				DS.B 1		; RX1RSSLR, RFTSWR, RX0DRR, RX1DRR - RFP Paged Register
.RX0SLHR
.RX1SLHR
				DS.B 1		; RX0SLHR, RX1SLHR - RFP Paged Register
.RX0SLLR
.RX1SLLR
				DS.B 1		; RX0SLLR, RX1SLLR - RFP Paged Register

	end
