stm8/

; STM8L152C.asm

; Copyright (c) 2003-2017 STMicroelectronics

; STM8L152C

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


	WORDS		; following addresses are 16-bit length

	segment byte at 5000 'periph2'


; Port A at 0x5000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PA_ODR			DS.B 1		; Port A data output latch register
.PA_IDR			DS.B 1		; Port A input pin value register
.PA_DDR			DS.B 1		; Port A data direction register
.PA_CR1			DS.B 1		; Port A control register 1
.PA_CR2			DS.B 1		; Port A control register 2

; Port B at 0x5005
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PB_ODR			DS.B 1		; Port B data output latch register
.PB_IDR			DS.B 1		; Port B input pin value register
.PB_DDR			DS.B 1		; Port B data direction register
.PB_CR1			DS.B 1		; Port B control register 1
.PB_CR2			DS.B 1		; Port B control register 2

; Port C at 0x500a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PC_ODR			DS.B 1		; Port C data output latch register
.PC_IDR			DS.B 1		; Port C input pin value register
.PC_DDR			DS.B 1		; Port C data direction register
.PC_CR1			DS.B 1		; Port C control register 1
.PC_CR2			DS.B 1		; Port C control register 2

; Port D at 0x500f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PD_ODR			DS.B 1		; Port D data output latch register
.PD_IDR			DS.B 1		; Port D input pin value register
.PD_DDR			DS.B 1		; Port D data direction register
.PD_CR1			DS.B 1		; Port D control register 1
.PD_CR2			DS.B 1		; Port D control register 2

; Port E at 0x5014
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PE_ODR			DS.B 1		; Port E data output latch register
.PE_IDR			DS.B 1		; Port E input pin value register
.PE_DDR			DS.B 1		; Port E data direction register
.PE_CR1			DS.B 1		; Port E control register 1
.PE_CR2			DS.B 1		; Port E control register 2

; Port F at 0x5019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PF_ODR			DS.B 1		; Port F data output latch register
.PF_IDR			DS.B 1		; Port F input pin value register
.PF_DDR			DS.B 1		; Port F data direction register
.PF_CR1			DS.B 1		; Port F control register 1
.PF_CR2			DS.B 1		; Port F control register 2
reserved1		DS.B 50		; unused

; Flash at 0x5050
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FLASH_CR1			DS.B 1		; Flash control register 1
.FLASH_CR2			DS.B 1		; Flash control register 2
.FLASH_PUKR			DS.B 1		; Flash Program memory unprotection register
.FLASH_DUKR			DS.B 1		; Data EEPROM unprotection register
.FLASH_IAPSR			DS.B 1		; Flash in-application programming status register
reserved2		DS.B 27		; unused

; Direct memory access controller 1 (DMA1) at 0x5070
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.DMA1_GCSR			DS.B 1		; DMA1 global configuration & status register
.DMA1_GIR1			DS.B 1		; DMA1 global interrupt register 1
reserved3		DS.B 3		; unused
.DMA1_C0CR			DS.B 1		; DMA1 channel 0 configuration register
.DMA1_C0SPR			DS.B 1		; DMA1 channel 0 status & priority register
.DMA1_C0NDTR			DS.B 1		; DMA1 number of data to transfer register (channel 0)
.DMA1_C0PARH			DS.B 1		; DMA peripheral address high register (channel 0)
.DMA1_C0PARL			DS.B 1		; DMA peripheral address low register (channel 0)
reserved4		DS.B 1		; unused
.DMA1_C0M0ARH			DS.B 1		; DMA memory address high register (channel 0)
.DMA1_C0M0ARL			DS.B 1		; DMA memory address low register (channel 0)
reserved5		DS.B 2		; unused
.DMA1_C1CR			DS.B 1		; DMA1 channel 1 configuration register
.DMA1_C1SPR			DS.B 1		; DMA1 channel 1 status & priority register
.DMA1_C1NDTR			DS.B 1		; DMA1 number of data to transfer register (channel 1)
.DMA1_C1PARH			DS.B 1		; DMA peripheral address high register (channel 1)
.DMA1_C1PARL			DS.B 1		; DMA peripheral address low register (channel 1)
reserved6		DS.B 1		; unused
.DMA1_C1M0ARH			DS.B 1		; DMA memory address high register (channel 1)
.DMA1_C1M0ARL			DS.B 1		; DMA memory address low register (channel 1)
reserved7		DS.B 2		; unused
.DMA1_C2CR			DS.B 1		; DMA1 channel 2 configuration register
.DMA1_C2SPR			DS.B 1		; DMA1 channel 2 status & priority register
.DMA1_C2NDTR			DS.B 1		; DMA1 number of data to transfer register (channel 2)
.DMA1_C2PARH			DS.B 1		; DMA peripheral address high register (channel 2)
.DMA1_C2PARL			DS.B 1		; DMA peripheral address low register (channel 2)
reserved8		DS.B 1		; unused
.DMA1_C2M0ARH			DS.B 1		; DMA memory address high register (channel 2)
.DMA1_C2M0ARL			DS.B 1		; DMA memory address low register (channel 2)
reserved9		DS.B 2		; unused
.DMA1_C3CR			DS.B 1		; DMA1 channel 3 configuration register
.DMA1_C3SPR			DS.B 1		; DMA1 channel 3 status & priority register
.DMA1_C3NDTR			DS.B 1		; DMA1 number of data to transfer register (channel 3)
.DMA1_C3PARH_C3M1ARH			DS.B 1		; DMA1 peripheral address high register (channel 3)
.DMA1_C3PARL_C3M1ARL			DS.B 1		; DMA1 peripheral address low register (channel 3)
.DMA_C3M0EAR			DS.B 1		; DMA channel 3 memory 0 extended address register
.DMA1_C3M0ARH			DS.B 1		; DMA memory address high register (channel 3)
.DMA1_C3M0ARL			DS.B 1		; DMA memory address low register (channel 3)
reserved10		DS.B 2		; unused

