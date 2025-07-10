; ST7277.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7277__
; do nothing
	#else
	#define __ST7277__ 1

; ST7277


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

; Port C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PCDR.b		; Data Register

	EXTERN PCDDR.b		; Data Direction Register

; Port D
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PDDR.b		; Data Register

	EXTERN PDDDR.b		; Data Direction Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBDDR.b		; Data Direction Register

	EXTERN PBICFGR.b		; Input Pull-up Configuration Register

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR.b		; Miscellaneous Register
	#define MISCR_POC0	0		;PWM/BRM Output Configuration Bit
	#define MISCR_POC0_OR	$01
	#define MISCR_SMS	5		;Slow Mode Select
	#define MISCR_SMS_OR	$20

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

; D/A Converter (DAC) with PWM outputs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PWM0.b		; Channel 0 PWM Register
	#define PWM0_POL	6		;Polarity Bit
	#define PWM0_POL_OR	$40
	#define PWM0_P0	0		;Pulse Binary Weight for Channel 0
	#define PWM0_P0_OR	$01
	#define PWM0_P1	1		;Pulse Binary Weight for Channel 0
	#define PWM0_P1_OR	$02
	#define PWM0_P2	2		;Pulse Binary Weight for Channel 0
	#define PWM0_P2_OR	$04
	#define PWM0_P3	3		;Pulse Binary Weight for Channel 0
	#define PWM0_P3_OR	$08
	#define PWM0_P4	4		;Pulse Binary Weight for Channel 0
	#define PWM0_P4_OR	$10
	#define PWM0_P5	5		;Pulse Binary Weight for Channel 0
	#define PWM0_P5_OR	$20
	#define PWM0_P_OR	$3f

	EXTERN BRM0.b		; Channel 0 BRM Register
	#define BRM0_B0	0		;BRM Bits (Channel 0)
	#define BRM0_B0_OR	$01
	#define BRM0_B1	1		;BRM Bits (Channel 0)
	#define BRM0_B1_OR	$02
	#define BRM0_B2	2		;BRM Bits (Channel 0)
	#define BRM0_B2_OR	$04
	#define BRM0_B3	3		;BRM Bits (Channel 0)
	#define BRM0_B3_OR	$08
	#define BRM0_B4	4		;BRM Bits (Channel 0)
	#define BRM0_B4_OR	$10
	#define BRM0_B5	5		;BRM Bits (Channel 0)
	#define BRM0_B5_OR	$20
	#define BRM0_B_OR	$3f

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

; DDC/DMA Interface
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

	EXTERN AHR.b		; DDC1/2B Address Pointer High Register

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

; I2C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN I2CDR.b		; Data Register

	EXTERN I2COAR.b		; Own Address Register
	#define I2COAR_ADD0	0		;Address Direction Bit
	#define I2COAR_ADD0_OR	$01
	#define I2COAR_ADD1	1		;Interface Address
	#define I2COAR_ADD1_OR	$02
	#define I2COAR_ADD2	2		;Interface Address
	#define I2COAR_ADD2_OR	$04
	#define I2COAR_ADD3	3		;Interface Address
	#define I2COAR_ADD3_OR	$08
	#define I2COAR_ADD4	4		;Interface Address
	#define I2COAR_ADD4_OR	$10
	#define I2COAR_ADD5	5		;Interface Address
	#define I2COAR_ADD5_OR	$20
	#define I2COAR_ADD6	6		;Interface Address
	#define I2COAR_ADD6_OR	$40
	#define I2COAR_ADD7	7		;Interface Address
	#define I2COAR_ADD7_OR	$80
	#define I2COAR_ADD_OR	$fe

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
	#define I2CSR2_GCAL	0		;General Call
	#define I2CSR2_GCAL_OR	$01
	#define I2CSR2_BERR	1		;Bus Error
	#define I2CSR2_BERR_OR	$02
	#define I2CSR2_ARLO	2		;Arbitration Lost
	#define I2CSR2_ARLO_OR	$04
	#define I2CSR2_STOPF	3		;Stop Detection
	#define I2CSR2_STOPF_OR	$08
	#define I2CSR2_AF	4		;Acknowledge Failure
	#define I2CSR2_AF_OR	$10

	EXTERN I2CSR1.b		; Status Register 1
	#define I2CSR1_SB	0		;Start Bit
	#define I2CSR1_SB_OR	$01
	#define I2CSR1_M_SL	1		;Master/Slave Mode
	#define I2CSR1_M_SL_OR	$02
	#define I2CSR1_ADSL	2		;Address Matched
	#define I2CSR1_ADSL_OR	$04
	#define I2CSR1_BTF	3		;Byte Transfer
	#define I2CSR1_BTF_OR	$08
	#define I2CSR1_BUSY	4		;Bus Busy
	#define I2CSR1_BUSY_OR	$10
	#define I2CSR1_TRA	5		;Transmitter/Receiver
	#define I2CSR1_TRA_OR	$20
	#define I2CSR1_ADD10	6		;10-Bit Addressing Mode
	#define I2CSR1_ADD10_OR	$40
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
	#define I2CCR_ENGC	4		;General Call
	#define I2CCR_ENGC_OR	$10
	#define I2CCR_PE	5		;Peripheral I2C
	#define I2CCR_PE_OR	$20

	#endif ; __ST7277__
