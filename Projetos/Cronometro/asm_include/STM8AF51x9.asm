stm8/

; STM8AF51x9.asm

; Copyright (c) 2003-2010 STMicroelectronics

; STM8AF51x9

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

; Port G at 0x501e
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PG_ODR			DS.B 1		; Port G data output latch register
.PG_IDR			DS.B 1		; Port G input pin value register
.PG_DDR			DS.B 1		; Port G data direction register
.PG_CR1			DS.B 1		; Port G control register 1
.PG_CR2			DS.B 1		; Port G control register 2
reserved1		DS.B 5		; unused

; Port I at 0x5028
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PI_ODR			DS.B 1		; Port I data output latch register
.PI_IDR			DS.B 1		; Port I input pin value register
.PI_DDR			DS.B 1		; Port I data direction register
.PI_CR1			DS.B 1		; Port I control register 1
.PI_CR2			DS.B 1		; Port I control register 2
reserved2		DS.B 45		; unused

; Flash at 0x505a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FLASH_CR1			DS.B 1		; Flash control register 1
.FLASH_CR2			DS.B 1		; Flash control register 2
.FLASH_NCR2			DS.B 1		; Flash complementary control register 2
.FLASH_FPR			DS.B 1		; Flash protection register
.FLASH_NFPR			DS.B 1		; Flash complementary protection register
.FLASH_IAPSR			DS.B 1		; Flash in-application programming status register
reserved3		DS.B 2		; unused
.FLASH_PUKR			DS.B 1		; Flash Program memory unprotection register
reserved4		DS.B 1		; unused
.FLASH_DUKR			DS.B 1		; Data EEPROM unprotection register
reserved5		DS.B 59		; unused

; External Interrupt Control Register (ITC) at 0x50a0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.EXTI_CR1			DS.B 1		; External interrupt control register 1
.EXTI_CR2			DS.B 1		; External interrupt control register 2
reserved6		DS.B 17		; unused

; Reset (RST) at 0x50b3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.RST_SR			DS.B 1		; Reset status register 1
reserved7		DS.B 12		; unused

; Clock Control (CLK) at 0x50c0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CLK_ICKR			DS.B 1		; Internal clock control register
.CLK_ECKR			DS.B 1		; External clock control register
reserved8		DS.B 1		; unused
.CLK_CMSR			DS.B 1		; Clock master status register
.CLK_SWR			DS.B 1		; Clock master switch register
.CLK_SWCR			DS.B 1		; Clock switch control register
.CLK_CKDIVR			DS.B 1		; Clock divider register
.CLK_PCKENR1			DS.B 1		; Peripheral clock gating register 1
.CLK_CSSR			DS.B 1		; Clock security system register
.CLK_CCOR			DS.B 1		; Configurable clock control register
.CLK_PCKENR2			DS.B 1		; Peripheral clock gating register 2
.CLK_CANCCR			DS.B 1		; CAN clock control register
.CLK_HSITRIMR			DS.B 1		; HSI clock calibration trimming register
.CLK_SWIMCCR			DS.B 1		; SWIM clock control register
reserved9		DS.B 3		; unused

; Window Watchdog (WWDG) at 0x50d1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WWDG_CR			DS.B 1		; WWDG Control Register
.WWDG_WR			DS.B 1		; WWDR Window Register
reserved10		DS.B 13		; unused

; Independent Watchdog (IWDG) at 0x50e0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.IWDG_KR			DS.B 1		; IWDG Key Register
.IWDG_PR			DS.B 1		; IWDG Prescaler Register
.IWDG_RLR			DS.B 1		; IWDG Reload Register
reserved11		DS.B 13		; unused

; Auto Wake-Up (AWU) at 0x50f0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.AWU_CSR			DS.B 1		; AWU Control/Status Register
.AWU_APR			DS.B 1		; AWU asynchronous prescaler buffer register
.AWU_TBR			DS.B 1		; AWU Timebase selection register

; Beeper (BEEP) at 0x50f3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.BEEP_CSR			DS.B 1		; BEEP Control/Status Register
reserved12		DS.B 268		; unused

