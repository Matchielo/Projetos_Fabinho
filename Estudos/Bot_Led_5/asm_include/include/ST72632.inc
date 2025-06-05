; ST72632.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST72632__
; do nothing
	#else
	#define __ST72632__ 1

; ST72632


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

; Interrupt Register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ITRFRE.b		; Interrupt Register
	#define ITRFRE_PA4	0		;Rising Edge
	#define ITRFRE_PA4_OR	$01
	#define ITRFRE_PA5	1		;Rising Edge
	#define ITRFRE_PA5_OR	$02
	#define ITRFRE_PA6	2		;Falling Edge
	#define ITRFRE_PA6_OR	$04
	#define ITRFRE_PA7	3		;Falling Edge
	#define ITRFRE_PA7_OR	$08
	#define ITRFRE_PB4	4		;Rising Edge
	#define ITRFRE_PB4_OR	$10
	#define ITRFRE_PB5	5		;Rising Edge
	#define ITRFRE_PB5_OR	$20
	#define ITRFRE_PB6	6		;Falling Edge
	#define ITRFRE_PB6_OR	$40
	#define ITRFRE_PB7	7		;Falling Edge
	#define ITRFRE_PB7_OR	$80

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR.b		; Miscellaneous Register
	#define MISCR_LVD	3		;Low Voltage Detector
	#define MISCR_LVD_OR	$08
	#define MISCR_CLKDIV	2		;Clock Divider
	#define MISCR_CLKDIV_OR	$04
	#define MISCR_USBOE	1		;USB output enable
	#define MISCR_USBOE_OR	$02
	#define MISCR_MCO	0		;Main Clock Out
	#define MISCR_MCO_OR	$01

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

