; ST72754J6.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST72754J6__
; do nothing
	#else
	#define __ST72754J6__ 1

; ST72754J6


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBDDR.b		; Data Direction Register

; Port C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PCDR.b		; Data Register

	EXTERN PCDDR.b		; Data Direction Register

; Port D
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PDDR.b		; Data Register

	EXTERN PDDDR.b		; Data Direction Register

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

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR.b		; Miscellaneous Register
	#define MISCR_ITAITE	0		;ITA Interrupt
	#define MISCR_ITAITE_OR	$01
	#define MISCR_ITBITE	1		;ITB Interrupt
	#define MISCR_ITBITE_OR	$02
	#define MISCR_ITALAT	2		;Falling Edge Detector Latch
	#define MISCR_ITALAT_OR	$04
	#define MISCR_ITBLAT	3		;Falling Edge Detector Latch
	#define MISCR_ITBLAT_OR	$08
	#define MISCR_FAST	4		;Fast Mode
	#define MISCR_FAST_OR	$10
	#define MISCR_HSYNCDIVEN	5		;HSYNCDIV
	#define MISCR_HSYNCDIVEN_OR	$20
	#define MISCR_FLY_SYN	6		;Flyback or synchro switch
	#define MISCR_FLY_SYN_OR	$40

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
	#define ADCCSR_CH3	3		;Channel Selection
	#define ADCCSR_CH3_OR	$08
	#define ADCCSR_CH_OR	$0f
	#define ADCCSR_ADON	5		;A/D Converter
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

; DDC1/2B Interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN DCR.b		; DDC1/2B Control Register
	#define DCR_HWPE	0		;Peripheral Enable
	#define DCR_HWPE_OR	$01
	#define DCR_WP	1		;Write Protect
	#define DCR_WP_OR	$02
	#define DCR_CF0	2		;Configuration bits
	#define DCR_CF0_OR	$04
	#define DCR_CF1	3		;Configuration bits
	#define DCR_CF1_OR	$08
	#define DCR_CF2	6		;Configuration bits
	#define DCR_CF2_OR	$40
	#define DCR_CF_OR	$4c
	#define DCR_EDE	4		;End of Download interrupt Enable
	#define DCR_EDE_OR	$10
	#define DCR_EDF	5		;End of Download interrupt Flag
	#define DCR_EDF_OR	$20

	EXTERN AHR.b		; DDC1/2B Address Pointer High Register

; Timing Measurement Unit(TMU)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TMUCSR.b		; Control Status Register
	#define TMUCSR_START	0		;Start measurement
	#define TMUCSR_START_OR	$01
	#define TMUCSR_H_V	1		;Horizontal or Vertical Measurement
	#define TMUCSR_H_V_OR	$02
	#define TMUCSR_T18	2		;MSB T1 Counter
	#define TMUCSR_T18_OR	$04
	#define TMUCSR_T19	3		;MSB T1 Counter
	#define TMUCSR_T19_OR	$08
	#define TMUCSR_T110	4		;MSB T1 Counter
	#define TMUCSR_T110_OR	$10
	#define TMUCSR_T1_OR	$1c
	#define TMUCSR_T28	5		;MSB T2 Counter
	#define TMUCSR_T28_OR	$20
	#define TMUCSR_T29	6		;MSB T2 Counter
	#define TMUCSR_T29_OR	$40
	#define TMUCSR_T210	7		;MSB T2 Counter
	#define TMUCSR_T210_OR	$80
	#define TMUCSR_T2_OR	$e0

	EXTERN TMUT1CR.b		; T1 Counter Register

	EXTERN TMUT2CR.b		; T2 Counter Register

; 16-Bit Timer
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

	EXTERN TSR.b		; Status Register
	#define TSR_OCF2	3		;Output Compare Flag 2
	#define TSR_OCF2_OR	$08
	#define TSR_ICF2	4		;Input Capture Flag 2
	#define TSR_ICF2_OR	$10
	#define TSR_TOF	5		;Timer Overflow
	#define TSR_TOF_OR	$20
	#define TSR_OCF1	6		;Output Compare Flag 1
	#define TSR_OCF1_OR	$40
	#define TSR_ICF1	7		;Input Capture Flag 1
	#define TSR_ICF1_OR	$80

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

