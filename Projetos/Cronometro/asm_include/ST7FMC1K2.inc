; ST7FMC1K2.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST7FMC1K2__
; do nothing
	#else
	#define __ST7FMC1K2__ 1

; ST7FMC1K2


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

; Port F
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PFDR.b		; Data Register

	EXTERN PFDDR.b		; Data Direction Register

	EXTERN PFOR.b		; Option Register

; Serial Communication Interface (LinSCI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SCISR.b		; Status Register
	#define SCISR_PE	0		;Parity Error
	#define SCISR_PE_OR	$01
	#define SCISR_FE	1		;Framing Error
	#define SCISR_FE_OR	$02
	#define SCISR_NF	2		;Noise Flag
	#define SCISR_NF_OR	$04
	#define SCISR_OR_LHE	3		;Overrun Error/Lin Header Error
	#define SCISR_OR_LHE_OR	$08
	#define SCISR_IDLE	4		;Idle line detect
	#define SCISR_IDLE_OR	$10
	#define SCISR_RDRF	5		;Received Data Ready Flag
	#define SCISR_RDRF_OR	$20
	#define SCISR_TC	6		;Transmission Complete
	#define SCISR_TC_OR	$40
	#define SCISR_TDRE	7		;Transmission Data Register Empty
	#define SCISR_TDRE_OR	$80

	EXTERN SCIDR.b		; Data Register

	EXTERN SCIBRR.b		; Baud Rate Register
	#define SCIBRR_SCR0	0		;Receiver Rate Divisor
	#define SCIBRR_SCR0_OR	$01
	#define SCIBRR_SCR1	1		;Receiver Rate Divisor
	#define SCIBRR_SCR1_OR	$02
	#define SCIBRR_SCR2	2		;Receiver Rate Divisor
	#define SCIBRR_SCR2_OR	$04
	#define SCIBRR_SCR_OR	$07
	#define SCIBRR_SCT0	3		;Transmitter Rate Divisor
	#define SCIBRR_SCT0_OR	$08
	#define SCIBRR_SCT1	4		;Transmitter Rate Divisor
	#define SCIBRR_SCT1_OR	$10
	#define SCIBRR_SCT2	5		;Transmitter Rate Divisor
	#define SCIBRR_SCT2_OR	$20
	#define SCIBRR_SCT_OR	$38
	#define SCIBRR_SCP0	6		;First SCI Prescaler
	#define SCIBRR_SCP0_OR	$40
	#define SCIBRR_SCP1	7		;First SCI Prescaler
	#define SCIBRR_SCP1_OR	$80
	#define SCIBRR_SCP_OR	$c0

	EXTERN LPR.b		; Lin Prescaler Register

	EXTERN SCICR1.b		; Control Register 1
	#define SCICR1_PIE	0		;Parity Interrupt Enable
	#define SCICR1_PIE_OR	$01
	#define SCICR1_PS	1		;Parity Selection
	#define SCICR1_PS_OR	$02
	#define SCICR1_PCE	2		;Parity Control Enable
	#define SCICR1_PCE_OR	$04
	#define SCICR1_WAKE	3		;Wake-up Method
	#define SCICR1_WAKE_OR	$08
	#define SCICR1_M	4		;Word Length
	#define SCICR1_M_OR	$10
	#define SCICR1_SCID	5		;Sci prescaler and outputs enable/disable bit
	#define SCICR1_SCID_OR	$20
	#define SCICR1_T8	6		;Transmit Data Bit 8
	#define SCICR1_T8_OR	$40
	#define SCICR1_R8	7		;Receive Data Bit 8
	#define SCICR1_R8_OR	$80

	EXTERN SCICR2.b		; Control Register 2
	#define SCICR2_SBK	0		;Send Break
	#define SCICR2_SBK_OR	$01
	#define SCICR2_RWU	1		;Receiver Wake-up Mode
	#define SCICR2_RWU_OR	$02
	#define SCICR2_RE	2		;Receiver
	#define SCICR2_RE_OR	$04
	#define SCICR2_TE	3		;Transmitter
	#define SCICR2_TE_OR	$08
	#define SCICR2_ILIE	4		;Idle Line Interrupt
	#define SCICR2_ILIE_OR	$10
	#define SCICR2_RIE	5		;Receiver Interrupt
	#define SCICR2_RIE_OR	$20
	#define SCICR2_TCIE	6		;Transmission Complete Interrupt
	#define SCICR2_TCIE_OR	$40
	#define SCICR2_TIE	7		;Transmitter Interrupt
	#define SCICR2_TIE_OR	$80

	EXTERN SCICR3.b		; Control Register 3
	#define SCICR3_LSF	0		;Lin Synch Field State
	#define SCICR3_LSF_OR	$01
	#define SCICR3_LHDF	1		;Lin Header Detection Flag
	#define SCICR3_LHDF_OR	$02
	#define SCICR3_LHIE	2		;Lin Header Interrupt Enable
	#define SCICR3_LHIE_OR	$04
	#define SCICR3_LHDM	3		;Lin Header Detection Method
	#define SCICR3_LHDM_OR	$08
	#define SCICR3_LASE	4		;Lin Auto Synch Enable
	#define SCICR3_LASE_OR	$10
	#define SCICR3_LSLV	5		;Lin Master/Slave Mode
	#define SCICR3_LSLV_OR	$20
	#define SCICR3_LINE	6		;Lin Mode Enable/disable
	#define SCICR3_LINE_OR	$40
	#define SCICR3_LDUM	7		;Lin Divider Update Method
	#define SCICR3_LDUM_OR	$80

; SCIERPR, LHLR - Extended Receive Prescaler Reg., Lin Header Length Register
	EXTERN SCIERPR.b
	EXTERN LHLR.b

; SCIETPR, LPRF - Extended Transmit Prescaler Reg., Lin Prescaler Fraction Register
	EXTERN SCIETPR.b
	EXTERN LPRF.b

; Interrupt Software Priority (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;External Non Maskable IT Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;External Non Maskable IT Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;MCC IT Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;MCC IT Priority Level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;External IT 0 Priority Level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;External IT 0 Priority Level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;External IT 1 Priority Level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;External IT 1 Priority Level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR1.b		; Interrupt Software Priority Register 1
	#define ISPR1_I0_4	0		;External IT 2 Priority Level
	#define ISPR1_I0_4_OR	$01
	#define ISPR1_I1_4	1		;External IT 2 Priority Level
	#define ISPR1_I1_4_OR	$02
	#define ISPR1_I_4_OR	$03
	#define ISPR1_I0_5	2		;MTC U/CL IT Priority Level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;MTC U/CL IT Priority Level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;MTC R/Z IT Priority Level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;MTC R/Z IT Priority Level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;MTC C/D IT Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;MTC C/D IT Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;SPI IT Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;SPI IT Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_9	2		;Timer A IT Priority Level
	#define ISPR2_I0_9_OR	$04
	#define ISPR2_I1_9	3		;Timer A IT Priority Level
	#define ISPR2_I1_9_OR	$08
	#define ISPR2_I_9_OR	$0c
	#define ISPR2_I0_10	4		;Timer B IT Priority Level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;Timer B IT Priority Level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30
	#define ISPR2_I0_11	6		;SCI IT Priority Level
	#define ISPR2_I0_11_OR	$40
	#define ISPR2_I1_11	7		;SCI IT Priority Level
	#define ISPR2_I1_11_OR	$80
	#define ISPR2_I_11_OR	$c0

	EXTERN ISPR3.b		; Interrupt Software Priority Register 3
	#define ISPR3_I0_12	0		;AVD IT Priority Level
	#define ISPR3_I0_12_OR	$01
	#define ISPR3_I1_12	1		;AVD IT Priority Level
	#define ISPR3_I1_12_OR	$02
	#define ISPR3_I_12_OR	$03
	#define ISPR3_I0_13	2		;PWMART IT Priority Level
	#define ISPR3_I0_13_OR	$04
	#define ISPR3_I1_13	3		;PWMART IT Priority Level
	#define ISPR3_I1_13_OR	$08
	#define ISPR3_I_13_OR	$0c

	EXTERN EICR.b		; External Interrupt Control Register
	#define EICR_IPA	0		;Interrupt Polarity port A
	#define EICR_IPA_OR	$01
	#define EICR_IS30	1		;EI0 Sensitivity
	#define EICR_IS30_OR	$02
	#define EICR_IS31	2		;EI0 Sensitivity
	#define EICR_IS31_OR	$04
	#define EICR_IS3_OR	$06
	#define EICR_IS20	3		;EI1 Sensitivity
	#define EICR_IS20_OR	$08
	#define EICR_IS21	4		;EI1 Sensitivity
	#define EICR_IS21_OR	$10
	#define EICR_IS2_OR	$18
	#define EICR_IPB	5		;Interrupt Polarity port B
	#define EICR_IPB_OR	$20
	#define EICR_IS10	6		;EI2 Sensitivity
	#define EICR_IS10_OR	$40
	#define EICR_IS11	7		;EI2 Sensitivity
	#define EICR_IS11_OR	$80
	#define EICR_IS1_OR	$c0

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

; Window Watchdog (WWDG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN WDGCR.b		; Control Register
	#define WDGCR_WDGA	7		;Activation Bit
	#define WDGCR_WDGA_OR	$80
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

	EXTERN WDGWR.b		; Window Register
	#define WDGWR_W0	0		;7-bit window value
	#define WDGWR_W0_OR	$01
	#define WDGWR_W1	1		;7-bit window value
	#define WDGWR_W1_OR	$02
	#define WDGWR_W2	2		;7-bit window value
	#define WDGWR_W2_OR	$04
	#define WDGWR_W3	3		;7-bit window value
	#define WDGWR_W3_OR	$08
	#define WDGWR_W4	4		;7-bit window value
	#define WDGWR_W4_OR	$10
	#define WDGWR_W5	5		;7-bit window value
	#define WDGWR_W5_OR	$20
	#define WDGWR_W6	6		;7-bit window value
	#define WDGWR_W6_OR	$40
	#define WDGWR_W_OR	$7f

; Main Clock Controller (MCC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MCCSR.b		; Main Clock Control/Status Register
	#define MCCSR_OIF	0		;Oscillator Interrupt Flag
	#define MCCSR_OIF_OR	$01
	#define MCCSR_OIE	1		;Oscillator Interrupt
	#define MCCSR_OIE_OR	$02
	#define MCCSR_TB0	2		;Time Base Control
	#define MCCSR_TB0_OR	$04
	#define MCCSR_TB1	3		;Time Base Control
	#define MCCSR_TB1_OR	$08
	#define MCCSR_TB_OR	$0c
	#define MCCSR_SMS	4		;Slow Mode Select
	#define MCCSR_SMS_OR	$10
	#define MCCSR_CP0	5		;CPU Clock Prescaler
	#define MCCSR_CP0_OR	$20
	#define MCCSR_CP1	6		;CPU Clock Prescaler
	#define MCCSR_CP1_OR	$40
	#define MCCSR_CP_OR	$60
	#define MCCSR_MCO	7		;Main Clock Out
	#define MCCSR_MCO_OR	$80

	EXTERN MCCBCR.b		; MCC Beep Control Register
	#define MCCBCR_BC0	0		;Beep Control
	#define MCCBCR_BC0_OR	$01
	#define MCCBCR_BC1	1		;Beep Control
	#define MCCBCR_BC1_OR	$02
	#define MCCBCR_BC_OR	$03
	#define MCCBCR_ADCIE	2		;A/D Converter Interrupt Enable
	#define MCCBCR_ADCIE_OR	$04
	#define MCCBCR_ADSTS	3		;A/D Converter Sample Time Stretch
	#define MCCBCR_ADSTS_OR	$08

; 10-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADCCSR.b		; Control/Status Register
	#define ADCCSR_CH0	0		;Channel Selection
	#define ADCCSR_CH0_OR	$01
	#define ADCCSR_CH1	1		;Channel Selection
	#define ADCCSR_CH1_OR	$02
	#define ADCCSR_CH2	2		;Channel Selection
	#define ADCCSR_CH2_OR	$04
	#define ADCCSR_CH3	3		;Channel Selection
	#define ADCCSR_CH3_OR	$08
	#define ADCCSR_CH_OR	$0f
	#define ADCCSR_ADON	4		;Start Converter
	#define ADCCSR_ADON_OR	$10
	#define ADCCSR_PRSC0	5		;Clock prescaler selection
	#define ADCCSR_PRSC0_OR	$20
	#define ADCCSR_PRSC1	6		;Clock prescaler selection
	#define ADCCSR_PRSC1_OR	$40
	#define ADCCSR_PRSC_OR	$60
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

	EXTERN ADCDRH.b		; Data High Register

	EXTERN ADCDRL.b		; Data low Register

; 16-Bit Timer A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TACR2.b		; Control Register 2
	#define TACR2_EXEDG	0		;External Clock Edge
	#define TACR2_EXEDG_OR	$01
	#define TACR2_IEDG2	1		;Input Edge 2
	#define TACR2_IEDG2_OR	$02
	#define TACR2_CC0	2		;Clock Control
	#define TACR2_CC0_OR	$04
	#define TACR2_CC1	3		;Clock Control
	#define TACR2_CC1_OR	$08
	#define TACR2_CC_OR	$0c
	#define TACR2_PWM	4		;Pulse Width Modulation
	#define TACR2_PWM_OR	$10
	#define TACR2_OPM	5		;One Pulse Mode
	#define TACR2_OPM_OR	$20
	#define TACR2_OC2E	6		;Output Compare 2 Output Pin
	#define TACR2_OC2E_OR	$40
	#define TACR2_OC1E	7		;Output Compare 1 Output Pin
	#define TACR2_OC1E_OR	$80

	EXTERN TACR1.b		; Control Register 1
	#define TACR1_OLVL1	0		;Output Level 1
	#define TACR1_OLVL1_OR	$01
	#define TACR1_IEDG1	1		;Input Edge 1
	#define TACR1_IEDG1_OR	$02
	#define TACR1_OLVL2	2		;Output Level 2
	#define TACR1_OLVL2_OR	$04
	#define TACR1_FOLV1	3		;Forced Output Compare 1
	#define TACR1_FOLV1_OR	$08
	#define TACR1_FOLV2	4		;Forced Output Compare 2
	#define TACR1_FOLV2_OR	$10
	#define TACR1_TOIE	5		;Timer Overflow Interrupt
	#define TACR1_TOIE_OR	$20
	#define TACR1_OCIE	6		;Output Compare Interrupt
	#define TACR1_OCIE_OR	$40
	#define TACR1_ICIE	7		;Input Capture Interrupt
	#define TACR1_ICIE_OR	$80

	EXTERN TACSR.b		; Control/Status Register
	#define TACSR_TIMD	2		;Timer Disable
	#define TACSR_TIMD_OR	$04
	#define TACSR_OCF2	3		;Output Compare Flag 2
	#define TACSR_OCF2_OR	$08
	#define TACSR_ICF2	4		;Input Capture Flag 2
	#define TACSR_ICF2_OR	$10
	#define TACSR_TOF	5		;Timer Overflow
	#define TACSR_TOF_OR	$20
	#define TACSR_OCF1	6		;Output Compare Flag 1
	#define TACSR_OCF1_OR	$40
	#define TACSR_ICF1	7		;Input Capture Flag 1
	#define TACSR_ICF1_OR	$80

	EXTERN TAIC1HR.b		; Input Capture 1 High Register

	EXTERN TAIC1LR.b		; Input Capture 1 Low Register

	EXTERN TAOC1HR.b		; Output Compare 1 High Register

	EXTERN TAOC1LR.b		; Output Compare 1 Low Register

	EXTERN TACHR.b		; Counter High Register

	EXTERN TACLR.b		; Counter Low Register

	EXTERN TAACHR.b		; Alternate Counter High Register

	EXTERN TAACLR.b		; Alternate Counter Low Register

	EXTERN TAIC2HR.b		; Input Capture 2 High Register

	EXTERN TAIC2LR.b		; Input Capture 2 Low Register

	EXTERN TAOC2HR.b		; Output Compare 2 High Register

	EXTERN TAOC2LR.b		; Output Compare 2 Low Register

; System Integrity Control/Status Register (SICSR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SICSR_page0.b		; System Integrity Control/Status Register (page 0)
	#define SICSR_page0_WDGRF	0		;Watchdog Reset Flag
	#define SICSR_page0_WDGRF_OR	$01
	#define SICSR_page0_CSSD	1		;Clock Security System Detection
	#define SICSR_page0_CSSD_OR	$02
	#define SICSR_page0_CSSIE	2		;Clock Security System Interrupt
	#define SICSR_page0_CSSIE_OR	$04
	#define SICSR_page0_LVDRF	4		;LVD Reset Flag
	#define SICSR_page0_LVDRF_OR	$10
	#define SICSR_page0_AVDF	5		;Voltage Detector Flag
	#define SICSR_page0_AVDF_OR	$20
	#define SICSR_page0_AVDIE	6		;Voltage Detector Interrupt
	#define SICSR_page0_AVDIE_OR	$40
	#define SICSR_page0_PAGE	7		;SICSR Register Page Selection
	#define SICSR_page0_PAGE_OR	$80

	EXTERN SICSR_page1.b		; System Integrity Control/Status Register (page 1)
	#define SICSR_page1_CKSEL	1		;Clock Source Selection
	#define SICSR_page1_CKSEL_OR	$02
	#define SICSR_page1_PLLEN	2		;PLL Enable
	#define SICSR_page1_PLLEN_OR	$04
	#define SICSR_page1_LOCK	4		;PLL Locked
	#define SICSR_page1_LOCK_OR	$10
	#define SICSR_page1_VCOEN	5		;VCO Enable
	#define SICSR_page1_VCOEN_OR	$20
	#define SICSR_page1_PAGE	7		;SICSR Register Page Selection
	#define SICSR_page1_PAGE_OR	$80

; Motor Controller (MTC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; MTIM, MDTG - Timer Counter High Register, Dead Time Generator Register
	EXTERN MTIM.b
	EXTERN MDTG.b

; MTIML, MPOL - Timer Counter Low Register, Polarity Register
	EXTERN MTIML.b
	EXTERN MPOL.b

; MZPRV, MPWME - Capture Zn-1 Register, PWM Register
	EXTERN MZPRV.b
	EXTERN MPWME.b

; MZREG, MCONF - Capture Zn Register, Configuration Register
	EXTERN MZREG.b
	EXTERN MCONF.b

; MCOMP, MPAR - Compare Cn+1 Register, Parity register
	EXTERN MCOMP.b
	EXTERN MPAR.b

; MDREG, MZRF - Demagnetization Register, Z Event Filter Register
	EXTERN MDREG.b
	EXTERN MZRF.b

; MWGHT, MSCR - An Weight Register, Sampling Clock Register
	EXTERN MWGHT.b
	EXTERN MSCR.b

	EXTERN MPRSR.b		; Prescaler & Sampling Register
	#define MPRSR_ST0	0		;Step Ratio Max. Min. (Period Range Mini. Max.)
	#define MPRSR_ST0_OR	$01
	#define MPRSR_ST1	1		;Step Ratio Max. Min. (Period Range Mini. Max.)
	#define MPRSR_ST1_OR	$02
	#define MPRSR_ST2	2		;Step Ratio Max. Min. (Period Range Mini. Max.)
	#define MPRSR_ST2_OR	$04
	#define MPRSR_ST3	3		;Step Ratio Max. Min. (Period Range Mini. Max.)
	#define MPRSR_ST3_OR	$08
	#define MPRSR_ST_OR	$0f
	#define MPRSR_SA0	4		;Sampling Ratio
	#define MPRSR_SA0_OR	$10
	#define MPRSR_SA1	5		;Sampling Ratio
	#define MPRSR_SA1_OR	$20
	#define MPRSR_SA2	6		;Sampling Ratio
	#define MPRSR_SA2_OR	$40
	#define MPRSR_SA3	7		;Sampling Ratio
	#define MPRSR_SA3_OR	$80
	#define MPRSR_SA_OR	$f0

	EXTERN MIMR.b		; Interrupt Mask Register
	#define MIMR_CIM	0		;Commutation/Capture Interrupt Mask bit
	#define MIMR_CIM_OR	$01
	#define MIMR_DIM	1		;End of Demagnetization Interrupt Mask bit
	#define MIMR_DIM_OR	$02
	#define MIMR_ZIM	2		;Back EMF Zero-crossing Interrupt Mask bit
	#define MIMR_ZIM_OR	$04
	#define MIMR_EIM	3		;Emergency stop Interrupt Mask bit
	#define MIMR_EIM_OR	$08
	#define MIMR_CLIM	4		;Current Limitation Interrupt Mask bit
	#define MIMR_CLIM_OR	$10
	#define MIMR_RIM	5		;Ratio update Interrupt Mask bit
	#define MIMR_RIM_OR	$20
	#define MIMR_SEM	6		;Speed Error Mask bit
	#define MIMR_SEM_OR	$40
	#define MIMR_PUM	7		;PWM Update Mask bit
	#define MIMR_PUM_OR	$80

	EXTERN MISR.b		; Interrupt Status Register
	#define MISR_CI	0		;Commutation Interrupt flag
	#define MISR_CI_OR	$01
	#define MISR_DI	1		;End of Demagnetization Interrupt flag
	#define MISR_DI_OR	$02
	#define MISR_ZI	2		;BEMF Zero-crossing Interrupt flag
	#define MISR_ZI_OR	$04
	#define MISR_EI	3		;Emergency Stop Interrupt flag
	#define MISR_EI_OR	$08
	#define MISR_CLI	4		;Current Limitation interrupt flag
	#define MISR_CLI_OR	$10
	#define MISR_RMI	5		;Ratio Decrement Interrupt flag
	#define MISR_RMI_OR	$20
	#define MISR_RPI	6		;Ratio Increment Interrupt flag
	#define MISR_RPI_OR	$40
	#define MISR_PUI	7		;PWM Update Interrupt flag
	#define MISR_PUI_OR	$80

	EXTERN MCRA.b		; Control Register A
	#define MCRA_DCB	0		;Data Capture bit
	#define MCRA_DCB_OR	$01
	#define MCRA_PZ	1		;Protection from parasitic Zero-crossing
	#define MCRA_PZ_OR	$02
	#define MCRA_SWA	2		;Switched/Autoswitched Mode
	#define MCRA_SWA_OR	$04
	#define MCRA_V0C1	3		;Voltage/Current Mode
	#define MCRA_V0C1_OR	$08
	#define MCRA_DAC	4		;Direct Access to phase state Register
	#define MCRA_DAC_OR	$10
	#define MCRA_SR	5		;Sensor ON/Off
	#define MCRA_SR_OR	$20
	#define MCRA_CKE	6		;Clock Enable bit
	#define MCRA_CKE_OR	$40
	#define MCRA_MOE	7		;Output Enable bit
	#define MCRA_MOE_OR	$80

	EXTERN MCRB.b		; Control Register B
	#define MCRB_OS0	0		;Operating Output mode Selection bit (PWM after Z and before next C)
	#define MCRB_OS0_OR	$01
	#define MCRB_OS1	1		;Operating Output mode Selection bit (PWM after D and before Z)
	#define MCRB_OS1_OR	$02
	#define MCRB_OS2	2		;Operating Output mode Selection and preload bit (PWM after C and before D)
	#define MCRB_OS2_OR	$04
	#define MCRB_OCV	3		;Over Current Handling in Voltage mode
	#define MCRB_OCV_OR	$08
	#define MCRB_SDM	4		;Simulated Demagnetization event Mask bit
	#define MCRB_SDM_OR	$10
	#define MCRB_HDM	5		;Hardware Demagnetization event Mask bit
	#define MCRB_HDM_OR	$20
	#define MCRB_CPB	6		;Compare bit for zero-crossing detection
	#define MCRB_CPB_OR	$40

	EXTERN MCRC.b		; Control Register C
	#define MCRC_VR0	0		;BEMF/demagnetisation Reference threshold
	#define MCRC_VR0_OR	$01
	#define MCRC_VR1	1		;BEMF/demagnetisation Reference threshold
	#define MCRC_VR1_OR	$02
	#define MCRC_VR2	2		;BEMF/demagnetisation Reference threshold
	#define MCRC_VR2_OR	$04
	#define MCRC_VR_OR	$07
	#define MCRC_SPLG	3		;Sampling Z event at 1MHz in sensorless mode (SR=0)
	#define MCRC_SPLG_OR	$08
	#define MCRC_SC	4		;Simulated commutation event bit
	#define MCRC_SC_OR	$10
	#define MCRC_SZ	5		;Simulated zero-crossing event bit
	#define MCRC_SZ_OR	$20
	#define MCRC_EDIR_HZ	6		;Encoder Direction bit/Hardware zero-crossing event bit
	#define MCRC_EDIR_HZ_OR	$40
	#define MCRC_SEI_OI	7		;Speed Error interrupt flag/MTIM Overflow flag
	#define MCRC_SEI_OI_OR	$80

	EXTERN MPHST.b		; Phase State Register
	#define MPHST_OO0	0		;Output Channel 0 On/Off bit
	#define MPHST_OO0_OR	$01
	#define MPHST_OO1	1		;Output Channel 1 On/Off bit
	#define MPHST_OO1_OR	$02
	#define MPHST_OO2	2		;Output Channel 2 On/Off bit
	#define MPHST_OO2_OR	$04
	#define MPHST_OO3	3		;Output Channel 3 On/Off bit
	#define MPHST_OO3_OR	$08
	#define MPHST_OO4	4		;Output Channel 4 On/Off bit
	#define MPHST_OO4_OR	$10
	#define MPHST_OO5	5		;Output Channel 5 On/Off bit
	#define MPHST_OO5_OR	$20
	#define MPHST_IS0	6		;Input Selection bits
	#define MPHST_IS0_OR	$40
	#define MPHST_IS1	7		;Input Selection bits
	#define MPHST_IS1_OR	$80
	#define MPHST_IS_OR	$c0

	EXTERN MDFR.b		; D event Filter Register
	#define MDFR_DWF0	0		;D Window Filter bits
	#define MDFR_DWF0_OR	$01
	#define MDFR_DWF1	1		;D Window Filter bits
	#define MDFR_DWF1_OR	$02
	#define MDFR_DWF2	2		;D Window Filter bits
	#define MDFR_DWF2_OR	$04
	#define MDFR_DWF3	3		;D Window Filter bits
	#define MDFR_DWF3_OR	$08
	#define MDFR_DWF_OR	$0f
	#define MDFR_DEF0	4		;D Event Filter bits
	#define MDFR_DEF0_OR	$10
	#define MDFR_DEF1	5		;D Event Filter bits
	#define MDFR_DEF1_OR	$20
	#define MDFR_DEF2	6		;D Event Filter bits
	#define MDFR_DEF2_OR	$40
	#define MDFR_DEF3	7		;D Event Filter bits
	#define MDFR_DEF3_OR	$80
	#define MDFR_DEF_OR	$f0

	EXTERN MCFR.b		; Current feedback Filter Register
	#define MCFR_CFW0	0		;Current Window Filter bits
	#define MCFR_CFW0_OR	$01
	#define MCFR_CFW1	1		;Current Window Filter bits
	#define MCFR_CFW1_OR	$02
	#define MCFR_CFW2	2		;Current Window Filter bits
	#define MCFR_CFW2_OR	$04
	#define MCFR_CFW_OR	$07
	#define MCFR_CFF0	3		;Current Feedback Filter bits
	#define MCFR_CFF0_OR	$08
	#define MCFR_CFF1	4		;Current Feedback Filter bits
	#define MCFR_CFF1_OR	$10
	#define MCFR_CFF2	5		;Current Feedback Filter bits
	#define MCFR_CFF2_OR	$20
	#define MCFR_CFF_OR	$38
	#define MCFR_RST	6		;Reset MTC registers
	#define MCFR_RST_OR	$40
	#define MCFR_RPGS	7		;Register Page Selection
	#define MCFR_RPGS_OR	$80

	EXTERN MREF.b		; Reference Register
	#define MREF_HFRQ0	0		;Chopper frequency selection
	#define MREF_HFRQ0_OR	$01
	#define MREF_HFRQ1	1		;Chopper frequency selection
	#define MREF_HFRQ1_OR	$02
	#define MREF_HFRQ2	2		;Chopper frequency selection
	#define MREF_HFRQ2_OR	$04
	#define MREF_HFRQ_OR	$07
	#define MREF_HFE0	3		;Chopping mode selection
	#define MREF_HFE0_OR	$08
	#define MREF_HFE1	4		;Chopping mode selection
	#define MREF_HFE1_OR	$10
	#define MREF_HFE_OR	$18
	#define MREF_CFAV	5		;Current Feedback Amplifier entry Validation
	#define MREF_CFAV_OR	$20
	#define MREF_CL	6		;Current Loop Comparator Value
	#define MREF_CL_OR	$40
	#define MREF_HST	7		;Hysteresis Comparator Value
	#define MREF_HST_OR	$80

	EXTERN MPCR.b		; PWM Control Register
	#define MPCR_PCP0	0		;PWM counter prescaler value
	#define MPCR_PCP0_OR	$01
	#define MPCR_PCP1	1		;PWM counter prescaler value
	#define MPCR_PCP1_OR	$02
	#define MPCR_PCP2	2		;PWM counter prescaler value
	#define MPCR_PCP2_OR	$04
	#define MPCR_PCP_OR	$07
	#define MPCR_CMS	3		;PWM Counter Mode Selection
	#define MPCR_CMS_OR	$08
	#define MPCR_OVFW	4		;Phase W 100% duty cycle Selection
	#define MPCR_OVFW_OR	$10
	#define MPCR_OVFV	5		;Phase V 100% duty cycle Selection
	#define MPCR_OVFV_OR	$20
	#define MPCR_OVFU	6		;Phase U 100% duty cycle Selection
	#define MPCR_OVFU_OR	$40
	#define MPCR_PMS	7		;PWM Mode Selection
	#define MPCR_PMS_OR	$80

	EXTERN MREP.b		; Repetition Counter Register

	EXTERN MCPWH.b		; Compare Phase W Preload Register High

	EXTERN MCPWL.b		; Compare Phase W Preload Register Low
	#define MCPWL_CPWL3	3		;Low bits of phase W preload value
	#define MCPWL_CPWL3_OR	$08
	#define MCPWL_CPWL4	4		;Low bits of phase W preload value
	#define MCPWL_CPWL4_OR	$10
	#define MCPWL_CPWL5	5		;Low bits of phase W preload value
	#define MCPWL_CPWL5_OR	$20
	#define MCPWL_CPWL6	6		;Low bits of phase W preload value
	#define MCPWL_CPWL6_OR	$40
	#define MCPWL_CPWL7	7		;Low bits of phase W preload value
	#define MCPWL_CPWL7_OR	$80
	#define MCPWL_CPWL_OR	$f8

	EXTERN MCPVH.b		; Compare Phase V Preload Register High

	EXTERN MCPVL.b		; Compare Phase V Preload Register Low
	#define MCPVL_CPVL3	3		;Low bits of phase V preload value
	#define MCPVL_CPVL3_OR	$08
	#define MCPVL_CPVL4	4		;Low bits of phase V preload value
	#define MCPVL_CPVL4_OR	$10
	#define MCPVL_CPVL5	5		;Low bits of phase V preload value
	#define MCPVL_CPVL5_OR	$20
	#define MCPVL_CPVL6	6		;Low bits of phase V preload value
	#define MCPVL_CPVL6_OR	$40
	#define MCPVL_CPVL7	7		;Low bits of phase V preload value
	#define MCPVL_CPVL7_OR	$80
	#define MCPVL_CPVL_OR	$f8

	EXTERN MCPUH.b		; Compare Phase U Preload Register High

	EXTERN MCPUL.b		; Compare Phase U Preload Register Low
	#define MCPUL_CPUL3	3		;Low bits of phase U preload value
	#define MCPUL_CPUL3_OR	$08
	#define MCPUL_CPUL4	4		;Low bits of phase U preload value
	#define MCPUL_CPUL4_OR	$10
	#define MCPUL_CPUL5	5		;Low bits of phase U preload value
	#define MCPUL_CPUL5_OR	$20
	#define MCPUL_CPUL6	6		;Low bits of phase U preload value
	#define MCPUL_CPUL6_OR	$40
	#define MCPUL_CPUL7	7		;Low bits of phase U preload value
	#define MCPUL_CPUL7_OR	$80
	#define MCPUL_CPUL_OR	$f8

	EXTERN MCP0H.b		; Compare Phase O Preload Register High
	#define MCP0H_CP0H0	1		;Most Significant Bits of Compare 0 preload value
	#define MCP0H_CP0H0_OR	$02
	#define MCP0H_CP0H1	2		;Most Significant Bits of Compare 0 preload value
	#define MCP0H_CP0H1_OR	$04
	#define MCP0H_CP0H2	3		;Most Significant Bits of Compare 0 preload value
	#define MCP0H_CP0H2_OR	$08
	#define MCP0H_CP0H3	4		;Most Significant Bits of Compare 0 preload value
	#define MCP0H_CP0H3_OR	$10
	#define MCP0H_CP0H_OR	$1e

	EXTERN MCP0L.b		; Compare Phase O Preload Register Low

; Pwm Auto-Reload Timer (ART)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PWMDCR3.b		; Duty Cycle Register 3

	EXTERN PWMDCR2.b		; Duty Cycle Register 2

	EXTERN PWMDCR1.b		; Duty Cycle Register 1

	EXTERN PWMDCR0.b		; Duty Cycle Register 0

	EXTERN PWMCR.b		; PWM Control Register
	#define PWMCR_OP0	0		;PWM Output Polarity
	#define PWMCR_OP0_OR	$01
	#define PWMCR_OP1	1		;PWM Output Polarity
	#define PWMCR_OP1_OR	$02
	#define PWMCR_OP2	2		;PWM Output Polarity
	#define PWMCR_OP2_OR	$04
	#define PWMCR_OP3	3		;PWM Output Polarity
	#define PWMCR_OP3_OR	$08
	#define PWMCR_OP_OR	$0f
	#define PWMCR_OE0	4		;PWM Output Enable
	#define PWMCR_OE0_OR	$10
	#define PWMCR_OE1	5		;PWM Output Enable
	#define PWMCR_OE1_OR	$20
	#define PWMCR_OE2	6		;PWM Output Enable
	#define PWMCR_OE2_OR	$40
	#define PWMCR_OE3	7		;PWM Output Enable
	#define PWMCR_OE3_OR	$80
	#define PWMCR_OE_OR	$f0

	EXTERN ARTCSR.b		; ART Control/Status Register
	#define ARTCSR_OVF	0		;Overflow Flag
	#define ARTCSR_OVF_OR	$01
	#define ARTCSR_OIE	1		;Overflow Interrupt Enable
	#define ARTCSR_OIE_OR	$02
	#define ARTCSR_FCRL	2		;Force Counter Re-Load
	#define ARTCSR_FCRL_OR	$04
	#define ARTCSR_TCE	3		;Timer Counter Enable
	#define ARTCSR_TCE_OR	$08
	#define ARTCSR_CC0	4		;Counter Clock Control
	#define ARTCSR_CC0_OR	$10
	#define ARTCSR_CC1	5		;Counter Clock Control
	#define ARTCSR_CC1_OR	$20
	#define ARTCSR_CC2	6		;Counter Clock Control
	#define ARTCSR_CC2_OR	$40
	#define ARTCSR_CC_OR	$70
	#define ARTCSR_EXCL	7		;External Clock
	#define ARTCSR_EXCL_OR	$80

	EXTERN ARTCAR.b		; ART Counter Access Register

	EXTERN ARTARR.b		; ART Auto-Reload Register

	EXTERN ARTICCSR.b		; ART Input Capture Control/Status Register
	#define ARTICCSR_CF0	0		;Capture Flag
	#define ARTICCSR_CF0_OR	$01
	#define ARTICCSR_CF1	1		;Capture Flag
	#define ARTICCSR_CF1_OR	$02
	#define ARTICCSR_CF_OR	$03
	#define ARTICCSR_CIE0	2		;Capture Interrupt Enable
	#define ARTICCSR_CIE0_OR	$04
	#define ARTICCSR_CIE1	3		;Capture Interrupt Enable
	#define ARTICCSR_CIE1_OR	$08
	#define ARTICCSR_CIE_OR	$0c
	#define ARTICCSR_CS0	4		;Capture Sensitivity
	#define ARTICCSR_CS0_OR	$10
	#define ARTICCSR_CS1	5		;Capture Sensitivity
	#define ARTICCSR_CS1_OR	$20
	#define ARTICCSR_CS_OR	$30

	EXTERN ARTICR1.b		; ART Input Capture Register 1

	EXTERN ARTICR2.b		; ART Input Capture Register 2

; Operational Amplifier (OA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN OACSR.b		; Control/Status Register
	#define OACSR_HIGHGAIN	3		;Gain range selection
	#define OACSR_HIGHGAIN_OR	$08
	#define OACSR_OAON	4		;Amplifier On
	#define OACSR_OAON_OR	$10
	#define OACSR_AVGCMP	5		;Average Compensation
	#define OACSR_AVGCMP_OR	$20
	#define OACSR_OFFCMP	6		;Offset Compensation
	#define OACSR_OFFCMP_OR	$40
	#define OACSR_CMPOVR	7		;Compensation Completed
	#define OACSR_CMPOVR_OR	$80

	#endif ; __ST7FMC1K2__
