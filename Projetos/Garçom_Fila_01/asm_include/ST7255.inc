; ST7255.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST7255__
; do nothing
	#else
	#define __ST7255__ 1

; ST7255


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

	EXTERN PAOR.b		; Option Register

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR.b		; Miscellaneous Register
	#define MISCR_SMS	0		;Slow Mode Select
	#define MISCR_SMS_OR	$01
	#define MISCR_PSM0	1		;Prescaler Slow Mode
	#define MISCR_PSM0_OR	$02
	#define MISCR_PSM1	2		;Prescaler Slow Mode
	#define MISCR_PSM1_OR	$04
	#define MISCR_PSM_OR	$06
	#define MISCR_PEI0	3		;EI0/EI1 Polarity Options
	#define MISCR_PEI0_OR	$08
	#define MISCR_PEI1	4		;EI0/EI1 Polarity Options
	#define MISCR_PEI1_OR	$10
	#define MISCR_PEI_0_1_OR	$18
	#define MISCR_MCO	5		;Main Clock Out
	#define MISCR_MCO_OR	$20
	#define MISCR_PEI2	6		;EI2/EI3 Polarity Options
	#define MISCR_PEI2_OR	$40
	#define MISCR_PEI3	7		;EI2/EI3 Polarity Options
	#define MISCR_PEI3_OR	$80
	#define MISCR_PEI_2_3_OR	$c0

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

	#endif ; __ST7255__
