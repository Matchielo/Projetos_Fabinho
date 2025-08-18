   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  42                     ; 52 void TIM6_DeInit(void)
  42                     ; 53 {
  44                     	switch	.text
  45  0000               _TIM6_DeInit:
  49                     ; 54   TIM6->CR1 	= TIM6_CR1_RESET_VALUE;
  51  0000 725f5340      	clr	21312
  52                     ; 55   TIM6->CR2 	= TIM6_CR2_RESET_VALUE;
  54  0004 725f5341      	clr	21313
  55                     ; 56   TIM6->SMCR 	= TIM6_SMCR_RESET_VALUE;
  57  0008 725f5342      	clr	21314
  58                     ; 57   TIM6->IER 	= TIM6_IER_RESET_VALUE;
  60  000c 725f5343      	clr	21315
  61                     ; 58   TIM6->CNTR 	= TIM6_CNTR_RESET_VALUE;
  63  0010 725f5346      	clr	21318
  64                     ; 59   TIM6->PSCR	= TIM6_PSCR_RESET_VALUE;
  66  0014 725f5347      	clr	21319
  67                     ; 60   TIM6->ARR 	= TIM6_ARR_RESET_VALUE;
  69  0018 35ff5348      	mov	21320,#255
  70                     ; 61   TIM6->SR1 	= TIM6_SR1_RESET_VALUE;
  72  001c 725f5344      	clr	21316
  73                     ; 62 }
  76  0020 81            	ret
 182                     ; 71 void TIM6_TimeBaseInit(TIM6_Prescaler_TypeDef TIM6_Prescaler,
 182                     ; 72                        uint8_t TIM6_Period)
 182                     ; 73 {
 183                     	switch	.text
 184  0021               _TIM6_TimeBaseInit:
 188                     ; 75   assert_param(IS_TIM6_PRESCALER_OK(TIM6_Prescaler));
 190                     ; 77   TIM6->ARR = (uint8_t)(TIM6_Period);
 192  0021 9f            	ld	a,xl
 193  0022 c75348        	ld	21320,a
 194                     ; 79   TIM6->PSCR = (uint8_t)(TIM6_Prescaler);
 196  0025 9e            	ld	a,xh
 197  0026 c75347        	ld	21319,a
 198                     ; 80 }
 201  0029 81            	ret
 256                     ; 88 void TIM6_Cmd(FunctionalState NewState)
 256                     ; 89 {
 257                     	switch	.text
 258  002a               _TIM6_Cmd:
 262                     ; 91   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 264                     ; 94   if (NewState == ENABLE)
 266  002a a101          	cp	a,#1
 267  002c 2606          	jrne	L511
 268                     ; 96     TIM6->CR1 |= TIM6_CR1_CEN ;
 270  002e 72105340      	bset	21312,#0
 272  0032 2004          	jra	L711
 273  0034               L511:
 274                     ; 100     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_CEN) ;
 276  0034 72115340      	bres	21312,#0
 277  0038               L711:
 278                     ; 102 }
 281  0038 81            	ret
 317                     ; 110 void TIM6_UpdateDisableConfig(FunctionalState NewState)
 317                     ; 111 {
 318                     	switch	.text
 319  0039               _TIM6_UpdateDisableConfig:
 323                     ; 113   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 325                     ; 116   if (NewState == ENABLE)
 327  0039 a101          	cp	a,#1
 328  003b 2606          	jrne	L731
 329                     ; 118     TIM6->CR1 |= TIM6_CR1_UDIS ;
 331  003d 72125340      	bset	21312,#1
 333  0041 2004          	jra	L141
 334  0043               L731:
 335                     ; 122     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_UDIS) ;
 337  0043 72135340      	bres	21312,#1
 338  0047               L141:
 339                     ; 124 }
 342  0047 81            	ret
 400                     ; 132 void TIM6_UpdateRequestConfig(TIM6_UpdateSource_TypeDef TIM6_UpdateSource)
 400                     ; 133 {
 401                     	switch	.text
 402  0048               _TIM6_UpdateRequestConfig:
 406                     ; 135   assert_param(IS_TIM6_UPDATE_SOURCE_OK(TIM6_UpdateSource));
 408                     ; 138   if (TIM6_UpdateSource == TIM6_UPDATESOURCE_REGULAR)
 410  0048 a101          	cp	a,#1
 411  004a 2606          	jrne	L171
 412                     ; 140     TIM6->CR1 |= TIM6_CR1_URS ;
 414  004c 72145340      	bset	21312,#2
 416  0050 2004          	jra	L371
 417  0052               L171:
 418                     ; 144     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_URS) ;
 420  0052 72155340      	bres	21312,#2
 421  0056               L371:
 422                     ; 146 }
 425  0056 81            	ret
 482                     ; 154 void TIM6_SelectOnePulseMode(TIM6_OPMode_TypeDef TIM6_OPMode)
 482                     ; 155 {
 483                     	switch	.text
 484  0057               _TIM6_SelectOnePulseMode:
 488                     ; 157   assert_param(IS_TIM6_OPM_MODE_OK(TIM6_OPMode));
 490                     ; 160   if (TIM6_OPMode == TIM6_OPMODE_SINGLE)
 492  0057 a101          	cp	a,#1
 493  0059 2606          	jrne	L322
 494                     ; 162     TIM6->CR1 |= TIM6_CR1_OPM ;
 496  005b 72165340      	bset	21312,#3
 498  005f 2004          	jra	L522
 499  0061               L322:
 500                     ; 166     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_OPM) ;
 502  0061 72175340      	bres	21312,#3
 503  0065               L522:
 504                     ; 168 }
 507  0065 81            	ret
 575                     ; 178 void TIM6_PrescalerConfig(TIM6_Prescaler_TypeDef Prescaler,
 575                     ; 179                           TIM6_PSCReloadMode_TypeDef TIM6_PSCReloadMode)
 575                     ; 180 {
 576                     	switch	.text
 577  0066               _TIM6_PrescalerConfig:
 581                     ; 182   assert_param(IS_TIM6_PRESCALER_RELOAD_OK(TIM6_PSCReloadMode));
 583                     ; 183   assert_param(IS_TIM6_PRESCALER_OK(Prescaler));
 585                     ; 186   TIM6->PSCR = (uint8_t)Prescaler;
 587  0066 9e            	ld	a,xh
 588  0067 c75347        	ld	21319,a
 589                     ; 189   if (TIM6_PSCReloadMode == TIM6_PSCRELOADMODE_IMMEDIATE)
 591  006a 9f            	ld	a,xl
 592  006b a101          	cp	a,#1
 593  006d 2606          	jrne	L162
 594                     ; 191     TIM6->EGR |= TIM6_EGR_UG ;
 596  006f 72105345      	bset	21317,#0
 598  0073 2004          	jra	L362
 599  0075               L162:
 600                     ; 195     TIM6->EGR &= (uint8_t)(~TIM6_EGR_UG) ;
 602  0075 72115345      	bres	21317,#0
 603  0079               L362:
 604                     ; 197 }
 607  0079 81            	ret
 643                     ; 205 void TIM6_ARRPreloadConfig(FunctionalState NewState)
 643                     ; 206 {
 644                     	switch	.text
 645  007a               _TIM6_ARRPreloadConfig:
 649                     ; 208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 651                     ; 211   if (NewState == ENABLE)
 653  007a a101          	cp	a,#1
 654  007c 2606          	jrne	L303
 655                     ; 213     TIM6->CR1 |= TIM6_CR1_ARPE ;
 657  007e 721e5340      	bset	21312,#7
 659  0082 2004          	jra	L503
 660  0084               L303:
 661                     ; 217     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_ARPE) ;
 663  0084 721f5340      	bres	21312,#7
 664  0088               L503:
 665                     ; 219 }
 668  0088 81            	ret
 702                     ; 227 void TIM6_SetCounter(uint8_t Counter)
 702                     ; 228 {
 703                     	switch	.text
 704  0089               _TIM6_SetCounter:
 708                     ; 230   TIM6->CNTR = (uint8_t)(Counter);
 710  0089 c75346        	ld	21318,a
 711                     ; 231 }
 714  008c 81            	ret
 748                     ; 239 void TIM6_SetAutoreload(uint8_t Autoreload)
 748                     ; 240 {
 749                     	switch	.text
 750  008d               _TIM6_SetAutoreload:
 754                     ; 242   TIM6->ARR = (uint8_t)(Autoreload);
 756  008d c75348        	ld	21320,a
 757                     ; 243 }
 760  0090 81            	ret
 794                     ; 250 uint8_t TIM6_GetCounter(void)
 794                     ; 251 {
 795                     	switch	.text
 796  0091               _TIM6_GetCounter:
 798  0091 88            	push	a
 799       00000001      OFST:	set	1
 802                     ; 252   uint8_t tmpcntr=0;
 804                     ; 253   tmpcntr = TIM6->CNTR;
 806  0092 c65346        	ld	a,21318
 807  0095 6b01          	ld	(OFST+0,sp),a
 809                     ; 255   return ((uint8_t)tmpcntr);
 811  0097 7b01          	ld	a,(OFST+0,sp)
 814  0099 5b01          	addw	sp,#1
 815  009b 81            	ret
 839                     ; 263 TIM6_Prescaler_TypeDef TIM6_GetPrescaler(void)
 839                     ; 264 {
 840                     	switch	.text
 841  009c               _TIM6_GetPrescaler:
 845                     ; 266   return ((TIM6_Prescaler_TypeDef)TIM6->PSCR);
 847  009c c65347        	ld	a,21319
 850  009f 81            	ret
 915                     ; 280 void TIM6_ITConfig(TIM6_IT_TypeDef TIM6_IT, FunctionalState NewState)
 915                     ; 281 {
 916                     	switch	.text
 917  00a0               _TIM6_ITConfig:
 919  00a0 89            	pushw	x
 920       00000000      OFST:	set	0
 923                     ; 283   assert_param(IS_TIM6_IT_OK(TIM6_IT));
 925                     ; 284   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 927                     ; 286   if (NewState == ENABLE)
 929  00a1 9f            	ld	a,xl
 930  00a2 a101          	cp	a,#1
 931  00a4 2609          	jrne	L324
 932                     ; 289     TIM6->IER |= (uint8_t)TIM6_IT;
 934  00a6 9e            	ld	a,xh
 935  00a7 ca5343        	or	a,21315
 936  00aa c75343        	ld	21315,a
 938  00ad 2009          	jra	L524
 939  00af               L324:
 940                     ; 294     TIM6->IER &= (uint8_t)(~(uint8_t)TIM6_IT);
 942  00af 7b01          	ld	a,(OFST+1,sp)
 943  00b1 43            	cpl	a
 944  00b2 c45343        	and	a,21315
 945  00b5 c75343        	ld	21315,a
 946  00b8               L524:
 947                     ; 296 }
 950  00b8 85            	popw	x
 951  00b9 81            	ret
1006                     ; 304 void TIM6_ClearFlag(TIM6_FLAG_TypeDef TIM6_FLAG)
1006                     ; 305 {
1007                     	switch	.text
1008  00ba               _TIM6_ClearFlag:
1012                     ; 307   assert_param(IS_TIM6_CLEAR_FLAG_OK((uint8_t)TIM6_FLAG));
1014                     ; 309   TIM6->SR1 &= (uint8_t)(~((uint8_t)TIM6_FLAG));
1016  00ba 43            	cpl	a
1017  00bb c45344        	and	a,21316
1018  00be c75344        	ld	21316,a
1019                     ; 310 }
1022  00c1 81            	ret
1106                     ; 319 ITStatus TIM6_GetITStatus(TIM6_IT_TypeDef TIM6_IT)
1106                     ; 320 {
1107                     	switch	.text
1108  00c2               _TIM6_GetITStatus:
1110  00c2 88            	push	a
1111  00c3 89            	pushw	x
1112       00000002      OFST:	set	2
1115                     ; 321   ITStatus bitstatus = RESET;
1117                     ; 322   uint8_t itStatus = 0, itEnable = 0;
1121                     ; 325   assert_param(IS_TIM6_GET_IT_OK(TIM6_IT));
1123                     ; 327   itStatus = (uint8_t)(TIM6->SR1 & (uint8_t)TIM6_IT);
1125  00c4 c45344        	and	a,21316
1126  00c7 6b01          	ld	(OFST-1,sp),a
1128                     ; 329   itEnable = (uint8_t)(TIM6->IER & (uint8_t)TIM6_IT);
1130  00c9 c65343        	ld	a,21315
1131  00cc 1403          	and	a,(OFST+1,sp)
1132  00ce 6b02          	ld	(OFST+0,sp),a
1134                     ; 331   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1136  00d0 0d01          	tnz	(OFST-1,sp)
1137  00d2 270a          	jreq	L715
1139  00d4 0d02          	tnz	(OFST+0,sp)
1140  00d6 2706          	jreq	L715
1141                     ; 333     bitstatus = (ITStatus)SET;
1143  00d8 a601          	ld	a,#1
1144  00da 6b02          	ld	(OFST+0,sp),a
1147  00dc 2002          	jra	L125
1148  00de               L715:
1149                     ; 337     bitstatus = (ITStatus)RESET;
1151  00de 0f02          	clr	(OFST+0,sp)
1153  00e0               L125:
1154                     ; 339   return ((ITStatus)bitstatus);
1156  00e0 7b02          	ld	a,(OFST+0,sp)
1159  00e2 5b03          	addw	sp,#3
1160  00e4 81            	ret
1217                     ; 348 void TIM6_GenerateEvent(TIM6_EventSource_TypeDef TIM6_EventSource)
1217                     ; 349 {
1218                     	switch	.text
1219  00e5               _TIM6_GenerateEvent:
1223                     ; 351   assert_param(IS_TIM6_EVENT_SOURCE_OK((uint8_t)TIM6_EventSource));
1225                     ; 354   TIM6->EGR |= (uint8_t)TIM6_EventSource;
1227  00e5 ca5345        	or	a,21317
1228  00e8 c75345        	ld	21317,a
1229                     ; 355 }
1232  00eb 81            	ret
1278                     ; 364 FlagStatus TIM6_GetFlagStatus(TIM6_FLAG_TypeDef TIM6_FLAG)
1278                     ; 365 {
1279                     	switch	.text
1280  00ec               _TIM6_GetFlagStatus:
1282  00ec 88            	push	a
1283       00000001      OFST:	set	1
1286                     ; 366   volatile FlagStatus bitstatus = RESET;
1288  00ed 0f01          	clr	(OFST+0,sp)
1290                     ; 369   assert_param(IS_TIM6_GET_FLAG_OK(TIM6_FLAG));
1292                     ; 371   if ((TIM6->SR1 & (uint8_t)TIM6_FLAG)  != 0)
1294  00ef c45344        	and	a,21316
1295  00f2 2706          	jreq	L375
1296                     ; 373     bitstatus = SET;
1298  00f4 a601          	ld	a,#1
1299  00f6 6b01          	ld	(OFST+0,sp),a
1302  00f8 2002          	jra	L575
1303  00fa               L375:
1304                     ; 377     bitstatus = RESET;
1306  00fa 0f01          	clr	(OFST+0,sp)
1308  00fc               L575:
1309                     ; 379   return ((FlagStatus)bitstatus);
1311  00fc 7b01          	ld	a,(OFST+0,sp)
1314  00fe 5b01          	addw	sp,#1
1315  0100 81            	ret
1351                     ; 388 void TIM6_ClearITPendingBit(TIM6_IT_TypeDef TIM6_IT)
1351                     ; 389 {
1352                     	switch	.text
1353  0101               _TIM6_ClearITPendingBit:
1357                     ; 391   assert_param(IS_TIM6_IT_OK(TIM6_IT));
1359                     ; 394   TIM6->SR1 &= (uint8_t)(~(uint8_t)TIM6_IT);
1361  0101 43            	cpl	a
1362  0102 c45344        	and	a,21316
1363  0105 c75344        	ld	21316,a
1364                     ; 395 }
1367  0108 81            	ret
1442                     ; 403 void TIM6_SelectOutputTrigger(TIM6_TRGOSource_TypeDef TIM6_TRGOSource)
1442                     ; 404 {
1443                     	switch	.text
1444  0109               _TIM6_SelectOutputTrigger:
1446  0109 88            	push	a
1447  010a 88            	push	a
1448       00000001      OFST:	set	1
1451                     ; 405   uint8_t tmpcr2 = 0;
1453                     ; 408   assert_param(IS_TIM6_TRGO_SOURCE_OK(TIM6_TRGOSource));
1455                     ; 410   tmpcr2 = TIM6->CR2;
1457  010b c65341        	ld	a,21313
1458  010e 6b01          	ld	(OFST+0,sp),a
1460                     ; 413   tmpcr2 &= (uint8_t)(~TIM6_CR2_MMS);
1462  0110 7b01          	ld	a,(OFST+0,sp)
1463  0112 a48f          	and	a,#143
1464  0114 6b01          	ld	(OFST+0,sp),a
1466                     ; 416   tmpcr2 |=  (uint8_t)TIM6_TRGOSource;
1468  0116 7b01          	ld	a,(OFST+0,sp)
1469  0118 1a02          	or	a,(OFST+1,sp)
1470  011a 6b01          	ld	(OFST+0,sp),a
1472                     ; 418   TIM6->CR2 = tmpcr2;
1474  011c 7b01          	ld	a,(OFST+0,sp)
1475  011e c75341        	ld	21313,a
1476                     ; 419 }
1479  0121 85            	popw	x
1480  0122 81            	ret
1516                     ; 428 void TIM6_SelectMasterSlaveMode(FunctionalState NewState)
1516                     ; 429 {
1517                     	switch	.text
1518  0123               _TIM6_SelectMasterSlaveMode:
1522                     ; 431   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1524                     ; 434   if (NewState == ENABLE)
1526  0123 a101          	cp	a,#1
1527  0125 2606          	jrne	L766
1528                     ; 436     TIM6->SMCR |= TIM6_SMCR_MSM;
1530  0127 721e5342      	bset	21314,#7
1532  012b 2004          	jra	L176
1533  012d               L766:
1534                     ; 440     TIM6->SMCR &= (uint8_t)(~TIM6_SMCR_MSM);
1536  012d 721f5342      	bres	21314,#7
1537  0131               L176:
1538                     ; 442 }
1541  0131 81            	ret
1607                     ; 450 void TIM6_SelectInputTrigger(TIM6_TS_TypeDef TIM6_InputTriggerSource)
1607                     ; 451 {
1608                     	switch	.text
1609  0132               _TIM6_SelectInputTrigger:
1611  0132 88            	push	a
1612  0133 88            	push	a
1613       00000001      OFST:	set	1
1616                     ; 452   uint8_t tmpsmcr = 0;
1618                     ; 455   assert_param(IS_TIM6_TRIGGER_SELECTION_OK(TIM6_InputTriggerSource));
1620                     ; 457   tmpsmcr = TIM6->SMCR;
1622  0134 c65342        	ld	a,21314
1623  0137 6b01          	ld	(OFST+0,sp),a
1625                     ; 460   tmpsmcr &= (uint8_t)(~TIM6_SMCR_TS);
1627  0139 7b01          	ld	a,(OFST+0,sp)
1628  013b a48f          	and	a,#143
1629  013d 6b01          	ld	(OFST+0,sp),a
1631                     ; 461   tmpsmcr |= (uint8_t)TIM6_InputTriggerSource;
1633  013f 7b01          	ld	a,(OFST+0,sp)
1634  0141 1a02          	or	a,(OFST+1,sp)
1635  0143 6b01          	ld	(OFST+0,sp),a
1637                     ; 463   TIM6->SMCR = (uint8_t)tmpsmcr;
1639  0145 7b01          	ld	a,(OFST+0,sp)
1640  0147 c75342        	ld	21314,a
1641                     ; 464 }
1644  014a 85            	popw	x
1645  014b 81            	ret
1669                     ; 471 void TIM6_InternalClockConfig(void)
1669                     ; 472 {
1670                     	switch	.text
1671  014c               _TIM6_InternalClockConfig:
1675                     ; 474   TIM6->SMCR &=  (uint8_t)(~TIM6_SMCR_SMS);
1677  014c c65342        	ld	a,21314
1678  014f a4f8          	and	a,#248
1679  0151 c75342        	ld	21314,a
1680                     ; 475 }
1683  0154 81            	ret
1774                     ; 483 void TIM6_SelectSlaveMode(TIM6_SlaveMode_TypeDef TIM6_SlaveMode)
1774                     ; 484 {
1775                     	switch	.text
1776  0155               _TIM6_SelectSlaveMode:
1778  0155 88            	push	a
1779  0156 88            	push	a
1780       00000001      OFST:	set	1
1783                     ; 485   uint8_t tmpsmcr = 0;
1785                     ; 488   assert_param(IS_TIM6_SLAVE_MODE_OK(TIM6_SlaveMode));
1787                     ; 490   tmpsmcr = TIM6->SMCR;
1789  0157 c65342        	ld	a,21314
1790  015a 6b01          	ld	(OFST+0,sp),a
1792                     ; 493   tmpsmcr &= (uint8_t)(~TIM6_SMCR_SMS);
1794  015c 7b01          	ld	a,(OFST+0,sp)
1795  015e a4f8          	and	a,#248
1796  0160 6b01          	ld	(OFST+0,sp),a
1798                     ; 496   tmpsmcr |= (uint8_t)TIM6_SlaveMode;
1800  0162 7b01          	ld	a,(OFST+0,sp)
1801  0164 1a02          	or	a,(OFST+1,sp)
1802  0166 6b01          	ld	(OFST+0,sp),a
1804                     ; 498   TIM6->SMCR = tmpsmcr;
1806  0168 7b01          	ld	a,(OFST+0,sp)
1807  016a c75342        	ld	21314,a
1808                     ; 499 }
1811  016d 85            	popw	x
1812  016e 81            	ret
1825                     	xdef	_TIM6_SelectSlaveMode
1826                     	xdef	_TIM6_InternalClockConfig
1827                     	xdef	_TIM6_SelectInputTrigger
1828                     	xdef	_TIM6_SelectMasterSlaveMode
1829                     	xdef	_TIM6_SelectOutputTrigger
1830                     	xdef	_TIM6_ClearITPendingBit
1831                     	xdef	_TIM6_GetFlagStatus
1832                     	xdef	_TIM6_GenerateEvent
1833                     	xdef	_TIM6_GetITStatus
1834                     	xdef	_TIM6_ClearFlag
1835                     	xdef	_TIM6_ITConfig
1836                     	xdef	_TIM6_GetPrescaler
1837                     	xdef	_TIM6_GetCounter
1838                     	xdef	_TIM6_SetAutoreload
1839                     	xdef	_TIM6_SetCounter
1840                     	xdef	_TIM6_ARRPreloadConfig
1841                     	xdef	_TIM6_PrescalerConfig
1842                     	xdef	_TIM6_SelectOnePulseMode
1843                     	xdef	_TIM6_UpdateRequestConfig
1844                     	xdef	_TIM6_UpdateDisableConfig
1845                     	xdef	_TIM6_Cmd
1846                     	xdef	_TIM6_TimeBaseInit
1847                     	xdef	_TIM6_DeInit
1866                     	end
