st7/

; ST72260G1.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST72260G1

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
reserved3		DS.B 17		; unused

; Interrupt Software Priority (ITC) at 0x1c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Not used

; Miscellaneous 1 at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR1			DS.B 1		; Miscellaneous Register 1

; Serial Peripheral Interface (SPI) at 0x21
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPICSR			DS.B 1		; Control/Status Register

; WatchDog Timer at 0x24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register

; System Integrity Control/Status Register (SICSR) at 0x25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SICSR			DS.B 1		; System Integrity Control/Status Register

; Main Clock Control/Status Register (MCC) at 0x26
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MCCSR			DS.B 1		; Main Clock Control/Status Register
reserved4		DS.B 10		; unused

; 16-Bit Timer A at 0x31
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TACR2			DS.B 1		; Control Register 2
.TACR1			DS.B 1		; Control Register 1
.TACSR			DS.B 1		; Status Register
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

; 16-Bit Timer B at 0x41
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBCR2			DS.B 1		; Control Register 2
.TBCR1			DS.B 1		; Control Register 1
.TBCSR			DS.B 1		; Status Register
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
reserved5		DS.B 34		; unused

; Flash at 0x72
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

	end