; System configuration (SYSCFG) at 0x509d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SYSCFG_RMPCR3			DS.B 1		; Remapping register 3
.SYSCFG_RMPCR1			DS.B 1		; Remapping register 1
.SYSCFG_RMPCR2			DS.B 1		; Remapping register 2

; External Interrupt Control Register (ITC) at 0x50a0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EXTI_CR1			DS.B 1		; External interrupt control register 1
.EXTI_CR2			DS.B 1		; External interrupt control register 2
.EXTI_CR3			DS.B 1		; External interrupt control register 3
.EXTI_SR1			DS.B 1		; External interrupt status register 1
.EXTI_SR2			DS.B 1		; External interrupt status register 2
.EXTI_CONF1			DS.B 1		; External interrupt port select register 1

; Wait For Event (WFE) at 0x50a6
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WFE_CR1			DS.B 1		; WFE control register 1
.WFE_CR2			DS.B 1		; WFE control register 2
.WFE_CR3			DS.B 1		; WFE control register 3
.WFE_CR4			DS.B 1		; WFE control register 4

; External Interrupt Control Register (ITC) at 0x50aa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EXTI_CR4			DS.B 1		; External interrupt control register 4
.EXTI_CONF2			DS.B 1		; External interrupt port select register 2
reserved11		DS.B 4		; unused

; Reset (RST) at 0x50b0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RST_CR			DS.B 1		; Reset control register
.RST_SR			DS.B 1		; Reset status register

; Power control (PWR) at 0x50b2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWR_CSR1			DS.B 1		; Power control and status register 1
.PWR_CSR2			DS.B 1		; Power control and status register 2
reserved12		DS.B 12		; unused

; Clock Control (CLK) at 0x50c0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CLK_CKDIVR			DS.B 1		; System clock divider register
.CLK_CRTCR			DS.B 1		; Clock RTC register
.CLK_ICKCR			DS.B 1		; Internal clock control register
.CLK_PCKENR1			DS.B 1		; Peripheral clock gating register 1
.CLK_PCKENR2			DS.B 1		; Peripheral clock gating register 2
.CLK_CCOR			DS.B 1		; Configurable clock control register
.CLK_ECKCR			DS.B 1		; External clock control register
.CLK_SCSR			DS.B 1		; System clock status register
.CLK_SWR			DS.B 1		; System clock switch register
.CLK_SWCR			DS.B 1		; Clock switch control register
.CLK_CSSR			DS.B 1		; Clock security system register
.CLK_CBEEPR			DS.B 1		; Clock BEEP register
.CLK_HSICALR			DS.B 1		; HSI calibration register
.CLK_HSITRIMR			DS.B 1		; HSI clock calibration trimming register
.CLK_HSIUNLCKR			DS.B 1		; HSI unlock register
.CLK_REGCSR			DS.B 1		; Main regulator control status register
.CLK_PCKENR3			DS.B 1		; Peripheral clock gating register 3
reserved13		DS.B 2		; unused

; Window Watchdog (WWDG) at 0x50d3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WWDG_CR			DS.B 1		; WWDG Control Register
.WWDG_WR			DS.B 1		; WWDR Window Register
reserved14		DS.B 11		; unused

; Independent Watchdog (IWDG) at 0x50e0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.IWDG_KR			DS.B 1		; IWDG Key Register
.IWDG_PR			DS.B 1		; IWDG Prescaler Register
.IWDG_RLR			DS.B 1		; IWDG Reload Register
reserved15		DS.B 13		; unused

