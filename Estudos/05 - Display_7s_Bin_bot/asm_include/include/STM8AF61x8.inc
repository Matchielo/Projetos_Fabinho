; STM8AF61x8.inc

; Copyright (c) 2003-2017 STMicroelectronics

	#ifdef __STM8AF61x8__
; do nothing
	#else
	#define __STM8AF61x8__ 1

; STM8AF61x8


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

; Port G
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PG_ODR.w		; Port G data output latch register

	EXTERN PG_IDR.w		; Port G input pin value register

	EXTERN PG_DDR.w		; Port G data direction register

	EXTERN PG_CR1.w		; Port G control register 1

	EXTERN PG_CR2.w		; Port G control register 2

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

; Universal synch/asynch receiver transmitter (USART)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN USART_SR.w		; USART Status Register

	EXTERN USART_DR.w		; USART Data Register

	EXTERN USART_BRR1.w		; USART Baud Rate Register 1

	EXTERN USART_BRR2.w		; USART Baud Rate Register 2

	EXTERN USART_CR1.w		; USART Control Register 1

	EXTERN USART_CR2.w		; USART Control Register 2

	EXTERN USART_CR3.w		; USART Control Register 3

	EXTERN USART_CR4.w		; USART Control Register 4

	EXTERN USART_CR5.w		; USART Control Register 5

	EXTERN USART_GTR.w		; USART Guard time Register

	EXTERN USART_PSCR.w		; USART Prescaler Register

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

	EXTERN LINUART_CR6.w		; LINUART Control Register 6

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

; 16-Bit Timer 2 (TIM2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM2_CR1.w		; TIM2 Control register 1

	EXTERN TIM2_IER.w		; TIM2 Interrupt enable register

	EXTERN TIM2_SR1.w		; TIM2 Status register 1

	EXTERN TIM2_SR2.w		; TIM2 Status register 2

	EXTERN TIM2_EGR.w		; TIM2 Event Generation register

	EXTERN TIM2_CCMR1.w		; TIM2 Capture/Compare mode register 1

	EXTERN TIM2_CCMR2.w		; TIM2 Capture/Compare mode register 2

	EXTERN TIM2_CCMR3.w		; TIM2 Capture/Compare mode register 3

	EXTERN TIM2_CCER1.w		; TIM2 Capture/Compare enable register 1

	EXTERN TIM2_CCER2.w		; TIM2 Capture/Compare enable register 2

	EXTERN TIM2_CNTRH.w		; Data bits High

	EXTERN TIM2_CNTRL.w		; Data bits Low

	EXTERN TIM2_PSCR.w		; TIM2 Prescaler register

	EXTERN TIM2_ARRH.w		; Data bits High

	EXTERN TIM2_ARRL.w		; Data bits Low

	EXTERN TIM2_CCR1H.w		; Data bits High

	EXTERN TIM2_CCR1L.w		; Data bits Low

	EXTERN TIM2_CCR2H.w		; Data bits High

	EXTERN TIM2_CCR2L.w		; Data bits Low

	EXTERN TIM2_CCR3H.w		; Data bits High

	EXTERN TIM2_CCR3L.w		; Data bits Low

; 16-Bit Timer 3 (TIM3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM3_CR1.w		; TIM3 Control register 1

	EXTERN TIM3_IER.w		; TIM3 Interrupt enable register

	EXTERN TIM3_SR1.w		; TIM3 Status register 1

	EXTERN TIM3_SR2.w		; TIM3 Status register 2

	EXTERN TIM3_EGR.w		; TIM3 Event Generation register

	EXTERN TIM3_CCMR1.w		; TIM3 Capture/Compare mode register 1

	EXTERN TIM3_CCMR2.w		; TIM3 Capture/Compare mode register 2

	EXTERN TIM3_CCER1.w		; TIM3 Capture/Compare enable register 1

	EXTERN TIM3_CNTRH.w		; Data bits High

	EXTERN TIM3_CNTRL.w		; Data bits Low

	EXTERN TIM3_PSCR.w		; TIM3 Prescaler register

	EXTERN TIM3_ARRH.w		; Data bits High

	EXTERN TIM3_ARRL.w		; Data bits Low

	EXTERN TIM3_CCR1H.w		; Data bits High

	EXTERN TIM3_CCR1L.w		; Data bits Low

	EXTERN TIM3_CCR2H.w		; Data bits High

	EXTERN TIM3_CCR2L.w		; Data bits Low

; 8-Bit  Timer 4 (TIM4)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM4_CR1.w		; TIM4 Control register 1

	EXTERN TIM4_IER.w		; TIM4 Interrupt enable register

	EXTERN TIM4_SR.w		; TIM4 Status register

	EXTERN TIM4_EGR.w		; TIM4 Event Generation register

	EXTERN TIM4_CNTR.w		; TIM4 Counter

	EXTERN TIM4_PSCR.w		; TIM4 Prescaler register

	EXTERN TIM4_ARR.w		; TIM4 Auto-reload register

; 10-Bit A/D Converter (ADC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADC_CSR.w		; ADC Control/Status Register

	EXTERN ADC_CR1.w		; ADC Configuration Register 1

	EXTERN ADC_CR2.w		; ADC Configuration Register 2

	EXTERN ADC_DRH.w		; Data bits High

	EXTERN ADC_DRL.w		; Data bits Low

	EXTERN ADC_TDRH.w		; Schmitt trigger disable High

	EXTERN ADC_TDRL.w		; Schmitt trigger disable Low

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

	#endif ; __STM8AF61x8__
