; ST7WIND11.inc

; Copyright (c) 2003-2009 STMicroelectronics

	#ifdef __ST7WIND11__
; do nothing
	#else
	#define __ST7WIND11__ 1

; ST7WIND11


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

	EXTERN WDGCSR.b		; Status Register
	#define WDGCSR_WDGTF	1		;Watchdog Timeout Flag
	#define WDGCSR_WDGTF_OR	$02
	#define WDGCSR_IE	0		;Watchdog Interrupt Enable
	#define WDGCSR_IE_OR	$01

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

; 16-Bit Timer
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

; Clock Management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CMCR0.b		; Clock Management Control Register 0
	#define CMCR0_USB	0		;USB clock enable
	#define CMCR0_USB_OR	$01
	#define CMCR0_T16	1		;16TIM clock enable
	#define CMCR0_T16_OR	$02
	#define CMCR0_SPI	2		;SPI clock enable
	#define CMCR0_SPI_OR	$04
	#define CMCR0_TBU	3		;TBU clock enable
	#define CMCR0_TBU_OR	$08
	#define CMCR0_RF_DSP	5		;RF DSP clock enable
	#define CMCR0_RF_DSP_OR	$20
	#define CMCR0_RX	6		;RX clock enable
	#define CMCR0_RX_OR	$40

	EXTERN CMCR1.b		; Clock Management Control Register 1
	#define CMCR1_DM	4		;Debug Module clock enable
	#define CMCR1_DM_OR	$10
	#define CMCR1_PS2	5		;PS2 clock enable
	#define CMCR1_PS2_OR	$20
	#define CMCR1_MCO	7		;Main clock out selection
	#define CMCR1_MCO_OR	$80

	EXTERN CMR.b		; Clock Mode Register
	#define CMR_SMS0	0		;Slow Mode Select
	#define CMR_SMS0_OR	$01
	#define CMR_SMS1	1		;Slow Mode Select
	#define CMR_SMS1_OR	$02
	#define CMR_SMS_OR	$03
	#define CMR_OSCEN	2		;12MHz oscillator enable
	#define CMR_OSCEN_OR	$04
	#define CMR_RCEN	3		;6MHz RC enable
	#define CMR_RCEN_OR	$08
	#define CMR_OSC_RC	4		;Oscillator / RC selection
	#define CMR_OSC_RC_OR	$10
	#define CMR_STAB	5		;Stabilization flag
	#define CMR_STAB_OR	$20
	#define CMR_ENCAL	6		;ENCAL Enable Calibration
	#define CMR_ENCAL_OR	$40
	#define CMR_CALF	7		;CALF Calibration Flag
	#define CMR_CALF_OR	$80