; Beeper (BEEP) at 0x50f0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.BEEP_CSR1			DS.B 1		; BEEP Control/Status Register 1
reserved16		DS.B 2		; unused
.BEEP_CSR2			DS.B 1		; BEEP Control/Status Register 2
reserved17		DS.B 76		; unused

; Real-time clock (RTC) at 0x5140
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RTC_TR1			DS.B 1		; Time Register 1
.RTC_TR2			DS.B 1		; Time Register 2
.RTC_TR3			DS.B 1		; Time Register 3
reserved18		DS.B 1		; unused
.RTC_DR1			DS.B 1		; Date Register 1
.RTC_DR2			DS.B 1		; Date Register 2
.RTC_DR3			DS.B 1		; Date Register 3
reserved19		DS.B 1		; unused
.RTC_CR1			DS.B 1		; Control Register 1
.RTC_CR2			DS.B 1		; Control Register 2
.RTC_CR3			DS.B 1		; Control Register 3
reserved20		DS.B 1		; unused
.RTC_ISR1			DS.B 1		; Initialization and Status Register 1
.RTC_ISR2			DS.B 1		; Initialization and Status Register 2
reserved21		DS.B 2		; unused
.RTC_SPRERH			DS.B 1		; Synchronous Prescaler Register High
.RTC_SPRERL			DS.B 1		; Synchronous Prescaler Register Low
.RTC_APRER			DS.B 1		; Asynchronous Prescaler Register
reserved22		DS.B 1		; unused
.RTC_WUTRH			DS.B 1		; Wakeup Timer Register High
.RTC_WUTRL			DS.B 1		; Wakeup Timer Register Low
reserved23		DS.B 1		; unused
.RTC_SSRH			DS.B 1		; Subsecond Register High
.RTC_SSRL			DS.B 1		; Subsecond Register Low
.RTC_WPR			DS.B 1		; Write Protection Register
.RTC_SHIFTRH			DS.B 1		; Shift Register High
.RTC_SHIFTRL			DS.B 1		; Shift Register Low
.RTC_ALRMAR1			DS.B 1		; Alarm A Register 1
.RTC_ALRMAR2			DS.B 1		; Alarm A Register 2
.RTC_ALRMAR3			DS.B 1		; Alarm A Register 3
.RTC_ALRMAR4			DS.B 1		; Alarm A Register 4
reserved24		DS.B 4		; unused
.RTC_ALRMASSRH			DS.B 1		; Shift Register High
.RTC_ALRMASSRL			DS.B 1		; Shift Register Low
.RTC_ALRMASSMSKR			DS.B 1		; Alarm A masking Register
reserved25		DS.B 3		; unused
.RTC_CALRH			DS.B 1		; Shift Register High
.RTC_CALRL			DS.B 1		; Shift Register Low
.RTC_TCR1			DS.B 1		; Tamper Control Register 1
.RTC_TCR2			DS.B 1		; Tamper Control Register 2
reserved26		DS.B 34		; unused

; Clock Security System (LSE_CSS) at 0x5190
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CSS_LSE_CSR			DS.B 1		; CSS on LSE Control and Status Register
reserved27		DS.B 111		; unused

; Serial Peripheral Interface 1 (SPI1) at 0x5200
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPI1_CR1			DS.B 1		; SPI1 Control Register 1
.SPI1_CR2			DS.B 1		; SPI1 Control Register 2
.SPI1_ICR			DS.B 1		; SPI1 Interrupt Control Register
.SPI1_SR			DS.B 1		; SPI1 Status Register
.SPI1_DR			DS.B 1		; SPI1 Data Register
.SPI1_CRCPR			DS.B 1		; SPI1 CRC Polynomial Register
.SPI1_RXCRCR			DS.B 1		; SPI1 Rx CRC Register
.SPI1_TXCRCR			DS.B 1		; SPI1 Tx CRC Register
reserved28		DS.B 8		; unused

; I2C Bus Interface 1 (I2C1) at 0x5210
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2C1_CR1			DS.B 1		; I2C1 control register 1
.I2C1_CR2			DS.B 1		; I2C1 control register 2
.I2C1_FREQR			DS.B 1		; I2C1 frequency register
.I2C1_OARL			DS.B 1		; I2C1 Own address register low
.I2C1_OARH			DS.B 1		; I2C1 Own address register high
.I2C1_OAR2			DS.B 1		; I2C1 Own address register for dual mode
.I2C1_DR			DS.B 1		; I2C1 data register
.I2C1_SR1			DS.B 1		; I2C1 status register 1
.I2C1_SR2			DS.B 1		; I2C1 status register 2
.I2C1_SR3			DS.B 1		; I2C1 status register 3
.I2C1_ITR			DS.B 1		; I2C1 interrupt control register
.I2C1_CCRL			DS.B 1		; I2C1 Clock control register low
.I2C1_CCRH			DS.B 1		; I2C1 Clock control register high
.I2C1_TRISER			DS.B 1		; I2C1 TRISE register
.I2C1_PECR			DS.B 1		; I2C1 packet error checking register
reserved29		DS.B 17		; unused

