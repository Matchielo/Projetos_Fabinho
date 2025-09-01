   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
   4                     ; Optimizer V4.6.4 - 15 Jan 2025
  48                     ; 52 void TIM6_DeInit(void)
  48                     ; 53 {
  50                     .text:	section	.text,new
  51  0000               _TIM6_DeInit:
  55                     ; 54   TIM6->CR1 	= TIM6_CR1_RESET_VALUE;
  57  0000 725f5340      	clr	21312
  58                     ; 55   TIM6->CR2 	= TIM6_CR2_RESET_VALUE;
  60  0004 725f5341      	clr	21313
  61                     ; 56   TIM6->SMCR 	= TIM6_SMCR_RESET_VALUE;
  63  0008 725f5342      	clr	21314
  64                     ; 57   TIM6->IER 	= TIM6_IER_RESET_VALUE;
  66  000c 725f5343      	clr	21315
  67                     ; 58   TIM6->CNTR 	= TIM6_CNTR_RESET_VALUE;
  69  0010 725f5346      	clr	21318
  70                     ; 59   TIM6->PSCR	= TIM6_PSCR_RESET_VALUE;
  72  0014 725f5347      	clr	21319
  73                     ; 60   TIM6->ARR 	= TIM6_ARR_RESET_VALUE;
  75  0018 35ff5348      	mov	21320,#255
  76                     ; 61   TIM6->SR1 	= TIM6_SR1_RESET_VALUE;
  78  001c 725f5344      	clr	21316
  79                     ; 62 }
  82  0020 81            	ret	
 188                     ; 71 void TIM6_TimeBaseInit(TIM6_Prescaler_TypeDef TIM6_Prescaler,
 188                     ; 72                        uint8_t TIM6_Period)
 188                     ; 73 {
 189                     .text:	section	.text,new
 190  0000               _TIM6_TimeBaseInit:
 194                     ; 75   assert_param(IS_TIM6_PRESCALER_OK(TIM6_Prescaler));
 196                     ; 77   TIM6->ARR = (uint8_t)(TIM6_Period);
 198  0000 9f            	ld	a,xl
 199  0001 c75348        	ld	21320,a
 200                     ; 79   TIM6->PSCR = (uint8_t)(TIM6_Prescaler);
 202  0004 9e            	ld	a,xh
 203  0005 c75347        	ld	21319,a
 204                     ; 80 }
 207  0008 81            	ret	
 262                     ; 88 void TIM6_Cmd(FunctionalState NewState)
 262                     ; 89 {
 263                     .text:	section	.text,new
 264  0000               _TIM6_Cmd:
 268                     ; 91   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 270                     ; 94   if (NewState == ENABLE)
 272  0000 4a            	dec	a
 273  0001 2605          	jrne	L511
 274                     ; 96     TIM6->CR1 |= TIM6_CR1_CEN ;
 276  0003 72105340      	bset	21312,#0
 279  0007 81            	ret	
 280  0008               L511:
 281                     ; 100     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_CEN) ;
 283  0008 72115340      	bres	21312,#0
 284                     ; 102 }
 287  000c 81            	ret	
 323                     ; 110 void TIM6_UpdateDisableConfig(FunctionalState NewState)
 323                     ; 111 {
 324                     .text:	section	.text,new
 325  0000               _TIM6_UpdateDisableConfig:
 329                     ; 113   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 331                     ; 116   if (NewState == ENABLE)
 333  0000 4a            	dec	a
 334  0001 2605          	jrne	L731
 335                     ; 118     TIM6->CR1 |= TIM6_CR1_UDIS ;
 337  0003 72125340      	bset	21312,#1
 340  0007 81            	ret	
 341  0008               L731:
 342                     ; 122     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_UDIS) ;
 344  0008 72135340      	bres	21312,#1
 345                     ; 124 }
 348  000c 81            	ret	
 406                     ; 132 void TIM6_UpdateRequestConfig(TIM6_UpdateSource_TypeDef TIM6_UpdateSource)
 406                     ; 133 {
 407                     .text:	section	.text,new
 408  0000               _TIM6_UpdateRequestConfig:
 412                     ; 135   assert_param(IS_TIM6_UPDATE_SOURCE_OK(TIM6_UpdateSource));
 414                     ; 138   if (TIM6_UpdateSource == TIM6_UPDATESOURCE_REGULAR)
 416  0000 4a            	dec	a
 417  0001 2605          	jrne	L171
 418                     ; 140     TIM6->CR1 |= TIM6_CR1_URS ;
 420  0003 72145340      	bset	21312,#2
 423  0007 81            	ret	
 424  0008               L171:
 425                     ; 144     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_URS) ;
 427  0008 72155340      	bres	21312,#2
 428                     ; 146 }
 431  000c 81            	ret	
 488                     ; 154 void TIM6_SelectOnePulseMode(TIM6_OPMode_TypeDef TIM6_OPMode)
 488                     ; 155 {
 489                     .text:	section	.text,new
 490  0000               _TIM6_SelectOnePulseMode:
 494                     ; 157   assert_param(IS_TIM6_OPM_MODE_OK(TIM6_OPMode));
 496                     ; 160   if (TIM6_OPMode == TIM6_OPMODE_SINGLE)
 498  0000 4a            	dec	a
 499  0001 2605          	jrne	L322
 500                     ; 162     TIM6->CR1 |= TIM6_CR1_OPM ;
 502  0003 72165340      	bset	21312,#3
 505  0007 81            	ret	
 506  0008               L322:
 507                     ; 166     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_OPM) ;
 509  0008 72175340      	bres	21312,#3
 510                     ; 168 }
 513  000c 81            	ret	
 581                     ; 178 void TIM6_PrescalerConfig(TIM6_Prescaler_TypeDef Prescaler,
 581                     ; 179                           TIM6_PSCReloadMode_TypeDef TIM6_PSCReloadMode)
 581                     ; 180 {
 582                     .text:	section	.text,new
 583  0000               _TIM6_PrescalerConfig:
 587                     ; 182   assert_param(IS_TIM6_PRESCALER_RELOAD_OK(TIM6_PSCReloadMode));
 589                     ; 183   assert_param(IS_TIM6_PRESCALER_OK(Prescaler));
 591                     ; 186   TIM6->PSCR = (uint8_t)Prescaler;
 593  0000 9e            	ld	a,xh
 594  0001 c75347        	ld	21319,a
 595                     ; 189   if (TIM6_PSCReloadMode == TIM6_PSCRELOADMODE_IMMEDIATE)
 597  0004 9f            	ld	a,xl
 598  0005 4a            	dec	a
 599  0006 2605          	jrne	L162
 600                     ; 191     TIM6->EGR |= TIM6_EGR_UG ;
 602  0008 72105345      	bset	21317,#0
 605  000c 81            	ret	
 606  000d               L162:
 607                     ; 195     TIM6->EGR &= (uint8_t)(~TIM6_EGR_UG) ;
 609  000d 72115345      	bres	21317,#0
 610                     ; 197 }
 613  0011 81            	ret	
 649                     ; 205 void TIM6_ARRPreloadConfig(FunctionalState NewState)
 649                     ; 206 {
 650                     .text:	section	.text,new
 651  0000               _TIM6_ARRPreloadConfig:
 655                     ; 208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 657                     ; 211   if (NewState == ENABLE)
 659  0000 4a            	dec	a
 660  0001 2605          	jrne	L303
 661                     ; 213     TIM6->CR1 |= TIM6_CR1_ARPE ;
 663  0003 721e5340      	bset	21312,#7
 666  0007 81            	ret	
 667  0008               L303:
 668                     ; 217     TIM6->CR1 &= (uint8_t)(~TIM6_CR1_ARPE) ;
 670  0008 721f5340      	bres	21312,#7
 671                     ; 219 }
 674  000c 81            	ret	
 708                     ; 227 void TIM6_SetCounter(uint8_t Counter)
 708                     ; 228 {
 709                     .text:	section	.text,new
 710  0000               _TIM6_SetCounter:
 714                     ; 230   TIM6->CNTR = (uint8_t)(Counter);
 716  0000 c75346        	ld	21318,a
 717                     ; 231 }
 720  0003 81            	ret	
 754                     ; 239 void TIM6_SetAutoreload(uint8_t Autoreload)
 754                     ; 240 {
 755                     .text:	section	.text,new
 756  0000               _TIM6_SetAutoreload:
 760                     ; 242   TIM6->ARR = (uint8_t)(Autoreload);
 762  0000 c75348        	ld	21320,a
 763                     ; 243 }
 766  0003 81            	ret	
 800                     ; 250 uint8_t TIM6_GetCounter(void)
 800                     ; 251 {
 801                     .text:	section	.text,new
 802  0000               _TIM6_GetCounter:
 804       00000001      OFST:	set	1
 807                     ; 252   uint8_t tmpcntr=0;
 809                     ; 253   tmpcntr = TIM6->CNTR;
 811  0000 c65346        	ld	a,21318
 813                     ; 255   return ((uint8_t)tmpcntr);
 817  0003 81            	ret	
 841                     ; 263 TIM6_Prescaler_TypeDef TIM6_GetPrescaler(void)
 841                     ; 264 {
 842                     .text:	section	.text,new
 843  0000               _TIM6_GetPrescaler:
 847                     ; 266   return ((TIM6_Prescaler_TypeDef)TIM6->PSCR);
 849  0000 c65347        	ld	a,21319
 852  0003 81            	ret	
 917                     ; 280 void TIM6_ITConfig(TIM6_IT_TypeDef TIM6_IT, FunctionalState NewState)
 917                     ; 281 {
 918                     .text:	section	.text,new
 919  0000               _TIM6_ITConfig:
 921  0000 89            	pushw	x
 922       00000000      OFST:	set	0
 925                     ; 283   assert_param(IS_TIM6_IT_OK(TIM6_IT));
 927                     ; 284   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 929                     ; 286   if (NewState == ENABLE)
 931  0001 9f            	ld	a,xl
 932  0002 4a            	dec	a
 933  0003 2606          	jrne	L324
 934                     ; 289     TIM6->IER |= (uint8_t)TIM6_IT;
 936  0005 9e            	ld	a,xh
 937  0006 ca5343        	or	a,21315
 939  0009 2006          	jra	L524
 940  000b               L324:
 941                     ; 294     TIM6->IER &= (uint8_t)(~(uint8_t)TIM6_IT);
 943  000b 7b01          	ld	a,(OFST+1,sp)
 944  000d 43            	cpl	a
 945  000e c45343        	and	a,21315
 946  0011               L524:
 947  0011 c75343        	ld	21315,a
 948                     ; 296 }
 951  0014 85            	popw	x
 952  0015 81            	ret	
1007                     ; 304 void TIM6_ClearFlag(TIM6_FLAG_TypeDef TIM6_FLAG)
1007                     ; 305 {
1008                     .text:	section	.text,new
1009  0000               _TIM6_ClearFlag:
1013                     ; 307   assert_param(IS_TIM6_CLEAR_FLAG_OK((uint8_t)TIM6_FLAG));
1015                     ; 309   TIM6->SR1 &= (uint8_t)(~((uint8_t)TIM6_FLAG));
1017  0000 43            	cpl	a
1018  0001 c45344        	and	a,21316
1019  0004 c75344        	ld	21316,a
1020                     ; 310 }
1023  0007 81            	ret	
1107                     ; 319 ITStatus TIM6_GetITStatus(TIM6_IT_TypeDef TIM6_IT)
1107                     ; 320 {
1108                     .text:	section	.text,new
1109  0000               _TIM6_GetITStatus:
1111  0000 88            	push	a
1112  0001 89            	pushw	x
1113       00000002      OFST:	set	2
1116                     ; 321   ITStatus bitstatus = RESET;
1118                     ; 322   uint8_t itStatus = 0, itEnable = 0;
1122                     ; 325   assert_param(IS_TIM6_GET_IT_OK(TIM6_IT));
1124                     ; 327   itStatus = (uint8_t)(TIM6->SR1 & (uint8_t)TIM6_IT);
1126  0002 c45344        	and	a,21316
1127  0005 6b01          	ld	(OFST-1,sp),a
1129                     ; 329   itEnable = (uint8_t)(TIM6->IER & (uint8_t)TIM6_IT);
1131  0007 c65343        	ld	a,21315
1132  000a 1403          	and	a,(OFST+1,sp)
1133  000c 6b02          	ld	(OFST+0,sp),a
1135                     ; 331   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1137  000e 7b01          	ld	a,(OFST-1,sp)
1138  0010 2708          	jreq	L715
1140  0012 7b02          	ld	a,(OFST+0,sp)
1141  0014 2704          	jreq	L715
1142                     ; 333     bitstatus = (ITStatus)SET;
1144  0016 a601          	ld	a,#1
1147  0018 2001          	jra	L125
1148  001a               L715:
1149                     ; 337     bitstatus = (ITStatus)RESET;
1151  001a 4f            	clr	a
1153  001b               L125:
1154                     ; 339   return ((ITStatus)bitstatus);
1158  001b 5b03          	addw	sp,#3
1159  001d 81            	ret	
1216                     ; 348 void TIM6_GenerateEvent(TIM6_EventSource_TypeDef TIM6_EventSource)
1216                     ; 349 {
1217                     .text:	section	.text,new
1218  0000               _TIM6_GenerateEvent:
1222                     ; 351   assert_param(IS_TIM6_EVENT_SOURCE_OK((uint8_t)TIM6_EventSource));
1224                     ; 354   TIM6->EGR |= (uint8_t)TIM6_EventSource;
1226  0000 ca5345        	or	a,21317
1227  0003 c75345        	ld	21317,a
1228                     ; 355 }
1231  0006 81            	ret	
1277                     ; 364 FlagStatus TIM6_GetFlagStatus(TIM6_FLAG_TypeDef TIM6_FLAG)
1277                     ; 365 {
1278                     .text:	section	.text,new
1279  0000               _TIM6_GetFlagStatus:
1281  0000 88            	push	a
1282       00000001      OFST:	set	1
1285                     ; 366   volatile FlagStatus bitstatus = RESET;
1287  0001 0f01          	clr	(OFST+0,sp)
1289                     ; 369   assert_param(IS_TIM6_GET_FLAG_OK(TIM6_FLAG));
1291                     ; 371   if ((TIM6->SR1 & (uint8_t)TIM6_FLAG)  != 0)
1293  0003 c45344        	and	a,21316
1294  0006 2702          	jreq	L375
1295                     ; 373     bitstatus = SET;
1297  0008 a601          	ld	a,#1
1299  000a               L375:
1300                     ; 377     bitstatus = RESET;
1302  000a 6b01          	ld	(OFST+0,sp),a
1304                     ; 379   return ((FlagStatus)bitstatus);
1306  000c 7b01          	ld	a,(OFST+0,sp)
1309  000e 5b01          	addw	sp,#1
1310  0010 81            	ret	
1346                     ; 388 void TIM6_ClearITPendingBit(TIM6_IT_TypeDef TIM6_IT)
1346                     ; 389 {
1347                     .text:	section	.text,new
1348  0000               _TIM6_ClearITPendingBit:
1352                     ; 391   assert_param(IS_TIM6_IT_OK(TIM6_IT));
1354                     ; 394   TIM6->SR1 &= (uint8_t)(~(uint8_t)TIM6_IT);
1356  0000 43            	cpl	a
1357  0001 c45344        	and	a,21316
1358  0004 c75344        	ld	21316,a
1359                     ; 395 }
1362  0007 81            	ret	
1437                     ; 403 void TIM6_SelectOutputTrigger(TIM6_TRGOSource_TypeDef TIM6_TRGOSource)
1437                     ; 404 {
1438                     .text:	section	.text,new
1439  0000               _TIM6_SelectOutputTrigger:
1441  0000 88            	push	a
1442  0001 88            	push	a
1443       00000001      OFST:	set	1
1446                     ; 405   uint8_t tmpcr2 = 0;
1448                     ; 408   assert_param(IS_TIM6_TRGO_SOURCE_OK(TIM6_TRGOSource));
1450                     ; 410   tmpcr2 = TIM6->CR2;
1452  0002 c65341        	ld	a,21313
1454                     ; 413   tmpcr2 &= (uint8_t)(~TIM6_CR2_MMS);
1456  0005 a48f          	and	a,#143
1458                     ; 416   tmpcr2 |=  (uint8_t)TIM6_TRGOSource;
1460  0007 1a02          	or	a,(OFST+1,sp)
1462                     ; 418   TIM6->CR2 = tmpcr2;
1464  0009 c75341        	ld	21313,a
1465                     ; 419 }
1468  000c 85            	popw	x
1469  000d 81            	ret	
1505                     ; 428 void TIM6_SelectMasterSlaveMode(FunctionalState NewState)
1505                     ; 429 {
1506                     .text:	section	.text,new
1507  0000               _TIM6_SelectMasterSlaveMode:
1511                     ; 431   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1513                     ; 434   if (NewState == ENABLE)
1515  0000 4a            	dec	a
1516  0001 2605          	jrne	L766
1517                     ; 436     TIM6->SMCR |= TIM6_SMCR_MSM;
1519  0003 721e5342      	bset	21314,#7
1522  0007 81            	ret	
1523  0008               L766:
1524                     ; 440     TIM6->SMCR &= (uint8_t)(~TIM6_SMCR_MSM);
1526  0008 721f5342      	bres	21314,#7
1527                     ; 442 }
1530  000c 81            	ret	
1596                     ; 450 void TIM6_SelectInputTrigger(TIM6_TS_TypeDef TIM6_InputTriggerSource)
1596                     ; 451 {
1597                     .text:	section	.text,new
1598  0000               _TIM6_SelectInputTrigger:
1600  0000 88            	push	a
1601  0001 88            	push	a
1602       00000001      OFST:	set	1
1605                     ; 452   uint8_t tmpsmcr = 0;
1607                     ; 455   assert_param(IS_TIM6_TRIGGER_SELECTION_OK(TIM6_InputTriggerSource));
1609                     ; 457   tmpsmcr = TIM6->SMCR;
1611  0002 c65342        	ld	a,21314
1613                     ; 460   tmpsmcr &= (uint8_t)(~TIM6_SMCR_TS);
1615  0005 a48f          	and	a,#143
1617                     ; 461   tmpsmcr |= (uint8_t)TIM6_InputTriggerSource;
1619  0007 1a02          	or	a,(OFST+1,sp)
1621                     ; 463   TIM6->SMCR = (uint8_t)tmpsmcr;
1623  0009 c75342        	ld	21314,a
1624                     ; 464 }
1627  000c 85            	popw	x
1628  000d 81            	ret	
1652                     ; 471 void TIM6_InternalClockConfig(void)
1652                     ; 472 {
1653                     .text:	section	.text,new
1654  0000               _TIM6_InternalClockConfig:
1658                     ; 474   TIM6->SMCR &=  (uint8_t)(~TIM6_SMCR_SMS);
1660  0000 c65342        	ld	a,21314
1661  0003 a4f8          	and	a,#248
1662  0005 c75342        	ld	21314,a
1663                     ; 475 }
1666  0008 81            	ret	
1757                     ; 483 void TIM6_SelectSlaveMode(TIM6_SlaveMode_TypeDef TIM6_SlaveMode)
1757                     ; 484 {
1758                     .text:	section	.text,new
1759  0000               _TIM6_SelectSlaveMode:
1761  0000 88            	push	a
1762  0001 88            	push	a
1763       00000001      OFST:	set	1
1766                     ; 485   uint8_t tmpsmcr = 0;
1768                     ; 488   assert_param(IS_TIM6_SLAVE_MODE_OK(TIM6_SlaveMode));
1770                     ; 490   tmpsmcr = TIM6->SMCR;
1772  0002 c65342        	ld	a,21314
1774                     ; 493   tmpsmcr &= (uint8_t)(~TIM6_SMCR_SMS);
1776  0005 a4f8          	and	a,#248
1778                     ; 496   tmpsmcr |= (uint8_t)TIM6_SlaveMode;
1780  0007 1a02          	or	a,(OFST+1,sp)
1782                     ; 498   TIM6->SMCR = tmpsmcr;
1784  0009 c75342        	ld	21314,a
1785                     ; 499 }
1788  000c 85            	popw	x
1789  000d 81            	ret	
1802                     	xdef	_TIM6_SelectSlaveMode
1803                     	xdef	_TIM6_InternalClockConfig
1804                     	xdef	_TIM6_SelectInputTrigger
1805                     	xdef	_TIM6_SelectMasterSlaveMode
1806                     	xdef	_TIM6_SelectOutputTrigger
1807                     	xdef	_TIM6_ClearITPendingBit
1808                     	xdef	_TIM6_GetFlagStatus
1809                     	xdef	_TIM6_GenerateEvent
1810                     	xdef	_TIM6_GetITStatus
1811                     	xdef	_TIM6_ClearFlag
1812                     	xdef	_TIM6_ITConfig
1813                     	xdef	_TIM6_GetPrescaler
1814                     	xdef	_TIM6_GetCounter
1815                     	xdef	_TIM6_SetAutoreload
1816                     	xdef	_TIM6_SetCounter
1817                     	xdef	_TIM6_ARRPreloadConfig
1818                     	xdef	_TIM6_PrescalerConfig
1819                     	xdef	_TIM6_SelectOnePulseMode
1820                     	xdef	_TIM6_UpdateRequestConfig
1821                     	xdef	_TIM6_UpdateDisableConfig
1822                     	xdef	_TIM6_Cmd
1823                     	xdef	_TIM6_TimeBaseInit
1824                     	xdef	_TIM6_DeInit
1843                     	end
