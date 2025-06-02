; ST72171.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST72171__
; do nothing
	#else
	#define __ST72171__ 1

; ST72171


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

; Operational Amplifier
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN OA1CR.b		; OA1 Control Register
	#define OA1CR_AZ1	7		;Autozero Mode
	#define OA1CR_AZ1_OR	$80
	#define OA1CR_G10	4		;Gain Control
	#define OA1CR_G10_OR	$10
	#define OA1CR_G11	5		;Gain Control
	#define OA1CR_G11_OR	$20
	#define OA1CR_G12	6		;Gain Control
	#define OA1CR_G12_OR	$40
	#define OA1CR_G1_OR	$70
	#define OA1CR_PS10	2		;Positive Input Select/Gain ad-just
	#define OA1CR_PS10_OR	$04
	#define OA1CR_PS11	3		;Positive Input Select/Gain ad-just
	#define OA1CR_PS11_OR	$08
	#define OA1CR_PS1_OR	$0c
	#define OA1CR_NS10	0		;Negative Input Select
	#define OA1CR_NS10_OR	$01
	#define OA1CR_NS11	1		;Negative Input Select
	#define OA1CR_NS11_OR	$02
	#define OA1CR_NS1_OR	$03

	EXTERN OA2CR.b		; OA2 Control Register
	#define OA2CR_AZ2	7		;Autozero Mode
	#define OA2CR_AZ2_OR	$80
	#define OA2CR_G20	4		;Gain Control
	#define OA2CR_G20_OR	$10
	#define OA2CR_G21	5		;Gain Control
	#define OA2CR_G21_OR	$20
	#define OA2CR_G22	6		;Gain Control
	#define OA2CR_G22_OR	$40
	#define OA2CR_G2_OR	$70
	#define OA2CR_PS20	2		;Positive Input Select/Gain ad-just
	#define OA2CR_PS20_OR	$04
	#define OA2CR_PS21	3		;Positive Input Select/Gain ad-just
	#define OA2CR_PS21_OR	$08
	#define OA2CR_PS2_OR	$0c
	#define OA2CR_NS20	0		;Negative Input Select
	#define OA2CR_NS20_OR	$01
	#define OA2CR_NS21	1		;Negative Input Select
	#define OA2CR_NS21_OR	$02
	#define OA2CR_NS2_OR	$03

	EXTERN OA3CR.b		; OA3 Control Register
	#define OA3CR_OA3ON	7		;OA3 on/off (low power)
	#define OA3CR_OA3ON_OR	$80

	EXTERN OAIRR.b		; Interrupt and Readout Register
	#define OAIRR_OA2ON	0		;OA2 on/off (low power)
	#define OAIRR_OA2ON_OR	$01
	#define OAIRR_OA2V	1		;OA2 output value (read only)
	#define OAIRR_OA2V_OR	$02
	#define OAIRR_OA2P	2		;OA2 interrupt polarity select
	#define OAIRR_OA2P_OR	$04
	#define OAIRR_OA2IE	3		;OA2 interrupt enable
	#define OAIRR_OA2IE_OR	$08
	#define OAIRR_OA1ON	4		;OA1 on/off (low power)
	#define OAIRR_OA1ON_OR	$10
	#define OAIRR_OA1V	5		;OA1 output value(read only)
	#define OAIRR_OA1V_OR	$20
	#define OAIRR_OA1P	6		;OA1 interrupt polarity select
	#define OAIRR_OA1P_OR	$40
	#define OAIRR_OA1IE	7		;OA1 interrupt
	#define OAIRR_OA1IE_OR	$80

	EXTERN OAVRCR.b		; Voltage Reference Control Register
	#define OAVRCR_VR2E	7		;VR2 Enable
	#define OAVRCR_VR2E_OR	$80
	#define OAVRCR_VR20	4		;Voltage selection for channel 2
	#define OAVRCR_VR20_OR	$10
	#define OAVRCR_VR21	5		;Voltage selection for channel 2
	#define OAVRCR_VR21_OR	$20
	#define OAVRCR_VR22	6		;Voltage selection for channel 2
	#define OAVRCR_VR22_OR	$40
	#define OAVRCR_VR2_OR	$70
	#define OAVRCR_VR1E	3		;VR1 Enable
	#define OAVRCR_VR1E_OR	$08
	#define OAVRCR_VR10	0		;Voltage selection for channel 1
	#define OAVRCR_VR10_OR	$01
	#define OAVRCR_VR11	1		;Voltage selection for channel 1
	#define OAVRCR_VR11_OR	$02
	#define OAVRCR_VR12	2		;Voltage selection for channel 1
	#define OAVRCR_VR12_OR	$04
	#define OAVRCR_VR1_OR	$07

; Miscellaneous 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR1.b		; Miscellaneous Register 1
	#define MISCR1_SMS	0		;Slow Mode Select
	#define MISCR1_SMS_OR	$01
	#define MISCR1_PSM0	1		;Prescaler Slow Mode
	#define MISCR1_PSM0_OR	$02
	#define MISCR1_PSM1	2		;Prescaler Slow Mode
	#define MISCR1_PSM1_OR	$04
	#define MISCR1_PSM_OR	$06
	#define MISCR1_PEI0	3		;EI0/EI1 Polarity Options
	#define MISCR1_PEI0_OR	$08
	#define MISCR1_PEI1	4		;EI0/EI1 Polarity Options
	#define MISCR1_PEI1_OR	$10
	#define MISCR1_PEI_0_1_OR	$18
	#define MISCR1_MCO	5		;Main Clock Out
	#define MISCR1_MCO_OR	$20
	#define MISCR1_PEI2	6		;EI2/EI3 Polarity Options
	#define MISCR1_PEI2_OR	$40
	#define MISCR1_PEI3	7		;EI2/EI3 Polarity Options
	#define MISCR1_PEI3_OR	$80
	#define MISCR1_PEI_2_3_OR	$c0

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

; Clock,Reset,Supply Control/Status
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CRSR.b		; Clock/Reset/Supply Control/Status Register
	#define CRSR_WDGRF	0		;Watchdog Reset Flag
	#define CRSR_WDGRF_OR	$01
	#define CRSR_CSSD	1		;Clock Security System Detection
	#define CRSR_CSSD_OR	$02
	#define CRSR_CSSIE	2		;Clock Security System Interrupt
	#define CRSR_CSSIE_OR	$04
	#define CRSR_LVDRF	4		;LVD Reset Flag
	#define CRSR_LVDRF_OR	$10

; 16-Bit Timer
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
	#define MISCR2_P0OS	2		;PWM0 output select
	#define MISCR2_P0OS_OR	$04
	#define MISCR2_P1OS	3		;PWM1 output select
	#define MISCR2_P1OS_OR	$08
	#define MISCR2_SPIOD	4		;SPI output
	#define MISCR2_SPIOD_OR	$10

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

; 8-bit PWM Auto-Reload Timer (PWM ART)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PWMDCR1.b		; Duty Cycle Register 1

	EXTERN PWMDCR0.b		; Duty Cycle Register 0

	EXTERN PWMCR.b		; PWM Control Register
	#define PWMCR_OP0	0		;PWM Output Polarity
	#define PWMCR_OP0_OR	$01
	#define PWMCR_OP1	1		;PWM Output Polarity
	#define PWMCR_OP1_OR	$02
	#define PWMCR_OE0	4		;PWM Output Enable
	#define PWMCR_OE0_OR	$10
	#define PWMCR_OE1	5		;PWM Output Enable
	#define PWMCR_OE1_OR	$20

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

	#endif ; __ST72171__