; Universal synch/asynch receiver transmitter 1 (USART1) at 0x5230
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.USART1_SR			DS.B 1		; USART1 Status Register
.USART1_DR			DS.B 1		; USART1 Data Register
.USART1_BRR1			DS.B 1		; USART1 Baud Rate Register 1
.USART1_BRR2			DS.B 1		; USART1 Baud Rate Register 2
.USART1_CR1			DS.B 1		; USART1 Control Register 1
.USART1_CR2			DS.B 1		; USART1 Control Register 2
.USART1_CR3			DS.B 1		; USART1 Control Register 3
.USART1_CR4			DS.B 1		; USART1 Control Register 4
.USART1_CR5			DS.B 1		; USART1 Control Register 5
.USART1_GTR			DS.B 1		; USART1 Guard time Register
.USART1_PSCR			DS.B 1		; USART1 Prescaler Register
reserved30		DS.B 21		; unused

; 16-Bit Timer 2 (TIM2) at 0x5250
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM2_CR1			DS.B 1		; TIM2 Control register 1
.TIM2_CR2			DS.B 1		; TIM2 Control register 2
.TIM2_SMCR			DS.B 1		; TIM2 Slave Mode Control register
.TIM2_ETR			DS.B 1		; TIM2 External trigger register
.TIM2_DER			DS.B 1		; TIM2 DMA request enable register
.TIM2_IER			DS.B 1		; TIM2 Interrupt enable register
.TIM2_SR1			DS.B 1		; TIM2 Status register 1
.TIM2_SR2			DS.B 1		; TIM2 Status register 2
.TIM2_EGR			DS.B 1		; TIM2 Event Generation register
.TIM2_CCMR1			DS.B 1		; TIM2 Capture/Compare mode register 1
.TIM2_CCMR2			DS.B 1		; TIM2 Capture/Compare mode register 2
.TIM2_CCER1			DS.B 1		; TIM2 Capture/Compare enable register 1
.TIM2_CNTRH			DS.B 1		; TIM2 Counter High
.TIM2_CNTRL			DS.B 1		; TIM2 Counter Low
.TIM2_PSCR			DS.B 1		; TIM2 Prescaler register
.TIM2_ARRH			DS.B 1		; TIM2 Auto-Reload Register High
.TIM2_ARRL			DS.B 1		; TIM2 Auto-Reload Register Low
.TIM2_CCR1H			DS.B 1		; TIM2 Capture/Compare Register 1 High
.TIM2_CCR1L			DS.B 1		; TIM2 Capture/Compare Register 1 Low
.TIM2_CCR2H			DS.B 1		; TIM2 Capture/Compare Register 2 High
.TIM2_CCR2L			DS.B 1		; TIM2 Capture/Compare Register 2 Low
.TIM2_BKR			DS.B 1		; TIM2 Break register
.TIM2_OISR			DS.B 1		; TIM2 Output idle state register
reserved31		DS.B 25		; unused

; 16-Bit Timer 3 (TIM3) at 0x5280
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM3_CR1			DS.B 1		; TIM3 Control register 1
.TIM3_CR2			DS.B 1		; TIM3 Control register 2
.TIM3_SMCR			DS.B 1		; TIM3 Slave Mode Control register
.TIM3_ETR			DS.B 1		; TIM3 External trigger register
.TIM3_DER			DS.B 1		; TIM3 DMA request enable register
.TIM3_IER			DS.B 1		; TIM3 Interrupt enable register
.TIM3_SR1			DS.B 1		; TIM3 Status register 1
.TIM3_SR2			DS.B 1		; TIM3 Status register 2
.TIM3_EGR			DS.B 1		; TIM3 Event Generation register
.TIM3_CCMR1			DS.B 1		; TIM3 Capture/Compare mode register 1
.TIM3_CCMR2			DS.B 1		; TIM3 Capture/Compare mode register 2
.TIM3_CCER1			DS.B 1		; TIM3 Capture/Compare enable register 1
.TIM3_CNTRH			DS.B 1		; TIM3 Counter High
.TIM3_CNTRL			DS.B 1		; TIM3 Counter Low
.TIM3_PSCR			DS.B 1		; TIM3 Prescaler register
.TIM3_ARRH			DS.B 1		; TIM3 Auto-Reload Register High
.TIM3_ARRL			DS.B 1		; TIM3 Auto-Reload Register Low
.TIM3_CCR1H			DS.B 1		; TIM3 Capture/Compare Register 1 High
.TIM3_CCR1L			DS.B 1		; TIM3 Capture/Compare Register 1 Low
.TIM3_CCR2H			DS.B 1		; TIM3 Capture/Compare Register 2 High
.TIM3_CCR2L			DS.B 1		; TIM3 Capture/Compare Register 2 Low
.TIM3_BKR			DS.B 1		; TIM3 Break register
.TIM3_OISR			DS.B 1		; TIM3 Output idle state register
reserved32		DS.B 25		; unused

