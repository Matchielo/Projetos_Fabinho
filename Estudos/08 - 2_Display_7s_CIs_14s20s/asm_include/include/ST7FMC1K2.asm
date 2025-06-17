st7/

; ST7FMC1K2.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7FMC1K2

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

; Port F at 0x0f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PFDR			DS.B 1		; Data Register
.PFDDR			DS.B 1		; Data Direction Register
.PFOR			DS.B 1		; Option Register
reserved1		DS.B 6		; unused

; Serial Communication Interface (LinSCI) at 0x18
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SCISR			DS.B 1		; Status Register
.SCIDR			DS.B 1		; Data Register
.SCIBRR			DS.B 1		; Baud Rate Register
gobackup1		DS.B {-1}		; go back up
.LPR			DS.B 1		; Lin Prescaler Register
.SCICR1			DS.B 1		; Control Register 1
.SCICR2			DS.B 1		; Control Register 2
.SCICR3			DS.B 1		; Control Register 3
.SCIERPR
.LHLR
				DS.B 1		; SCIERPR, LHLR - Extended Receive Prescaler Reg., Lin Header Length Register
.SCIETPR
.LPRF
				DS.B 1		; SCIETPR, LPRF - Extended Transmit Prescaler Reg., Lin Prescaler Fraction Register
reserved2		DS.B 4		; unused

; Interrupt Software Priority (ITC) at 0x24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Interrupt Software Priority Register 3
.EICR			DS.B 1		; External Interrupt Control Register

; Flash at 0x29
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

; Window Watchdog (WWDG) at 0x2a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
.WDGWR			DS.B 1		; Window Register

; Main Clock Controller (MCC) at 0x2c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MCCSR			DS.B 1		; Main Clock Control/Status Register
.MCCBCR			DS.B 1		; MCC Beep Control Register

; 10-Bit A/D Converter (ADC) at 0x2e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCCSR			DS.B 1		; Control/Status Register
.ADCDRH			DS.B 1		; Data High Register
.ADCDRL			DS.B 1		; Data low Register

; 16-Bit Timer A at 0x31
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TACR2			DS.B 1		; Control Register 2
.TACR1			DS.B 1		; Control Register 1
.TACSR			DS.B 1		; Control/Status Register
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

; System Integrity Control/Status Register (SICSR) at 0x40
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SICSR_page0			DS.B 1		; System Integrity Control/Status Register (page 0)
gobackup2		DS.B {-1}		; go back up
.SICSR_page1			DS.B 1		; System Integrity Control/Status Register (page 1)
reserved3		DS.B 15		; unused

; Motor Controller (MTC) at 0x50
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MTIM
.MDTG
				DS.B 1		; MTIM, MDTG - Timer Counter High Register, Dead Time Generator Register
.MTIML
.MPOL
				DS.B 1		; MTIML, MPOL - Timer Counter Low Register, Polarity Register
.MZPRV
.MPWME
				DS.B 1		; MZPRV, MPWME - Capture Zn-1 Register, PWM Register
.MZREG
.MCONF
				DS.B 1		; MZREG, MCONF - Capture Zn Register, Configuration Register
.MCOMP
.MPAR
				DS.B 1		; MCOMP, MPAR - Compare Cn+1 Register, Parity register
.MDREG
.MZRF
				DS.B 1		; MDREG, MZRF - Demagnetization Register, Z Event Filter Register
.MWGHT
.MSCR
				DS.B 1		; MWGHT, MSCR - An Weight Register, Sampling Clock Register
.MPRSR			DS.B 1		; Prescaler & Sampling Register
.MIMR			DS.B 1		; Interrupt Mask Register
.MISR			DS.B 1		; Interrupt Status Register
.MCRA			DS.B 1		; Control Register A
.MCRB			DS.B 1		; Control Register B
.MCRC			DS.B 1		; Control Register C
.MPHST			DS.B 1		; Phase State Register
.MDFR			DS.B 1		; D event Filter Register
.MCFR			DS.B 1		; Current feedback Filter Register
.MREF			DS.B 1		; Reference Register
.MPCR			DS.B 1		; PWM Control Register
.MREP			DS.B 1		; Repetition Counter Register
.MCPWH			DS.B 1		; Compare Phase W Preload Register High
.MCPWL			DS.B 1		; Compare Phase W Preload Register Low
.MCPVH			DS.B 1		; Compare Phase V Preload Register High
.MCPVL			DS.B 1		; Compare Phase V Preload Register Low
.MCPUH			DS.B 1		; Compare Phase U Preload Register High
.MCPUL			DS.B 1		; Compare Phase U Preload Register Low
.MCP0H			DS.B 1		; Compare Phase O Preload Register High
.MCP0L			DS.B 1		; Compare Phase O Preload Register Low
reserved4		DS.B 9		; unused

; Pwm Auto-Reload Timer (ART) at 0x74
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWMDCR3			DS.B 1		; Duty Cycle Register 3
.PWMDCR2			DS.B 1		; Duty Cycle Register 2
.PWMDCR1			DS.B 1		; Duty Cycle Register 1
.PWMDCR0			DS.B 1		; Duty Cycle Register 0
.PWMCR			DS.B 1		; PWM Control Register
.ARTCSR			DS.B 1		; ART Control/Status Register
.ARTCAR			DS.B 1		; ART Counter Access Register
.ARTARR			DS.B 1		; ART Auto-Reload Register
.ARTICCSR			DS.B 1		; ART Input Capture Control/Status Register
.ARTICR1			DS.B 1		; ART Input Capture Register 1
.ARTICR2			DS.B 1		; ART Input Capture Register 2

; Operational Amplifier (OA) at 0x7f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.OACSR			DS.B 1		; Control/Status Register

	end
