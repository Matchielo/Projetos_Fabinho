; ST72389B.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST72389B__
; do nothing
	#else
	#define __ST72389B__ 1

; ST72389B


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
	#define ISPR1_I0_5	2		;External IT 3 Priority Level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;External IT 3 Priority Level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;CAN IT Priority Level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;CAN IT Priority Level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;SPI IT Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;SPI IT Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;Timer A IT Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;Timer A IT Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_9	2		;Timer B IT Priority Level
	#define ISPR2_I0_9_OR	$04
	#define ISPR2_I1_9	3		;Timer B IT Priority Level
	#define ISPR2_I1_9_OR	$08
	#define ISPR2_I_9_OR	$0c
	#define ISPR2_I0_10	4		;SCI IT Priority Level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;SCI IT Priority Level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30
	#define ISPR2_I0_11	6		;EEPROM IT Priority Level
	#define ISPR2_I0_11_OR	$40
	#define ISPR2_I1_11	7		;EEPROM IT Priority Level
	#define ISPR2_I1_11_OR	$80
	#define ISPR2_I_11_OR	$c0

	EXTERN ISPR3.b		; Interrupt Software Priority Register 3
	#define ISPR3_I0_13	2		;PWM ART IT Priority Level
	#define ISPR3_I0_13_OR	$04
	#define ISPR3_I1_13	3		;PWM ART IT Priority Level
	#define ISPR3_I1_13_OR	$08
	#define ISPR3_I_13_OR	$0c

; Miscellaneous 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR1.b		; Miscellaneous Register 1
	#define MISCR1_NMIE	0		;NMI Enable
	#define MISCR1_NMIE_OR	$01
	#define MISCR1_NMIS	1		;NMI Sensitivity
	#define MISCR1_NMIS_OR	$02
	#define MISCR1_IS20	4		;EI2/EI4 Sensibility
	#define MISCR1_IS20_OR	$10
	#define MISCR1_IS21	5		;EI2/EI4 Sensibility
	#define MISCR1_IS21_OR	$20
	#define MISCR1_IS2_OR	$30
	#define MISCR1_IS10	6		;EI1/EI3/EI5 Sensibility
	#define MISCR1_IS10_OR	$40
	#define MISCR1_IS11	7		;EI1/EI3/EI5 Sensibility
	#define MISCR1_IS11_OR	$80
	#define MISCR1_IS1_OR	$c0

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

; Main Clock Control/Status
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MCCSR.b		; Main Clock Control/Status Register
	#define MCCSR_OIF	0		;Oscillator Interrupt Flag
	#define MCCSR_OIF_OR	$01
	#define MCCSR_OIE	1		;Oscillator Interrupt Enable
	#define MCCSR_OIE_OR	$02
	#define MCCSR_TB0	2		;Time Base Control
	#define MCCSR_TB0_OR	$04
	#define MCCSR_TB1	3		;Time Base Control
	#define MCCSR_TB1_OR	$08
	#define MCCSR_TB_OR	$0c
	#define MCCSR_CP0	5		;CPU Clock Prescaler
	#define MCCSR_CP0_OR	$20
	#define MCCSR_CP1	6		;CPU Clock Prescaler
	#define MCCSR_CP1_OR	$40
	#define MCCSR_CP_OR	$60
	#define MCCSR_SMS	7		;Slow Mode Select
	#define MCCSR_SMS_OR	$80

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

; Miscellaneous 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR2.b		; Miscellaneous Register 2
	#define MISCR2_SSI	0		;Internal Mode
	#define MISCR2_SSI_OR	$01
	#define MISCR2_SSM	1		;Mode Selection
	#define MISCR2_SSM_OR	$02
	#define MISCR2_BC0	4		;Beep Control
	#define MISCR2_BC0_OR	$10
	#define MISCR2_BC1	5		;Beep Control
	#define MISCR2_BC1_OR	$20
	#define MISCR2_BC_OR	$30
	#define MISCR2_MCO	6		;Main clock-out control
	#define MISCR2_MCO_OR	$40

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

; Serial Communications Interface (SCI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SCISR.b		; Status Register
	#define SCISR_FE	1		;Framing Error
	#define SCISR_FE_OR	$02
	#define SCISR_NF	2		;Noise Flag
	#define SCISR_NF_OR	$04
	#define SCISR_OR	3		;Overrun Error
	#define SCISR_OR_OR	$08
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

	EXTERN SCICR1.b		; Control Register 1
	#define SCICR1_WAKE	3		;Wake-up Method
	#define SCICR1_WAKE_OR	$08
	#define SCICR1_M	4		;Word Length
	#define SCICR1_M_OR	$10
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

	EXTERN SCIERPR.b		; Ext. Receive Prescaler Reg.

	EXTERN SCIETPR.b		; Ext. Transmit Prescaler Reg.

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

	#endif ; __ST72389B__
