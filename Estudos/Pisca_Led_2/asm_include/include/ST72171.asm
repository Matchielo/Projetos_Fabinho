st7/

; ST72171.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST72171

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
reserved3		DS.B 16		; unused

; Operational Amplifier at 0x1b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.OA1CR			DS.B 1		; OA1 Control Register
.OA2CR			DS.B 1		; OA2 Control Register
.OA3CR			DS.B 1		; OA3 Control Register
.OAIRR			DS.B 1		; Interrupt and Readout Register
.OAVRCR			DS.B 1		; Voltage Reference Control Register

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

; Clock,Reset,Supply Control/Status at 0x25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CRSR			DS.B 1		; Clock/Reset/Supply Control/Status Register
reserved4		DS.B 11		; unused

; 16-Bit Timer at 0x31
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
reserved5		DS.B 15		; unused

; Serial Communications Interface (SCI) at 0x50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SCISR			DS.B 1		; Status Register
.SCIDR			DS.B 1		; Data Register
.SCIBRR			DS.B 1		; Baud Rate Register
.SCICR1			DS.B 1		; Control Register 1
.SCICR2			DS.B 1		; Control Register 2
reserved6		DS.B 27		; unused

; 8-Bit A/D Converter (ADC) at 0x70
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCDR			DS.B 1		; Data Register
.ADCCSR			DS.B 1		; Control/Status Register
reserved7		DS.B 2		; unused

; 8-bit PWM Auto-Reload Timer (PWM ART) at 0x74
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWMDCR1			DS.B 1		; Duty Cycle Register 1
.PWMDCR0			DS.B 1		; Duty Cycle Register 0
.PWMCR			DS.B 1		; PWM Control Register
.ARTCSR			DS.B 1		; ART Control/Status Register
.ARTCAR			DS.B 1		; ART Counter Access Register
.ARTARR			DS.B 1		; ART Auto-Reload Register
.ARTICCSR			DS.B 1		; ART Input Capture Control/Status Register
.ARTICR1			DS.B 1		; ART Input Capture Register 1

	end
