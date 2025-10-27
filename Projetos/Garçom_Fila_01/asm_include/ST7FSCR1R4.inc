; ST7FSCR1R4.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST7FSCR1R4__
; do nothing
	#else
	#define __ST7FSCR1R4__ 1

; ST7FSCR1R4


; Smart Card Controller
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CRDCR.b		; Smartcard Interface Control
	#define CRDCR_CONV	0		;ISO Convention Selection
	#define CRDCR_CONV_OR	$01
	#define CRDCR_CREP	1		;Automatic Character Repetition in Case of Parity Error
	#define CRDCR_CREP_OR	$02
	#define CRDCR_WTEN	2		;Waiting Time Counter Enable
	#define CRDCR_WTEN_OR	$04
	#define CRDCR_UART	3		;Card UART Mode Selection
	#define CRDCR_UART_OR	$08
	#define CRDCR_VCARD4	4		;Card Voltage Selection
	#define CRDCR_VCARD4_OR	$10
	#define CRDCR_VCARD5	5		;Card Voltage Selection
	#define CRDCR_VCARD5_OR	$20
	#define CRDCR_VCARD_OR	$30
	#define CRDCR_CRDDET	6		;Card Presence Detector
	#define CRDCR_CRDDET_OR	$40
	#define CRDCR_CRDRST	7		;Smartcard Interface Reset
	#define CRDCR_CRDRST_OR	$80

	EXTERN CRDSR.b		; Smartcard Interface Status
	#define CRDSR_PARF	0		;Parity Error Flag
	#define CRDSR_PARF_OR	$01
	#define CRDSR_RXCF	1		;Received Character Flag
	#define CRDSR_RXCF_OR	$02
	#define CRDSR_TXCF	2		;Transmitted character Flag
	#define CRDSR_TXCF_OR	$04
	#define CRDSR_WTF	3		;Waiting Time Counter Overflow Flag
	#define CRDSR_WTF_OR	$08
	#define CRDSR_VCARDOK	4		;Card Voltage Status Flag
	#define CRDSR_VCARDOK_OR	$10
	#define CRDSR_IOVF	5		;Card Overload Current Flag
	#define CRDSR_IOVF_OR	$20
	#define CRDSR_CRDIRF	6		;Card Insertion/Removal Flag
	#define CRDSR_CRDIRF_OR	$40
	#define CRDSR_TxBEF	7		;Transmit Buffer Empty Flag
	#define CRDSR_TxBEF_OR	$80

	EXTERN CRDCCR.b		; Smartcard Contact
	#define CRDCCR_CRDVCC	0		;CRDVCC Pin Control
	#define CRDCCR_CRDVCC_OR	$01
	#define CRDCCR_CRDRST	1		;CRDRST Pin Control
	#define CRDCCR_CRDRST_OR	$02
	#define CRDCCR_CRDCLK	2		;CRDCLK Pin Control
	#define CRDCCR_CRDCLK_OR	$04
	#define CRDCCR_CRDIO	3		;CRDIO pin Control
	#define CRDCCR_CRDIO_OR	$08
	#define CRDCCR_CRDC4	4		;CRDC4 Pin Control
	#define CRDCCR_CRDC4_OR	$10
	#define CRDCCR_CRDC8	5		;CRDC8 Pin Control
	#define CRDCCR_CRDC8_OR	$20
	#define CRDCCR_CLKSEL	7		;Card Clock Selection
	#define CRDCCR_CLKSEL_OR	$80

	EXTERN CRDETU1.b		; Smartcard ETU1
	#define CRDETU1_ETU8	0		;ETU value (12/2047) in card clock cycles
	#define CRDETU1_ETU8_OR	$01
	#define CRDETU1_ETU9	1		;ETU value (12/2047) in card clock cycles
	#define CRDETU1_ETU9_OR	$02
	#define CRDETU1_ETU10	2		;ETU value (12/2047) in card clock cycles
	#define CRDETU1_ETU10_OR	$04
	#define CRDETU1_ETU_OR	$07
	#define CRDETU1_COMP	7		;Elementary Time Unit Compensation
	#define CRDETU1_COMP_OR	$80

	EXTERN CRDETU0.b		; Smartcard ETU0
	#define CRDETU0_ETU0	0		;ETU value (12/2047) in card clock cycles
	#define CRDETU0_ETU0_OR	$01
	#define CRDETU0_ETU1	1		;ETU value (12/2047) in card clock cycles
	#define CRDETU0_ETU1_OR	$02
	#define CRDETU0_ETU2	2		;ETU value (12/2047) in card clock cycles
	#define CRDETU0_ETU2_OR	$04
	#define CRDETU0_ETU3	3		;ETU value (12/2047) in card clock cycles
	#define CRDETU0_ETU3_OR	$08
	#define CRDETU0_ETU4	4		;ETU value (12/2047) in card clock cycles
	#define CRDETU0_ETU4_OR	$10
	#define CRDETU0_ETU5	5		;ETU value (12/2047) in card clock cycles
	#define CRDETU0_ETU5_OR	$20
	#define CRDETU0_ETU6	6		;ETU value (12/2047) in card clock cycles
	#define CRDETU0_ETU6_OR	$40
	#define CRDETU0_ETU7	7		;ETU value (12/2047) in card clock cycles
	#define CRDETU0_ETU7_OR	$80
	#define CRDETU0_ETU_OR	$ff

	EXTERN CRDGT1.b		; Guard Time 1
	#define CRDGT1_CRDGT1	0		;Guard Time
	#define CRDGT1_CRDGT1_OR	$01

	EXTERN CRDGT0.b		; Guard Time 0
	#define CRDGT0_CRDGT00	0		;Guard Time
	#define CRDGT0_CRDGT00_OR	$01
	#define CRDGT0_CRDGT01	1		;Guard Time
	#define CRDGT0_CRDGT01_OR	$02
	#define CRDGT0_CRDGT02	2		;Guard Time
	#define CRDGT0_CRDGT02_OR	$04
	#define CRDGT0_CRDGT03	3		;Guard Time
	#define CRDGT0_CRDGT03_OR	$08
	#define CRDGT0_CRDGT04	4		;Guard Time
	#define CRDGT0_CRDGT04_OR	$10
	#define CRDGT0_CRDGT05	5		;Guard Time
	#define CRDGT0_CRDGT05_OR	$20
	#define CRDGT0_CRDGT06	6		;Guard Time
	#define CRDGT0_CRDGT06_OR	$40
	#define CRDGT0_CRDGT07	7		;Guard Time
	#define CRDGT0_CRDGT07_OR	$80
	#define CRDGT0_CRDGT0_OR	$ff

	EXTERN CRDWT2.b		; Waiting Time 2
	#define CRDWT2_CRDWT216	0		;Waiting Time MSB
	#define CRDWT2_CRDWT216_OR	$01
	#define CRDWT2_CRDWT217	1		;Waiting Time MSB
	#define CRDWT2_CRDWT217_OR	$02
	#define CRDWT2_CRDWT218	2		;Waiting Time MSB
	#define CRDWT2_CRDWT218_OR	$04
	#define CRDWT2_CRDWT219	3		;Waiting Time MSB
	#define CRDWT2_CRDWT219_OR	$08
	#define CRDWT2_CRDWT220	4		;Waiting Time MSB
	#define CRDWT2_CRDWT220_OR	$10
	#define CRDWT2_CRDWT221	5		;Waiting Time MSB
	#define CRDWT2_CRDWT221_OR	$20
	#define CRDWT2_CRDWT222	6		;Waiting Time MSB
	#define CRDWT2_CRDWT222_OR	$40
	#define CRDWT2_CRDWT223	7		;Waiting Time MSB
	#define CRDWT2_CRDWT223_OR	$80
	#define CRDWT2_CRDWT2_OR	$ff

	EXTERN CRDWT1.b		; Waiting Time 1
	#define CRDWT1_CRDWT18	0		;Waiting Time
	#define CRDWT1_CRDWT18_OR	$01
	#define CRDWT1_CRDWT19	1		;Waiting Time
	#define CRDWT1_CRDWT19_OR	$02
	#define CRDWT1_CRDWT110	2		;Waiting Time
	#define CRDWT1_CRDWT110_OR	$04
	#define CRDWT1_CRDWT111	3		;Waiting Time
	#define CRDWT1_CRDWT111_OR	$08
	#define CRDWT1_CRDWT112	4		;Waiting Time
	#define CRDWT1_CRDWT112_OR	$10
	#define CRDWT1_CRDWT113	5		;Waiting Time
	#define CRDWT1_CRDWT113_OR	$20
	#define CRDWT1_CRDWT114	6		;Waiting Time
	#define CRDWT1_CRDWT114_OR	$40
	#define CRDWT1_CRDWT115	7		;Waiting Time
	#define CRDWT1_CRDWT115_OR	$80
	#define CRDWT1_CRDWT1_OR	$ff

	EXTERN CRDWT0.b		; Waiting Time 0
	#define CRDWT0_CRDWT00	0		;Waiting Time LSB
	#define CRDWT0_CRDWT00_OR	$01
	#define CRDWT0_CRDWT01	1		;Waiting Time LSB
	#define CRDWT0_CRDWT01_OR	$02
	#define CRDWT0_CRDWT02	2		;Waiting Time LSB
	#define CRDWT0_CRDWT02_OR	$04
	#define CRDWT0_CRDWT03	3		;Waiting Time LSB
	#define CRDWT0_CRDWT03_OR	$08
	#define CRDWT0_CRDWT04	4		;Waiting Time LSB
	#define CRDWT0_CRDWT04_OR	$10
	#define CRDWT0_CRDWT05	5		;Waiting Time LSB
	#define CRDWT0_CRDWT05_OR	$20
	#define CRDWT0_CRDWT06	6		;Waiting Time LSB
	#define CRDWT0_CRDWT06_OR	$40
	#define CRDWT0_CRDWT07	7		;Waiting Time LSB
	#define CRDWT0_CRDWT07_OR	$80
	#define CRDWT0_CRDWT0_OR	$ff

	EXTERN CRDIER.b		; Smartcard Interrupt enable
	#define CRDIER_PARM	0		;Parity Error Interrupt
	#define CRDIER_PARM_OR	$01
	#define CRDIER_RXCM	1		;Received Character Interrupt
	#define CRDIER_RXCM_OR	$02
	#define CRDIER_TXCM	2		;Transmitted character Interrupt
	#define CRDIER_TXCM_OR	$04
	#define CRDIER_WTM	3		;Waiting Timer Interrupt
	#define CRDIER_WTM_OR	$08
	#define CRDIER_VCRDM	4		;Card Voltage Error Interrupt
	#define CRDIER_VCRDM_OR	$10
	#define CRDIER_IOVFM	5		;Card Overload Current Interrupt
	#define CRDIER_IOVFM_OR	$20
	#define CRDIER_TXBEM	7		;Transmit Buffer Empty Interrupt
	#define CRDIER_TXBEM_OR	$80

	EXTERN CRDIPR.b		; Smartcard Interrupt Pending
	#define CRDIPR_PARP	0		;Parity Error
	#define CRDIPR_PARP_OR	$01
	#define CRDIPR_RXCP	1		;Received Character
	#define CRDIPR_RXCP_OR	$02
	#define CRDIPR_TXCP	2		;Transmitted Character
	#define CRDIPR_TXCP_OR	$04
	#define CRDIPR_WTP	3		;Waiting Timer Overflow
	#define CRDIPR_WTP_OR	$08
	#define CRDIPR_VCRDP	4		;Card Voltage Error
	#define CRDIPR_VCRDP_OR	$10
	#define CRDIPR_IOVFP	5		;Card Overload Current
	#define CRDIPR_IOVFP_OR	$20
	#define CRDIPR_TXBEP	7		;Transmit Buffer Empty
	#define CRDIPR_TXBEP_OR	$80

	EXTERN CRDTXB.b		; Smartcard Transmit Buffer

	EXTERN CRDRXB.b		; Smartcard Receive Buffer

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

; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PADR.b		; Data Register

	EXTERN PADDR.b		; Data Direction Register

	EXTERN PAOR.b		; Option Register

	EXTERN PAPUCR.b		; Pull Up Control Register

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PBDR.b		; Data Register

	EXTERN PBOR.b		; Option Register

	EXTERN PBPUCR.b		; Pull Up Control Register

; Port C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PCDR.b		; Data Register

; Port D
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PDDR.b		; Data Register

	EXTERN PDOR.b		; Option Register

	EXTERN PDPUCR.b		; Pull Up Control Register

; Miscellaneous
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR1.b		; Miscellaneous Register 1
	#define MISCR1_ITM0	0		;Enables or Disables external IT on Port C
	#define MISCR1_ITM0_OR	$01
	#define MISCR1_ITM1	1		;Enables or Disables external IT on Port C
	#define MISCR1_ITM1_OR	$02
	#define MISCR1_ITM2	2		;Enables or Disables external IT on Port C
	#define MISCR1_ITM2_OR	$04
	#define MISCR1_ITM3	3		;Enables or Disables external IT on Port C
	#define MISCR1_ITM3_OR	$08
	#define MISCR1_ITM4	4		;Enables or Disables external IT on Port C
	#define MISCR1_ITM4_OR	$10
	#define MISCR1_ITM5	5		;Enables or Disables external IT on Port C
	#define MISCR1_ITM5_OR	$20
	#define MISCR1_ITM6	6		;Enables or Disables external IT on Port C
	#define MISCR1_ITM6_OR	$40
	#define MISCR1_ITM7	7		;Enables or Disables external IT on Port C
	#define MISCR1_ITM7_OR	$80
	#define MISCR1_ITM_OR	$ff

	EXTERN MISCR2.b		; Miscellaneous Register 2
	#define MISCR2_CRDIRM	6		;CRD Insertion/Removal Interrupt Mask
	#define MISCR2_CRDIRM_OR	$40
	#define MISCR2_ITM9	0		;Enables or Disables external IT on Port A
	#define MISCR2_ITM9_OR	$01
	#define MISCR2_ITM10	1		;Enables or Disables external IT on Port A
	#define MISCR2_ITM10_OR	$02
	#define MISCR2_ITM11	2		;Enables or Disables external IT on Port A
	#define MISCR2_ITM11_OR	$04
	#define MISCR2_ITM12	3		;Enables or Disables external IT on Port A
	#define MISCR2_ITM12_OR	$08
	#define MISCR2_ITM13	4		;Enables or Disables external IT on Port A
	#define MISCR2_ITM13_OR	$10
	#define MISCR2_ITM14	5		;Enables or Disables external IT on Port A
	#define MISCR2_ITM14_OR	$20
	#define MISCR2_ITM_OR	$3f

	EXTERN MISCR3.b		; Miscellaneous Register 3
	#define MISCR3_CTRL0_C	4		;Sensitivity on port C
	#define MISCR3_CTRL0_C_OR	$10
	#define MISCR3_CTRL1_C	5		;Sensitivity on port C
	#define MISCR3_CTRL1_C_OR	$20
	#define MISCR3_CTRL_C_OR	$30
	#define MISCR3_CTRL0_A	6		;Sensitivity on port A
	#define MISCR3_CTRL0_A_OR	$40
	#define MISCR3_CTRL1_A	7		;Sensitivity on port A
	#define MISCR3_CTRL1_A_OR	$80
	#define MISCR3_CTRL_A_OR	$c0

	EXTERN MISCR4.b		; Miscellaneous Register 4
	#define MISCR4_LOCK	0		;PLL status bit
	#define MISCR4_LOCK_OR	$01
	#define MISCR4_CLK_SEL	5		;Clock Selection
	#define MISCR4_CLK_SEL_OR	$20
	#define MISCR4_PLL_ON	6		;PLL Activation
	#define MISCR4_PLL_ON_OR	$40

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