; Interrupt Software Priority (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ISPR0.b		; Interrupt Software Priority Register 0
	#define ISPR0_I0_0	0		;Watchdog TLI Priority Level
	#define ISPR0_I0_0_OR	$01
	#define ISPR0_I1_0	1		;Watchdog TLI Priority Level
	#define ISPR0_I1_0_OR	$02
	#define ISPR0_I_0_OR	$03
	#define ISPR0_I0_1	2		;USB end of suspend IT Priority Level
	#define ISPR0_I0_1_OR	$04
	#define ISPR0_I1_1	3		;USB end of suspend IT Priority Level
	#define ISPR0_I1_1_OR	$08
	#define ISPR0_I_1_OR	$0c
	#define ISPR0_I0_2	4		;Port A External IT / Auto Wake up from HALT Priority Level
	#define ISPR0_I0_2_OR	$10
	#define ISPR0_I1_2	5		;Port A External IT / Auto Wake up from HALT Priority Level
	#define ISPR0_I1_2_OR	$20
	#define ISPR0_I_2_OR	$30
	#define ISPR0_I0_3	6		;Port B External IT Priority Level
	#define ISPR0_I0_3_OR	$40
	#define ISPR0_I1_3	7		;Port B External IT Priority Level
	#define ISPR0_I1_3_OR	$80
	#define ISPR0_I_3_OR	$c0

	EXTERN ISPR2.b		; Interrupt Software Priority Register 2
	#define ISPR2_I0_8	0		;PS2 & Port G External IT Priority Level
	#define ISPR2_I0_8_OR	$01
	#define ISPR2_I1_8	1		;PS2 & Port G External IT Priority Level
	#define ISPR2_I1_8_OR	$02
	#define ISPR2_I_8_OR	$03
	#define ISPR2_I0_10	4		;USB IT Priority Level
	#define ISPR2_I0_10_OR	$10
	#define ISPR2_I1_10	5		;USB IT Priority Level
	#define ISPR2_I1_10_OR	$20
	#define ISPR2_I_10_OR	$30
	#define ISPR2_I0_11	6		;Timer IT Priority Level
	#define ISPR2_I0_11_OR	$40
	#define ISPR2_I1_11	7		;Timer IT Priority Level
	#define ISPR2_I1_11_OR	$80
	#define ISPR2_I_11_OR	$c0

	EXTERN ISPR3.b		; Interrupt Software Priority Register 3
	#define ISPR3_I0_12	0		;TBU IT Priority Level
	#define ISPR3_I0_12_OR	$01
	#define ISPR3_I1_12	1		;TBU IT Priority Level
	#define ISPR3_I1_12_OR	$02
	#define ISPR3_I_12_OR	$03
	#define ISPR3_I0_13	2		;SPI IT Priority Level
	#define ISPR3_I0_13_OR	$04
	#define ISPR3_I1_13	3		;SPI IT Priority Level
	#define ISPR3_I1_13_OR	$08
	#define ISPR3_I_13_OR	$0c

	EXTERN EICR.b		; External Interrupt Control Register
	#define EICR_ISA0	0		;Port A	Sensitivity
	#define EICR_ISA0_OR	$01
	#define EICR_ISA1	1		;Port A	Sensitivity
	#define EICR_ISA1_OR	$02
	#define EICR_ISA_OR	$03
	#define EICR_ISB00	2		;Port B(3:0) Sensitivity
	#define EICR_ISB00_OR	$04
	#define EICR_ISB01	3		;Port B(3:0) Sensitivity
	#define EICR_ISB01_OR	$08
	#define EICR_ISB0_OR	$0c
	#define EICR_ISB10	4		;Port B(4) Sensitivity
	#define EICR_ISB10_OR	$10
	#define EICR_ISB11	5		;Port B(4) Sensitivity
	#define EICR_ISB11_OR	$20
	#define EICR_ISB1_OR	$30

	EXTERN PAEIENR.b		; Port A External Interrupt Enable Register
	#define PAEIENR_IT0E	0		;ITxE Port A interrupt enable
	#define PAEIENR_IT0E_OR	$01
	#define PAEIENR_IT1E	1		;ITxE Port A interrupt enable
	#define PAEIENR_IT1E_OR	$02
	#define PAEIENR_IT2E	2		;ITxE Port A interrupt enable
	#define PAEIENR_IT2E_OR	$04
	#define PAEIENR_IT3E	3		;ITxE Port A interrupt enable
	#define PAEIENR_IT3E_OR	$08
	#define PAEIENR_IT4E	4		;ITxE Port A interrupt enable
	#define PAEIENR_IT4E_OR	$10
	#define PAEIENR_IT5E	5		;ITxE Port A interrupt enable
	#define PAEIENR_IT5E_OR	$20
	#define PAEIENR_IT6E	6		;ITxE Port A interrupt enable
	#define PAEIENR_IT6E_OR	$40
	#define PAEIENR_IT7E	7		;ITxE Port A interrupt enable
	#define PAEIENR_IT7E_OR	$80
	#define PAEIENR_ITE_OR	$ff

	EXTERN PBEIENR.b		; Port B External Interrupt Enable Register
	#define PBEIENR_IT8E	0		;ITxE Port B interrupt enable
	#define PBEIENR_IT8E_OR	$01
	#define PBEIENR_IT9E	1		;ITxE Port B interrupt enable
	#define PBEIENR_IT9E_OR	$02
	#define PBEIENR_IT10E	2		;ITxE Port B interrupt enable
	#define PBEIENR_IT10E_OR	$04
	#define PBEIENR_IT11E	3		;ITxE Port B interrupt enable
	#define PBEIENR_IT11E_OR	$08
	#define PBEIENR_IT12E	4		;ITxE Port B interrupt enable
	#define PBEIENR_IT12E_OR	$10
	#define PBEIENR_IT13E	5		;ITxE Port B interrupt enable
	#define PBEIENR_IT13E_OR	$20
	#define PBEIENR_IT14E	6		;ITxE Port B interrupt enable
	#define PBEIENR_IT14E_OR	$40
	#define PBEIENR_IT15E	7		;ITxE Port B interrupt enable
	#define PBEIENR_IT15E_OR	$80
	#define PBEIENR_ITE_OR	$ff

	EXTERN PAEISR.b		; Port A External Interrupt Status Register
	#define PAEISR_IT0F	0		;ITxF Port A interrupt flag
	#define PAEISR_IT0F_OR	$01
	#define PAEISR_IT1F	1		;ITxF Port A interrupt flag
	#define PAEISR_IT1F_OR	$02
	#define PAEISR_IT2F	2		;ITxF Port A interrupt flag
	#define PAEISR_IT2F_OR	$04
	#define PAEISR_IT3F	3		;ITxF Port A interrupt flag
	#define PAEISR_IT3F_OR	$08
	#define PAEISR_IT4F	4		;ITxF Port A interrupt flag
	#define PAEISR_IT4F_OR	$10
	#define PAEISR_IT5F	5		;ITxF Port A interrupt flag
	#define PAEISR_IT5F_OR	$20
	#define PAEISR_IT6F	6		;ITxF Port A interrupt flag
	#define PAEISR_IT6F_OR	$40
	#define PAEISR_IT7F	7		;ITxF Port A interrupt flag
	#define PAEISR_IT7F_OR	$80
	#define PAEISR_ITF_OR	$ff

	EXTERN PBEISR.b		; Port B External Interrupt Status Register
	#define PBEISR_IT8F	0		;ITxF Port B interrupt flag
	#define PBEISR_IT8F_OR	$01
	#define PBEISR_IT9F	1		;ITxF Port B interrupt flag
	#define PBEISR_IT9F_OR	$02
	#define PBEISR_IT10F	2		;ITxF Port B interrupt flag
	#define PBEISR_IT10F_OR	$04
	#define PBEISR_IT11F	3		;ITxF Port B interrupt flag
	#define PBEISR_IT11F_OR	$08
	#define PBEISR_IT12F	4		;ITxF Port B interrupt flag
	#define PBEISR_IT12F_OR	$10
	#define PBEISR_IT13F	5		;ITxF Port B interrupt flag
	#define PBEISR_IT13F_OR	$20
	#define PBEISR_IT14F	6		;ITxF Port B interrupt flag
	#define PBEISR_IT14F_OR	$40
	#define PBEISR_IT15F	7		;ITxF Port B interrupt flag
	#define PBEISR_IT15F_OR	$80
	#define PBEISR_ITF_OR	$ff

	EXTERN PGEICR.b		; Port G External Interrupt Control Register
	#define PGEICR_ISG0	0		;Port G	Sensitivity
	#define PGEICR_ISG0_OR	$01
	#define PGEICR_ISG1	1		;Port G	Sensitivity
	#define PGEICR_ISG1_OR	$02
	#define PGEICR_ISG_OR	$03

	EXTERN PGEIENR.b		; Port G External Interrupt Enable Register
	#define PGEIENR_IT24E	0		;IT24 External interrupt enable
	#define PGEIENR_IT24E_OR	$01
	#define PGEIENR_IT25E	1		;IT25 External interrupt enable
	#define PGEIENR_IT25E_OR	$02

	EXTERN PGEISR.b		; Port G External Interrupt Status Register
	#define PGEISR_IT24F	0		;IT24 External interrupt flag
	#define PGEISR_IT24F_OR	$01
	#define PGEISR_IT25F	1		;IT25 External interrupt flag
	#define PGEISR_IT25F_OR	$02

; Auto Wake Up
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN AWUCSR.b		; Auto Wake Up from HALT Control/Status Register
	#define AWUCSR_AWUEN	0		;Auto Wake Up from HALT mode enable
	#define AWUCSR_AWUEN_OR	$01
	#define AWUCSR_AWUM	1		;Auto Wake Up Measurement
	#define AWUCSR_AWUM_OR	$02
	#define AWUCSR_AWUF	2		;Auto Wake Up Flag
	#define AWUCSR_AWUF_OR	$04

	EXTERN AWUPR.b		; Auto Wake Up from HALT prescaler Register
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

; USB 
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
	#define USBCTLR_FSTAT0	6		;Forced state
	#define USBCTLR_FSTAT0_OR	$40
	#define USBCTLR_FSTAT1	7		;Forced state
	#define USBCTLR_FSTAT1_OR	$80
	#define USBCTLR_FSTAT_OR	$c0

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

	EXTERN USBSR0.b		; Status Register
	#define USBSR0_EP0	0		;Endpoint Number
	#define USBSR0_EP0_OR	$01
	#define USBSR0_EP1	1		;Endpoint Number
	#define USBSR0_EP1_OR	$02
	#define USBSR0_EP2	2		;Endpoint Number
	#define USBSR0_EP2_OR	$04
	#define USBSR0_EP_OR	$07
	#define USBSR0_IN_OUT	5		;Last Transaction Direction for Endpoint (1 or 2)
	#define USBSR0_IN_OUT_OR	$20
	#define USBSR0_PID0	6		;Token PID bits 1&0 for Endpoint 0 Control
	#define USBSR0_PID0_OR	$40
	#define USBSR0_PID1	7		;Token PID bits 1&0 for Endpoint 0 Control
	#define USBSR0_PID1_OR	$80
	#define USBSR0_PID_OR	$c0

	EXTERN USBSR1.b		; Error Status Register
	#define USBSR1_ERR0	0		;Error Type
	#define USBSR1_ERR0_OR	$01
	#define USBSR1_ERR1	1		;Error Type
	#define USBSR1_ERR1_OR	$02
	#define USBSR1_ERR2	2		;Error Type
	#define USBSR1_ERR2_OR	$04
	#define USBSR1_ERR_OR	$07
	#define USBSR1_USB_RST	3		;USB Reset detected
	#define USBSR1_USB_RST_OR	$08
	#define USBSR1_RSM	4		;Resume detected
	#define USBSR1_RSM_OR	$10

	EXTERN USBEP0R.b		; Endpoint 0 Register
	#define USBEP0R_STAT_RX0	0		;Status bits (Reception)
	#define USBEP0R_STAT_RX0_OR	$01
	#define USBEP0R_STAT_RX1	1		;Status bits (Reception)
	#define USBEP0R_STAT_RX1_OR	$02
	#define USBEP0R_STAT_RX_OR	$03
	#define USBEP0R_DTOG_RX	2		;Data Toggle (Reception)
	#define USBEP0R_DTOG_RX_OR	$04
	#define USBEP0R_STAT_TX0	4		;Status bits (Transmission)
	#define USBEP0R_STAT_TX0_OR	$10
	#define USBEP0R_STAT_TX1	5		;Status bits (Transmission)
	#define USBEP0R_STAT_TX1_OR	$20
	#define USBEP0R_STAT_TX_OR	$30
	#define USBEP0R_DTOG_TX	6		;Data Toggle (Transmission)
	#define USBEP0R_DTOG_TX_OR	$40
	#define USBEP0R_CTR0	7		;Correct Transfert on EP0
	#define USBEP0R_CTR0_OR	$80

	EXTERN USBCNT0RXR.b		; Endpoint 0 Reception Counter Register
	#define USBCNT0RXR_CNT0	0		;Buffer Size for Ep0 Reception
	#define USBCNT0RXR_CNT0_OR	$01
	#define USBCNT0RXR_CNT1	1		;Buffer Size for Ep0 Reception
	#define USBCNT0RXR_CNT1_OR	$02
	#define USBCNT0RXR_CNT2	2		;Buffer Size for Ep0 Reception
	#define USBCNT0RXR_CNT2_OR	$04
	#define USBCNT0RXR_CNT3	3		;Buffer Size for Ep0 Reception
	#define USBCNT0RXR_CNT3_OR	$08
	#define USBCNT0RXR_CNT_OR	$0f

	EXTERN USBCNT0TXR.b		; Endpoint 0 Transmission Counter Register
	#define USBCNT0TXR_CNT0	0		;Number of Bytes to be transmitted by Ep0
	#define USBCNT0TXR_CNT0_OR	$01
	#define USBCNT0TXR_CNT1	1		;Number of Bytes to be transmitted by Ep0
	#define USBCNT0TXR_CNT1_OR	$02
	#define USBCNT0TXR_CNT2	2		;Number of Bytes to be transmitted by Ep0
	#define USBCNT0TXR_CNT2_OR	$04
	#define USBCNT0TXR_CNT3	3		;Number of Bytes to be transmitted by Ep0
	#define USBCNT0TXR_CNT3_OR	$08
	#define USBCNT0TXR_CNT_OR	$0f

	EXTERN USBEP1RXR.b		; Endpoint 1 Reception Register
	#define USBEP1RXR_STAT_RX0	0		;Status bits (Reception)
	#define USBEP1RXR_STAT_RX0_OR	$01
	#define USBEP1RXR_STAT_RX1	1		;Status bits (Reception)
	#define USBEP1RXR_STAT_RX1_OR	$02
	#define USBEP1RXR_STAT_RX_OR	$03
	#define USBEP1RXR_DTOG_RX	2		;Data Toggle (Reception)
	#define USBEP1RXR_DTOG_RX_OR	$04
	#define USBEP1RXR_CTR_RX	3		;Reception Correct Transfert
	#define USBEP1RXR_CTR_RX_OR	$08

	EXTERN USBCNT1RXR.b		; Endpoint 1 Reception Counter Register
	#define USBCNT1RXR_CNT0	0		;Buffer Size for Ep1 Reception
	#define USBCNT1RXR_CNT0_OR	$01
	#define USBCNT1RXR_CNT1	1		;Buffer Size for Ep1 Reception
	#define USBCNT1RXR_CNT1_OR	$02
	#define USBCNT1RXR_CNT2	2		;Buffer Size for Ep1 Reception
	#define USBCNT1RXR_CNT2_OR	$04
	#define USBCNT1RXR_CNT3	3		;Buffer Size for Ep1 Reception
	#define USBCNT1RXR_CNT3_OR	$08
	#define USBCNT1RXR_CNT_OR	$0f

	EXTERN USBEP1TXR.b		; Endpoint 1 Transmission Register
	#define USBEP1TXR_STAT_TX0	0		;Status bits (Transmission)
	#define USBEP1TXR_STAT_TX0_OR	$01
	#define USBEP1TXR_STAT_TX1	1		;Status bits (Transmission)
	#define USBEP1TXR_STAT_TX1_OR	$02
	#define USBEP1TXR_STAT_TX_OR	$03
	#define USBEP1TXR_DTOG_TX	2		;Data Toggle (Transmission)
	#define USBEP1TXR_DTOG_TX_OR	$04
	#define USBEP1TXR_CTR_TX	3		;Correct Transmission Transfer
	#define USBEP1TXR_CTR_TX_OR	$08

	EXTERN USBCNT1TXR.b		; Endpoint 1 Transmission Counter Register
	#define USBCNT1TXR_CNT0	0		;Number of Bytes to be transmitted by Ep1
	#define USBCNT1TXR_CNT0_OR	$01
	#define USBCNT1TXR_CNT1	1		;Number of Bytes to be transmitted by Ep1
	#define USBCNT1TXR_CNT1_OR	$02
	#define USBCNT1TXR_CNT2	2		;Number of Bytes to be transmitted by Ep1
	#define USBCNT1TXR_CNT2_OR	$04
	#define USBCNT1TXR_CNT3	3		;Number of Bytes to be transmitted by Ep1
	#define USBCNT1TXR_CNT3_OR	$08
	#define USBCNT1TXR_CNT_OR	$0f

	EXTERN USBEP2RXR.b		; Endpoint 2 Reception Register
	#define USBEP2RXR_STAT_RX0	0		;Status bits (Reception)
	#define USBEP2RXR_STAT_RX0_OR	$01
	#define USBEP2RXR_STAT_RX1	1		;Status bits (Reception)
	#define USBEP2RXR_STAT_RX1_OR	$02
	#define USBEP2RXR_STAT_RX_OR	$03
	#define USBEP2RXR_DTOG_RX	2		;Data Toggle (Reception)
	#define USBEP2RXR_DTOG_RX_OR	$04
	#define USBEP2RXR_CTR_RX	3		;Reception Correct Transfert
	#define USBEP2RXR_CTR_RX_OR	$08

	EXTERN USBCNT2RXR.b		; Endpoint 2 Reception Counter Register
	#define USBCNT2RXR_CNT0	0		;Buffer Size for Ep2 Reception
	#define USBCNT2RXR_CNT0_OR	$01
	#define USBCNT2RXR_CNT1	1		;Buffer Size for Ep2 Reception
	#define USBCNT2RXR_CNT1_OR	$02
	#define USBCNT2RXR_CNT2	2		;Buffer Size for Ep2 Reception
	#define USBCNT2RXR_CNT2_OR	$04
	#define USBCNT2RXR_CNT3	3		;Buffer Size for Ep2 Reception
	#define USBCNT2RXR_CNT3_OR	$08
	#define USBCNT2RXR_CNT_OR	$0f

	EXTERN USBEP2TXR.b		; Endpoint 2 Transmission Register
	#define USBEP2TXR_STAT_TX0	0		;Status bits (Transmission)
	#define USBEP2TXR_STAT_TX0_OR	$01
	#define USBEP2TXR_STAT_TX1	1		;Status bits (Transmission)
	#define USBEP2TXR_STAT_TX1_OR	$02
	#define USBEP2TXR_STAT_TX_OR	$03
	#define USBEP2TXR_DTOG_TX	2		;Data Toggle (Transmission)
	#define USBEP2TXR_DTOG_TX_OR	$04
	#define USBEP2TXR_CTR_TX	3		;Correct Transmission Transfer
	#define USBEP2TXR_CTR_TX_OR	$08

	EXTERN USBCNT2TXR.b		; Endpoint 2 Transmission Counter Register
	#define USBCNT2TXR_CNT0	0		;Number of Bytes to be transmitted by Ep2
	#define USBCNT2TXR_CNT0_OR	$01
	#define USBCNT2TXR_CNT1	1		;Number of Bytes to be transmitted by Ep2
	#define USBCNT2TXR_CNT1_OR	$02
	#define USBCNT2TXR_CNT2	2		;Number of Bytes to be transmitted by Ep2
	#define USBCNT2TXR_CNT2_OR	$04
	#define USBCNT2TXR_CNT3	3		;Number of Bytes to be transmitted by Ep2
	#define USBCNT2TXR_CNT3_OR	$08
	#define USBCNT2TXR_CNT_OR	$0f

;  PS/2 interface 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PS2CR.b		; PS/2 Control register
	#define PS2CR_PS2ON	0		;PS/2 ON
	#define PS2CR_PS2ON_OR	$01
	#define PS2CR_CD	1		;Communication direction
	#define PS2CR_CD_OR	$02
	#define PS2CR_RTXS	2		;RX/TX Start
	#define PS2CR_RTXS_OR	$04
	#define PS2CR_RTXCIE	3		;RX/TX Complete interrupt enable
	#define PS2CR_RTXCIE_OR	$08
	#define PS2CR_RTXAIE	4		;RX/TX Abort interrupt enable
	#define PS2CR_RTXAIE_OR	$10
	#define PS2CR_HRTSIE	5		;HRTS interrupt enable
	#define PS2CR_HRTSIE_OR	$20
	#define PS2CR_RXEIE	6		;RX error interrupt enable
	#define PS2CR_RXEIE_OR	$40

	EXTERN PS2CSR.b		; PS/2 Config/Status register
	#define PS2CSR_RTXC	0		;RX/TX Complete
	#define PS2CSR_RTXC_OR	$01
	#define PS2CSR_RTXA	1		;RX/TX Abort
	#define PS2CSR_RTXA_OR	$02
	#define PS2CSR_HRTS	2		;Host request to send
	#define PS2CSR_HRTS_OR	$04
	#define PS2CSR_RXE	3		;RX Error
	#define PS2CSR_RXE_OR	$08
	#define PS2CSR_TOFF	4		;Timing OFF
	#define PS2CSR_TOFF_OR	$10
	#define PS2CSR_FSEL0	5		;Frequency selection
	#define PS2CSR_FSEL0_OR	$20
	#define PS2CSR_FSEL1	6		;Frequency selection
	#define PS2CSR_FSEL1_OR	$40
	#define PS2CSR_FSEL_OR	$60

	EXTERN PS2DR.b		; PS/2 Data register
	#define PS2DR_PS2D0	0		;PS/2 Data
	#define PS2DR_PS2D0_OR	$01
	#define PS2DR_PS2D1	1		;PS/2 Data
	#define PS2DR_PS2D1_OR	$02
	#define PS2DR_PS2D2	2		;PS/2 Data
	#define PS2DR_PS2D2_OR	$04
	#define PS2DR_PS2D3	3		;PS/2 Data
	#define PS2DR_PS2D3_OR	$08
	#define PS2DR_PS2D4	4		;PS/2 Data
	#define PS2DR_PS2D4_OR	$10
	#define PS2DR_PS2D5	5		;PS/2 Data
	#define PS2DR_PS2D5_OR	$20
	#define PS2DR_PS2D6	6		;PS/2 Data
	#define PS2DR_PS2D6_OR	$40
	#define PS2DR_PS2D7	7		;PS/2 Data
	#define PS2DR_PS2D7_OR	$80
	#define PS2DR_PS2D_OR	$ff

; Port G
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PAGPUCR.b		; Port A & G Pull-Up Control Rgister
	#define PAGPUCR_PUPG0	0		;PG0 Pull-Up Resistor enable
	#define PAGPUCR_PUPG0_OR	$01
	#define PAGPUCR_PUPG1	1		;PG1 Pull-Up Resistor enable
	#define PAGPUCR_PUPG1_OR	$02
	#define PAGPUCR_USBPUP	4		;PA7 USB Pull-Up Resistor enable
	#define PAGPUCR_USBPUP_OR	$10

	EXTERN PGDR.b		; Data Register

	EXTERN PGDDR.b		; Data Direction Register

	EXTERN PGOR.b		; Option Register

;  RF Interface 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN RFPAGER.b		; RF Page Selection Register
	#define RFPAGER_RFP0	0		;RF Page Selection
	#define RFPAGER_RFP0_OR	$01
	#define RFPAGER_RFP1	1		;RF Page Selection
	#define RFPAGER_RFP1_OR	$02
	#define RFPAGER_RFP_OR	$03

; RFCSR, RFREGCR, RXCFHR - RFP Paged Register
	EXTERN RFCSR.b
	EXTERN RFREGCR.b
	EXTERN RXCFHR.b

; RXCSR, RXCFLR - RFP Paged Register
	EXTERN RXCSR.b
	EXTERN RXCFLR.b

; RXRSSHR, RFSYNR, RXOFFHR - RFP Paged Register
	EXTERN RXRSSHR.b
	EXTERN RFSYNR.b
	EXTERN RXOFFHR.b

; RXRSSLR, RXOFFLR - RFP Paged Register
	EXTERN RXRSSLR.b
	EXTERN RXOFFLR.b

; RFTSWR, RXDRR - RFP Paged Register
	EXTERN RFTSWR.b
	EXTERN RXDRR.b

	EXTERN RXSLHR.b		; RFP Paged Register

	EXTERN RXSLLR.b		; RFP Paged Register

	#endif ; __ST7WIND11__