; Serial Peripheral Interface (SPI) at 0x5200
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.SPI_CR1			DS.B 1		; SPI Control Register 1
.SPI_CR2			DS.B 1		; SPI Control Register 2
.SPI_ICR			DS.B 1		; SPI Interrupt Control Register
.SPI_SR			DS.B 1		; SPI Status Register
.SPI_DR			DS.B 1		; SPI Data Register
.SPI_CRCPR			DS.B 1		; SPI CRC Polynomial Register
.SPI_RXCRCR			DS.B 1		; SPI Rx CRC Register
.SPI_TXCRCR			DS.B 1		; SPI Tx CRC Register
reserved13		DS.B 8		; unused

; I2C Bus Interface (I2C) at 0x5210
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2C_CR1			DS.B 1		; I2C control register 1
.I2C_CR2			DS.B 1		; I2C control register 2
.I2C_FREQR			DS.B 1		; I2C frequency register
.I2C_OARL			DS.B 1		; I2C Own address register low
.I2C_OARH			DS.B 1		; I2C Own address register high
reserved14		DS.B 1		; unused
.I2C_DR			DS.B 1		; I2C data register
.I2C_SR1			DS.B 1		; I2C status register 1
.I2C_SR2			DS.B 1		; I2C status register 2
.I2C_SR3			DS.B 1		; I2C status register 3
.I2C_ITR			DS.B 1		; I2C interrupt control register
.I2C_CCRL			DS.B 1		; I2C Clock control register low
.I2C_CCRH			DS.B 1		; I2C Clock control register high
.I2C_TRISER			DS.B 1		; I2C TRISE register
.I2C_PECR			DS.B 1		; I2C packet error checking register
reserved15		DS.B 17		; unused

; Universal synch/asynch receiver transmitter (USART) at 0x5230
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.USART_SR			DS.B 1		; USART Status Register
.USART_DR			DS.B 1		; USART Data Register
.USART_BRR1			DS.B 1		; USART Baud Rate Register 1
.USART_BRR2			DS.B 1		; USART Baud Rate Register 2
.USART_CR1			DS.B 1		; USART Control Register 1
.USART_CR2			DS.B 1		; USART Control Register 2
.USART_CR3			DS.B 1		; USART Control Register 3
.USART_CR4			DS.B 1		; USART Control Register 4
.USART_CR5			DS.B 1		; USART Control Register 5
.USART_GTR			DS.B 1		; USART Guard time Register
.USART_PSCR			DS.B 1		; USART Prescaler Register
reserved16		DS.B 5		; unused

; LIN Universal asynch. receiver transmitter (LINUART) at 0x5240
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.LINUART_SR			DS.B 1		; LINUART Status Register
.LINUART_DR			DS.B 1		; LINUART Data Register
.LINUART_BRR1			DS.B 1		; LINUART Baud Rate Register 1
.LINUART_BRR2			DS.B 1		; LINUART Baud Rate Register 2
.LINUART_CR1			DS.B 1		; LINUART Control Register 1
.LINUART_CR2			DS.B 1		; LINUART Control Register 2
.LINUART_CR3			DS.B 1		; LINUART Control Register 3
.LINUART_CR4			DS.B 1		; LINUART Control Register 4
reserved17		DS.B 1		; unused
.LINUART_CR6			DS.B 1		; LINUART Control Register 6
reserved18		DS.B 6		; unused

; 16-Bit Timer 1 (TIM1) at 0x5250
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM1_CR1			DS.B 1		; TIM1 Control register 1
.TIM1_CR2			DS.B 1		; TIM1 Control register 2
.TIM1_SMCR			DS.B 1		; TIM1 Slave Mode Control register
.TIM1_ETR			DS.B 1		; TIM1 external trigger register
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
.TIM1_CNTRH			DS.B 1		; Data bits High
.TIM1_CNTRL			DS.B 1		; Data bits Low
.TIM1_PSCRH			DS.B 1		; Data bits High
.TIM1_PSCRL			DS.B 1		; Data bits Low
.TIM1_ARRH			DS.B 1		; Data bits High
.TIM1_ARRL			DS.B 1		; Data bits Low
.TIM1_RCR			DS.B 1		; TIM1 Repetition counter register
.TIM1_CCR1H			DS.B 1		; Data bits High
.TIM1_CCR1L			DS.B 1		; Data bits Low
.TIM1_CCR2H			DS.B 1		; Data bits High
.TIM1_CCR2L			DS.B 1		; Data bits Low
.TIM1_CCR3H			DS.B 1		; Data bits High
.TIM1_CCR3L			DS.B 1		; Data bits Low
.TIM1_CCR4H			DS.B 1		; Data bits High
.TIM1_CCR4L			DS.B 1		; Data bits Low
.TIM1_BKR			DS.B 1		; TIM1 Break register
.TIM1_DTR			DS.B 1		; TIM1 Dead-time register
.TIM1_OISR			DS.B 1		; TIM1 Output idle state register
reserved19		DS.B 144		; unused