; 16-Bit Timer 1 (TIM1) at 0x52b0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM1_CR1			DS.B 1		; TIM1 Control register 1
.TIM1_CR2			DS.B 1		; TIM1 Control register 2
.TIM1_SMCR			DS.B 1		; TIM1 Slave Mode Control register
.TIM1_ETR			DS.B 1		; TIM1 external trigger register
.TIM1_DER			DS.B 1		; TIM1 DMA request enable register
.TIM1_IER			DS.B 1		; TIM1 Interrupt enable register
.TIM1_SR1			DS.B 1		; TIM1 Status register 1
.TIM1_SR2			DS.B 1		; TIM1 Status register 2
.TIM1_EGR			DS.B 1		; TIM1 Event Generation register
.TIM1_CCMR1			DS.B 1		; TIM1 Capture/Compare mode register 1
.TIM1_CCMR2			DS.B 1		; TIM1 Capture/Compare mode register 2
.TIM1_CCMR3			DS.B 1		; TIM1 Capture/Compare mode register 3
.TIM1_CCMR4			DS.B 1		; TIM1 Capture/Compare mode register 4
.TIM1_CCER1			DS.B 1		; TIM1 Capture/Compare enable register 1
.TIM1_CCER2			DS.B 1		; TIM1 Capture/Compare enable register 2
.TIM1_CNTRH			DS.B 1		; TIM1 Counter High
.TIM1_CNTRL			DS.B 1		; TIM1 Counter Low
.TIM1_PSCRH			DS.B 1		; TIM1 Prescaler Register High
.TIM1_PSCRL			DS.B 1		; TIM1 Prescaler Register Low
.TIM1_ARRH			DS.B 1		; TIM1 Auto-Reload Register High
.TIM1_ARRL			DS.B 1		; TIM1 Auto-Reload Register Low
.TIM1_RCR			DS.B 1		; TIM1 Repetition counter register
.TIM1_CCR1H			DS.B 1		; TIM1 Capture/Compare Register 1 High
.TIM1_CCR1L			DS.B 1		; TIM1 Capture/Compare Register 1 Low
.TIM1_CCR2H			DS.B 1		; TIM1 Capture/Compare Register 2 High
.TIM1_CCR2L			DS.B 1		; TIM1 Capture/Compare Register 2 Low
.TIM1_CCR3H			DS.B 1		; TIM1 Capture/Compare Register 3 High
.TIM1_CCR3L			DS.B 1		; TIM1 Capture/Compare Register 3 Low
.TIM1_CCR4H			DS.B 1		; TIM1 Capture/Compare Register 4 High
.TIM1_CCR4L			DS.B 1		; TIM1 Capture/Compare Register 4 Low
.TIM1_BKR			DS.B 1		; TIM1 Break register
.TIM1_DTR			DS.B 1		; TIM1 Dead-time register
.TIM1_OISR			DS.B 1		; TIM1 Output idle state register
.TIM1_DCR1			DS.B 1		; TIM1 DMA1 control register 1
.TIM1_DCR2			DS.B 1		; TIM1 DMA1 control register 2
.TIM1_DMA1R			DS.B 1		; TIM1 DMA1 address for burst mode
reserved33		DS.B 12		; unused

; 8-Bit  Timer 4 (TIM4) at 0x52e0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM4_CR1			DS.B 1		; TIM4 Control Register 1
.TIM4_CR2			DS.B 1		; TIM4 Control Register 2
.TIM4_SMCR			DS.B 1		; TIM4 Slave Mode Control Register
.TIM4_DER			DS.B 1		; TIM4 DMA request Enable Register
.TIM4_IER			DS.B 1		; TIM4 Interrupt Enable Register
.TIM4_SR1			DS.B 1		; TIM4 Status Register 1
.TIM4_EGR			DS.B 1		; TIM4 Event Generation Register
.TIM4_CNTR			DS.B 1		; TIM4 Counter
.TIM4_PSCR			DS.B 1		; TIM4 Prescaler Register
.TIM4_ARR			DS.B 1		; TIM4 Auto-Reload Register
reserved34		DS.B 21		; unused

; Infra Red Interface (IR) at 0x52ff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.IR_CR			DS.B 1		; Infra-red control register

