/*	BASIC INTERRUPT VECTOR TABLE FOR STM8S903K3
 *	Copyright (c) 2007 STMicroelectronics
 */

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

@far @interrupt void NonHandledInterrupt (void)
{
	/* Para detectar eventos inesperados durante o desenvolvimento,
	   recomenda-se colocar um breakpoint aqui */
	return;
}

extern void _stext();     /* startup routine */

@far @interrupt extern void TIM5_UPD_OVF_BRK_IRQHandler();

/* Tabela completa de interrupções para STM8S903K3 */
struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* 0  - RESET: Início do programa */
	{0x82, NonHandledInterrupt},         /* 1  - TRAP: Instrução inválida */
	{0x82, NonHandledInterrupt},         /* 2  - TLI: External Top Level Interrupt */
	{0x82, NonHandledInterrupt},         /* 3  - AWU: Auto Wake Up */
	{0x82, NonHandledInterrupt},         /* 4  - CLK: Clock Controller */
	{0x82, NonHandledInterrupt},         /* 5  - EXTI0: Port A External Interrupt */
	{0x82, NonHandledInterrupt},         /* 6  - EXTI1: Port B External Interrupt */
	{0x82, NonHandledInterrupt},         /* 7  - EXTI2: Port C External Interrupt */
	{0x82, NonHandledInterrupt},         /* 8  - EXTI3: Port D External Interrupt */
	{0x82, NonHandledInterrupt},         /* 9  - EXTI4: Port E External Interrupt */
	{0x82, NonHandledInterrupt},         /* 10 - SPI: SPI End of Transfer */
	{0x82, NonHandledInterrupt},         /* 11 - TIM1_UPD_OVF_TRG_BRK: Timer1 Update/Overflow/Trigger/Break */
	{0x82, NonHandledInterrupt},         /* 12 - TIM1_CAP_COM: Timer1 Capture/Compare */
	//{0x82, NonHandledInterrupt},         /* 13 - TIM5_UPD_OVF_BRK_TRG: Timer5 Update/Overflow/Trigger/Break */
	{0x82, (interrupt_handler_t)TIM5_UPD_OVF_BRK_IRQHandler},  /* 13 - TIM5_UPD_OVF_BRK_TRG */
	{0x82, NonHandledInterrupt},         /* 14 - TIM5_CAP_COM: Timer5 Capture/Compare */
	{0x82, NonHandledInterrupt},         /* 15 - TIM6_UPD_OVF_TRG: Timer6 Update/Overflow/Trigger */
	{0x82, NonHandledInterrupt},         /* 16 - UART1_TX: UART1 Transmission Complete */
	{0x82, NonHandledInterrupt},         /* 17 - UART1_RX: UART1 Receive Complete */
	{0x82, NonHandledInterrupt},         /* 18 - I2C: I2C Interrupt */
	{0x82, NonHandledInterrupt},         /* 19 - ADC1: End of Conversion */
	{0x82, NonHandledInterrupt},         /* 20 - TIM2_UPD_OVF_BRK: Timer2 Update/Overflow/Break (não disponível no 903K3) */
	{0x82, NonHandledInterrupt},         /* 21 - TIM2_CAP_COM: Timer2 Capture/Compare (não disponível no 903K3) */
	{0x82, NonHandledInterrupt},         /* 22 - TIM3_UPD_OVF_BRK: Timer3 Update/Overflow/Break (não disponível no 903K3) */
	{0x82, NonHandledInterrupt},         /* 23 - TIM3_CAP_COM: Timer3 Capture/Compare (não disponível no 903K3) */
	{0x82, NonHandledInterrupt},         /* 24 - UART3_TX: UART3 Transmission Complete (não disponível no 903K3) */
	{0x82, NonHandledInterrupt},         /* 25 - UART3_RX: UART3 Receive Complete (não disponível no 903K3) */
	{0x82, NonHandledInterrupt},         /* 26 - ADC2: End of Conversion (não disponível no 903K3) */
	{0x82, NonHandledInterrupt},         /* 27 - TIM4_UPD_OVF: Timer4 Update/Overflow (não disponível no 903K3) */
	{0x82, NonHandledInterrupt},         /* 28 - EEPROM_EEC: EEPROM End of Operation */
	{0x82, NonHandledInterrupt},         /* 29 - Unused/Reservado */
};
