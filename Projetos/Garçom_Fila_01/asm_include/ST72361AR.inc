; ST72361AR.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST72361AR__
; do nothing
	#else
	#define __ST72361AR__ 1

; ST72361AR


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

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

; Interrupt Software Priority (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;TLI IT Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;TLI IT Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;CLKM IT Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;CLKM IT Priority Level
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
	#define ISPR1_I0_6	4		;CAN RX IT Priority Level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;CAN RX IT Priority Level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;CAN TX ER SC IT Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;CAN TX ER SC IT Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;SPI IT Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;SPI IT Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_9	2		;Timer 8 IT Priority Level
	#define ISPR2_I0_9_OR	$04
	#define ISPR2_I1_9	3		;Timer 8 IT Priority Level
	#define ISPR2_I1_9_OR	$08
	#define ISPR2_I_9_OR	$0c
	#define ISPR2_I0_10	4		;Timer 16 IT Priority Level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;Timer 16 IT Priority Level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30
	#define ISPR2_I0_11	6		;LINSCI2 IT Priority Level
	#define ISPR2_I0_11_OR	$40
	#define ISPR2_I1_11	7		;LINSCI2 IT Priority Level
	#define ISPR2_I1_11_OR	$80
	#define ISPR2_I_11_OR	$c0

	EXTERN ISPR3.b		; Interrupt Software Priority Register 3
	#define ISPR3_I0_12	0		;LINSCI1 IT Priority Level
	#define ISPR3_I0_12_OR	$01
	#define ISPR3_I1_12	1		;LINSCI1 IT Priority Level
	#define ISPR3_I1_12_OR	$02
	#define ISPR3_I_12_OR	$03
	#define ISPR3_I0_13	2		;PWM ART IT Priority Level
	#define ISPR3_I0_13_OR	$04
	#define ISPR3_I1_13	3		;PWM ART IT Priority Level
	#define ISPR3_I1_13_OR	$08
	#define ISPR3_I_13_OR	$0c

	EXTERN EICR0.b		; External Interrupt Control Register 0
	#define EICR0_IS00	0		;EI0 Sensitivity
	#define EICR0_IS00_OR	$01
	#define EICR0_IS01	1		;EI0 Sensitivity
	#define EICR0_IS01_OR	$02
	#define EICR0_IS0_OR	$03
	#define EICR0_IS10	2		;EI1 Sensitivity
	#define EICR0_IS10_OR	$04
	#define EICR0_IS11	3		;EI1 Sensitivity
	#define EICR0_IS11_OR	$08
	#define EICR0_IS1_OR	$0c
	#define EICR0_IS20	4		;EI2 Sensitivity
	#define EICR0_IS20_OR	$10
	#define EICR0_IS21	5		;EI2 Sensitivity
	#define EICR0_IS21_OR	$20
	#define EICR0_IS2_OR	$30
	#define EICR0_IS30	6		;EI3 Sensitivity
	#define EICR0_IS30_OR	$40
	#define EICR0_IS31	7		;EI3 Sensitivity
	#define EICR0_IS31_OR	$80
	#define EICR0_IS3_OR	$c0

	EXTERN EICR1.b		; External Interrupt Control Register 1
	#define EICR1_TLIE	0		;TLI Enable
	#define EICR1_TLIE_OR	$01
	#define EICR1_TLIS	1		;TLI Sensitivity
	#define EICR1_TLIS_OR	$02

; Auto Wake-Up
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN AWUCSR.b		; Control/Status Register
	#define AWUCSR_AWUEN	0		;Auto Wake Up From Halt Enabled
	#define AWUCSR_AWUEN_OR	$01
	#define AWUCSR_AWUM	1		;Auto Wake Up Measurement
	#define AWUCSR_AWUM_OR	$02
	#define AWUCSR_AWUF	2		;Auto Wake Up Flag
	#define AWUCSR_AWUF_OR	$04

	EXTERN AWUPR.b		; Prescaler Register
	#define AWUPR_AWUPR0	0		;Auto Wake Up prescaler
	#define AWUPR_AWUPR0_OR	$01
	#define AWUPR_AWUPR1	1		;Auto Wake Up prescaler
	#define AWUPR_AWUPR1_OR	$02
	#define AWUPR_AWUPR2	2		;Auto Wake Up prescaler
	#define AWUPR_AWUPR2_OR	$04
	#define AWUPR_AWUPR3	3		;Auto Wake Up prescaler
	#define AWUPR_AWUPR3_OR	$08
	#define AWUPR_AWUPR4	4		;Auto Wake Up prescaler
	#define AWUPR_AWUPR4_OR	$10
	#define AWUPR_AWUPR5	5		;Auto Wake Up prescaler
	#define AWUPR_AWUPR5_OR	$20
	#define AWUPR_AWUPR6	6		;Auto Wake Up prescaler
	#define AWUPR_AWUPR6_OR	$40
	#define AWUPR_AWUPR7	7		;Auto Wake Up prescaler
	#define AWUPR_AWUPR7_OR	$80
	#define AWUPR_AWUPR_OR	$ff

; Main Clock Controller (MCC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SICSR.b		; System Integrity Control/Status Register
	#define SICSR_WDGRF	0		;Watchdog Reset Flag
	#define SICSR_WDGRF_OR	$01
	#define SICSR_LVDRF	4		;LVD Reset Flag
	#define SICSR_LVDRF_OR	$10
	#define SICSR_AVDF	5		;Voltage Detector Flag
	#define SICSR_AVDF_OR	$20
	#define SICSR_AVDIE	6		;Voltage Detector Interrupt
	#define SICSR_AVDIE_OR	$40

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

; 8-Bit Timer (TIM8)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN T8CR2.b		; Control Register 2
	#define T8CR2_IEDG2	1		;Input Edge 2
	#define T8CR2_IEDG2_OR	$02
	#define T8CR2_CC0	2		;Clock Control
	#define T8CR2_CC0_OR	$04
	#define T8CR2_CC1	3		;Clock Control
	#define T8CR2_CC1_OR	$08
	#define T8CR2_CC_OR	$0c
	#define T8CR2_PWM	4		;Pulse Width Modulation
	#define T8CR2_PWM_OR	$10
	#define T8CR2_OPM	5		;One Pulse Mode
	#define T8CR2_OPM_OR	$20
	#define T8CR2_OC2E	6		;Output Compare 2 Output Pin
	#define T8CR2_OC2E_OR	$40
	#define T8CR2_OC1E	7		;Output Compare 1 Output Pin
	#define T8CR2_OC1E_OR	$80

	EXTERN T8CR1.b		; Control Register 1
	#define T8CR1_OLVL1	0		;Output Level 1
	#define T8CR1_OLVL1_OR	$01
	#define T8CR1_IEDG1	1		;Input Edge 1
	#define T8CR1_IEDG1_OR	$02
	#define T8CR1_OLVL2	2		;Output Level 2
	#define T8CR1_OLVL2_OR	$04
	#define T8CR1_FOLV1	3		;Forced Output Compare 1
	#define T8CR1_FOLV1_OR	$08
	#define T8CR1_FOLV2	4		;Forced Output Compare 2
	#define T8CR1_FOLV2_OR	$10
	#define T8CR1_TOIE	5		;Timer Overflow Interrupt
	#define T8CR1_TOIE_OR	$20
	#define T8CR1_OCIE	6		;Output Compare Interrupt
	#define T8CR1_OCIE_OR	$40
	#define T8CR1_ICIE	7		;Input Capture Interrupt
	#define T8CR1_ICIE_OR	$80

	EXTERN T8CSR.b		; Control/Status Register
	#define T8CSR_TIMD	2		;Timer Disable
	#define T8CSR_TIMD_OR	$04
	#define T8CSR_OCF2	3		;Output Compare Flag 2
	#define T8CSR_OCF2_OR	$08
	#define T8CSR_ICF2	4		;Input Capture Flag 2
	#define T8CSR_ICF2_OR	$10
	#define T8CSR_TOF	5		;Timer Overflow
	#define T8CSR_TOF_OR	$20
	#define T8CSR_OCF1	6		;Output Compare Flag 1
	#define T8CSR_OCF1_OR	$40
	#define T8CSR_ICF1	7		;Input Capture Flag 1
	#define T8CSR_ICF1_OR	$80

	EXTERN T8IC1R.b		; Input Capture 1 Register
	#define T8IC1R_IC1R0	0		;Input Capture 1 Register
	#define T8IC1R_IC1R0_OR	$01
	#define T8IC1R_IC1R1	1		;Input Capture 1 Register
	#define T8IC1R_IC1R1_OR	$02
	#define T8IC1R_IC1R2	2		;Input Capture 1 Register
	#define T8IC1R_IC1R2_OR	$04
	#define T8IC1R_IC1R3	3		;Input Capture 1 Register
	#define T8IC1R_IC1R3_OR	$08
	#define T8IC1R_IC1R4	4		;Input Capture 1 Register
	#define T8IC1R_IC1R4_OR	$10
	#define T8IC1R_IC1R5	5		;Input Capture 1 Register
	#define T8IC1R_IC1R5_OR	$20
	#define T8IC1R_IC1R6	6		;Input Capture 1 Register
	#define T8IC1R_IC1R6_OR	$40
	#define T8IC1R_IC1R7	7		;Input Capture 1 Register
	#define T8IC1R_IC1R7_OR	$80
	#define T8IC1R_IC1R_OR	$ff

	EXTERN T8OC1R.b		; Output Compare 1 Register
	#define T8OC1R_OC1R0	0		;Output Compare 1 Register
	#define T8OC1R_OC1R0_OR	$01
	#define T8OC1R_OC1R1	1		;Output Compare 1 Register
	#define T8OC1R_OC1R1_OR	$02
	#define T8OC1R_OC1R2	2		;Output Compare 1 Register
	#define T8OC1R_OC1R2_OR	$04
	#define T8OC1R_OC1R3	3		;Output Compare 1 Register
	#define T8OC1R_OC1R3_OR	$08
	#define T8OC1R_OC1R4	4		;Output Compare 1 Register
	#define T8OC1R_OC1R4_OR	$10
	#define T8OC1R_OC1R5	5		;Output Compare 1 Register
	#define T8OC1R_OC1R5_OR	$20
	#define T8OC1R_OC1R6	6		;Output Compare 1 Register
	#define T8OC1R_OC1R6_OR	$40
	#define T8OC1R_OC1R7	7		;Output Compare 1 Register
	#define T8OC1R_OC1R7_OR	$80
	#define T8OC1R_OC1R_OR	$ff

	EXTERN T8CTR.b		; Counter Register
	#define T8CTR_CTR0	0		;Counter Register
	#define T8CTR_CTR0_OR	$01
	#define T8CTR_CTR1	1		;Counter Register
	#define T8CTR_CTR1_OR	$02
	#define T8CTR_CTR2	2		;Counter Register
	#define T8CTR_CTR2_OR	$04
	#define T8CTR_CTR3	3		;Counter Register
	#define T8CTR_CTR3_OR	$08
	#define T8CTR_CTR4	4		;Counter Register
	#define T8CTR_CTR4_OR	$10
	#define T8CTR_CTR5	5		;Counter Register
	#define T8CTR_CTR5_OR	$20
	#define T8CTR_CTR6	6		;Counter Register
	#define T8CTR_CTR6_OR	$40
	#define T8CTR_CTR7	7		;Counter Register
	#define T8CTR_CTR7_OR	$80
	#define T8CTR_CTR_OR	$ff

	EXTERN T8ACTR.b		; Alternate Counter Register
	#define T8ACTR_ACTR0	0		;Alternate Counter Low Register
	#define T8ACTR_ACTR0_OR	$01
	#define T8ACTR_ACTR1	1		;Alternate Counter Low Register
	#define T8ACTR_ACTR1_OR	$02
	#define T8ACTR_ACTR2	2		;Alternate Counter Low Register
	#define T8ACTR_ACTR2_OR	$04
	#define T8ACTR_ACTR3	3		;Alternate Counter Low Register
	#define T8ACTR_ACTR3_OR	$08
	#define T8ACTR_ACTR4	4		;Alternate Counter Low Register
	#define T8ACTR_ACTR4_OR	$10
	#define T8ACTR_ACTR5	5		;Alternate Counter Low Register
	#define T8ACTR_ACTR5_OR	$20
	#define T8ACTR_ACTR6	6		;Alternate Counter Low Register
	#define T8ACTR_ACTR6_OR	$40
	#define T8ACTR_ACTR7	7		;Alternate Counter Low Register
	#define T8ACTR_ACTR7_OR	$80
	#define T8ACTR_ACTR_OR	$ff

	EXTERN T8IC2R.b		; Input Capture 2 Register
	#define T8IC2R_IC2R0	0		;Input Capture 2 Register
	#define T8IC2R_IC2R0_OR	$01
	#define T8IC2R_IC2R1	1		;Input Capture 2 Register
	#define T8IC2R_IC2R1_OR	$02
	#define T8IC2R_IC2R2	2		;Input Capture 2 Register
	#define T8IC2R_IC2R2_OR	$04
	#define T8IC2R_IC2R3	3		;Input Capture 2 Register
	#define T8IC2R_IC2R3_OR	$08
	#define T8IC2R_IC2R4	4		;Input Capture 2 Register
	#define T8IC2R_IC2R4_OR	$10
	#define T8IC2R_IC2R5	5		;Input Capture 2 Register
	#define T8IC2R_IC2R5_OR	$20
	#define T8IC2R_IC2R6	6		;Input Capture 2 Register
	#define T8IC2R_IC2R6_OR	$40
	#define T8IC2R_IC2R7	7		;Input Capture 2 Register
	#define T8IC2R_IC2R7_OR	$80
	#define T8IC2R_IC2R_OR	$ff

	EXTERN T8OC2R.b		; Output Compare 2 Register
	#define T8OC2R_OC2R0	0		;Output Compare 2 Register
	#define T8OC2R_OC2R0_OR	$01
	#define T8OC2R_OC2R1	1		;Output Compare 2 Register
	#define T8OC2R_OC2R1_OR	$02
	#define T8OC2R_OC2R2	2		;Output Compare 2 Register
	#define T8OC2R_OC2R2_OR	$04
	#define T8OC2R_OC2R3	3		;Output Compare 2 Register
	#define T8OC2R_OC2R3_OR	$08
	#define T8OC2R_OC2R4	4		;Output Compare 2 Register
	#define T8OC2R_OC2R4_OR	$10
	#define T8OC2R_OC2R5	5		;Output Compare 2 Register
	#define T8OC2R_OC2R5_OR	$20
	#define T8OC2R_OC2R6	6		;Output Compare 2 Register
	#define T8OC2R_OC2R6_OR	$40
	#define T8OC2R_OC2R7	7		;Output Compare 2 Register
	#define T8OC2R_OC2R7_OR	$80
	#define T8OC2R_OC2R_OR	$ff

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
	#define ADCCSR_ClkSel0	4		;A/D Clock Selection
	#define ADCCSR_ClkSel0_OR	$10
	#define ADCCSR_ClkSel1	6		;A/D Clock Selection
	#define ADCCSR_ClkSel1_OR	$40
	#define ADCCSR_ClkSel_OR	$50
	#define ADCCSR_ADON	5		;A/D Start Converter
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

	EXTERN ADCDRH.b		; Data High Register

	EXTERN ADCDRL.b		; Data low Register

; Serial Communication Interface (LinMasterSlave)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SCI1SR.b		; Status Register
	#define SCI1SR_PE	0		;Parity Error
	#define SCI1SR_PE_OR	$01
	#define SCI1SR_FE	1		;Framing Error
	#define SCI1SR_FE_OR	$02
	#define SCI1SR_NF	2		;Noise Flag
	#define SCI1SR_NF_OR	$04
	#define SCI1SR_OR	3		;Overrun Error
	#define SCI1SR_OR_OR	$08
	#define SCI1SR_IDLE	4		;Idle line detect
	#define SCI1SR_IDLE_OR	$10
	#define SCI1SR_RDRF	5		;Received Data Ready Flag
	#define SCI1SR_RDRF_OR	$20
	#define SCI1SR_TC	6		;Transmission Complete
	#define SCI1SR_TC_OR	$40
	#define SCI1SR_TDRE	7		;Transmission Data Register Empty
	#define SCI1SR_TDRE_OR	$80

	EXTERN SCI1DR.b		; Data Register

	EXTERN SCI1BRR.b		; Baud Rate Register
	#define SCI1BRR_SCR0	0		;Receiver Rate Divisor
	#define SCI1BRR_SCR0_OR	$01
	#define SCI1BRR_SCR1	1		;Receiver Rate Divisor
	#define SCI1BRR_SCR1_OR	$02
	#define SCI1BRR_SCR2	2		;Receiver Rate Divisor
	#define SCI1BRR_SCR2_OR	$04
	#define SCI1BRR_SCR_OR	$07
	#define SCI1BRR_SCT0	3		;Transmitter Rate Divisor
	#define SCI1BRR_SCT0_OR	$08
	#define SCI1BRR_SCT1	4		;Transmitter Rate Divisor
	#define SCI1BRR_SCT1_OR	$10
	#define SCI1BRR_SCT2	5		;Transmitter Rate Divisor
	#define SCI1BRR_SCT2_OR	$20
	#define SCI1BRR_SCT_OR	$38
	#define SCI1BRR_SCP0	6		;First SCI Prescaler
	#define SCI1BRR_SCP0_OR	$40
	#define SCI1BRR_SCP1	7		;First SCI Prescaler
	#define SCI1BRR_SCP1_OR	$80
	#define SCI1BRR_SCP_OR	$c0

	EXTERN SCI1CR1.b		; Control Register 1
	#define SCI1CR1_PIE	0		;Parity Interrupt Enable
	#define SCI1CR1_PIE_OR	$01
	#define SCI1CR1_PS	1		;Parity Selection
	#define SCI1CR1_PS_OR	$02
	#define SCI1CR1_PCE	2		;Parity Control Enable
	#define SCI1CR1_PCE_OR	$04
	#define SCI1CR1_WAKE	3		;Wake-up Method
	#define SCI1CR1_WAKE_OR	$08
	#define SCI1CR1_M	4		;Word Length
	#define SCI1CR1_M_OR	$10
	#define SCI1CR1_SCID	5		;Sci prescaler and outputs enable/disable bit
	#define SCI1CR1_SCID_OR	$20
	#define SCI1CR1_T8	6		;Transmit Data Bit 8
	#define SCI1CR1_T8_OR	$40
	#define SCI1CR1_R8	7		;Receive Data Bit 8
	#define SCI1CR1_R8_OR	$80

	EXTERN SCI1CR2.b		; Control Register 2
	#define SCI1CR2_SBK	0		;Send Break
	#define SCI1CR2_SBK_OR	$01
	#define SCI1CR2_RWU	1		;Receiver Wake-up Mode
	#define SCI1CR2_RWU_OR	$02
	#define SCI1CR2_RE	2		;Receiver
	#define SCI1CR2_RE_OR	$04
	#define SCI1CR2_TE	3		;Transmitter
	#define SCI1CR2_TE_OR	$08
	#define SCI1CR2_ILIE	4		;Idle Line Interrupt
	#define SCI1CR2_ILIE_OR	$10
	#define SCI1CR2_RIE	5		;Receiver Interrupt
	#define SCI1CR2_RIE_OR	$20
	#define SCI1CR2_TCIE	6		;Transmission Complete Interrupt
	#define SCI1CR2_TCIE_OR	$40
	#define SCI1CR2_TIE	7		;Transmitter Interrupt
	#define SCI1CR2_TIE_OR	$80

	EXTERN SCI1CR3.b		; Control Register 3
	#define SCI1CR3_LSF	0		;Synch Field State
	#define SCI1CR3_LSF_OR	$01
	#define SCI1CR3_LHDF	1		;Header Detection Flag
	#define SCI1CR3_LHDF_OR	$02
	#define SCI1CR3_LHIE	2		;Header Interrup Enable
	#define SCI1CR3_LHIE_OR	$04
	#define SCI1CR3_LHDM	3		;Header Detection Method
	#define SCI1CR3_LHDM_OR	$08
	#define SCI1CR3_LASE	4		;Auto Synch Enable
	#define SCI1CR3_LASE_OR	$10
	#define SCI1CR3_Model0	5		;Mode Enable Bits
	#define SCI1CR3_Model0_OR	$20
	#define SCI1CR3_Model1	6		;Mode Enable Bits
	#define SCI1CR3_Model1_OR	$40
	#define SCI1CR3_Model_OR	$60
	#define SCI1CR3_LDUM	7		;Diveder Update Mathod
	#define SCI1CR3_LDUM_OR	$80

	EXTERN SCI1ERPR.b		; Ext. Receive Prescaler Reg.

	EXTERN SCI1ETPR.b		; Ext. Transmit Prescaler Reg.

; 16-Bit Timer (TIM16)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN T16CR2.b		; Control Register 2
	#define T16CR2_EXEDG	0		;External Clock Edge
	#define T16CR2_EXEDG_OR	$01
	#define T16CR2_IEDG2	1		;Input Edge 2
	#define T16CR2_IEDG2_OR	$02
	#define T16CR2_CC0	2		;Clock Control
	#define T16CR2_CC0_OR	$04
	#define T16CR2_CC1	3		;Clock Control
	#define T16CR2_CC1_OR	$08
	#define T16CR2_CC_OR	$0c
	#define T16CR2_PWM	4		;Pulse Width Modulation
	#define T16CR2_PWM_OR	$10
	#define T16CR2_OPM	5		;One Pulse Mode
	#define T16CR2_OPM_OR	$20
	#define T16CR2_OC2E	6		;Output Compare 2 Output Pin
	#define T16CR2_OC2E_OR	$40
	#define T16CR2_OC1E	7		;Output Compare 1 Output Pin
	#define T16CR2_OC1E_OR	$80

	EXTERN T16CR1.b		; Control Register 1
	#define T16CR1_OLVL1	0		;Output Level 1
	#define T16CR1_OLVL1_OR	$01
	#define T16CR1_IEDG1	1		;Input Edge 1
	#define T16CR1_IEDG1_OR	$02
	#define T16CR1_OLVL2	2		;Output Level 2
	#define T16CR1_OLVL2_OR	$04
	#define T16CR1_FOLV1	3		;Forced Output Compare 1
	#define T16CR1_FOLV1_OR	$08
	#define T16CR1_FOLV2	4		;Forced Output Compare 2
	#define T16CR1_FOLV2_OR	$10
	#define T16CR1_TOIE	5		;Timer Overflow Interrupt
	#define T16CR1_TOIE_OR	$20
	#define T16CR1_OCIE	6		;Output Compare Interrupt
	#define T16CR1_OCIE_OR	$40
	#define T16CR1_ICIE	7		;Input Capture Interrupt
	#define T16CR1_ICIE_OR	$80

	EXTERN T16CSR.b		; Control/Status Register
	#define T16CSR_TIMD	2		;Timer Disable
	#define T16CSR_TIMD_OR	$04
	#define T16CSR_OCF2	3		;Output Compare Flag 2
	#define T16CSR_OCF2_OR	$08
	#define T16CSR_ICF2	4		;Input Capture Flag 2
	#define T16CSR_ICF2_OR	$10
	#define T16CSR_TOF	5		;Timer Overflow
	#define T16CSR_TOF_OR	$20
	#define T16CSR_OCF1	6		;Output Compare Flag 1
	#define T16CSR_OCF1_OR	$40
	#define T16CSR_ICF1	7		;Input Capture Flag 1
	#define T16CSR_ICF1_OR	$80

	EXTERN T16IC1HR.b		; Input Capture 1 High Register

	EXTERN T16IC1LR.b		; Input Capture 1 Low Register

	EXTERN TA16C1HR.b		; Output Compare 1 High Register

	EXTERN TA16C1LR.b		; Output Compare 1 Low Register

	EXTERN T16CHR.b		; Counter High Register

	EXTERN T16CLR.b		; Counter Low Register

	EXTERN T16ACHR.b		; Alternate Counter High Register

	EXTERN T16ACLR.b		; Alternate Counter Low Register

	EXTERN T16IC2HR.b		; Input Capture 2 High Register

	EXTERN T16IC2LR.b		; Input Capture 2 Low Register

	EXTERN T16OC2HR.b		; Output Compare 2 High Register

	EXTERN T16OC2LR.b		; Output Compare 2 Low Register

; Serial Communication Interface (LinMaster)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SCI2SR.b		; Status Register
	#define SCI2SR_PE	0		;Parity Error
	#define SCI2SR_PE_OR	$01
	#define SCI2SR_FE	1		;Framing Error
	#define SCI2SR_FE_OR	$02
	#define SCI2SR_NF	2		;Noise Flag
	#define SCI2SR_NF_OR	$04
	#define SCI2SR_OR	3		;Overrun Error
	#define SCI2SR_OR_OR	$08
	#define SCI2SR_IDLE	4		;Idle line detect
	#define SCI2SR_IDLE_OR	$10
	#define SCI2SR_RDRF	5		;Received Data Ready Flag
	#define SCI2SR_RDRF_OR	$20
	#define SCI2SR_TC	6		;Transmission Complete
	#define SCI2SR_TC_OR	$40
	#define SCI2SR_TDRE	7		;Transmission Data Register Empty
	#define SCI2SR_TDRE_OR	$80

	EXTERN SCI2DR.b		; Data Register

	EXTERN SCI2BRR.b		; Baud Rate Register
	#define SCI2BRR_SCR0	0		;Receiver Rate Divisor
	#define SCI2BRR_SCR0_OR	$01
	#define SCI2BRR_SCR1	1		;Receiver Rate Divisor
	#define SCI2BRR_SCR1_OR	$02
	#define SCI2BRR_SCR2	2		;Receiver Rate Divisor
	#define SCI2BRR_SCR2_OR	$04
	#define SCI2BRR_SCR_OR	$07
	#define SCI2BRR_SCT0	3		;Transmitter Rate Divisor
	#define SCI2BRR_SCT0_OR	$08
	#define SCI2BRR_SCT1	4		;Transmitter Rate Divisor
	#define SCI2BRR_SCT1_OR	$10
	#define SCI2BRR_SCT2	5		;Transmitter Rate Divisor
	#define SCI2BRR_SCT2_OR	$20
	#define SCI2BRR_SCT_OR	$38
	#define SCI2BRR_SCP0	6		;First SCI Prescaler
	#define SCI2BRR_SCP0_OR	$40
	#define SCI2BRR_SCP1	7		;First SCI Prescaler
	#define SCI2BRR_SCP1_OR	$80
	#define SCI2BRR_SCP_OR	$c0

	EXTERN SCI2CR1.b		; Control Register 1
	#define SCI2CR1_PIE	0		;Parity Interrupt Enable
	#define SCI2CR1_PIE_OR	$01
	#define SCI2CR1_PS	1		;Parity Selection
	#define SCI2CR1_PS_OR	$02
	#define SCI2CR1_PCE	2		;Parity Control Enable
	#define SCI2CR1_PCE_OR	$04
	#define SCI2CR1_WAKE	3		;Wake-up Method
	#define SCI2CR1_WAKE_OR	$08
	#define SCI2CR1_M	4		;Word Length
	#define SCI2CR1_M_OR	$10
	#define SCI2CR1_SCID	5		;Sci prescaler and outputs enable/disable bit
	#define SCI2CR1_SCID_OR	$20
	#define SCI2CR1_T8	6		;Transmit Data Bit 8
	#define SCI2CR1_T8_OR	$40
	#define SCI2CR1_R8	7		;Receive Data Bit 8
	#define SCI2CR1_R8_OR	$80

	EXTERN SCI2CR2.b		; Control Register 2
	#define SCI2CR2_SBK	0		;Send Break
	#define SCI2CR2_SBK_OR	$01
	#define SCI2CR2_RWU	1		;Receiver Wake-up Mode
	#define SCI2CR2_RWU_OR	$02
	#define SCI2CR2_RE	2		;Receiver
	#define SCI2CR2_RE_OR	$04
	#define SCI2CR2_TE	3		;Transmitter
	#define SCI2CR2_TE_OR	$08
	#define SCI2CR2_ILIE	4		;Idle Line Interrupt
	#define SCI2CR2_ILIE_OR	$10
	#define SCI2CR2_RIE	5		;Receiver Interrupt
	#define SCI2CR2_RIE_OR	$20
	#define SCI2CR2_TCIE	6		;Transmission Complete Interrupt
	#define SCI2CR2_TCIE_OR	$40
	#define SCI2CR2_TIE	7		;Transmitter Interrupt
	#define SCI2CR2_TIE_OR	$80

	EXTERN SCI2CR3.b		; Control Register 3
	#define SCI2CR3_LBCL	0		;Last bit clock pulse
	#define SCI2CR3_LBCL_OR	$01
	#define SCI2CR3_CPHA	1		;Clock Phase
	#define SCI2CR3_CPHA_OR	$02
	#define SCI2CR3_CPOL	2		;Clock Polarity
	#define SCI2CR3_CPOL_OR	$04
	#define SCI2CR3_CLKEN	3		;Clock Enable
	#define SCI2CR3_CLKEN_OR	$08
	#define SCI2CR3_LINE	6		;Mode Enable
	#define SCI2CR3_LINE_OR	$40

	EXTERN SCI2ERPR.b		; Ext. Receive Prescaler Reg.

	EXTERN SCI2ETPR.b		; Ext. Transmit Prescaler Reg.

	#endif ; __ST72361AR__
