; STM8L150C.inc

; Copyright (c) 2003-2017 STMicroelectronics

	#ifdef __STM8L150C__
; do nothing
	#else
	#define __STM8L150C__ 1

; STM8L150C


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

	EXTERN FLASH_PUKR.w		; Flash Program memory unprotection register

	EXTERN FLASH_DUKR.w		; Data EEPROM unprotection register

	EXTERN FLASH_IAPSR.w		; Flash in-application programming status register

; Direct memory access controller 1 (DMA1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN DMA1_GCSR.w		; DMA1 global configuration & status register

	EXTERN DMA1_GIR1.w		; DMA1 global interrupt register 1

	EXTERN DMA1_C0CR.w		; DMA1 channel 0 configuration register

	EXTERN DMA1_C0SPR.w		; DMA1 channel 0 status & priority register

	EXTERN DMA1_C0NDTR.w		; DMA1 number of data to transfer register (channel 0)

	EXTERN DMA1_C0PARH.w		; DMA peripheral address high register (channel 0)

	EXTERN DMA1_C0PARL.w		; DMA peripheral address low register (channel 0)

	EXTERN DMA1_C0M0ARH.w		; DMA memory address high register (channel 0)

	EXTERN DMA1_C0M0ARL.w		; DMA memory address low register (channel 0)

	EXTERN DMA1_C1CR.w		; DMA1 channel 1 configuration register

	EXTERN DMA1_C1SPR.w		; DMA1 channel 1 status & priority register

	EXTERN DMA1_C1NDTR.w		; DMA1 number of data to transfer register (channel 1)

	EXTERN DMA1_C1PARH.w		; DMA peripheral address high register (channel 1)

	EXTERN DMA1_C1PARL.w		; DMA peripheral address low register (channel 1)

	EXTERN DMA1_C1M0ARH.w		; DMA memory address high register (channel 1)

	EXTERN DMA1_C1M0ARL.w		; DMA memory address low register (channel 1)

	EXTERN DMA1_C2CR.w		; DMA1 channel 2 configuration register

	EXTERN DMA1_C2SPR.w		; DMA1 channel 2 status & priority register

	EXTERN DMA1_C2NDTR.w		; DMA1 number of data to transfer register (channel 2)

	EXTERN DMA1_C2PARH.w		; DMA peripheral address high register (channel 2)

	EXTERN DMA1_C2PARL.w		; DMA peripheral address low register (channel 2)

	EXTERN DMA1_C2M0ARH.w		; DMA memory address high register (channel 2)

	EXTERN DMA1_C2M0ARL.w		; DMA memory address low register (channel 2)

	EXTERN DMA1_C3CR.w		; DMA1 channel 3 configuration register

	EXTERN DMA1_C3SPR.w		; DMA1 channel 3 status & priority register

	EXTERN DMA1_C3NDTR.w		; DMA1 number of data to transfer register (channel 3)

	EXTERN DMA1_C3PARH_C3M1ARH.w		; DMA1 peripheral address high register (channel 3)

	EXTERN DMA1_C3PARL_C3M1ARL.w		; DMA1 peripheral address low register (channel 3)

	EXTERN DMA_C3M0EAR.w		; DMA channel 3 memory 0 extended address register

	EXTERN DMA1_C3M0ARH.w		; DMA memory address high register (channel 3)

	EXTERN DMA1_C3M0ARL.w		; DMA memory address low register (channel 3)

; System configuration (SYSCFG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SYSCFG_RMPCR3.w		; Remapping register 3

	EXTERN SYSCFG_RMPCR1.w		; Remapping register 1

	EXTERN SYSCFG_RMPCR2.w		; Remapping register 2

; External Interrupt Control Register (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN EXTI_CR1.w		; External interrupt control register 1

	EXTERN EXTI_CR2.w		; External interrupt control register 2

	EXTERN EXTI_CR3.w		; External interrupt control register 3

	EXTERN EXTI_SR1.w		; External interrupt status register 1

	EXTERN EXTI_SR2.w		; External interrupt status register 2

	EXTERN EXTI_CONF1.w		; External interrupt port select register 1

; Wait For Event (WFE)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN WFE_CR1.w		; WFE control register 1

	EXTERN WFE_CR2.w		; WFE control register 2

	EXTERN WFE_CR3.w		; WFE control register 3

	EXTERN WFE_CR4.w		; WFE control register 4

; External Interrupt Control Register (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN EXTI_CR4.w		; External interrupt control register 4

	EXTERN EXTI_CONF2.w		; External interrupt port select register 2

; Reset (RST)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN RST_CR.w		; Reset control register

	EXTERN RST_SR.w		; Reset status register

; Power control (PWR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN PWR_CSR1.w		; Power control and status register 1

	EXTERN PWR_CSR2.w		; Power control and status register 2

; Clock Control (CLK)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CLK_CKDIVR.w		; System clock divider register

	EXTERN CLK_CRTCR.w		; Clock RTC register

	EXTERN CLK_ICKCR.w		; Internal clock control register

	EXTERN CLK_PCKENR1.w		; Peripheral clock gating register 1

	EXTERN CLK_PCKENR2.w		; Peripheral clock gating register 2

	EXTERN CLK_CCOR.w		; Configurable clock control register

	EXTERN CLK_ECKCR.w		; External clock control register

	EXTERN CLK_SCSR.w		; System clock status register

	EXTERN CLK_SWR.w		; System clock switch register

	EXTERN CLK_SWCR.w		; Clock switch control register

	EXTERN CLK_CSSR.w		; Clock security system register

	EXTERN CLK_CBEEPR.w		; Clock BEEP register

	EXTERN CLK_HSICALR.w		; HSI calibration register

	EXTERN CLK_HSITRIMR.w		; HSI clock calibration trimming register

	EXTERN CLK_HSIUNLCKR.w		; HSI unlock register

	EXTERN CLK_REGCSR.w		; Main regulator control status register

	EXTERN CLK_PCKENR3.w		; Peripheral clock gating register 3

; Window Watchdog (WWDG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN WWDG_CR.w		; WWDG Control Register

	EXTERN WWDG_WR.w		; WWDR Window Register

; Independent Watchdog (IWDG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN IWDG_KR.w		; IWDG Key Register

	EXTERN IWDG_PR.w		; IWDG Prescaler Register

	EXTERN IWDG_RLR.w		; IWDG Reload Register

; Beeper (BEEP)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN BEEP_CSR1.w		; BEEP Control/Status Register 1

	EXTERN BEEP_CSR2.w		; BEEP Control/Status Register 2

; Serial Peripheral Interface 1 (SPI1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SPI1_CR1.w		; SPI1 Control Register 1

	EXTERN SPI1_CR2.w		; SPI1 Control Register 2

	EXTERN SPI1_ICR.w		; SPI1 Interrupt Control Register

	EXTERN SPI1_SR.w		; SPI1 Status Register

	EXTERN SPI1_DR.w		; SPI1 Data Register

	EXTERN SPI1_CRCPR.w		; SPI1 CRC Polynomial Register

	EXTERN SPI1_RXCRCR.w		; SPI1 Rx CRC Register

	EXTERN SPI1_TXCRCR.w		; SPI1 Tx CRC Register

; I2C Bus Interface 1 (I2C1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN I2C1_CR1.w		; I2C1 control register 1

	EXTERN I2C1_CR2.w		; I2C1 control register 2

	EXTERN I2C1_FREQR.w		; I2C1 frequency register

	EXTERN I2C1_OARL.w		; I2C1 Own address register low

	EXTERN I2C1_OARH.w		; I2C1 Own address register high

	EXTERN I2C1_OAR2.w		; I2C1 Own address register for dual mode

	EXTERN I2C1_DR.w		; I2C1 data register

	EXTERN I2C1_SR1.w		; I2C1 status register 1

	EXTERN I2C1_SR2.w		; I2C1 status register 2

	EXTERN I2C1_SR3.w		; I2C1 status register 3

	EXTERN I2C1_ITR.w		; I2C1 interrupt control register

	EXTERN I2C1_CCRL.w		; I2C1 Clock control register low

	EXTERN I2C1_CCRH.w		; I2C1 Clock control register high

	EXTERN I2C1_TRISER.w		; I2C1 TRISE register

	EXTERN I2C1_PECR.w		; I2C1 packet error checking register

; Universal synch/asynch receiver transmitter 1 (USART1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN USART1_SR.w		; USART1 Status Register

	EXTERN USART1_DR.w		; USART1 Data Register

	EXTERN USART1_BRR1.w		; USART1 Baud Rate Register 1

	EXTERN USART1_BRR2.w		; USART1 Baud Rate Register 2

	EXTERN USART1_CR1.w		; USART1 Control Register 1

	EXTERN USART1_CR2.w		; USART1 Control Register 2

	EXTERN USART1_CR3.w		; USART1 Control Register 3

	EXTERN USART1_CR4.w		; USART1 Control Register 4

	EXTERN USART1_CR5.w		; USART1 Control Register 5

	EXTERN USART1_GTR.w		; USART1 Guard time Register

	EXTERN USART1_PSCR.w		; USART1 Prescaler Register

; 16-Bit Timer 2 (TIM2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM2_CR1.w		; TIM2 Control register 1

	EXTERN TIM2_CR2.w		; TIM2 Control register 2

	EXTERN TIM2_SMCR.w		; TIM2 Slave Mode Control register

	EXTERN TIM2_ETR.w		; TIM2 External trigger register

	EXTERN TIM2_DER.w		; TIM2 DMA request enable register

	EXTERN TIM2_IER.w		; TIM2 Interrupt enable register

	EXTERN TIM2_SR1.w		; TIM2 Status register 1

	EXTERN TIM2_SR2.w		; TIM2 Status register 2

	EXTERN TIM2_EGR.w		; TIM2 Event Generation register

	EXTERN TIM2_CCMR1.w		; TIM2 Capture/Compare mode register 1

	EXTERN TIM2_CCMR2.w		; TIM2 Capture/Compare mode register 2

	EXTERN TIM2_CCER1.w		; TIM2 Capture/Compare enable register 1

	EXTERN TIM2_CNTRH.w		; TIM2 Counter High

	EXTERN TIM2_CNTRL.w		; TIM2 Counter Low

	EXTERN TIM2_PSCR.w		; TIM2 Prescaler register

	EXTERN TIM2_ARRH.w		; TIM2 Auto-Reload Register High

	EXTERN TIM2_ARRL.w		; TIM2 Auto-Reload Register Low

	EXTERN TIM2_CCR1H.w		; TIM2 Capture/Compare Register 1 High

	EXTERN TIM2_CCR1L.w		; TIM2 Capture/Compare Register 1 Low

	EXTERN TIM2_CCR2H.w		; TIM2 Capture/Compare Register 2 High

	EXTERN TIM2_CCR2L.w		; TIM2 Capture/Compare Register 2 Low

	EXTERN TIM2_BKR.w		; TIM2 Break register

	EXTERN TIM2_OISR.w		; TIM2 Output idle state register

; 16-Bit Timer 3 (TIM3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM3_CR1.w		; TIM3 Control register 1

	EXTERN TIM3_CR2.w		; TIM3 Control register 2

	EXTERN TIM3_SMCR.w		; TIM3 Slave Mode Control register

	EXTERN TIM3_ETR.w		; TIM3 External trigger register

	EXTERN TIM3_DER.w		; TIM3 DMA request enable register

	EXTERN TIM3_IER.w		; TIM3 Interrupt enable register

	EXTERN TIM3_SR1.w		; TIM3 Status register 1

	EXTERN TIM3_SR2.w		; TIM3 Status register 2

	EXTERN TIM3_EGR.w		; TIM3 Event Generation register

	EXTERN TIM3_CCMR1.w		; TIM3 Capture/Compare mode register 1

	EXTERN TIM3_CCMR2.w		; TIM3 Capture/Compare mode register 2

	EXTERN TIM3_CCER1.w		; TIM3 Capture/Compare enable register 1

	EXTERN TIM3_CNTRH.w		; TIM3 Counter High

	EXTERN TIM3_CNTRL.w		; TIM3 Counter Low

	EXTERN TIM3_PSCR.w		; TIM3 Prescaler register

	EXTERN TIM3_ARRH.w		; TIM3 Auto-Reload Register High

	EXTERN TIM3_ARRL.w		; TIM3 Auto-Reload Register Low

	EXTERN TIM3_CCR1H.w		; TIM3 Capture/Compare Register 1 High

	EXTERN TIM3_CCR1L.w		; TIM3 Capture/Compare Register 1 Low

	EXTERN TIM3_CCR2H.w		; TIM3 Capture/Compare Register 2 High

	EXTERN TIM3_CCR2L.w		; TIM3 Capture/Compare Register 2 Low

	EXTERN TIM3_BKR.w		; TIM3 Break register

	EXTERN TIM3_OISR.w		; TIM3 Output idle state register

; 16-Bit Timer 1 (TIM1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM1_CR1.w		; TIM1 Control register 1

	EXTERN TIM1_CR2.w		; TIM1 Control register 2

	EXTERN TIM1_SMCR.w		; TIM1 Slave Mode Control register

	EXTERN TIM1_ETR.w		; TIM1 external trigger register

	EXTERN TIM1_DER.w		; TIM1 DMA request enable register

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

	EXTERN TIM1_CNTRH.w		; TIM1 Counter High

	EXTERN TIM1_CNTRL.w		; TIM1 Counter Low

	EXTERN TIM1_PSCRH.w		; TIM1 Prescaler Register High

	EXTERN TIM1_PSCRL.w		; TIM1 Prescaler Register Low

	EXTERN TIM1_ARRH.w		; TIM1 Auto-Reload Register High

	EXTERN TIM1_ARRL.w		; TIM1 Auto-Reload Register Low

	EXTERN TIM1_RCR.w		; TIM1 Repetition counter register

	EXTERN TIM1_CCR1H.w		; TIM1 Capture/Compare Register 1 High

	EXTERN TIM1_CCR1L.w		; TIM1 Capture/Compare Register 1 Low

	EXTERN TIM1_CCR2H.w		; TIM1 Capture/Compare Register 2 High

	EXTERN TIM1_CCR2L.w		; TIM1 Capture/Compare Register 2 Low

	EXTERN TIM1_CCR3H.w		; TIM1 Capture/Compare Register 3 High

	EXTERN TIM1_CCR3L.w		; TIM1 Capture/Compare Register 3 Low

	EXTERN TIM1_CCR4H.w		; TIM1 Capture/Compare Register 4 High

	EXTERN TIM1_CCR4L.w		; TIM1 Capture/Compare Register 4 Low

	EXTERN TIM1_BKR.w		; TIM1 Break register

	EXTERN TIM1_DTR.w		; TIM1 Dead-time register

	EXTERN TIM1_OISR.w		; TIM1 Output idle state register

	EXTERN TIM1_DCR1.w		; TIM1 DMA1 control register 1

	EXTERN TIM1_DCR2.w		; TIM1 DMA1 control register 2

	EXTERN TIM1_DMA1R.w		; TIM1 DMA1 address for burst mode

; 8-Bit  Timer 4 (TIM4)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM4_CR1.w		; TIM4 Control Register 1

	EXTERN TIM4_CR2.w		; TIM4 Control Register 2

	EXTERN TIM4_SMCR.w		; TIM4 Slave Mode Control Register

	EXTERN TIM4_DER.w		; TIM4 DMA request Enable Register

	EXTERN TIM4_IER.w		; TIM4 Interrupt Enable Register

	EXTERN TIM4_SR1.w		; TIM4 Status Register 1

	EXTERN TIM4_EGR.w		; TIM4 Event Generation Register

	EXTERN TIM4_CNTR.w		; TIM4 Counter

	EXTERN TIM4_PSCR.w		; TIM4 Prescaler Register

	EXTERN TIM4_ARR.w		; TIM4 Auto-Reload Register

; Infra Red Interface (IR)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN IR_CR.w		; Infra-red control register

; 16-Bit  Timer 5 (TIM5)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN TIM5_CR1.w		; TIM5 Control register 1

	EXTERN TIM5_CR2.w		; TIM5 Control register 2

	EXTERN TIM5_SMCR.w		; TIM5 Slave Mode Control register

	EXTERN TIM5_ETR.w		; TIM5 External trigger register

	EXTERN TIM5_DER.w		; TIM5 DMA request enable register

	EXTERN TIM5_IER.w		; TIM5 Interrupt enable register

	EXTERN TIM5_SR1.w		; TIM5 Status register 1

	EXTERN TIM5_SR2.w		; TIM5 Status register 2

	EXTERN TIM5_EGR.w		; TIM5 Event Generation register

	EXTERN TIM5_CCMR1.w		; TIM5 Capture/Compare mode register 1

	EXTERN TIM5_CCMR2.w		; TIM5 Capture/Compare mode register 2

	EXTERN TIM5_CCER1.w		; TIM5 Capture/Compare enable register 1

	EXTERN TIM5_CNTRH.w		; TIM5 Counter High

	EXTERN TIM5_CNTRL.w		; TIM5 Counter Low

	EXTERN TIM5_PSCR.w		; TIM5 Prescaler register

	EXTERN TIM5_ARRH.w		; TIM5 Auto-Reload Register High

	EXTERN TIM5_ARRL.w		; TIM5 Auto-Reload Register Low

	EXTERN TIM5_CCR1H.w		; TIM5 Capture/Compare Register 1 High

	EXTERN TIM5_CCR1L.w		; TIM5 Capture/Compare Register 1 Low

	EXTERN TIM5_CCR2H.w		; TIM5 Capture/Compare Register 2 High

	EXTERN TIM5_CCR2L.w		; TIM5 Capture/Compare Register 2 Low

	EXTERN TIM5_BKR.w		; TIM5 Break register

	EXTERN TIM5_OISR.w		; TIM5 Output idle state register

; Analog to digital converter 1 (ADC1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ADC1_CR1.w		; ADC1 Configuration register 1

	EXTERN ADC1_CR2.w		; ADC1 Configuration register 2

	EXTERN ADC1_CR3.w		; ADC1 Configuration register 3

	EXTERN ADC1_SR.w		; ADC1 status register

	EXTERN ADC1_DRH.w		; ADC Data Register High

	EXTERN ADC1_DRL.w		; ADC Data Register Low

	EXTERN ADC1_HTRH.w		; ADC High Threshold Register High

	EXTERN ADC1_HTRL.w		; ADC High Threshold Register Low

	EXTERN ADC1_LTRH.w		; ADC Low Threshold Register High

	EXTERN ADC1_LTRL.w		; ADC Low Threshold Register Low

	EXTERN ADC1_SQR1.w		; ADC1 channel sequence 1 register

	EXTERN ADC1_SQR2.w		; ADC1 channel sequence 2 register

	EXTERN ADC1_SQR3.w		; ADC1 channel sequence 3 register

	EXTERN ADC1_SQR4.w		; ADC1 channel sequence 4 register

	EXTERN ADC1_TRIGR1.w		; ADC1 Trigger disable 1

	EXTERN ADC1_TRIGR2.w		; ADC1 Trigger disable 2

	EXTERN ADC1_TRIGR3.w		; ADC1 Trigger disable 3

	EXTERN ADC1_TRIGR4.w		; ADC1 Trigger disable 4

; Digital to analog converter (DAC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN DAC_CH1CR1.w		; DAC channel 1 control register 1

	EXTERN DAC_CH1CR2.w		; DAC channel 1 control register 2

	EXTERN DAC_CH2CR1.w		; DAC channel 2 control register 1

	EXTERN DAC_CH2CR2.w		; DAC channel 2 control register 2

	EXTERN DAC_SWTRIGR.w		; DAC software trigger register

	EXTERN DAC_SR.w		; DAC status register

	EXTERN DAC_CH1RDHRH.w		; DAC channel 1 right aligned data holding register high

	EXTERN DAC_CH1RDHRL.w		; DAC channel 1 right aligned data holding register low

	EXTERN DAC_CH1LDHRH.w		; DAC channel 1 left aligned data holding register high

	EXTERN DAC_CH1LDHRL.w		; DAC channel 1 left aligned data holding register low

	EXTERN DAC_CH1DHR8.w		; DAC channel 1 8-bit data holding register

	EXTERN DAC_CH2RDHRH.w		; DAC channel 2 right aligned data holding register high

	EXTERN DAC_CH2RDHRL.w		; DAC channel 2 right aligned data holding register low

	EXTERN DAC_CH2LDHRH.w		; DAC channel 2 left aligned data holding register high

	EXTERN DAC_CH2LDHRL.w		; DAC channel 2 left aligned data holding register low

	EXTERN DAC_CH2DHR8.w		; DAC channel 2 8-bit data holding register

	EXTERN DAC_DCH1RDHRH.w		; DAC channel 1 right aligned data holding register high

	EXTERN DAC_DCH1RDHRL.w		; DAC channel 1 right aligned data holding register low

	EXTERN DAC_DCH2RDHRH.w		; DAC channel 2 right aligned data holding register high

	EXTERN DAC_DCH2RDHRL.w		; DAC channel 2 right aligned data holding register low

	EXTERN DAC_DCH1LDHRH.w		; DAC channel 1 left aligned data holding register high

	EXTERN DAC_DCH1LDHRL.w		; DAC channel 1 left aligned data holding register low

	EXTERN DAC_DCH2LDHRH.w		; DAC channel 2 left aligned data holding register high

	EXTERN DAC_DCH2LDHRL.w		; DAC channel 2 left aligned data holding register low

	EXTERN DAC_DCH1DHR8.w		; DAC channel 1 8-bit data holding register

	EXTERN DAC_DCH2DHR8.w		; DAC channel 2 8-bit data holding register

	EXTERN DAC_CH1DORH.w		; DAC channel 1 data output register high

	EXTERN DAC_CH1DORL.w		; DAC channel 1 data output register low

	EXTERN DAC_CH2DORH.w		; DAC channel 2 data output register high

	EXTERN DAC_CH2DORL.w		; DAC channel 2 data output register low

; Serial Peripheral Interface 2 (SPI2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN SPI2_CR1.w		; SPI2 Control Register 1

	EXTERN SPI2_CR2.w		; SPI2 Control Register 2

	EXTERN SPI2_ICR.w		; SPI2 Interrupt Control Register

	EXTERN SPI2_SR.w		; SPI2 Status Register

	EXTERN SPI2_DR.w		; SPI2 Data Register

	EXTERN SPI2_CRCPR.w		; SPI2 CRC Polynomial Register

	EXTERN SPI2_RXCRCR.w		; SPI2 Rx CRC Register

	EXTERN SPI2_TXCRCR.w		; SPI2 Tx CRC Register

; Universal synch/asynch receiver transmitter 2 (USART2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN USART2_SR.w		; USART2 Status Register

	EXTERN USART2_DR.w		; USART2 Data Register

	EXTERN USART2_BRR1.w		; USART2 Baud Rate Register 1

	EXTERN USART2_BRR2.w		; USART2 Baud Rate Register 2

	EXTERN USART2_CR1.w		; USART2 Control Register 1

	EXTERN USART2_CR2.w		; USART2 Control Register 2

	EXTERN USART2_CR3.w		; USART2 Control Register 3

	EXTERN USART2_CR4.w		; USART2 Control Register 4

	EXTERN USART2_CR5.w		; USART2 Control Register 5

	EXTERN USART2_GTR.w		; USART2 Guard time Register

	EXTERN USART2_PSCR.w		; USART2 Prescaler Register

; Universal synch/asynch receiver transmitter 3 (USART3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN USART3_SR.w		; USART3 Status Register

	EXTERN USART3_DR.w		; USART3 Data Register

	EXTERN USART3_BRR1.w		; USART3 Baud Rate Register 1

	EXTERN USART3_BRR2.w		; USART3 Baud Rate Register 2

	EXTERN USART3_CR1.w		; USART3 Control Register 1

	EXTERN USART3_CR2.w		; USART3 Control Register 2

	EXTERN USART3_CR3.w		; USART3 Control Register 3

	EXTERN USART3_CR4.w		; USART3 Control Register 4

	EXTERN USART3_CR5.w		; USART3 Control Register 5

	EXTERN USART3_GTR.w		; USART3 Guard time Register

	EXTERN USART3_PSCR.w		; USART3 Prescaler Register

; Routing interface (RI)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN RI_ICR1.w		; Timer input capture routing register 1

	EXTERN RI_ICR2.w		; Timer input capture routing register 2

	EXTERN RI_IOIR1.w		; I/O input register 1

	EXTERN RI_IOIR2.w		; I/O input register 2

	EXTERN RI_IOIR3.w		; I/O input register 3

	EXTERN RI_IOCMR1.w		; I/O control mode register 1

	EXTERN RI_IOCMR2.w		; I/O control mode register 2

	EXTERN RI_IOCMR3.w		; I/O control mode register 3

	EXTERN RI_IOSR1.w		; I/O switch register 1

	EXTERN RI_IOSR2.w		; I/O switch register 2

	EXTERN RI_IOSR3.w		; I/O switch register 3

	EXTERN RI_IOGCR.w		; I/O group control register

	EXTERN RI_ASCR1.w		; Analog switch register 1

	EXTERN RI_ASCR2.w		; Analog switch register 2

	EXTERN RI_RCR.w		; Resistor control register

; Comparators (COMP)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN COMP_CSR1.w		; Comparator control and status register 1

	EXTERN COMP_CSR2.w		; Comparator control and status register 2

	EXTERN COMP_CSR3.w		; Comparator control and status register 3

	EXTERN COMP_CSR4.w		; Comparator control and status register 4

	EXTERN COMP_CSR5.w		; Comparator control and status register 5

; Global configuration register (CFG)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN CFG_GCR.w		; CFG Global configuration register

; Interrupt Software Priority Registers (ITC)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	EXTERN ITC_SPR1.w		; Interrupt Software priority register 1

	EXTERN ITC_SPR2.w		; Interrupt Software priority register 2

	EXTERN ITC_SPR3.w		; Interrupt Software priority register 3

	EXTERN ITC_SPR4.w		; Interrupt Software priority register 4

	EXTERN ITC_SPR5.w		; Interrupt Software priority register 5

	EXTERN ITC_SPR6.w		; Interrupt Software priority register 6

	EXTERN ITC_SPR7.w		; Interrupt Software priority register 7

	EXTERN ITC_SPR8.w		; Interrupt Software priority register 8

	#endif ; __STM8L150C__