; D/A Converter (DAC) with PWM outputs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PWM1.b		; Channel 1 PWM Register
	#define PWM1_POL	6		;Polarity Bit
	#define PWM1_POL_OR	$40
	#define PWM1_P0	0		;Pulse Binary Weight for Channel 1
	#define PWM1_P0_OR	$01
	#define PWM1_P1	1		;Pulse Binary Weight for Channel 1
	#define PWM1_P1_OR	$02
	#define PWM1_P2	2		;Pulse Binary Weight for Channel 1
	#define PWM1_P2_OR	$04
	#define PWM1_P3	3		;Pulse Binary Weight for Channel 1
	#define PWM1_P3_OR	$08
	#define PWM1_P4	4		;Pulse Binary Weight for Channel 1
	#define PWM1_P4_OR	$10
	#define PWM1_P5	5		;Pulse Binary Weight for Channel 1
	#define PWM1_P5_OR	$20
	#define PWM1_P_OR	$3f

	EXTERN BRM21.b		; Channel 2+1 BRM Register
	#define BRM21_B4	4		;BRM Bits (Channel 2)
	#define BRM21_B4_OR	$10
	#define BRM21_B5	5		;BRM Bits (Channel 2)
	#define BRM21_B5_OR	$20
	#define BRM21_B6	6		;BRM Bits (Channel 2)
	#define BRM21_B6_OR	$40
	#define BRM21_B7	7		;BRM Bits (Channel 2)
	#define BRM21_B7_OR	$80
	#define BRM21_B_4_7_OR	$f0
	#define BRM21_B0	0		;BRM Bits (Channel 1)
	#define BRM21_B0_OR	$01
	#define BRM21_B1	1		;BRM Bits (Channel 1)
	#define BRM21_B1_OR	$02
	#define BRM21_B2	2		;BRM Bits (Channel 1)
	#define BRM21_B2_OR	$04
	#define BRM21_B3	3		;BRM Bits (Channel 1)
	#define BRM21_B3_OR	$08
	#define BRM21_B_0_3_OR	$0f

	EXTERN PWM2.b		; Channel 2 PWM Register
	#define PWM2_POL	6		;Polarity Bit
	#define PWM2_POL_OR	$40
	#define PWM2_P0	0		;Pulse Binary Weight for Channel 2
	#define PWM2_P0_OR	$01
	#define PWM2_P1	1		;Pulse Binary Weight for Channel 2
	#define PWM2_P1_OR	$02
	#define PWM2_P2	2		;Pulse Binary Weight for Channel 2
	#define PWM2_P2_OR	$04
	#define PWM2_P3	3		;Pulse Binary Weight for Channel 2
	#define PWM2_P3_OR	$08
	#define PWM2_P4	4		;Pulse Binary Weight for Channel 2
	#define PWM2_P4_OR	$10
	#define PWM2_P5	5		;Pulse Binary Weight for Channel 2
	#define PWM2_P5_OR	$20
	#define PWM2_P_OR	$3f

	EXTERN PWM3.b		; Channel 3 PWM Register
	#define PWM3_POL	6		;Polarity Bit
	#define PWM3_POL_OR	$40
	#define PWM3_P0	0		;Pulse Binary Weight for Channel 3
	#define PWM3_P0_OR	$01
	#define PWM3_P1	1		;Pulse Binary Weight for Channel 3
	#define PWM3_P1_OR	$02
	#define PWM3_P2	2		;Pulse Binary Weight for Channel 3
	#define PWM3_P2_OR	$04
	#define PWM3_P3	3		;Pulse Binary Weight for Channel 3
	#define PWM3_P3_OR	$08
	#define PWM3_P4	4		;Pulse Binary Weight for Channel 3
	#define PWM3_P4_OR	$10
	#define PWM3_P5	5		;Pulse Binary Weight for Channel 3
	#define PWM3_P5_OR	$20
	#define PWM3_P_OR	$3f

	EXTERN BRM43.b		; Channel 4+3 BRM Register
	#define BRM43_B4	4		;BRM Bits (Channel 4)
	#define BRM43_B4_OR	$10
	#define BRM43_B5	5		;BRM Bits (Channel 4)
	#define BRM43_B5_OR	$20
	#define BRM43_B6	6		;BRM Bits (Channel 4)
	#define BRM43_B6_OR	$40
	#define BRM43_B7	7		;BRM Bits (Channel 4)
	#define BRM43_B7_OR	$80
	#define BRM43_B_4_7_OR	$f0
	#define BRM43_B0	0		;BRM Bits (Channel 3)
	#define BRM43_B0_OR	$01
	#define BRM43_B1	1		;BRM Bits (Channel 3)
	#define BRM43_B1_OR	$02
	#define BRM43_B2	2		;BRM Bits (Channel 3)
	#define BRM43_B2_OR	$04
	#define BRM43_B3	3		;BRM Bits (Channel 3)
	#define BRM43_B3_OR	$08
	#define BRM43_B_0_3_OR	$0f

	EXTERN PWM4.b		; Channel 4 PWM Register
	#define PWM4_POL	6		;Polarity Bit
	#define PWM4_POL_OR	$40
	#define PWM4_P0	0		;Pulse Binary Weight for Channel 4
	#define PWM4_P0_OR	$01
	#define PWM4_P1	1		;Pulse Binary Weight for Channel 4
	#define PWM4_P1_OR	$02
	#define PWM4_P2	2		;Pulse Binary Weight for Channel 4
	#define PWM4_P2_OR	$04
	#define PWM4_P3	3		;Pulse Binary Weight for Channel 4
	#define PWM4_P3_OR	$08
	#define PWM4_P4	4		;Pulse Binary Weight for Channel 4
	#define PWM4_P4_OR	$10
	#define PWM4_P5	5		;Pulse Binary Weight for Channel 4
	#define PWM4_P5_OR	$20
	#define PWM4_P_OR	$3f

	EXTERN PWM5.b		; Channel 5 PWM Register
	#define PWM5_POL	6		;Polarity Bit
	#define PWM5_POL_OR	$40
	#define PWM5_P0	0		;Pulse Binary Weight for Channel 5
	#define PWM5_P0_OR	$01
	#define PWM5_P1	1		;Pulse Binary Weight for Channel 5
	#define PWM5_P1_OR	$02
	#define PWM5_P2	2		;Pulse Binary Weight for Channel 5
	#define PWM5_P2_OR	$04
	#define PWM5_P3	3		;Pulse Binary Weight for Channel 5
	#define PWM5_P3_OR	$08
	#define PWM5_P4	4		;Pulse Binary Weight for Channel 5
	#define PWM5_P4_OR	$10
	#define PWM5_P5	5		;Pulse Binary Weight for Channel 5
	#define PWM5_P5_OR	$20
	#define PWM5_P_OR	$3f

	EXTERN BRM65.b		; Channel 5+6 BRM Register
	#define BRM65_B4	4		;BRM Bits (Channel 6)
	#define BRM65_B4_OR	$10
	#define BRM65_B5	5		;BRM Bits (Channel 6)
	#define BRM65_B5_OR	$20
	#define BRM65_B6	6		;BRM Bits (Channel 6)
	#define BRM65_B6_OR	$40
	#define BRM65_B7	7		;BRM Bits (Channel 6)
	#define BRM65_B7_OR	$80
	#define BRM65_B_4_7_OR	$f0
	#define BRM65_B0	0		;BRM Bits (Channel 5)
	#define BRM65_B0_OR	$01
	#define BRM65_B1	1		;BRM Bits (Channel 5)
	#define BRM65_B1_OR	$02
	#define BRM65_B2	2		;BRM Bits (Channel 5)
	#define BRM65_B2_OR	$04
	#define BRM65_B3	3		;BRM Bits (Channel 5)
	#define BRM65_B3_OR	$08
	#define BRM65_B_0_3_OR	$0f

	EXTERN PWM6.b		; Channel 6 PWM Register
	#define PWM6_POL	6		;Polarity Bit
	#define PWM6_POL_OR	$40
	#define PWM6_P0	0		;Pulse Binary Weight for Channel 6
	#define PWM6_P0_OR	$01
	#define PWM6_P1	1		;Pulse Binary Weight for Channel 6
	#define PWM6_P1_OR	$02
	#define PWM6_P2	2		;Pulse Binary Weight for Channel 6
	#define PWM6_P2_OR	$04
	#define PWM6_P3	3		;Pulse Binary Weight for Channel 6
	#define PWM6_P3_OR	$08
	#define PWM6_P4	4		;Pulse Binary Weight for Channel 6
	#define PWM6_P4_OR	$10
	#define PWM6_P5	5		;Pulse Binary Weight for Channel 6
	#define PWM6_P5_OR	$20
	#define PWM6_P_OR	$3f

	EXTERN PWM7.b		; Channel 7 PWM Register
	#define PWM7_POL	6		;Polarity Bit
	#define PWM7_POL_OR	$40
	#define PWM7_P0	0		;Pulse Binary Weight for Channel 7
	#define PWM7_P0_OR	$01
	#define PWM7_P1	1		;Pulse Binary Weight for Channel 7
	#define PWM7_P1_OR	$02
	#define PWM7_P2	2		;Pulse Binary Weight for Channel 7
	#define PWM7_P2_OR	$04
	#define PWM7_P3	3		;Pulse Binary Weight for Channel 7
	#define PWM7_P3_OR	$08
	#define PWM7_P4	4		;Pulse Binary Weight for Channel 7
	#define PWM7_P4_OR	$10
	#define PWM7_P5	5		;Pulse Binary Weight for Channel 7
	#define PWM7_P5_OR	$20
	#define PWM7_P_OR	$3f

	EXTERN BRM87.b		; Channel 7+8 BRM Register
	#define BRM87_B4	4		;BRM Bits (Channel 8)
	#define BRM87_B4_OR	$10
	#define BRM87_B5	5		;BRM Bits (Channel 8)
	#define BRM87_B5_OR	$20
	#define BRM87_B6	6		;BRM Bits (Channel 8)
	#define BRM87_B6_OR	$40
	#define BRM87_B7	7		;BRM Bits (Channel 8)
	#define BRM87_B7_OR	$80
	#define BRM87_B_4_7_OR	$f0
	#define BRM87_B0	0		;BRM Bits (Channel 7)
	#define BRM87_B0_OR	$01
	#define BRM87_B1	1		;BRM Bits (Channel 7)
	#define BRM87_B1_OR	$02
	#define BRM87_B2	2		;BRM Bits (Channel 7)
	#define BRM87_B2_OR	$04
	#define BRM87_B3	3		;BRM Bits (Channel 7)
	#define BRM87_B3_OR	$08
	#define BRM87_B_0_3_OR	$0f

	EXTERN PWM8.b		; Channel 8 PWM Register
	#define PWM8_POL	6		;Polarity Bit
	#define PWM8_POL_OR	$40
	#define PWM8_P0	0		;Pulse Binary Weight for Channel 8
	#define PWM8_P0_OR	$01
	#define PWM8_P1	1		;Pulse Binary Weight for Channel 8
	#define PWM8_P1_OR	$02
	#define PWM8_P2	2		;Pulse Binary Weight for Channel 8
	#define PWM8_P2_OR	$04
	#define PWM8_P3	3		;Pulse Binary Weight for Channel 8
	#define PWM8_P3_OR	$08
	#define PWM8_P4	4		;Pulse Binary Weight for Channel 8
	#define PWM8_P4_OR	$10
	#define PWM8_P5	5		;Pulse Binary Weight for Channel 8
	#define PWM8_P5_OR	$20
	#define PWM8_P_OR	$3f

	EXTERN PWMCR.b		; Output Enable Register

