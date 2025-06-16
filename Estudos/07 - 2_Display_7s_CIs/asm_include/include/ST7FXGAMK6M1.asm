st7/

; ST7FXGAMK6M1.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7FXGAMK6M1

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

; Interrupt Register at 0x0f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ITRFREC			DS.B 1		; Interrupt Register Port C
.ITRFRED			DS.B 1		; Interrupt Register Port D
.ITRFREE			DS.B 1		; Interrupt Register Port E

; Miscellaneous at 0x12
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR1			DS.B 1		; Miscellaneous Register 1
.MISCR2			DS.B 1		; Miscellaneous Register 2

; 10-Bit A/D Converter (ADC) at 0x14
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCDRH			DS.B 1		; ADC Data Register High
.ADCDRL			DS.B 1		; ADC Data Register Low
.ADCCSR			DS.B 1		; Control/Status Register

; WatchDog Timer at 0x17
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
reserved1		DS.B 1		; unused

; Serial Peripheral Interface (SPI) at 0x19
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPICSR			DS.B 1		; Control/Status Register

; Auto Reload Timer at 0x1c
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

; USB embedded function at 0x25
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
reserved2		DS.B 4		; unused

; Interrupt Software Priority (ITC) at 0x3e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Not used

; TimeBase Unit (TBU) at 0x42
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBUCV			DS.B 1		; TBU Counter Value Register
.TBUCSR			DS.B 1		; TBU Control/Status Register

; Flash at 0x44
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

	end
