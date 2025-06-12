; STM8AF6223.inc

; Copyright (c) 2003-2017 STMicroelectronics

	#ifdef __STM8AF6223__
; do nothing
	#else
	#define __STM8AF6223__ 1

; STM8AF6223


; Port A
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PA_ODR.w		; Port A data output latch register

	EXTERN PA_IDR.w		; Port A input pin value register

	EXTERN PA_DDR.w		; Port A data direction register

	EXTERN PA_CR1.w		; Port A control register 1

	EXTERN PA_CR2.w		; Port A control register 2

; Port B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PB_ODR.w		; Port B data output latch register

	EXTERN PB_IDR.w		; Port B input pin value register

	EXTERN PB_DDR.w		; Port B data direction register

	EXTERN PB_CR1.w		; Port B control register 1

	EXTERN PB_CR2.w		; Port B control register 2

; Port C
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PC_ODR.w		; Port C data output latch register

	EXTERN PC_IDR.w		; Port C input pin value register

	EXTERN PC_DDR.w		; Port C data direction register

	EXTERN PC_CR1.w		; Port C control register 1

	EXTERN PC_CR2.w		; Port C control register 2

; Port D
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PD_ODR.w		; Port D data output latch register

	EXTERN PD_IDR.w		; Port D input pin value register

	EXTERN PD_DDR.w		; Port D data direction register

	EXTERN PD_CR1.w		; Port D control register 1

	EXTERN PD_CR2.w		; Port D control register 2

; Port E
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PE_ODR.w		; Port E data output latch register

	EXTERN PE_IDR.w		; Port E input pin value register

	EXTERN PE_DDR.w		; Port E data direction register

	EXTERN PE_CR1.w		; Port E control register 1

	EXTERN PE_CR2.w		; Port E control register 2

; Port F
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PF_ODR.w		; Port F data output latch register

	EXTERN PF_IDR.w		; Port F input pin value register

	EXTERN PF_DDR.w		; Port F data direction register

	EXTERN PF_CR1.w		; Port F control register 1

	EXTERN PF_CR2.w		; Port F control register 2

; Flash
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN FLASH_CR1.w		; Flash control register 1

	EXTERN FLASH_CR2.w		; Flash control register 2

	EXTERN FLASH_NCR2.w		; Flash complementary control register 2

	EXTERN FLASH_FPR.w		; Flash protection register

	EXTERN FLASH_NFPR.w		; Flash complementary protection register

	EXTERN FLASH_IAPSR.w		; Flash in-application programming status register

	EXTERN FLASH_PUKR.w		; Flash Program memory unprotection register

	EXTERN FLASH_DUKR.w		; Data EEPROM unprotection register

