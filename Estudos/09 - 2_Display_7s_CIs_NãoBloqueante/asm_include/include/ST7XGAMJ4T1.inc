; ST7XGAMJ4T1.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7XGAMJ4T1__
; do nothing
	#else
	#define __ST7XGAMJ4T1__ 1

; ST7XGAMJ4T1


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

; Interrupt Register
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ITRFREC.b		; Interrupt Register Port C
	#define ITRFREC_IT1E	0		;Interrupt IT1 Enable
	#define ITRFREC_IT1E_OR	$01
	#define ITRFREC_IT2E	1		;Interrupt IT2 Enable
	#define ITRFREC_IT2E_OR	$02
	#define ITRFREC_IT3E	2		;Interrupt IT3 Enable
	#define ITRFREC_IT3E_OR	$04
	#define ITRFREC_IT4E	3		;Interrupt IT4 Enable
	#define ITRFREC_IT4E_OR	$08
	#define ITRFREC_IT5E	4		;Interrupt IT5 Enable
	#define ITRFREC_IT5E_OR	$10
	#define ITRFREC_IT6E	5		;Interrupt IT6 Enable
	#define ITRFREC_IT6E_OR	$20
	#define ITRFREC_IT7E	6		;Interrupt IT7 Enable
	#define ITRFREC_IT7E_OR	$40
	#define ITRFREC_IT8E	7		;Interrupt IT8 Enable
	#define ITRFREC_IT8E_OR	$80

	EXTERN ITRFRED.b		; Interrupt Register Port D
	#define ITRFRED_IT9E	0		;Interrupt IT9 Enable
	#define ITRFRED_IT9E_OR	$01
	#define ITRFRED_IT10E	1		;Interrupt IT10 Enable
	#define ITRFRED_IT10E_OR	$02
	#define ITRFRED_IT11E	2		;Interrupt IT11 Enable
	#define ITRFRED_IT11E_OR	$04
	#define ITRFRED_IT12E	3		;Interrupt IT12 Enable
	#define ITRFRED_IT12E_OR	$08
	#define ITRFRED_IT13E	4		;Interrupt IT13 Enable
	#define ITRFRED_IT13E_OR	$10
	#define ITRFRED_IT14E	5		;Interrupt IT14 Enable
	#define ITRFRED_IT14E_OR	$20
	#define ITRFRED_IT15E	6		;Interrupt IT15 Enable
	#define ITRFRED_IT15E_OR	$40

	EXTERN ITRFREE.b		; Interrupt Register Port E
	#define ITRFREE_IT16E	0		;Interrupt IT16 Enable
	#define ITRFREE_IT16E_OR	$01
	#define ITRFREE_IT17E	1		;Interrupt IT17 Enable
	#define ITRFREE_IT17E_OR	$02
	#define ITRFREE_IT18E	2		;Interrupt IT18 Enable
	#define ITRFREE_IT18E_OR	$04
	#define ITRFREE_IT19E	3		;Interrupt IT19 Enable
	#define ITRFREE_IT19E_OR	$08
	#define ITRFREE_IT20E	4		;Interrupt IT20 Enable
	#define ITRFREE_IT20E_OR	$10
	#define ITRFREE_IT21E	5		;Interrupt IT21 Enable
	#define ITRFREE_IT21E_OR	$20
	#define ITRFREE_IT22E	6		;Interrupt IT22 Enable
	#define ITRFREE_IT22E_OR	$40
	#define ITRFREE_IT23E	7		;Interrupt IT23 Enable
	#define ITRFREE_IT23E_OR	$80

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR1.b		; Miscellaneous Register 1
	#define MISCR1_CSEL	0		;Fcpu clock selection
	#define MISCR1_CSEL_OR	$01
	#define MISCR1_MCO	1		;Main Clock Out
	#define MISCR1_MCO_OR	$02
	#define MISCR1_IS20	2		;EI2 Sensibility
	#define MISCR1_IS20_OR	$04
	#define MISCR1_IS21	3		;EI2 Sensibility
	#define MISCR1_IS21_OR	$08
	#define MISCR1_IS2_OR	$0c
	#define MISCR1_IS10	4		;EI1 Sensibility
	#define MISCR1_IS10_OR	$10
	#define MISCR1_IS11	5		;EI1 Sensibility
	#define MISCR1_IS11_OR	$20
	#define MISCR1_IS1_OR	$30
	#define MISCR1_IS00	6		;EI0 Sensibility
	#define MISCR1_IS00_OR	$40
	#define MISCR1_IS01	7		;EI0 Sensibility
	#define MISCR1_IS01_OR	$80
	#define MISCR1_IS0_OR	$c0

	EXTERN MISCR2.b		; Miscellaneous Register 2
	#define MISCR2_PAODPU	0		;Port A Open Drain Pull Up
	#define MISCR2_PAODPU_OR	$01
	#define MISCR2_PBODPU	1		;Port B Open Drain Pull Up
	#define MISCR2_PBODPU_OR	$02
	#define MISCR2_PEODPU	2		;Port E Open Drain Pull Up
	#define MISCR2_PEODPU_OR	$04
	#define MISCR2_ADIE	3		;A/D Converter Interrupt Enable
	#define MISCR2_ADIE_OR	$08
	#define MISCR2_ADSTS	4		;A/D Converter Sample Time Stretch
	#define MISCR2_ADSTS_OR	$10
	#define MISCR2_PACK0	6		;Package selection
	#define MISCR2_PACK0_OR	$40
	#define MISCR2_PACK1	7		;Package selection
	#define MISCR2_PACK1_OR	$80
	#define MISCR2_PACK_OR	$c0

