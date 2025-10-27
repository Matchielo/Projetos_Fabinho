st7/

; ST72652.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST72652

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
reserved1		DS.B 1		; unused

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
reserved2		DS.B 3		; unused

; WatchDog Timer at 0x14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
reserved3		DS.B 3		; unused

; Power Control Register at 0x18
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCR			DS.B 1		; Power Control Register
reserved4		DS.B 3		; unused

; Data Transfer Coprocessor (DTC) at 0x1c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.DTCCR			DS.B 1		; DTC Control Register
.DTCSR			DS.B 1		; DTC Status Register
reserved5		DS.B 1		; unused
.DTCPR			DS.B 1		; DTC Pointer Register

; 16-Bit Timer at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TCR1			DS.B 1		; Control Register 1
.TCR2			DS.B 1		; Control Register 2
.TSR			DS.B 1		; Status Register
.TCHR			DS.B 1		; Counter High Register
.TCLR			DS.B 1		; Counter Low Register
.TACHR			DS.B 1		; Alternate Counter High Register
.TACLR			DS.B 1		; Alternate Counter Low Register
.TOC1HR			DS.B 1		; Output Compare 1 High Register
.TOC1LR			DS.B 1		; Output Compare 1 Low Register
.TOC2HR			DS.B 1		; Output Compare 2 High Register
.TOC2LR			DS.B 1		; Output Compare 2 Low Register

; Flash at 0x2b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

; Interrupt Software Priority (ITC) at 0x2c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Not used

; Universal Serail Bus (USB) at 0x30
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.USBISTR			DS.B 1		; Interrupt Status Register
.USBIMR			DS.B 1		; Interrupt Mask Register
.USBCTLR			DS.B 1		; Control Register
.DADDR			DS.B 1		; Device Address Register
.USBSR			DS.B 1		; Status Register
.EP0R			DS.B 1		; Endpoint 0 Register
.CNT0RXR			DS.B 1		; Endpoint 0 Reception Counter Register
.CNT0TXR			DS.B 1		; Endpoint 0 Transmission Counter Register
.EP1RXR			DS.B 1		; Endpoint 1 Reception Register
.CNT1RXR			DS.B 1		; Endpoint 1 Reception Counter Register
.EP1TXR			DS.B 1		; Endpoint 1 Transmission Register
.CNT1TXR			DS.B 1		; Endpoint 1 Transmission Counter Register
.EP2RXR			DS.B 1		; Endpoint 2 Reception Register
.CNT2RXR			DS.B 1		; Endpoint 2 Reception Counter Register
.EP2TXR			DS.B 1		; Endpoint 2 Transmission Register
.CNT2TXR			DS.B 1		; Endpoint 2 Transmission Counter Register
reserved6		DS.B 7		; unused

; USB Buffer Control/Status Register at 0x47
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.BUFCSR			DS.B 1		; Buffer Control/Status Register
reserved7		DS.B 1		; unused

; Miscellaneous at 0x49
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR1			DS.B 1		; Miscellaneous1
.MISCR2			DS.B 1		; Miscellaneous2
reserved8		DS.B 1		; unused
.MISCR3			DS.B 1		; Miscellaneous3

	end