; TimeBase Unit (TBU)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TBUCV.b		; Timer counter Value
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

	EXTERN TBUCSR.b		; Timer Control Status
	#define TBUCSR_PR0	0		;Prescaler Selection
	#define TBUCSR_PR0_OR	$01
	#define TBUCSR_PR1	1		;Prescaler Selection
	#define TBUCSR_PR1_OR	$02
	#define TBUCSR_PR2	2		;Prescaler Selection
	#define TBUCSR_PR2_OR	$04
	#define TBUCSR_PR_OR	$07
	#define TBUCSR_TCEN	3		;TBU Enable
	#define TBUCSR_TCEN_OR	$08
	#define TBUCSR_ITE	4		;Interrupt enabled
	#define TBUCSR_ITE_OR	$10
	#define TBUCSR_OVF	5		;Overflow Flag
	#define TBUCSR_OVF_OR	$20

; Interrupt Control (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;Flash Start Programming Interrupt priority level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;Flash Start Programming Interrupt priority level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;UART Interrupt priority level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;UART Interrupt priority level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;USB Communication Interrupt priority level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;USB Communication Interrupt priority level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;External Interrupt Port C priority level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;External Interrupt Port C priority level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR1.b		; Interrupt Software Priority Register 1
	#define ISPR1_I0_4	0		;External Interrupt Port A priority level
	#define ISPR1_I0_4_OR	$01
	#define ISPR1_I1_4	1		;External Interrupt Port A priority level
	#define ISPR1_I1_4_OR	$02
	#define ISPR1_I_4_OR	$03
	#define ISPR1_I0_5	2		;TBU Timer Interrupt priority level
	#define ISPR1_I0_5_OR	$04
	#define ISPR1_I1_5	3		;TBU Timer Interrupt priority level
	#define ISPR1_I1_5_OR	$08
	#define ISPR1_I_5_OR	$0c
	#define ISPR1_I0_6	4		;Smartcard Insertion/Removal Interrupt priority level
	#define ISPR1_I0_6_OR	$10
	#define ISPR1_I1_6	5		;Smartcard Insertion/Removal Interrupt priority level
	#define ISPR1_I1_6_OR	$20
	#define ISPR1_I_6_OR	$30
	#define ISPR1_I0_7	6		;End Suspend Interrupt priority level
	#define ISPR1_I0_7_OR	$40
	#define ISPR1_I1_7	7		;End Suspend Interrupt priority level
	#define ISPR1_I1_7_OR	$80
	#define ISPR1_I_7_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2

	EXTERN ISPR3.b		; Interrupt Software Priority Register 3

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

; LED
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN LED_CTRL.b		; Led Control Register
	#define LED_CTRL_LD0_I	0		;Current selection on LD0
	#define LED_CTRL_LD0_I_OR	$01
	#define LED_CTRL_LD1_I	1		;Current selection on LD1
	#define LED_CTRL_LD1_I_OR	$02
	#define LED_CTRL_LD2_I	2		;Current selection on LD2
	#define LED_CTRL_LD2_I_OR	$04
	#define LED_CTRL_LD3_I	3		;Current selection on LD3
	#define LED_CTRL_LD3_I_OR	$08
	#define LED_CTRL_LD0	4		;LED 0 Activation
	#define LED_CTRL_LD0_OR	$10
	#define LED_CTRL_LD1	5		;LED 1 Activation
	#define LED_CTRL_LD1_OR	$20
	#define LED_CTRL_LD2	6		;LED 2 Activation
	#define LED_CTRL_LD2_OR	$40
	#define LED_CTRL_LD3	7		;LED 3 Activation
	#define LED_CTRL_LD3_OR	$80

	#endif ; __ST7FSCR1R4__