; 16-Bit Timer 2 (TIM2) at 0x5300
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM2_CR1			DS.B 1		; TIM2 Control register 1
.TIM2_IER			DS.B 1		; TIM2 Interrupt enable register
.TIM2_SR1			DS.B 1		; TIM2 Status register 1
.TIM2_SR2			DS.B 1		; TIM2 Status register 2
.TIM2_EGR			DS.B 1		; TIM2 Event Generation register
.TIM2_CCMR1			DS.B 1		; TIM2 Capture/Compare mode register 1
.TIM2_CCMR2			DS.B 1		; TIM2 Capture/Compare mode register 2
.TIM2_CCMR3			DS.B 1		; TIM2 Capture/Compare mode register 3
.TIM2_CCER1			DS.B 1		; TIM2 Capture/Compare enable register 1
.TIM2_CCER2			DS.B 1		; TIM2 Capture/Compare enable register 2
.TIM2_CNTRH			DS.B 1		; Data bits High
.TIM2_CNTRL			DS.B 1		; Data bits Low
.TIM2_PSCR			DS.B 1		; TIM2 Prescaler register
.TIM2_ARRH			DS.B 1		; Data bits High
.TIM2_ARRL			DS.B 1		; Data bits Low
.TIM2_CCR1H			DS.B 1		; Data bits High
.TIM2_CCR1L			DS.B 1		; Data bits Low
.TIM2_CCR2H			DS.B 1		; Data bits High
.TIM2_CCR2L			DS.B 1		; Data bits Low
.TIM2_CCR3H			DS.B 1		; Data bits High
.TIM2_CCR3L			DS.B 1		; Data bits Low
reserved20		DS.B 11		; unused

; 16-Bit Timer 3 (TIM3) at 0x5320
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM3_CR1			DS.B 1		; TIM3 Control register 1
.TIM3_IER			DS.B 1		; TIM3 Interrupt enable register
.TIM3_SR1			DS.B 1		; TIM3 Status register 1
.TIM3_SR2			DS.B 1		; TIM3 Status register 2
.TIM3_EGR			DS.B 1		; TIM3 Event Generation register
.TIM3_CCMR1			DS.B 1		; TIM3 Capture/Compare mode register 1
.TIM3_CCMR2			DS.B 1		; TIM3 Capture/Compare mode register 2
.TIM3_CCER1			DS.B 1		; TIM3 Capture/Compare enable register 1
.TIM3_CNTRH			DS.B 1		; Data bits High
.TIM3_CNTRL			DS.B 1		; Data bits Low
.TIM3_PSCR			DS.B 1		; TIM3 Prescaler register
.TIM3_ARRH			DS.B 1		; Data bits High
.TIM3_ARRL			DS.B 1		; Data bits Low
.TIM3_CCR1H			DS.B 1		; Data bits High
.TIM3_CCR1L			DS.B 1		; Data bits Low
.TIM3_CCR2H			DS.B 1		; Data bits High
.TIM3_CCR2L			DS.B 1		; Data bits Low
reserved21		DS.B 15		; unused

; 8-Bit  Timer 4 (TIM4) at 0x5340
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIM4_CR1			DS.B 1		; TIM4 Control register 1
.TIM4_IER			DS.B 1		; TIM4 Interrupt enable register
.TIM4_SR			DS.B 1		; TIM4 Status register
.TIM4_EGR			DS.B 1		; TIM4 Event Generation register
.TIM4_CNTR			DS.B 1		; TIM4 Counter
.TIM4_PSCR			DS.B 1		; TIM4 Prescaler register
.TIM4_ARR			DS.B 1		; TIM4 Auto-reload register
reserved22		DS.B 185		; unused

; 10-Bit A/D Converter (ADC) at 0x5400
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADC_CSR			DS.B 1		; ADC Control/Status Register
.ADC_CR1			DS.B 1		; ADC Configuration Register 1
.ADC_CR2			DS.B 1		; ADC Configuration Register 2
reserved23		DS.B 1		; unused
.ADC_DRH			DS.B 1		; Data bits High
.ADC_DRL			DS.B 1		; Data bits Low
.ADC_TDRH			DS.B 1		; Schmitt trigger disable High
.ADC_TDRL			DS.B 1		; Schmitt trigger disable Low
reserved24		DS.B 24		; unused

