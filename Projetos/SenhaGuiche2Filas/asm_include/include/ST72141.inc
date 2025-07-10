; ST72141.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST72141__
; do nothing
	#else
	#define __ST72141__ 1

; ST72141


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

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR.b		; Miscellaneous Register
	#define MISCR_SMS	0		;Slow Mode Select
	#define MISCR_SMS_OR	$01
	#define MISCR_IS00	1		;EI1: PB External Interrupt sensitivity
	#define MISCR_IS00_OR	$02
	#define MISCR_IS01	2		;EI1: PB External Interrupt sensitivity
	#define MISCR_IS01_OR	$04
	#define MISCR_IS0_OR	$06
	#define MISCR_IS10	3		;EI0: PA External Interrupt sensitivity
	#define MISCR_IS10_OR	$08
	#define MISCR_IS11	4		;EI0: PA External Interrupt sensitivity
	#define MISCR_IS11_OR	$10
	#define MISCR_IS1_OR	$18
	#define MISCR_SSI	5		;/SS Internal mode
	#define MISCR_SSI_OR	$20
	#define MISCR_SSM	6		;/SS Mode Selection
	#define MISCR_SSM_OR	$40
	#define MISCR_XT16	7		;MTC & SPI Clock Selection
	#define MISCR_XT16_OR	$80

