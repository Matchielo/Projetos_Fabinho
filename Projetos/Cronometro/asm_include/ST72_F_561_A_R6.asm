st7/

; ST72_F_561_A_R6.asm

; Copyright (c) 2003-2009 STMicroelectronics

; ST72(F)561(A)R6

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
reserved1		DS.B 15		; unused

; Serial Peripheral Interface (SPI) at 0x21
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPIDR			DS.B 1		; Data I/O Register
.SPICR			DS.B 1		; Control Register
.SPICSR			DS.B 1		; Control/Status Register

; Flash at 0x24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register

; Interrupt Software Priority (ITC) at 0x25
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ISPR0			DS.B 1		; Interrupt Software Priority Register 0
.ISPR1			DS.B 1		; Interrupt Software Priority Register 1
.ISPR2			DS.B 1		; Interrupt Software Priority Register 2
.ISPR3			DS.B 1		; Interrupt Software Priority Register 3
.EICR0			DS.B 1		; External Interrupt Control Register 0
.EICR1			DS.B 1		; External Interrupt Control Register 1

; Auto Wake-Up at 0x2b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AWUCSR			DS.B 1		; Control/Status Register
.AWUPR			DS.B 1		; Prescaler Register

; Main Clock Controller (MCC) at 0x2d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SICSR			DS.B 1		; System Integrity Control/Status Register
.MCCSR			DS.B 1		; Main Clock Control/Status Register

; Window Watchdog (WWDG) at 0x2f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register
.WDGWR			DS.B 1		; Window Register

; Pwm Auto-Reload Timer (ART) at 0x31
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

; 8-Bit Timer (TIM8) at 0x3c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.T8CR2			DS.B 1		; Control Register 2
.T8CR1			DS.B 1		; Control Register 1
.T8CSR			DS.B 1		; Control/Status Register
.T8IC1R			DS.B 1		; Input Capture 1 Register
.T8OC1R			DS.B 1		; Output Compare 1 Register
.T8CTR			DS.B 1		; Counter Register
.T8ACTR			DS.B 1		; Alternate Counter Register
.T8IC2R			DS.B 1		; Input Capture 2 Register
.T8OC2R			DS.B 1		; Output Compare 2 Register

; 10-Bit A/D Converter (ADC) at 0x45
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCCSR			DS.B 1		; Control/Status Register
.ADCDRH			DS.B 1		; Data High Register
.ADCDRL			DS.B 1		; Data low Register

; Serial Communication Interface (LinMasterSlave) at 0x48
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SCI1SR			DS.B 1		; Status Register
.SCI1DR			DS.B 1		; Data Register
.SCI1BRR			DS.B 1		; Baud Rate Register
.SCI1CR1			DS.B 1		; Control Register 1
.SCI1CR2			DS.B 1		; Control Register 2
.SCI1CR3			DS.B 1		; Control Register 3
.SCI1ERPR			DS.B 1		; Ext. Receive Prescaler Reg.
.SCI1ETPR			DS.B 1		; Ext. Transmit Prescaler Reg.
reserved2		DS.B 1		; unused

; 16-Bit Timer (TIM16) at 0x51
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.T16CR2			DS.B 1		; Control Register 2
.T16CR1			DS.B 1		; Control Register 1
.T16CSR			DS.B 1		; Control/Status Register
.T16IC1HR			DS.B 1		; Input Capture 1 High Register
.T16IC1LR			DS.B 1		; Input Capture 1 Low Register
.TA16C1HR			DS.B 1		; Output Compare 1 High Register
.TA16C1LR			DS.B 1		; Output Compare 1 Low Register
.T16CHR			DS.B 1		; Counter High Register
.T16CLR			DS.B 1		; Counter Low Register
.T16ACHR			DS.B 1		; Alternate Counter High Register
.T16ACLR			DS.B 1		; Alternate Counter Low Register
.T16IC2HR			DS.B 1		; Input Capture 2 High Register
.T16IC2LR			DS.B 1		; Input Capture 2 Low Register
.T16OC2HR			DS.B 1		; Output Compare 2 High Register
.T16OC2LR			DS.B 1		; Output Compare 2 Low Register

; Serial Communication Interface (LinMaster) at 0x60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SCI2SR			DS.B 1		; Status Register
.SCI2DR			DS.B 1		; Data Register
.SCI2BRR			DS.B 1		; Baud Rate Register
.SCI2CR1			DS.B 1		; Control Register 1
.SCI2CR2			DS.B 1		; Control Register 2
.SCI2CR3			DS.B 1		; Control Register 3
.SCI2ERPR			DS.B 1		; Ext. Receive Prescaler Reg.
.SCI2ETPR			DS.B 1		; Ext. Transmit Prescaler Reg.

