st7/

; ST7267.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7267

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; USB High Speed (USBHS) at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWRR			DS.B 1		; Power Management Register
.FADDR			DS.B 1		; Function Address Register
reserved1		DS.B 1		; unused
.ITINR			DS.B 1		; Interrupt EP0 and IN EP Register
reserved2		DS.B 1		; unused
.ITOUTR			DS.B 1		; Interrupt OUT EP Register
reserved3		DS.B 1		; unused
.ITINER			DS.B 1		; Interrupt IN Enable Register
reserved4		DS.B 1		; unused
.ITOUTER			DS.B 1		; Interrupt OUT Enable Register
.ITUSBER			DS.B 1		; Interrupt USB Enable Register
.ITUSBR			DS.B 1		; Interrupt USB Register
.FRNBRM			DS.B 1		; Frame NumBer Register (MSB)
.FRNBRL			DS.B 1		; Frame NumBer Register (LSB)
.TSTMODE			DS.B 1		; Test Modes
.INDEXR			DS.B 1		; Index Register
.INMAXPRM			DS.B 1		; IN EP n Max Pkt size Register (MSB)
.INMAXPRL			DS.B 1		; IN EP n Max Pkt size Register (LSB)
.INCSRM			DS.B 1		; IN EP n Control Status Register (MSB)
.INCSRL			DS.B 1		; Control Status Reg for EP0 or IN EP n (LSB)
.OUTMAXPRM			DS.B 1		; OUT EP n Max Pkt size Register (MSB)
.OUTMAXPRL			DS.B 1		; OUT EP n Max Pkt size Register (LSB)
.OUTCSRM			DS.B 1		; OUT EP n Control Status Register (MSB)
.OUTCSRL			DS.B 1		; OUT EP n Control Status Register (LSB)
.OUTCNTRM			DS.B 1		; OUT EP n Count Register (MSB)
.OUTCNTRL			DS.B 1		; OUT EP n Count Register (LSB)
reserved5		DS.B 7		; unused
.EP0DR			DS.B 1		; Endpoint 0 Data Register
reserved6		DS.B 1		; unused
.EP1DR			DS.B 1		; Endpoint 1 Data Register
reserved7		DS.B 1		; unused
.EP2DR			DS.B 1		; Endpoint 2 Data Register

; Port A at 0x26
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register
.PAOR			DS.B 1		; Option Register

; Port B at 0x29
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PBDR			DS.B 1		; Data Register
.PBDDR			DS.B 1		; Data Direction Register
.PBOR			DS.B 1		; Option Register

; Port C at 0x2c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCDR			DS.B 1		; Data Register
.PCDDR			DS.B 1		; Data Direction Register
.PCOR			DS.B 1		; Option Register

; Port D at 0x2f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PDDR			DS.B 1		; Data Register
.PDDDR			DS.B 1		; Data Direction Register
.PDOR			DS.B 1		; Option Register

; Port E at 0x32
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PEDR			DS.B 1		; Data Register
.PEDDR			DS.B 1		; Data Direction Register
.PEOR			DS.B 1		; Option Register

; Watchdog Timer (WDG) at 0x35
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
reserved8		DS.B 1		; unused

; Interrupt Control (ITC) at 0x37
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Interrupt Software Priority Register 3
.EICR0			DS.B 1		; External Interrupt Control Register 0
.EICR1			DS.B 1		; External Interrupt Control Register 1
.PAEIENR			DS.B 1		; Port A External Interrupt Enable register
.PBEIENR			DS.B 1		; Port B External Interrupt Enable register
.PCEIENR			DS.B 1		; Port C External Interrupt Enable register
.PDEIENR			DS.B 1		; Port D External Interrupt Enable register
.PEEIENR			DS.B 1		; Port E External Interrupt Enable register
.PAEISR			DS.B 1		; Port A External Interrupt Status Register
.PBEISR			DS.B 1		; Port B External Interrupt Status Register
.PCEISR			DS.B 1		; Port C External Interrupt Status Register
.PDEISR			DS.B 1		; Port D External Interrupt Status Register
.PEEISR			DS.B 1		; Port E External Interrupt Status Register

; 16-Bit Timer (TIMER) at 0x47
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TCR2			DS.B 1		; Control Register 2
.TCR1			DS.B 1		; Control Register 1
.TCSR			DS.B 1		; Control Status Register
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

; Miscellaneous Register (MISC) at 0x56
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR1			DS.B 1		; Miscellaneous Register 1
reserved9		DS.B 1		; unused

; Timebase Unit (TBU) at 0x58
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TBUCVR			DS.B 1		; TBU Counter Value Register
.TBUCSR			DS.B 1		; TBU Control/Status Register
reserved10		DS.B 1		; unused

; Clock Generator (CKGEN) at 0x5b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CCMR			DS.B 1		; Clock Control Mode Register
.CELSPR			DS.B 1		; Clock Enable of Low Speed Peripherals Clk Register (CELSPCR)
.CEHSPR			DS.B 1		; Clock Enable of High Speed Peripherals Clk Register (CEHSPCR)
reserved11		DS.B 1		; unused

; End of suspend (EOS) at 0x5f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EOSSR			DS.B 1		; End of suspend Status Register
.EOSCR			DS.B 1		; End of suspend Control Register

