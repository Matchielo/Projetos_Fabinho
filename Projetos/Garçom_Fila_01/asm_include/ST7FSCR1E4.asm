st7/

; ST7FSCR1E4.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST7FSCR1E4

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Smart Card Controller at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CRDCR			DS.B 1		; Smartcard Interface Control
.CRDSR			DS.B 1		; Smartcard Interface Status
.CRDCCR			DS.B 1		; Smartcard Contact
.CRDETU1			DS.B 1		; Smartcard ETU1
.CRDETU0			DS.B 1		; Smartcard ETU0
.CRDGT1			DS.B 1		; Guard Time 1
.CRDGT0			DS.B 1		; Guard Time 0
.CRDWT2			DS.B 1		; Waiting Time 2
.CRDWT1			DS.B 1		; Waiting Time 1
.CRDWT0			DS.B 1		; Waiting Time 0
.CRDIER			DS.B 1		; Smartcard Interrupt enable
.CRDIPR			DS.B 1		; Smartcard Interrupt Pending
.CRDTXB			DS.B 1		; Smartcard Transmit Buffer
.CRDRXB			DS.B 1		; Smartcard Receive Buffer

; WatchDog Timer at 0x0e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
reserved1		DS.B 2		; unused

; Port A at 0x11
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register
.PAOR			DS.B 1		; Option Register
.PAPUCR			DS.B 1		; Pull Up Control Register

; Port B at 0x15
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PBDR			DS.B 1		; Data Register
.PBOR			DS.B 1		; Option Register
.PBPUCR			DS.B 1		; Pull Up Control Register

; Port C at 0x18
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCDR			DS.B 1		; Data Register

; Port D at 0x19
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PDDR			DS.B 1		; Data Register
.PDOR			DS.B 1		; Option Register
.PDPUCR			DS.B 1		; Pull Up Control Register

; Miscellaneous at 0x1c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR1			DS.B 1		; Miscellaneous Register 1
.MISCR2			DS.B 1		; Miscellaneous Register 2
.MISCR3			DS.B 1		; Miscellaneous Register 3
.MISCR4			DS.B 1		; Miscellaneous Register 4

; Universal Serail Bus (USB) at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.USBISTR			DS.B 1		; Interrupt Status Register
.USBIMR			DS.B 1		; Interrupt Mask Register
.USBCTLR			DS.B 1		; Control Register
.DADDR			DS.B 1		; Device Address Register
.USBSR			DS.B 1		; Status Register
.EP0R			DS.B 1		; Endpoint 0 Register
.CNT0RXR			DS.B 1		; Endpoint 0 Reception Counter Register
.CNT0TXR			DS.B 1		; Endpoint 0 Transmission Counter Register
.EP1TXR			DS.B 1		; Endpoint 1 Transmission Register
.CNT1TXR			DS.B 1		; Endpoint 1 Transmission Counter Register
.EP2RXR			DS.B 1		; Endpoint 2 Reception Register
.CNT2RXR			DS.B 1		; Endpoint 2 Reception Counter Register
.EP2TXR			DS.B 1		; Endpoint 2 Transmission Register
.CNT2TXR			DS.B 1		; Endpoint 2 Transmission Counter Register
.EP3TXR			DS.B 1		; Endpoint 3 Transmission Register
.CNT3TXR			DS.B 1		; Endpoint 3 Transmission Counter Register
.EP4TXR			DS.B 1		; Endpoint 4 Transmission Register
.CNT4TXR			DS.B 1		; Endpoint 4 Transmission Counter Register
.EP5TXR			DS.B 1		; Endpoint 5 Transmission Register
.CNT5TXR			DS.B 1		; Endpoint 5 Transmission Counter Register
.ERRSR			DS.B 1		; Error Status Register

; TimeBase Unit (TBU) at 0x35
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBUCV			DS.B 1		; Timer counter Value
.TBUCSR			DS.B 1		; Timer Control Status

; Interrupt Control (ITC) at 0x37
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Interrupt Software Priority Register 3

; Flash at 0x3b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register
reserved2		DS.B 2		; unused

; LED at 0x3e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.LED_CTRL			DS.B 1		; Led Control Register

	end
