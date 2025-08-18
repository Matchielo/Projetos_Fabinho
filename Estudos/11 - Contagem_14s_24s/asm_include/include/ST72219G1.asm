st7/

; ST72219G1.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST72219G1

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Port C at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCDR			DS.B 1		; Data Register
.PCDDR			DS.B 1		; Data Direction Register
.PCOR			DS.B 1		; Option Register
reserved1		DS.B 1		; unused

; Port B at 0x04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PBDR			DS.B 1		; Data Register
.PBDDR			DS.B 1		; Data Direction Register
.PBOR			DS.B 1		; Option Register
reserved2		DS.B 1		; unused

; Port A at 0x08
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register
.PAOR			DS.B 1		; Option Register
reserved3		DS.B 21		; unused

; Miscellaneous at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR			DS.B 1		; Miscellaneous Register
reserved4		DS.B 3		; unused

; WatchDog Timer at 0x24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
reserved5		DS.B 12		; unused

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
reserved6		DS.B 48		; unused

; 8-Bit A/D Converter (ADC) at 0x70
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCDR			DS.B 1		; Data Register
.ADCCSR			DS.B 1		; Control/Status Register

	end
