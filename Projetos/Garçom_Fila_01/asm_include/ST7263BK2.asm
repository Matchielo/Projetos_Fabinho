st7/

; ST7263BK2.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST7263BK2

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
reserved1		DS.B 2		; unused

; Interrupt Register at 0x08
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ITRFRE			DS.B 1		; Interrupt Register

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
reserved2		DS.B 4		; unused

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

; Serial Communications Interface (SCI) at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SCISR			DS.B 1		; Status Register
.SCIDR			DS.B 1		; Data Register
.SCIBRR			DS.B 1		; Baud Rate Register
.SCICR1			DS.B 1		; Control Register 1
.SCICR2			DS.B 1		; Control Register 2

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
reserved3		DS.B 5		; unused

; Flash at 0x37
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

	end