; SYNC Processor (SYNC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CFGR.b		; CONFIGURATION REGISTER
	#define CFGR_Q0	0		;LSB of VGENR
	#define CFGR_Q0_OR	$01
	#define CFGR_Q1	1		;LSB of VGENR
	#define CFGR_Q1_OR	$02
	#define CFGR_Q2	2		;LSB of VGENR
	#define CFGR_Q2_OR	$04
	#define CFGR_Q_OR	$07
	#define CFGR_VEXT	3		;VSYNCO pulse
	#define CFGR_VEXT_OR	$08
	#define CFGR__2FHINH	4		;Inhibition of Pre/Post equalization
	#define CFGR__2FHINH_OR	$10
	#define CFGR_VACQ	6		;Vertical Sync Analyser Mode
	#define CFGR_VACQ_OR	$40
	#define CFGR_HACQ	7		;Horizontal Sync Analyser Mode
	#define CFGR_HACQ_OR	$80

	EXTERN MCR.b		; MUX CONTROL REGISTER
	#define MCR_VOP	1		;Vertical Polarity Control
	#define MCR_VOP_OR	$02
	#define MCR_HS0	2		;Horizontal Signal Selection
	#define MCR_HS0_OR	$04
	#define MCR_HS1	3		;Horizontal Signal Selection
	#define MCR_HS1_OR	$08
	#define MCR_HS_OR	$0c
	#define MCR_SCI0	4		;HSYNCI/CSYNCI selection
	#define MCR_SCI0_OR	$10
	#define MCR_FBSEL	5		;VSYNCO/HSYNCO or VFBACK/HFBACK analysis
	#define MCR_FBSEL_OR	$20
	#define MCR_BP0	6		;Back Porch Pulse Control
	#define MCR_BP0_OR	$40
	#define MCR_BP1	7		;Back Porch Pulse Control
	#define MCR_BP1_OR	$80
	#define MCR_BP_OR	$c0

	EXTERN CCR.b		; COUNTER CONTROL REGISTER
	#define CCR_CV0	0		;Counter Captured Value
	#define CCR_CV0_OR	$01
	#define CCR_CV1	1		;Counter Captured Value
	#define CCR_CV1_OR	$02
	#define CCR_CV2	2		;Counter Captured Value
	#define CCR_CV2_OR	$04
	#define CCR_CV3	3		;Counter Captured Value
	#define CCR_CV3_OR	$08
	#define CCR_CV4	4		;Counter Captured Value
	#define CCR_CV4_OR	$10
	#define CCR_CV_OR	$1f
	#define CCR_LCV0	5		;VSYNCO Extraction Control
	#define CCR_LCV0_OR	$20
	#define CCR_LCV1	6		;VSYNCO Extraction Control
	#define CCR_LCV1_OR	$40
	#define CCR_LCV_OR	$60
	#define CCR_PSCD	7		;Prescaler Enable bit
	#define CCR_PSCD_OR	$80

	EXTERN POLR.b		; POLARITY REGISTER
	#define POLR_BLKINV	0		;Programmable blanking polarity
	#define POLR_BLKINV_OR	$01
	#define POLR_CLPINV	1		;Programmable ClampOut pulse polarity
	#define POLR_CLPINV_OR	$02
	#define POLR_VCORDIS	2		;Extension Disable Signal
	#define POLR_VCORDIS_OR	$04
	#define POLR_HVSEL	3		;Alternate Sync Input Select
	#define POLR_HVSEL_OR	$08
	#define POLR__2FHDET	4		;Detection of Pre/Post Equalization pulses
	#define POLR__2FHDET_OR	$10
	#define POLR_VPOL	5		;Vertical Sync Polarity
	#define POLR_VPOL_OR	$20
	#define POLR_SOG	7		;Sync On Green Window
	#define POLR_SOG_OR	$80

	EXTERN LATR.b		; LATCH REGISTER
	#define LATR__2FHLAT	0		;Equalization Pulses Latch
	#define LATR__2FHLAT_OR	$01
	#define LATR_DWNLAT	1		;Detection of minimum value of 5 bit up/down counter
	#define LATR_DWNLAT_OR	$02
	#define LATR_UPLAT	2		;Detection of maximum value of 5 bit up/down counter
	#define LATR_UPLAT_OR	$04
	#define LATR_VFLY	3		;Detection of pulses on VFBACK
	#define LATR_VFLY_OR	$08
	#define LATR_HFLY	4		;Detection of pulses on HFBACK
	#define LATR_HFLY_OR	$10
	#define LATR_VSYN	5		;Detection of pulses on VSYNCI
	#define LATR_VSYN_OR	$20
	#define LATR_HSYN	6		;Detection of pulses on HSYNCI
	#define LATR_HSYN_OR	$40
	#define LATR_CSYN	7		;Detection of pulses on CSYNCI
	#define LATR_CSYN_OR	$80

	EXTERN HGENR.b		; HORIZONTAL SYNC GENERATOR REGISTER

	EXTERN VGENR.b		; VERTICAL SYNC GENERATOR REGISTER

	EXTERN ENR.b		; ENABLE REGISTER
	#define ENR_VSIN1	0		;VSIN1 pin level
	#define ENR_VSIN1_OR	$01
	#define ENR_HSIN1	1		;HSIN1 pin level
	#define ENR_HSIN1_OR	$02
	#define ENR_HINH	2		;HSYNCO Blanking
	#define ENR_HINH_OR	$04
	#define ENR__2FHEN	3		;VSYNCO Extension
	#define ENR__2FHEN_OR	$08
	#define ENR_HVGEN	4		;Sync Generation function
	#define ENR_HVGEN_OR	$10
	#define ENR_BLKEN	5		;Blanking Output
	#define ENR_BLKEN_OR	$20
	#define ENR_CLMPEN	6		;Clamping or Moire output enable
	#define ENR_CLMPEN_OR	$40
	#define ENR_SYNOP	7		;HSYNCO,VSYNCO outputs enable
	#define ENR_SYNOP_OR	$80

; DDC/CI Interface
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CR.b		; DDC/CI Control Register
	#define CR_ITE	0		;Interrupt Enable
	#define CR_ITE_OR	$01
	#define CR_STOP	1		;Release I2C bus
	#define CR_STOP_OR	$02
	#define CR_ACK	2		;Acknowledge enable
	#define CR_ACK_OR	$04
	#define CR_EDDCEN	4		;Enable Default address detection
	#define CR_EDDCEN_OR	$10
	#define CR_PE	5		;Peripheral Enable
	#define CR_PE_OR	$20

	EXTERN SR1.b		; DDC/CI Status Register 1
	#define SR1_ADSL	2		;Address Matched (Slave Mode)
	#define SR1_ADSL_OR	$04
	#define SR1_BTF	3		;Byte Transfer Finished
	#define SR1_BTF_OR	$08
	#define SR1_BUSY	4		;Bus Busy
	#define SR1_BUSY_OR	$10
	#define SR1_TRA	5		;Transmitter/Receiver
	#define SR1_TRA_OR	$20
	#define SR1_EVF	7		;Event Flag
	#define SR1_EVF_OR	$80

	EXTERN SR2.b		; DDC/CI Status Register 2
	#define SR2_EDDCF	0		;Addressed with default address
	#define SR2_EDDCF_OR	$01
	#define SR2_BERR	1		;Bus Error
	#define SR2_BERR_OR	$02
	#define SR2_STOPF	3		;Stop Detection
	#define SR2_STOPF_OR	$08
	#define SR2_AF	4		;Acknowledge Failure
	#define SR2_AF_OR	$10

	EXTERN OAR.b		; DDC/CI (7 bits) Slave Address Register

	EXTERN DR.b		; DDC/CI Data Register

; I2C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN I2CDR.b		; Data Register

	EXTERN I2CCCR.b		; Clock Control Register
	#define I2CCCR_CC0	0		;7-bit Clock Divider
	#define I2CCCR_CC0_OR	$01
	#define I2CCCR_CC1	1		;7-bit Clock Divider
	#define I2CCCR_CC1_OR	$02
	#define I2CCCR_CC2	2		;7-bit Clock Divider
	#define I2CCCR_CC2_OR	$04
	#define I2CCCR_CC3	3		;7-bit Clock Divider
	#define I2CCCR_CC3_OR	$08
	#define I2CCCR_CC4	4		;7-bit Clock Divider
	#define I2CCCR_CC4_OR	$10
	#define I2CCCR_CC5	5		;7-bit Clock Divider
	#define I2CCCR_CC5_OR	$20
	#define I2CCCR_CC6	6		;7-bit Clock Divider
	#define I2CCCR_CC6_OR	$40
	#define I2CCCR_CC_OR	$7f
	#define I2CCCR_FM_SM	7		;Fast Mode Select
	#define I2CCCR_FM_SM_OR	$80

	EXTERN I2CSR2.b		; Status Register 2
	#define I2CSR2_BERR	1		;Bus Error
	#define I2CSR2_BERR_OR	$02
	#define I2CSR2_AF	4		;Acknowledge Failure
	#define I2CSR2_AF_OR	$10

	EXTERN I2CSR1.b		; Status Register 1
	#define I2CSR1_SB	0		;Start Bit
	#define I2CSR1_SB_OR	$01
	#define I2CSR1_M_SL	1		;Master/Slave Mode
	#define I2CSR1_M_SL_OR	$02
	#define I2CSR1_BTF	3		;Byte Transfer
	#define I2CSR1_BTF_OR	$08
	#define I2CSR1_BUSY	4		;Bus Busy
	#define I2CSR1_BUSY_OR	$10
	#define I2CSR1_TRA	5		;Transmitter/Receiver
	#define I2CSR1_TRA_OR	$20
	#define I2CSR1_EVF	7		;Event Flag
	#define I2CSR1_EVF_OR	$80

	EXTERN I2CCR.b		; Control Register
	#define I2CCR_ITE	0		;I2C Interrupt
	#define I2CCR_ITE_OR	$01
	#define I2CCR_STOP	1		;Generation of a Stop Condition
	#define I2CCR_STOP_OR	$02
	#define I2CCR_ACK	2		;Acknowledge
	#define I2CCR_ACK_OR	$04
	#define I2CCR_START	3		;Generation of a Start Condition
	#define I2CCR_START_OR	$08
	#define I2CCR_PE	5		;Peripheral I2C
	#define I2CCR_PE_OR	$20

	#endif ; __ST72754J6__
