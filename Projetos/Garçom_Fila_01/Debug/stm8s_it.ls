   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  43                     ; 67 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 68 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 72 }
  52  0000 80            	iret
  74                     ; 80 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 81 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 85 }
  83  0001 80            	iret
 105                     ; 92 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 93 
 105                     ; 94 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 98 }
 114  0002 80            	iret
 136                     ; 105 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 106 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 110 }
 145  0003 80            	iret
 167                     ; 117 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 118 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 122 }
 176  0004 80            	iret
 199                     ; 129 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 199                     ; 130 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 134 }
 208  0005 80            	iret
 231                     ; 141 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 231                     ; 142 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 147 }
 240  0006 80            	iret
 263                     ; 154 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 263                     ; 155 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 159 }
 272  0007 80            	iret
 295                     ; 166 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 295                     ; 167 {
 296                     	switch	.text
 297  0008               f_EXTI_PORTD_IRQHandler:
 301                     ; 171 }
 304  0008 80            	iret
 327                     ; 178 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 327                     ; 179 {
 328                     	switch	.text
 329  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 183 }
 336  0009 80            	iret
 359                     ; 191  INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
 359                     ; 192  {
 360                     	switch	.text
 361  000a               f_EXTI_PORTF_IRQHandler:
 365                     ; 196  }
 368  000a 80            	iret
 390                     ; 230 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 390                     ; 231 {
 391                     	switch	.text
 392  000b               f_SPI_IRQHandler:
 396                     ; 235 }
 399  000b 80            	iret
 422                     ; 242 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 422                     ; 243 {
 423                     	switch	.text
 424  000c               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 428                     ; 247 }
 431  000c 80            	iret
 454                     ; 254 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 454                     ; 255 {
 455                     	switch	.text
 456  000d               f_TIM1_CAP_COM_IRQHandler:
 460                     ; 259 }
 463  000d 80            	iret
 487                     ; 267  INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
 487                     ; 268  {
 488                     	switch	.text
 489  000e               f_TIM5_UPD_OVF_BRK_TRG_IRQHandler:
 491  000e 8a            	push	cc
 492  000f 84            	pop	a
 493  0010 a4bf          	and	a,#191
 494  0012 88            	push	a
 495  0013 86            	pop	cc
 496  0014 3b0002        	push	c_x+2
 497  0017 be00          	ldw	x,c_x
 498  0019 89            	pushw	x
 499  001a 3b0002        	push	c_y+2
 500  001d be00          	ldw	x,c_y
 501  001f 89            	pushw	x
 504                     ; 273 	TIM5_ClearITPendingBit(TIM5_IT_UPDATE);
 506  0020 a601          	ld	a,#1
 507  0022 cd0000        	call	_TIM5_ClearITPendingBit
 509                     ; 274 	}
 512  0025 85            	popw	x
 513  0026 bf00          	ldw	c_y,x
 514  0028 320002        	pop	c_y+2
 515  002b 85            	popw	x
 516  002c bf00          	ldw	c_x,x
 517  002e 320002        	pop	c_x+2
 518  0031 80            	iret
 541                     ; 281  INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
 541                     ; 282  {
 542                     	switch	.text
 543  0032               f_TIM5_CAP_COM_IRQHandler:
 547                     ; 286  }
 550  0032 80            	iret
 573                     ; 348  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 573                     ; 349  {
 574                     	switch	.text
 575  0033               f_UART1_TX_IRQHandler:
 579                     ; 353  }
 582  0033 80            	iret
 605                     ; 360  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 605                     ; 361  {
 606                     	switch	.text
 607  0034               f_UART1_RX_IRQHandler:
 611                     ; 365  }
 614  0034 80            	iret
 636                     ; 399 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 636                     ; 400 {
 637                     	switch	.text
 638  0035               f_I2C_IRQHandler:
 642                     ; 404 }
 645  0035 80            	iret
 667                     ; 478  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 667                     ; 479  {
 668                     	switch	.text
 669  0036               f_ADC1_IRQHandler:
 673                     ; 483  }
 676  0036 80            	iret
 701                     ; 492 INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
 701                     ; 493  {
 702                     	switch	.text
 703  0037               f_TIM6_UPD_OVF_TRG_IRQHandler:
 705  0037 8a            	push	cc
 706  0038 84            	pop	a
 707  0039 a4bf          	and	a,#191
 708  003b 88            	push	a
 709  003c 86            	pop	cc
 710  003d 3b0002        	push	c_x+2
 711  0040 be00          	ldw	x,c_x
 712  0042 89            	pushw	x
 713  0043 3b0002        	push	c_y+2
 714  0046 be00          	ldw	x,c_y
 715  0048 89            	pushw	x
 718                     ; 498 	g_system_ticks++;
 720  0049 ae0000        	ldw	x,#_g_system_ticks
 721  004c a601          	ld	a,#1
 722  004e cd0000        	call	c_lgadc
 724                     ; 503 	TIM6_ClearITPendingBit(TIM6_IT_UPDATE);
 726  0051 a601          	ld	a,#1
 727  0053 cd0000        	call	_TIM6_ClearITPendingBit
 729                     ; 504  }
 732  0056 85            	popw	x
 733  0057 bf00          	ldw	c_y,x
 734  0059 320002        	pop	c_y+2
 735  005c 85            	popw	x
 736  005d bf00          	ldw	c_x,x
 737  005f 320002        	pop	c_x+2
 738  0062 80            	iret
 761                     ; 524 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 761                     ; 525 {
 762                     	switch	.text
 763  0063               f_EEPROM_EEC_IRQHandler:
 767                     ; 529 }
 770  0063 80            	iret
 782                     	xref.b	_g_system_ticks
 783                     	xdef	f_EEPROM_EEC_IRQHandler
 784                     	xdef	f_TIM6_UPD_OVF_TRG_IRQHandler
 785                     	xdef	f_ADC1_IRQHandler
 786                     	xdef	f_I2C_IRQHandler
 787                     	xdef	f_UART1_RX_IRQHandler
 788                     	xdef	f_UART1_TX_IRQHandler
 789                     	xdef	f_TIM5_CAP_COM_IRQHandler
 790                     	xdef	f_TIM5_UPD_OVF_BRK_TRG_IRQHandler
 791                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 792                     	xdef	f_TIM1_CAP_COM_IRQHandler
 793                     	xdef	f_SPI_IRQHandler
 794                     	xdef	f_EXTI_PORTF_IRQHandler
 795                     	xdef	f_EXTI_PORTE_IRQHandler
 796                     	xdef	f_EXTI_PORTD_IRQHandler
 797                     	xdef	f_EXTI_PORTC_IRQHandler
 798                     	xdef	f_EXTI_PORTB_IRQHandler
 799                     	xdef	f_EXTI_PORTA_IRQHandler
 800                     	xdef	f_CLK_IRQHandler
 801                     	xdef	f_AWU_IRQHandler
 802                     	xdef	f_TLI_IRQHandler
 803                     	xdef	f_TRAP_IRQHandler
 804                     	xdef	f_NonHandledInterrupt
 805                     	xref	_TIM6_ClearITPendingBit
 806                     	xref	_TIM5_ClearITPendingBit
 807                     	xref.b	c_x
 808                     	xref.b	c_y
 827                     	xref	c_lgadc
 828                     	end
