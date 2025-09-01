st7/

; ST7255B.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST7255B

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Port A at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register
.PAOR			DS.B 1		; Option Register
reserved1		DS.B 29		; unused

; Miscellaneous at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR			DS.B 1		; Miscellaneous Register
reserved2		DS.B 9		; unused

; WatchDog Timer at 0x2a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
.WDGSR			DS.B 1		; Status Register
reserved3		DS.B 5		; unused

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
reserved4		DS.B 1		; unused

; 16-Bit Timer B at 0x41
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBCR2			DS.B 1		; Control Register 2
.TBCR1			DS.B 1		; Control Register 1
.TBSR			DS.B 1		; Status Register
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
reserved5		DS.B 10		; unused

; Controller Area Network (CAN) at 0x5a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CANISR			DS.B 1		; Interrupt Status Register
.CANICR			DS.B 1		; Interrupt Control Register
.CANCSR			DS.B 1		; Control/Status Register
.CANBRPR			DS.B 1		; Baud Rate Prescaler Register
.CANBTR			DS.B 1		; Bit Timing Register
.CANPSR			DS.B 1		; Page Selection Register
.CANPR0			DS.B 1		; Address 60h Paged Register see datasheet
.CANPR1			DS.B 1		; Address 61h Paged Register see datasheet
.CANPR2			DS.B 1		; Address 62h Paged Register see datasheet
.CANPR3			DS.B 1		; Address 63h Paged Register see datasheet
.CANPR4			DS.B 1		; Address 64h Paged Register see datasheet
.CANPR5			DS.B 1		; Address 65h Paged Register see datasheet
.CANPR6			DS.B 1		; Address 66h Paged Register see datasheet
.CANPR7			DS.B 1		; Address 67h Paged Register see datasheet
.CANPR8			DS.B 1		; Address 68h Paged Register see datasheet
.CANPR9			DS.B 1		; Address 69h Paged Register see datasheet
.CANPR10			DS.B 1		; Address 6Ah Paged Register see datasheet
.CANPR11			DS.B 1		; Address 6Bh Paged Register see datasheet
.CANPR12			DS.B 1		; Address 6Ch Paged Register see datasheet
.CANPR13			DS.B 1		; Address 6Dh Paged Register see datasheet
.CANPR14			DS.B 1		; Address 6Eh Paged Register see datasheet
.CANPR15			DS.B 1		; Address 6Fh Paged Register see datasheet

	end
