; ST7267.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7267__
; do nothing
	#else
	#define __ST7267__ 1

; ST7267


; USB High Speed (USBHS)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PWRR.b		; Power Management Register
	#define PWRR_ESUSM	0		;Enable Suspend Mode
	#define PWRR_ESUSM_OR	$01
	#define PWRR_SUSM	1		;SUSM Suspend Mode (Read Only)
	#define PWRR_SUSM_OR	$02
	#define PWRR_RSM	2		;RSM Resume
	#define PWRR_RSM_OR	$04
	#define PWRR_RST	3		;RST Reset (Read Only)
	#define PWRR_RST_OR	$08
	#define PWRR_HSM	4		;HSM HS Mode (Read Only)
	#define PWRR_HSM_OR	$10
	#define PWRR_HSE	5		;HSE HS Enable
	#define PWRR_HSE_OR	$20
	#define PWRR_SCON	6		;SCON Soft Connect/Disconnect
	#define PWRR_SCON_OR	$40

	EXTERN FADDR.b		; Function Address Register
	#define FADDR_FAD0	0		;Function address
	#define FADDR_FAD0_OR	$01
	#define FADDR_FAD1	1		;Function address
	#define FADDR_FAD1_OR	$02
	#define FADDR_FAD2	2		;Function address
	#define FADDR_FAD2_OR	$04
	#define FADDR_FAD3	3		;Function address
	#define FADDR_FAD3_OR	$08
	#define FADDR_FAD4	4		;Function address
	#define FADDR_FAD4_OR	$10
	#define FADDR_FAD5	5		;Function address
	#define FADDR_FAD5_OR	$20
	#define FADDR_FAD6	6		;Function address
	#define FADDR_FAD6_OR	$40
	#define FADDR_FAD_OR	$7f
	#define FADDR_UPD	7		;Update (Read Only)
	#define FADDR_UPD_OR	$80

	EXTERN ITINR.b		; Interrupt EP0 and IN EP Register
	#define ITINR_EP0	0		;Endpoint 0 flag
	#define ITINR_EP0_OR	$01
	#define ITINR_EP1I	1		;Endpoint 1 IN flag
	#define ITINR_EP1I_OR	$02
	#define ITINR_EP2I	2		;Endpoint 2 IN flag
	#define ITINR_EP2I_OR	$04

	EXTERN ITOUTR.b		; Interrupt OUT EP Register
	#define ITOUTR_EP1O	1		;Endpoint 1 OUT
	#define ITOUTR_EP1O_OR	$02
	#define ITOUTR_EP2O	2		;Endpoint 2 OUT
	#define ITOUTR_EP2O_OR	$04

	EXTERN ITINER.b		; Interrupt IN Enable Register
	#define ITINER_EP0E	0		;Endpoint 0 Enable
	#define ITINER_EP0E_OR	$01
	#define ITINER_EP1IE	1		;Endpoint 1 IN Enable
	#define ITINER_EP1IE_OR	$02
	#define ITINER_EP2IE	2		;Endpoint 2 IN Enable
	#define ITINER_EP2IE_OR	$04

	EXTERN ITOUTER.b		; Interrupt OUT Enable Register
	#define ITOUTER_EP1OE	1		;Endpoint 1 OUT Enable
	#define ITOUTER_EP1OE_OR	$02
	#define ITOUTER_EP2OE	2		;Endpoint 2 OUT Enable
	#define ITOUTER_EP2OE_OR	$04

	EXTERN ITUSBER.b		; Interrupt USB Enable Register
	#define ITUSBER_SUSPE	0		;Suspend Enable
	#define ITUSBER_SUSPE_OR	$01
	#define ITUSBER_RSME	1		;Resume Enable
	#define ITUSBER_RSME_OR	$02
	#define ITUSBER_RSTE	2		;Reset Enable
	#define ITUSBER_RSTE_OR	$04
	#define ITUSBER_SOFE	3		;Start Of Frame Enable
	#define ITUSBER_SOFE_OR	$08

	EXTERN ITUSBR.b		; Interrupt USB Register
	#define ITUSBR_SUSP	0		;Suspend Interrupt
	#define ITUSBR_SUSP_OR	$01
	#define ITUSBR_RSM	1		;Resume Interrupt
	#define ITUSBR_RSM_OR	$02
	#define ITUSBR_RST	2		;RST Reset Interrupt
	#define ITUSBR_RST_OR	$04
	#define ITUSBR_SOF	3		;Start Of Frame Interrupt
	#define ITUSBR_SOF_OR	$08

	EXTERN FRNBRM.b		; Frame NumBer Register (MSB)

	EXTERN FRNBRL.b		; Frame NumBer Register (LSB)

	EXTERN TSTMODE.b		; Test Modes

	EXTERN INDEXR.b		; Index Register
	#define INDEXR_IND0	0		;Index Register
	#define INDEXR_IND0_OR	$01
	#define INDEXR_IND1	1		;Index Register
	#define INDEXR_IND1_OR	$02
	#define INDEXR_IND_OR	$03

	EXTERN INMAXPRM.b		; IN EP n Max Pkt size Register (MSB)

	EXTERN INMAXPRL.b		; IN EP n Max Pkt size Register (LSB)

	EXTERN INCSRM.b		; IN EP n Control Status Register (MSB)

	EXTERN INCSRL.b		; Control Status Reg for EP0 or IN EP n (LSB)

	EXTERN OUTMAXPRM.b		; OUT EP n Max Pkt size Register (MSB)

	EXTERN OUTMAXPRL.b		; OUT EP n Max Pkt size Register (LSB)

	EXTERN OUTCSRM.b		; OUT EP n Control Status Register (MSB)

	EXTERN OUTCSRL.b		; OUT EP n Control Status Register (LSB)

	EXTERN OUTCNTRM.b		; OUT EP n Count Register (MSB)

	EXTERN OUTCNTRL.b		; OUT EP n Count Register (LSB)

	EXTERN EP0DR.b		; Endpoint 0 Data Register

	EXTERN EP1DR.b		; Endpoint 1 Data Register

	EXTERN EP2DR.b		; Endpoint 2 Data Register

; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

	EXTERN PAOR.b		; Option Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBDDR.b		; Data Direction Register

	EXTERN PBOR.b		; Option Register

; Port C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PCDR.b		; Data Register

	EXTERN PCDDR.b		; Data Direction Register

	EXTERN PCOR.b		; Option Register

; Port D
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PDDR.b		; Data Register

	EXTERN PDDDR.b		; Data Direction Register

	EXTERN PDOR.b		; Option Register

; Port E
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PEDR.b		; Data Register

	EXTERN PEDDR.b		; Data Direction Register

	EXTERN PEOR.b		; Option Register

