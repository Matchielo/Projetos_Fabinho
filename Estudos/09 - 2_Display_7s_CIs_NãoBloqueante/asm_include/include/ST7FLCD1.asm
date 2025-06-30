st7/

; ST7FLCD1.asm

; Copyright (c) 2003-2015 STMicroelectronics

; ST7FLCD1

	BYTES		; following addresses are 8-bit length

	segment byte at 0-7F 'periph'


; Circuit Name Register (NAMER) at 0x00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.NAMER			DS.B 1		; Circuit Name Register

; Miscellaneous (MISCR) at 0x01
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MISCR			DS.B 1		; Miscellaneous Register

; Port A at 0x02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PADR			DS.B 1		; Data Register
.PADDR			DS.B 1		; Data Direction Register

; Port B at 0x04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PBDR			DS.B 1		; Data Register
.PBDDR			DS.B 1		; Data Direction Register

; Port C at 0x06
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PCDR			DS.B 1		; Data Register
.PCDDR			DS.B 1		; Data Direction Register

; Port D at 0x08
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PDDR			DS.B 1		; Data Register
.PDDDR			DS.B 1		; Data Direction Register

; 8-bit Analog-to-Digital Converter (ADC) at 0x0a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ADCDR			DS.B 1		; Data Register
.ADCCSR			DS.B 1		; Control/Status Register

; External Interrupt Register (ITRFRE) at 0x0c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.ITRFRE			DS.B 1		; External Interrupt Register

; 8-Bit Timer (TIMA) at 0x0d
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIMCSRA			DS.B 1		; Timer A Control Status Register
.TIMCPRA			DS.B 1		; Timer A Counter Preload Register

; PWM Generator (PWM) at 0x0f
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PWMDCR0			DS.B 1		; Duty Cycle Register Chanel 0
.PWMDCR1			DS.B 1		; Duty Cycle Register Chanel 1
.PWMDCR2			DS.B 1		; Duty Cycle Register Chanel 2
.PWMDCR3			DS.B 1		; Duty Cycle Register Chanel 3
.PWMCRA			DS.B 1		; Control Register A
.PWMARRA			DS.B 1		; Auto-Reload Register A
.PWMDCR4			DS.B 1		; Duty Cycle Register Chanel 4
.PWMDCR5			DS.B 1		; Duty Cycle Register Chanel 5
.PWMCRB			DS.B 1		; Control Register B
.PWMARRB			DS.B 1		; Auto-Reload Register B

; Flash Control Status Register (FCSR) at 0x19
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.FCSR			DS.B 1		; Flash Control/Status Register
reserved1		DS.B 1		; unused

; WatchDog Timer (WDG) at 0x1b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.WDGCR			DS.B 1		; Control Register

; I2C Single-Master Bus Interface (I2C) at 0x1c
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.I2CCR			DS.B 1		; Control Register
.I2CSR			DS.B 1		; Status Register
.I2CCCR			DS.B 1		; Clock Control Register
.I2CDR			DS.B 1		; Data Register

; Display Data Channel Interfaces (DDC A) at 0x20
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.DDCCRA			DS.B 1		; DDC Control Register
.DDCSR1A			DS.B 1		; DDC Status Register 1
.DDCSR2A			DS.B 1		; DDC Status Register 2
.DDCOAR1A			DS.B 1		; DDC (7 bits) Slave Address 1 Register
.DDCOAR2A			DS.B 1		; DDC (7 bits) Slave Address 2 Register
.DDCDRA			DS.B 1		; DDC Data Register
reserved2		DS.B 1		; unused
.DDCDCRA			DS.B 1		; DDC2B Control Register

; Display Data Channel Interfaces (DDC B) at 0x28
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.DDCCRB			DS.B 1		; DDC Control Register
.DDCSR1B			DS.B 1		; DDC Status Register 1
.DDCSR2B			DS.B 1		; DDC Status Register 2
.DDCOAR1B			DS.B 1		; DDC (7 bits) Slave Address 1 Register
.DDCOAR2B			DS.B 1		; DDC (7 bits) Slave Address 2 Register
.DDCDRB			DS.B 1		; DDC Data Register
reserved3		DS.B 1		; unused
.DDCDCRB			DS.B 1		; DDC2B Control Register
reserved4		DS.B 6		; unused

; Infrared Preprocessor (IFR) at 0x36
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.DR			DS.B 1		; Data Register
.CR			DS.B 1		; Control Register

; 8-bit Timer with External Trigger (TIMB) at 0x38
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.TIMCSRB			DS.B 1		; Timer B Control Status Register
.TIMCPRB			DS.B 1		; Timer B Counter Preload Register

	end