; 16-Bit  Timer 5 (TIM5) at 0x5300
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM5_CR1			DS.B 1		; TIM5 Control register 1
.TIM5_CR2			DS.B 1		; TIM5 Control register 2
.TIM5_SMCR			DS.B 1		; TIM5 Slave Mode Control register
.TIM5_ETR			DS.B 1		; TIM5 External trigger register
.TIM5_DER			DS.B 1		; TIM5 DMA request enable register
.TIM5_IER			DS.B 1		; TIM5 Interrupt enable register
.TIM5_SR1			DS.B 1		; TIM5 Status register 1
.TIM5_SR2			DS.B 1		; TIM5 Status register 2
.TIM5_EGR			DS.B 1		; TIM5 Event Generation register
.TIM5_CCMR1			DS.B 1		; TIM5 Capture/Compare mode register 1
.TIM5_CCMR2			DS.B 1		; TIM5 Capture/Compare mode register 2
.TIM5_CCER1			DS.B 1		; TIM5 Capture/Compare enable register 1
.TIM5_CNTRH			DS.B 1		; TIM5 Counter High
.TIM5_CNTRL			DS.B 1		; TIM5 Counter Low
.TIM5_PSCR			DS.B 1		; TIM5 Prescaler register
.TIM5_ARRH			DS.B 1		; TIM5 Auto-Reload Register High
.TIM5_ARRL			DS.B 1		; TIM5 Auto-Reload Register Low
.TIM5_CCR1H			DS.B 1		; TIM5 Capture/Compare Register 1 High
.TIM5_CCR1L			DS.B 1		; TIM5 Capture/Compare Register 1 Low
.TIM5_CCR2H			DS.B 1		; TIM5 Capture/Compare Register 2 High
.TIM5_CCR2L			DS.B 1		; TIM5 Capture/Compare Register 2 Low
.TIM5_BKR			DS.B 1		; TIM5 Break register
.TIM5_OISR			DS.B 1		; TIM5 Output idle state register
reserved35		DS.B 41		; unused

; Analog to digital converter 1 (ADC1) at 0x5340
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADC1_CR1			DS.B 1		; ADC1 Configuration register 1
.ADC1_CR2			DS.B 1		; ADC1 Configuration register 2
.ADC1_CR3			DS.B 1		; ADC1 Configuration register 3
.ADC1_SR			DS.B 1		; ADC1 status register
.ADC1_DRH			DS.B 1		; ADC Data Register High
.ADC1_DRL			DS.B 1		; ADC Data Register Low
.ADC1_HTRH			DS.B 1		; ADC High Threshold Register High
.ADC1_HTRL			DS.B 1		; ADC High Threshold Register Low
.ADC1_LTRH			DS.B 1		; ADC Low Threshold Register High
.ADC1_LTRL			DS.B 1		; ADC Low Threshold Register Low
.ADC1_SQR1			DS.B 1		; ADC1 channel sequence 1 register
.ADC1_SQR2			DS.B 1		; ADC1 channel sequence 2 register
.ADC1_SQR3			DS.B 1		; ADC1 channel sequence 3 register
.ADC1_SQR4			DS.B 1		; ADC1 channel sequence 4 register
.ADC1_TRIGR1			DS.B 1		; ADC1 Trigger disable 1
.ADC1_TRIGR2			DS.B 1		; ADC1 Trigger disable 2
.ADC1_TRIGR3			DS.B 1		; ADC1 Trigger disable 3
.ADC1_TRIGR4			DS.B 1		; ADC1 Trigger disable 4
reserved36		DS.B 46		; unused

