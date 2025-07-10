; ST7FLCD1.inc

; Copyright (c) 2003-2015 STMicroelectronics

	#ifdef __ST7FLCD1__
; do nothing
	#else
	#define __ST7FLCD1__ 1

; ST7FLCD1


; Circuit Name Register (NAMER)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN NAMER.b		; Circuit Name Register

; Miscellaneous (MISCR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN MISCR.b		; Miscellaneous Register
	#define MISCR_PA4OVD	1		;Port A, bit 4 Overdrive
	#define MISCR_PA4OVD_OR	$02
	#define MISCR_PA5OVD	2		;Port A, bit 5 Overdrive
	#define MISCR_PA5OVD_OR	$04

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

; Port D
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PDDR.b		; Data Register

	EXTERN PDDDR.b		; Data Direction Register

; 8-bit Analog-to-Digital Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADCDR.b		; Data Register

	EXTERN ADCCSR.b		; Control/Status Register
	#define ADCCSR_CH0	0		;Channel Selection
	#define ADCCSR_CH0_OR	$01
	#define ADCCSR_CH1	1		;Channel Selection
	#define ADCCSR_CH1_OR	$02
	#define ADCCSR_CH_OR	$03
	#define ADCCSR_ADON	5		;A/D Converter
	#define ADCCSR_ADON_OR	$20
	#define ADCCSR_COCO	7		;Conversion Complete
	#define ADCCSR_COCO_OR	$80

; External Interrupt Register (ITRFRE)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ITRFRE.b		; External Interrupt Register
	#define ITRFRE_ITAITE	0		;ITA Interrupt Enable
	#define ITRFRE_ITAITE_OR	$01
	#define ITRFRE_ITALAT	1		;Falling or Rising Edge Detector Latch
	#define ITRFRE_ITALAT_OR	$02
	#define ITRFRE_ITAEDGE	2		;Interrupt A Edge Selection
	#define ITRFRE_ITAEDGE_OR	$04
	#define ITRFRE_ITBITE	3		;ITB Interrupt Enable
	#define ITRFRE_ITBITE_OR	$08
	#define ITRFRE_ITBLAT	4		;Falling or Rising Edge Detector Latch
	#define ITRFRE_ITBLAT_OR	$10
	#define ITRFRE_ITBEDGE	5		;Interrupt B Edge Selection
	#define ITRFRE_ITBEDGE_OR	$20

; 8-Bit Timer (TIMA)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIMCSRA.b		; Timer A Control Status Register
	#define TIMCSRA_BUZE	0		;Buzzer enable
	#define TIMCSRA_BUZE_OR	$01
	#define TIMCSRA_BUZ0	1		;Buzzer tone selection
	#define TIMCSRA_BUZ0_OR	$02
	#define TIMCSRA_BUZ1	2		;Buzzer tone selection
	#define TIMCSRA_BUZ1_OR	$04
	#define TIMCSRA_BUZ_OR	$06
	#define TIMCSRA_TAR	3		;Timer Auto-Reload
	#define TIMCSRA_TAR_OR	$08
	#define TIMCSRA_OVFE	4		;Timer Overflow Interrupt Enable
	#define TIMCSRA_OVFE_OR	$10
	#define TIMCSRA_OVF	5		;Timer Overflow Flag
	#define TIMCSRA_OVF_OR	$20
	#define TIMCSRA_TB0	6		;Time Base period selection
	#define TIMCSRA_TB0_OR	$40
	#define TIMCSRA_TB1	7		;Time Base period selection
	#define TIMCSRA_TB1_OR	$80
	#define TIMCSRA_TB_OR	$c0

	EXTERN TIMCPRA.b		; Timer A Counter Preload Register

; PWM Generator (PWM)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PWMDCR0.b		; Duty Cycle Register Chanel 0

	EXTERN PWMDCR1.b		; Duty Cycle Register Chanel 1

	EXTERN PWMDCR2.b		; Duty Cycle Register Chanel 2

	EXTERN PWMDCR3.b		; Duty Cycle Register Chanel 3

	EXTERN PWMCRA.b		; Control Register A
	#define PWMCRA_OP0	0		;Output Polarity Chanel 0
	#define PWMCRA_OP0_OR	$01
	#define PWMCRA_OP1	1		;Output Polarity Chanel 1
	#define PWMCRA_OP1_OR	$02
	#define PWMCRA_OP2	2		;Output Polarity Chanel 2
	#define PWMCRA_OP2_OR	$04
	#define PWMCRA_OP3	3		;Output Polarity Chanel 3
	#define PWMCRA_OP3_OR	$08
	#define PWMCRA_OE0	4		;Output Enable Chanel 0
	#define PWMCRA_OE0_OR	$10
	#define PWMCRA_OE1	5		;Output Enable Chanel 1
	#define PWMCRA_OE1_OR	$20
	#define PWMCRA_OE2	6		;Output Enable Chanel 2
	#define PWMCRA_OE2_OR	$40
	#define PWMCRA_OE3	7		;Output Enable Chanel 3
	#define PWMCRA_OE3_OR	$80

	EXTERN PWMARRA.b		; Auto-Reload Register A

	EXTERN PWMDCR4.b		; Duty Cycle Register Chanel 4

	EXTERN PWMDCR5.b		; Duty Cycle Register Chanel 5

	EXTERN PWMCRB.b		; Control Register B
	#define PWMCRB_OP4	0		;Output Polarity Chanel 4
	#define PWMCRB_OP4_OR	$01
	#define PWMCRB_OP5	1		;Output Polarity Chanel 5
	#define PWMCRB_OP5_OR	$02
	#define PWMCRB_OE4	6		;Output Enable Chanel 4
	#define PWMCRB_OE4_OR	$40
	#define PWMCRB_OE5	7		;Output Enable Chanel 5
	#define PWMCRB_OE5_OR	$80

	EXTERN PWMARRB.b		; Auto-Reload Register B

; Flash Control Status Register (FCSR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FCSR.b		; Flash Control/Status Register

; WatchDog Timer (WDG)
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

; I2C Single-Master Bus Interface (I2C)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN I2CCR.b		; Control Register
	#define I2CCR_ITE	0		;I2C Interrupt
	#define I2CCR_ITE_OR	$01
	#define I2CCR_STOP	1		;Generation of a Stop Condition
	#define I2CCR_STOP_OR	$02
	#define I2CCR_ACK	2		;Acknowledge
	#define I2CCR_ACK_OR	$04
	#define I2CCR_START	3		;Generation of a Start Condition
	#define I2CCR_START_OR	$08
	#define I2CCR_PE	5		;Peripheral I2C
	#define I2CCR_PE_OR	$20

	EXTERN I2CSR.b		; Status Register
	#define I2CSR_SB	0		;Start Bit
	#define I2CSR_SB_OR	$01
	#define I2CSR_M_SL	1		;Master/Slave Mode
	#define I2CSR_M_SL_OR	$02
	#define I2CSR_BTF	3		;Byte Transfer
	#define I2CSR_BTF_OR	$08
	#define I2CSR_TRA	5		;Transmitter/Receiver
	#define I2CSR_TRA_OR	$20
	#define I2CSR_AF	6		;Acknowledge Failure
	#define I2CSR_AF_OR	$40
	#define I2CSR_EVF	7		;Event Flag
	#define I2CSR_EVF_OR	$80

	EXTERN I2CCCR.b		; Clock Control Register
	#define I2CCCR_CC0	0		;6-bit Clock Divider
	#define I2CCCR_CC0_OR	$01
	#define I2CCCR_CC1	1		;6-bit Clock Divider
	#define I2CCCR_CC1_OR	$02
	#define I2CCCR_CC2	2		;6-bit Clock Divider
	#define I2CCCR_CC2_OR	$04
	#define I2CCCR_CC3	3		;6-bit Clock Divider
	#define I2CCCR_CC3_OR	$08
	#define I2CCCR_CC4	4		;6-bit Clock Divider
	#define I2CCCR_CC4_OR	$10
	#define I2CCCR_CC5	5		;6-bit Clock Divider
	#define I2CCCR_CC5_OR	$20
	#define I2CCCR_CC_OR	$3f
	#define I2CCCR_FILTOFF	6		;Filter Off
	#define I2CCCR_FILTOFF_OR	$40
	#define I2CCCR_FM_SM	7		;Fast Mode Select
	#define I2CCCR_FM_SM_OR	$80

	EXTERN I2CDR.b		; Data Register

; Display Data Channel Interfaces (DDC A)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN DDCCRA.b		; DDC Control Register
	#define DDCCRA_ITE	0		;Interrupt Enable
	#define DDCCRA_ITE_OR	$01
	#define DDCCRA_STOP	1		;Release I2C bus
	#define DDCCRA_STOP_OR	$02
	#define DDCCRA_ACK	2		;Acknowledge enable
	#define DDCCRA_ACK_OR	$04
	#define DDCCRA_DDCCIEN	4		;DDC/CI address detection enabled
	#define DDCCRA_DDCCIEN_OR	$10
	#define DDCCRA_PE	5		;Peripheral Enable
	#define DDCCRA_PE_OR	$20

	EXTERN DDCSR1A.b		; DDC Status Register 1
	#define DDCSR1A_ADSL	2		;Address Matched (Slave Mode)
	#define DDCSR1A_ADSL_OR	$04
	#define DDCSR1A_BTF	3		;Byte Transfer Finished
	#define DDCSR1A_BTF_OR	$08
	#define DDCSR1A_BUSY	4		;Bus Busy
	#define DDCSR1A_BUSY_OR	$10
	#define DDCSR1A_TRA	5		;Transmitter/Receiver
	#define DDCSR1A_TRA_OR	$20
	#define DDCSR1A_EVF	7		;Event Flag
	#define DDCSR1A_EVF_OR	$80

	EXTERN DDCSR2A.b		; DDC Status Register 2
	#define DDCSR2A_DDCIF	0		;DDC/CI address detected.
	#define DDCSR2A_DDCIF_OR	$01
	#define DDCSR2A_BERR	1		;Bus Error
	#define DDCSR2A_BERR_OR	$02
	#define DDCSR2A_STOPF	3		;Stop Detection
	#define DDCSR2A_STOPF_OR	$08
	#define DDCSR2A_AF	4		;Acknowledge Failure
	#define DDCSR2A_AF_OR	$10

	EXTERN DDCOAR1A.b		; DDC (7 bits) Slave Address 1 Register

	EXTERN DDCOAR2A.b		; DDC (7 bits) Slave Address 2 Register

	EXTERN DDCDRA.b		; DDC Data Register

	EXTERN DDCDCRA.b		; DDC2B Control Register
	#define DDCDCRA_DDC2BPE	0		;DDC2B Peripheral Enable
	#define DDCDCRA_DDC2BPE_OR	$01
	#define DDCDCRA_WP	1		;Write Protect
	#define DDCDCRA_WP_OR	$02
	#define DDCDCRA_EDE	2		;End of Download interrupt Enable
	#define DDCDCRA_EDE_OR	$04
	#define DDCDCRA_EDF	3		;End of Download interrupt Flag
	#define DDCDCRA_EDF_OR	$08
	#define DDCDCRA_ENDCE	4		;End of Communication interrupt Enable
	#define DDCDCRA_ENDCE_OR	$10
	#define DDCDCRA_ENDCF	5		;End of Communication interrupt Flag
	#define DDCDCRA_ENDCF_OR	$20

; Display Data Channel Interfaces (DDC B)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN DDCCRB.b		; DDC Control Register
	#define DDCCRB_ITE	0		;Interrupt Enable
	#define DDCCRB_ITE_OR	$01
	#define DDCCRB_STOP	1		;Release I2C bus
	#define DDCCRB_STOP_OR	$02
	#define DDCCRB_ACK	2		;Acknowledge enable
	#define DDCCRB_ACK_OR	$04
	#define DDCCRB_DDCCIEN	4		;DDC/CI address detection enabled
	#define DDCCRB_DDCCIEN_OR	$10
	#define DDCCRB_PE	5		;Peripheral Enable
	#define DDCCRB_PE_OR	$20

	EXTERN DDCSR1B.b		; DDC Status Register 1
	#define DDCSR1B_ADSL	2		;Address Matched (Slave Mode)
	#define DDCSR1B_ADSL_OR	$04
	#define DDCSR1B_BTF	3		;Byte Transfer Finished
	#define DDCSR1B_BTF_OR	$08
	#define DDCSR1B_BUSY	4		;Bus Busy
	#define DDCSR1B_BUSY_OR	$10
	#define DDCSR1B_TRA	5		;Transmitter/Receiver
	#define DDCSR1B_TRA_OR	$20
	#define DDCSR1B_EVF	7		;Event Flag
	#define DDCSR1B_EVF_OR	$80

	EXTERN DDCSR2B.b		; DDC Status Register 2
	#define DDCSR2B_DDCIF	0		;DDC/CI address detected.
	#define DDCSR2B_DDCIF_OR	$01
	#define DDCSR2B_BERR	1		;Bus Error
	#define DDCSR2B_BERR_OR	$02
	#define DDCSR2B_STOPF	3		;Stop Detection
	#define DDCSR2B_STOPF_OR	$08
	#define DDCSR2B_AF	4		;Acknowledge Failure
	#define DDCSR2B_AF_OR	$10

	EXTERN DDCOAR1B.b		; DDC (7 bits) Slave Address 1 Register

	EXTERN DDCOAR2B.b		; DDC (7 bits) Slave Address 2 Register

	EXTERN DDCDRB.b		; DDC Data Register

	EXTERN DDCDCRB.b		; DDC2B Control Register
	#define DDCDCRB_DDC2BPE	0		;DDC2B Peripheral Enable
	#define DDCDCRB_DDC2BPE_OR	$01
	#define DDCDCRB_WP	1		;Write Protect
	#define DDCDCRB_WP_OR	$02
	#define DDCDCRB_EDE	2		;End of Download interrupt Enable
	#define DDCDCRB_EDE_OR	$04
	#define DDCDCRB_EDF	3		;End of Download interrupt Flag
	#define DDCDCRB_EDF_OR	$08
	#define DDCDCRB_ENDCE	4		;End of Communication interrupt Enable
	#define DDCDCRB_ENDCE_OR	$10
	#define DDCDCRB_ENDCF	5		;End of Communication interrupt Flag
	#define DDCDCRB_ENDCF_OR	$20

; Infrared Preprocessor (IFR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN DR.b		; Data Register

	EXTERN CR.b		; Control Register
	#define CR_POSED_NEGED0	1		;Edge selection for the duration measurement
	#define CR_POSED_NEGED0_OR	$02
	#define CR_POSED_NEGED1	2		;Edge selection for the duration measurement
	#define CR_POSED_NEGED1_OR	$04
	#define CR_POSED/NEGED_OR	$06
	#define CR_FLSEL	3		;Spike filter pulse width selection
	#define CR_FLSEL_OR	$08
	#define CR_ITE	4		;Interrupt enable
	#define CR_ITE_OR	$10

; 8-bit Timer with External Trigger (TIMB)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIMCSRB.b		; Timer B Control Status Register
	#define TIMCSRB_EEF	0		;External Event Flag
	#define TIMCSRB_EEF_OR	$01
	#define TIMCSRB_EDG	1		;External Signal Edge
	#define TIMCSRB_EDG_OR	$02
	#define TIMCSRB_EXT	2		;External Trigger
	#define TIMCSRB_EXT_OR	$04
	#define TIMCSRB_TAR	3		;Timer Auto-Reload
	#define TIMCSRB_TAR_OR	$08
	#define TIMCSRB_OVFE	4		;Timer Overflow Interrupt Enable
	#define TIMCSRB_OVFE_OR	$10
	#define TIMCSRB_OVF	5		;Timer Overflow Flag
	#define TIMCSRB_OVF_OR	$20
	#define TIMCSRB_TB0	6		;Time Base period selection
	#define TIMCSRB_TB0_OR	$40
	#define TIMCSRB_TB1	7		;Time Base period selection
	#define TIMCSRB_TB1_OR	$80
	#define TIMCSRB_TB_OR	$c0

	EXTERN TIMCPRB.b		; Timer B Counter Preload Register

	#endif ; __ST7FLCD1__
