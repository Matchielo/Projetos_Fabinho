   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
   4                     ; Optimizer V4.6.4 - 15 Jan 2025
  48                     ; 52 void TIM5_DeInit(void)
  48                     ; 53 {
  50                     .text:	section	.text,new
  51  0000               _TIM5_DeInit:
  55                     ; 54   TIM5->CR1 = (uint8_t)TIM5_CR1_RESET_VALUE;
  57  0000 725f5300      	clr	21248
  58                     ; 55   TIM5->CR2 = TIM5_CR2_RESET_VALUE;
  60  0004 725f5301      	clr	21249
  61                     ; 56   TIM5->SMCR = TIM5_SMCR_RESET_VALUE;
  63  0008 725f5302      	clr	21250
  64                     ; 57   TIM5->IER = (uint8_t)TIM5_IER_RESET_VALUE;
  66  000c 725f5303      	clr	21251
  67                     ; 58   TIM5->SR2 = (uint8_t)TIM5_SR2_RESET_VALUE;
  69  0010 725f5305      	clr	21253
  70                     ; 61   TIM5->CCER1 = (uint8_t)TIM5_CCER1_RESET_VALUE;
  72  0014 725f530a      	clr	21258
  73                     ; 62   TIM5->CCER2 = (uint8_t)TIM5_CCER2_RESET_VALUE;
  75  0018 725f530b      	clr	21259
  76                     ; 65   TIM5->CCER1 = (uint8_t)TIM5_CCER1_RESET_VALUE;
  78  001c 725f530a      	clr	21258
  79                     ; 66   TIM5->CCER2 = (uint8_t)TIM5_CCER2_RESET_VALUE;
  81  0020 725f530b      	clr	21259
  82                     ; 67   TIM5->CCMR1 = (uint8_t)TIM5_CCMR1_RESET_VALUE;
  84  0024 725f5307      	clr	21255
  85                     ; 68   TIM5->CCMR2 = (uint8_t)TIM5_CCMR2_RESET_VALUE;
  87  0028 725f5308      	clr	21256
  88                     ; 69   TIM5->CCMR3 = (uint8_t)TIM5_CCMR3_RESET_VALUE;
  90  002c 725f5309      	clr	21257
  91                     ; 70   TIM5->CNTRH = (uint8_t)TIM5_CNTRH_RESET_VALUE;
  93  0030 725f530c      	clr	21260
  94                     ; 71   TIM5->CNTRL = (uint8_t)TIM5_CNTRL_RESET_VALUE;
  96  0034 725f530d      	clr	21261
  97                     ; 72   TIM5->PSCR	= (uint8_t)TIM5_PSCR_RESET_VALUE;
  99  0038 725f530e      	clr	21262
 100                     ; 73   TIM5->ARRH 	= (uint8_t)TIM5_ARRH_RESET_VALUE;
 102  003c 35ff530f      	mov	21263,#255
 103                     ; 74   TIM5->ARRL 	= (uint8_t)TIM5_ARRL_RESET_VALUE;
 105  0040 35ff5310      	mov	21264,#255
 106                     ; 75   TIM5->CCR1H = (uint8_t)TIM5_CCR1H_RESET_VALUE;
 108  0044 725f5311      	clr	21265
 109                     ; 76   TIM5->CCR1L = (uint8_t)TIM5_CCR1L_RESET_VALUE;
 111  0048 725f5312      	clr	21266
 112                     ; 77   TIM5->CCR2H = (uint8_t)TIM5_CCR2H_RESET_VALUE;
 114  004c 725f5313      	clr	21267
 115                     ; 78   TIM5->CCR2L = (uint8_t)TIM5_CCR2L_RESET_VALUE;
 117  0050 725f5314      	clr	21268
 118                     ; 79   TIM5->CCR3H = (uint8_t)TIM5_CCR3H_RESET_VALUE;
 120  0054 725f5315      	clr	21269
 121                     ; 80   TIM5->CCR3L = (uint8_t)TIM5_CCR3L_RESET_VALUE;
 123  0058 725f5316      	clr	21270
 124                     ; 81   TIM5->SR1 = (uint8_t)TIM5_SR1_RESET_VALUE;
 126  005c 725f5304      	clr	21252
 127                     ; 82 }
 130  0060 81            	ret	
 298                     ; 90 void TIM5_TimeBaseInit( TIM5_Prescaler_TypeDef TIM5_Prescaler,
 298                     ; 91                         uint16_t TIM5_Period)
 298                     ; 92 {
 299                     .text:	section	.text,new
 300  0000               _TIM5_TimeBaseInit:
 302       ffffffff      OFST: set -1
 305                     ; 94   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 307  0000 c7530e        	ld	21262,a
 308                     ; 96   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 310  0003 7b03          	ld	a,(OFST+4,sp)
 311  0005 c7530f        	ld	21263,a
 312                     ; 97   TIM5->ARRL = (uint8_t)(TIM5_Period);
 314  0008 7b04          	ld	a,(OFST+5,sp)
 315  000a c75310        	ld	21264,a
 316                     ; 98 }
 319  000d 81            	ret	
 476                     ; 108 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
 476                     ; 109                   TIM5_OutputState_TypeDef TIM5_OutputState,
 476                     ; 110                   uint16_t TIM5_Pulse,
 476                     ; 111                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
 476                     ; 112 {
 477                     .text:	section	.text,new
 478  0000               _TIM5_OC1Init:
 480  0000 89            	pushw	x
 481  0001 88            	push	a
 482       00000001      OFST:	set	1
 485                     ; 114   assert_param(IS_TIM5_OC_MODE_OK(TIM5_OCMode));
 487                     ; 115   assert_param(IS_TIM5_OUTPUT_STATE_OK(TIM5_OutputState));
 489                     ; 116   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
 491                     ; 119   TIM5->CCER1 &= (uint8_t)(~( TIM5_CCER1_CC1E | TIM5_CCER1_CC1P));
 493  0002 c6530a        	ld	a,21258
 494  0005 a4fc          	and	a,#252
 495  0007 c7530a        	ld	21258,a
 496                     ; 121   TIM5->CCER1 |= (uint8_t)((uint8_t)(TIM5_OutputState & TIM5_CCER1_CC1E )| 
 496                     ; 122                            (uint8_t)(TIM5_OCPolarity & TIM5_CCER1_CC1P));
 498  000a 7b08          	ld	a,(OFST+7,sp)
 499  000c a402          	and	a,#2
 500  000e 6b01          	ld	(OFST+0,sp),a
 502  0010 9f            	ld	a,xl
 503  0011 a401          	and	a,#1
 504  0013 1a01          	or	a,(OFST+0,sp)
 505  0015 ca530a        	or	a,21258
 506  0018 c7530a        	ld	21258,a
 507                     ; 125   TIM5->CCMR1 = (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~TIM5_CCMR_OCM)) | 
 507                     ; 126                           (uint8_t)TIM5_OCMode);
 509  001b c65307        	ld	a,21255
 510  001e a48f          	and	a,#143
 511  0020 1a02          	or	a,(OFST+1,sp)
 512  0022 c75307        	ld	21255,a
 513                     ; 129   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
 515  0025 7b06          	ld	a,(OFST+5,sp)
 516  0027 c75311        	ld	21265,a
 517                     ; 130   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
 519  002a 7b07          	ld	a,(OFST+6,sp)
 520  002c c75312        	ld	21266,a
 521                     ; 131 }
 524  002f 5b03          	addw	sp,#3
 525  0031 81            	ret	
 589                     ; 141 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
 589                     ; 142                   TIM5_OutputState_TypeDef TIM5_OutputState,
 589                     ; 143                   uint16_t TIM5_Pulse,
 589                     ; 144                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
 589                     ; 145 {
 590                     .text:	section	.text,new
 591  0000               _TIM5_OC2Init:
 593  0000 89            	pushw	x
 594  0001 88            	push	a
 595       00000001      OFST:	set	1
 598                     ; 147   assert_param(IS_TIM5_OC_MODE_OK(TIM5_OCMode));
 600                     ; 148   assert_param(IS_TIM5_OUTPUT_STATE_OK(TIM5_OutputState));
 602                     ; 149   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
 604                     ; 152   TIM5->CCER1 &= (uint8_t)(~( TIM5_CCER1_CC2E |  TIM5_CCER1_CC2P ));
 606  0002 c6530a        	ld	a,21258
 607  0005 a4cf          	and	a,#207
 608  0007 c7530a        	ld	21258,a
 609                     ; 154   TIM5->CCER1 |= (uint8_t)((uint8_t)(TIM5_OutputState  & TIM5_CCER1_CC2E )| \
 609                     ; 155     (uint8_t)(TIM5_OCPolarity & TIM5_CCER1_CC2P));
 611  000a 7b08          	ld	a,(OFST+7,sp)
 612  000c a420          	and	a,#32
 613  000e 6b01          	ld	(OFST+0,sp),a
 615  0010 9f            	ld	a,xl
 616  0011 a410          	and	a,#16
 617  0013 1a01          	or	a,(OFST+0,sp)
 618  0015 ca530a        	or	a,21258
 619  0018 c7530a        	ld	21258,a
 620                     ; 159   TIM5->CCMR2 = (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~TIM5_CCMR_OCM)) |
 620                     ; 160                           (uint8_t)TIM5_OCMode);
 622  001b c65308        	ld	a,21256
 623  001e a48f          	and	a,#143
 624  0020 1a02          	or	a,(OFST+1,sp)
 625  0022 c75308        	ld	21256,a
 626                     ; 163   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
 628  0025 7b06          	ld	a,(OFST+5,sp)
 629  0027 c75313        	ld	21267,a
 630                     ; 164   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
 632  002a 7b07          	ld	a,(OFST+6,sp)
 633  002c c75314        	ld	21268,a
 634                     ; 165 }
 637  002f 5b03          	addw	sp,#3
 638  0031 81            	ret	
 702                     ; 175 void TIM5_OC3Init(TIM5_OCMode_TypeDef TIM5_OCMode,
 702                     ; 176                   TIM5_OutputState_TypeDef TIM5_OutputState,
 702                     ; 177                   uint16_t TIM5_Pulse,
 702                     ; 178                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
 702                     ; 179 {
 703                     .text:	section	.text,new
 704  0000               _TIM5_OC3Init:
 706  0000 89            	pushw	x
 707  0001 88            	push	a
 708       00000001      OFST:	set	1
 711                     ; 181   assert_param(IS_TIM5_OC_MODE_OK(TIM5_OCMode));
 713                     ; 182   assert_param(IS_TIM5_OUTPUT_STATE_OK(TIM5_OutputState));
 715                     ; 183   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
 717                     ; 185   TIM5->CCER2 &= (uint8_t)(~( TIM5_CCER2_CC3E  | TIM5_CCER2_CC3P));
 719  0002 c6530b        	ld	a,21259
 720  0005 a4fc          	and	a,#252
 721  0007 c7530b        	ld	21259,a
 722                     ; 187   TIM5->CCER2 |= (uint8_t)((uint8_t)(TIM5_OutputState  & TIM5_CCER2_CC3E   )|
 722                     ; 188                            (uint8_t)(TIM5_OCPolarity   & TIM5_CCER2_CC3P   ));
 724  000a 7b08          	ld	a,(OFST+7,sp)
 725  000c a402          	and	a,#2
 726  000e 6b01          	ld	(OFST+0,sp),a
 728  0010 9f            	ld	a,xl
 729  0011 a401          	and	a,#1
 730  0013 1a01          	or	a,(OFST+0,sp)
 731  0015 ca530b        	or	a,21259
 732  0018 c7530b        	ld	21259,a
 733                     ; 191   TIM5->CCMR3 = (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~TIM5_CCMR_OCM)) | (uint8_t)TIM5_OCMode);
 735  001b c65309        	ld	a,21257
 736  001e a48f          	and	a,#143
 737  0020 1a02          	or	a,(OFST+1,sp)
 738  0022 c75309        	ld	21257,a
 739                     ; 194   TIM5->CCR3H = (uint8_t)(TIM5_Pulse >> 8);
 741  0025 7b06          	ld	a,(OFST+5,sp)
 742  0027 c75315        	ld	21269,a
 743                     ; 195   TIM5->CCR3L = (uint8_t)(TIM5_Pulse);
 745  002a 7b07          	ld	a,(OFST+6,sp)
 746  002c c75316        	ld	21270,a
 747                     ; 196 }
 750  002f 5b03          	addw	sp,#3
 751  0031 81            	ret	
 944                     ; 207 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
 944                     ; 208                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
 944                     ; 209                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
 944                     ; 210                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
 944                     ; 211                  uint8_t TIM5_ICFilter)
 944                     ; 212 {
 945                     .text:	section	.text,new
 946  0000               _TIM5_ICInit:
 948  0000 89            	pushw	x
 949       00000000      OFST:	set	0
 952                     ; 214   assert_param(IS_TIM5_CHANNEL_OK(TIM5_Channel));
 954                     ; 215   assert_param(IS_TIM5_IC_POLARITY_OK(TIM5_ICPolarity));
 956                     ; 216   assert_param(IS_TIM5_IC_SELECTION_OK(TIM5_ICSelection));
 958                     ; 217   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_ICPrescaler));
 960                     ; 218   assert_param(IS_TIM5_IC_FILTER_OK(TIM5_ICFilter));
 962                     ; 220   if (TIM5_Channel == TIM5_CHANNEL_1)
 964  0001 9e            	ld	a,xh
 965  0002 4d            	tnz	a
 966  0003 2614          	jrne	L104
 967                     ; 223     TI1_Config((uint8_t)TIM5_ICPolarity,
 967                     ; 224                (uint8_t)TIM5_ICSelection,
 967                     ; 225                (uint8_t)TIM5_ICFilter);
 969  0005 7b07          	ld	a,(OFST+7,sp)
 970  0007 88            	push	a
 971  0008 7b06          	ld	a,(OFST+6,sp)
 972  000a 97            	ld	xl,a
 973  000b 7b03          	ld	a,(OFST+3,sp)
 974  000d 95            	ld	xh,a
 975  000e cd0000        	call	L3_TI1_Config
 977  0011 84            	pop	a
 978                     ; 228     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
 980  0012 7b06          	ld	a,(OFST+6,sp)
 981  0014 cd0000        	call	_TIM5_SetIC1Prescaler
 984  0017 202b          	jra	L304
 985  0019               L104:
 986                     ; 230   else if (TIM5_Channel == TIM5_CHANNEL_2)
 988  0019 7b01          	ld	a,(OFST+1,sp)
 989  001b 4a            	dec	a
 990  001c 2614          	jrne	L504
 991                     ; 233     TI2_Config((uint8_t)TIM5_ICPolarity,
 991                     ; 234                (uint8_t)TIM5_ICSelection,
 991                     ; 235                (uint8_t)TIM5_ICFilter);
 993  001e 7b07          	ld	a,(OFST+7,sp)
 994  0020 88            	push	a
 995  0021 7b06          	ld	a,(OFST+6,sp)
 996  0023 97            	ld	xl,a
 997  0024 7b03          	ld	a,(OFST+3,sp)
 998  0026 95            	ld	xh,a
 999  0027 cd0000        	call	L5_TI2_Config