; Digital to analog converter (DAC) at 0x5380
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.DAC_CH1CR1			DS.B 1		; DAC channel 1 control register 1
.DAC_CH1CR2			DS.B 1		; DAC channel 1 control register 2
.DAC_CH2CR1			DS.B 1		; DAC channel 2 control register 1
.DAC_CH2CR2			DS.B 1		; DAC channel 2 control register 2
.DAC_SWTRIGR			DS.B 1		; DAC software trigger register
.DAC_SR			DS.B 1		; DAC status register
reserved37		DS.B 2		; unused
.DAC_CH1RDHRH			DS.B 1		; DAC channel 1 right aligned data holding register high
.DAC_CH1RDHRL			DS.B 1		; DAC channel 1 right aligned data holding register low
reserved38		DS.B 2		; unused
.DAC_CH1LDHRH			DS.B 1		; DAC channel 1 left aligned data holding register high
.DAC_CH1LDHRL			DS.B 1		; DAC channel 1 left aligned data holding register low
reserved39		DS.B 2		; unused
.DAC_CH1DHR8			DS.B 1		; DAC channel 1 8-bit data holding register
reserved40		DS.B 3		; unused
.DAC_CH2RDHRH			DS.B 1		; DAC channel 2 right aligned data holding register high
.DAC_CH2RDHRL			DS.B 1		; DAC channel 2 right aligned data holding register low
reserved41		DS.B 2		; unused
.DAC_CH2LDHRH			DS.B 1		; DAC channel 2 left aligned data holding register high
.DAC_CH2LDHRL			DS.B 1		; DAC channel 2 left aligned data holding register low
reserved42		DS.B 2		; unused
.DAC_CH2DHR8			DS.B 1		; DAC channel 2 8-bit data holding register
reserved43		DS.B 3		; unused
.DAC_DCH1RDHRH			DS.B 1		; DAC channel 1 right aligned data holding register high
.DAC_DCH1RDHRL			DS.B 1		; DAC channel 1 right aligned data holding register low
.DAC_DCH2RDHRH			DS.B 1		; DAC channel 2 right aligned data holding register high
.DAC_DCH2RDHRL			DS.B 1		; DAC channel 2 right aligned data holding register low
.DAC_DCH1LDHRH			DS.B 1		; DAC channel 1 left aligned data holding register high
.DAC_DCH1LDHRL			DS.B 1		; DAC channel 1 left aligned data holding register low
.DAC_DCH2LDHRH			DS.B 1		; DAC channel 2 left aligned data holding register high
.DAC_DCH2LDHRL			DS.B 1		; DAC channel 2 left aligned data holding register low
.DAC_DCH1DHR8			DS.B 1		; DAC channel 1 8-bit data holding register
.DAC_DCH2DHR8			DS.B 1		; DAC channel 2 8-bit data holding register
reserved44		DS.B 2		; unused
.DAC_CH1DORH			DS.B 1		; DAC channel 1 data output register high
.DAC_CH1DORL			DS.B 1		; DAC channel 1 data output register low
reserved45		DS.B 2		; unused
.DAC_CH2DORH			DS.B 1		; DAC channel 2 data output register high
.DAC_CH2DORL			DS.B 1		; DAC channel 2 data output register low
reserved46		DS.B 14		; unused

; Serial Peripheral Interface 2 (SPI2) at 0x53c0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPI2_CR1			DS.B 1		; SPI2 Control Register 1
.SPI2_CR2			DS.B 1		; SPI2 Control Register 2
.SPI2_ICR			DS.B 1		; SPI2 Interrupt Control Register
.SPI2_SR			DS.B 1		; SPI2 Status Register
.SPI2_DR			DS.B 1		; SPI2 Data Register
.SPI2_CRCPR			DS.B 1		; SPI2 CRC Polynomial Register
.SPI2_RXCRCR			DS.B 1		; SPI2 Rx CRC Register
.SPI2_TXCRCR			DS.B 1		; SPI2 Tx CRC Register
reserved47		DS.B 24		; unused

; Universal synch/asynch receiver transmitter 2 (USART2) at 0x53e0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.USART2_SR			DS.B 1		; USART2 Status Register
.USART2_DR			DS.B 1		; USART2 Data Register
.USART2_BRR1			DS.B 1		; USART2 Baud Rate Register 1
.USART2_BRR2			DS.B 1		; USART2 Baud Rate Register 2
.USART2_CR1			DS.B 1		; USART2 Control Register 1
.USART2_CR2			DS.B 1		; USART2 Control Register 2
.USART2_CR3			DS.B 1		; USART2 Control Register 3
.USART2_CR4			DS.B 1		; USART2 Control Register 4
.USART2_CR5			DS.B 1		; USART2 Control Register 5
.USART2_GTR			DS.B 1		; USART2 Guard time Register
.USART2_PSCR			DS.B 1		; USART2 Prescaler Register
reserved48		DS.B 5		; unused

; Universal synch/asynch receiver transmitter 3 (USART3) at 0x53f0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.USART3_SR			DS.B 1		; USART3 Status Register
.USART3_DR			DS.B 1		; USART3 Data Register
.USART3_BRR1			DS.B 1		; USART3 Baud Rate Register 1
.USART3_BRR2			DS.B 1		; USART3 Baud Rate Register 2
.USART3_CR1			DS.B 1		; USART3 Control Register 1
.USART3_CR2			DS.B 1		; USART3 Control Register 2
.USART3_CR3			DS.B 1		; USART3 Control Register 3
.USART3_CR4			DS.B 1		; USART3 Control Register 4
.USART3_CR5			DS.B 1		; USART3 Control Register 5
.USART3_GTR			DS.B 1		; USART3 Guard time Register
.USART3_PSCR			DS.B 1		; USART3 Prescaler Register
reserved49		DS.B 5		; unused

