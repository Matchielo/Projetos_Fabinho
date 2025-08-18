   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  42                     ; 50 uint8_t ITC_GetCPUCC(void)
  42                     ; 51 {
  44                     	switch	.text
  45  0000               _ITC_GetCPUCC:
  49                     ; 53   _asm("push cc");
  52  0000 8a            push cc
  54                     ; 54   _asm("pop a");
  57  0001 84            pop a
  59                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  62  0002 81            	ret
  85                     ; 80 void ITC_DeInit(void)
  85                     ; 81 {
  86                     	switch	.text
  87  0003               _ITC_DeInit:
  91                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  93  0003 35ff7f70      	mov	32624,#255
  94                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  96  0007 35ff7f71      	mov	32625,#255
  97                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  99  000b 35ff7f72      	mov	32626,#255
 100                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 102  000f 35ff7f73      	mov	32627,#255
 103                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 105  0013 35ff7f74      	mov	32628,#255
 106                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 108  0017 35ff7f75      	mov	32629,#255
 109                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 111  001b 35ff7f76      	mov	32630,#255
 112                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 114  001f 35ff7f77      	mov	32631,#255
 115                     ; 90 }
 118  0023 81            	ret
 143                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 143                     ; 98 {
 144                     	switch	.text
 145  0024               _ITC_GetSoftIntStatus:
 149                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 151  0024 adda          	call	_ITC_GetCPUCC
 153  0026 a428          	and	a,#40
 156  0028 81            	ret
 414                     .const:	section	.text
 415  0000               L22:
 416  0000 004c          	dc.w	L14
 417  0002 004c          	dc.w	L14
 418  0004 004c          	dc.w	L14
 419  0006 004c          	dc.w	L14
 420  0008 0055          	dc.w	L34
 421  000a 0055          	dc.w	L34
 422  000c 0055          	dc.w	L34
 423  000e 0055          	dc.w	L34
 424  0010 005e          	dc.w	L54
 425  0012 0089          	dc.w	L502
 426  0014 005e          	dc.w	L54
 427  0016 005e          	dc.w	L54
 428  0018 0067          	dc.w	L74
 429  001a 0067          	dc.w	L74
 430  001c 0067          	dc.w	L74
 431  001e 0067          	dc.w	L74
 432  0020 0070          	dc.w	L15
 433  0022 0070          	dc.w	L15
 434  0024 0070          	dc.w	L15
 435  0026 0070          	dc.w	L15
 436  0028 0089          	dc.w	L502
 437  002a 0089          	dc.w	L502
 438  002c 0079          	dc.w	L35
 439  002e 0079          	dc.w	L35
 440  0030 0082          	dc.w	L55
 441                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 441                     ; 108 {
 442                     	switch	.text
 443  0029               _ITC_GetSoftwarePriority:
 445  0029 88            	push	a
 446  002a 89            	pushw	x
 447       00000002      OFST:	set	2
 450                     ; 109   uint8_t Value = 0;
 452  002b 0f02          	clr	(OFST+0,sp)
 454                     ; 110   uint8_t Mask = 0;
 456                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 458                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 460  002d a403          	and	a,#3
 461  002f 48            	sll	a
 462  0030 5f            	clrw	x
 463  0031 97            	ld	xl,a
 464  0032 a603          	ld	a,#3
 465  0034 5d            	tnzw	x
 466  0035 2704          	jreq	L41
 467  0037               L61:
 468  0037 48            	sll	a
 469  0038 5a            	decw	x
 470  0039 26fc          	jrne	L61
 471  003b               L41:
 472  003b 6b01          	ld	(OFST-1,sp),a
 474                     ; 118   switch (IrqNum)
 476  003d 7b03          	ld	a,(OFST+1,sp)
 478                     ; 198   default:
 478                     ; 199     break;
 479  003f a119          	cp	a,#25
 480  0041 2407          	jruge	L02
 481  0043 5f            	clrw	x
 482  0044 97            	ld	xl,a
 483  0045 58            	sllw	x
 484  0046 de0000        	ldw	x,(L22,x)
 485  0049 fc            	jp	(x)
 486  004a               L02:
 487  004a 203d          	jra	L502
 488  004c               L14:
 489                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 489                     ; 121   case ITC_IRQ_AWU:
 489                     ; 122   case ITC_IRQ_CLK:
 489                     ; 123   case ITC_IRQ_PORTA:
 489                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 491  004c c67f70        	ld	a,32624
 492  004f 1401          	and	a,(OFST-1,sp)
 493  0051 6b02          	ld	(OFST+0,sp),a
 495                     ; 125     break;
 497  0053 2034          	jra	L502
 498  0055               L34:
 499                     ; 127   case ITC_IRQ_PORTB:
 499                     ; 128   case ITC_IRQ_PORTC:
 499                     ; 129   case ITC_IRQ_PORTD:
 499                     ; 130   case ITC_IRQ_PORTE:
 499                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 501  0055 c67f71        	ld	a,32625
 502  0058 1401          	and	a,(OFST-1,sp)
 503  005a 6b02          	ld	(OFST+0,sp),a
 505                     ; 132     break;
 507  005c 202b          	jra	L502
 508  005e               L54:
 509                     ; 139   case ITC_IRQ_PORTF:
 509                     ; 140 #endif /*STM8S903 or STM8AF622x */
 509                     ; 141   case ITC_IRQ_SPI:
 509                     ; 142   case ITC_IRQ_TIM1_OVF:
 509                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 511  005e c67f72        	ld	a,32626
 512  0061 1401          	and	a,(OFST-1,sp)
 513  0063 6b02          	ld	(OFST+0,sp),a
 515                     ; 144     break;
 517  0065 2022          	jra	L502
 518  0067               L74:
 519                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 519                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 519                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 519                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 519                     ; 150 #else
 519                     ; 151   case ITC_IRQ_TIM2_OVF:
 519                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 519                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 519                     ; 154   case ITC_IRQ_TIM3_OVF:
 519                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 521  0067 c67f73        	ld	a,32627
 522  006a 1401          	and	a,(OFST-1,sp)
 523  006c 6b02          	ld	(OFST+0,sp),a
 525                     ; 156     break;
 527  006e 2019          	jra	L502
 528  0070               L15:
 529                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 529                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 529                     ; 160     defined(STM8S003) ||defined(STM8S001) || defined (STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 529                     ; 161   case ITC_IRQ_UART1_TX:
 529                     ; 162   case ITC_IRQ_UART1_RX:
 529                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 529                     ; 164 #if defined(STM8AF622x)
 529                     ; 165   case ITC_IRQ_UART4_TX:
 529                     ; 166   case ITC_IRQ_UART4_RX:
 529                     ; 167 #endif /*STM8AF622x */
 529                     ; 168   case ITC_IRQ_I2C:
 529                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 531  0070 c67f74        	ld	a,32628
 532  0073 1401          	and	a,(OFST-1,sp)
 533  0075 6b02          	ld	(OFST+0,sp),a
 535                     ; 170     break;
 537  0077 2010          	jra	L502
 538  0079               L35:
 539                     ; 184   case ITC_IRQ_ADC1:
 539                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 539                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 539                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 539                     ; 188 #else
 539                     ; 189   case ITC_IRQ_TIM4_OVF:
 539                     ; 190 #endif /*STM8S903 or STM8AF622x */
 539                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 541  0079 c67f75        	ld	a,32629
 542  007c 1401          	and	a,(OFST-1,sp)
 543  007e 6b02          	ld	(OFST+0,sp),a
 545                     ; 192     break;
 547  0080 2007          	jra	L502
 548  0082               L55:
 549                     ; 194   case ITC_IRQ_EEPROM_EEC:
 549                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 551  0082 c67f76        	ld	a,32630
 552  0085 1401          	and	a,(OFST-1,sp)
 553  0087 6b02          	ld	(OFST+0,sp),a
 555                     ; 196     break;
 557  0089               L75:
 558                     ; 198   default:
 558                     ; 199     break;
 560  0089               L502:
 561                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 563  0089 7b03          	ld	a,(OFST+1,sp)
 564  008b a403          	and	a,#3
 565  008d 48            	sll	a
 566  008e 5f            	clrw	x
 567  008f 97            	ld	xl,a
 568  0090 7b02          	ld	a,(OFST+0,sp)
 569  0092 5d            	tnzw	x
 570  0093 2704          	jreq	L42
 571  0095               L62:
 572  0095 44            	srl	a
 573  0096 5a            	decw	x
 574  0097 26fc          	jrne	L62
 575  0099               L42:
 576  0099 6b02          	ld	(OFST+0,sp),a
 578                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 580  009b 7b02          	ld	a,(OFST+0,sp)
 583  009d 5b03          	addw	sp,#3
 584  009f 81            	ret
 648                     	switch	.const
 649  0032               L44:
 650  0032 00d5          	dc.w	L702
 651  0034 00d5          	dc.w	L702
 652  0036 00d5          	dc.w	L702
 653  0038 00d5          	dc.w	L702
 654  003a 00e7          	dc.w	L112
 655  003c 00e7          	dc.w	L112
 656  003e 00e7          	dc.w	L112
 657  0040 00e7          	dc.w	L112
 658  0042 00f9          	dc.w	L312
 659  0044 0151          	dc.w	L362
 660  0046 00f9          	dc.w	L312
 661  0048 00f9          	dc.w	L312
 662  004a 010b          	dc.w	L512
 663  004c 010b          	dc.w	L512
 664  004e 010b          	dc.w	L512
 665  0050 010b          	dc.w	L512
 666  0052 011d          	dc.w	L712
 667  0054 011d          	dc.w	L712
 668  0056 011d          	dc.w	L712
 669  0058 011d          	dc.w	L712
 670  005a 0151          	dc.w	L362
 671  005c 0151          	dc.w	L362
 672  005e 012f          	dc.w	L122
 673  0060 012f          	dc.w	L122
 674  0062 0141          	dc.w	L322
 675                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 675                     ; 221 {
 676                     	switch	.text
 677  00a0               _ITC_SetSoftwarePriority:
 679  00a0 89            	pushw	x
 680  00a1 89            	pushw	x
 681       00000002      OFST:	set	2
 684                     ; 222   uint8_t Mask = 0;
 686                     ; 223   uint8_t NewPriority = 0;
 688                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 690                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 692                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 694                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 696  00a2 9e            	ld	a,xh
 697  00a3 a403          	and	a,#3
 698  00a5 48            	sll	a
 699  00a6 5f            	clrw	x
 700  00a7 97            	ld	xl,a
 701  00a8 a603          	ld	a,#3
 702  00aa 5d            	tnzw	x
 703  00ab 2704          	jreq	L23
 704  00ad               L43:
 705  00ad 48            	sll	a
 706  00ae 5a            	decw	x
 707  00af 26fc          	jrne	L43
 708  00b1               L23:
 709  00b1 43            	cpl	a
 710  00b2 6b01          	ld	(OFST-1,sp),a
 712                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 714  00b4 7b03          	ld	a,(OFST+1,sp)
 715  00b6 a403          	and	a,#3
 716  00b8 48            	sll	a
 717  00b9 5f            	clrw	x
 718  00ba 97            	ld	xl,a
 719  00bb 7b04          	ld	a,(OFST+2,sp)
 720  00bd 5d            	tnzw	x
 721  00be 2704          	jreq	L63
 722  00c0               L04:
 723  00c0 48            	sll	a
 724  00c1 5a            	decw	x
 725  00c2 26fc          	jrne	L04
 726  00c4               L63:
 727  00c4 6b02          	ld	(OFST+0,sp),a
 729                     ; 239   switch (IrqNum)
 731  00c6 7b03          	ld	a,(OFST+1,sp)
 733                     ; 329   default:
 733                     ; 330     break;
 734  00c8 a119          	cp	a,#25
 735  00ca 2407          	jruge	L24
 736  00cc 5f            	clrw	x
 737  00cd 97            	ld	xl,a
 738  00ce 58            	sllw	x
 739  00cf de0032        	ldw	x,(L44,x)
 740  00d2 fc            	jp	(x)
 741  00d3               L24:
 742  00d3 207c          	jra	L362
 743  00d5               L702:
 744                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 744                     ; 242   case ITC_IRQ_AWU:
 744                     ; 243   case ITC_IRQ_CLK:
 744                     ; 244   case ITC_IRQ_PORTA:
 744                     ; 245     ITC->ISPR1 &= Mask;
 746  00d5 c67f70        	ld	a,32624
 747  00d8 1401          	and	a,(OFST-1,sp)
 748  00da c77f70        	ld	32624,a
 749                     ; 246     ITC->ISPR1 |= NewPriority;
 751  00dd c67f70        	ld	a,32624
 752  00e0 1a02          	or	a,(OFST+0,sp)
 753  00e2 c77f70        	ld	32624,a
 754                     ; 247     break;
 756  00e5 206a          	jra	L362
 757  00e7               L112:
 758                     ; 249   case ITC_IRQ_PORTB:
 758                     ; 250   case ITC_IRQ_PORTC:
 758                     ; 251   case ITC_IRQ_PORTD:
 758                     ; 252   case ITC_IRQ_PORTE:
 758                     ; 253     ITC->ISPR2 &= Mask;
 760  00e7 c67f71        	ld	a,32625
 761  00ea 1401          	and	a,(OFST-1,sp)
 762  00ec c77f71        	ld	32625,a
 763                     ; 254     ITC->ISPR2 |= NewPriority;
 765  00ef c67f71        	ld	a,32625
 766  00f2 1a02          	or	a,(OFST+0,sp)
 767  00f4 c77f71        	ld	32625,a
 768                     ; 255     break;
 770  00f7 2058          	jra	L362
 771  00f9               L312:
 772                     ; 262   case ITC_IRQ_PORTF:
 772                     ; 263 #endif /*STM8S903 or STM8AF622x */
 772                     ; 264   case ITC_IRQ_SPI:
 772                     ; 265   case ITC_IRQ_TIM1_OVF:
 772                     ; 266     ITC->ISPR3 &= Mask;
 774  00f9 c67f72        	ld	a,32626
 775  00fc 1401          	and	a,(OFST-1,sp)
 776  00fe c77f72        	ld	32626,a
 777                     ; 267     ITC->ISPR3 |= NewPriority;
 779  0101 c67f72        	ld	a,32626
 780  0104 1a02          	or	a,(OFST+0,sp)
 781  0106 c77f72        	ld	32626,a
 782                     ; 268     break;
 784  0109 2046          	jra	L362
 785  010b               L512:
 786                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 786                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 786                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 786                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 786                     ; 274 #else
 786                     ; 275   case ITC_IRQ_TIM2_OVF:
 786                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 786                     ; 277 #endif /*STM8S903 or STM8AF622x */
 786                     ; 278   case ITC_IRQ_TIM3_OVF:
 786                     ; 279     ITC->ISPR4 &= Mask;
 788  010b c67f73        	ld	a,32627
 789  010e 1401          	and	a,(OFST-1,sp)
 790  0110 c77f73        	ld	32627,a
 791                     ; 280     ITC->ISPR4 |= NewPriority;
 793  0113 c67f73        	ld	a,32627
 794  0116 1a02          	or	a,(OFST+0,sp)
 795  0118 c77f73        	ld	32627,a
 796                     ; 281     break;
 798  011b 2034          	jra	L362
 799  011d               L712:
 800                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 800                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 800                     ; 285     defined(STM8S001) ||defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 800                     ; 286   case ITC_IRQ_UART1_TX:
 800                     ; 287   case ITC_IRQ_UART1_RX:
 800                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 800                     ; 289 #if defined(STM8AF622x)
 800                     ; 290   case ITC_IRQ_UART4_TX:
 800                     ; 291   case ITC_IRQ_UART4_RX:
 800                     ; 292 #endif /*STM8AF622x */
 800                     ; 293   case ITC_IRQ_I2C:
 800                     ; 294     ITC->ISPR5 &= Mask;
 802  011d c67f74        	ld	a,32628
 803  0120 1401          	and	a,(OFST-1,sp)
 804  0122 c77f74        	ld	32628,a
 805                     ; 295     ITC->ISPR5 |= NewPriority;
 807  0125 c67f74        	ld	a,32628
 808  0128 1a02          	or	a,(OFST+0,sp)
 809  012a c77f74        	ld	32628,a
 810                     ; 296     break;
 812  012d 2022          	jra	L362
 813  012f               L122:
 814                     ; 312   case ITC_IRQ_ADC1:
 814                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S001 or STM8S903 or STM8AF626x or STM8AF622x */
 814                     ; 314     
 814                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 814                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 814                     ; 317 #else
 814                     ; 318   case ITC_IRQ_TIM4_OVF:
 814                     ; 319 #endif /* STM8S903 or STM8AF622x */
 814                     ; 320     ITC->ISPR6 &= Mask;
 816  012f c67f75        	ld	a,32629
 817  0132 1401          	and	a,(OFST-1,sp)
 818  0134 c77f75        	ld	32629,a
 819                     ; 321     ITC->ISPR6 |= NewPriority;
 821  0137 c67f75        	ld	a,32629
 822  013a 1a02          	or	a,(OFST+0,sp)
 823  013c c77f75        	ld	32629,a
 824                     ; 322     break;
 826  013f 2010          	jra	L362
 827  0141               L322:
 828                     ; 324   case ITC_IRQ_EEPROM_EEC:
 828                     ; 325     ITC->ISPR7 &= Mask;
 830  0141 c67f76        	ld	a,32630
 831  0144 1401          	and	a,(OFST-1,sp)
 832  0146 c77f76        	ld	32630,a
 833                     ; 326     ITC->ISPR7 |= NewPriority;
 835  0149 c67f76        	ld	a,32630
 836  014c 1a02          	or	a,(OFST+0,sp)
 837  014e c77f76        	ld	32630,a
 838                     ; 327     break;
 840  0151               L522:
 841                     ; 329   default:
 841                     ; 330     break;
 843  0151               L362:
 844                     ; 332 }
 847  0151 5b04          	addw	sp,#4
 848  0153 81            	ret
 861                     	xdef	_ITC_GetSoftwarePriority
 862                     	xdef	_ITC_SetSoftwarePriority
 863                     	xdef	_ITC_GetSoftIntStatus
 864                     	xdef	_ITC_DeInit
 865                     	xdef	_ITC_GetCPUCC
 884                     	end
