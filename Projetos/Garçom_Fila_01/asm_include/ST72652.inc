; ST72652.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST72652__
; do nothing
	#else
	#define __ST72652__ 1

; ST72652


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

	EXTERN PAOR.b		; Option Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBDDR.b		; Data Direction Register

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

; Power Control Register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PCR.b		; Power Control Register
	#define PCR_REGEN	0		;Voltage Regulator Enable
	#define PCR_REGEN_OR	$01
	#define PCR_DETEN	1		;USB Voltage Detector Enable
	#define PCR_DETEN_OR	$02
	#define PCR_VSET0	2		;Voltage Regulator Output Voltage
	#define PCR_VSET0_OR	$04
	#define PCR_VSET1	3		;Voltage Regulator Output Voltage
	#define PCR_VSET1_OR	$08
	#define PCR_VSET_OR	$0c
	#define PCR_PLGIE	4		;USB Plug/Unplug Interrupt Enable
	#define PCR_PLGIE_OR	$10
	#define PCR_PLG	5		;USB Plug/Unplug Detection
	#define PCR_PLG_OR	$20
	#define PCR_ITMF	6		;Voltage Input Threshold Minus Flag
	#define PCR_ITMF_OR	$40
	#define PCR_ITPF	7		;Voltage Input Threshold Plus Flag
	#define PCR_ITPF_OR	$80