; Watchdog Timer (WDG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN WDGCR.b		; Control Register
	#define WDGCR_T0	0		;7-bit Timer
	#define WDGCR_T0_OR	$01
	#define WDGCR_T1	1		;7-bit Timer
	#define WDGCR_T1_OR	$02
	#define WDGCR_T2	2		;7-bit Timer
	#define WDGCR_T2_OR	$04
	#define WDGCR_T3	3		;7-bit Timer
	#define WDGCR_T3_OR	$08
	#define WDGCR_T4	4		;7-bit Timer
	#define WDGCR_T4_OR	$10
	#define WDGCR_T5	5		;7-bit Timer
	#define WDGCR_T5_OR	$20
	#define WDGCR_T6	6		;7-bit Timer
	#define WDGCR_T6_OR	$40
	#define WDGCR_T_OR	$7f
	#define WDGCR_WDGA	7		;Activation Bit
	#define WDGCR_WDGA_OR	$80

; Interrupt Control (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;NMI IT Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;NMI IT Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;USB2 IT Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;USB2 IT Priority Level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;EOS IT Priority Level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;EOS IT Priority Level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;MSCI IT Priority Level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;MSCI IT Priority Level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR1.b		; Interrupt Software Priority Register 1
	#define ISPR1_I0_4	0		;EI0 IT Priority Level
	#define ISPR1_I0_4_OR	$01
	#define ISPR1_I1_4	1		;EI0 IT Priority Level
	#define ISPR1_I1_4_OR	$02
	#define ISPR1_I_4_OR	$03
	#define ISPR1_I0_5	2		;EI1 IT Priority Level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;EI1 IT Priority Level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;EI2 IT Priority Level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;EI2 IT Priority Level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;EI3 IT Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;EI3 IT Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;EI4 IT Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;EI4 IT Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_9	2		;SPI IT Priority Level
	#define ISPR2_I0_9_OR	$04
	#define ISPR2_I1_9	3		;SPI IT Priority Level
	#define ISPR2_I1_9_OR	$08
	#define ISPR2_I_9_OR	$0c
	#define ISPR2_I0_10	4		;TIMER IT Priority Level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;TIMER IT Priority Level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30
	#define ISPR2_I0_11	6		;Not used
	#define ISPR2_I0_11_OR	$40
	#define ISPR2_I1_11	7		;Not used
	#define ISPR2_I1_11_OR	$80
	#define ISPR2_I_11_OR	$c0

	EXTERN ISPR3.b		; Interrupt Software Priority Register 3
	#define ISPR3_I0_12	0		;Not used
	#define ISPR3_I0_12_OR	$01
	#define ISPR3_I1_12	1		;Not used
	#define ISPR3_I1_12_OR	$02
	#define ISPR3_I_12_OR	$03
	#define ISPR3_I0_13	2		;Not used
	#define ISPR3_I0_13_OR	$04
	#define ISPR3_I1_13	3		;Not used
	#define ISPR3_I1_13_OR	$08
	#define ISPR3_I_13_OR	$0c

	EXTERN EICR0.b		; External Interrupt Control Register 0
	#define EICR0_ISA0	0		;Port A ei0 sensitivity IT[7-0]
	#define EICR0_ISA0_OR	$01
	#define EICR0_ISA1	1		;Port A ei0 sensitivity IT[7-0]
	#define EICR0_ISA1_OR	$02
	#define EICR0_ISA_OR	$03
	#define EICR0_ISB0	2		;Port B ei1 sensitivity IT[15-8]
	#define EICR0_ISB0_OR	$04
	#define EICR0_ISB1	3		;Port B ei1 sensitivity IT[15-8]
	#define EICR0_ISB1_OR	$08
	#define EICR0_ISB_OR	$0c
	#define EICR0_ISC0	4		;Port C ei2 sensitivity IT[23-15]
	#define EICR0_ISC0_OR	$10
	#define EICR0_ISC1	5		;Port C ei2 sensitivity IT[23-15]
	#define EICR0_ISC1_OR	$20
	#define EICR0_ISC_OR	$30
	#define EICR0_ISD0	6		;Port D ei3 sensitivity IT[31-23]
	#define EICR0_ISD0_OR	$40
	#define EICR0_ISD1	7		;Port D ei3 sensitivity IT[31-23]
	#define EICR0_ISD1_OR	$80
	#define EICR0_ISD_OR	$c0

	EXTERN EICR1.b		; External Interrupt Control Register 1
	#define EICR1_ISE0	0		;Port E ei4 sensitivity IT[38-32]
	#define EICR1_ISE0_OR	$01
	#define EICR1_ISE1	1		;Port E ei4 sensitivity IT[38-32]
	#define EICR1_ISE1_OR	$02
	#define EICR1_ISE_OR	$03

	EXTERN PAEIENR.b		; Port A External Interrupt Enable register
	#define PAEIENR_IT0E	0		;Port A interrupt 0 enable
	#define PAEIENR_IT0E_OR	$01
	#define PAEIENR_IT1E	1		;Port A interrupt 1 enable
	#define PAEIENR_IT1E_OR	$02
	#define PAEIENR_IT2E	2		;Port A interrupt 2 enable
	#define PAEIENR_IT2E_OR	$04
	#define PAEIENR_IT3E	3		;Port A interrupt 3 enable
	#define PAEIENR_IT3E_OR	$08
	#define PAEIENR_IT4E	4		;Port A interrupt 4 enable
	#define PAEIENR_IT4E_OR	$10
	#define PAEIENR_IT5E	5		;Port A interrupt 5 enable
	#define PAEIENR_IT5E_OR	$20
	#define PAEIENR_IT6E	6		;Port A interrupt 6 enable
	#define PAEIENR_IT6E_OR	$40
	#define PAEIENR_IT7E	7		;Port A interrupt 7 enable
	#define PAEIENR_IT7E_OR	$80

	EXTERN PBEIENR.b		; Port B External Interrupt Enable register
	#define PBEIENR_IT8E	0		;Port B interrupt 8 enable
	#define PBEIENR_IT8E_OR	$01
	#define PBEIENR_IT9E	1		;Port B interrupt 9 enable
	#define PBEIENR_IT9E_OR	$02
	#define PBEIENR_IT10E	2		;Port B interrupt 10 enable
	#define PBEIENR_IT10E_OR	$04
	#define PBEIENR_IT11E	3		;Port B interrupt 11 enable
	#define PBEIENR_IT11E_OR	$08
	#define PBEIENR_IT12E	4		;Port B interrupt 12 enable
	#define PBEIENR_IT12E_OR	$10
	#define PBEIENR_IT13E	5		;Reserved must be kept cleared
	#define PBEIENR_IT13E_OR	$20
	#define PBEIENR_IT14E	6		;Reserved must be kept cleared
	#define PBEIENR_IT14E_OR	$40
	#define PBEIENR_IT15E	7		;Reserved must be kept cleared
	#define PBEIENR_IT15E_OR	$80

	EXTERN PCEIENR.b		; Port C External Interrupt Enable register
	#define PCEIENR_IT16E	0		;Port C interrupt 16 enable
	#define PCEIENR_IT16E_OR	$01
	#define PCEIENR_IT17E	1		;Port C interrupt 17 enable
	#define PCEIENR_IT17E_OR	$02
	#define PCEIENR_IT18E	2		;Port C interrupt 18 enable
	#define PCEIENR_IT18E_OR	$04
	#define PCEIENR_IT19E	3		;Port C interrupt 19 enable
	#define PCEIENR_IT19E_OR	$08
	#define PCEIENR_IT20E	4		;Port C interrupt 20 enable
	#define PCEIENR_IT20E_OR	$10
	#define PCEIENR_IT21E	5		;Port C interrupt 21 enable
	#define PCEIENR_IT21E_OR	$20
	#define PCEIENR_IT22E	6		;Port C interrupt 22 enable
	#define PCEIENR_IT22E_OR	$40
	#define PCEIENR_IT23E	7		;Port C interrupt 23 enable
	#define PCEIENR_IT23E_OR	$80

	EXTERN PDEIENR.b		; Port D External Interrupt Enable register
	#define PDEIENR_IT24E	0		;Port D interrupt 24 enable
	#define PDEIENR_IT24E_OR	$01
	#define PDEIENR_IT25E	1		;Port D interrupt 25 enable
	#define PDEIENR_IT25E_OR	$02
	#define PDEIENR_IT26E	2		;Port D interrupt 26 enable
	#define PDEIENR_IT26E_OR	$04
	#define PDEIENR_IT27E	3		;Port D interrupt 27 enable
	#define PDEIENR_IT27E_OR	$08
	#define PDEIENR_IT28E	4		;Port D interrupt 28 enable
	#define PDEIENR_IT28E_OR	$10
	#define PDEIENR_IT29E	5		;Port D interrupt 29 enable
	#define PDEIENR_IT29E_OR	$20
	#define PDEIENR_IT30E	6		;Port D interrupt 30 enable
	#define PDEIENR_IT30E_OR	$40
	#define PDEIENR_IT31E	7		;Port D interrupt 31 enable
	#define PDEIENR_IT31E_OR	$80

	EXTERN PEEIENR.b		; Port E External Interrupt Enable register
	#define PEEIENR_IT32E	0		;Port E interrupt 32 enable
	#define PEEIENR_IT32E_OR	$01
	#define PEEIENR_IT33E	1		;Port E interrupt 33 enable
	#define PEEIENR_IT33E_OR	$02
	#define PEEIENR_IT34E	2		;Port E interrupt 34 enable
	#define PEEIENR_IT34E_OR	$04
	#define PEEIENR_IT35E	3		;Port E interrupt 35 enable
	#define PEEIENR_IT35E_OR	$08
	#define PEEIENR_IT36E	4		;Port E interrupt 36 enable
	#define PEEIENR_IT36E_OR	$10
	#define PEEIENR_IT37E	5		;Port E interrupt 37 enable
	#define PEEIENR_IT37E_OR	$20
	#define PEEIENR_IT38E	6		;Port E interrupt 38 enable
	#define PEEIENR_IT38E_OR	$40

	EXTERN PAEISR.b		; Port A External Interrupt Status Register
	#define PAEISR_IT0R	0		;Port A IT0 external interrupt
	#define PAEISR_IT0R_OR	$01
	#define PAEISR_IT1R	1		;Port A IT1 external interrupt
	#define PAEISR_IT1R_OR	$02
	#define PAEISR_IT2R	2		;Port A IT2 external interrupt
	#define PAEISR_IT2R_OR	$04
	#define PAEISR_IT3R	3		;Port A IT3 external interrupt
	#define PAEISR_IT3R_OR	$08
	#define PAEISR_IT4R	4		;Port A IT4 external interrupt
	#define PAEISR_IT4R_OR	$10
	#define PAEISR_IT5R	5		;Port A IT5 external interrupt
	#define PAEISR_IT5R_OR	$20
	#define PAEISR_IT6R	6		;Port A IT6 external interrupt
	#define PAEISR_IT6R_OR	$40
	#define PAEISR_IT7R	7		;Port A IT7 external interrupt
	#define PAEISR_IT7R_OR	$80

	EXTERN PBEISR.b		; Port B External Interrupt Status Register
	#define PBEISR_IT8R	0		;Port B IT8 external interrupt
	#define PBEISR_IT8R_OR	$01
	#define PBEISR_IT9R	1		;Port B IT9 external interrupt
	#define PBEISR_IT9R_OR	$02
	#define PBEISR_IT10R	2		;Port B IT10 external interrupt
	#define PBEISR_IT10R_OR	$04
	#define PBEISR_IT11R	3		;Port B IT11 external interrupt
	#define PBEISR_IT11R_OR	$08
	#define PBEISR_IT12R	4		;Port B IT12 external interrupt
	#define PBEISR_IT12R_OR	$10
	#define PBEISR_IT13R	5		;Reserved must be kept cleared
	#define PBEISR_IT13R_OR	$20
	#define PBEISR_IT14R	6		;Reserved must be kept cleared
	#define PBEISR_IT14R_OR	$40
	#define PBEISR_IT15R	7		;Reserved must be kept cleared
	#define PBEISR_IT15R_OR	$80

	EXTERN PCEISR.b		; Port C External Interrupt Status Register
	#define PCEISR_IT16R	0		;Port C IT16 external interrupt
	#define PCEISR_IT16R_OR	$01
	#define PCEISR_IT17R	1		;Port C IT17 external interrupt
	#define PCEISR_IT17R_OR	$02
	#define PCEISR_IT18R	2		;Port C IT18 external interrupt
	#define PCEISR_IT18R_OR	$04
	#define PCEISR_IT19R	3		;Port C IT19 external interrupt
	#define PCEISR_IT19R_OR	$08
	#define PCEISR_IT20R	4		;Port C IT20 external interrupt
	#define PCEISR_IT20R_OR	$10
	#define PCEISR_IT21R	5		;Port C IT21 external interrupt
	#define PCEISR_IT21R_OR	$20
	#define PCEISR_IT22R	6		;Port C IT22 external interrupt
	#define PCEISR_IT22R_OR	$40
	#define PCEISR_IT23R	7		;Port C IT23 external interrupt
	#define PCEISR_IT23R_OR	$80

	EXTERN PDEISR.b		; Port D External Interrupt Status Register
	#define PDEISR_IT24R	0		;Port D IT24 external interrupt
	#define PDEISR_IT24R_OR	$01
	#define PDEISR_IT25R	1		;Port D IT25 external interrupt
	#define PDEISR_IT25R_OR	$02
	#define PDEISR_IT26R	2		;Port D IT26 external interrupt
	#define PDEISR_IT26R_OR	$04
	#define PDEISR_IT27R	3		;Port D IT27 external interrupt
	#define PDEISR_IT27R_OR	$08
	#define PDEISR_IT28R	4		;Port D IT28 external interrupt
	#define PDEISR_IT28R_OR	$10
	#define PDEISR_IT29R	5		;Port D IT29 external interrupt
	#define PDEISR_IT29R_OR	$20
	#define PDEISR_IT30R	6		;Port D IT30 external interrupt
	#define PDEISR_IT30R_OR	$40
	#define PDEISR_IT31R	7		;Port D IT31 external interrupt
	#define PDEISR_IT31R_OR	$80

	EXTERN PEEISR.b		; Port E External Interrupt Status Register
	#define PEEISR_IT32R	0		;Port E IT32 external interrupt
	#define PEEISR_IT32R_OR	$01
	#define PEEISR_IT33R	1		;Port E IT33 external interrupt
	#define PEEISR_IT33R_OR	$02
	#define PEEISR_IT34R	2		;Port E IT34 external interrupt
	#define PEEISR_IT34R_OR	$04
	#define PEEISR_IT35R	3		;Port E IT35 external interrupt
	#define PEEISR_IT35R_OR	$08
	#define PEEISR_IT36R	4		;Port E IT36 external interrupt
	#define PEEISR_IT36R_OR	$10
	#define PEEISR_IT37R	5		;Port E IT37 external interrupt
	#define PEEISR_IT37R_OR	$20
	#define PEEISR_IT38R	6		;Port E IT38 external interrupt
	#define PEEISR_IT38R_OR	$40

; 16-Bit Timer (TIMER)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TCR2.b		; Control Register 2
	#define TCR2_EXEDG	0		;External Clock Edge
	#define TCR2_EXEDG_OR	$01
	#define TCR2_IEDG2	1		;Input Edge 2
	#define TCR2_IEDG2_OR	$02
	#define TCR2_CC0	2		;Clock Control
	#define TCR2_CC0_OR	$04
	#define TCR2_CC1	3		;Clock Control
	#define TCR2_CC1_OR	$08
	#define TCR2_CC_OR	$0c
	#define TCR2_PWM	4		;Pulse Width Modulation
	#define TCR2_PWM_OR	$10
	#define TCR2_OPM	5		;One Pulse Mode
	#define TCR2_OPM_OR	$20
	#define TCR2_OC2E	6		;Output Compare 2 Output Pin
	#define TCR2_OC2E_OR	$40
	#define TCR2_OC1E	7		;Output Compare 1 Output Pin
	#define TCR2_OC1E_OR	$80

	EXTERN TCR1.b		; Control Register 1
	#define TCR1_OLVL1	0		;Output Level 1
	#define TCR1_OLVL1_OR	$01
	#define TCR1_IEDG1	1		;Input Edge 1
	#define TCR1_IEDG1_OR	$02
	#define TCR1_OLVL2	2		;Output Level 2
	#define TCR1_OLVL2_OR	$04
	#define TCR1_FOLV1	3		;Forced Output Compare 1
	#define TCR1_FOLV1_OR	$08
	#define TCR1_FOLV2	4		;Forced Output Compare 2
	#define TCR1_FOLV2_OR	$10
	#define TCR1_TOIE	5		;Timer Overflow Interrupt
	#define TCR1_TOIE_OR	$20
	#define TCR1_OCIE	6		;Output Compare Interrupt
	#define TCR1_OCIE_OR	$40
	#define TCR1_ICIE	7		;Input Capture Interrupt
	#define TCR1_ICIE_OR	$80

	EXTERN TCSR.b		; Control Status Register
	#define TCSR_TIMD	2		;Timer Disable
	#define TCSR_TIMD_OR	$04
	#define TCSR_OCF2	3		;Output Compare Flag 2
	#define TCSR_OCF2_OR	$08
	#define TCSR_ICF2	4		;Input Capture Flag 2
	#define TCSR_ICF2_OR	$10
	#define TCSR_TOF	5		;Timer Overflow
	#define TCSR_TOF_OR	$20
	#define TCSR_OCF1	6		;Output Compare Flag 1
	#define TCSR_OCF1_OR	$40
	#define TCSR_ICF1	7		;Input Capture Flag 1
	#define TCSR_ICF1_OR	$80

	EXTERN TIC1HR.b		; Input Capture 1 High Register

	EXTERN TIC1LR.b		; Input Capture 1 Low Register

	EXTERN TOC1HR.b		; Output Compare 1 High Register

	EXTERN TOC1LR.b		; Output Compare 1 Low Register

	EXTERN TCHR.b		; Counter High Register

	EXTERN TCLR.b		; Counter Low Register

	EXTERN TACHR.b		; Alternate Counter High Register

	EXTERN TACLR.b		; Alternate Counter Low Register

	EXTERN TIC2HR.b		; Input Capture 2 High Register

	EXTERN TIC2LR.b		; Input Capture 2 Low Register

	EXTERN TOC2HR.b		; Output Compare 2 High Register

	EXTERN TOC2LR.b		; Output Compare 2 Low Register

; Miscellaneous Register (MISC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR1.b		; Miscellaneous Register 1

; Timebase Unit (TBU)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TBUCVR.b		; TBU Counter Value Register
	#define TBUCVR_CV0	0		;Counter Value
	#define TBUCVR_CV0_OR	$01
	#define TBUCVR_CV1	1		;Counter Value
	#define TBUCVR_CV1_OR	$02
	#define TBUCVR_CV2	2		;Counter Value
	#define TBUCVR_CV2_OR	$04
	#define TBUCVR_CV3	3		;Counter Value
	#define TBUCVR_CV3_OR	$08
	#define TBUCVR_CV4	4		;Counter Value
	#define TBUCVR_CV4_OR	$10
	#define TBUCVR_CV5	5		;Counter Value
	#define TBUCVR_CV5_OR	$20
	#define TBUCVR_CV6	6		;Counter Value
	#define TBUCVR_CV6_OR	$40
	#define TBUCVR_CV7	7		;Counter Value
	#define TBUCVR_CV7_OR	$80
	#define TBUCVR_CV_OR	$ff

	EXTERN TBUCSR.b		; TBU Control/Status Register
	#define TBUCSR_PR0	0		;Prescaler Selection
	#define TBUCSR_PR0_OR	$01
	#define TBUCSR_PR1	1		;Prescaler Selection
	#define TBUCSR_PR1_OR	$02
	#define TBUCSR_PR2	2		;Prescaler Selection
	#define TBUCSR_PR2_OR	$04
	#define TBUCSR_PR_OR	$07
	#define TBUCSR_TCEN	3		;TBU Enable
	#define TBUCSR_TCEN_OR	$08
	#define TBUCSR_ITE	4		;Interrupt enabled
	#define TBUCSR_ITE_OR	$10
	#define TBUCSR_OVF	5		;Overflow Flag
	#define TBUCSR_OVF_OR	$20

; Clock Generator (CKGEN)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CCMR.b		; Clock Control Mode Register
	#define CCMR_FRQ	0		;CPU clock frequency
	#define CCMR_FRQ_OR	$01
	#define CCMR_MODE	1		;Run mode
	#define CCMR_MODE_OR	$02
	#define CCMR_LOCK	2		;PLL lock
	#define CCMR_LOCK_OR	$04
	#define CCMR_REGOFF	7		;Regulator mode in halt
	#define CCMR_REGOFF_OR	$80

	EXTERN CELSPR.b		; Clock Enable of Low Speed Peripherals Clk Register (CELSPCR)
	#define CELSPR_ICD	0		;ICD clock enable
	#define CELSPR_ICD_OR	$01
	#define CELSPR_TIM	1		;Timer clock enable
	#define CELSPR_TIM_OR	$02
	#define CELSPR_WDG	2		;WDG clock enable
	#define CELSPR_WDG_OR	$04
	#define CELSPR_SPI	3		;SPI clock enable
	#define CELSPR_SPI_OR	$08
	#define CELSPR_TBU	4		;TBU clock enable
	#define CELSPR_TBU_OR	$10

	EXTERN CEHSPR.b		; Clock Enable of High Speed Peripherals Clk Register (CEHSPCR)
	#define CEHSPR_MSCI	0		;MSCI clock enable
	#define CEHSPR_MSCI_OR	$01
	#define CEHSPR_ENC	1		;Encoder clock enable
	#define CEHSPR_ENC_OR	$02
	#define CEHSPR_DEC	2		;Decoder clock enable
	#define CEHSPR_DEC_OR	$04
	#define CEHSPR_USB	3		;USB clock enable
	#define CEHSPR_USB_OR	$08

; End of suspend (EOS)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN EOSSR.b		; End of suspend Status Register
	#define EOSSR_EOS	0		;End Of Suspend
	#define EOSSR_EOS_OR	$01
	#define EOSSR_LS0	6		;LS0 Line State 0 flag
	#define EOSSR_LS0_OR	$40
	#define EOSSR_LS1	7		;LS1 Line State 1 flag
	#define EOSSR_LS1_OR	$80

	EXTERN EOSCR.b		; End of suspend Control Register
	#define EOSCR_EOSE	0		;End Of Suspend
	#define EOSCR_EOSE_OR	$01
	#define EOSCR_CPO	1		;Compensation Cell Off
	#define EOSCR_CPO_OR	$02
	#define EOSCR_UPO	2		;USB2 Phy Off
	#define EOSCR_UPO_OR	$04
	#define EOSCR_LSE	7		;Line State Enable
	#define EOSCR_LSE_OR	$80

; Serial Peripheral Interface (SPI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SPIDR.b		; Data I/O Register

	EXTERN SPICR.b		; Control Register
	#define SPICR_SPR0	0		;Baud Rate
	#define SPICR_SPR0_OR	$01
	#define SPICR_SPR1	1		;Baud Rate
	#define SPICR_SPR1_OR	$02
	#define SPICR_SPR2	5		;Baud Rate
	#define SPICR_SPR2_OR	$20
	#define SPICR_SPR_OR	$23
	#define SPICR_CPHA	2		;Clock Phase
	#define SPICR_CPHA_OR	$04
	#define SPICR_CPOL	3		;Clock Polarity
	#define SPICR_CPOL_OR	$08
	#define SPICR_MSTR	4		;Master Bit
	#define SPICR_MSTR_OR	$10
	#define SPICR_SPE	6		;Serial Peripheral Output
	#define SPICR_SPE_OR	$40
	#define SPICR_SPIE	7		;Serial Peripheral Interrupt
	#define SPICR_SPIE_OR	$80

	EXTERN SPICSR.b		; Control/Status Register
	#define SPICSR_SSI	0		;SS Internal Mode
	#define SPICSR_SSI_OR	$01
	#define SPICSR_SSM	1		;SS Management
	#define SPICSR_SSM_OR	$02
	#define SPICSR_SOD	2		;SPI Output Disable
	#define SPICSR_SOD_OR	$04
	#define SPICSR_MODF	4		;Mode Fault Flag
	#define SPICSR_MODF_OR	$10
	#define SPICSR_OVR	5		;SPI Overrun error
	#define SPICSR_OVR_OR	$20
	#define SPICSR_WCOL	6		;Write Collision Status
	#define SPICSR_WCOL_OR	$40
	#define SPICSR_SPIF	7		;Data Transfer Flag
	#define SPICSR_SPIF_OR	$80

; Mass Storage Communication Interface (MSCI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MCR.b		; MSCI Control Register
	#define MCR_SFTR	0		;Soft Reset
	#define MCR_SFTR_OR	$01
	#define MCR_PCR	1		;Program Counter Reset
	#define MCR_PCR_OR	$02
	#define MCR_RAMLD	2		;RAM Load
	#define MCR_RAMLD_OR	$04
	#define MCR_GO	3		;Go
	#define MCR_GO_OR	$08
	#define MCR_STPIE	4		;Stop Interrupt Enable
	#define MCR_STPIE_OR	$10
	#define MCR_ITRIE	5		;ITR Interrupt Enable
	#define MCR_ITRIE_OR	$20

	EXTERN MSR.b		; MSCI Status Register
	#define MSR_CSTP	0		;Clear Stop flag
	#define MSR_CSTP_OR	$01
	#define MSR_CITR	1		;Clear ITR flag
	#define MSR_CITR_OR	$02
	#define MSR_STP	4		;MSCI CORE Stop flag
	#define MSR_STP_OR	$10
	#define MSR_ITR	5		;MSCI CORE ITR flag
	#define MSR_ITR_OR	$20

	EXTERN MPC.b		; MSCI PC register
	#define MPC_MPCM8	8		;PC register (MSB)
	#define MPC_MPCM8_OR	$100
	#define MPC_MPCM9	9		;PC register (MSB)
	#define MPC_MPCM9_OR	$200
	#define MPC_MPCM10	10		;PC register (MSB)
	#define MPC_MPCM10_OR	$400
	#define MPC_MPCM_OR	$700
	#define MPC_MPCL0	0		;PC register (LSB)
	#define MPC_MPCL0_OR	$01
	#define MPC_MPCL1	1		;PC register (LSB)
	#define MPC_MPCL1_OR	$02
	#define MPC_MPCL2	2		;PC register (LSB)
	#define MPC_MPCL2_OR	$04
	#define MPC_MPCL3	3		;PC register (LSB)
	#define MPC_MPCL3_OR	$08
	#define MPC_MPCL4	4		;PC register (LSB)
	#define MPC_MPCL4_OR	$10
	#define MPC_MPCL5	5		;PC register (LSB)
	#define MPC_MPCL5_OR	$20
	#define MPC_MPCL6	6		;PC register (LSB)
	#define MPC_MPCL6_OR	$40
	#define MPC_MPCL7	7		;PC register (LSB)
	#define MPC_MPCL7_OR	$80
	#define MPC_MPCL_OR	$ff

	EXTERN MCRCM.b		; CRC register (MSB)

	EXTERN MCRCL.b		; CRC register (LSB)

; Mass Storage Communication Interface Debug (MSCI Debug)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MBPA.w		; MSCI BreaKpoint A register
	#define MBPA_MBPAM8	8		;MSCI BreaKpoint A register (MSB)
	#define MBPA_MBPAM8_OR	$100
	#define MBPA_MBPAM9	9		;MSCI BreaKpoint A register (MSB)
	#define MBPA_MBPAM9_OR	$200
	#define MBPA_MBPAM10	10		;MSCI BreaKpoint A register (MSB)
	#define MBPA_MBPAM10_OR	$400
	#define MBPA_MBPAM_OR	$700
	#define MBPA_MBPAL0	0		;MSCI BreaKpoint A register (LSB)
	#define MBPA_MBPAL0_OR	$01
	#define MBPA_MBPAL1	1		;MSCI BreaKpoint A register (LSB)
	#define MBPA_MBPAL1_OR	$02
	#define MBPA_MBPAL2	2		;MSCI BreaKpoint A register (LSB)
	#define MBPA_MBPAL2_OR	$04
	#define MBPA_MBPAL3	3		;MSCI BreaKpoint A register (LSB)
	#define MBPA_MBPAL3_OR	$08
	#define MBPA_MBPAL4	4		;MSCI BreaKpoint A register (LSB)
	#define MBPA_MBPAL4_OR	$10
	#define MBPA_MBPAL5	5		;MSCI BreaKpoint A register (LSB)
	#define MBPA_MBPAL5_OR	$20
	#define MBPA_MBPAL6	6		;MSCI BreaKpoint A register (LSB)
	#define MBPA_MBPAL6_OR	$40
	#define MBPA_MBPAL7	7		;MSCI BreaKpoint A register (LSB)
	#define MBPA_MBPAL7_OR	$80
	#define MBPA_MBPAL_OR	$ff

	EXTERN MBPB.w		; MSCI BreaKpoint B register
	#define MBPB_MBPBM8	8		;MSCI BreaKpoint B register (MSB)
	#define MBPB_MBPBM8_OR	$100
	#define MBPB_MBPBM9	9		;MSCI BreaKpoint B register (MSB)
	#define MBPB_MBPBM9_OR	$200
	#define MBPB_MBPBM10	10		;MSCI BreaKpoint B register (MSB)
	#define MBPB_MBPBM10_OR	$400
	#define MBPB_MBPBM_OR	$700
	#define MBPB_MBPBL0	0		;MSCI BreaKpoint B register (LSB)
	#define MBPB_MBPBL0_OR	$01
	#define MBPB_MBPBL1	1		;MSCI BreaKpoint B register (LSB)
	#define MBPB_MBPBL1_OR	$02
	#define MBPB_MBPBL2	2		;MSCI BreaKpoint B register (LSB)
	#define MBPB_MBPBL2_OR	$04
	#define MBPB_MBPBL3	3		;MSCI BreaKpoint B register (LSB)
	#define MBPB_MBPBL3_OR	$08
	#define MBPB_MBPBL4	4		;MSCI BreaKpoint B register (LSB)
	#define MBPB_MBPBL4_OR	$10
	#define MBPB_MBPBL5	5		;MSCI BreaKpoint B register (LSB)
	#define MBPB_MBPBL5_OR	$20
	#define MBPB_MBPBL6	6		;MSCI BreaKpoint B register (LSB)
	#define MBPB_MBPBL6_OR	$40
	#define MBPB_MBPBL7	7		;MSCI BreaKpoint B register (LSB)
	#define MBPB_MBPBL7_OR	$80
	#define MBPB_MBPBL_OR	$ff

	EXTERN MDR.w		; MSCI Debug Register
	#define MDR_BPAEN	0		;BreakPoint A Enable
	#define MDR_BPAEN_OR	$01
	#define MDR_BPBEN	1		;BreakPoint B Enable
	#define MDR_BPBEN_OR	$02

	EXTERN MIPC.w		; MSCI Internal PC register
	#define MIPC_MIPCM8	8		;MSCI Internal PC register (MSB)
	#define MIPC_MIPCM8_OR	$100
	#define MIPC_MIPCM9	9		;MSCI Internal PC register (MSB)
	#define MIPC_MIPCM9_OR	$200
	#define MIPC_MIPCM10	10		;MSCI Internal PC register (MSB)
	#define MIPC_MIPCM10_OR	$400
	#define MIPC_MIPCM_OR	$700
	#define MIPC_MIPCL0	0		;MSCI Internal PC register (LSB)
	#define MIPC_MIPCL0_OR	$01
	#define MIPC_MIPCL1	1		;MSCI Internal PC register (LSB)
	#define MIPC_MIPCL1_OR	$02
	#define MIPC_MIPCL2	2		;MSCI Internal PC register (LSB)
	#define MIPC_MIPCL2_OR	$04
	#define MIPC_MIPCL3	3		;MSCI Internal PC register (LSB)
	#define MIPC_MIPCL3_OR	$08
	#define MIPC_MIPCL4	4		;MSCI Internal PC register (LSB)
	#define MIPC_MIPCL4_OR	$10
	#define MIPC_MIPCL5	5		;MSCI Internal PC register (LSB)
	#define MIPC_MIPCL5_OR	$20
	#define MIPC_MIPCL6	6		;MSCI Internal PC register (LSB)
	#define MIPC_MIPCL6_OR	$40
	#define MIPC_MIPCL7	7		;MSCI Internal PC register (LSB)
	#define MIPC_MIPCL7_OR	$80
	#define MIPC_MIPCL_OR	$ff

	EXTERN MISR.w		; MSCI Internal Status Register
	#define MISR_C	0		;Carry
	#define MISR_C_OR	$01
	#define MISR_Z	1		;Zero
	#define MISR_Z_OR	$02
	#define MISR_Cond	2		;Condition
	#define MISR_Cond_OR	$04
	#define MISR_AI	3		;Auto Increment
	#define MISR_AI_OR	$08
	#define MISR_BS	4		;Bit Set
	#define MISR_BS_OR	$10

	EXTERN ROM.w		; Register R0 register (MSB)

	EXTERN ROL.w		; Register R0 register (LSB)

	EXTERN R1M.w		; Register R1 register (MSB)

	EXTERN R1L.w		; Register R1 register (LSB)

	EXTERN R2M.w		; Register R2 register (MSB)

	EXTERN R2L.w		; Register R2 register (LSB)

	EXTERN R3M.w		; Register R3 register (MSB)

	EXTERN R3L.w		; Register R3 register (LSB)

	EXTERN DP0.w		; Data memory Pointer 0 register
	#define DP0_DP0M8	8		;Data memory Pointer 0 register (MSB)
	#define DP0_DP0M8_OR	$100
	#define DP0_DP0M9	9		;Data memory Pointer 0 register (MSB)
	#define DP0_DP0M9_OR	$200
	#define DP0_DP0M10	10		;Data memory Pointer 0 register (MSB)
	#define DP0_DP0M10_OR	$400
	#define DP0_DP0M11	11		;Data memory Pointer 0 register (MSB)
	#define DP0_DP0M11_OR	$800
	#define DP0_DP0M_OR	$f00
	#define DP0_DP0L0	0		;Data memory Pointer 0 register (LSB)
	#define DP0_DP0L0_OR	$01
	#define DP0_DP0L1	1		;Data memory Pointer 0 register (LSB)
	#define DP0_DP0L1_OR	$02
	#define DP0_DP0L2	2		;Data memory Pointer 0 register (LSB)
	#define DP0_DP0L2_OR	$04
	#define DP0_DP0L3	3		;Data memory Pointer 0 register (LSB)
	#define DP0_DP0L3_OR	$08
	#define DP0_DP0L4	4		;Data memory Pointer 0 register (LSB)
	#define DP0_DP0L4_OR	$10
	#define DP0_DP0L5	5		;Data memory Pointer 0 register (LSB)
	#define DP0_DP0L5_OR	$20
	#define DP0_DP0L6	6		;Data memory Pointer 0 register (LSB)
	#define DP0_DP0L6_OR	$40
	#define DP0_DP0L7	7		;Data memory Pointer 0 register (LSB)
	#define DP0_DP0L7_OR	$80
	#define DP0_DP0L_OR	$ff

	EXTERN DP1.w		; Data memory Pointer 1 register
	#define DP1_DP1M8	8		;Data memory Pointer 1 register (MSB)
	#define DP1_DP1M8_OR	$100
	#define DP1_DP1M9	9		;Data memory Pointer 1 register (MSB)
	#define DP1_DP1M9_OR	$200
	#define DP1_DP1M10	10		;Data memory Pointer 1 register (MSB)
	#define DP1_DP1M10_OR	$400
	#define DP1_DP1M11	11		;Data memory Pointer 1 register (MSB)
	#define DP1_DP1M11_OR	$800
	#define DP1_DP1M_OR	$f00
	#define DP1_DP1L0	0		;Data memory Pointer 1 register (LSB)
	#define DP1_DP1L0_OR	$01
	#define DP1_DP1L1	1		;Data memory Pointer 1 register (LSB)
	#define DP1_DP1L1_OR	$02
	#define DP1_DP1L2	2		;Data memory Pointer 1 register (LSB)
	#define DP1_DP1L2_OR	$04
	#define DP1_DP1L3	3		;Data memory Pointer 1 register (LSB)
	#define DP1_DP1L3_OR	$08
	#define DP1_DP1L4	4		;Data memory Pointer 1 register (LSB)
	#define DP1_DP1L4_OR	$10
	#define DP1_DP1L5	5		;Data memory Pointer 1 register (LSB)
	#define DP1_DP1L5_OR	$20
	#define DP1_DP1L6	6		;Data memory Pointer 1 register (LSB)
	#define DP1_DP1L6_OR	$40
	#define DP1_DP1L7	7		;Data memory Pointer 1 register (LSB)
	#define DP1_DP1L7_OR	$80
	#define DP1_DP1L_OR	$ff

	EXTERN DP2.w		; Data memory Pointer 2 register
	#define DP2_DP2M8	8		;Data memory Pointer 2 register (MSB)
	#define DP2_DP2M8_OR	$100
	#define DP2_DP2M9	9		;Data memory Pointer 2 register (MSB)
	#define DP2_DP2M9_OR	$200
	#define DP2_DP2M10	10		;Data memory Pointer 2 register (MSB)
	#define DP2_DP2M10_OR	$400
	#define DP2_DP2M11	11		;Data memory Pointer 2 register (MSB)
	#define DP2_DP2M11_OR	$800
	#define DP2_DP2M_OR	$f00
	#define DP2_DP2L0	0		;Data memory Pointer 2 register (LSB)
	#define DP2_DP2L0_OR	$01
	#define DP2_DP2L1	1		;Data memory Pointer 2 register (LSB)
	#define DP2_DP2L1_OR	$02
	#define DP2_DP2L2	2		;Data memory Pointer 2 register (LSB)
	#define DP2_DP2L2_OR	$04
	#define DP2_DP2L3	3		;Data memory Pointer 2 register (LSB)
	#define DP2_DP2L3_OR	$08
	#define DP2_DP2L4	4		;Data memory Pointer 2 register (LSB)
	#define DP2_DP2L4_OR	$10
	#define DP2_DP2L5	5		;Data memory Pointer 2 register (LSB)
	#define DP2_DP2L5_OR	$20
	#define DP2_DP2L6	6		;Data memory Pointer 2 register (LSB)
	#define DP2_DP2L6_OR	$40
	#define DP2_DP2L7	7		;Data memory Pointer 2 register (LSB)
	#define DP2_DP2L7_OR	$80
	#define DP2_DP2L_OR	$ff

	EXTERN DP3.w		; Data memory Pointer 3 register
	#define DP3_DP3M8	8		;Data memory Pointer 3 register (MSB)
	#define DP3_DP3M8_OR	$100
	#define DP3_DP3M9	9		;Data memory Pointer 3 register (MSB)
	#define DP3_DP3M9_OR	$200
	#define DP3_DP3M10	10		;Data memory Pointer 3 register (MSB)
	#define DP3_DP3M10_OR	$400
	#define DP3_DP3M11	11		;Data memory Pointer 3 register (MSB)
	#define DP3_DP3M11_OR	$800
	#define DP3_DP3M_OR	$f00
	#define DP3_DP3L0	0		;Data memory Pointer 3 register (LSB)
	#define DP3_DP3L0_OR	$01
	#define DP3_DP3L1	1		;Data memory Pointer 3 register (LSB)
	#define DP3_DP3L1_OR	$02
	#define DP3_DP3L2	2		;Data memory Pointer 3 register (LSB)
	#define DP3_DP3L2_OR	$04
	#define DP3_DP3L3	3		;Data memory Pointer 3 register (LSB)
	#define DP3_DP3L3_OR	$08
	#define DP3_DP3L4	4		;Data memory Pointer 3 register (LSB)
	#define DP3_DP3L4_OR	$10
	#define DP3_DP3L5	5		;Data memory Pointer 3 register (LSB)
	#define DP3_DP3L5_OR	$20
	#define DP3_DP3L6	6		;Data memory Pointer 3 register (LSB)
	#define DP3_DP3L6_OR	$40
	#define DP3_DP3L7	7		;Data memory Pointer 3 register (LSB)
	#define DP3_DP3L7_OR	$80
	#define DP3_DP3L_OR	$ff

	EXTERN P1DR0M.w		; Port 1 Data Register Output (MSB)

	EXTERN P1DR0L.w		; Port 1 Data Register Output (LSB)

	EXTERN P1DRIM.w		; Port 1 Data Register Input (MSB)

	EXTERN P1DRIL.w		; Port 1 Data Register Input (LSB)

	EXTERN P1DDRM.w		; Port 2 Data Direction Register (MSB)

	EXTERN P1DDRL.w		; Port 2 Data Direction Register (LSB)

	EXTERN P2DROM.w		; Port 2 Data Register Output (MSB)

	EXTERN P2DROL.w		; Port 2 Data Register Output (LSB)

	EXTERN P2DRIM.w		; Port 2 Data Register Input (MSB)

	EXTERN P2DRIL.w		; Port 2 Data Register Input (LSB)

	EXTERN P2DDRM.w		; Port 2 Data Direction Register (MSB)

	EXTERN P2DDRL.w		; Port 2 Data Direction Register (LSB)

	EXTERN VCR.w		; VCI Control register
	#define VCR_VCIEN	0		;VCI Interface enable
	#define VCR_VCIEN_OR	$01
	#define VCR_BM	1		;Burst Mode
	#define VCR_BM_OR	$02
	#define VCR__8BM	2		;8-Bit Mode
	#define VCR__8BM_OR	$04
	#define VCR_NP0	4		;Number of Packets
	#define VCR_NP0_OR	$10
	#define VCR_NP1	5		;Number of Packets
	#define VCR_NP1_OR	$20
	#define VCR_NP2	6		;Number of Packets
	#define VCR_NP2_OR	$40
	#define VCR_NP3	7		;Number of Packets
	#define VCR_NP3_OR	$80
	#define VCR_NP_OR	$f0

	EXTERN VSR.w		; VCI Status register
	#define VSR_FE	0		;FIFO Empty
	#define VSR_FE_OR	$01
	#define VSR_FF	1		;FIFO Full
	#define VSR_FF_OR	$02
	#define VSR_CP	2		;Communication in Progress
	#define VSR_CP_OR	$04
	#define VSR_LWR	3		;Last Word Read
	#define VSR_LWR_OR	$08
	#define VSR_UDRI	4		;USB DMA Request In
	#define VSR_UDRI_OR	$10
	#define VSR_UDRO	5		;USB DMA Request Out
	#define VSR_UDRO_OR	$20

	EXTERN VFDRM.w		; VCI Fifo Data register (MSB)

	EXTERN VFDRL.w		; VCI Fifo Data register (LSB)

	EXTERN VTAR.w		; VCI Target Address Register
	#define VTAR_TA0	0		;Target Address
	#define VTAR_TA0_OR	$01
	#define VTAR_TA1	1		;Target Address
	#define VTAR_TA1_OR	$02
	#define VTAR_TA2	2		;Target Address
	#define VTAR_TA2_OR	$04
	#define VTAR_TA3	3		;Target Address
	#define VTAR_TA3_OR	$08
	#define VTAR_TA4	4		;Target Address
	#define VTAR_TA4_OR	$10
	#define VTAR_TA5	5		;Target Address
	#define VTAR_TA5_OR	$20
	#define VTAR_TA_OR	$3f

	EXTERN PNDRM.w		; Parallel IF Number of Data Register (MSB)

	EXTERN PNDRL.w		; Parallel IF Number of Data Register (LSB)

	EXTERN PFDRM.w		; Parallel IF Fifo Data Register (MSB)

	EXTERN PFDRL.w		; Parallel IF Fifo Data Register (LSB)

	EXTERN PCR1M.w		; Parallel IF Control Register 1 (MSB)

	EXTERN PCR1L.w		; Parallel IF Control Register 1 (LSB)

	EXTERN PCR2M.w		; Parallel interface Control Register 2 (MSB)

	EXTERN PCR2L.w		; Parallel interface Control Register 2 (LSB)

	EXTERN PSRM.w		; Parallel interface Status Register (MSB)

	EXTERN PSRL.w		; Parallel interface Status Register (LSB)

	EXTERN ELP1M.w		; ECC Line Parity 1 (MSB)

	EXTERN ELP1L.w		; ECC Line Parity 1 (LSB)

	EXTERN ECP1M.w		; ECC Column Parity 1 (MSB)

	EXTERN ECP1L.w		; ECC Column Parity 1 (LSB)

	EXTERN ELP2M.w		; ECC Line Parity 2 (MSB)

	EXTERN ELP2L.w		; ECC Line Parity 2 (LSB)

	EXTERN ECP2M.w		; ECC Column Parity 2 (MSB)

	EXTERN ECP2L.w		; ECC Column Parity 2 (LSB)

	EXTERN RCSRM.w		; Reed-Solomon Control Status Register (MSB)

	EXTERN RCSRL.w		; Reed-Solomon Control Status Register (LSB)

	EXTERN RDFRM.w		; Reed-Solomon Decoder FIFO Register (MSB)

	EXTERN RDFRL.w		; Reed-Solomon Decoder FIFO Register (LSB)

	EXTERN REFRM.w		; Reed-Solomon Encoder FIFO Register (MSB)

	EXTERN REFRL.w		; Reed-Solomon Encoder FIFO Register (LSB)

	#endif ; __ST7267__
