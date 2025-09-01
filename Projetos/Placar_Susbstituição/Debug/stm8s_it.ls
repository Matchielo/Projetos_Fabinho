   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
   4                     ; Optimizer V4.6.4 - 15 Jan 2025
  49                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  49                     ; 60 {
  50                     .text:	section	.text,new
  51  0000               f_NonHandledInterrupt:
  55                     ; 64 }
  58  0000 80            	iret	
  80                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  80                     ; 73 {
  81                     .text:	section	.text,new
  82  0000               f_TRAP_IRQHandler:
  86                     ; 77 }
  89  0000 80            	iret	
 111                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 111                     ; 85 
 111                     ; 86 {
 112                     .text:	section	.text,new
 113  0000               f_TLI_IRQHandler:
 117                     ; 90 }
 120  0000 80            	iret	
 142                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 142                     ; 98 {
 143                     .text:	section	.text,new
 144  0000               f_AWU_IRQHandler:
 148                     ; 102 }
 151  0000 80            	iret	
 173                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 173                     ; 110 {
 174                     .text:	section	.text,new
 175  0000               f_CLK_IRQHandler:
 179                     ; 114 }
 182  0000 80            	iret	
 205                     ; 121 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 205                     ; 122 {
 206                     .text:	section	.text,new
 207  0000               f_EXTI_PORTA_IRQHandler:
 211                     ; 126 }
 214  0000 80            	iret	
 237                     ; 133 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 237                     ; 134 {
 238                     .text:	section	.text,new
 239  0000               f_EXTI_PORTB_IRQHandler:
 243                     ; 138 }
 246  0000 80            	iret	
 269                     ; 145 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 269                     ; 146 {
 270                     .text:	section	.text,new
 271  0000               f_EXTI_PORTC_IRQHandler:
 275                     ; 150 }
 278  0000 80            	iret	
 301                     ; 157 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 301                     ; 158 {
 302                     .text:	section	.text,new
 303  0000               f_EXTI_PORTD_IRQHandler:
 307                     ; 162 }
 310  0000 80            	iret	
 333                     ; 169 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 333                     ; 170 {
 334                     .text:	section	.text,new
 335  0000               f_EXTI_PORTE_IRQHandler:
 339                     ; 174 }
 342  0000 80            	iret	
 365                     ; 182  INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
 365                     ; 183  {
 366                     .text:	section	.text,new
 367  0000               f_EXTI_PORTF_IRQHandler:
 371                     ; 187  }
 374  0000 80            	iret	
 396                     ; 221 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 396                     ; 222 {
 397                     .text:	section	.text,new
 398  0000               f_SPI_IRQHandler:
 402                     ; 226 }
 405  0000 80            	iret	
 428                     ; 233 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 428                     ; 234 {
 429                     .text:	section	.text,new
 430  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 434                     ; 238 }
 437  0000 80            	iret	
 460                     ; 245 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 460                     ; 246 {
 461                     .text:	section	.text,new
 462  0000               f_TIM1_CAP_COM_IRQHandler:
 466                     ; 250 }
 469  0000 80            	iret	
 493                     ; 258  INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
 493                     ; 259  {
 494                     .text:	section	.text,new
 495  0000               f_TIM5_UPD_OVF_BRK_TRG_IRQHandler:
 497  0000 8a            	push	cc
 498  0001 84            	pop	a
 499  0002 a4bf          	and	a,#191
 500  0004 88            	push	a
 501  0005 86            	pop	cc
 502  0006 3b0002        	push	c_x+2
 503  0009 be00          	ldw	x,c_x
 504  000b 89            	pushw	x
 505  000c 3b0002        	push	c_y+2
 506  000f be00          	ldw	x,c_y
 507  0011 89            	pushw	x
 510                     ; 264 	TIM5_ClearITPendingBit(TIM5_IT_UPDATE);
 512  0012 a601          	ld	a,#1
 513  0014 cd0000        	call	_TIM5_ClearITPendingBit
 515                     ; 265 	}
 518  0017 85            	popw	x
 519  0018 bf00          	ldw	c_y,x
 520  001a 320002        	pop	c_y+2
 521  001d 85            	popw	x
 522  001e bf00          	ldw	c_x,x
 523  0020 320002        	pop	c_x+2
 524  0023 80            	iret	
 547                     ; 272  INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
 547                     ; 273  {
 548                     .text:	section	.text,new
 549  0000               f_TIM5_CAP_COM_IRQHandler:
 553                     ; 277  }
 556  0000 80            	iret	
 579                     ; 339  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 579                     ; 340  {
 580                     .text:	section	.text,new
 581  0000               f_UART1_TX_IRQHandler:
 585                     ; 344  }
 588  0000 80            	iret	
 611                     ; 351  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 611                     ; 352  {
 612                     .text:	section	.text,new
 613  0000               f_UART1_RX_IRQHandler:
 617                     ; 356  }
 620  0000 80            	iret	
 642                     ; 390 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 642                     ; 391 {
 643                     .text:	section	.text,new
 644  0000               f_I2C_IRQHandler:
 648                     ; 395 }
 651  0000 80            	iret	
 673                     ; 469  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 673                     ; 470  {
 674                     .text:	section	.text,new
 675  0000               f_ADC1_IRQHandler:
 679                     ; 474  }
 682  0000 80            	iret	
 706                     ; 483 INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
 706                     ; 484  {
 707                     .text:	section	.text,new
 708  0000               f_TIM6_UPD_OVF_TRG_IRQHandler:
 710  0000 8a            	push	cc
 711  0001 84            	pop	a
 712  0002 a4bf          	and	a,#191
 713  0004 88            	push	a
 714  0005 86            	pop	cc
 715  0006 3b0002        	push	c_x+2
 716  0009 be00          	ldw	x,c_x
 717  000b 89            	pushw	x
 718  000c 3b0002        	push	c_y+2
 719  000f be00          	ldw	x,c_y
 720  0011 89            	pushw	x
 723                     ; 489   TIM6_ClearITPendingBit(TIM6_IT_UPDATE);	
 725  0012 a601          	ld	a,#1
 726  0014 cd0000        	call	_TIM6_ClearITPendingBit
 728                     ; 490  }
 731  0017 85            	popw	x
 732  0018 bf00          	ldw	c_y,x
 733  001a 320002        	pop	c_y+2
 734  001d 85            	popw	x
 735  001e bf00          	ldw	c_x,x
 736  0020 320002        	pop	c_x+2
 737  0023 80            	iret	
 760                     ; 510 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 760                     ; 511 {
 761                     .text:	section	.text,new
 762  0000               f_EEPROM_EEC_IRQHandler:
 766                     ; 515 }
 769  0000 80            	iret	
 781                     	xdef	f_EEPROM_EEC_IRQHandler
 782                     	xdef	f_TIM6_UPD_OVF_TRG_IRQHandler
 783                     	xdef	f_ADC1_IRQHandler
 784                     	xdef	f_I2C_IRQHandler
 785                     	xdef	f_UART1_RX_IRQHandler
 786                     	xdef	f_UART1_TX_IRQHandler
 787                     	xdef	f_TIM5_CAP_COM_IRQHandler
 788                     	xdef	f_TIM5_UPD_OVF_BRK_TRG_IRQHandler
 789                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 790                     	xdef	f_TIM1_CAP_COM_IRQHandler
 791                     	xdef	f_SPI_IRQHandler
 792                     	xdef	f_EXTI_PORTF_IRQHandler
 793                     	xdef	f_EXTI_PORTE_IRQHandler
 794                     	xdef	f_EXTI_PORTD_IRQHandler
 795                     	xdef	f_EXTI_PORTC_IRQHandler
 796                     	xdef	f_EXTI_PORTB_IRQHandler
 797                     	xdef	f_EXTI_PORTA_IRQHandler
 798                     	xdef	f_CLK_IRQHandler
 799                     	xdef	f_AWU_IRQHandler
 800                     	xdef	f_TLI_IRQHandler
 801                     	xdef	f_TRAP_IRQHandler
 802                     	xdef	f_NonHandledInterrupt
 803                     	xref	_TIM6_ClearITPendingBit
 804                     	xref	_TIM5_ClearITPendingBit
 805                     	xref.b	c_x
 806                     	xref.b	c_y
 825                     	end
