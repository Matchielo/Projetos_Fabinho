   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
   4                     ; Optimizer V4.6.4 - 15 Jan 2025
  20                     .const:	section	.text
  21  0000               _HSIDivFactor:
  22  0000 01            	dc.b	1
  23  0001 02            	dc.b	2
  24  0002 04            	dc.b	4
  25  0003 08            	dc.b	8
  26  0004               _CLKPrescTable:
  27  0004 01            	dc.b	1
  28  0005 02            	dc.b	2
  29  0006 04            	dc.b	4
  30  0007 08            	dc.b	8
  31  0008 0a            	dc.b	10
  32  0009 10            	dc.b	16
  33  000a 14            	dc.b	20
  34  000b 28            	dc.b	40
  63                     ; 72 void CLK_DeInit(void)
  63                     ; 73 {
  65                     .text:	section	.text,new
  66  0000               _CLK_DeInit:
  70                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  72  0000 350150c0      	mov	20672,#1
  73                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  75  0004 725f50c1      	clr	20673
  76                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  78  0008 35e150c4      	mov	20676,#225
  79                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  81  000c 725f50c5      	clr	20677
  82                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  84  0010 351850c6      	mov	20678,#24
  85                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  87  0014 35ff50c7      	mov	20679,#255
  88                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  90  0018 35ff50ca      	mov	20682,#255
  91                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  93  001c 725f50c8      	clr	20680
  94                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  96  0020 725f50c9      	clr	20681
  98  0024               L52:
  99                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 101  0024 720050c9fb    	btjt	20681,#0,L52
 102                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 104  0029 725f50c9      	clr	20681
 105                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 107  002d 725f50cc      	clr	20684
 108                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 110  0031 725f50cd      	clr	20685
 111                     ; 88 }
 114  0035 81            	ret	
 170                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 100 {
 171                     .text:	section	.text,new
 172  0000               _CLK_FastHaltWakeUpCmd:
 176                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178                     ; 104   if (NewState != DISABLE)
 180  0000 4d            	tnz	a
 181  0001 2705          	jreq	L75
 182                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 184  0003 721450c0      	bset	20672,#2
 187  0007 81            	ret	
 188  0008               L75:
 189                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 191  0008 721550c0      	bres	20672,#2
 192                     ; 114 }
 195  000c 81            	ret	
 230                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 230                     ; 122 {
 231                     .text:	section	.text,new
 232  0000               _CLK_HSECmd:
 236                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 238                     ; 126   if (NewState != DISABLE)
 240  0000 4d            	tnz	a
 241  0001 2705          	jreq	L101
 242                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 244  0003 721050c1      	bset	20673,#0
 247  0007 81            	ret	
 248  0008               L101:
 249                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 251  0008 721150c1      	bres	20673,#0
 252                     ; 136 }
 255  000c 81            	ret	
 290                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 290                     ; 144 {
 291                     .text:	section	.text,new
 292  0000               _CLK_HSICmd:
 296                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 298                     ; 148   if (NewState != DISABLE)
 300  0000 4d            	tnz	a
 301  0001 2705          	jreq	L321
 302                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 304  0003 721050c0      	bset	20672,#0
 307  0007 81            	ret	
 308  0008               L321:
 309                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 311  0008 721150c0      	bres	20672,#0
 312                     ; 158 }
 315  000c 81            	ret	
 350                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 350                     ; 167 {
 351                     .text:	section	.text,new
 352  0000               _CLK_LSICmd:
 356                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 358                     ; 171   if (NewState != DISABLE)
 360  0000 4d            	tnz	a
 361  0001 2705          	jreq	L541
 362                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 364  0003 721650c0      	bset	20672,#3
 367  0007 81            	ret	
 368  0008               L541:
 369                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 371  0008 721750c0      	bres	20672,#3
 372                     ; 181 }
 375  000c 81            	ret	
 410                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 410                     ; 190 {
 411                     .text:	section	.text,new
 412  0000               _CLK_CCOCmd:
 416                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 194   if (NewState != DISABLE)
 420  0000 4d            	tnz	a
 421  0001 2705          	jreq	L761
 422                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 424  0003 721050c9      	bset	20681,#0
 427  0007 81            	ret	
 428  0008               L761:
 429                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 431  0008 721150c9      	bres	20681,#0
 432                     ; 204 }
 435  000c 81            	ret	
 470                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 470                     ; 214 {
 471                     .text:	section	.text,new
 472  0000               _CLK_ClockSwitchCmd:
 476                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 478                     ; 218   if (NewState != DISABLE )
 480  0000 4d            	tnz	a
 481  0001 2705          	jreq	L112
 482                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 484  0003 721250c5      	bset	20677,#1
 487  0007 81            	ret	
 488  0008               L112:
 489                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 491  0008 721350c5      	bres	20677,#1
 492                     ; 228 }
 495  000c 81            	ret	
 531                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 531                     ; 239 {
 532                     .text:	section	.text,new
 533  0000               _CLK_SlowActiveHaltWakeUpCmd:
 537                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 539                     ; 243   if (NewState != DISABLE)
 541  0000 4d            	tnz	a
 542  0001 2705          	jreq	L332
 543                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 545  0003 721a50c0      	bset	20672,#5
 548  0007 81            	ret	
 549  0008               L332:
 550                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 552  0008 721b50c0      	bres	20672,#5
 553                     ; 253 }
 556  000c 81            	ret	
 715                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 715                     ; 264 {
 716                     .text:	section	.text,new
 717  0000               _CLK_PeripheralClockConfig:
 719  0000 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 725                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 727                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 729  0001 9e            	ld	a,xh
 730  0002 a510          	bcp	a,#16
 731  0004 2626          	jrne	L123
 732                     ; 271     if (NewState != DISABLE)
 734  0006 7b02          	ld	a,(OFST+2,sp)
 735  0008 270f          	jreq	L323
 736                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 738  000a 7b01          	ld	a,(OFST+1,sp)
 739  000c ad44          	call	LC003
 740  000e 2704          	jreq	L62
 741  0010               L03:
 742  0010 48            	sll	a
 743  0011 5a            	decw	x
 744  0012 26fc          	jrne	L03
 745  0014               L62:
 746  0014 ca50c7        	or	a,20679
 748  0017 200e          	jp	LC002
 749  0019               L323:
 750                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 752  0019 7b01          	ld	a,(OFST+1,sp)
 753  001b ad35          	call	LC003
 754  001d 2704          	jreq	L23
 755  001f               L43:
 756  001f 48            	sll	a
 757  0020 5a            	decw	x
 758  0021 26fc          	jrne	L43
 759  0023               L23:
 760  0023 43            	cpl	a
 761  0024 c450c7        	and	a,20679
 762  0027               LC002:
 763  0027 c750c7        	ld	20679,a
 764  002a 2024          	jra	L723
 765  002c               L123:
 766                     ; 284     if (NewState != DISABLE)
 768  002c 7b02          	ld	a,(OFST+2,sp)
 769  002e 270f          	jreq	L133
 770                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 772  0030 7b01          	ld	a,(OFST+1,sp)
 773  0032 ad1e          	call	LC003
 774  0034 2704          	jreq	L63
 775  0036               L04:
 776  0036 48            	sll	a
 777  0037 5a            	decw	x
 778  0038 26fc          	jrne	L04
 779  003a               L63:
 780  003a ca50ca        	or	a,20682
 782  003d 200e          	jp	LC001
 783  003f               L133:
 784                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 786  003f 7b01          	ld	a,(OFST+1,sp)
 787  0041 ad0f          	call	LC003
 788  0043 2704          	jreq	L24
 789  0045               L44:
 790  0045 48            	sll	a
 791  0046 5a            	decw	x
 792  0047 26fc          	jrne	L44
 793  0049               L24:
 794  0049 43            	cpl	a
 795  004a c450ca        	and	a,20682
 796  004d               LC001:
 797  004d c750ca        	ld	20682,a
 798  0050               L723:
 799                     ; 295 }
 802  0050 85            	popw	x
 803  0051 81            	ret	
 804  0052               LC003:
 805  0052 a40f          	and	a,#15
 806  0054 5f            	clrw	x
 807  0055 97            	ld	xl,a
 808  0056 a601          	ld	a,#1
 809  0058 5d            	tnzw	x
 810  0059 81            	ret	
 998                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 998                     ; 310 {
 999                     .text:	section	.text,new
1000  0000               _CLK_ClockSwitchConfig:
1002  0000 89            	pushw	x
1003  0001 5204          	subw	sp,#4
1004       00000004      OFST:	set	4
1007                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1009  0003 aeffff        	ldw	x,#65535
1010  0006 1f03          	ldw	(OFST-1,sp),x
1012                     ; 313   ErrorStatus Swif = ERROR;
1014                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1016                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1018                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1020                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1022                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1024  0008 c650c3        	ld	a,20675
1025  000b 6b01          	ld	(OFST-3,sp),a
1027                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1029  000d 7b05          	ld	a,(OFST+1,sp)
1030  000f 4a            	dec	a
1031  0010 263d          	jrne	L544
1032                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1034  0012 721250c5      	bset	20677,#1
1035                     ; 331     if (ITState != DISABLE)
1037  0016 7b09          	ld	a,(OFST+5,sp)
1038  0018 2706          	jreq	L744
1039                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1041  001a 721450c5      	bset	20677,#2
1043  001e 2004          	jra	L154
1044  0020               L744:
1045                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1047  0020 721550c5      	bres	20677,#2
1048  0024               L154:
1049                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1051  0024 7b06          	ld	a,(OFST+2,sp)
1052  0026 c750c4        	ld	20676,a
1054  0029 2003          	jra	L754
1055  002b               L354:
1056                     ; 346       DownCounter--;
1058  002b 5a            	decw	x
1059  002c 1f03          	ldw	(OFST-1,sp),x
1061  002e               L754:
1062                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1064  002e 720150c504    	btjf	20677,#0,L364
1066  0033 1e03          	ldw	x,(OFST-1,sp)
1067  0035 26f4          	jrne	L354
1068  0037               L364:
1069                     ; 349     if(DownCounter != 0)
1071  0037 1e03          	ldw	x,(OFST-1,sp)
1072                     ; 351       Swif = SUCCESS;
1074  0039 263d          	jrne	LC005
1075  003b               L564:
1076                     ; 355       Swif = ERROR;
1079  003b 0f02          	clr	(OFST-2,sp)
1081  003d               L174:
1082                     ; 390   if(Swif != ERROR)
1084  003d 275d          	jreq	L515
1085                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1087  003f 7b0a          	ld	a,(OFST+6,sp)
1088  0041 263b          	jrne	L715
1090  0043 7b01          	ld	a,(OFST-3,sp)
1091  0045 a1e1          	cp	a,#225
1092  0047 2635          	jrne	L715
1093                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1095  0049 721150c0      	bres	20672,#0
1097  004d 204d          	jra	L515
1098  004f               L544:
1099                     ; 361     if (ITState != DISABLE)
1101  004f 7b09          	ld	a,(OFST+5,sp)
1102  0051 2706          	jreq	L374
1103                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1105  0053 721450c5      	bset	20677,#2
1107  0057 2004          	jra	L574
1108  0059               L374:
1109                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1111  0059 721550c5      	bres	20677,#2
1112  005d               L574:
1113                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1115  005d 7b06          	ld	a,(OFST+2,sp)
1116  005f c750c4        	ld	20676,a
1118  0062 2003          	jra	L305
1119  0064               L774:
1120                     ; 376       DownCounter--;
1122  0064 5a            	decw	x
1123  0065 1f03          	ldw	(OFST-1,sp),x
1125  0067               L305:
1126                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1128  0067 720750c504    	btjf	20677,#3,L705
1130  006c 1e03          	ldw	x,(OFST-1,sp)
1131  006e 26f4          	jrne	L774
1132  0070               L705:
1133                     ; 379     if(DownCounter != 0)
1135  0070 1e03          	ldw	x,(OFST-1,sp)
1136  0072 27c7          	jreq	L564
1137                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1139  0074 721250c5      	bset	20677,#1
1140                     ; 383       Swif = SUCCESS;
1142  0078               LC005:
1144  0078 a601          	ld	a,#1
1145  007a 6b02          	ld	(OFST-2,sp),a
1148  007c 20bf          	jra	L174
1149                     ; 387       Swif = ERROR;
1150  007e               L715:
1151                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1153  007e 7b0a          	ld	a,(OFST+6,sp)
1154  0080 260c          	jrne	L325
1156  0082 7b01          	ld	a,(OFST-3,sp)
1157  0084 a1d2          	cp	a,#210
1158  0086 2606          	jrne	L325
1159                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1161  0088 721750c0      	bres	20672,#3
1163  008c 200e          	jra	L515
1164  008e               L325:
1165                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1167  008e 7b0a          	ld	a,(OFST+6,sp)
1168  0090 260a          	jrne	L515
1170  0092 7b01          	ld	a,(OFST-3,sp)
1171  0094 a1b4          	cp	a,#180
1172  0096 2604          	jrne	L515
1173                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1175  0098 721150c1      	bres	20673,#0
1176  009c               L515:
1177                     ; 406   return(Swif);
1179  009c 7b02          	ld	a,(OFST-2,sp)
1182  009e 5b06          	addw	sp,#6
1183  00a0 81            	ret	
1321                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1321                     ; 416 {
1322                     .text:	section	.text,new
1323  0000               _CLK_HSIPrescalerConfig:
1325  0000 88            	push	a
1326       00000000      OFST:	set	0
1329                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1331                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1333  0001 c650c6        	ld	a,20678
1334  0004 a4e7          	and	a,#231
1335  0006 c750c6        	ld	20678,a
1336                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1338  0009 c650c6        	ld	a,20678
1339  000c 1a01          	or	a,(OFST+1,sp)
1340  000e c750c6        	ld	20678,a
1341                     ; 425 }
1344  0011 84            	pop	a
1345  0012 81            	ret	
1480                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1480                     ; 437 {
1481                     .text:	section	.text,new
1482  0000               _CLK_CCOConfig:
1484  0000 88            	push	a
1485       00000000      OFST:	set	0
1488                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1490                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1492  0001 c650c9        	ld	a,20681
1493  0004 a4e1          	and	a,#225
1494  0006 c750c9        	ld	20681,a
1495                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1497  0009 c650c9        	ld	a,20681
1498  000c 1a01          	or	a,(OFST+1,sp)
1499  000e c750c9        	ld	20681,a
1500                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1502  0011 721050c9      	bset	20681,#0
1503                     ; 449 }
1506  0015 84            	pop	a
1507  0016 81            	ret	
1572                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1572                     ; 460 {
1573                     .text:	section	.text,new
1574  0000               _CLK_ITConfig:
1576  0000 89            	pushw	x
1577       00000000      OFST:	set	0
1580                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1582                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1584                     ; 465   if (NewState != DISABLE)
1586  0001 9f            	ld	a,xl
1587  0002 4d            	tnz	a
1588  0003 2715          	jreq	L527
1589                     ; 467     switch (CLK_IT)
1591  0005 9e            	ld	a,xh
1593                     ; 475     default:
1593                     ; 476       break;
1594  0006 a00c          	sub	a,#12
1595  0008 270a          	jreq	L166
1596  000a a010          	sub	a,#16
1597  000c 2620          	jrne	L337
1598                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1598                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1600  000e 721450c5      	bset	20677,#2
1601                     ; 471       break;
1603  0012 201a          	jra	L337
1604  0014               L166:
1605                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1605                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1607  0014 721450c8      	bset	20680,#2
1608                     ; 474       break;
1610  0018 2014          	jra	L337
1611                     ; 475     default:
1611                     ; 476       break;
1614  001a               L527:
1615                     ; 481     switch (CLK_IT)
1617  001a 7b01          	ld	a,(OFST+1,sp)
1619                     ; 489     default:
1619                     ; 490       break;
1620  001c a00c          	sub	a,#12
1621  001e 270a          	jreq	L766
1622  0020 a010          	sub	a,#16
1623  0022 260a          	jrne	L337
1624                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1624                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1626  0024 721550c5      	bres	20677,#2
1627                     ; 485       break;
1629  0028 2004          	jra	L337
1630  002a               L766:
1631                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1631                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1633  002a 721550c8      	bres	20680,#2
1634                     ; 488       break;
1635  002e               L337:
1636                     ; 493 }
1639  002e 85            	popw	x
1640  002f 81            	ret	
1641                     ; 489     default:
1641                     ; 490       break;
1677                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1677                     ; 501 {
1678                     .text:	section	.text,new
1679  0000               _CLK_SYSCLKConfig:
1681  0000 88            	push	a
1682       00000000      OFST:	set	0
1685                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1687                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1689  0001 a580          	bcp	a,#128
1690  0003 260e          	jrne	L757
1691                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1693  0005 c650c6        	ld	a,20678
1694  0008 a4e7          	and	a,#231
1695  000a c750c6        	ld	20678,a
1696                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1698  000d 7b01          	ld	a,(OFST+1,sp)
1699  000f a418          	and	a,#24
1701  0011 200c          	jra	L167
1702  0013               L757:
1703                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1705  0013 c650c6        	ld	a,20678
1706  0016 a4f8          	and	a,#248
1707  0018 c750c6        	ld	20678,a
1708                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1710  001b 7b01          	ld	a,(OFST+1,sp)
1711  001d a407          	and	a,#7
1712  001f               L167:
1713  001f ca50c6        	or	a,20678
1714  0022 c750c6        	ld	20678,a
1715                     ; 515 }
1718  0025 84            	pop	a
1719  0026 81            	ret	
1775                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1775                     ; 524 {
1776                     .text:	section	.text,new
1777  0000               _CLK_SWIMConfig:
1781                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1783                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1785  0000 4d            	tnz	a
1786  0001 2705          	jreq	L1101
1787                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1789  0003 721050cd      	bset	20685,#0
1792  0007 81            	ret	
1793  0008               L1101:
1794                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1796  0008 721150cd      	bres	20685,#0
1797                     ; 538 }
1800  000c 81            	ret	
1824                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1824                     ; 548 {
1825                     .text:	section	.text,new
1826  0000               _CLK_ClockSecuritySystemEnable:
1830                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1832  0000 721050c8      	bset	20680,#0
1833                     ; 551 }
1836  0004 81            	ret	
1861                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1861                     ; 560 {
1862                     .text:	section	.text,new
1863  0000               _CLK_GetSYSCLKSource:
1867                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1869  0000 c650c3        	ld	a,20675
1872  0003 81            	ret	
1935                     ; 569 uint32_t CLK_GetClockFreq(void)
1935                     ; 570 {
1936                     .text:	section	.text,new
1937  0000               _CLK_GetClockFreq:
1939  0000 5209          	subw	sp,#9
1940       00000009      OFST:	set	9
1943                     ; 571   uint32_t clockfrequency = 0;
1945                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1947                     ; 573   uint8_t tmp = 0, presc = 0;
1951                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1953  0002 c650c3        	ld	a,20675
1954  0005 6b09          	ld	(OFST+0,sp),a
1956                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1958  0007 a1e1          	cp	a,#225
1959  0009 2634          	jrne	L7601
1960                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1962  000b c650c6        	ld	a,20678
1963  000e a418          	and	a,#24
1964  0010 44            	srl	a
1965  0011 44            	srl	a
1966  0012 44            	srl	a
1968                     ; 581     tmp = (uint8_t)(tmp >> 3);
1971                     ; 582     presc = HSIDivFactor[tmp];
1973  0013 5f            	clrw	x
1974  0014 97            	ld	xl,a
1975  0015 d60000        	ld	a,(_HSIDivFactor,x)
1976  0018 6b09          	ld	(OFST+0,sp),a
1978                     ; 583     clockfrequency = HSI_VALUE / presc;
1980  001a b703          	ld	c_lreg+3,a
1981  001c 3f02          	clr	c_lreg+2
1982  001e 3f01          	clr	c_lreg+1
1983  0020 3f00          	clr	c_lreg
1984  0022 96            	ldw	x,sp
1985  0023 5c            	incw	x
1986  0024 cd0000        	call	c_rtol
1989  0027 ae2400        	ldw	x,#9216
1990  002a bf02          	ldw	c_lreg+2,x
1991  002c ae00f4        	ldw	x,#244
1992  002f bf00          	ldw	c_lreg,x
1993  0031 96            	ldw	x,sp
1994  0032 5c            	incw	x
1995  0033 cd0000        	call	c_ludv
1997  0036 96            	ldw	x,sp
1998  0037 1c0005        	addw	x,#OFST-4
1999  003a cd0000        	call	c_rtol
2003  003d 2018          	jra	L1701
2004  003f               L7601:
2005                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2007  003f a1d2          	cp	a,#210
2008  0041 260a          	jrne	L3701
2009                     ; 587     clockfrequency = LSI_VALUE;
2011  0043 aef400        	ldw	x,#62464
2012  0046 1f07          	ldw	(OFST-2,sp),x
2013  0048 ae0001        	ldw	x,#1
2015  004b 2008          	jp	LC006
2016  004d               L3701:
2017                     ; 591     clockfrequency = HSE_VALUE;
2019  004d ae2400        	ldw	x,#9216
2020  0050 1f07          	ldw	(OFST-2,sp),x
2021  0052 ae00f4        	ldw	x,#244
2022  0055               LC006:
2023  0055 1f05          	ldw	(OFST-4,sp),x
2025  0057               L1701:
2026                     ; 594   return((uint32_t)clockfrequency);
2028  0057 96            	ldw	x,sp
2029  0058 1c0005        	addw	x,#OFST-4
2030  005b cd0000        	call	c_ltor
2034  005e 5b09          	addw	sp,#9
2035  0060 81            	ret	
2134                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2134                     ; 605 {
2135                     .text:	section	.text,new
2136  0000               _CLK_AdjustHSICalibrationValue:
2138  0000 88            	push	a
2139       00000000      OFST:	set	0
2142                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2144                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2146  0001 c650cc        	ld	a,20684
2147  0004 a4f8          	and	a,#248
2148  0006 1a01          	or	a,(OFST+1,sp)
2149  0008 c750cc        	ld	20684,a
2150                     ; 611 }
2153  000b 84            	pop	a
2154  000c 81            	ret	
2178                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2178                     ; 623 {
2179                     .text:	section	.text,new
2180  0000               _CLK_SYSCLKEmergencyClear:
2184                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2186  0000 721150c5      	bres	20677,#0
2187                     ; 625 }
2190  0004 81            	ret	
2343                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2343                     ; 635 {
2344                     .text:	section	.text,new
2345  0000               _CLK_GetFlagStatus:
2347  0000 89            	pushw	x
2348  0001 5203          	subw	sp,#3
2349       00000003      OFST:	set	3
2352                     ; 636   uint16_t statusreg = 0;
2354                     ; 637   uint8_t tmpreg = 0;
2356                     ; 638   FlagStatus bitstatus = RESET;
2358                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2360                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2362  0003 01            	rrwa	x,a
2363  0004 4f            	clr	a
2364  0005 02            	rlwa	x,a
2365  0006 1f01          	ldw	(OFST-2,sp),x
2367                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2369  0008 a30100        	cpw	x,#256
2370  000b 2605          	jrne	L1421
2371                     ; 649     tmpreg = CLK->ICKR;
2373  000d c650c0        	ld	a,20672
2375  0010 2021          	jra	L3421
2376  0012               L1421:
2377                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2379  0012 a30200        	cpw	x,#512
2380  0015 2605          	jrne	L5421
2381                     ; 653     tmpreg = CLK->ECKR;
2383  0017 c650c1        	ld	a,20673
2385  001a 2017          	jra	L3421
2386  001c               L5421:
2387                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2389  001c a30300        	cpw	x,#768
2390  001f 2605          	jrne	L1521
2391                     ; 657     tmpreg = CLK->SWCR;
2393  0021 c650c5        	ld	a,20677
2395  0024 200d          	jra	L3421
2396  0026               L1521:
2397                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2399  0026 a30400        	cpw	x,#1024
2400  0029 2605          	jrne	L5521
2401                     ; 661     tmpreg = CLK->CSSR;
2403  002b c650c8        	ld	a,20680
2405  002e 2003          	jra	L3421
2406  0030               L5521:
2407                     ; 665     tmpreg = CLK->CCOR;
2409  0030 c650c9        	ld	a,20681
2410  0033               L3421:
2411  0033 6b03          	ld	(OFST+0,sp),a
2413                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2415  0035 7b05          	ld	a,(OFST+2,sp)
2416  0037 1503          	bcp	a,(OFST+0,sp)
2417  0039 2704          	jreq	L1621
2418                     ; 670     bitstatus = SET;
2420  003b a601          	ld	a,#1
2423  003d 2001          	jra	L3621
2424  003f               L1621:
2425                     ; 674     bitstatus = RESET;
2427  003f 4f            	clr	a
2429  0040               L3621:
2430                     ; 678   return((FlagStatus)bitstatus);
2434  0040 5b05          	addw	sp,#5
2435  0042 81            	ret	
2481                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2481                     ; 688 {
2482                     .text:	section	.text,new
2483  0000               _CLK_GetITStatus:
2485  0000 88            	push	a
2486  0001 88            	push	a
2487       00000001      OFST:	set	1
2490                     ; 689   ITStatus bitstatus = RESET;
2492                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2494                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2496  0002 a11c          	cp	a,#28
2497  0004 2609          	jrne	L7031
2498                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2500  0006 c450c5        	and	a,20677
2501  0009 a10c          	cp	a,#12
2502  000b 260f          	jrne	L7131
2503                     ; 699       bitstatus = SET;
2505  000d 2009          	jp	LC008
2506                     ; 703       bitstatus = RESET;
2507  000f               L7031:
2508                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2510  000f c650c8        	ld	a,20680
2511  0012 1402          	and	a,(OFST+1,sp)
2512  0014 a10c          	cp	a,#12
2513  0016 2604          	jrne	L7131
2514                     ; 711       bitstatus = SET;
2516  0018               LC008:
2518  0018 a601          	ld	a,#1
2521  001a 2001          	jra	L5131
2522  001c               L7131:
2523                     ; 715       bitstatus = RESET;
2526  001c 4f            	clr	a
2528  001d               L5131:
2529                     ; 720   return bitstatus;
2533  001d 85            	popw	x
2534  001e 81            	ret	
2570                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2570                     ; 730 {
2571                     .text:	section	.text,new
2572  0000               _CLK_ClearITPendingBit:
2576                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2578                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2580  0000 a10c          	cp	a,#12
2581  0002 2605          	jrne	L1431
2582                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2584  0004 721750c8      	bres	20680,#3
2587  0008 81            	ret	
2588  0009               L1431:
2589                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2591  0009 721750c5      	bres	20677,#3
2592                     ; 745 }
2595  000d 81            	ret	
2630                     	xdef	_CLKPrescTable
2631                     	xdef	_HSIDivFactor
2632                     	xdef	_CLK_ClearITPendingBit
2633                     	xdef	_CLK_GetITStatus
2634                     	xdef	_CLK_GetFlagStatus
2635                     	xdef	_CLK_GetSYSCLKSource
2636                     	xdef	_CLK_GetClockFreq
2637                     	xdef	_CLK_AdjustHSICalibrationValue
2638                     	xdef	_CLK_SYSCLKEmergencyClear
2639                     	xdef	_CLK_ClockSecuritySystemEnable
2640                     	xdef	_CLK_SWIMConfig
2641                     	xdef	_CLK_SYSCLKConfig
2642                     	xdef	_CLK_ITConfig
2643                     	xdef	_CLK_CCOConfig
2644                     	xdef	_CLK_HSIPrescalerConfig
2645                     	xdef	_CLK_ClockSwitchConfig
2646                     	xdef	_CLK_PeripheralClockConfig
2647                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2648                     	xdef	_CLK_FastHaltWakeUpCmd
2649                     	xdef	_CLK_ClockSwitchCmd
2650                     	xdef	_CLK_CCOCmd
2651                     	xdef	_CLK_LSICmd
2652                     	xdef	_CLK_HSICmd
2653                     	xdef	_CLK_HSECmd
2654                     	xdef	_CLK_DeInit
2655                     	xref.b	c_lreg
2656                     	xref.b	c_x
2675                     	xref	c_ltor
2676                     	xref	c_ludv
2677                     	xref	c_rtol
2678                     	end