; Universal Serial Bus (USB)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN USBPIDR.b		; PID Register
	#define USBPIDR_TP2	6		;Token PID Bits 3 & 2
	#define USBPIDR_TP2_OR	$40
	#define USBPIDR_TP3	7		;Token PID Bits 3 & 2
	#define USBPIDR_TP3_OR	$80
	#define USBPIDR_TP_OR	$c0

	EXTERN USBDMAR.b		; DMA Address Register
	#define USBDMAR_DA8	0		;DMA Address bits 15-8
	#define USBDMAR_DA8_OR	$01
	#define USBDMAR_DA9	1		;DMA Address bits 15-8
	#define USBDMAR_DA9_OR	$02
	#define USBDMAR_DA10	2		;DMA Address bits 15-8
	#define USBDMAR_DA10_OR	$04
	#define USBDMAR_DA11	3		;DMA Address bits 15-8
	#define USBDMAR_DA11_OR	$08
	#define USBDMAR_DA12	4		;DMA Address bits 15-8
	#define USBDMAR_DA12_OR	$10
	#define USBDMAR_DA13	5		;DMA Address bits 15-8
	#define USBDMAR_DA13_OR	$20
	#define USBDMAR_DA14	6		;DMA Address bits 15-8
	#define USBDMAR_DA14_OR	$40
	#define USBDMAR_DA15	7		;DMA Address bits 15-8
	#define USBDMAR_DA15_OR	$80
	#define USBDMAR_DA_OR	$ff

	EXTERN USBIDR.b		; Interrupt/DMA Register
	#define USBIDR_CNT0	0		;Byte count
	#define USBIDR_CNT0_OR	$01
	#define USBIDR_CNT1	1		;Byte count
	#define USBIDR_CNT1_OR	$02
	#define USBIDR_CNT2	2		;Byte count
	#define USBIDR_CNT2_OR	$04
	#define USBIDR_CNT3	3		;Byte count
	#define USBIDR_CNT3_OR	$08
	#define USBIDR_CNT_OR	$0f
	#define USBIDR_EP0	4		;Endpoint number
	#define USBIDR_EP0_OR	$10
	#define USBIDR_EP1	5		;Endpoint number
	#define USBIDR_EP1_OR	$20
	#define USBIDR_EP_OR	$30
	#define USBIDR_DA6	6		;DMA Address bits 7-6
	#define USBIDR_DA6_OR	$40
	#define USBIDR_DA7	7		;DMA Address bits 7-6
	#define USBIDR_DA7_OR	$80
	#define USBIDR_DA_OR	$c0

	EXTERN USBISTR.b		; Interrupt Status Register
	#define USBISTR_SOF	0		;Start Of Frame
	#define USBISTR_SOF_OR	$01
	#define USBISTR_RESET	1		;USB Reset
	#define USBISTR_RESET_OR	$02
	#define USBISTR_ESUSP	2		;End Suspend Mode
	#define USBISTR_ESUSP_OR	$04
	#define USBISTR_IOVR	3		;Interrupt Overrun
	#define USBISTR_IOVR_OR	$08
	#define USBISTR_ERR	4		;Error Bit
	#define USBISTR_ERR_OR	$10
	#define USBISTR_CTR	5		;Correct Transfer
	#define USBISTR_CTR_OR	$20
	#define USBISTR_DOVR	6		;DMA over/underrun
	#define USBISTR_DOVR_OR	$40
	#define USBISTR_SUSP	7		;Suspend Mode Request
	#define USBISTR_SUSP_OR	$80

	EXTERN USBIMR.b		; Interrupt Mask Register
	#define USBIMR_SOFM	0		;Mask Start Of Frame
	#define USBIMR_SOFM_OR	$01
	#define USBIMR_RESETM	1		;Mask USB Reset
	#define USBIMR_RESETM_OR	$02
	#define USBIMR_ESUSPM	2		;Mask End Suspend Mode
	#define USBIMR_ESUSPM_OR	$04
	#define USBIMR_IOVRM	3		;Mask Interrupt Overrun
	#define USBIMR_IOVRM_OR	$08
	#define USBIMR_ERRM	4		;Mask Error
	#define USBIMR_ERRM_OR	$10
	#define USBIMR_CTRM	5		;Mask Correct Transfer
	#define USBIMR_CTRM_OR	$20
	#define USBIMR_DOVRM	6		;Mask DMA over/underrun
	#define USBIMR_DOVRM_OR	$40
	#define USBIMR_SUSPM	7		;Mask Suspend Mode Request
	#define USBIMR_SUSPM_OR	$80

	EXTERN USBCTLR.b		; Control Register
	#define USBCTLR_FRES	0		;Force Reset
	#define USBCTLR_FRES_OR	$01
	#define USBCTLR_FSUSP	1		;Force Suspend
	#define USBCTLR_FSUSP_OR	$02
	#define USBCTLR_PDWN	2		;Power Down
	#define USBCTLR_PDWN_OR	$04
	#define USBCTLR_RESUME	3		;Resume
	#define USBCTLR_RESUME_OR	$08

	EXTERN USBDADDR.b		; Device Address Register
	#define USBDADDR_ADD0	0		;Device address 7 bits
	#define USBDADDR_ADD0_OR	$01
	#define USBDADDR_ADD1	1		;Device address 7 bits
	#define USBDADDR_ADD1_OR	$02
	#define USBDADDR_ADD2	2		;Device address 7 bits
	#define USBDADDR_ADD2_OR	$04
	#define USBDADDR_ADD3	3		;Device address 7 bits
	#define USBDADDR_ADD3_OR	$08
	#define USBDADDR_ADD4	4		;Device address 7 bits
	#define USBDADDR_ADD4_OR	$10
	#define USBDADDR_ADD5	5		;Device address 7 bits
	#define USBDADDR_ADD5_OR	$20
	#define USBDADDR_ADD6	6		;Device address 7 bits
	#define USBDADDR_ADD6_OR	$40
	#define USBDADDR_ADD_OR	$7f

	EXTERN USBEP0RA.b		; Endpoint 0 Register A
	#define USBEP0RA_TBC0	0		;Transmit byte Count
	#define USBEP0RA_TBC0_OR	$01
	#define USBEP0RA_TBC1	1		;Transmit byte Count
	#define USBEP0RA_TBC1_OR	$02
	#define USBEP0RA_TBC2	2		;Transmit byte Count
	#define USBEP0RA_TBC2_OR	$04
	#define USBEP0RA_TBC3	3		;Transmit byte Count
	#define USBEP0RA_TBC3_OR	$08
	#define USBEP0RA_TBC_OR	$0f
	#define USBEP0RA_STAT_TX0	4		;Status bits (Transmission)
	#define USBEP0RA_STAT_TX0_OR	$10
	#define USBEP0RA_STAT_TX1	5		;Status bits (Transmission)
	#define USBEP0RA_STAT_TX1_OR	$20
	#define USBEP0RA_STAT_TX_OR	$30
	#define USBEP0RA_DTOG_TX	6		;Data Toggle (Transmission)
	#define USBEP0RA_DTOG_TX_OR	$40
	#define USBEP0RA_ST_OUT	7		;Status Out
	#define USBEP0RA_ST_OUT_OR	$80

	EXTERN USBEP0RB.b		; Endpoint 0 Register B
	#define USBEP0RB_STAT_RX0	4		;Status bits (Reception)
	#define USBEP0RB_STAT_RX0_OR	$10
	#define USBEP0RB_STAT_RX1	5		;Status bits (Reception)
	#define USBEP0RB_STAT_RX1_OR	$20
	#define USBEP0RB_STAT_RX_OR	$30
	#define USBEP0RB_DTOG_RX	6		;Data Toggle (Reception)
	#define USBEP0RB_DTOG_RX_OR	$40

	EXTERN USBEP1RA.b		; Endpoint 1 Register A
	#define USBEP1RA_TBC0	0		;Transmit byte Count
	#define USBEP1RA_TBC0_OR	$01
	#define USBEP1RA_TBC1	1		;Transmit byte Count
	#define USBEP1RA_TBC1_OR	$02
	#define USBEP1RA_TBC2	2		;Transmit byte Count
	#define USBEP1RA_TBC2_OR	$04
	#define USBEP1RA_TBC3	3		;Transmit byte Count
	#define USBEP1RA_TBC3_OR	$08
	#define USBEP1RA_TBC_OR	$0f
	#define USBEP1RA_STAT_TX0	4		;Status bits (Transmission)
	#define USBEP1RA_STAT_TX0_OR	$10
	#define USBEP1RA_STAT_TX1	5		;Status bits (Transmission)
	#define USBEP1RA_STAT_TX1_OR	$20
	#define USBEP1RA_STAT_TX_OR	$30
	#define USBEP1RA_DTOG_TX	6		;Data Toggle (Transmission)
	#define USBEP1RA_DTOG_TX_OR	$40
	#define USBEP1RA_ST_OUT	7		;Status Out
	#define USBEP1RA_ST_OUT_OR	$80

	EXTERN USBEP1RB.b		; Endpoint 1 Register B
	#define USBEP1RB_EA0	0		;Endpoint address
	#define USBEP1RB_EA0_OR	$01
	#define USBEP1RB_EA1	1		;Endpoint address
	#define USBEP1RB_EA1_OR	$02
	#define USBEP1RB_EA2	2		;Endpoint address
	#define USBEP1RB_EA2_OR	$04
	#define USBEP1RB_EA3	3		;Endpoint address
	#define USBEP1RB_EA3_OR	$08
	#define USBEP1RB_EA_OR	$0f
	#define USBEP1RB_STAT_RX0	4		;Status bits (Reception)
	#define USBEP1RB_STAT_RX0_OR	$10
	#define USBEP1RB_STAT_RX1	5		;Status bits (Reception)
	#define USBEP1RB_STAT_RX1_OR	$20
	#define USBEP1RB_STAT_RX_OR	$30
	#define USBEP1RB_DTOG_RX	6		;Data Toggle (Reception)
	#define USBEP1RB_DTOG_RX_OR	$40
	#define USBEP1RB_CTRL	7		;Control
	#define USBEP1RB_CTRL_OR	$80

	EXTERN USBEP2RA.b		; Endpoint 2 Register A
	#define USBEP2RA_TBC0	0		;Transmit byte Count
	#define USBEP2RA_TBC0_OR	$01
	#define USBEP2RA_TBC1	1		;Transmit byte Count
	#define USBEP2RA_TBC1_OR	$02
	#define USBEP2RA_TBC2	2		;Transmit byte Count
	#define USBEP2RA_TBC2_OR	$04
	#define USBEP2RA_TBC3	3		;Transmit byte Count
	#define USBEP2RA_TBC3_OR	$08
	#define USBEP2RA_TBC_OR	$0f
	#define USBEP2RA_STAT_TX0	4		;Status bits (Transmission)
	#define USBEP2RA_STAT_TX0_OR	$10
	#define USBEP2RA_STAT_TX1	5		;Status bits (Transmission)
	#define USBEP2RA_STAT_TX1_OR	$20
	#define USBEP2RA_STAT_TX_OR	$30
	#define USBEP2RA_DTOG_TX	6		;Data Toggle (Transmission)
	#define USBEP2RA_DTOG_TX_OR	$40
	#define USBEP2RA_ST_OUT	7		;Status Out
	#define USBEP2RA_ST_OUT_OR	$80

	EXTERN USBEP2RB.b		; Endpoint 2 Register B
	#define USBEP2RB_EA0	0		;Endpoint address
	#define USBEP2RB_EA0_OR	$01
	#define USBEP2RB_EA1	1		;Endpoint address
	#define USBEP2RB_EA1_OR	$02
	#define USBEP2RB_EA2	2		;Endpoint address
	#define USBEP2RB_EA2_OR	$04
	#define USBEP2RB_EA3	3		;Endpoint address
	#define USBEP2RB_EA3_OR	$08
	#define USBEP2RB_EA_OR	$0f
	#define USBEP2RB_STAT_RX0	4		;Status bits (Reception)
	#define USBEP2RB_STAT_RX0_OR	$10
	#define USBEP2RB_STAT_RX1	5		;Status bits (Reception)
	#define USBEP2RB_STAT_RX1_OR	$20
	#define USBEP2RB_STAT_RX_OR	$30
	#define USBEP2RB_DTOG_RX	6		;Data Toggle (Reception)
	#define USBEP2RB_DTOG_RX_OR	$40
	#define USBEP2RB_CTRL	7		;Control
	#define USBEP2RB_CTRL_OR	$80

	#endif ; __ST72632__
