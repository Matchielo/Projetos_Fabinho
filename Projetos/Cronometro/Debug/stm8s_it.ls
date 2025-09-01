   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  43                     ; 60 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 61 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 65 }
  52  0000 80            	iret
  74                     ; 73 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 74 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 78 }
  83  0001 80            	iret
 105                     ; 85 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 86 
 105                     ; 87 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 91 }
 114  0002 80            	iret
 136                     ; 98 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 99 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 103 }
 145  0003 80            	iret
 167                     ; 110 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 111 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 115 }
 176  0004 80            	iret
 199                     ; 122 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 199                     ; 123 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 127 }
 208  0005 80            	iret
 231                     ; 134 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 231                     ; 135 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 140 }
 240  0006 80            	iret
 263                     ; 147 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 263                     ; 148 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 152 }
 272  0007 80            	iret
 295                     ; 159 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 295                     ; 160 {
 296                     	switch	.text
 297  0008               f_EXTI_PORTD_IRQHandler:
 301                     ; 164 }
 304  0008 80            	iret
 327                     ; 171 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 327                     ; 172 {
 328                     	switch	.text
 329  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 176 }
 336  0009 80            	iret
 359                     ; 184  INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
 359                     ; 185  {
 360                     	switch	.text
 361  000a               f_EXTI_PORTF_IRQHandler:
 365                     ; 189  }
 368  000a 80            	iret
 390                     ; 223 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 390                     ; 224 {
 391                     	switch	.text
 392  000b               f_SPI_IRQHandler:
 396                     ; 228 }
 399  000b 80            	iret
 422                     ; 235 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 422                     ; 236 {
 423                     	switch	.text
 424  000c               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 428                     ; 240 }
 431  000c 80            	iret
 454                     ; 247 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 454                     ; 248 {
 455                     	switch	.text
 456  000d               f_TIM1_CAP_COM_IRQHandler:
 460                     ; 252 }
 463  000d 80            	iret
 487                     ; 260  INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
 487                     ; 261  {
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
 504                     ; 266 	TIM5_ClearITPendingBit(TIM5_IT_UPDATE);
 506  0020 a601          	ld	a,#1
 507  0022 cd0000        	call	_TIM5_ClearITPendingBit
 509                     ; 267 	}
 512  0025 85            	popw	x
 513  0026 bf00          	ldw	c_y,x
 514  0028 320002        	pop	c_y+2
 515  002b 85            	popw	x
 516  002c bf00          	ldw	c_x,x
 517  002e 320002        	pop	c_x+2
 518  0031 80            	iret
 541                     ; 274  INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
 541                     ; 275  {
 542                     	switch	.text
 543  0032               f_TIM5_CAP_COM_IRQHandler:
 547                     ; 279  }
 550  0032 80            	iret
 573                     ; 341  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 573                     ; 342  {
 574                     	switch	.text
 575  0033               f_UART1_TX_IRQHandler:
 579                     ; 346  }
 582  0033 80            	iret
 605                     ; 353  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 605                     ; 354  {
 606                     	switch	.text
 607  0034               f_UART1_RX_IRQHandler:
 611                     ; 358  }
 614  0034 80            	iret
 636                     ; 392 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 636                     ; 393 {
 637                     	switch	.text
 638  0035               f_I2C_IRQHandler:
 642                     ; 397 }
 645  0035 80            	iret
 667                     ; 471  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 667                     ; 472  {
 668                     	switch	.text
 669  0036               f_ADC1_IRQHandler:
 673                     ; 476  }
 676  0036 80            	iret
 700                     ; 485 INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
 700                     ; 486  {
 701                     	switch	.text
 702  0037               f_TIM6_UPD_OVF_TRG_IRQHandler:
 704  0037 8a            	push	cc
 705  0038 84            	pop	a
 706  0039 a4bf          	and	a,#191
 707  003b 88            	push	a
 708  003c 86            	pop	cc
 709  003d 3b0002        	push	c_x+2
 710  0040 be00          	ldw	x,c_x
 711  0042 89            	pushw	x
 712  0043 3b0002        	push	c_y+2
 713  0046 be00          	ldw	x,c_y
 714  0048 89            	pushw	x
 717                     ; 491   TIM6_ClearITPendingBit(TIM6_IT_UPDATE);	
 719  0049 a601          	ld	a,#1
 720  004b cd0000        	call	_TIM6_ClearITPendingBit
 722                     ; 492  }
 725  004e 85            	popw	x
 726  004f bf00          	ldw	c_y,x
 727  0051 320002        	pop	c_y+2
 728  0054 85            	popw	x
 729  0055 bf00          	ldw	c_x,x
 730  0057 320002        	pop	c_x+2
 731  005a 80            	iret
 754                     ; 512 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 754                     ; 513 {
 755                     	switch	.text
 756  005b               f_EEPROM_EEC_IRQHandler:
 760                     ; 517 }
 763  005b 80            	iret
 775                     	xdef	f_EEPROM_EEC_IRQHandler
 776                     	xdef	f_TIM6_UPD_OVF_TRG_IRQHandler
 777                     	xdef	f_ADC1_IRQHandler
 778                     	xdef	f_I2C_IRQHandler
 779                     	xdef	f_UART1_RX_IRQHandler
 780                     	xdef	f_UART1_TX_IRQHandler
 781                     	xdef	f_TIM5_CAP_COM_IRQHandler
 782                     	xdef	f_TIM5_UPD_OVF_BRK_TRG_IRQHandler
 783                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 784                     	xdef	f_TIM1_CAP_COM_IRQHandler
 785                     	xdef	f_SPI_IRQHandler
 786                     	xdef	f_EXTI_PORTF_IRQHandler
 787                     	xdef	f_EXTI_PORTE_IRQHandler
 788                     	xdef	f_EXTI_PORTD_IRQHandler
 789                     	xdef	f_EXTI_PORTC_IRQHandler
 790                     	xdef	f_EXTI_PORTB_IRQHandler
 791                     	xdef	f_EXTI_PORTA_IRQHandler
 792                     	xdef	f_CLK_IRQHandler
 793                     	xdef	f_AWU_IRQHandler
 794                     	xdef	f_TLI_IRQHandler
 795                     	xdef	f_TRAP_IRQHandler
 796                     	xdef	f_NonHandledInterrupt
 797                     	xref	_TIM6_ClearITPendingBit
 798                     	xref	_TIM5_ClearITPendingBit
 799                     	xref.b	c_x
 800                     	xref.b	c_y
 819                     	end