; 10-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADCDRH.b		; ADC Data Register High

	EXTERN ADCDRL.b		; ADC Data Register Low

	EXTERN ADCCSR.b		; Control/Status Register
	#define ADCCSR_CS0	0		;Channel Selection
	#define ADCCSR_CS0_OR	$01
	#define ADCCSR_CS1	1		;Channel Selection
	#define ADCCSR_CS1_OR	$02
	#define ADCCSR_CS2	2		;Channel Selection
	#define ADCCSR_CS2_OR	$04
	#define ADCCSR_CS3	3		;Channel Selection
	#define ADCCSR_CS3_OR	$08
	#define ADCCSR_CS_OR	$0f
	#define ADCCSR_ADON	4		;A/D Start Converter
	#define ADCCSR_ADON_OR	$10
	#define ADCCSR_PRSC0	5		;A/D Clock prescaler Selection
	#define ADCCSR_PRSC0_OR	$20
	#define ADCCSR_PRSC1	6		;A/D Clock prescaler Selection
	#define ADCCSR_PRSC1_OR	$40
	#define ADCCSR_PRSC_OR	$60
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

; Auto Reload Timer
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
	#define ARTICCSR_CF1	0		;Capture Flag
	#define ARTICCSR_CF1_OR	$01
	#define ARTICCSR_CF2	1		;Capture Flag
	#define ARTICCSR_CF2_OR	$02
	#define ARTICCSR_CF_OR	$03
	#define ARTICCSR_CIE1	2		;Capture Interrupt Enable
	#define ARTICCSR_CIE1_OR	$04
	#define ARTICCSR_CIE2	3		;Capture Interrupt Enable
	#define ARTICCSR_CIE2_OR	$08
	#define ARTICCSR_CIE_OR	$0c
	#define ARTICCSR_CS1	4		;Capture Sensitivity
	#define ARTICCSR_CS1_OR	$10
	#define ARTICCSR_CS2	5		;Capture Sensitivity
	#define ARTICCSR_CS2_OR	$20
	#define ARTICCSR_CS_OR	$30

	EXTERN ARTICR1.b		; ART Input Capture Register 1

	EXTERN ARTICR2.b		; ART Input Capture Register 2