; Controller Area Network (CAN) at 0x68
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CMCR			DS.B 1		; Master Control Register
.CMSR			DS.B 1		; Master Status Register
.CTSR			DS.B 1		; Transmit Status Register
.CTPR			DS.B 1		; Transmit Priority Register
.CRFR			DS.B 1		; Receive FIFO Register
.CIER			DS.B 1		; Interrupt Enable Register
.CDGR			DS.B 1		; Diagnosis Register
.CPSR			DS.B 1		; Filter Page Select Register
.MCSRTX0
.MCSRTX1
.CF0R0
.CF2R0
.CF4R0
.CESR
.MFMI
				DS.B 1		; MCSRTX0, MCSRTX1, CF0R0, CF2R0, CF4R0, CESR, MFMI - CAN Paged Register
.MDLCTX0
.MDLCTX1
.CF0R1
.CF2R1
.CF4R1
.CEIER
.MDLC
				DS.B 1		; MDLCTX0, MDLCTX1, CF0R1, CF2R1, CF4R1, CEIER, MDLC - CAN Paged Register
.MIDR0TX0
.MIDR0TX1
.CF0R2
.CF2R2
.CF4R2
.TECR
.MIDR0
				DS.B 1		; MIDR0TX0, MIDR0TX1, CF0R2, CF2R2, CF4R2, TECR, MIDR0 - CAN Paged Register
.MIDR1TX0
.MIDR1TX1
.CF0R3
.CF2R3
.CF4R3
.RECR
.MIDR1
				DS.B 1		; MIDR1TX0, MIDR1TX1, CF0R3, CF2R3, CF4R3, RECR, MIDR1 - CAN Paged Register
.MIDR2TX0
.MIDR2TX1
.CF0R4
.CF2R4
.CF4R4
.BTCR0_MIDR2
				DS.B 1		; MIDR2TX0, MIDR2TX1, CF0R4, CF2R4, CF4R4, BTCR0,MIDR2 - CAN Paged Register
.MIDR3TX0
.MIDR3TX1
.CF0R5
.CF2R5
.CF4R5
.BTCR1_MIDR3
				DS.B 1		; MIDR3TX0, MIDR3TX1, CF0R5, CF2R5, CF4R5, BTCR1,MIDR3 - CAN Paged Register
.MDAR0TX0
.MDAR0TX1
.CF0R6
.CF2R6
.CF4R6
.nu0
.MDAR0
				DS.B 1		; MDAR0TX0, MDAR0TX1, CF0R6, CF2R6, CF4R6, nu0, MDAR0 - CAN Paged Register
.MDAR1TX0
.MDAR1TX1
.CF0R7
.CF2R7
.CF4R7
.nu1
.MDAR1
				DS.B 1		; MDAR1TX0, MDAR1TX1, CF0R7, CF2R7, CF4R7, nu1, MDAR1 - CAN Paged Register
.MDAR2TX0
.MDAR2TX1
.CF1R0
.CF3R0
.CF5R0
.CFMR0
.MDAR2
				DS.B 1		; MDAR2TX0, MDAR2TX1, CF1R0, CF3R0, CF5R0, CFMR0, MDAR2 - CAN Paged Register
.MDAR3TX0
.MDAR3TX1
.CF1R1
.CF3R1
.CF5R1
.CFMR1
.MDAR3
				DS.B 1		; MDAR3TX0, MDAR3TX1, CF1R1, CF3R1, CF5R1, CFMR1, MDAR3 - CAN Paged Register
.MDAR4TX0
.MDAR4TX1
.CF1R2
.CF3R2
.CF5R2
.CFCR0
.MDAR4
				DS.B 1		; MDAR4TX0, MDAR4TX1, CF1R2, CF3R2, CF5R2, CFCR0, MDAR4 - CAN Paged Register
.MDAR5TX0
.MDAR5TX1
.CF1R3
.CF3R3
.CF5R3
.CFCR1
.MDAR5
				DS.B 1		; MDAR5TX0, MDAR5TX1, CF1R3, CF3R3, CF5R3, CFCR1, MDAR5 - CAN Paged Register
.MDAR6TX0
.MDAR6TX1
.CF1R4
.CF3R4
.CF5R4
.CFCR2
.MDAR6
				DS.B 1		; MDAR6TX0, MDAR6TX1, CF1R4, CF3R4, CF5R4, CFCR2, MDAR6 - CAN Paged Register
.MDAR7TX0
.MDAR7TX1
.CF1R5
.CF3R5
.CF5R5
.nu2
._MDAR7
				DS.B 1		; MDAR7TX0, MDAR7TX1, CF1R5, CF3R5, CF5R5, nu2,  MDAR7 - CAN Paged Register
.MTSLRTX0
.MTSLRTX1
.CF1R6
.CF3R6
.CF5R6
.nu3
._MTSLR
				DS.B 1		; MTSLRTX0, MTSLRTX1, CF1R6, CF3R6, CF5R6, nu3,  MTSLR - CAN Paged Register
.MTSHRTX0
.MTSHRTX1
.CF1R7
.CF3R7
.CF5R7
.nu4
._MTSHR
				DS.B 1		; MTSHRTX0, MTSHRTX1, CF1R7, CF3R7, CF5R7, nu4,  MTSHR - CAN Paged Register

	end
