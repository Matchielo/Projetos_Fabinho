; ST72P611F4.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST72P611F4__
; do nothing
	#else
	#define __ST72P611F4__ 1

; ST72P611F4


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBDDR.b		; Data Direction Register

; Interrupt Register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ITRFRE1.b		; Interrupt Register 1
	#define ITRFRE1_IT1E	0		;Interrupt IT1 Enable
	#define ITRFRE1_IT1E_OR	$01
	#define ITRFRE1_IT2E	1		;Interrupt IT2 Enable
	#define ITRFRE1_IT2E_OR	$02
	#define ITRFRE1_IT3E	2		;Interrupt IT3 Enable
	#define ITRFRE1_IT3E_OR	$04
	#define ITRFRE1_IT4E	3		;Interrupt IT4 Enable
	#define ITRFRE1_IT4E_OR	$08
	#define ITRFRE1_IT5E	4		;Interrupt IT5 Enable
	#define ITRFRE1_IT5E_OR	$10
	#define ITRFRE1_IT6E	5		;Interrupt IT6 Enable
	#define ITRFRE1_IT6E_OR	$20
	#define ITRFRE1_IT7E	6		;Interrupt IT7 Enable
	#define ITRFRE1_IT7E_OR	$40
	#define ITRFRE1_IT8E	7		;Interrupt IT8 Enable
	#define ITRFRE1_IT8E_OR	$80

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISC.b		; Miscellaneous Register
	#define MISC_MCO	0		;Main Clock Out
	#define MISC_MCO_OR	$01
	#define MISC_USBOE	1		;USB Output Enable
	#define MISC_USBOE_OR	$02
	#define MISC_SMS0	2		;Slow Mode Selection
	#define MISC_SMS0_OR	$04
	#define MISC_SMS1	3		;Slow Mode Selection
	#define MISC_SMS1_OR	$08
	#define MISC_SMS_OR	$0c

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

; Universal Serial Bus (USB)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN USBPIDR.b		; PID Register
	#define USBPIDR_RXD	1		;Received data
	#define USBPIDR_RXD_OR	$02
	#define USBPIDR_RX_SEZ	2		;Received single-ended zero
	#define USBPIDR_RX_SEZ_OR	$04
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

; Interrupt Software Priority (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;Flash Start Programming Interrupt Priority level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;Flash Start Programming Interrupt Priority level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;USB End Suspend Interrupt Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;USB End Suspend Interrupt Priority Level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;External Interrupt Port A Priority level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;External Interrupt Port A Priority level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;External Interrupt Port B Priority level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;External Interrupt Port B Priority level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR1.b		; Interrupt Software Priority Register 1
	#define ISPR1_I0_4	0		;External Interrupt Port C Priority level
	#define ISPR1_I0_4_OR	$01
	#define ISPR1_I1_4	1		;External Interrupt Port C Priority level
	#define ISPR1_I1_4_OR	$02
	#define ISPR1_I_4_OR	$03
	#define ISPR1_I0_5	2		;TBU Timer Interrupt Priority level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;TBU Timer Interrupt Priority level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;PWM Interrupt Priority level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;PWM Interrupt Priority level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;SPI Interrupt Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;SPI Interrupt Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;SCI Interrupt Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;SCI Interrupt Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_9	2		;USB Peripheral Interrupt Priority Level
	#define ISPR2_I0_9_OR	$04
	#define ISPR2_I1_9	3		;USB Peripheral Interrupt Priority Level
	#define ISPR2_I1_9_OR	$08
	#define ISPR2_I_9_OR	$0c
	#define ISPR2_I0_10	4		;ADC Interrupt Priority level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;ADC Interrupt Priority level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30

; TimeBase Unit (TBU)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TBUCV.b		; TBU Counter Value Register
	#define TBUCV_CV0	0		;Counter Value
	#define TBUCV_CV0_OR	$01
	#define TBUCV_CV1	1		;Counter Value
	#define TBUCV_CV1_OR	$02
	#define TBUCV_CV2	2		;Counter Value
	#define TBUCV_CV2_OR	$04
	#define TBUCV_CV3	3		;Counter Value
	#define TBUCV_CV3_OR	$08
	#define TBUCV_CV4	4		;Counter Value
	#define TBUCV_CV4_OR	$10
	#define TBUCV_CV5	5		;Counter Value
	#define TBUCV_CV5_OR	$20
	#define TBUCV_CV6	6		;Counter Value
	#define TBUCV_CV6_OR	$40
	#define TBUCV_CV7	7		;Counter Value
	#define TBUCV_CV7_OR	$80
	#define TBUCV_CV_OR	$ff

	EXTERN TBUCSR.b		; TBU Control/Status Register

	#endif ; __ST72P611F4__
