; ST72521J6.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST72521J6__
; do nothing
	#else
	#define __ST72521J6__ 1

; ST72521J6


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

; Interrupt Software Priority (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;TLI IT Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;TLI IT Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;MCC/RTS CSS IT Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;MCC/RTS CSS IT Priority Level
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
	#define ISPR2_I0_11	6		;AVD IT Priority Level
	#define ISPR2_I0_11_OR	$40
	#define ISPR2_I1_11	7		;AVD IT Priority Level
	#define ISPR2_I1_11_OR	$80
	#define ISPR2_I_11_OR	$c0

	EXTERN ISPR3.b		; Interrupt Software Priority Register 3
	#define ISPR3_I0_12	0		;I2C IT Priority Level
	#define ISPR3_I0_12_OR	$01
	#define ISPR3_I1_12	1		;I2C IT Priority Level
	#define ISPR3_I1_12_OR	$02
	#define ISPR3_I_12_OR	$03
	#define ISPR3_I0_13	2		;PWM ART IT Priority Level
	#define ISPR3_I0_13_OR	$04
	#define ISPR3_I1_13	3		;PWM ART IT Priority Level
	#define ISPR3_I1_13_OR	$08
	#define ISPR3_I_13_OR	$0c

	EXTERN EICR.b		; External Interrupt Control Register
	#define EICR_TLIE	0		;TLI Enable
	#define EICR_TLIE_OR	$01
	#define EICR_TLIS	1		;TLI Sensitivity
	#define EICR_TLIS_OR	$02
	#define EICR_IPA	2		;Interrupt Polarity port A
	#define EICR_IPA_OR	$04
	#define EICR_IS20	3		;EI0/EI1 Sensitivity
	#define EICR_IS20_OR	$08
	#define EICR_IS21	4		;EI0/EI1 Sensitivity
	#define EICR_IS21_OR	$10
	#define EICR_IS2_OR	$18
	#define EICR_IPB	5		;Interrupt Polarity port B
	#define EICR_IPB_OR	$20
	#define EICR_IS10	6		;EI2/EI3 Sensitivity
	#define EICR_IS10_OR	$40
	#define EICR_IS11	7		;EI2/EI3 Sensitivity
	#define EICR_IS11_OR	$80
	#define EICR_IS1_OR	$c0

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

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

; Main Clock Control/Status Register (MCC)
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
	#define SICSR_AVDS	7		;Voltage Detection Selection
	#define SICSR_AVDS_OR	$80

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

	EXTERN TBCSR.b		; Control/Status Register
	#define TBCSR_TIMD	2		;Timer Disable
	#define TBCSR_TIMD_OR	$04
	#define TBCSR_OCF2	3		;Output Compare Flag 2
	#define TBCSR_OCF2_OR	$08
	#define TBCSR_ICF2	4		;Input Capture Flag 2
	#define TBCSR_ICF2_OR	$10
	#define TBCSR_TOF	5		;Timer Overflow
	#define TBCSR_TOF_OR	$20
	#define TBCSR_OCF1	6		;Output Compare Flag 1
	#define TBCSR_OCF1_OR	$40
	#define TBCSR_ICF1	7		;Input Capture Flag 1
	#define TBCSR_ICF1_OR	$80

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
	#define SCISR_PE	0		;Parity Error
	#define SCISR_PE_OR	$01
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

	EXTERN SCIERPR.b		; Ext. Receive Prescaler Reg.

	EXTERN SCIETPR.b		; Ext. Transmit Prescaler Reg.

; Controller Area Network (CAN)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CANISR.b		; Interrupt Status Register
	#define CANISR_EPND	0		;Error Interrupt Pending
	#define CANISR_EPND_OR	$01
	#define CANISR_TEIF	1		;Transmit Error Interrupt Flag
	#define CANISR_TEIF_OR	$02
	#define CANISR_ORIF	2		;Overrun Interrupt Flag
	#define CANISR_ORIF_OR	$04
	#define CANISR_SCIF	3		;Status Change Interrupt Flag
	#define CANISR_SCIF_OR	$08
	#define CANISR_TXIF	4		;Transmit Interrupt Flag
	#define CANISR_TXIF_OR	$10
	#define CANISR_RXIF1	5		;Receive Interrupt Flag for Buffer 1
	#define CANISR_RXIF1_OR	$20
	#define CANISR_RXIF2	6		;Receive Interrupt Flag for Buffer 2
	#define CANISR_RXIF2_OR	$40
	#define CANISR_RXIF3	7		;Receive Interrupt Flag for Buffer 3
	#define CANISR_RXIF3_OR	$80

	EXTERN CANICR.b		; Interrupt Control Register
	#define CANICR_ETX	0		;Early Transmit Interrupt
	#define CANICR_ETX_OR	$01
	#define CANICR_TEIE	1		;Transmit Error Interrupt Enable
	#define CANICR_TEIE_OR	$02
	#define CANICR_ORIE	2		;Overrun Interrupt Enable
	#define CANICR_ORIE_OR	$04
	#define CANICR_SCIE	3		;Status Change Interrupt Enable
	#define CANICR_SCIE_OR	$08
	#define CANICR_TXIE	4		;Transmit Interrupt Enable
	#define CANICR_TXIE_OR	$10
	#define CANICR_RXIe	5		;Receive Interrupt Enable
	#define CANICR_RXIe_OR	$20
	#define CANICR_ESCI	6		;Extended Status Change Interrupt
	#define CANICR_ESCI_OR	$40

	EXTERN CANCSR.b		; Control/Status Register
	#define CANCSR_RUN	0		;CAN Enable
	#define CANCSR_RUN_OR	$01
	#define CANCSR_WKPS	1		;Wake-up Pulse
	#define CANCSR_WKPS_OR	$02
	#define CANCSR_FSYN	2		;Fast Synchronization
	#define CANCSR_FSYN_OR	$04
	#define CANCSR_NRTX	3		;No Retransmission
	#define CANCSR_NRTX_OR	$08
	#define CANCSR_SRTE	4		;Simultaneous Receive/Transmit Enable
	#define CANCSR_SRTE_OR	$10
	#define CANCSR_EPSV	5		;Error Passive State
	#define CANCSR_EPSV_OR	$20
	#define CANCSR_BOFF	6		;Bus-Off State
	#define CANCSR_BOFF_OR	$40

	EXTERN CANBRPR.b		; Baud Rate Prescaler Register
	#define CANBRPR_BRP0	0		;Baud Rate Prescaler
	#define CANBRPR_BRP0_OR	$01
	#define CANBRPR_BRP1	1		;Baud Rate Prescaler
	#define CANBRPR_BRP1_OR	$02
	#define CANBRPR_BRP2	2		;Baud Rate Prescaler
	#define CANBRPR_BRP2_OR	$04
	#define CANBRPR_BRP3	3		;Baud Rate Prescaler
	#define CANBRPR_BRP3_OR	$08
	#define CANBRPR_BRP4	4		;Baud Rate Prescaler
	#define CANBRPR_BRP4_OR	$10
	#define CANBRPR_BRP5	5		;Baud Rate Prescaler
	#define CANBRPR_BRP5_OR	$20
	#define CANBRPR_BRP_OR	$3f
	#define CANBRPR_RJW0	6		;Resynchronization Jump Width
	#define CANBRPR_RJW0_OR	$40
	#define CANBRPR_RJW1	7		;Resynchronization Jump Width
	#define CANBRPR_RJW1_OR	$80
	#define CANBRPR_RJW_OR	$c0

	EXTERN CANBTR.b		; Bit Timing Register
	#define CANBTR_BS10	0		;Bit Segment 1 length
	#define CANBTR_BS10_OR	$01
	#define CANBTR_BS11	1		;Bit Segment 1 length
	#define CANBTR_BS11_OR	$02
	#define CANBTR_BS12	2		;Bit Segment 1 length
	#define CANBTR_BS12_OR	$04
	#define CANBTR_BS13	3		;Bit Segment 1 length
	#define CANBTR_BS13_OR	$08
	#define CANBTR_BS1_OR	$0f
	#define CANBTR_BS20	4		;Bit Segment 2 length
	#define CANBTR_BS20_OR	$10
	#define CANBTR_BS21	5		;Bit Segment 2 length
	#define CANBTR_BS21_OR	$20
	#define CANBTR_BS22	6		;Bit Segment 2 length
	#define CANBTR_BS22_OR	$40
	#define CANBTR_BS2_OR	$70

	EXTERN CANPSR.b		; Page Selection Register
	#define CANPSR_PAGE0	0		;Buffer or filter page mapping selection bits
	#define CANPSR_PAGE0_OR	$01
	#define CANPSR_PAGE1	1		;Buffer or filter page mapping selection bits
	#define CANPSR_PAGE1_OR	$02
	#define CANPSR_PAGE2	2		;Buffer or filter page mapping selection bits
	#define CANPSR_PAGE2_OR	$04
	#define CANPSR_PAGE_OR	$07

	EXTERN CANPR0.b		; Address 60h Paged Register see datasheet

	EXTERN CANPR1.b		; Address 61h Paged Register see datasheet

	EXTERN CANPR2.b		; Address 62h Paged Register see datasheet

	EXTERN CANPR3.b		; Address 63h Paged Register see datasheet

	EXTERN CANPR4.b		; Address 64h Paged Register see datasheet

	EXTERN CANPR5.b		; Address 65h Paged Register see datasheet

	EXTERN CANPR6.b		; Address 66h Paged Register see datasheet

	EXTERN CANPR7.b		; Address 67h Paged Register see datasheet

	EXTERN CANPR8.b		; Address 68h Paged Register see datasheet

	EXTERN CANPR9.b		; Address 69h Paged Register see datasheet

	EXTERN CANPR10.b		; Address 6Ah Paged Register see datasheet

	EXTERN CANPR11.b		; Address 6Bh Paged Register see datasheet

	EXTERN CANPR12.b		; Address 6Ch Paged Register see datasheet

	EXTERN CANPR13.b		; Address 6Dh Paged Register see datasheet

	EXTERN CANPR14.b		; Address 6Eh Paged Register see datasheet

	EXTERN CANPR15.b		; Address 6Fh Paged Register see datasheet

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
	#define ADCCSR_ADON	5		;A/D Start Converter
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_SPEED	6		;A/D Clock Selection
	#define ADCCSR_SPEED_OR	$40
	#define ADCCSR_EOC	7		;End of Conversion
	#define ADCCSR_EOC_OR	$80

	EXTERN ADCDRH.b		; Data High Register

	EXTERN ADCDRL.b		; Data low Register

; 8-bit PWM Auto-Reload Timer (PWM ART)
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

	#endif ; __ST72521J6__