;  Controller Area Network (CAN) at 0x5420
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CAN_MCR			DS.B 1		; Master Control Register
.CAN_MSR			DS.B 1		; Master Status Register
.CAN_TSR			DS.B 1		; Transmit Status Register
.CAN_TPR			DS.B 1		; Transmit Priority Register
.CAN_RFR			DS.B 1		; Receive FIFO Register
.CAN_IER			DS.B 1		; Interrupt Enable Register
.CAN_DGR			DS.B 1		; Diagnosis Register
.CAN_FPSR			DS.B 1		; Filter Page Select Register
.CAN_P0			DS.B 1		; MCSR, MCSR, F0R1,  F2R1, F4R1, MCSR, ESR, MFMI - CAN Paged Register 0
.CAN_P1			DS.B 1		; MDLCR, MDLCR, F0R2, F2R2, F4R2, MDLCR, EIER, MDLCR - CAN Paged  Register 1
.CAN_P2			DS.B 1		; MIDR1, MIDR1, F0R3, F2R3, F4R3, MIDR1, TECR,  MIDR1 - CAN Paged Register 2
.CAN_P3			DS.B 1		; MIDR2, MIDR2, F0R4, F2R4, F4R4, MIDR2, RECR,  MIDR2 - CAN Paged Register 3
.CAN_P4			DS.B 1		; MIDR3, MIDR3, F0R5, F2R5, F4R5, MIDR3, BTCR1, MIDR3 - CAN Paged Register 4
.CAN_P5			DS.B 1		; MIDR4, MIDR4, F0R6, F2R6, F4R6, MIDR4, BTCR2, MIDR4 - CAN Paged Register 5
.CAN_P6			DS.B 1		; MDAR1, MDAR1, F0R7, F2R7, F4R7, MDAR1, Reserved, MDAR1 - CAN Paged Register 6
.CAN_P7			DS.B 1		; MDAR2, MDAR2, F0R8, F2R8, F4R8, MDAR2, Reserved, MDAR2 - CAN Paged Register 7
.CAN_P8			DS.B 1		; MDAR3, MDAR3, F1R1, F3R1, F5R1, MDAR3, FMR1, MDAR3 - CAN Paged  Register 8
.CAN_P9			DS.B 1		; MDAR4, MDAR4, F1R2, F3R2, F5R2, MDAR4, FMR1, MDAR4 - CAN Paged  Register 9
.CAN_PA			DS.B 1		; MDAR5, MDAR5, F1R3, F3R3, F5R3, MDAR5, FCR2, MDAR5 - CAN Paged  Register A
.CAN_PB			DS.B 1		; MDAR6, MDAR6, F1R4, F3R4, F5R4, MDAR6, FCR3, MDAR6 - CAN Paged  Register B
.CAN_PC			DS.B 1		; MDAR7, MDAR7, F1R5, F3R5, F5R5, MDAR7, FCR4, MDAR7 - CAN Paged  Register C
.CAN_PD			DS.B 1		; MDAR8, MDAR8, F1R6, F3R6, F5R6, MDAR8, Reserved, MDAR8 - CAN Paged Register D
.CAN_PE			DS.B 1		; MTSRL, MTSRL, F1R7, F3R7, F5R7, MTSLR, Reserved, MTSRL - CAN Paged Register E
.CAN_PF			DS.B 1		; MTSRH, MTSRH, F1R8, F3R8, F5R8, MTSRH, Reserved, MTSRH - CAN Paged Register F
reserved25		DS.B 11048		; unused

;  Global configuration register (CFG) at 0x7f60
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.CFG_GCR			DS.B 1		; CFG Global configuration register
reserved26		DS.B 15		; unused

; Interrupt Software Priority Register (ITC) at 0x7f70
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ITC_SPR1			DS.B 1		; Interrupt Software priority register 1
.ITC_SPR2			DS.B 1		; Interrupt Software priority register 2
.ITC_SPR3			DS.B 1		; Interrupt Software priority register 3
.ITC_SPR4			DS.B 1		; Interrupt Software priority register 4
.ITC_SPR5			DS.B 1		; Interrupt Software priority register 5
.ITC_SPR6			DS.B 1		; Interrupt Software priority register 6
.ITC_SPR7			DS.B 1		; Interrupt Software priority register 7

	end