1001  002a 84            	pop	a
1002                     ; 238     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
1004  002b 7b06          	ld	a,(OFST+6,sp)
1005  002d cd0000        	call	_TIM5_SetIC2Prescaler
1008  0030 2012          	jra	L304
1009  0032               L504:
1010                     ; 243     TI3_Config((uint8_t)TIM5_ICPolarity,
1010                     ; 244                (uint8_t)TIM5_ICSelection,
1010                     ; 245                (uint8_t)TIM5_ICFilter);
1012  0032 7b07          	ld	a,(OFST+7,sp)
1013  0034 88            	push	a
1014  0035 7b06          	ld	a,(OFST+6,sp)
1015  0037 97            	ld	xl,a
1016  0038 7b03          	ld	a,(OFST+3,sp)
1017  003a 95            	ld	xh,a
1018  003b cd0000        	call	L7_TI3_Config
1020  003e 84            	pop	a
1021                     ; 248     TIM5_SetIC3Prescaler(TIM5_ICPrescaler);
1023  003f 7b06          	ld	a,(OFST+6,sp)
1024  0041 cd0000        	call	_TIM5_SetIC3Prescaler
1026  0044               L304:
1027                     ; 250 }
1030  0044 85            	popw	x
1031  0045 81            	ret	
1127                     ; 261 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
1127                     ; 262                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
1127                     ; 263                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
1127                     ; 264                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
1127                     ; 265                      uint8_t TIM5_ICFilter)
1127                     ; 266 {
1128                     .text:	section	.text,new
1129  0000               _TIM5_PWMIConfig:
1131  0000 89            	pushw	x
1132  0001 89            	pushw	x
1133       00000002      OFST:	set	2
1136                     ; 267   uint8_t icpolarity = (uint8_t)TIM5_ICPOLARITY_RISING;
1138                     ; 268   uint8_t icselection = (uint8_t)TIM5_ICSELECTION_DIRECTTI;
1140                     ; 271   assert_param(IS_TIM5_PWMI_CHANNEL_OK(TIM5_Channel));
1142                     ; 272   assert_param(IS_TIM5_IC_POLARITY_OK(TIM5_ICPolarity));
1144                     ; 273   assert_param(IS_TIM5_IC_SELECTION_OK(TIM5_ICSelection));
1146                     ; 274   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_ICPrescaler));
1148                     ; 277   if (TIM5_ICPolarity != TIM5_ICPOLARITY_FALLING)
1150  0002 9f            	ld	a,xl
1151  0003 a144          	cp	a,#68
1152  0005 2706          	jreq	L754
1153                     ; 279     icpolarity = (uint8_t)TIM5_ICPOLARITY_FALLING;
1155  0007 a644          	ld	a,#68
1156  0009 6b01          	ld	(OFST-1,sp),a
1159  000b 2002          	jra	L164
1160  000d               L754:
1161                     ; 283     icpolarity = (uint8_t)TIM5_ICPOLARITY_RISING;
1163  000d 0f01          	clr	(OFST-1,sp)
1165  000f               L164:
1166                     ; 287   if (TIM5_ICSelection == TIM5_ICSELECTION_DIRECTTI)
1168  000f 7b07          	ld	a,(OFST+5,sp)
1169  0011 4a            	dec	a
1170  0012 2604          	jrne	L364
1171                     ; 289     icselection = (uint8_t)TIM5_ICSELECTION_INDIRECTTI;
1173  0014 a602          	ld	a,#2
1175  0016 2002          	jra	L564
1176  0018               L364:
1177                     ; 293     icselection = (uint8_t)TIM5_ICSELECTION_DIRECTTI;
1179  0018 a601          	ld	a,#1
1180  001a               L564:
1181  001a 6b02          	ld	(OFST+0,sp),a
1183                     ; 296   if (TIM5_Channel == TIM5_CHANNEL_1)
1185  001c 7b03          	ld	a,(OFST+1,sp)
1186  001e 2626          	jrne	L764
1187                     ; 299     TI1_Config((uint8_t)TIM5_ICPolarity, (uint8_t)TIM5_ICSelection,
1187                     ; 300                (uint8_t)TIM5_ICFilter);
1189  0020 7b09          	ld	a,(OFST+7,sp)
1190  0022 88            	push	a
1191  0023 7b08          	ld	a,(OFST+6,sp)
1192  0025 97            	ld	xl,a
1193  0026 7b05          	ld	a,(OFST+3,sp)
1194  0028 95            	ld	xh,a
1195  0029 cd0000        	call	L3_TI1_Config
1197  002c 84            	pop	a
1198                     ; 303     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
1200  002d 7b08          	ld	a,(OFST+6,sp)
1201  002f cd0000        	call	_TIM5_SetIC1Prescaler
1203                     ; 306     TI2_Config((uint8_t)icpolarity, (uint8_t)icselection, (uint8_t)TIM5_ICFilter);
1205  0032 7b09          	ld	a,(OFST+7,sp)
1206  0034 88            	push	a
1207  0035 7b03          	ld	a,(OFST+1,sp)
1208  0037 97            	ld	xl,a
1209  0038 7b02          	ld	a,(OFST+0,sp)
1210  003a 95            	ld	xh,a
1211  003b cd0000        	call	L5_TI2_Config
1213  003e 84            	pop	a
1214                     ; 309     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
1216  003f 7b08          	ld	a,(OFST+6,sp)
1217  0041 cd0000        	call	_TIM5_SetIC2Prescaler
1220  0044 2024          	jra	L174
1221  0046               L764:
1222                     ; 314     TI2_Config((uint8_t)TIM5_ICPolarity, (uint8_t)TIM5_ICSelection,
1222                     ; 315                (uint8_t)TIM5_ICFilter);
1224  0046 7b09          	ld	a,(OFST+7,sp)
1225  0048 88            	push	a
1226  0049 7b08          	ld	a,(OFST+6,sp)
1227  004b 97            	ld	xl,a
1228  004c 7b05          	ld	a,(OFST+3,sp)
1229  004e 95            	ld	xh,a
1230  004f cd0000        	call	L5_TI2_Config
1232  0052 84            	pop	a
1233                     ; 318     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
1235  0053 7b08          	ld	a,(OFST+6,sp)
1236  0055 cd0000        	call	_TIM5_SetIC2Prescaler
1238                     ; 321     TI1_Config((uint8_t)icpolarity, (uint8_t)icselection, (uint8_t)TIM5_ICFilter);
1240  0058 7b09          	ld	a,(OFST+7,sp)
1241  005a 88            	push	a
1242  005b 7b03          	ld	a,(OFST+1,sp)
1243  005d 97            	ld	xl,a
1244  005e 7b02          	ld	a,(OFST+0,sp)
1245  0060 95            	ld	xh,a
1246  0061 cd0000        	call	L3_TI1_Config
1248  0064 84            	pop	a
1249                     ; 324     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
1251  0065 7b08          	ld	a,(OFST+6,sp)
1252  0067 cd0000        	call	_TIM5_SetIC1Prescaler
1254  006a               L174:
1255                     ; 326 }
1258  006a 5b04          	addw	sp,#4
1259  006c 81            	ret	
1314                     ; 334 void TIM5_Cmd(FunctionalState NewState)
1314                     ; 335 {
1315                     .text:	section	.text,new
1316  0000               _TIM5_Cmd:
1320                     ; 337   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1322                     ; 340   if (NewState != DISABLE)
1324  0000 4d            	tnz	a
1325  0001 2705          	jreq	L125
1326                     ; 342     TIM5->CR1 |= TIM5_CR1_CEN ;
1328  0003 72105300      	bset	21248,#0
1331  0007 81            	ret	
1332  0008               L125:
1333                     ; 346     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_CEN) ;
1335  0008 72115300      	bres	21248,#0
1336                     ; 348 }
1339  000c 81            	ret	
1425                     ; 363 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
1425                     ; 364 {
1426                     .text:	section	.text,new
1427  0000               _TIM5_ITConfig:
1429  0000 89            	pushw	x
1430       00000000      OFST:	set	0
1433                     ; 366   assert_param(IS_TIM5_IT_OK(TIM5_IT));
1435                     ; 367   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1437                     ; 369   if (NewState != DISABLE)
1439  0001 9f            	ld	a,xl
1440  0002 4d            	tnz	a
1441  0003 2706          	jreq	L565
1442                     ; 372     TIM5->IER |= (uint8_t)TIM5_IT;
1444  0005 9e            	ld	a,xh
1445  0006 ca5303        	or	a,21251
1447  0009 2006          	jra	L765
1448  000b               L565:
1449                     ; 377     TIM5->IER &= (uint8_t)(~TIM5_IT);
1451  000b 7b01          	ld	a,(OFST+1,sp)
1452  000d 43            	cpl	a
1453  000e c45303        	and	a,21251
1454  0011               L765:
1455  0011 c75303        	ld	21251,a
1456                     ; 379 }
1459  0014 85            	popw	x
1460  0015 81            	ret	
1496                     ; 387 void TIM5_UpdateDisableConfig(FunctionalState NewState)
1496                     ; 388 {
1497                     .text:	section	.text,new
1498  0000               _TIM5_UpdateDisableConfig:
1502                     ; 390   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1504                     ; 393   if (NewState != DISABLE)
1506  0000 4d            	tnz	a
1507  0001 2705          	jreq	L706
1508                     ; 395     TIM5->CR1 |= TIM5_CR1_UDIS ;
1510  0003 72125300      	bset	21248,#1
1513  0007 81            	ret	
1514  0008               L706:
1515                     ; 399     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_UDIS) ;
1517  0008 72135300      	bres	21248,#1
1518                     ; 401 }
1521  000c 81            	ret	
1579                     ; 411 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
1579                     ; 412 {
1580                     .text:	section	.text,new
1581  0000               _TIM5_UpdateRequestConfig:
1585                     ; 414   assert_param(IS_TIM5_UPDATE_SOURCE_OK(TIM5_UpdateSource));
1587                     ; 417   if (TIM5_UpdateSource != TIM5_UPDATESOURCE_GLOBAL)
1589  0000 4d            	tnz	a
1590  0001 2705          	jreq	L146
1591                     ; 419     TIM5->CR1 |= TIM5_CR1_URS ;
1593  0003 72145300      	bset	21248,#2
1596  0007 81            	ret	
1597  0008               L146:
1598                     ; 423     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_URS) ;
1600  0008 72155300      	bres	21248,#2
1601                     ; 425 }
1604  000c 81            	ret	
1661                     ; 435 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1661                     ; 436 {
1662                     .text:	section	.text,new
1663  0000               _TIM5_SelectOnePulseMode:
1667                     ; 438   assert_param(IS_TIM5_OPM_MODE_OK(TIM5_OPMode));
1669                     ; 441   if (TIM5_OPMode != TIM5_OPMODE_REPETITIVE)
1671  0000 4d            	tnz	a
1672  0001 2705          	jreq	L376
1673                     ; 443     TIM5->CR1 |= TIM5_CR1_OPM ;
1675  0003 72165300      	bset	21248,#3
1678  0007 81            	ret	
1679  0008               L376:
1680                     ; 447     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_OPM) ;
1682  0008 72175300      	bres	21248,#3
1683                     ; 449 }
1686  000c 81            	ret	
1754                     ; 479 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
1754                     ; 480                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
1754                     ; 481 {
1755                     .text:	section	.text,new
1756  0000               _TIM5_PrescalerConfig:
1760                     ; 483   assert_param(IS_TIM5_PRESCALER_RELOAD_OK(TIM5_PSCReloadMode));
1762                     ; 484   assert_param(IS_TIM5_PRESCALER_OK(Prescaler));
1764                     ; 487   TIM5->PSCR = (uint8_t)Prescaler;
1766  0000 9e            	ld	a,xh
1767  0001 c7530e        	ld	21262,a
1768                     ; 490   TIM5->EGR = (uint8_t)TIM5_PSCReloadMode ;
1770  0004 9f            	ld	a,xl
1771  0005 c75306        	ld	21254,a
1772                     ; 491 }
1775  0008 81            	ret	
1833                     ; 502 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
1833                     ; 503 {
1834                     .text:	section	.text,new
1835  0000               _TIM5_ForcedOC1Config:
1837  0000 88            	push	a
1838       00000000      OFST:	set	0
1841                     ; 505   assert_param(IS_TIM5_FORCED_ACTION_OK(TIM5_ForcedAction));
1843                     ; 508   TIM5->CCMR1  =  (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~TIM5_CCMR_OCM))
1843                     ; 509                             | (uint8_t)TIM5_ForcedAction);
1845  0001 c65307        	ld	a,21255
1846  0004 a48f          	and	a,#143
1847  0006 1a01          	or	a,(OFST+1,sp)
1848  0008 c75307        	ld	21255,a
1849                     ; 510 }
1852  000b 84            	pop	a
1853  000c 81            	ret	
1889                     ; 521 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
1889                     ; 522 {
1890                     .text:	section	.text,new
1891  0000               _TIM5_ForcedOC2Config:
1893  0000 88            	push	a
1894       00000000      OFST:	set	0
1897                     ; 524   assert_param(IS_TIM5_FORCED_ACTION_OK(TIM5_ForcedAction));
1899                     ; 527   TIM5->CCMR2  =  (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~TIM5_CCMR_OCM))
1899                     ; 528                             | (uint8_t)TIM5_ForcedAction);
1901  0001 c65308        	ld	a,21256
1902  0004 a48f          	and	a,#143
1903  0006 1a01          	or	a,(OFST+1,sp)
1904  0008 c75308        	ld	21256,a
1905                     ; 529 }
1908  000b 84            	pop	a
1909  000c 81            	ret	
1945                     ; 540 void TIM5_ForcedOC3Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
1945                     ; 541 {
1946                     .text:	section	.text,new
1947  0000               _TIM5_ForcedOC3Config:
1949  0000 88            	push	a
1950       00000000      OFST:	set	0
1953                     ; 543   assert_param(IS_TIM5_FORCED_ACTION_OK(TIM5_ForcedAction));
1955                     ; 546   TIM5->CCMR3  =  (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~TIM5_CCMR_OCM))  
1955                     ; 547                             | (uint8_t)TIM5_ForcedAction);
1957  0001 c65309        	ld	a,21257
1958  0004 a48f          	and	a,#143
1959  0006 1a01          	or	a,(OFST+1,sp)
1960  0008 c75309        	ld	21257,a
1961                     ; 548 }
1964  000b 84            	pop	a
1965  000c 81            	ret	
2001                     ; 556 void TIM5_ARRPreloadConfig(FunctionalState NewState)
2001                     ; 557 {
2002                     .text:	section	.text,new
2003  0000               _TIM5_ARRPreloadConfig:
2007                     ; 559   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2009                     ; 562   if (NewState != DISABLE)
2011  0000 4d            	tnz	a
2012  0001 2705          	jreq	L1301
2013                     ; 564     TIM5->CR1 |= TIM5_CR1_ARPE ;
2015  0003 721e5300      	bset	21248,#7
2018  0007 81            	ret	
2019  0008               L1301:
2020                     ; 568     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_ARPE) ;
2022  0008 721f5300      	bres	21248,#7
2023                     ; 570 }
2026  000c 81            	ret	
2062                     ; 578 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2062                     ; 579 {
2063                     .text:	section	.text,new
2064  0000               _TIM5_OC1PreloadConfig:
2068                     ; 581   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2070                     ; 584   if (NewState != DISABLE)
2072  0000 4d            	tnz	a
2073  0001 2705          	jreq	L3501
2074                     ; 586     TIM5->CCMR1 |= TIM5_CCMR_OCxPE ;
2076  0003 72165307      	bset	21255,#3
2079  0007 81            	ret	
2080  0008               L3501:
2081                     ; 590     TIM5->CCMR1 &= (uint8_t)(~TIM5_CCMR_OCxPE) ;
2083  0008 72175307      	bres	21255,#3
2084                     ; 592 }
2087  000c 81            	ret	
2123                     ; 600 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2123                     ; 601 {
2124                     .text:	section	.text,new
2125  0000               _TIM5_OC2PreloadConfig:
2129                     ; 603   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2131                     ; 606   if (NewState != DISABLE)
2133  0000 4d            	tnz	a
2134  0001 2705          	jreq	L5701
2135                     ; 608     TIM5->CCMR2 |= TIM5_CCMR_OCxPE ;
2137  0003 72165308      	bset	21256,#3
2140  0007 81            	ret	
2141  0008               L5701:
2142                     ; 612     TIM5->CCMR2 &= (uint8_t)(~TIM5_CCMR_OCxPE) ;
2144  0008 72175308      	bres	21256,#3
2145                     ; 614 }
2148  000c 81            	ret	
2184                     ; 622 void TIM5_OC3PreloadConfig(FunctionalState NewState)
2184                     ; 623 {
2185                     .text:	section	.text,new
2186  0000               _TIM5_OC3PreloadConfig:
2190                     ; 625   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2192                     ; 628   if (NewState != DISABLE)
2194  0000 4d            	tnz	a
2195  0001 2705          	jreq	L7111
2196                     ; 630     TIM5->CCMR3 |= TIM5_CCMR_OCxPE ;
2198  0003 72165309      	bset	21257,#3
2201  0007 81            	ret	
2202  0008               L7111:
2203                     ; 634     TIM5->CCMR3 &= (uint8_t)(~TIM5_CCMR_OCxPE) ;
2205  0008 72175309      	bres	21257,#3
2206                     ; 636 }
2209  000c 81            	ret	
2290                     ; 648 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
2290                     ; 649 {
2291                     .text:	section	.text,new
2292  0000               _TIM5_GenerateEvent:
2296                     ; 651   assert_param(IS_TIM5_EVENT_SOURCE_OK(TIM5_EventSource));
2298                     ; 654   TIM5->EGR = (uint8_t)TIM5_EventSource;
2300  0000 c75306        	ld	21254,a
2301                     ; 655 }
2304  0003 81            	ret	
2340                     ; 665 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2340                     ; 666 {
2341                     .text:	section	.text,new
2342  0000               _TIM5_OC1PolarityConfig:
2346                     ; 668     assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
2348                     ; 671     if (TIM5_OCPolarity != TIM5_OCPOLARITY_HIGH)
2350  0000 4d            	tnz	a
2351  0001 2705          	jreq	L5711
2352                     ; 673         TIM5->CCER1 |= TIM5_CCER1_CC1P ;
2354  0003 7212530a      	bset	21258,#1
2357  0007 81            	ret	
2358  0008               L5711:
2359                     ; 677         TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1P) ;
2361  0008 7213530a      	bres	21258,#1
2362                     ; 679 }
2365  000c 81            	ret	
2401                     ; 690 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2401                     ; 691 {
2402                     .text:	section	.text,new
2403  0000               _TIM5_OC2PolarityConfig:
2407                     ; 693   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
2409                     ; 696   if (TIM5_OCPolarity != TIM5_OCPOLARITY_HIGH)
2411  0000 4d            	tnz	a
2412  0001 2705          	jreq	L7121
2413                     ; 698     TIM5->CCER1 |= TIM5_CCER1_CC2P ;
2415  0003 721a530a      	bset	21258,#5
2418  0007 81            	ret	
2419  0008               L7121:
2420                     ; 702     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2P) ;
2422  0008 721b530a      	bres	21258,#5
2423                     ; 704 }
2426  000c 81            	ret	
2462                     ; 714 void TIM5_OC3PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2462                     ; 715 {
2463                     .text:	section	.text,new
2464  0000               _TIM5_OC3PolarityConfig:
2468                     ; 717   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
2470                     ; 720   if (TIM5_OCPolarity != TIM5_OCPOLARITY_HIGH)
2472  0000 4d            	tnz	a
2473  0001 2705          	jreq	L1421
2474                     ; 722     TIM5->CCER2 |= TIM5_CCER2_CC3P ;
2476  0003 7212530b      	bset	21259,#1
2479  0007 81            	ret	
2480  0008               L1421:
2481                     ; 726     TIM5->CCER2 &= (uint8_t)(~TIM5_CCER2_CC3P) ;
2483  0008 7213530b      	bres	21259,#1
2484                     ; 728 }
2487  000c 81            	ret	
2532                     ; 741 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel, FunctionalState NewState)
2532                     ; 742 {
2533                     .text:	section	.text,new
2534  0000               _TIM5_CCxCmd:
2536  0000 89            	pushw	x
2537       00000000      OFST:	set	0
2540                     ; 744   assert_param(IS_TIM5_CHANNEL_OK(TIM5_Channel));
2542                     ; 745   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2544                     ; 747   if (TIM5_Channel == TIM5_CHANNEL_1)
2546  0001 9e            	ld	a,xh
2547  0002 4d            	tnz	a
2548  0003 2610          	jrne	L7621
2549                     ; 750     if (NewState != DISABLE)
2551  0005 9f            	ld	a,xl
2552  0006 4d            	tnz	a
2553  0007 2706          	jreq	L1721
2554                     ; 752       TIM5->CCER1 |= TIM5_CCER1_CC1E ;
2556  0009 7210530a      	bset	21258,#0
2558  000d 2029          	jra	L5721
2559  000f               L1721:
2560                     ; 756       TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1E) ;
2562  000f 7211530a      	bres	21258,#0
2563  0013 2023          	jra	L5721
2564  0015               L7621:
2565                     ; 760   else if (TIM5_Channel == TIM5_CHANNEL_2)
2567  0015 7b01          	ld	a,(OFST+1,sp)
2568  0017 4a            	dec	a
2569  0018 2610          	jrne	L7721
2570                     ; 763     if (NewState != DISABLE)
2572  001a 7b02          	ld	a,(OFST+2,sp)
2573  001c 2706          	jreq	L1031
2574                     ; 765       TIM5->CCER1 |= TIM5_CCER1_CC2E;
2576  001e 7218530a      	bset	21258,#4
2578  0022 2014          	jra	L5721
2579  0024               L1031:
2580                     ; 769       TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2E) ;
2582  0024 7219530a      	bres	21258,#4
2583  0028 200e          	jra	L5721
2584  002a               L7721:
2585                     ; 775     if (NewState != DISABLE)
2587  002a 7b02          	ld	a,(OFST+2,sp)
2588  002c 2706          	jreq	L7031
2589                     ; 777       TIM5->CCER2 |= TIM5_CCER2_CC3E;
2591  002e 7210530b      	bset	21259,#0
2593  0032 2004          	jra	L5721
2594  0034               L7031:
2595                     ; 781       TIM5->CCER2 &= (uint8_t)(~TIM5_CCER2_CC3E) ;
2597  0034 7211530b      	bres	21259,#0
2598  0038               L5721:
2599                     ; 784 }
2602  0038 85            	popw	x
2603  0039 81            	ret	
2648                     ; 806 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel, TIM5_OCMode_TypeDef TIM5_OCMode)
2648                     ; 807 {
2649                     .text:	section	.text,new
2650  0000               _TIM5_SelectOCxM:
2652  0000 89            	pushw	x
2653       00000000      OFST:	set	0
2656                     ; 809   assert_param(IS_TIM5_CHANNEL_OK(TIM5_Channel));
2658                     ; 810   assert_param(IS_TIM5_OCM_OK(TIM5_OCMode));
2660                     ; 812   if (TIM5_Channel == TIM5_CHANNEL_1)
2662  0001 9e            	ld	a,xh
2663  0002 4d            	tnz	a
2664  0003 2610          	jrne	L5331
2665                     ; 815     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1E);
2667  0005 7211530a      	bres	21258,#0
2668                     ; 818     TIM5->CCMR1 = (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~TIM5_CCMR_OCM)) 
2668                     ; 819                             | (uint8_t)TIM5_OCMode);
2670  0009 c65307        	ld	a,21255
2671  000c a48f          	and	a,#143
2672  000e 1a02          	or	a,(OFST+2,sp)
2673  0010 c75307        	ld	21255,a
2675  0013 2023          	jra	L7331
2676  0015               L5331:
2677                     ; 821   else if (TIM5_Channel == TIM5_CHANNEL_2)
2679  0015 7b01          	ld	a,(OFST+1,sp)
2680  0017 4a            	dec	a
2681  0018 2610          	jrne	L1431
2682                     ; 824     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2E);
2684  001a 7219530a      	bres	21258,#4
2685                     ; 827     TIM5->CCMR2 = (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~TIM5_CCMR_OCM))
2685                     ; 828                             | (uint8_t)TIM5_OCMode);
2687  001e c65308        	ld	a,21256
2688  0021 a48f          	and	a,#143
2689  0023 1a02          	or	a,(OFST+2,sp)
2690  0025 c75308        	ld	21256,a
2692  0028 200e          	jra	L7331
2693  002a               L1431:
2694                     ; 833     TIM5->CCER2 &= (uint8_t)(~TIM5_CCER2_CC3E);
2696  002a 7211530b      	bres	21259,#0
2697                     ; 836     TIM5->CCMR3 = (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~TIM5_CCMR_OCM))
2697                     ; 837                             | (uint8_t)TIM5_OCMode);
2699  002e c65309        	ld	a,21257
2700  0031 a48f          	and	a,#143
2701  0033 1a02          	or	a,(OFST+2,sp)
2702  0035 c75309        	ld	21257,a
2703  0038               L7331:
2704                     ; 839 }
2707  0038 85            	popw	x
2708  0039 81            	ret	
2742                     ; 847 void TIM5_SetCounter(uint16_t Counter)
2742                     ; 848 {
2743                     .text:	section	.text,new
2744  0000               _TIM5_SetCounter:
2748                     ; 850   TIM5->CNTRH = (uint8_t)(Counter >> 8);
2750  0000 9e            	ld	a,xh
2751  0001 c7530c        	ld	21260,a
2752                     ; 851   TIM5->CNTRL = (uint8_t)(Counter);
2754  0004 9f            	ld	a,xl
2755  0005 c7530d        	ld	21261,a
2756                     ; 852 }
2759  0008 81            	ret	
2793                     ; 860 void TIM5_SetAutoreload(uint16_t Autoreload)
2793                     ; 861 {
2794                     .text:	section	.text,new
2795  0000               _TIM5_SetAutoreload:
2799                     ; 863   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
2801  0000 9e            	ld	a,xh
2802  0001 c7530f        	ld	21263,a
2803                     ; 864   TIM5->ARRL = (uint8_t)(Autoreload);
2805  0004 9f            	ld	a,xl
2806  0005 c75310        	ld	21264,a
2807                     ; 865 }
2810  0008 81            	ret	
2844                     ; 873 void TIM5_SetCompare1(uint16_t Compare1)
2844                     ; 874 {
2845                     .text:	section	.text,new
2846  0000               _TIM5_SetCompare1:
2850                     ; 876   TIM5->CCR1H = (uint8_t)(Compare1 >> 8);
2852  0000 9e            	ld	a,xh
2853  0001 c75311        	ld	21265,a
2854                     ; 877   TIM5->CCR1L = (uint8_t)(Compare1);
2856  0004 9f            	ld	a,xl
2857  0005 c75312        	ld	21266,a
2858                     ; 878 }
2861  0008 81            	ret	
2895                     ; 886 void TIM5_SetCompare2(uint16_t Compare2)
2895                     ; 887 {
2896                     .text:	section	.text,new
2897  0000               _TIM5_SetCompare2:
2901                     ; 889   TIM5->CCR2H = (uint8_t)(Compare2 >> 8);
2903  0000 9e            	ld	a,xh
2904  0001 c75313        	ld	21267,a
2905                     ; 890   TIM5->CCR2L = (uint8_t)(Compare2);
2907  0004 9f            	ld	a,xl
2908  0005 c75314        	ld	21268,a
2909                     ; 891 }
2912  0008 81            	ret	
2946                     ; 899 void TIM5_SetCompare3(uint16_t Compare3)
2946                     ; 900 {
2947                     .text:	section	.text,new
2948  0000               _TIM5_SetCompare3:
2952                     ; 902   TIM5->CCR3H = (uint8_t)(Compare3 >> 8);
2954  0000 9e            	ld	a,xh
2955  0001 c75315        	ld	21269,a
2956                     ; 903   TIM5->CCR3L = (uint8_t)(Compare3);
2958  0004 9f            	ld	a,xl
2959  0005 c75316        	ld	21270,a
2960                     ; 904 }
2963  0008 81            	ret	
2999                     ; 916 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
2999                     ; 917 {
3000                     .text:	section	.text,new
3001  0000               _TIM5_SetIC1Prescaler:
3003  0000 88            	push	a
3004       00000000      OFST:	set	0
3007                     ; 919   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_IC1Prescaler));
3009                     ; 922   TIM5->CCMR1 = (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~TIM5_CCMR_ICxPSC))|
3009                     ; 923                           (uint8_t)TIM5_IC1Prescaler);
3011  0001 c65307        	ld	a,21255
3012  0004 a4f3          	and	a,#243
3013  0006 1a01          	or	a,(OFST+1,sp)
3014  0008 c75307        	ld	21255,a
3015                     ; 924 }
3018  000b 84            	pop	a
3019  000c 81            	ret	
3055                     ; 936 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3055                     ; 937 {
3056                     .text:	section	.text,new
3057  0000               _TIM5_SetIC2Prescaler:
3059  0000 88            	push	a
3060       00000000      OFST:	set	0
3063                     ; 939   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_IC2Prescaler));
3065                     ; 942   TIM5->CCMR2 = (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~TIM5_CCMR_ICxPSC))
3065                     ; 943                           | (uint8_t)TIM5_IC2Prescaler);
3067  0001 c65308        	ld	a,21256
3068  0004 a4f3          	and	a,#243
3069  0006 1a01          	or	a,(OFST+1,sp)
3070  0008 c75308        	ld	21256,a
3071                     ; 944 }
3074  000b 84            	pop	a
3075  000c 81            	ret	
3111                     ; 956 void TIM5_SetIC3Prescaler(TIM5_ICPSC_TypeDef TIM5_IC3Prescaler)
3111                     ; 957 {
3112                     .text:	section	.text,new
3113  0000               _TIM5_SetIC3Prescaler:
3115  0000 88            	push	a
3116       00000000      OFST:	set	0
3119                     ; 959   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_IC3Prescaler));
3121                     ; 961   TIM5->CCMR3 = (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~TIM5_CCMR_ICxPSC)) |
3121                     ; 962                           (uint8_t)TIM5_IC3Prescaler);
3123  0001 c65309        	ld	a,21257
3124  0004 a4f3          	and	a,#243
3125  0006 1a01          	or	a,(OFST+1,sp)
3126  0008 c75309        	ld	21257,a
3127                     ; 963 }
3130  000b 84            	pop	a
3131  000c 81            	ret	
3165                     ; 970 uint16_t TIM5_GetCapture1(void)
3165                     ; 971 {
3166                     .text:	section	.text,new
3167  0000               _TIM5_GetCapture1:
3169  0000 89            	pushw	x
3170       00000002      OFST:	set	2
3173                     ; 972   uint16_t temp = 0; 
3175                     ; 974   temp = ((uint16_t)TIM5->CCR1H << 8); 
3177  0001 c65311        	ld	a,21265
3178  0004 97            	ld	xl,a
3179  0005 4f            	clr	a
3180  0006 02            	rlwa	x,a
3181  0007 1f01          	ldw	(OFST-1,sp),x
3183                     ; 977   return (uint16_t)(temp | (uint16_t)(TIM5->CCR1L));
3185  0009 c65312        	ld	a,21266
3186  000c 5f            	clrw	x
3187  000d 97            	ld	xl,a
3188  000e 01            	rrwa	x,a
3189  000f 1a02          	or	a,(OFST+0,sp)
3190  0011 01            	rrwa	x,a
3191  0012 1a01          	or	a,(OFST-1,sp)
3192  0014 01            	rrwa	x,a
3195  0015 5b02          	addw	sp,#2
3196  0017 81            	ret	
3230                     ; 985 uint16_t TIM5_GetCapture2(void)
3230                     ; 986 {
3231                     .text:	section	.text,new
3232  0000               _TIM5_GetCapture2:
3234  0000 89            	pushw	x
3235       00000002      OFST:	set	2
3238                     ; 987   uint16_t temp = 0; 
3240                     ; 989   temp = ((uint16_t)TIM5->CCR2H << 8);  
3242  0001 c65313        	ld	a,21267
3243  0004 97            	ld	xl,a
3244  0005 4f            	clr	a
3245  0006 02            	rlwa	x,a
3246  0007 1f01          	ldw	(OFST-1,sp),x
3248                     ; 992   return (uint16_t)(temp | (uint16_t)(TIM5->CCR2L));
3250  0009 c65314        	ld	a,21268
3251  000c 5f            	clrw	x
3252  000d 97            	ld	xl,a
3253  000e 01            	rrwa	x,a
3254  000f 1a02          	or	a,(OFST+0,sp)
3255  0011 01            	rrwa	x,a
3256  0012 1a01          	or	a,(OFST-1,sp)
3257  0014 01            	rrwa	x,a
3260  0015 5b02          	addw	sp,#2
3261  0017 81            	ret	
3295                     ; 1000 uint16_t TIM5_GetCapture3(void)
3295                     ; 1001 {
3296                     .text:	section	.text,new
3297  0000               _TIM5_GetCapture3:
3299  0000 89            	pushw	x
3300       00000002      OFST:	set	2
3303                     ; 1002   uint16_t temp = 0; 
3305                     ; 1004   temp = ((uint16_t)TIM5->CCR3H << 8);
3307  0001 c65315        	ld	a,21269
3308  0004 97            	ld	xl,a
3309  0005 4f            	clr	a
3310  0006 02            	rlwa	x,a
3311  0007 1f01          	ldw	(OFST-1,sp),x
3313                     ; 1006   return (uint16_t)(temp | (uint16_t)(TIM5->CCR3L));
3315  0009 c65316        	ld	a,21270
3316  000c 5f            	clrw	x
3317  000d 97            	ld	xl,a
3318  000e 01            	rrwa	x,a
3319  000f 1a02          	or	a,(OFST+0,sp)
3320  0011 01            	rrwa	x,a
3321  0012 1a01          	or	a,(OFST-1,sp)
3322  0014 01            	rrwa	x,a
3325  0015 5b02          	addw	sp,#2
3326  0017 81            	ret	
3360                     ; 1014 uint16_t TIM5_GetCounter(void)
3360                     ; 1015 {
3361                     .text:	section	.text,new
3362  0000               _TIM5_GetCounter:
3364  0000 89            	pushw	x
3365       00000002      OFST:	set	2
3368                     ; 1016   uint16_t tmpcntr = 0;
3370                     ; 1018   tmpcntr = ((uint16_t)TIM5->CNTRH << 8); 
3372  0001 c6530c        	ld	a,21260
3373  0004 97            	ld	xl,a
3374  0005 4f            	clr	a
3375  0006 02            	rlwa	x,a
3376  0007 1f01          	ldw	(OFST-1,sp),x
3378                     ; 1020   return (uint16_t)(tmpcntr | (uint16_t)(TIM5->CNTRL));
3380  0009 c6530d        	ld	a,21261
3381  000c 5f            	clrw	x
3382  000d 97            	ld	xl,a
3383  000e 01            	rrwa	x,a
3384  000f 1a02          	or	a,(OFST+0,sp)
3385  0011 01            	rrwa	x,a
3386  0012 1a01          	or	a,(OFST-1,sp)
3387  0014 01            	rrwa	x,a
3390  0015 5b02          	addw	sp,#2
3391  0017 81            	ret	
3415                     ; 1028 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
3415                     ; 1029 {
3416                     .text:	section	.text,new
3417  0000               _TIM5_GetPrescaler:
3421                     ; 1031   return (TIM5_Prescaler_TypeDef)(TIM5->PSCR);
3423  0000 c6530e        	ld	a,21262
3426  0003 81            	ret	
3572                     ; 1047 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3572                     ; 1048 {
3573                     .text:	section	.text,new
3574  0000               _TIM5_GetFlagStatus:
3576  0000 89            	pushw	x
3577  0001 89            	pushw	x
3578       00000002      OFST:	set	2
3581                     ; 1049   FlagStatus bitstatus = RESET;
3583                     ; 1053   assert_param(IS_TIM5_GET_FLAG_OK(TIM5_FLAG));
3585                     ; 1055   tim5_flag_l= (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_FLAG);
3587  0002 9f            	ld	a,xl
3588  0003 c45304        	and	a,21252
3589  0006 6b01          	ld	(OFST-1,sp),a
3591                     ; 1056   tim5_flag_h= (uint8_t)((uint16_t)TIM5_FLAG >> 8);
3593  0008 7b03          	ld	a,(OFST+1,sp)
3594  000a 6b02          	ld	(OFST+0,sp),a
3596                     ; 1058   if (((tim5_flag_l)|(uint8_t)(TIM5->SR2 & tim5_flag_h)) != RESET )
3598  000c c45305        	and	a,21253
3599  000f 1a01          	or	a,(OFST-1,sp)
3600  0011 2702          	jreq	L3171
3601                     ; 1060     bitstatus = SET;
3603  0013 a601          	ld	a,#1
3606  0015               L3171:
3607                     ; 1064     bitstatus = RESET;
3610                     ; 1066   return (FlagStatus)bitstatus;
3614  0015 5b04          	addw	sp,#4
3615  0017 81            	ret	
3650                     ; 1082 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3650                     ; 1083 {
3651                     .text:	section	.text,new
3652  0000               _TIM5_ClearFlag:
3654  0000 89            	pushw	x
3655       00000000      OFST:	set	0
3658                     ; 1085   assert_param(IS_TIM5_CLEAR_FLAG_OK(TIM5_FLAG));
3660                     ; 1088   TIM5->SR1 = (uint8_t)(~((uint8_t)(TIM5_FLAG)));
3662  0001 9f            	ld	a,xl
3663  0002 43            	cpl	a
3664  0003 c75304        	ld	21252,a
3665                     ; 1089   TIM5->SR2 &= (uint8_t)(~((uint8_t)((uint16_t)TIM5_FLAG >> 8)));
3667  0006 7b01          	ld	a,(OFST+1,sp)
3668  0008 43            	cpl	a
3669  0009 c45305        	and	a,21253
3670  000c c75305        	ld	21253,a
3671                     ; 1090 }
3674  000f 85            	popw	x
3675  0010 81            	ret	
3739                     ; 1103 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
3739                     ; 1104 {
3740                     .text:	section	.text,new
3741  0000               _TIM5_GetITStatus:
3743  0000 88            	push	a
3744  0001 89            	pushw	x
3745       00000002      OFST:	set	2
3748                     ; 1105   ITStatus bitstatus = RESET;
3750                     ; 1106   uint8_t TIM5_itStatus = 0, TIM5_itEnable = 0;
3754                     ; 1109   assert_param(IS_TIM5_GET_IT_OK(TIM5_IT));
3756                     ; 1111   TIM5_itStatus = (uint8_t)(TIM5->SR1 & TIM5_IT);
3758  0002 c45304        	and	a,21252
3759  0005 6b01          	ld	(OFST-1,sp),a
3761                     ; 1113   TIM5_itEnable = (uint8_t)(TIM5->IER & TIM5_IT);
3763  0007 c65303        	ld	a,21251
3764  000a 1403          	and	a,(OFST+1,sp)
3765  000c 6b02          	ld	(OFST+0,sp),a
3767                     ; 1115   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET ))
3769  000e 7b01          	ld	a,(OFST-1,sp)
3770  0010 2708          	jreq	L7671
3772  0012 7b02          	ld	a,(OFST+0,sp)
3773  0014 2704          	jreq	L7671
3774                     ; 1117     bitstatus = SET;
3776  0016 a601          	ld	a,#1
3779  0018 2001          	jra	L1771
3780  001a               L7671:
3781                     ; 1121     bitstatus = RESET;
3783  001a 4f            	clr	a
3785  001b               L1771:
3786                     ; 1123   return (ITStatus)(bitstatus);
3790  001b 5b03          	addw	sp,#3
3791  001d 81            	ret	
3827                     ; 1136 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
3827                     ; 1137 {
3828                     .text:	section	.text,new
3829  0000               _TIM5_ClearITPendingBit:
3833                     ; 1139   assert_param(IS_TIM5_IT_OK(TIM5_IT));
3835                     ; 1142   TIM5->SR1 = (uint8_t)(~TIM5_IT);
3837  0000 43            	cpl	a
3838  0001 c75304        	ld	21252,a
3839                     ; 1143 }
3842  0004 81            	ret	
3894                     ; 1161 static void TI1_Config(uint8_t TIM5_ICPolarity,
3894                     ; 1162                        uint8_t TIM5_ICSelection,
3894                     ; 1163                        uint8_t TIM5_ICFilter)
3894                     ; 1164 {
3895                     .text:	section	.text,new
3896  0000               L3_TI1_Config:
3898  0000 89            	pushw	x
3899  0001 88            	push	a
3900       00000001      OFST:	set	1
3903                     ; 1166   TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1E);
3905  0002 7211530a      	bres	21258,#0
3906                     ; 1169   TIM5->CCMR1  = (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~( TIM5_CCMR_CCxS | TIM5_CCMR_ICxF )))
3906                     ; 1170                            | (uint8_t)(( (TIM5_ICSelection)) | ((uint8_t)( TIM5_ICFilter << 4))));
3908  0006 7b06          	ld	a,(OFST+5,sp)
3909  0008 97            	ld	xl,a
3910  0009 a610          	ld	a,#16
3911  000b 42            	mul	x,a
3912  000c 9f            	ld	a,xl
3913  000d 1a03          	or	a,(OFST+2,sp)
3914  000f 6b01          	ld	(OFST+0,sp),a
3916  0011 c65307        	ld	a,21255
3917  0014 a40c          	and	a,#12
3918  0016 1a01          	or	a,(OFST+0,sp)
3919  0018 c75307        	ld	21255,a
3920                     ; 1173   if (TIM5_ICPolarity != TIM5_ICPOLARITY_RISING)
3922  001b 7b02          	ld	a,(OFST+1,sp)
3923  001d 2706          	jreq	L7302
3924                     ; 1175     TIM5->CCER1 |= TIM5_CCER1_CC1P ;
3926  001f 7212530a      	bset	21258,#1
3928  0023 2004          	jra	L1402
3929  0025               L7302:
3930                     ; 1179     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1P) ;
3932  0025 7213530a      	bres	21258,#1
3933  0029               L1402:
3934                     ; 1182   TIM5->CCER1 |=  TIM5_CCER1_CC1E;
3936  0029 7210530a      	bset	21258,#0
3937                     ; 1183 }
3940  002d 5b03          	addw	sp,#3
3941  002f 81            	ret	
3993                     ; 1201 static void TI2_Config(uint8_t TIM5_ICPolarity,
3993                     ; 1202                        uint8_t TIM5_ICSelection,
3993                     ; 1203                        uint8_t TIM5_ICFilter)
3993                     ; 1204 {
3994                     .text:	section	.text,new
3995  0000               L5_TI2_Config:
3997  0000 89            	pushw	x
3998  0001 88            	push	a
3999       00000001      OFST:	set	1
4002                     ; 1206   TIM5->CCER1 &=  (uint8_t)(~TIM5_CCER1_CC2E);
4004  0002 7219530a      	bres	21258,#4
4005                     ; 1209   TIM5->CCMR2  = (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~( TIM5_CCMR_CCxS | TIM5_CCMR_ICxF)))
4005                     ; 1210                            | (uint8_t)(( (TIM5_ICSelection)) | ((uint8_t)( TIM5_ICFilter << 4))));
4007  0006 7b06          	ld	a,(OFST+5,sp)
4008  0008 97            	ld	xl,a
4009  0009 a610          	ld	a,#16
4010  000b 42            	mul	x,a
4011  000c 9f            	ld	a,xl
4012  000d 1a03          	or	a,(OFST+2,sp)
4013  000f 6b01          	ld	(OFST+0,sp),a
4015  0011 c65308        	ld	a,21256
4016  0014 a40c          	and	a,#12
4017  0016 1a01          	or	a,(OFST+0,sp)
4018  0018 c75308        	ld	21256,a
4019                     ; 1214   if (TIM5_ICPolarity != TIM5_ICPOLARITY_RISING)
4021  001b 7b02          	ld	a,(OFST+1,sp)
4022  001d 2706          	jreq	L1702
4023                     ; 1216     TIM5->CCER1 |= TIM5_CCER1_CC2P ;
4025  001f 721a530a      	bset	21258,#5
4027  0023 2004          	jra	L3702
4028  0025               L1702:
4029                     ; 1220     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2P) ;
4031  0025 721b530a      	bres	21258,#5
4032  0029               L3702:
4033                     ; 1224   TIM5->CCER1 |=  TIM5_CCER1_CC2E;
4035  0029 7218530a      	bset	21258,#4
4036                     ; 1225 }
4039  002d 5b03          	addw	sp,#3
4040  002f 81            	ret	
4092                     ; 1241 static void TI3_Config(uint8_t TIM5_ICPolarity, uint8_t TIM5_ICSelection,
4092                     ; 1242                        uint8_t TIM5_ICFilter)
4092                     ; 1243 {
4093                     .text:	section	.text,new
4094  0000               L7_TI3_Config:
4096  0000 89            	pushw	x
4097  0001 88            	push	a
4098       00000001      OFST:	set	1
4101                     ; 1245   TIM5->CCER2 &=  (uint8_t)(~TIM5_CCER2_CC3E);
4103  0002 7211530b      	bres	21259,#0
4104                     ; 1248   TIM5->CCMR3 = (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~( TIM5_CCMR_CCxS | TIM5_CCMR_ICxF))) 
4104                     ; 1249                           | (uint8_t)(( (TIM5_ICSelection)) | ((uint8_t)( TIM5_ICFilter << 4))));
4106  0006 7b06          	ld	a,(OFST+5,sp)
4107  0008 97            	ld	xl,a
4108  0009 a610          	ld	a,#16
4109  000b 42            	mul	x,a
4110  000c 9f            	ld	a,xl
4111  000d 1a03          	or	a,(OFST+2,sp)
4112  000f 6b01          	ld	(OFST+0,sp),a
4114  0011 c65309        	ld	a,21257
4115  0014 a40c          	and	a,#12
4116  0016 1a01          	or	a,(OFST+0,sp)
4117  0018 c75309        	ld	21257,a
4118                     ; 1253   if (TIM5_ICPolarity != TIM5_ICPOLARITY_RISING)
4120  001b 7b02          	ld	a,(OFST+1,sp)
4121  001d 2706          	jreq	L3212
4122                     ; 1255     TIM5->CCER2 |= TIM5_CCER2_CC3P ;
4124  001f 7212530b      	bset	21259,#1
4126  0023 2004          	jra	L5212
4127  0025               L3212:
4128                     ; 1259     TIM5->CCER2 &= (uint8_t)(~TIM5_CCER2_CC3P) ;
4130  0025 7213530b      	bres	21259,#1
4131  0029               L5212:
4132                     ; 1262   TIM5->CCER2 |=  TIM5_CCER2_CC3E;
4134  0029 7210530b      	bset	21259,#0
4135                     ; 1263 }
4138  002d 5b03          	addw	sp,#3
4139  002f 81            	ret	
4163                     ; 1271 void TIM5_InternalClockConfig(void)
4163                     ; 1272 {
4164                     .text:	section	.text,new
4165  0000               _TIM5_InternalClockConfig:
4169                     ; 1274   TIM5->SMCR &=  (uint8_t)(~TIM5_SMCR_SMS);
4171  0000 c65302        	ld	a,21250
4172  0003 a4f8          	and	a,#248
4173  0005 c75302        	ld	21250,a
4174                     ; 1275 }
4177  0008 81            	ret	
4276                     ; 1283 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4276                     ; 1284 {
4277                     .text:	section	.text,new
4278  0000               _TIM5_SelectOutputTrigger:
4280  0000 88            	push	a
4281  0001 88            	push	a
4282       00000001      OFST:	set	1
4285                     ; 1285   uint8_t tmpcr2 = 0;
4287                     ; 1288   assert_param(IS_TIM5_TRGO_SOURCE_OK(TIM5_TRGOSource));
4289                     ; 1290   tmpcr2 = TIM5->CR2;
4291  0002 c65301        	ld	a,21249
4293                     ; 1293   tmpcr2 &= (uint8_t)(~TIM5_CR2_MMS);
4295  0005 a48f          	and	a,#143
4297                     ; 1296   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
4299  0007 1a02          	or	a,(OFST+1,sp)
4301                     ; 1298   TIM5->CR2 = tmpcr2;
4303  0009 c75301        	ld	21249,a
4304                     ; 1299 }
4307  000c 85            	popw	x
4308  000d 81            	ret	
4391                     ; 1307 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
4391                     ; 1308 {
4392                     .text:	section	.text,new
4393  0000               _TIM5_SelectSlaveMode:
4395  0000 88            	push	a
4396  0001 88            	push	a
4397       00000001      OFST:	set	1
4400                     ; 1309   uint8_t tmpsmcr = 0;
4402                     ; 1312   assert_param(IS_TIM5_SLAVE_MODE_OK(TIM5_SlaveMode));
4404                     ; 1314   tmpsmcr = TIM5->SMCR;
4406  0002 c65302        	ld	a,21250
4408                     ; 1317   tmpsmcr &= (uint8_t)(~TIM5_SMCR_SMS);
4410  0005 a4f8          	and	a,#248
4412                     ; 1320   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
4414  0007 1a02          	or	a,(OFST+1,sp)
4416                     ; 1322   TIM5->SMCR = tmpsmcr;
4418  0009 c75302        	ld	21250,a
4419                     ; 1323 }
4422  000c 85            	popw	x
4423  000d 81            	ret	
4489                     ; 1331 void TIM5_SelectInputTrigger(TIM5_TS_TypeDef TIM5_InputTriggerSource)
4489                     ; 1332 {
4490                     .text:	section	.text,new
4491  0000               _TIM5_SelectInputTrigger:
4493  0000 88            	push	a
4494  0001 88            	push	a
4495       00000001      OFST:	set	1
4498                     ; 1333   uint8_t tmpsmcr = 0;
4500                     ; 1336   assert_param(IS_TIM5_TRIGGER_SELECTION_OK(TIM5_InputTriggerSource));
4502                     ; 1338   tmpsmcr = TIM5->SMCR;
4504  0002 c65302        	ld	a,21250
4506                     ; 1341   tmpsmcr &= (uint8_t)(~TIM5_SMCR_TS);
4508  0005 a48f          	and	a,#143
4510                     ; 1342   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4512  0007 1a02          	or	a,(OFST+1,sp)
4514                     ; 1344   TIM5->SMCR = (uint8_t)tmpsmcr;
4516  0009 c75302        	ld	21250,a
4517                     ; 1345 }
4520  000c 85            	popw	x
4521  000d 81            	ret	
4634                     ; 1357 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
4634                     ; 1358                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
4634                     ; 1359                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
4634                     ; 1360 {
4635                     .text:	section	.text,new
4636  0000               _TIM5_EncoderInterfaceConfig:
4638  0000 89            	pushw	x
4639  0001 5203          	subw	sp,#3
4640       00000003      OFST:	set	3
4643                     ; 1361   uint8_t tmpsmcr = 0;
4645                     ; 1362   uint8_t tmpccmr1 = 0;
4647                     ; 1363   uint8_t tmpccmr2 = 0;
4649                     ; 1366   assert_param(IS_TIM5_ENCODER_MODE_OK(TIM5_EncoderMode));
4651                     ; 1367   assert_param(IS_TIM5_IC_POLARITY_OK(TIM5_IC1Polarity));
4653                     ; 1368   assert_param(IS_TIM5_IC_POLARITY_OK(TIM5_IC2Polarity));
4655                     ; 1370   tmpsmcr = TIM5->SMCR;
4657  0003 c65302        	ld	a,21250
4658  0006 6b01          	ld	(OFST-2,sp),a
4660                     ; 1371   tmpccmr1 = TIM5->CCMR1;
4662  0008 c65307        	ld	a,21255
4663  000b 6b02          	ld	(OFST-1,sp),a
4665                     ; 1372   tmpccmr2 = TIM5->CCMR2;
4667  000d c65308        	ld	a,21256
4668  0010 6b03          	ld	(OFST+0,sp),a
4670                     ; 1375   tmpsmcr &= (uint8_t)(TIM5_SMCR_MSM | TIM5_SMCR_TS)  ;
4672  0012 7b01          	ld	a,(OFST-2,sp)
4673  0014 a4f0          	and	a,#240
4674  0016 6b01          	ld	(OFST-2,sp),a
4676                     ; 1376   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
4678  0018 9e            	ld	a,xh
4679  0019 1a01          	or	a,(OFST-2,sp)
4680  001b 6b01          	ld	(OFST-2,sp),a
4682                     ; 1379   tmpccmr1 &= (uint8_t)(~TIM5_CCMR_CCxS);
4684  001d 7b02          	ld	a,(OFST-1,sp)
4685  001f a4fc          	and	a,#252
4686  0021 6b02          	ld	(OFST-1,sp),a
4688                     ; 1380   tmpccmr2 &= (uint8_t)(~TIM5_CCMR_CCxS);
4690  0023 7b03          	ld	a,(OFST+0,sp)
4691  0025 a4fc          	and	a,#252
4692  0027 6b03          	ld	(OFST+0,sp),a
4694                     ; 1381   tmpccmr1 |= TIM5_CCMR_TIxDirect_Set;
4696  0029 7b02          	ld	a,(OFST-1,sp)
4697  002b aa01          	or	a,#1
4698  002d 6b02          	ld	(OFST-1,sp),a
4700                     ; 1382   tmpccmr2 |= TIM5_CCMR_TIxDirect_Set;
4702  002f 7b03          	ld	a,(OFST+0,sp)
4703  0031 aa01          	or	a,#1
4704  0033 6b03          	ld	(OFST+0,sp),a
4706                     ; 1385   if (TIM5_IC1Polarity == TIM5_ICPOLARITY_FALLING)
4708  0035 9f            	ld	a,xl
4709  0036 a144          	cp	a,#68
4710  0038 2606          	jrne	L5432
4711                     ; 1387     TIM5->CCER1 |= TIM5_CCER1_CC1P ;
4713  003a 7212530a      	bset	21258,#1
4715  003e 2004          	jra	L7432
4716  0040               L5432:
4717                     ; 1391     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1P) ;
4719  0040 7213530a      	bres	21258,#1
4720  0044               L7432:
4721                     ; 1394   if (TIM5_IC2Polarity == TIM5_ICPOLARITY_FALLING)
4723  0044 7b08          	ld	a,(OFST+5,sp)
4724  0046 a144          	cp	a,#68
4725  0048 2606          	jrne	L1532
4726                     ; 1396     TIM5->CCER1 |= TIM5_CCER1_CC2P ;
4728  004a 721a530a      	bset	21258,#5
4730  004e 2004          	jra	L3532
4731  0050               L1532:
4732                     ; 1400     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2P) ;
4734  0050 721b530a      	bres	21258,#5
4735  0054               L3532:
4736                     ; 1403   TIM5->SMCR = tmpsmcr;
4738  0054 7b01          	ld	a,(OFST-2,sp)
4739  0056 c75302        	ld	21250,a
4740                     ; 1404   TIM5->CCMR1 = tmpccmr1;
4742  0059 7b02          	ld	a,(OFST-1,sp)
4743  005b c75307        	ld	21255,a
4744                     ; 1405   TIM5->CCMR2 = tmpccmr2;
4746  005e 7b03          	ld	a,(OFST+0,sp)
4747  0060 c75308        	ld	21256,a
4748                     ; 1406 }
4751  0063 5b05          	addw	sp,#5
4752  0065 81            	ret	
4765                     	xdef	_TIM5_EncoderInterfaceConfig
4766                     	xdef	_TIM5_SelectSlaveMode
4767                     	xdef	_TIM5_SelectInputTrigger
4768                     	xdef	_TIM5_ClearITPendingBit
4769                     	xdef	_TIM5_GetITStatus
4770                     	xdef	_TIM5_ClearFlag
4771                     	xdef	_TIM5_GetFlagStatus
4772                     	xdef	_TIM5_GetPrescaler
4773                     	xdef	_TIM5_GetCounter
4774                     	xdef	_TIM5_GetCapture3
4775                     	xdef	_TIM5_GetCapture2
4776                     	xdef	_TIM5_GetCapture1
4777                     	xdef	_TIM5_SetIC3Prescaler
4778                     	xdef	_TIM5_SetIC2Prescaler
4779                     	xdef	_TIM5_SetIC1Prescaler
4780                     	xdef	_TIM5_SetCompare3
4781                     	xdef	_TIM5_SetCompare2
4782                     	xdef	_TIM5_SetCompare1
4783                     	xdef	_TIM5_SetAutoreload
4784                     	xdef	_TIM5_SetCounter
4785                     	xdef	_TIM5_SelectOCxM
4786                     	xdef	_TIM5_CCxCmd
4787                     	xdef	_TIM5_OC3PolarityConfig
4788                     	xdef	_TIM5_OC2PolarityConfig
4789                     	xdef	_TIM5_OC1PolarityConfig
4790                     	xdef	_TIM5_GenerateEvent
4791                     	xdef	_TIM5_OC3PreloadConfig
4792                     	xdef	_TIM5_OC2PreloadConfig
4793                     	xdef	_TIM5_OC1PreloadConfig
4794                     	xdef	_TIM5_ARRPreloadConfig
4795                     	xdef	_TIM5_ForcedOC3Config
4796                     	xdef	_TIM5_ForcedOC2Config
4797                     	xdef	_TIM5_ForcedOC1Config
4798                     	xdef	_TIM5_SelectOutputTrigger
4799                     	xdef	_TIM5_PrescalerConfig
4800                     	xdef	_TIM5_SelectOnePulseMode
4801                     	xdef	_TIM5_UpdateRequestConfig
4802                     	xdef	_TIM5_UpdateDisableConfig
4803                     	xdef	_TIM5_InternalClockConfig
4804                     	xdef	_TIM5_ITConfig
4805                     	xdef	_TIM5_Cmd
4806                     	xdef	_TIM5_PWMIConfig
4807                     	xdef	_TIM5_ICInit
4808                     	xdef	_TIM5_OC3Init
4809                     	xdef	_TIM5_OC2Init
4810                     	xdef	_TIM5_OC1Init
4811                     	xdef	_TIM5_TimeBaseInit
4812                     	xdef	_TIM5_DeInit
4831                     	end