; USB embedded function
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
	#define USBCTLR_CONNECT	2		;connect
	#define USBCTLR_CONNECT_OR	$04
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
	#define USBSR_EP0	0		;Endpoint Number
	#define USBSR_EP0_OR	$01
	#define USBSR_EP1	1		;Endpoint Number
	#define USBSR_EP1_OR	$02
	#define USBSR_EP2	2		;Endpoint Number
	#define USBSR_EP2_OR	$04
	#define USBSR_EP_OR	$07
	#define USBSR_IN_OUT	5		;Last Transaction Direction for Endpoint (1 to 5)
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
	#define CNT0RXR_CNT_OR	$0f

	EXTERN CNT0TXR.b		; Endpoint 0 Transmission Counter Register
	#define CNT0TXR_CNT0	0		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT0_OR	$01
	#define CNT0TXR_CNT1	1		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT1_OR	$02
	#define CNT0TXR_CNT2	2		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT2_OR	$04
	#define CNT0TXR_CNT3	3		;Number of Bytes to be transmitted by Ep0
	#define CNT0TXR_CNT3_OR	$08
	#define CNT0TXR_CNT_OR	$0f

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
	#define CNT1TXR_CNT_OR	$0f

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
	#define EP2TXR_CTR_TX	3		;Correct Transmission Transfer
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

	EXTERN EP3TXR.b		; Endpoint 3 Transmission Register
	#define EP3TXR_STAT_TX0	0		;Status bits (Transmission)
	#define EP3TXR_STAT_TX0_OR	$01
	#define EP3TXR_STAT_TX1	1		;Status bits (Transmission)
	#define EP3TXR_STAT_TX1_OR	$02
	#define EP3TXR_STAT_TX_OR	$03
	#define EP3TXR_DTOG_TX	2		;Data Toggle (Transmission)
	#define EP3TXR_DTOG_TX_OR	$04
	#define EP3TXR_CTR_TX	3		;Correct Transmission Transfer
	#define EP3TXR_CTR_TX_OR	$08

	EXTERN CNT3TXR.b		; Endpoint 3 Transmission Counter Register
	#define CNT3TXR_CNT0	0		;Number of Bytes to be transmitted by EP3
	#define CNT3TXR_CNT0_OR	$01
	#define CNT3TXR_CNT1	1		;Number of Bytes to be transmitted by EP3
	#define CNT3TXR_CNT1_OR	$02
	#define CNT3TXR_CNT2	2		;Number of Bytes to be transmitted by EP3
	#define CNT3TXR_CNT2_OR	$04
	#define CNT3TXR_CNT3	3		;Number of Bytes to be transmitted by EP3
	#define CNT3TXR_CNT3_OR	$08
	#define CNT3TXR_CNT_OR	$0f

	EXTERN EP4TXR.b		; Endpoint 4 Transmission Register
	#define EP4TXR_STAT_TX0	0		;Status bits (Transmission)
	#define EP4TXR_STAT_TX0_OR	$01
	#define EP4TXR_STAT_TX1	1		;Status bits (Transmission)
	#define EP4TXR_STAT_TX1_OR	$02
	#define EP4TXR_STAT_TX_OR	$03
	#define EP4TXR_DTOG_TX	2		;Data Toggle (Transmission)
	#define EP4TXR_DTOG_TX_OR	$04
	#define EP4TXR_CTR_TX	3		;Correct Transmission Transfer
	#define EP4TXR_CTR_TX_OR	$08

	EXTERN CNT4TXR.b		; Endpoint 4 Transmission Counter Register
	#define CNT4TXR_CNT0	0		;Number of Bytes to be transmitted by EP4
	#define CNT4TXR_CNT0_OR	$01
	#define CNT4TXR_CNT1	1		;Number of Bytes to be transmitted by EP4
	#define CNT4TXR_CNT1_OR	$02
	#define CNT4TXR_CNT2	2		;Number of Bytes to be transmitted by EP4
	#define CNT4TXR_CNT2_OR	$04
	#define CNT4TXR_CNT3	3		;Number of Bytes to be transmitted by EP4
	#define CNT4TXR_CNT3_OR	$08
	#define CNT4TXR_CNT_OR	$0f

	EXTERN EP5TXR.b		; Endpoint 5 Transmission Register
	#define EP5TXR_STAT_TX0	0		;Status bits (Transmission)
	#define EP5TXR_STAT_TX0_OR	$01
	#define EP5TXR_STAT_TX1	1		;Status bits (Transmission)
	#define EP5TXR_STAT_TX1_OR	$02
	#define EP5TXR_STAT_TX_OR	$03
	#define EP5TXR_DTOG_TX	2		;Data Toggle (Transmission)
	#define EP5TXR_DTOG_TX_OR	$04
	#define EP5TXR_CTR_TX	3		;Correct Transmission Transfer
	#define EP5TXR_CTR_TX_OR	$08

	EXTERN CNT5TXR.b		; Endpoint 5 Transmission Counter Register
	#define CNT5TXR_CNT0	0		;Number of Bytes to be transmitted by EP5
	#define CNT5TXR_CNT0_OR	$01
	#define CNT5TXR_CNT1	1		;Number of Bytes to be transmitted by EP5
	#define CNT5TXR_CNT1_OR	$02
	#define CNT5TXR_CNT2	2		;Number of Bytes to be transmitted by EP5
	#define CNT5TXR_CNT2_OR	$04
	#define CNT5TXR_CNT3	3		;Number of Bytes to be transmitted by EP5
	#define CNT5TXR_CNT3_OR	$08
	#define CNT5TXR_CNT_OR	$0f

	EXTERN ERRSR.b		; Error Status Register
	#define ERRSR_ERR0	0		;Error Type
	#define ERRSR_ERR0_OR	$01
	#define ERRSR_ERR1	1		;Error Type
	#define ERRSR_ERR1_OR	$02
	#define ERRSR_ERR2	2		;Error Type
	#define ERRSR_ERR2_OR	$04
	#define ERRSR_ERR_OR	$07

; Interrupt Software Priority (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;Flash Start Programming Interrupt Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;Flash Start Programming Interrupt Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;USB interrupt vector Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;USB interrupt vector Priority Level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;External IT port C (ei0) Priority Level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;External IT port C (ei0) Priority Level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;External IT port D (ei1) Priority Level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;External IT port D (ei1) Priority Level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR1.b		; Interrupt Software Priority Register 1
	#define ISPR1_I0_4	0		;External IT port E (ei2) Priority Level
	#define ISPR1_I0_4_OR	$01
	#define ISPR1_I1_4	1		;External IT port E (ei2) Priority Level
	#define ISPR1_I1_4_OR	$02
	#define ISPR1_I_4_OR	$03
	#define ISPR1_I0_5	2		;Timebase Unit interrupt Priority Level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;Timebase Unit interrupt Priority Level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;ART/PWM Timer interrupt Priority Level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;ART/PWM Timer interrupt Priority Level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;SPI interrupt Priority Level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;SPI interrupt Priority Level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;USB End Suspend interrupt Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;USB End Suspend interrupt Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_9	2		;USB Embedded Function Priority Level
	#define ISPR2_I0_9_OR	$04
	#define ISPR2_I1_9	3		;USB Embedded Function Priority Level
	#define ISPR2_I1_9_OR	$08
	#define ISPR2_I_9_OR	$0c

	EXTERN ISPR3.b		; Not used

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

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

	#endif ; __ST7XGAMJ4T1__
