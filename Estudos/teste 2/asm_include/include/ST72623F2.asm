st7/

; ST72623F2.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST72623F2

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
reserved1		DS.B 4		; unused

; Interrupt Register 1 at 0x08
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ITRFRE1			DS.B 1		; Interrupt Register 1

; Miscellaneous at 0x09
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISC			DS.B 1		; Miscellaneous Register

; 10 bit A/D Converter (ADC) at 0x0a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCDRMSB			DS.B 1		; Data Register bit[9:2]
.ADCDRLSB			DS.B 1		; Data Register bit[1:0]
.ADCCSR			DS.B 1		; Control/Status Register

; WatchDog Timer at 0x0d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
reserved2		DS.B 6		; unused

; PWM Auto-Reload Timer (PWM ART) at 0x14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWMDCR1			DS.B 1		; Duty Cycle Register 1
.PWMDCR0			DS.B 1		; Duty Cycle Register 0
.PWMCR			DS.B 1		; PWM Control Register
.ARTCSR			DS.B 1		; ART Control/Status Register
.ARTCAR			DS.B 1		; ART Counter Access Register
.ARTARR			DS.B 1		; ART Auto-Reload Register
.ARTICCSR			DS.B 1		; ART Input Capture Control/Status Register
.ARTICR1			DS.B 1		; ART Input Capture Register 1
.ARTICR2			DS.B 1		; ART Input Capture Register 2
reserved3		DS.B 8		; unused

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

; Interrupt Software Priority (ITC) at 0x32
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
reserved4		DS.B 1		; unused

; TimeBase Unit (TBU) at 0x36
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBUCV			DS.B 1		; TBU Counter Value Register
.TBUCSR			DS.B 1		; TBU Control/Status Register

; Flash at 0x38
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

; Interrupt Register 2 at 0x39
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ITRFRE2			DS.B 1		; Interrupt Register 2

	end