; Data Transfer Coprocessor (DTC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN DTCCR.b		; DTC Control Register
	#define DTCCR_RUN	0		;START/STOP Control
	#define DTCCR_RUN_OR	$01
	#define DTCCR_INIT	1		;Initialization
	#define DTCCR_INIT_OR	$02
	#define DTCCR_LOAD	2		;Load enable
	#define DTCCR_LOAD_OR	$04
	#define DTCCR_STOPEN	3		;Stop Interrupt Enable
	#define DTCCR_STOPEN_OR	$08
	#define DTCCR_ERREN	4		;error Interrupt Enable
	#define DTCCR_ERREN_OR	$10

	EXTERN DTCSR.b		; DTC Status Register
	#define DTCSR_STOP	0		;Stop Flag
	#define DTCSR_STOP_OR	$01
	#define DTCSR_ERROR	1		;Error Flag
	#define DTCSR_ERROR_OR	$02

	EXTERN DTCPR.b		; DTC Pointer Register

; 16-Bit Timer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TCR1.b		; Control Register 1
	#define TCR1_OLVL1	0		;Output Level 1
	#define TCR1_OLVL1_OR	$01
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

	EXTERN TCR2.b		; Control Register 2
	#define TCR2_CC0	2		;Clock Control
	#define TCR2_CC0_OR	$04
	#define TCR2_CC1	3		;Clock Control
	#define TCR2_CC1_OR	$08
	#define TCR2_CC_OR	$0c
	#define TCR2_OC2E	6		;Output Compare 2 Output Pin
	#define TCR2_OC2E_OR	$40
	#define TCR2_OC1E	7		;Output Compare 1 Output Pin
	#define TCR2_OC1E_OR	$80

	EXTERN TSR.b		; Status Register
	#define TSR_OCF2	3		;Output Compare Flag 2
	#define TSR_OCF2_OR	$08
	#define TSR_TOF	5		;Timer Overflow
	#define TSR_TOF_OR	$20
	#define TSR_OCF1	6		;Output Compare Flag 1
	#define TSR_OCF1_OR	$40

	EXTERN TCHR.b		; Counter High Register

	EXTERN TCLR.b		; Counter Low Register

	EXTERN TACHR.b		; Alternate Counter High Register

	EXTERN TACLR.b		; Alternate Counter Low Register

	EXTERN TOC1HR.b		; Output Compare 1 High Register

	EXTERN TOC1LR.b		; Output Compare 1 Low Register

	EXTERN TOC2HR.b		; Output Compare 2 High Register

	EXTERN TOC2LR.b		; Output Compare 2 Low Register

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

; Interrupt Software Priority (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;Flash Start Programming Interrupt Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;Flash Start Programming Interrupt Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;Power Management USB Plug/Unplug Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;Power Management USB Plug/Unplug Priority Level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;External IT port A Priority Level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;External IT port A Priority Level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;DTC Peripheral Interrupt Priority Level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;DTC Peripheral Interrupt Priority Level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR1.b		; Interrupt Software Priority Register 1
	#define ISPR1_I0_4	0		;USB Peripheral Interrupt Priority Level
	#define ISPR1_I0_4_OR	$01
	#define ISPR1_I1_4	1		;USB Peripheral Interrupt Priority Level
	#define ISPR1_I1_4_OR	$02
	#define ISPR1_I_4_OR	$03
	#define ISPR1_I0_5	2		;USB End Suspend Interrupt Priority Level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;USB End Suspend Interrupt Priority Level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;External IT port D Priority Level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;External IT port D Priority Level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;I2C Interrupt Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;I2C Interrupt Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;Timer IT Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;Timer IT Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_9	2		;External IT port C Priority Level
	#define ISPR2_I0_9_OR	$04
	#define ISPR2_I1_9	3		;External IT port C Priority Level
	#define ISPR2_I1_9_OR	$08
	#define ISPR2_I_9_OR	$0c
	#define ISPR2_I0_10	4		;SPI IT Priority Level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;SPI IT Priority Level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30

	EXTERN ISPR3.b		; Not used

; Universal Serail Bus (USB)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN USBISTR.b		; Interrupt Status Register
	#define USBISTR_SOF	0		;Start Of Frame
	#define USBISTR_SOF_OR	$01
	#define USBISTR_RESET	1		;USB Reset
	#define USBISTR_RESET_OR	$02
	#define USBISTR_ESUSP	2		;End Suspend Mode
	#define USBISTR_ESUSP_OR	$04
	#define USBISTR_SUSP	3		;Suspend Mode Request
	#define USBISTR_SUSP_OR	$08
	#define USBISTR_ERROR	4		;Error Bit
	#define USBISTR_ERROR_OR	$10
	#define USBISTR_SOVR	5		;Setup Overrun
	#define USBISTR_SOVR_OR	$20
	#define USBISTR_CTR	7		;Correct Transfer
	#define USBISTR_CTR_OR	$80

	EXTERN USBIMR.b		; Interrupt Mask Register
	#define USBIMR_SOFM	0		;Mask Start Of Frame
	#define USBIMR_SOFM_OR	$01
	#define USBIMR_RESETM	1		;Mask USB Reset
	#define USBIMR_RESETM_OR	$02
	#define USBIMR_ESUSPM	2		;Mask End Suspend Mode
	#define USBIMR_ESUSPM_OR	$04
	#define USBIMR_SUSPM	3		;Mask Suspend Mode Request
	#define USBIMR_SUSPM_OR	$08
	#define USBIMR_ERRM	4		;Mask Error
	#define USBIMR_ERRM_OR	$10
	#define USBIMR_SOVRM	5		;Mask Setup Overrun
	#define USBIMR_SOVRM_OR	$20
	#define USBIMR_CTRM	7		;Mask Correct Transfer
	#define USBIMR_CTRM_OR	$80

	EXTERN USBCTLR.b		; Control Register
	#define USBCTLR_FRES	0		;Force Reset
	#define USBCTLR_FRES_OR	$01
	#define USBCTLR_FSUSP	1		;Force Suspend
	#define USBCTLR_FSUSP_OR	$02
	#define USBCTLR_PDWN	2		;Power Down
	#define USBCTLR_PDWN_OR	$04
	#define USBCTLR_RESUME	3		;Resume
	#define USBCTLR_RESUME_OR	$08
	#define USBCTLR_USB_RST	6		;Reset Detected
	#define USBCTLR_USB_RST_OR	$40
	#define USBCTLR_RSM	7		;Resume Detected
	#define USBCTLR_RSM_OR	$80

	EXTERN DADDR.b		; Device Address Register
	#define DADDR_ADD0	0		;Device address 7 bits
	#define DADDR_ADD0_OR	$01
	#define DADDR_ADD1	1		;Device address 7 bits
	#define DADDR_ADD1_OR	$02
	#define DADDR_ADD2	2		;Device address 7 bits
	#define DADDR_ADD2_OR	$04
	#define DADDR_ADD3	3		;Device address 7 bits
	#define DADDR_ADD3_OR	$08
	#define DADDR_ADD4	4		;Device address 7 bits
	#define DADDR_ADD4_OR	$10
	#define DADDR_ADD5	5		;Device address 7 bits
	#define DADDR_ADD5_OR	$20
	#define DADDR_ADD6	6		;Device address 7 bits
	#define DADDR_ADD6_OR	$40
	#define DADDR_ADD_OR	$7f

	EXTERN USBSR.b		; Status Register
	#define USBSR_ERR0	0		;Error Type
	#define USBSR_ERR0_OR	$01
	#define USBSR_ERR1	1		;Error Type
	#define USBSR_ERR1_OR	$02
	#define USBSR_ERR2	2		;Error Type
	#define USBSR_ERR2_OR	$04
	#define USBSR_ERR_OR	$07
	#define USBSR_EP0	3		;Endpoint Number
	#define USBSR_EP0_OR	$08
	#define USBSR_EP1	4		;Endpoint Number
	#define USBSR_EP1_OR	$10
	#define USBSR_EP_OR	$18
	#define USBSR_IN_OUT	5		;Last Transaction Direction for Endpoint (1 to 2)
	#define USBSR_IN_OUT_OR	$20
	#define USBSR_PID0	6		;Token PID bits 1&0 for Endpoint 0 Control
	#define USBSR_PID0_OR	$40
	#define USBSR_PID1	7		;Token PID bits 1&0 for Endpoint 0 Control
	#define USBSR_PID1_OR	$80
	#define USBSR_PID_OR	$c0

	EXTERN EP0R.b		; Endpoint 0 Register
	#define EP0R_STAT_RX0	0		;Status bits (Reception)
	#define EP0R_STAT_RX0_OR	$01
	#define EP0R_STAT_RX1	1		;Status bits (Reception)
	#define EP0R_STAT_RX1_OR	$02
	#define EP0R_STAT_RX_OR	$03
	#define EP0R_DTOG_RX	2		;Data Toggle (Reception)
	#define EP0R_DTOG_RX_OR	$04
	#define EP0R_STAT_TX0	4		;Status bits (Transmission)
	#define EP0R_STAT_TX0_OR	$10
	#define EP0R_STAT_TX1	5		;Status bits (Transmission)
	#define EP0R_STAT_TX1_OR	$20
	#define EP0R_STAT_TX_OR	$30
	#define EP0R_DTOG_TX	6		;Data Toggle (Transmission)
	#define EP0R_DTOG_TX_OR	$40
	#define EP0R_CTR0	7		;Correct Transfer on EP0
	#define EP0R_CTR0_OR	$80

	EXTERN CNT0RXR.b		; Endpoint 0 Reception Counter Register
	#define CNT0RXR_CNT0	0		;Buffer Size for Ep0 Reception
	#define CNT0RXR_CNT0_OR	$01
	#define CNT0RXR_CNT1	1		;Buffer Size for Ep0 Reception
	#define CNT0RXR_CNT1_OR	$02
	#define CNT0RXR_CNT2	2		;Buffer Size for Ep0 Reception
	#define CNT0RXR_CNT2_OR	$04
	#define CNT0RXR_CNT3	3		;Buffer Size for Ep0 Reception
	#define CNT0RXR_CNT3_OR	$08
	#define CNT0RXR_CNT4	4		;Buffer Size for Ep0 Reception
	#define CNT0RXR_CNT4_OR	$10
	#define CNT0RXR_CNT_OR	$1f

	EXTERN CNT0TXR.b		; Endpoint 0 Transmission Counter Register
	#define CNT0TXR_CNT0	0		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT0_OR	$01
	#define CNT0TXR_CNT1	1		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT1_OR	$02
	#define CNT0TXR_CNT2	2		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT2_OR	$04
	#define CNT0TXR_CNT3	3		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT3_OR	$08
	#define CNT0TXR_CNT4	4		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT4_OR	$10
	#define CNT0TXR_CNT_OR	$1f

	EXTERN EP1RXR.b		; Endpoint 1 Reception Register
	#define EP1RXR_STAT_RX0	0		;Status bits (Reception)
	#define EP1RXR_STAT_RX0_OR	$01
	#define EP1RXR_STAT_RX1	1		;Status bits (Reception)
	#define EP1RXR_STAT_RX1_OR	$02
	#define EP1RXR_STAT_RX_OR	$03
	#define EP1RXR_DTOG_RX	2		;Data Toggle (Reception)
	#define EP1RXR_DTOG_RX_OR	$04
	#define EP1RXR_CTR_RX	3		;Correct Reception Transfer
	#define EP1RXR_CTR_RX_OR	$08

	EXTERN CNT1RXR.b		; Endpoint 1 Reception Counter Register
	#define CNT1RXR_CNT0	0		;Buffer Size for Ep1 Reception
	#define CNT1RXR_CNT0_OR	$01
	#define CNT1RXR_CNT1	1		;Buffer Size for Ep1 Reception
	#define CNT1RXR_CNT1_OR	$02
	#define CNT1RXR_CNT2	2		;Buffer Size for Ep1 Reception
	#define CNT1RXR_CNT2_OR	$04
	#define CNT1RXR_CNT3	3		;Buffer Size for Ep1 Reception
	#define CNT1RXR_CNT3_OR	$08
	#define CNT1RXR_CNT4	4		;Buffer Size for Ep1 Reception
	#define CNT1RXR_CNT4_OR	$10
	#define CNT1RXR_CNT_OR	$1f

	EXTERN EP1TXR.b		; Endpoint 1 Transmission Register
	#define EP1TXR_STAT_TX0	0		;Status bits (Transmission)
	#define EP1TXR_STAT_TX0_OR	$01
	#define EP1TXR_STAT_TX1	1		;Status bits (Transmission)
	#define EP1TXR_STAT_TX1_OR	$02
	#define EP1TXR_STAT_TX_OR	$03
	#define EP1TXR_DTOG_TX	2		;Data Toggle (Transmission)
	#define EP1TXR_DTOG_TX_OR	$04
	#define EP1TXR_CTR_TX	3		;Transmission Transfer Correct
	#define EP1TXR_CTR_TX_OR	$08

	EXTERN CNT1TXR.b		; Endpoint 1 Transmission Counter Register
	#define CNT1TXR_CNT0	0		;Number of Bytes to be transmitted by Ep1
	#define CNT1TXR_CNT0_OR	$01
	#define CNT1TXR_CNT1	1		;Number of Bytes to be transmitted by Ep1
	#define CNT1TXR_CNT1_OR	$02
	#define CNT1TXR_CNT2	2		;Number of Bytes to be transmitted by Ep1
	#define CNT1TXR_CNT2_OR	$04
	#define CNT1TXR_CNT3	3		;Number of Bytes to be transmitted by Ep1
	#define CNT1TXR_CNT3_OR	$08
	#define CNT1TXR_CNT4	4		;Number of Bytes to be transmitted by Ep1
	#define CNT1TXR_CNT4_OR	$10
	#define CNT1TXR_CNT_OR	$1f

	EXTERN EP2RXR.b		; Endpoint 2 Reception Register
	#define EP2RXR_STAT_RX0	0		;Status bits (Reception)
	#define EP2RXR_STAT_RX0_OR	$01
	#define EP2RXR_STAT_RX1	1		;Status bits (Reception)
	#define EP2RXR_STAT_RX1_OR	$02
	#define EP2RXR_STAT_RX_OR	$03
	#define EP2RXR_DTOG_RX	2		;Data Toggle (Reception)
	#define EP2RXR_DTOG_RX_OR	$04
	#define EP2RXR_CTR_RX	3		;Correct Reception Transfer
	#define EP2RXR_CTR_RX_OR	$08
	#define EP2RXR_MOD0	6		;Endpoint 2 mode
	#define EP2RXR_MOD0_OR	$40
	#define EP2RXR_MOD1	7		;Endpoint 2 mode
	#define EP2RXR_MOD1_OR	$80
	#define EP2RXR_MOD_OR	$c0

	EXTERN CNT2RXR.b		; Endpoint 2 Reception Counter Register
	#define CNT2RXR_CNT0	0		;Buffer Size for Ep2 Reception
	#define CNT2RXR_CNT0_OR	$01
	#define CNT2RXR_CNT1	1		;Buffer Size for Ep2 Reception
	#define CNT2RXR_CNT1_OR	$02
	#define CNT2RXR_CNT2	2		;Buffer Size for Ep2 Reception
	#define CNT2RXR_CNT2_OR	$04
	#define CNT2RXR_CNT3	3		;Buffer Size for Ep2 Reception
	#define CNT2RXR_CNT3_OR	$08
	#define CNT2RXR_CNT4	4		;Buffer Size for Ep2 Reception
	#define CNT2RXR_CNT4_OR	$10
	#define CNT2RXR_CNT5	5		;Buffer Size for Ep2 Reception
	#define CNT2RXR_CNT5_OR	$20
	#define CNT2RXR_CNT6	6		;Buffer Size for Ep2 Reception
	#define CNT2RXR_CNT6_OR	$40
	#define CNT2RXR_CNT_OR	$7f

	EXTERN EP2TXR.b		; Endpoint 2 Transmission Register
	#define EP2TXR_STAT_TX0	0		;Status bits (Transmission)
	#define EP2TXR_STAT_TX0_OR	$01
	#define EP2TXR_STAT_TX1	1		;Status bits (Transmission)
	#define EP2TXR_STAT_TX1_OR	$02
	#define EP2TXR_STAT_TX_OR	$03
	#define EP2TXR_DTOG_TX	2		;Data Toggle (Transmission)
	#define EP2TXR_DTOG_TX_OR	$04
	#define EP2TXR_CTR_TX	3		;Transmission Transfer Correct
	#define EP2TXR_CTR_TX_OR	$08

	EXTERN CNT2TXR.b		; Endpoint 2 Transmission Counter Register
	#define CNT2TXR_CNT0	0		;Number of Bytes to be transmitted by Ep2
	#define CNT2TXR_CNT0_OR	$01
	#define CNT2TXR_CNT1	1		;Number of Bytes to be transmitted by Ep2
	#define CNT2TXR_CNT1_OR	$02
	#define CNT2TXR_CNT2	2		;Number of Bytes to be transmitted by Ep2
	#define CNT2TXR_CNT2_OR	$04
	#define CNT2TXR_CNT3	3		;Number of Bytes to be transmitted by Ep2
	#define CNT2TXR_CNT3_OR	$08
	#define CNT2TXR_CNT4	4		;Number of Bytes to be transmitted by Ep2
	#define CNT2TXR_CNT4_OR	$10
	#define CNT2TXR_CNT5	5		;Number of Bytes to be transmitted by Ep2
	#define CNT2TXR_CNT5_OR	$20
	#define CNT2TXR_CNT6	6		;Number of Bytes to be transmitted by Ep2
	#define CNT2TXR_CNT6_OR	$40
	#define CNT2TXR_CNT_OR	$7f

; USB Buffer Control/Status Register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN BUFCSR.b		; Buffer Control/Status Register
	#define BUFCSR_CLR	0		;Clear Buffer Status
	#define BUFCSR_CLR_OR	$01
	#define BUFCSR_STATB0	1		;Buffer 0 Status Bit
	#define BUFCSR_STATB0_OR	$02
	#define BUFCSR_STATB1	2		;Buffer 1 Status Bit
	#define BUFCSR_STATB1_OR	$04
	#define BUFCSR_BUFNUM	3		;Current USB Buffer Number
	#define BUFCSR_BUFNUM_OR	$08

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR1.b		; Miscellaneous1
	#define MISCR1_CPEN	0		;Clock Prescaler Enable
	#define MISCR1_CPEN_OR	$01
	#define MISCR1_CP0	1		;CPU clock prescaler
	#define MISCR1_CP0_OR	$02
	#define MISCR1_CP1	2		;CPU clock prescaler
	#define MISCR1_CP1_OR	$04
	#define MISCR1_CP_OR	$06
	#define MISCR1_IS20	3		;EI1 Sensitivity on port D
	#define MISCR1_IS20_OR	$08
	#define MISCR1_IS21	4		;EI1 Sensitivity on port D
	#define MISCR1_IS21_OR	$10
	#define MISCR1_IS2_OR	$18
	#define MISCR1_MCO	5		;Main Clock Out selection
	#define MISCR1_MCO_OR	$20
	#define MISCR1_IS10	6		;EI0 Sensitivity on port A
	#define MISCR1_IS10_OR	$40
	#define MISCR1_IS11	7		;EI0 Sensitivity on port A
	#define MISCR1_IS11_OR	$80
	#define MISCR1_IS1_OR	$c0

	EXTERN MISCR2.b		; Miscellaneous2
	#define MISCR2_PWM	0		;Power Management Bit
	#define MISCR2_PWM_OR	$01
	#define MISCR2_Timer	1		;Power Management Bit
	#define MISCR2_Timer_OR	$02
	#define MISCR2_I2C	2		;Power Management Bit
	#define MISCR2_I2C_OR	$04
	#define MISCR2_USB	3		;Power Management Bit
	#define MISCR2_USB_OR	$08
	#define MISCR2_DTC	4		;Power Management Bit
	#define MISCR2_DTC_OR	$10

	EXTERN MISCR3.b		; Miscellaneous3
	#define MISCR3_PWM0	0		;PWM0 Output Control
	#define MISCR3_PWM0_OR	$01
	#define MISCR3_PWM1	1		;PWM1 Output Control
	#define MISCR3_PWM1_OR	$02
	#define MISCR3_IS30	2		;Interrupt Sensitivity
	#define MISCR3_IS30_OR	$04
	#define MISCR3_IS31	3		;Interrupt Sensitivity
	#define MISCR3_IS31_OR	$08
	#define MISCR3_IS3_OR	$0c
	#define MISCR3_WDGHALT	7		;Watchdog and HALT Mode
	#define MISCR3_WDGHALT_OR	$80

	#endif ; __ST72652__