; Serial Peripheral Interface (SPI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SPIDR.b		; Data I/O Register

	EXTERN SPICR.b		; Control Register
	#define SPICR_SPR0	0		;Baud Rate
	#define SPICR_SPR0_OR	$01
	#define SPICR_SPR1	1		;Baud Rate
	#define SPICR_SPR1_OR	$02
	#define SPICR_SPR_OR	$03
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

	EXTERN SPISR.b		; Status Register

; WatchDog Timer
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

	EXTERN WDGSR.b		; Status Register
	#define WDGSR_WDOGF	0		;WDOGF Flag
	#define WDGSR_WDOGF_OR	$01

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

	EXTERN TASR.b		; Status Register
	#define TASR_OCF2	3		;Output Compare Flag 2
	#define TASR_OCF2_OR	$08
	#define TASR_ICF2	4		;Input Capture Flag 2
	#define TASR_ICF2_OR	$10
	#define TASR_TOF	5		;Timer Overflow
	#define TASR_TOF_OR	$20
	#define TASR_OCF1	6		;Output Compare Flag 1
	#define TASR_OCF1_OR	$40
	#define TASR_ICF1	7		;Input Capture Flag 1
	#define TASR_ICF1_OR	$80

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

; 16-Bit Timer B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TBCR2.b		; Control Register 2
	#define TBCR2_EXEDG	0		;External Clock Edge
	#define TBCR2_EXEDG_OR	$01
	#define TBCR2_IEDG2	1		;Input Edge 2
	#define TBCR2_IEDG2_OR	$02
	#define TBCR2_CC0	2		;Clock Control
	#define TBCR2_CC0_OR	$04
	#define TBCR2_CC1	3		;Clock Control
	#define TBCR2_CC1_OR	$08
	#define TBCR2_CC_OR	$0c
	#define TBCR2_PWM	4		;Pulse Width Modulation
	#define TBCR2_PWM_OR	$10
	#define TBCR2_OPM	5		;One Pulse Mode
	#define TBCR2_OPM_OR	$20
	#define TBCR2_OC2E	6		;Output Compare 2 Output Pin
	#define TBCR2_OC2E_OR	$40
	#define TBCR2_OC1E	7		;Output Compare 1 Output Pin
	#define TBCR2_OC1E_OR	$80

	EXTERN TBCR1.b		; Control Register 1
	#define TBCR1_OLVL1	0		;Output Level 1
	#define TBCR1_OLVL1_OR	$01
	#define TBCR1_IEDG1	1		;Input Edge 1
	#define TBCR1_IEDG1_OR	$02
	#define TBCR1_OLVL2	2		;Output Level 2
	#define TBCR1_OLVL2_OR	$04
	#define TBCR1_FOLV1	3		;Forced Output Compare 1
	#define TBCR1_FOLV1_OR	$08
	#define TBCR1_FOLV2	4		;Forced Output Compare 2
	#define TBCR1_FOLV2_OR	$10
	#define TBCR1_TOIE	5		;Timer Overflow Interrupt
	#define TBCR1_TOIE_OR	$20
	#define TBCR1_OCIE	6		;Output Compare Interrupt
	#define TBCR1_OCIE_OR	$40
	#define TBCR1_ICIE	7		;Input Capture Interrupt
	#define TBCR1_ICIE_OR	$80

	EXTERN TBSR.b		; Status Register
	#define TBSR_OCF2	3		;Output Compare Flag 2
	#define TBSR_OCF2_OR	$08
	#define TBSR_ICF2	4		;Input Capture Flag 2
	#define TBSR_ICF2_OR	$10
	#define TBSR_TOF	5		;Timer Overflow
	#define TBSR_TOF_OR	$20
	#define TBSR_OCF1	6		;Output Compare Flag 1
	#define TBSR_OCF1_OR	$40
	#define TBSR_ICF1	7		;Input Capture Flag 1
	#define TBSR_ICF1_OR	$80

	EXTERN TBIC1HR.b		; Input Capture 1 High Register

	EXTERN TBIC1LR.b		; Input Capture 1 Low Register

	EXTERN TBOC1HR.b		; Output Compare 1 High Register

	EXTERN TBOC1LR.b		; Output Compare 1 Low Register

	EXTERN TBCHR.b		; Counter High Register

	EXTERN TBCLR.b		; Counter Low Register

	EXTERN TBACHR.b		; Alternate Counter High Register

	EXTERN TBACLR.b		; Alternate Counter Low Register

	EXTERN TBIC2HR.b		; Input Capture 2 High Register

	EXTERN TBIC2LR.b		; Input Capture 2 Low Register

	EXTERN TBOC2HR.b		; Output Compare 2 High Register

	EXTERN TBOC2LR.b		; Output Compare 2 Low Register

; Motor Control
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MTIM.b		; Timer Counter Register

	EXTERN MZPRV.b		; Zn-1 Capture Register

	EXTERN MZREG.b		; Zn Capture Register

	EXTERN MCOMP.b		; Cn+1 Compare Register

	EXTERN MDREG.b		; Demagnetization Capture/Compare Register

	EXTERN MWGHT.b		; Weight Register

	EXTERN MPRSR.b		; Prescaler & Ratio Register
	#define MPRSR_ST0	0		;Step Ratio
	#define MPRSR_ST0_OR	$01
	#define MPRSR_ST1	1		;Step Ratio
	#define MPRSR_ST1_OR	$02
	#define MPRSR_ST2	2		;Step Ratio
	#define MPRSR_ST2_OR	$04
	#define MPRSR_ST3	3		;Step Ratio
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
	#define MIMR_CIM	0		;Commutation Interrupt Mask bit
	#define MIMR_CIM_OR	$01
	#define MIMR_DIM	1		;End Of Demagnetization Interrupt Mask bit
	#define MIMR_DIM_OR	$02
	#define MIMR_ZIM	2		;Back EMF Zero-crossing Interrupt Mask bit
	#define MIMR_ZIM_OR	$04
	#define MIMR_EIM	3		;Emergency Stop Interrupt Mask bit
	#define MIMR_EIM_OR	$08
	#define MIMR_OIM	4		;Multiplier Overflow Interrupt Mask bit
	#define MIMR_OIM_OR	$10
	#define MIMR_RIM	5		;Ratio update Interrupt Mask bit
	#define MIMR_RIM_OR	$20
	#define MIMR_CL	6		;Current Loop Comparator Value
	#define MIMR_CL_OR	$40
	#define MIMR_HST	7		;Hysteresis Comparator Value
	#define MIMR_HST_OR	$80

	EXTERN MISR.b		; Interrupt Status Register
	#define MISR_CI	0		;Commutation Interrupt flag
	#define MISR_CI_OR	$01
	#define MISR_DI	1		;End of Demagnetization Interrupt flag
	#define MISR_DI_OR	$02
	#define MISR_ZI	2		;BEMF Zero-crossing Interrupt flag
	#define MISR_ZI_OR	$04
	#define MISR_EI	3		;Emergency Stop Interrupt flag
	#define MISR_EI_OR	$08
	#define MISR_OI	4		;Multiplier Overflow Interrupt flag
	#define MISR_OI_OR	$10
	#define MISR_RMI	5		;Ratio Decrement Interrupt flag
	#define MISR_RMI_OR	$20
	#define MISR_RPI	6		;Ratio Increment Interrupt flag
	#define MISR_RPI_OR	$40

	EXTERN MCRA.b		; Control Register A
	#define MCRA_DCB	0		;Data Capture bit
	#define MCRA_DCB_OR	$01
	#define MCRA_CFF	1		;Current Feedback Filter
	#define MCRA_CFF_OR	$02
	#define MCRA_SWA	2		;Switched/Autoswitched Mode
	#define MCRA_SWA_OR	$04
	#define MCRA_V0C1	3		;Voltage/Current Mode
	#define MCRA_V0C1_OR	$08
	#define MCRA_DAC	4		;Direct Access to phase state Register
	#define MCRA_DAC_OR	$10
	#define MCRA_SR	5		;Sensor ON/Off
	#define MCRA_SR_OR	$20
	#define MCRA_RST	6		;Reset MTC Register
	#define MCRA_RST_OR	$40
	#define MCRA_MOE	7		;Output Enable bit
	#define MCRA_MOE_OR	$80

	EXTERN MCRB.b		; Control Register B
	#define MCRB_OS0	0		;Operating Output Mode Selection bit
	#define MCRB_OS0_OR	$01
	#define MCRB_OS1	1		;Operating Output Mode Selection bit
	#define MCRB_OS1_OR	$02
	#define MCRB_OS_OR	$03
	#define MCRB_OS2	2		;Operating Output Mode Selection bit
	#define MCRB_OS2_OR	$04
	#define MCRB_SDM	3		;Software Demagnetization event Mask bit
	#define MCRB_SDM_OR	$08
	#define MCRB_HDM	4		;Hardware Demagnetization event Mask bit
	#define MCRB_HDM_OR	$10
	#define MCRB_CPB	5		;Compare bit for Zero-crossing detection
	#define MCRB_CPB_OR	$20
	#define MCRB_VR0	6		;BEMF/demagnetization Reference threshold
	#define MCRB_VR0_OR	$40
	#define MCRB_VR1	7		;BEMF/demagnetization Reference threshold
	#define MCRB_VR1_OR	$80
	#define MCRB_VR_OR	$c0

	EXTERN MPHST.b		; Phase State Register
	#define MPHST_OO0	0		;Output Channel 0 On/Off bits
	#define MPHST_OO0_OR	$01
	#define MPHST_OO1	1		;Output Channel 1 On/Off bits
	#define MPHST_OO1_OR	$02
	#define MPHST_OO2	2		;Output Channel 2 On/Off bits
	#define MPHST_OO2_OR	$04
	#define MPHST_OO3	3		;Output Channel 3 On/Off bits
	#define MPHST_OO3_OR	$08
	#define MPHST_OO4	4		;Output Channel 4 On/Off bits
	#define MPHST_OO4_OR	$10
	#define MPHST_OO5	5		;Output Channel 5 On/Off bits
	#define MPHST_OO5_OR	$20
	#define MPHST_IS0	6		;Input Selection bits
	#define MPHST_IS0_OR	$40
	#define MPHST_IS1	7		;Input Selection bits
	#define MPHST_IS1_OR	$80
	#define MPHST_IS_OR	$c0

	EXTERN MPAR.b		; Output State Register
	#define MPAR_OE0	0		;Output 0 Parity Mode
	#define MPAR_OE0_OR	$01
	#define MPAR_OE1	1		;Output 1 Parity Mode
	#define MPAR_OE1_OR	$02
	#define MPAR_OE2	2		;Output 2 Parity Mode
	#define MPAR_OE2_OR	$04
	#define MPAR_OE3	3		;Output 3 Parity Mode
	#define MPAR_OE3_OR	$08
	#define MPAR_OE4	4		;Output 4 Parity Mode
	#define MPAR_OE4_OR	$10
	#define MPAR_OE5	5		;Output 5 Parity Mode
	#define MPAR_OE5_OR	$20
	#define MPAR_REO	6		;Read on Even or Odd channel bit
	#define MPAR_REO_OR	$40
	#define MPAR_ZVD	7		;Zero-crossing & Demagnetization edge polarity
	#define MPAR_ZVD_OR	$80

	EXTERN MPOL.b		; Output Polarity Register
	#define MPOL_MPOL0	0		;Output channel 0 Polarity
	#define MPOL_MPOL0_OR	$01
	#define MPOL_MPOL1	1		;Output channel 1 Polarity
	#define MPOL_MPOL1_OR	$02
	#define MPOL_MPOL2	2		;Output channel 2 Polarity
	#define MPOL_MPOL2_OR	$04
	#define MPOL_MPOL3	3		;Output channel 3 Polarity
	#define MPOL_MPOL3_OR	$08
	#define MPOL_MPOL4	4		;Output channel 4 Polarity
	#define MPOL_MPOL4_OR	$10
	#define MPOL_MPOL5	5		;Output channel 5 Polarity
	#define MPOL_MPOL5_OR	$20
	#define MPOL_OT0	6		;Off Time Selection
	#define MPOL_OT0_OR	$40
	#define MPOL_OT1	7		;Off Time Selection
	#define MPOL_OT1_OR	$80
	#define MPOL_OT_OR	$c0

; 8-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADCDR.b		; Data Register

	EXTERN ADCCSR.b		; Control/Status Register
	#define ADCCSR_CH0	0		;Channel Selection
	#define ADCCSR_CH0_OR	$01
	#define ADCCSR_CH1	1		;Channel Selection
	#define ADCCSR_CH1_OR	$02
	#define ADCCSR_CH2	2		;Channel Selection
	#define ADCCSR_CH2_OR	$04
	#define ADCCSR_CH_OR	$07
	#define ADCCSR_ADON	5		;A/D Converter
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

	#endif ; __ST72141__