; LCD controller (LCD) at 0x5400
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.LCD_CR1			DS.B 1		; LCD control register 1
.LCD_CR2			DS.B 1		; LCD control register 2
.LCD_CR3			DS.B 1		; LCD control register 3
.LCD_FRQ			DS.B 1		; LCD frequency selection register
.LCD_PM0			DS.B 1		; LCD Port mask register 0
.LCD_PM1			DS.B 1		; LCD Port mask register 1
.LCD_PM2			DS.B 1		; LCD Port mask register 2
.LCD_PM3			DS.B 1		; LCD Port mask register 3
.LCD_PM4			DS.B 1		; LCD Port mask register 4
.LCD_PM5			DS.B 1		; LCD Port mask register 5
reserved50		DS.B 2		; unused
.LCD_RAM0			DS.B 1		; LCD display memory 0
.LCD_RAM1			DS.B 1		; LCD display memory 1
.LCD_RAM2			DS.B 1		; LCD display memory 2
.LCD_RAM3			DS.B 1		; LCD display memory 3
.LCD_RAM4			DS.B 1		; LCD display memory 4
.LCD_RAM5			DS.B 1		; LCD display memory 5
.LCD_RAM6			DS.B 1		; LCD display memory 6
.LCD_RAM7			DS.B 1		; LCD display memory 7
.LCD_RAM8			DS.B 1		; LCD display memory 8
.LCD_RAM9			DS.B 1		; LCD display memory 9
.LCD_RAM10			DS.B 1		; LCD display memory 10
.LCD_RAM11			DS.B 1		; LCD display memory 11
.LCD_RAM12			DS.B 1		; LCD display memory 12
.LCD_RAM13			DS.B 1		; LCD display memory 13
.LCD_RAM14			DS.B 1		; LCD display memory 14
.LCD_RAM15			DS.B 1		; LCD display memory 15
.LCD_RAM16			DS.B 1		; LCD display memory 16
.LCD_RAM17			DS.B 1		; LCD display memory 17
.LCD_RAM18			DS.B 1		; LCD display memory 18
.LCD_RAM19			DS.B 1		; LCD display memory 19
.LCD_RAM20			DS.B 1		; LCD display memory 20
.LCD_RAM21			DS.B 1		; LCD display memory 21
reserved51		DS.B 13		; unused
.LCD_CR4			DS.B 1		; LCD control register 4
reserved52		DS.B 1		; unused

; Routing interface (RI) at 0x5431
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RI_ICR1			DS.B 1		; Timer input capture routing register 1
.RI_ICR2			DS.B 1		; Timer input capture routing register 2
.RI_IOIR1			DS.B 1		; I/O input register 1
.RI_IOIR2			DS.B 1		; I/O input register 2
.RI_IOIR3			DS.B 1		; I/O input register 3
.RI_IOCMR1			DS.B 1		; I/O control mode register 1
.RI_IOCMR2			DS.B 1		; I/O control mode register 2
.RI_IOCMR3			DS.B 1		; I/O control mode register 3
.RI_IOSR1			DS.B 1		; I/O switch register 1
.RI_IOSR2			DS.B 1		; I/O switch register 2
.RI_IOSR3			DS.B 1		; I/O switch register 3
.RI_IOGCR			DS.B 1		; I/O group control register
.RI_ASCR1			DS.B 1		; Analog switch register 1
.RI_ASCR2			DS.B 1		; Analog switch register 2
.RI_RCR			DS.B 1		; Resistor control register

; Comparators (COMP) at 0x5440
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.COMP_CSR1			DS.B 1		; Comparator control and status register 1
.COMP_CSR2			DS.B 1		; Comparator control and status register 2
.COMP_CSR3			DS.B 1		; Comparator control and status register 3
.COMP_CSR4			DS.B 1		; Comparator control and status register 4
.COMP_CSR5			DS.B 1		; Comparator control and status register 5
reserved53		DS.B 11035		; unused

; Global configuration register (CFG) at 0x7f60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CFG_GCR			DS.B 1		; CFG Global configuration register
reserved54		DS.B 15		; unused

; Interrupt Software Priority Registers (ITC) at 0x7f70
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ITC_SPR1			DS.B 1		; Interrupt Software priority register 1
.ITC_SPR2			DS.B 1		; Interrupt Software priority register 2
.ITC_SPR3			DS.B 1		; Interrupt Software priority register 3
.ITC_SPR4			DS.B 1		; Interrupt Software priority register 4
.ITC_SPR5			DS.B 1		; Interrupt Software priority register 5
.ITC_SPR6			DS.B 1		; Interrupt Software priority register 6
.ITC_SPR7			DS.B 1		; Interrupt Software priority register 7
.ITC_SPR8			DS.B 1		; Interrupt Software priority register 8

	end