; Serial Peripheral Interface (SPI) at 0x61
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPICSR			DS.B 1		; Control/Status Register
reserved12		DS.B 5		; unused

; Mass Storage Communication Interface (MSCI) at 0x69
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MCR			DS.B 1		; MSCI Control Register
.MSR			DS.B 1		; MSCI Status Register
.MPC			DS.B 2		; MSCI PC register
.MCRCM			DS.B 1		; CRC register (MSB)
.MCRCL			DS.B 1		; CRC register (LSB)

	WORDS		; following addresses are 16-bit length

	segment byte at 1900 'periph2'


; Mass Storage Communication Interface Debug (MSCI Debug) at 0x1900
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MBPA			DS.B 2		; MSCI BreaKpoint A register
.MBPB			DS.B 2		; MSCI BreaKpoint B register
.MDR			DS.B 1		; MSCI Debug Register
.MIPC			DS.B 2		; MSCI Internal PC register
.MISR			DS.B 1		; MSCI Internal Status Register
.ROM			DS.B 1		; Register R0 register (MSB)
.ROL			DS.B 1		; Register R0 register (LSB)
.R1M			DS.B 1		; Register R1 register (MSB)
.R1L			DS.B 1		; Register R1 register (LSB)
.R2M			DS.B 1		; Register R2 register (MSB)
.R2L			DS.B 1		; Register R2 register (LSB)
.R3M			DS.B 1		; Register R3 register (MSB)
.R3L			DS.B 1		; Register R3 register (LSB)
.DP0			DS.B 2		; Data memory Pointer 0 register
.DP1			DS.B 2		; Data memory Pointer 1 register
.DP2			DS.B 2		; Data memory Pointer 2 register
.DP3			DS.B 2		; Data memory Pointer 3 register
.P1DR0M			DS.B 1		; Port 1 Data Register Output (MSB)
.P1DR0L			DS.B 1		; Port 1 Data Register Output (LSB)
.P1DRIM			DS.B 1		; Port 1 Data Register Input (MSB)
.P1DRIL			DS.B 1		; Port 1 Data Register Input (LSB)
.P1DDRM			DS.B 1		; Port 2 Data Direction Register (MSB)
.P1DDRL			DS.B 1		; Port 2 Data Direction Register (LSB)
.P2DROM			DS.B 1		; Port 2 Data Register Output (MSB)
.P2DROL			DS.B 1		; Port 2 Data Register Output (LSB)
.P2DRIM			DS.B 1		; Port 2 Data Register Input (MSB)
.P2DRIL			DS.B 1		; Port 2 Data Register Input (LSB)
.P2DDRM			DS.B 1		; Port 2 Data Direction Register (MSB)
.P2DDRL			DS.B 1		; Port 2 Data Direction Register (LSB)
.VCR			DS.B 2		; VCI Control register
.VSR			DS.B 2		; VCI Status register
.VFDRM			DS.B 1		; VCI Fifo Data register (MSB)
.VFDRL			DS.B 1		; VCI Fifo Data register (LSB)
.VTAR			DS.B 2		; VCI Target Address Register
.PNDRM			DS.B 1		; Parallel IF Number of Data Register (MSB)
.PNDRL			DS.B 1		; Parallel IF Number of Data Register (LSB)
.PFDRM			DS.B 1		; Parallel IF Fifo Data Register (MSB)
.PFDRL			DS.B 1		; Parallel IF Fifo Data Register (LSB)
.PCR1M			DS.B 1		; Parallel IF Control Register 1 (MSB)
.PCR1L			DS.B 1		; Parallel IF Control Register 1 (LSB)
.PCR2M			DS.B 1		; Parallel interface Control Register 2 (MSB)
.PCR2L			DS.B 1		; Parallel interface Control Register 2 (LSB)
.PSRM			DS.B 1		; Parallel interface Status Register (MSB)
.PSRL			DS.B 1		; Parallel interface Status Register (LSB)
.ELP1M			DS.B 1		; ECC Line Parity 1 (MSB)
.ELP1L			DS.B 1		; ECC Line Parity 1 (LSB)
.ECP1M			DS.B 1		; ECC Column Parity 1 (MSB)
.ECP1L			DS.B 1		; ECC Column Parity 1 (LSB)
.ELP2M			DS.B 1		; ECC Line Parity 2 (MSB)
.ELP2L			DS.B 1		; ECC Line Parity 2 (LSB)
.ECP2M			DS.B 1		; ECC Column Parity 2 (MSB)
.ECP2L			DS.B 1		; ECC Column Parity 2 (LSB)
.RCSRM			DS.B 1		; Reed-Solomon Control Status Register (MSB)
.RCSRL			DS.B 1		; Reed-Solomon Control Status Register (LSB)
.RDFRM			DS.B 1		; Reed-Solomon Decoder FIFO Register (MSB)
.RDFRL			DS.B 1		; Reed-Solomon Decoder FIFO Register (LSB)
.REFRM			DS.B 1		; Reed-Solomon Encoder FIFO Register (MSB)
.REFRL			DS.B 1		; Reed-Solomon Encoder FIFO Register (LSB)

	end