; External Interrupt Control Register (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN EXTI_CR1.w		; External interrupt control register 1

	EXTERN EXTI_CR2.w		; External interrupt control register 2

; Reset (RST)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN RST_SR.w		; Reset status register 1

; Clock Control (CLK)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CLK_ICKR.w		; Internal clock control register

	EXTERN CLK_ECKR.w		; External clock control register

	EXTERN CLK_CMSR.w		; Clock master status register

	EXTERN CLK_SWR.w		; Clock master switch register

	EXTERN CLK_SWCR.w		; Clock switch control register

	EXTERN CLK_CKDIVR.w		; Clock divider register

	EXTERN CLK_PCKENR1.w		; Peripheral clock gating register 1

	EXTERN CLK_CSSR.w		; Clock security system register

	EXTERN CLK_CCOR.w		; Configurable clock control register

	EXTERN CLK_PCKENR2.w		; Peripheral clock gating register 2

	EXTERN CLK_CANCCR.w		; CAN clock control register

	EXTERN CLK_HSITRIMR.w		; HSI clock calibration trimming register

	EXTERN CLK_SWIMCCR.w		; SWIM clock control register

; Window Watchdog (WWDG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN WWDG_CR.w		; WWDG Control Register

	EXTERN WWDG_WR.w		; WWDR Window Register

; Independent Watchdog (IWDG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN IWDG_KR.w		; IWDG Key Register

	EXTERN IWDG_PR.w		; IWDG Prescaler Register

	EXTERN IWDG_RLR.w		; IWDG Reload Register

; Auto Wake-Up (AWU)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN AWU_CSR.w		; AWU Control/Status Register

	EXTERN AWU_APR.w		; AWU asynchronous prescaler buffer register

	EXTERN AWU_TBR.w		; AWU Timebase selection register

; Beeper (BEEP)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN BEEP_CSR.w		; BEEP Control/Status Register

; Serial Peripheral Interface (SPI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SPI_CR1.w		; SPI Control Register 1

	EXTERN SPI_CR2.w		; SPI Control Register 2

	EXTERN SPI_ICR.w		; SPI Interrupt Control Register

	EXTERN SPI_SR.w		; SPI Status Register

	EXTERN SPI_DR.w		; SPI Data Register

	EXTERN SPI_CRCPR.w		; SPI CRC Polynomial Register

	EXTERN SPI_RXCRCR.w		; SPI Rx CRC Register

	EXTERN SPI_TXCRCR.w		; SPI Tx CRC Register

; I2C Bus Interface (I2C)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN I2C_CR1.w		; I2C control register 1

	EXTERN I2C_CR2.w		; I2C control register 2

	EXTERN I2C_FREQR.w		; I2C frequency register

	EXTERN I2C_OARL.w		; I2C Own address register low

	EXTERN I2C_OARH.w		; I2C Own address register high

	EXTERN I2C_DR.w		; I2C data register

	EXTERN I2C_SR1.w		; I2C status register 1

	EXTERN I2C_SR2.w		; I2C status register 2

	EXTERN I2C_SR3.w		; I2C status register 3

	EXTERN I2C_ITR.w		; I2C interrupt control register

	EXTERN I2C_CCRL.w		; I2C Clock control register low

	EXTERN I2C_CCRH.w		; I2C Clock control register high

	EXTERN I2C_TRISER.w		; I2C TRISE register

	EXTERN I2C_PECR.w		; I2C packet error checking register

; LIN Universal asynch. receiver transmitter (LINUART)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN LINUART_SR.w		; LINUART Status Register

	EXTERN LINUART_DR.w		; LINUART Data Register

	EXTERN LINUART_BRR1.w		; LINUART Baud Rate Register 1

	EXTERN LINUART_BRR2.w		; LINUART Baud Rate Register 2

	EXTERN LINUART_CR1.w		; LINUART Control Register 1

	EXTERN LINUART_CR2.w		; LINUART Control Register 2

	EXTERN LINUART_CR3.w		; LINUART Control Register 3

	EXTERN LINUART_CR4.w		; LINUART Control Register 4

	EXTERN LINUART_CR5.w		; LINUART Control Register 5

	EXTERN LINUART_CR6.w		; LINUART Control Register 6

	EXTERN LINUART_GTR.w		; LINUART Guard Time Register

	EXTERN LINUART_PSCR.w		; LINUART Prescaler Register

; 16-Bit Timer 1 (TIM1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM1_CR1.w		; TIM1 Control register 1

	EXTERN TIM1_CR2.w		; TIM1 Control register 2

	EXTERN TIM1_SMCR.w		; TIM1 Slave Mode Control register

	EXTERN TIM1_ETR.w		; TIM1 external trigger register

	EXTERN TIM1_IER.w		; TIM1 Interrupt enable register

	EXTERN TIM1_SR1.w		; TIM1 Status register 1

	EXTERN TIM1_SR2.w		; TIM1 Status register 2

	EXTERN TIM1_EGR.w		; TIM1 Event Generation register

	EXTERN TIM1_CCMR1.w		; TIM1 Capture/Compare mode register 1

	EXTERN TIM1_CCMR2.w		; TIM1 Capture/Compare mode register 2

	EXTERN TIM1_CCMR3.w		; TIM1 Capture/Compare mode register 3

	EXTERN TIM1_CCMR4.w		; TIM1 Capture/Compare mode register 4

	EXTERN TIM1_CCER1.w		; TIM1 Capture/Compare enable register 1

	EXTERN TIM1_CCER2.w		; TIM1 Capture/Compare enable register 2

	EXTERN TIM1_CNTRH.w		; Data bits High

	EXTERN TIM1_CNTRL.w		; Data bits Low

	EXTERN TIM1_PSCRH.w		; Data bits High

	EXTERN TIM1_PSCRL.w		; Data bits Low

	EXTERN TIM1_ARRH.w		; Data bits High

	EXTERN TIM1_ARRL.w		; Data bits Low

	EXTERN TIM1_RCR.w		; TIM1 Repetition counter register

	EXTERN TIM1_CCR1H.w		; Data bits High

	EXTERN TIM1_CCR1L.w		; Data bits Low

	EXTERN TIM1_CCR2H.w		; Data bits High

	EXTERN TIM1_CCR2L.w		; Data bits Low

	EXTERN TIM1_CCR3H.w		; Data bits High

	EXTERN TIM1_CCR3L.w		; Data bits Low

	EXTERN TIM1_CCR4H.w		; Data bits High

	EXTERN TIM1_CCR4L.w		; Data bits Low

	EXTERN TIM1_BKR.w		; TIM1 Break register

	EXTERN TIM1_DTR.w		; TIM1 Dead-time register

	EXTERN TIM1_OISR.w		; TIM1 Output idle state register

; 16-Bit Timer 5 (TIM5)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM5_CR1.w		; TIM5 Control register 1

	EXTERN TIM5_CR2.w		; TIM5 Control register 2

	EXTERN TIM5_SMCR.w		; TIM5 Slave Mode Control register

	EXTERN TIM5_IER.w		; TIM5 Interrupt enable register

	EXTERN TIM5_SR1.w		; TIM5 Status register 1

	EXTERN TIM5_SR2.w		; TIM5 Status register 2

	EXTERN TIM5_EGR.w		; TIM5 Event Generation register

	EXTERN TIM5_CCMR1.w		; TIM5 Capture/Compare mode register 1

	EXTERN TIM5_CCMR2.w		; TIM5 Capture/Compare mode register 2

	EXTERN TIM5_CCMR3.w		; TIM5 Capture/Compare mode register 3

	EXTERN TIM5_CCER1.w		; TIM5 Capture/Compare enable register 1

	EXTERN TIM5_CCER2.w		; TIM5 Capture/Compare enable register 2

	EXTERN TIM5_CNTRH.w		; Data bits High

	EXTERN TIM5_CNTRL.w		; Data bits Low

	EXTERN TIM5_PSCR.w		; TIM5 Prescaler register

	EXTERN TIM5_ARRH.w		; Data bits High

	EXTERN TIM5_ARRL.w		; Data bits Low

	EXTERN TIM5_CCR1H.w		; Data bits High

	EXTERN TIM5_CCR1L.w		; Data bits Low

	EXTERN TIM5_CCR2H.w		; Data bits High

	EXTERN TIM5_CCR2L.w		; Data bits Low

	EXTERN TIM5_CCR3H.w		; Data bits High

	EXTERN TIM5_CCR3L.w		; Data bits Low

; 8-Bit  Timer 6 (TIM6)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM6_CR1.w		; TIM6 Control register 1

	EXTERN TIM6_CR2.w		; TIM6 Control register 2

	EXTERN TIM6_SMCR.w		; TIM6 Slave Mode Control register

	EXTERN TIM6_IER.w		; TIM6 Interrupt enable register

	EXTERN TIM6_SR.w		; TIM6 Status register

	EXTERN TIM6_EGR.w		; TIM6 Event Generation register

	EXTERN TIM6_CNTR.w		; TIM6 Counter

	EXTERN TIM6_PSCR.w		; TIM6 Prescaler register

	EXTERN TIM6_ARR.w		; TIM6 Auto-reload register

; 10-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADC_DB0RH.w		; Data Buffer register 0 High

	EXTERN ADC_DB0RL.w		; Data Buffer register 0 Low

	EXTERN ADC_DB1RH.w		; Data Buffer register 1 High

	EXTERN ADC_DB1RL.w		; Data Buffer register 1 Low

	EXTERN ADC_DB2RH.w		; Data Buffer register 2 High

	EXTERN ADC_DB2RL.w		; Data Buffer register 2 Low

	EXTERN ADC_DB3RH.w		; Data Buffer register 3 High

	EXTERN ADC_DB3RL.w		; Data Buffer register 3 Low

	EXTERN ADC_DB4RH.w		; Data Buffer register 4 High

	EXTERN ADC_DB4RL.w		; Data Buffer register 4 Low

	EXTERN ADC_DB5RH.w		; Data Buffer register 5 High

	EXTERN ADC_DB5RL.w		; Data Buffer register 5 Low

	EXTERN ADC_DB6RH.w		; Data Buffer register 6 High

	EXTERN ADC_DB6RL.w		; Data Buffer register 6 Low

	EXTERN ADC_DB7RH.w		; Data Buffer register 7 High

	EXTERN ADC_DB7RL.w		; Data Buffer register 7 Low

	EXTERN ADC_DB8RH.w		; Data Buffer register 8 High

	EXTERN ADC_DB8RL.w		; Data Buffer register 8 Low

	EXTERN ADC_DB9RH.w		; Data Buffer register 9 High

	EXTERN ADC_DB9RL.w		; Data Buffer register 9 Low

	EXTERN ADC_CSR.w		; ADC Control/Status Register

	EXTERN ADC_CR1.w		; ADC Configuration Register 1

	EXTERN ADC_CR2.w		; ADC Configuration Register 2

	EXTERN ADC_CR3.w		; ADC Configuration Register 3

	EXTERN ADC_DRH.w		; Data bits High

	EXTERN ADC_DRL.w		; Data bits Low

	EXTERN ADC_TDRH.w		; Schmitt trigger disable High

	EXTERN ADC_TDRL.w		; Schmitt trigger disable Low

	EXTERN ADC_HTRH.w		; High Threshold Register High

	EXTERN ADC_HTRL.w		; High Threshold Register Low

	EXTERN ADC_LTRH.w		; Low Threshold Register High

	EXTERN ADC_LTRL.w		; Low Threshold Register Low

	EXTERN ADC_AWSRH.w		; Analog Watchdog Status register High

	EXTERN ADC_AWSRL.w		; Analog Watchdog Status register Low

	EXTERN ADC_AWCRH.w		; Analog Watchdog Control register High

	EXTERN ADC_AWCRL.w		; Analog Watchdog Control register Low

;  Global configuration register (CFG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CFG_GCR.w		; CFG Global configuration register

; Interrupt Software Priority Register (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ITC_SPR1.w		; Interrupt Software priority register 1

	EXTERN ITC_SPR2.w		; Interrupt Software priority register 2

	EXTERN ITC_SPR3.w		; Interrupt Software priority register 3

	EXTERN ITC_SPR4.w		; Interrupt Software priority register 4

	EXTERN ITC_SPR5.w		; Interrupt Software priority register 5

	EXTERN ITC_SPR6.w		; Interrupt Software priority register 6

	EXTERN ITC_SPR7.w		; Interrupt Software priority register 7

	#endif ; __STM8AF6223__
