   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  42                     ; 52 void TIM5_DeInit(void)
  42                     ; 53 {
  44                     	switch	.text
  45  0000               _TIM5_DeInit:
  49                     ; 54   TIM5->CR1 = (uint8_t)TIM5_CR1_RESET_VALUE;
  51  0000 725f5300      	clr	21248
  52                     ; 55   TIM5->CR2 = TIM5_CR2_RESET_VALUE;
  54  0004 725f5301      	clr	21249
  55                     ; 56   TIM5->SMCR = TIM5_SMCR_RESET_VALUE;
  57  0008 725f5302      	clr	21250
  58                     ; 57   TIM5->IER = (uint8_t)TIM5_IER_RESET_VALUE;
  60  000c 725f5303      	clr	21251
  61                     ; 58   TIM5->SR2 = (uint8_t)TIM5_SR2_RESET_VALUE;
  63  0010 725f5305      	clr	21253
  64                     ; 61   TIM5->CCER1 = (uint8_t)TIM5_CCER1_RESET_VALUE;
  66  0014 725f530a      	clr	21258
  67                     ; 62   TIM5->CCER2 = (uint8_t)TIM5_CCER2_RESET_VALUE;
  69  0018 725f530b      	clr	21259
  70                     ; 65   TIM5->CCER1 = (uint8_t)TIM5_CCER1_RESET_VALUE;
  72  001c 725f530a      	clr	21258
  73                     ; 66   TIM5->CCER2 = (uint8_t)TIM5_CCER2_RESET_VALUE;
  75  0020 725f530b      	clr	21259
  76                     ; 67   TIM5->CCMR1 = (uint8_t)TIM5_CCMR1_RESET_VALUE;
  78  0024 725f5307      	clr	21255
  79                     ; 68   TIM5->CCMR2 = (uint8_t)TIM5_CCMR2_RESET_VALUE;
  81  0028 725f5308      	clr	21256
  82                     ; 69   TIM5->CCMR3 = (uint8_t)TIM5_CCMR3_RESET_VALUE;
  84  002c 725f5309      	clr	21257
  85                     ; 70   TIM5->CNTRH = (uint8_t)TIM5_CNTRH_RESET_VALUE;
  87  0030 725f530c      	clr	21260
  88                     ; 71   TIM5->CNTRL = (uint8_t)TIM5_CNTRL_RESET_VALUE;
  90  0034 725f530d      	clr	21261
  91                     ; 72   TIM5->PSCR	= (uint8_t)TIM5_PSCR_RESET_VALUE;
  93  0038 725f530e      	clr	21262
  94                     ; 73   TIM5->ARRH 	= (uint8_t)TIM5_ARRH_RESET_VALUE;
  96  003c 35ff530f      	mov	21263,#255
  97                     ; 74   TIM5->ARRL 	= (uint8_t)TIM5_ARRL_RESET_VALUE;
  99  0040 35ff5310      	mov	21264,#255
 100                     ; 75   TIM5->CCR1H = (uint8_t)TIM5_CCR1H_RESET_VALUE;
 102  0044 725f5311      	clr	21265
 103                     ; 76   TIM5->CCR1L = (uint8_t)TIM5_CCR1L_RESET_VALUE;
 105  0048 725f5312      	clr	21266
 106                     ; 77   TIM5->CCR2H = (uint8_t)TIM5_CCR2H_RESET_VALUE;
 108  004c 725f5313      	clr	21267
 109                     ; 78   TIM5->CCR2L = (uint8_t)TIM5_CCR2L_RESET_VALUE;
 111  0050 725f5314      	clr	21268
 112                     ; 79   TIM5->CCR3H = (uint8_t)TIM5_CCR3H_RESET_VALUE;
 114  0054 725f5315      	clr	21269
 115                     ; 80   TIM5->CCR3L = (uint8_t)TIM5_CCR3L_RESET_VALUE;
 117  0058 725f5316      	clr	21270
 118                     ; 81   TIM5->SR1 = (uint8_t)TIM5_SR1_RESET_VALUE;
 120  005c 725f5304      	clr	21252
 121                     ; 82 }
 124  0060 81            	ret
 292                     ; 90 void TIM5_TimeBaseInit( TIM5_Prescaler_TypeDef TIM5_Prescaler,
 292                     ; 91                         uint16_t TIM5_Period)
 292                     ; 92 {
 293                     	switch	.text
 294  0061               _TIM5_TimeBaseInit:
 296  0061 88            	push	a
 297       00000000      OFST:	set	0
 300                     ; 94   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 302  0062 c7530e        	ld	21262,a
 303                     ; 96   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 305  0065 7b04          	ld	a,(OFST+4,sp)
 306  0067 c7530f        	ld	21263,a
 307                     ; 97   TIM5->ARRL = (uint8_t)(TIM5_Period);
 309  006a 7b05          	ld	a,(OFST+5,sp)
 310  006c c75310        	ld	21264,a
 311                     ; 98 }
 314  006f 84            	pop	a
 315  0070 81            	ret
 472                     ; 108 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
 472                     ; 109                   TIM5_OutputState_TypeDef TIM5_OutputState,
 472                     ; 110                   uint16_t TIM5_Pulse,
 472                     ; 111                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
 472                     ; 112 {
 473                     	switch	.text
 474  0071               _TIM5_OC1Init:
 476  0071 89            	pushw	x
 477  0072 88            	push	a
 478       00000001      OFST:	set	1
 481                     ; 114   assert_param(IS_TIM5_OC_MODE_OK(TIM5_OCMode));
 483                     ; 115   assert_param(IS_TIM5_OUTPUT_STATE_OK(TIM5_OutputState));
 485                     ; 116   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
 487                     ; 119   TIM5->CCER1 &= (uint8_t)(~( TIM5_CCER1_CC1E | TIM5_CCER1_CC1P));
 489  0073 c6530a        	ld	a,21258
 490  0076 a4fc          	and	a,#252
 491  0078 c7530a        	ld	21258,a
 492                     ; 121   TIM5->CCER1 |= (uint8_t)((uint8_t)(TIM5_OutputState & TIM5_CCER1_CC1E )| 
 492                     ; 122                            (uint8_t)(TIM5_OCPolarity & TIM5_CCER1_CC1P));
 494  007b 7b08          	ld	a,(OFST+7,sp)
 495  007d a402          	and	a,#2
 496  007f 6b01          	ld	(OFST+0,sp),a
 498  0081 9f            	ld	a,xl
 499  0082 a401          	and	a,#1
 500  0084 1a01          	or	a,(OFST+0,sp)
 501  0086 ca530a        	or	a,21258
 502  0089 c7530a        	ld	21258,a
 503                     ; 125   TIM5->CCMR1 = (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~TIM5_CCMR_OCM)) | 
 503                     ; 126                           (uint8_t)TIM5_OCMode);
 505  008c c65307        	ld	a,21255
 506  008f a48f          	and	a,#143
 507  0091 1a02          	or	a,(OFST+1,sp)
 508  0093 c75307        	ld	21255,a
 509                     ; 129   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
 511  0096 7b06          	ld	a,(OFST+5,sp)
 512  0098 c75311        	ld	21265,a
 513                     ; 130   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
 515  009b 7b07          	ld	a,(OFST+6,sp)
 516  009d c75312        	ld	21266,a
 517                     ; 131 }
 520  00a0 5b03          	addw	sp,#3
 521  00a2 81            	ret
 585                     ; 141 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
 585                     ; 142                   TIM5_OutputState_TypeDef TIM5_OutputState,
 585                     ; 143                   uint16_t TIM5_Pulse,
 585                     ; 144                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
 585                     ; 145 {
 586                     	switch	.text
 587  00a3               _TIM5_OC2Init:
 589  00a3 89            	pushw	x
 590  00a4 88            	push	a
 591       00000001      OFST:	set	1
 594                     ; 147   assert_param(IS_TIM5_OC_MODE_OK(TIM5_OCMode));
 596                     ; 148   assert_param(IS_TIM5_OUTPUT_STATE_OK(TIM5_OutputState));
 598                     ; 149   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
 600                     ; 152   TIM5->CCER1 &= (uint8_t)(~( TIM5_CCER1_CC2E |  TIM5_CCER1_CC2P ));
 602  00a5 c6530a        	ld	a,21258
 603  00a8 a4cf          	and	a,#207
 604  00aa c7530a        	ld	21258,a
 605                     ; 154   TIM5->CCER1 |= (uint8_t)((uint8_t)(TIM5_OutputState  & TIM5_CCER1_CC2E )| \
 605                     ; 155     (uint8_t)(TIM5_OCPolarity & TIM5_CCER1_CC2P));
 607  00ad 7b08          	ld	a,(OFST+7,sp)
 608  00af a420          	and	a,#32
 609  00b1 6b01          	ld	(OFST+0,sp),a
 611  00b3 9f            	ld	a,xl
 612  00b4 a410          	and	a,#16
 613  00b6 1a01          	or	a,(OFST+0,sp)
 614  00b8 ca530a        	or	a,21258
 615  00bb c7530a        	ld	21258,a
 616                     ; 159   TIM5->CCMR2 = (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~TIM5_CCMR_OCM)) |
 616                     ; 160                           (uint8_t)TIM5_OCMode);
 618  00be c65308        	ld	a,21256
 619  00c1 a48f          	and	a,#143
 620  00c3 1a02          	or	a,(OFST+1,sp)
 621  00c5 c75308        	ld	21256,a
 622                     ; 163   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
 624  00c8 7b06          	ld	a,(OFST+5,sp)
 625  00ca c75313        	ld	21267,a
 626                     ; 164   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
 628  00cd 7b07          	ld	a,(OFST+6,sp)
 629  00cf c75314        	ld	21268,a
 630                     ; 165 }
 633  00d2 5b03          	addw	sp,#3
 634  00d4 81            	ret
 698                     ; 175 void TIM5_OC3Init(TIM5_OCMode_TypeDef TIM5_OCMode,
 698                     ; 176                   TIM5_OutputState_TypeDef TIM5_OutputState,
 698                     ; 177                   uint16_t TIM5_Pulse,
 698                     ; 178                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
 698                     ; 179 {
 699                     	switch	.text
 700  00d5               _TIM5_OC3Init:
 702  00d5 89            	pushw	x
 703  00d6 88            	push	a
 704       00000001      OFST:	set	1
 707                     ; 181   assert_param(IS_TIM5_OC_MODE_OK(TIM5_OCMode));
 709                     ; 182   assert_param(IS_TIM5_OUTPUT_STATE_OK(TIM5_OutputState));
 711                     ; 183   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
 713                     ; 185   TIM5->CCER2 &= (uint8_t)(~( TIM5_CCER2_CC3E  | TIM5_CCER2_CC3P));
 715  00d7 c6530b        	ld	a,21259
 716  00da a4fc          	and	a,#252
 717  00dc c7530b        	ld	21259,a
 718                     ; 187   TIM5->CCER2 |= (uint8_t)((uint8_t)(TIM5_OutputState  & TIM5_CCER2_CC3E   )|
 718                     ; 188                            (uint8_t)(TIM5_OCPolarity   & TIM5_CCER2_CC3P   ));
 720  00df 7b08          	ld	a,(OFST+7,sp)
 721  00e1 a402          	and	a,#2
 722  00e3 6b01          	ld	(OFST+0,sp),a
 724  00e5 9f            	ld	a,xl
 725  00e6 a401          	and	a,#1
 726  00e8 1a01          	or	a,(OFST+0,sp)
 727  00ea ca530b        	or	a,21259
 728  00ed c7530b        	ld	21259,a
 729                     ; 191   TIM5->CCMR3 = (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~TIM5_CCMR_OCM)) | (uint8_t)TIM5_OCMode);
 731  00f0 c65309        	ld	a,21257
 732  00f3 a48f          	and	a,#143
 733  00f5 1a02          	or	a,(OFST+1,sp)
 734  00f7 c75309        	ld	21257,a
 735                     ; 194   TIM5->CCR3H = (uint8_t)(TIM5_Pulse >> 8);
 737  00fa 7b06          	ld	a,(OFST+5,sp)
 738  00fc c75315        	ld	21269,a
 739                     ; 195   TIM5->CCR3L = (uint8_t)(TIM5_Pulse);
 741  00ff 7b07          	ld	a,(OFST+6,sp)
 742  0101 c75316        	ld	21270,a
 743                     ; 196 }
 746  0104 5b03          	addw	sp,#3
 747  0106 81            	ret
 940                     ; 207 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
 940                     ; 208                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
 940                     ; 209                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
 940                     ; 210                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
 940                     ; 211                  uint8_t TIM5_ICFilter)
 940                     ; 212 {
 941                     	switch	.text
 942  0107               _TIM5_ICInit:
 944  0107 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 214   assert_param(IS_TIM5_CHANNEL_OK(TIM5_Channel));
 950                     ; 215   assert_param(IS_TIM5_IC_POLARITY_OK(TIM5_ICPolarity));
 952                     ; 216   assert_param(IS_TIM5_IC_SELECTION_OK(TIM5_ICSelection));
 954                     ; 217   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_ICPrescaler));
 956                     ; 218   assert_param(IS_TIM5_IC_FILTER_OK(TIM5_ICFilter));
 958                     ; 220   if (TIM5_Channel == TIM5_CHANNEL_1)
 960  0108 9e            	ld	a,xh
 961  0109 4d            	tnz	a
 962  010a 2614          	jrne	L104
 963                     ; 223     TI1_Config((uint8_t)TIM5_ICPolarity,
 963                     ; 224                (uint8_t)TIM5_ICSelection,
 963                     ; 225                (uint8_t)TIM5_ICFilter);
 965  010c 7b07          	ld	a,(OFST+7,sp)
 966  010e 88            	push	a
 967  010f 7b06          	ld	a,(OFST+6,sp)
 968  0111 97            	ld	xl,a
 969  0112 7b03          	ld	a,(OFST+3,sp)
 970  0114 95            	ld	xh,a
 971  0115 cd0432        	call	L3_TI1_Config
 973  0118 84            	pop	a
 974                     ; 228     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
 976  0119 7b06          	ld	a,(OFST+6,sp)
 977  011b cd0348        	call	_TIM5_SetIC1Prescaler
 980  011e 202c          	jra	L304
 981  0120               L104:
 982                     ; 230   else if (TIM5_Channel == TIM5_CHANNEL_2)
 984  0120 7b01          	ld	a,(OFST+1,sp)
 985  0122 a101          	cp	a,#1
 986  0124 2614          	jrne	L504
 987                     ; 233     TI2_Config((uint8_t)TIM5_ICPolarity,
 987                     ; 234                (uint8_t)TIM5_ICSelection,
 987                     ; 235                (uint8_t)TIM5_ICFilter);
 989  0126 7b07          	ld	a,(OFST+7,sp)
 990  0128 88            	push	a
 991  0129 7b06          	ld	a,(OFST+6,sp)
 992  012b 97            	ld	xl,a
 993  012c 7b03          	ld	a,(OFST+3,sp)
 994  012e 95            	ld	xh,a
 995  012f cd0462        	call	L5_TI2_Config
 997  0132 84            	pop	a
 998                     ; 238     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
1000  0133 7b06          	ld	a,(OFST+6,sp)
1001  0135 cd0355        	call	_TIM5_SetIC2Prescaler
1004  0138 2012          	jra	L304
1005  013a               L504:
1006                     ; 243     TI3_Config((uint8_t)TIM5_ICPolarity,
1006                     ; 244                (uint8_t)TIM5_ICSelection,
1006                     ; 245                (uint8_t)TIM5_ICFilter);
1008  013a 7b07          	ld	a,(OFST+7,sp)
1009  013c 88            	push	a
1010  013d 7b06          	ld	a,(OFST+6,sp)
1011  013f 97            	ld	xl,a
1012  0140 7b03          	ld	a,(OFST+3,sp)
1013  0142 95            	ld	xh,a
1014  0143 cd0492        	call	L7_TI3_Config
1016  0146 84            	pop	a
1017                     ; 248     TIM5_SetIC3Prescaler(TIM5_ICPrescaler);
1019  0147 7b06          	ld	a,(OFST+6,sp)
1020  0149 cd0362        	call	_TIM5_SetIC3Prescaler
1022  014c               L304:
1023                     ; 250 }
1026  014c 85            	popw	x
1027  014d 81            	ret
1123                     ; 261 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
1123                     ; 262                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
1123                     ; 263                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
1123                     ; 264                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
1123                     ; 265                      uint8_t TIM5_ICFilter)
1123                     ; 266 {
1124                     	switch	.text
1125  014e               _TIM5_PWMIConfig:
1127  014e 89            	pushw	x
1128  014f 89            	pushw	x
1129       00000002      OFST:	set	2
1132                     ; 267   uint8_t icpolarity = (uint8_t)TIM5_ICPOLARITY_RISING;
1134                     ; 268   uint8_t icselection = (uint8_t)TIM5_ICSELECTION_DIRECTTI;
1136                     ; 271   assert_param(IS_TIM5_PWMI_CHANNEL_OK(TIM5_Channel));
1138                     ; 272   assert_param(IS_TIM5_IC_POLARITY_OK(TIM5_ICPolarity));
1140                     ; 273   assert_param(IS_TIM5_IC_SELECTION_OK(TIM5_ICSelection));
1142                     ; 274   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_ICPrescaler));
1144                     ; 277   if (TIM5_ICPolarity != TIM5_ICPOLARITY_FALLING)
1146  0150 9f            	ld	a,xl
1147  0151 a144          	cp	a,#68
1148  0153 2706          	jreq	L754
1149                     ; 279     icpolarity = (uint8_t)TIM5_ICPOLARITY_FALLING;
1151  0155 a644          	ld	a,#68
1152  0157 6b01          	ld	(OFST-1,sp),a
1155  0159 2002          	jra	L164
1156  015b               L754:
1157                     ; 283     icpolarity = (uint8_t)TIM5_ICPOLARITY_RISING;
1159  015b 0f01          	clr	(OFST-1,sp)
1161  015d               L164:
1162                     ; 287   if (TIM5_ICSelection == TIM5_ICSELECTION_DIRECTTI)
1164  015d 7b07          	ld	a,(OFST+5,sp)
1165  015f a101          	cp	a,#1
1166  0161 2606          	jrne	L364
1167                     ; 289     icselection = (uint8_t)TIM5_ICSELECTION_INDIRECTTI;
1169  0163 a602          	ld	a,#2
1170  0165 6b02          	ld	(OFST+0,sp),a
1173  0167 2004          	jra	L564
1174  0169               L364:
1175                     ; 293     icselection = (uint8_t)TIM5_ICSELECTION_DIRECTTI;
1177  0169 a601          	ld	a,#1
1178  016b 6b02          	ld	(OFST+0,sp),a
1180  016d               L564:
1181                     ; 296   if (TIM5_Channel == TIM5_CHANNEL_1)
1183  016d 0d03          	tnz	(OFST+1,sp)
1184  016f 2626          	jrne	L764
1185                     ; 299     TI1_Config((uint8_t)TIM5_ICPolarity, (uint8_t)TIM5_ICSelection,
1185                     ; 300                (uint8_t)TIM5_ICFilter);
1187  0171 7b09          	ld	a,(OFST+7,sp)
1188  0173 88            	push	a
1189  0174 7b08          	ld	a,(OFST+6,sp)
1190  0176 97            	ld	xl,a
1191  0177 7b05          	ld	a,(OFST+3,sp)
1192  0179 95            	ld	xh,a
1193  017a cd0432        	call	L3_TI1_Config
1195  017d 84            	pop	a
1196                     ; 303     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
1198  017e 7b08          	ld	a,(OFST+6,sp)
1199  0180 cd0348        	call	_TIM5_SetIC1Prescaler
1201                     ; 306     TI2_Config((uint8_t)icpolarity, (uint8_t)icselection, (uint8_t)TIM5_ICFilter);
1203  0183 7b09          	ld	a,(OFST+7,sp)
1204  0185 88            	push	a
1205  0186 7b03          	ld	a,(OFST+1,sp)
1206  0188 97            	ld	xl,a
1207  0189 7b02          	ld	a,(OFST+0,sp)
1208  018b 95            	ld	xh,a
1209  018c cd0462        	call	L5_TI2_Config
1211  018f 84            	pop	a
1212                     ; 309     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
1214  0190 7b08          	ld	a,(OFST+6,sp)
1215  0192 cd0355        	call	_TIM5_SetIC2Prescaler
1218  0195 2024          	jra	L174
1219  0197               L764:
1220                     ; 314     TI2_Config((uint8_t)TIM5_ICPolarity, (uint8_t)TIM5_ICSelection,
1220                     ; 315                (uint8_t)TIM5_ICFilter);
1222  0197 7b09          	ld	a,(OFST+7,sp)
1223  0199 88            	push	a
1224  019a 7b08          	ld	a,(OFST+6,sp)
1225  019c 97            	ld	xl,a
1226  019d 7b05          	ld	a,(OFST+3,sp)
1227  019f 95            	ld	xh,a
1228  01a0 cd0462        	call	L5_TI2_Config
1230  01a3 84            	pop	a
1231                     ; 318     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
1233  01a4 7b08          	ld	a,(OFST+6,sp)
1234  01a6 cd0355        	call	_TIM5_SetIC2Prescaler
1236                     ; 321     TI1_Config((uint8_t)icpolarity, (uint8_t)icselection, (uint8_t)TIM5_ICFilter);
1238  01a9 7b09          	ld	a,(OFST+7,sp)
1239  01ab 88            	push	a
1240  01ac 7b03          	ld	a,(OFST+1,sp)
1241  01ae 97            	ld	xl,a
1242  01af 7b02          	ld	a,(OFST+0,sp)
1243  01b1 95            	ld	xh,a
1244  01b2 cd0432        	call	L3_TI1_Config
1246  01b5 84            	pop	a
1247                     ; 324     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
1249  01b6 7b08          	ld	a,(OFST+6,sp)
1250  01b8 cd0348        	call	_TIM5_SetIC1Prescaler
1252  01bb               L174:
1253                     ; 326 }
1256  01bb 5b04          	addw	sp,#4
1257  01bd 81            	ret
1312                     ; 334 void TIM5_Cmd(FunctionalState NewState)
1312                     ; 335 {
1313                     	switch	.text
1314  01be               _TIM5_Cmd:
1318                     ; 337   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1320                     ; 340   if (NewState != DISABLE)
1322  01be 4d            	tnz	a
1323  01bf 2706          	jreq	L125
1324                     ; 342     TIM5->CR1 |= TIM5_CR1_CEN ;
1326  01c1 72105300      	bset	21248,#0
1328  01c5 2004          	jra	L325
1329  01c7               L125:
1330                     ; 346     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_CEN) ;
1332  01c7 72115300      	bres	21248,#0
1333  01cb               L325:
1334                     ; 348 }
1337  01cb 81            	ret
1423                     ; 363 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
1423                     ; 364 {
1424                     	switch	.text
1425  01cc               _TIM5_ITConfig:
1427  01cc 89            	pushw	x
1428       00000000      OFST:	set	0
1431                     ; 366   assert_param(IS_TIM5_IT_OK(TIM5_IT));
1433                     ; 367   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1435                     ; 369   if (NewState != DISABLE)
1437  01cd 9f            	ld	a,xl
1438  01ce 4d            	tnz	a
1439  01cf 2709          	jreq	L565
1440                     ; 372     TIM5->IER |= (uint8_t)TIM5_IT;
1442  01d1 9e            	ld	a,xh
1443  01d2 ca5303        	or	a,21251
1444  01d5 c75303        	ld	21251,a
1446  01d8 2009          	jra	L765
1447  01da               L565:
1448                     ; 377     TIM5->IER &= (uint8_t)(~TIM5_IT);
1450  01da 7b01          	ld	a,(OFST+1,sp)
1451  01dc 43            	cpl	a
1452  01dd c45303        	and	a,21251
1453  01e0 c75303        	ld	21251,a
1454  01e3               L765:
1455                     ; 379 }
1458  01e3 85            	popw	x
1459  01e4 81            	ret
1495                     ; 387 void TIM5_UpdateDisableConfig(FunctionalState NewState)
1495                     ; 388 {
1496                     	switch	.text
1497  01e5               _TIM5_UpdateDisableConfig:
1501                     ; 390   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1503                     ; 393   if (NewState != DISABLE)
1505  01e5 4d            	tnz	a
1506  01e6 2706          	jreq	L706
1507                     ; 395     TIM5->CR1 |= TIM5_CR1_UDIS ;
1509  01e8 72125300      	bset	21248,#1
1511  01ec 2004          	jra	L116
1512  01ee               L706:
1513                     ; 399     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_UDIS) ;
1515  01ee 72135300      	bres	21248,#1
1516  01f2               L116:
1517                     ; 401 }
1520  01f2 81            	ret
1578                     ; 411 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
1578                     ; 412 {
1579                     	switch	.text
1580  01f3               _TIM5_UpdateRequestConfig:
1584                     ; 414   assert_param(IS_TIM5_UPDATE_SOURCE_OK(TIM5_UpdateSource));
1586                     ; 417   if (TIM5_UpdateSource != TIM5_UPDATESOURCE_GLOBAL)
1588  01f3 4d            	tnz	a
1589  01f4 2706          	jreq	L146
1590                     ; 419     TIM5->CR1 |= TIM5_CR1_URS ;
1592  01f6 72145300      	bset	21248,#2
1594  01fa 2004          	jra	L346
1595  01fc               L146:
1596                     ; 423     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_URS) ;
1598  01fc 72155300      	bres	21248,#2
1599  0200               L346:
1600                     ; 425 }
1603  0200 81            	ret
1660                     ; 435 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1660                     ; 436 {
1661                     	switch	.text
1662  0201               _TIM5_SelectOnePulseMode:
1666                     ; 438   assert_param(IS_TIM5_OPM_MODE_OK(TIM5_OPMode));
1668                     ; 441   if (TIM5_OPMode != TIM5_OPMODE_REPETITIVE)
1670  0201 4d            	tnz	a
1671  0202 2706          	jreq	L376
1672                     ; 443     TIM5->CR1 |= TIM5_CR1_OPM ;
1674  0204 72165300      	bset	21248,#3
1676  0208 2004          	jra	L576
1677  020a               L376:
1678                     ; 447     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_OPM) ;
1680  020a 72175300      	bres	21248,#3
1681  020e               L576:
1682                     ; 449 }
1685  020e 81            	ret
1753                     ; 479 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
1753                     ; 480                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
1753                     ; 481 {
1754                     	switch	.text
1755  020f               _TIM5_PrescalerConfig:
1759                     ; 483   assert_param(IS_TIM5_PRESCALER_RELOAD_OK(TIM5_PSCReloadMode));
1761                     ; 484   assert_param(IS_TIM5_PRESCALER_OK(Prescaler));
1763                     ; 487   TIM5->PSCR = (uint8_t)Prescaler;
1765  020f 9e            	ld	a,xh
1766  0210 c7530e        	ld	21262,a
1767                     ; 490   TIM5->EGR = (uint8_t)TIM5_PSCReloadMode ;
1769  0213 9f            	ld	a,xl
1770  0214 c75306        	ld	21254,a
1771                     ; 491 }
1774  0217 81            	ret
1832                     ; 502 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
1832                     ; 503 {
1833                     	switch	.text
1834  0218               _TIM5_ForcedOC1Config:
1836  0218 88            	push	a
1837       00000000      OFST:	set	0
1840                     ; 505   assert_param(IS_TIM5_FORCED_ACTION_OK(TIM5_ForcedAction));
1842                     ; 508   TIM5->CCMR1  =  (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~TIM5_CCMR_OCM))
1842                     ; 509                             | (uint8_t)TIM5_ForcedAction);
1844  0219 c65307        	ld	a,21255
1845  021c a48f          	and	a,#143
1846  021e 1a01          	or	a,(OFST+1,sp)
1847  0220 c75307        	ld	21255,a
1848                     ; 510 }
1851  0223 84            	pop	a
1852  0224 81            	ret
1888                     ; 521 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
1888                     ; 522 {
1889                     	switch	.text
1890  0225               _TIM5_ForcedOC2Config:
1892  0225 88            	push	a
1893       00000000      OFST:	set	0
1896                     ; 524   assert_param(IS_TIM5_FORCED_ACTION_OK(TIM5_ForcedAction));
1898                     ; 527   TIM5->CCMR2  =  (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~TIM5_CCMR_OCM))
1898                     ; 528                             | (uint8_t)TIM5_ForcedAction);
1900  0226 c65308        	ld	a,21256
1901  0229 a48f          	and	a,#143
1902  022b 1a01          	or	a,(OFST+1,sp)
1903  022d c75308        	ld	21256,a
1904                     ; 529 }
1907  0230 84            	pop	a
1908  0231 81            	ret
1944                     ; 540 void TIM5_ForcedOC3Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
1944                     ; 541 {
1945                     	switch	.text
1946  0232               _TIM5_ForcedOC3Config:
1948  0232 88            	push	a
1949       00000000      OFST:	set	0
1952                     ; 543   assert_param(IS_TIM5_FORCED_ACTION_OK(TIM5_ForcedAction));
1954                     ; 546   TIM5->CCMR3  =  (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~TIM5_CCMR_OCM))  
1954                     ; 547                             | (uint8_t)TIM5_ForcedAction);
1956  0233 c65309        	ld	a,21257
1957  0236 a48f          	and	a,#143
1958  0238 1a01          	or	a,(OFST+1,sp)
1959  023a c75309        	ld	21257,a
1960                     ; 548 }
1963  023d 84            	pop	a
1964  023e 81            	ret
2000                     ; 556 void TIM5_ARRPreloadConfig(FunctionalState NewState)
2000                     ; 557 {
2001                     	switch	.text
2002  023f               _TIM5_ARRPreloadConfig:
2006                     ; 559   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2008                     ; 562   if (NewState != DISABLE)
2010  023f 4d            	tnz	a
2011  0240 2706          	jreq	L1301
2012                     ; 564     TIM5->CR1 |= TIM5_CR1_ARPE ;
2014  0242 721e5300      	bset	21248,#7
2016  0246 2004          	jra	L3301
2017  0248               L1301:
2018                     ; 568     TIM5->CR1 &= (uint8_t)(~TIM5_CR1_ARPE) ;
2020  0248 721f5300      	bres	21248,#7
2021  024c               L3301:
2022                     ; 570 }
2025  024c 81            	ret
2061                     ; 578 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2061                     ; 579 {
2062                     	switch	.text
2063  024d               _TIM5_OC1PreloadConfig:
2067                     ; 581   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2069                     ; 584   if (NewState != DISABLE)
2071  024d 4d            	tnz	a
2072  024e 2706          	jreq	L3501
2073                     ; 586     TIM5->CCMR1 |= TIM5_CCMR_OCxPE ;
2075  0250 72165307      	bset	21255,#3
2077  0254 2004          	jra	L5501
2078  0256               L3501:
2079                     ; 590     TIM5->CCMR1 &= (uint8_t)(~TIM5_CCMR_OCxPE) ;
2081  0256 72175307      	bres	21255,#3
2082  025a               L5501:
2083                     ; 592 }
2086  025a 81            	ret
2122                     ; 600 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2122                     ; 601 {
2123                     	switch	.text
2124  025b               _TIM5_OC2PreloadConfig:
2128                     ; 603   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2130                     ; 606   if (NewState != DISABLE)
2132  025b 4d            	tnz	a
2133  025c 2706          	jreq	L5701
2134                     ; 608     TIM5->CCMR2 |= TIM5_CCMR_OCxPE ;
2136  025e 72165308      	bset	21256,#3
2138  0262 2004          	jra	L7701
2139  0264               L5701:
2140                     ; 612     TIM5->CCMR2 &= (uint8_t)(~TIM5_CCMR_OCxPE) ;
2142  0264 72175308      	bres	21256,#3
2143  0268               L7701:
2144                     ; 614 }
2147  0268 81            	ret
2183                     ; 622 void TIM5_OC3PreloadConfig(FunctionalState NewState)
2183                     ; 623 {
2184                     	switch	.text
2185  0269               _TIM5_OC3PreloadConfig:
2189                     ; 625   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2191                     ; 628   if (NewState != DISABLE)
2193  0269 4d            	tnz	a
2194  026a 2706          	jreq	L7111
2195                     ; 630     TIM5->CCMR3 |= TIM5_CCMR_OCxPE ;
2197  026c 72165309      	bset	21257,#3
2199  0270 2004          	jra	L1211
2200  0272               L7111:
2201                     ; 634     TIM5->CCMR3 &= (uint8_t)(~TIM5_CCMR_OCxPE) ;
2203  0272 72175309      	bres	21257,#3
2204  0276               L1211:
2205                     ; 636 }
2208  0276 81            	ret
2289                     ; 648 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
2289                     ; 649 {
2290                     	switch	.text
2291  0277               _TIM5_GenerateEvent:
2295                     ; 651   assert_param(IS_TIM5_EVENT_SOURCE_OK(TIM5_EventSource));
2297                     ; 654   TIM5->EGR = (uint8_t)TIM5_EventSource;
2299  0277 c75306        	ld	21254,a
2300                     ; 655 }
2303  027a 81            	ret
2339                     ; 665 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2339                     ; 666 {
2340                     	switch	.text
2341  027b               _TIM5_OC1PolarityConfig:
2345                     ; 668     assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
2347                     ; 671     if (TIM5_OCPolarity != TIM5_OCPOLARITY_HIGH)
2349  027b 4d            	tnz	a
2350  027c 2706          	jreq	L5711
2351                     ; 673         TIM5->CCER1 |= TIM5_CCER1_CC1P ;
2353  027e 7212530a      	bset	21258,#1
2355  0282 2004          	jra	L7711
2356  0284               L5711:
2357                     ; 677         TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1P) ;
2359  0284 7213530a      	bres	21258,#1
2360  0288               L7711:
2361                     ; 679 }
2364  0288 81            	ret
2400                     ; 690 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2400                     ; 691 {
2401                     	switch	.text
2402  0289               _TIM5_OC2PolarityConfig:
2406                     ; 693   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
2408                     ; 696   if (TIM5_OCPolarity != TIM5_OCPOLARITY_HIGH)
2410  0289 4d            	tnz	a
2411  028a 2706          	jreq	L7121
2412                     ; 698     TIM5->CCER1 |= TIM5_CCER1_CC2P ;
2414  028c 721a530a      	bset	21258,#5
2416  0290 2004          	jra	L1221
2417  0292               L7121:
2418                     ; 702     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2P) ;
2420  0292 721b530a      	bres	21258,#5
2421  0296               L1221:
2422                     ; 704 }
2425  0296 81            	ret
2461                     ; 714 void TIM5_OC3PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2461                     ; 715 {
2462                     	switch	.text
2463  0297               _TIM5_OC3PolarityConfig:
2467                     ; 717   assert_param(IS_TIM5_OC_POLARITY_OK(TIM5_OCPolarity));
2469                     ; 720   if (TIM5_OCPolarity != TIM5_OCPOLARITY_HIGH)
2471  0297 4d            	tnz	a
2472  0298 2706          	jreq	L1421
2473                     ; 722     TIM5->CCER2 |= TIM5_CCER2_CC3P ;
2475  029a 7212530b      	bset	21259,#1
2477  029e 2004          	jra	L3421
2478  02a0               L1421:
2479                     ; 726     TIM5->CCER2 &= (uint8_t)(~TIM5_CCER2_CC3P) ;
2481  02a0 7213530b      	bres	21259,#1
2482  02a4               L3421:
2483                     ; 728 }
2486  02a4 81            	ret
2531                     ; 741 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel, FunctionalState NewState)
2531                     ; 742 {
2532                     	switch	.text
2533  02a5               _TIM5_CCxCmd:
2535  02a5 89            	pushw	x
2536       00000000      OFST:	set	0
2539                     ; 744   assert_param(IS_TIM5_CHANNEL_OK(TIM5_Channel));
2541                     ; 745   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2543                     ; 747   if (TIM5_Channel == TIM5_CHANNEL_1)
2545  02a6 9e            	ld	a,xh
2546  02a7 4d            	tnz	a
2547  02a8 2610          	jrne	L7621
2548                     ; 750     if (NewState != DISABLE)
2550  02aa 9f            	ld	a,xl
2551  02ab 4d            	tnz	a
2552  02ac 2706          	jreq	L1721
2553                     ; 752       TIM5->CCER1 |= TIM5_CCER1_CC1E ;
2555  02ae 7210530a      	bset	21258,#0
2557  02b2 202a          	jra	L5721
2558  02b4               L1721:
2559                     ; 756       TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1E) ;
2561  02b4 7211530a      	bres	21258,#0
2562  02b8 2024          	jra	L5721
2563  02ba               L7621:
2564                     ; 760   else if (TIM5_Channel == TIM5_CHANNEL_2)
2566  02ba 7b01          	ld	a,(OFST+1,sp)
2567  02bc a101          	cp	a,#1
2568  02be 2610          	jrne	L7721
2569                     ; 763     if (NewState != DISABLE)
2571  02c0 0d02          	tnz	(OFST+2,sp)
2572  02c2 2706          	jreq	L1031
2573                     ; 765       TIM5->CCER1 |= TIM5_CCER1_CC2E;
2575  02c4 7218530a      	bset	21258,#4
2577  02c8 2014          	jra	L5721
2578  02ca               L1031:
2579                     ; 769       TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2E) ;
2581  02ca 7219530a      	bres	21258,#4
2582  02ce 200e          	jra	L5721
2583  02d0               L7721:
2584                     ; 775     if (NewState != DISABLE)
2586  02d0 0d02          	tnz	(OFST+2,sp)
2587  02d2 2706          	jreq	L7031
2588                     ; 777       TIM5->CCER2 |= TIM5_CCER2_CC3E;
2590  02d4 7210530b      	bset	21259,#0
2592  02d8 2004          	jra	L5721
2593  02da               L7031:
2594                     ; 781       TIM5->CCER2 &= (uint8_t)(~TIM5_CCER2_CC3E) ;
2596  02da 7211530b      	bres	21259,#0
2597  02de               L5721:
2598                     ; 784 }
2601  02de 85            	popw	x
2602  02df 81            	ret
2647                     ; 806 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel, TIM5_OCMode_TypeDef TIM5_OCMode)
2647                     ; 807 {
2648                     	switch	.text
2649  02e0               _TIM5_SelectOCxM:
2651  02e0 89            	pushw	x
2652       00000000      OFST:	set	0
2655                     ; 809   assert_param(IS_TIM5_CHANNEL_OK(TIM5_Channel));
2657                     ; 810   assert_param(IS_TIM5_OCM_OK(TIM5_OCMode));
2659                     ; 812   if (TIM5_Channel == TIM5_CHANNEL_1)
2661  02e1 9e            	ld	a,xh
2662  02e2 4d            	tnz	a
2663  02e3 2610          	jrne	L5331
2664                     ; 815     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1E);
2666  02e5 7211530a      	bres	21258,#0
2667                     ; 818     TIM5->CCMR1 = (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~TIM5_CCMR_OCM)) 
2667                     ; 819                             | (uint8_t)TIM5_OCMode);
2669  02e9 c65307        	ld	a,21255
2670  02ec a48f          	and	a,#143
2671  02ee 1a02          	or	a,(OFST+2,sp)
2672  02f0 c75307        	ld	21255,a
2674  02f3 2024          	jra	L7331
2675  02f5               L5331:
2676                     ; 821   else if (TIM5_Channel == TIM5_CHANNEL_2)
2678  02f5 7b01          	ld	a,(OFST+1,sp)
2679  02f7 a101          	cp	a,#1
2680  02f9 2610          	jrne	L1431
2681                     ; 824     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2E);
2683  02fb 7219530a      	bres	21258,#4
2684                     ; 827     TIM5->CCMR2 = (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~TIM5_CCMR_OCM))
2684                     ; 828                             | (uint8_t)TIM5_OCMode);
2686  02ff c65308        	ld	a,21256
2687  0302 a48f          	and	a,#143
2688  0304 1a02          	or	a,(OFST+2,sp)
2689  0306 c75308        	ld	21256,a
2691  0309 200e          	jra	L7331
2692  030b               L1431:
2693                     ; 833     TIM5->CCER2 &= (uint8_t)(~TIM5_CCER2_CC3E);
2695  030b 7211530b      	bres	21259,#0
2696                     ; 836     TIM5->CCMR3 = (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~TIM5_CCMR_OCM))
2696                     ; 837                             | (uint8_t)TIM5_OCMode);
2698  030f c65309        	ld	a,21257
2699  0312 a48f          	and	a,#143
2700  0314 1a02          	or	a,(OFST+2,sp)
2701  0316 c75309        	ld	21257,a
2702  0319               L7331:
2703                     ; 839 }
2706  0319 85            	popw	x
2707  031a 81            	ret
2741                     ; 847 void TIM5_SetCounter(uint16_t Counter)
2741                     ; 848 {
2742                     	switch	.text
2743  031b               _TIM5_SetCounter:
2747                     ; 850   TIM5->CNTRH = (uint8_t)(Counter >> 8);
2749  031b 9e            	ld	a,xh
2750  031c c7530c        	ld	21260,a
2751                     ; 851   TIM5->CNTRL = (uint8_t)(Counter);
2753  031f 9f            	ld	a,xl
2754  0320 c7530d        	ld	21261,a
2755                     ; 852 }
2758  0323 81            	ret
2792                     ; 860 void TIM5_SetAutoreload(uint16_t Autoreload)
2792                     ; 861 {
2793                     	switch	.text
2794  0324               _TIM5_SetAutoreload:
2798                     ; 863   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
2800  0324 9e            	ld	a,xh
2801  0325 c7530f        	ld	21263,a
2802                     ; 864   TIM5->ARRL = (uint8_t)(Autoreload);
2804  0328 9f            	ld	a,xl
2805  0329 c75310        	ld	21264,a
2806                     ; 865 }
2809  032c 81            	ret
2843                     ; 873 void TIM5_SetCompare1(uint16_t Compare1)
2843                     ; 874 {
2844                     	switch	.text
2845  032d               _TIM5_SetCompare1:
2849                     ; 876   TIM5->CCR1H = (uint8_t)(Compare1 >> 8);
2851  032d 9e            	ld	a,xh
2852  032e c75311        	ld	21265,a
2853                     ; 877   TIM5->CCR1L = (uint8_t)(Compare1);
2855  0331 9f            	ld	a,xl
2856  0332 c75312        	ld	21266,a
2857                     ; 878 }
2860  0335 81            	ret
2894                     ; 886 void TIM5_SetCompare2(uint16_t Compare2)
2894                     ; 887 {
2895                     	switch	.text
2896  0336               _TIM5_SetCompare2:
2900                     ; 889   TIM5->CCR2H = (uint8_t)(Compare2 >> 8);
2902  0336 9e            	ld	a,xh
2903  0337 c75313        	ld	21267,a
2904                     ; 890   TIM5->CCR2L = (uint8_t)(Compare2);
2906  033a 9f            	ld	a,xl
2907  033b c75314        	ld	21268,a
2908                     ; 891 }
2911  033e 81            	ret
2945                     ; 899 void TIM5_SetCompare3(uint16_t Compare3)
2945                     ; 900 {
2946                     	switch	.text
2947  033f               _TIM5_SetCompare3:
2951                     ; 902   TIM5->CCR3H = (uint8_t)(Compare3 >> 8);
2953  033f 9e            	ld	a,xh
2954  0340 c75315        	ld	21269,a
2955                     ; 903   TIM5->CCR3L = (uint8_t)(Compare3);
2957  0343 9f            	ld	a,xl
2958  0344 c75316        	ld	21270,a
2959                     ; 904 }
2962  0347 81            	ret
2998                     ; 916 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
2998                     ; 917 {
2999                     	switch	.text
3000  0348               _TIM5_SetIC1Prescaler:
3002  0348 88            	push	a
3003       00000000      OFST:	set	0
3006                     ; 919   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_IC1Prescaler));
3008                     ; 922   TIM5->CCMR1 = (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~TIM5_CCMR_ICxPSC))|
3008                     ; 923                           (uint8_t)TIM5_IC1Prescaler);
3010  0349 c65307        	ld	a,21255
3011  034c a4f3          	and	a,#243
3012  034e 1a01          	or	a,(OFST+1,sp)
3013  0350 c75307        	ld	21255,a
3014                     ; 924 }
3017  0353 84            	pop	a
3018  0354 81            	ret
3054                     ; 936 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3054                     ; 937 {
3055                     	switch	.text
3056  0355               _TIM5_SetIC2Prescaler:
3058  0355 88            	push	a
3059       00000000      OFST:	set	0
3062                     ; 939   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_IC2Prescaler));
3064                     ; 942   TIM5->CCMR2 = (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~TIM5_CCMR_ICxPSC))
3064                     ; 943                           | (uint8_t)TIM5_IC2Prescaler);
3066  0356 c65308        	ld	a,21256
3067  0359 a4f3          	and	a,#243
3068  035b 1a01          	or	a,(OFST+1,sp)
3069  035d c75308        	ld	21256,a
3070                     ; 944 }
3073  0360 84            	pop	a
3074  0361 81            	ret
3110                     ; 956 void TIM5_SetIC3Prescaler(TIM5_ICPSC_TypeDef TIM5_IC3Prescaler)
3110                     ; 957 {
3111                     	switch	.text
3112  0362               _TIM5_SetIC3Prescaler:
3114  0362 88            	push	a
3115       00000000      OFST:	set	0
3118                     ; 959   assert_param(IS_TIM5_IC_PRESCALER_OK(TIM5_IC3Prescaler));
3120                     ; 961   TIM5->CCMR3 = (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~TIM5_CCMR_ICxPSC)) |
3120                     ; 962                           (uint8_t)TIM5_IC3Prescaler);
3122  0363 c65309        	ld	a,21257
3123  0366 a4f3          	and	a,#243
3124  0368 1a01          	or	a,(OFST+1,sp)
3125  036a c75309        	ld	21257,a
3126                     ; 963 }
3129  036d 84            	pop	a
3130  036e 81            	ret
3164                     ; 970 uint16_t TIM5_GetCapture1(void)
3164                     ; 971 {
3165                     	switch	.text
3166  036f               _TIM5_GetCapture1:
3168  036f 89            	pushw	x
3169       00000002      OFST:	set	2
3172                     ; 972   uint16_t temp = 0; 
3174                     ; 974   temp = ((uint16_t)TIM5->CCR1H << 8); 
3176  0370 c65311        	ld	a,21265
3177  0373 5f            	clrw	x
3178  0374 97            	ld	xl,a
3179  0375 4f            	clr	a
3180  0376 02            	rlwa	x,a
3181  0377 1f01          	ldw	(OFST-1,sp),x
3183                     ; 977   return (uint16_t)(temp | (uint16_t)(TIM5->CCR1L));
3185  0379 c65312        	ld	a,21266
3186  037c 5f            	clrw	x
3187  037d 97            	ld	xl,a
3188  037e 01            	rrwa	x,a
3189  037f 1a02          	or	a,(OFST+0,sp)
3190  0381 01            	rrwa	x,a
3191  0382 1a01          	or	a,(OFST-1,sp)
3192  0384 01            	rrwa	x,a
3195  0385 5b02          	addw	sp,#2
3196  0387 81            	ret
3230                     ; 985 uint16_t TIM5_GetCapture2(void)
3230                     ; 986 {
3231                     	switch	.text
3232  0388               _TIM5_GetCapture2:
3234  0388 89            	pushw	x
3235       00000002      OFST:	set	2
3238                     ; 987   uint16_t temp = 0; 
3240                     ; 989   temp = ((uint16_t)TIM5->CCR2H << 8);  
3242  0389 c65313        	ld	a,21267
3243  038c 5f            	clrw	x
3244  038d 97            	ld	xl,a
3245  038e 4f            	clr	a
3246  038f 02            	rlwa	x,a
3247  0390 1f01          	ldw	(OFST-1,sp),x
3249                     ; 992   return (uint16_t)(temp | (uint16_t)(TIM5->CCR2L));
3251  0392 c65314        	ld	a,21268
3252  0395 5f            	clrw	x
3253  0396 97            	ld	xl,a
3254  0397 01            	rrwa	x,a
3255  0398 1a02          	or	a,(OFST+0,sp)
3256  039a 01            	rrwa	x,a
3257  039b 1a01          	or	a,(OFST-1,sp)
3258  039d 01            	rrwa	x,a
3261  039e 5b02          	addw	sp,#2
3262  03a0 81            	ret
3296                     ; 1000 uint16_t TIM5_GetCapture3(void)
3296                     ; 1001 {
3297                     	switch	.text
3298  03a1               _TIM5_GetCapture3:
3300  03a1 89            	pushw	x
3301       00000002      OFST:	set	2
3304                     ; 1002   uint16_t temp = 0; 
3306                     ; 1004   temp = ((uint16_t)TIM5->CCR3H << 8);
3308  03a2 c65315        	ld	a,21269
3309  03a5 5f            	clrw	x
3310  03a6 97            	ld	xl,a
3311  03a7 4f            	clr	a
3312  03a8 02            	rlwa	x,a
3313  03a9 1f01          	ldw	(OFST-1,sp),x
3315                     ; 1006   return (uint16_t)(temp | (uint16_t)(TIM5->CCR3L));
3317  03ab c65316        	ld	a,21270
3318  03ae 5f            	clrw	x
3319  03af 97            	ld	xl,a
3320  03b0 01            	rrwa	x,a
3321  03b1 1a02          	or	a,(OFST+0,sp)
3322  03b3 01            	rrwa	x,a
3323  03b4 1a01          	or	a,(OFST-1,sp)
3324  03b6 01            	rrwa	x,a
3327  03b7 5b02          	addw	sp,#2
3328  03b9 81            	ret
3362                     ; 1014 uint16_t TIM5_GetCounter(void)
3362                     ; 1015 {
3363                     	switch	.text
3364  03ba               _TIM5_GetCounter:
3366  03ba 89            	pushw	x
3367       00000002      OFST:	set	2
3370                     ; 1016   uint16_t tmpcntr = 0;
3372                     ; 1018   tmpcntr = ((uint16_t)TIM5->CNTRH << 8); 
3374  03bb c6530c        	ld	a,21260
3375  03be 5f            	clrw	x
3376  03bf 97            	ld	xl,a
3377  03c0 4f            	clr	a
3378  03c1 02            	rlwa	x,a
3379  03c2 1f01          	ldw	(OFST-1,sp),x
3381                     ; 1020   return (uint16_t)(tmpcntr | (uint16_t)(TIM5->CNTRL));
3383  03c4 c6530d        	ld	a,21261
3384  03c7 5f            	clrw	x
3385  03c8 97            	ld	xl,a
3386  03c9 01            	rrwa	x,a
3387  03ca 1a02          	or	a,(OFST+0,sp)
3388  03cc 01            	rrwa	x,a
3389  03cd 1a01          	or	a,(OFST-1,sp)
3390  03cf 01            	rrwa	x,a
3393  03d0 5b02          	addw	sp,#2
3394  03d2 81            	ret
3418                     ; 1028 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
3418                     ; 1029 {
3419                     	switch	.text
3420  03d3               _TIM5_GetPrescaler:
3424                     ; 1031   return (TIM5_Prescaler_TypeDef)(TIM5->PSCR);
3426  03d3 c6530e        	ld	a,21262
3429  03d6 81            	ret
3575                     ; 1047 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3575                     ; 1048 {
3576                     	switch	.text
3577  03d7               _TIM5_GetFlagStatus:
3579  03d7 89            	pushw	x
3580  03d8 89            	pushw	x
3581       00000002      OFST:	set	2
3584                     ; 1049   FlagStatus bitstatus = RESET;
3586                     ; 1053   assert_param(IS_TIM5_GET_FLAG_OK(TIM5_FLAG));
3588                     ; 1055   tim5_flag_l= (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_FLAG);
3590  03d9 9f            	ld	a,xl
3591  03da c45304        	and	a,21252
3592  03dd 6b01          	ld	(OFST-1,sp),a
3594                     ; 1056   tim5_flag_h= (uint8_t)((uint16_t)TIM5_FLAG >> 8);
3596  03df 7b03          	ld	a,(OFST+1,sp)
3597  03e1 6b02          	ld	(OFST+0,sp),a
3599                     ; 1058   if (((tim5_flag_l)|(uint8_t)(TIM5->SR2 & tim5_flag_h)) != RESET )
3601  03e3 c65305        	ld	a,21253
3602  03e6 1402          	and	a,(OFST+0,sp)
3603  03e8 1a01          	or	a,(OFST-1,sp)
3604  03ea 2706          	jreq	L3171
3605                     ; 1060     bitstatus = SET;
3607  03ec a601          	ld	a,#1
3608  03ee 6b02          	ld	(OFST+0,sp),a
3611  03f0 2002          	jra	L5171
3612  03f2               L3171:
3613                     ; 1064     bitstatus = RESET;
3615  03f2 0f02          	clr	(OFST+0,sp)
3617  03f4               L5171:
3618                     ; 1066   return (FlagStatus)bitstatus;
3620  03f4 7b02          	ld	a,(OFST+0,sp)
3623  03f6 5b04          	addw	sp,#4
3624  03f8 81            	ret
3659                     ; 1082 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3659                     ; 1083 {
3660                     	switch	.text
3661  03f9               _TIM5_ClearFlag:
3663  03f9 89            	pushw	x
3664       00000000      OFST:	set	0
3667                     ; 1085   assert_param(IS_TIM5_CLEAR_FLAG_OK(TIM5_FLAG));
3669                     ; 1088   TIM5->SR1 = (uint8_t)(~((uint8_t)(TIM5_FLAG)));
3671  03fa 9f            	ld	a,xl
3672  03fb 43            	cpl	a
3673  03fc c75304        	ld	21252,a
3674                     ; 1089   TIM5->SR2 &= (uint8_t)(~((uint8_t)((uint16_t)TIM5_FLAG >> 8)));
3676  03ff 7b01          	ld	a,(OFST+1,sp)
3677  0401 43            	cpl	a
3678  0402 c45305        	and	a,21253
3679  0405 c75305        	ld	21253,a
3680                     ; 1090 }
3683  0408 85            	popw	x
3684  0409 81            	ret
3748                     ; 1103 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
3748                     ; 1104 {
3749                     	switch	.text
3750  040a               _TIM5_GetITStatus:
3752  040a 88            	push	a
3753  040b 89            	pushw	x
3754       00000002      OFST:	set	2
3757                     ; 1105   ITStatus bitstatus = RESET;
3759                     ; 1106   uint8_t TIM5_itStatus = 0, TIM5_itEnable = 0;
3763                     ; 1109   assert_param(IS_TIM5_GET_IT_OK(TIM5_IT));
3765                     ; 1111   TIM5_itStatus = (uint8_t)(TIM5->SR1 & TIM5_IT);
3767  040c c45304        	and	a,21252
3768  040f 6b01          	ld	(OFST-1,sp),a
3770                     ; 1113   TIM5_itEnable = (uint8_t)(TIM5->IER & TIM5_IT);
3772  0411 c65303        	ld	a,21251
3773  0414 1403          	and	a,(OFST+1,sp)
3774  0416 6b02          	ld	(OFST+0,sp),a
3776                     ; 1115   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET ))
3778  0418 0d01          	tnz	(OFST-1,sp)
3779  041a 270a          	jreq	L7671
3781  041c 0d02          	tnz	(OFST+0,sp)
3782  041e 2706          	jreq	L7671
3783                     ; 1117     bitstatus = SET;
3785  0420 a601          	ld	a,#1
3786  0422 6b02          	ld	(OFST+0,sp),a
3789  0424 2002          	jra	L1771
3790  0426               L7671:
3791                     ; 1121     bitstatus = RESET;
3793  0426 0f02          	clr	(OFST+0,sp)
3795  0428               L1771:
3796                     ; 1123   return (ITStatus)(bitstatus);
3798  0428 7b02          	ld	a,(OFST+0,sp)
3801  042a 5b03          	addw	sp,#3
3802  042c 81            	ret
3838                     ; 1136 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
3838                     ; 1137 {
3839                     	switch	.text
3840  042d               _TIM5_ClearITPendingBit:
3844                     ; 1139   assert_param(IS_TIM5_IT_OK(TIM5_IT));
3846                     ; 1142   TIM5->SR1 = (uint8_t)(~TIM5_IT);
3848  042d 43            	cpl	a
3849  042e c75304        	ld	21252,a
3850                     ; 1143 }
3853  0431 81            	ret
3905                     ; 1161 static void TI1_Config(uint8_t TIM5_ICPolarity,
3905                     ; 1162                        uint8_t TIM5_ICSelection,
3905                     ; 1163                        uint8_t TIM5_ICFilter)
3905                     ; 1164 {
3906                     	switch	.text
3907  0432               L3_TI1_Config:
3909  0432 89            	pushw	x
3910  0433 88            	push	a
3911       00000001      OFST:	set	1
3914                     ; 1166   TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1E);
3916  0434 7211530a      	bres	21258,#0
3917                     ; 1169   TIM5->CCMR1  = (uint8_t)((uint8_t)(TIM5->CCMR1 & (uint8_t)(~( TIM5_CCMR_CCxS | TIM5_CCMR_ICxF )))
3917                     ; 1170                            | (uint8_t)(( (TIM5_ICSelection)) | ((uint8_t)( TIM5_ICFilter << 4))));
3919  0438 7b06          	ld	a,(OFST+5,sp)
3920  043a 97            	ld	xl,a
3921  043b a610          	ld	a,#16
3922  043d 42            	mul	x,a
3923  043e 9f            	ld	a,xl
3924  043f 1a03          	or	a,(OFST+2,sp)
3925  0441 6b01          	ld	(OFST+0,sp),a
3927  0443 c65307        	ld	a,21255
3928  0446 a40c          	and	a,#12
3929  0448 1a01          	or	a,(OFST+0,sp)
3930  044a c75307        	ld	21255,a
3931                     ; 1173   if (TIM5_ICPolarity != TIM5_ICPOLARITY_RISING)
3933  044d 0d02          	tnz	(OFST+1,sp)
3934  044f 2706          	jreq	L7302
3935                     ; 1175     TIM5->CCER1 |= TIM5_CCER1_CC1P ;
3937  0451 7212530a      	bset	21258,#1
3939  0455 2004          	jra	L1402
3940  0457               L7302:
3941                     ; 1179     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1P) ;
3943  0457 7213530a      	bres	21258,#1
3944  045b               L1402:
3945                     ; 1182   TIM5->CCER1 |=  TIM5_CCER1_CC1E;
3947  045b 7210530a      	bset	21258,#0
3948                     ; 1183 }
3951  045f 5b03          	addw	sp,#3
3952  0461 81            	ret
4004                     ; 1201 static void TI2_Config(uint8_t TIM5_ICPolarity,
4004                     ; 1202                        uint8_t TIM5_ICSelection,
4004                     ; 1203                        uint8_t TIM5_ICFilter)
4004                     ; 1204 {
4005                     	switch	.text
4006  0462               L5_TI2_Config:
4008  0462 89            	pushw	x
4009  0463 88            	push	a
4010       00000001      OFST:	set	1
4013                     ; 1206   TIM5->CCER1 &=  (uint8_t)(~TIM5_CCER1_CC2E);
4015  0464 7219530a      	bres	21258,#4
4016                     ; 1209   TIM5->CCMR2  = (uint8_t)((uint8_t)(TIM5->CCMR2 & (uint8_t)(~( TIM5_CCMR_CCxS | TIM5_CCMR_ICxF)))
4016                     ; 1210                            | (uint8_t)(( (TIM5_ICSelection)) | ((uint8_t)( TIM5_ICFilter << 4))));
4018  0468 7b06          	ld	a,(OFST+5,sp)
4019  046a 97            	ld	xl,a
4020  046b a610          	ld	a,#16
4021  046d 42            	mul	x,a
4022  046e 9f            	ld	a,xl
4023  046f 1a03          	or	a,(OFST+2,sp)
4024  0471 6b01          	ld	(OFST+0,sp),a
4026  0473 c65308        	ld	a,21256
4027  0476 a40c          	and	a,#12
4028  0478 1a01          	or	a,(OFST+0,sp)
4029  047a c75308        	ld	21256,a
4030                     ; 1214   if (TIM5_ICPolarity != TIM5_ICPOLARITY_RISING)
4032  047d 0d02          	tnz	(OFST+1,sp)
4033  047f 2706          	jreq	L1702
4034                     ; 1216     TIM5->CCER1 |= TIM5_CCER1_CC2P ;
4036  0481 721a530a      	bset	21258,#5
4038  0485 2004          	jra	L3702
4039  0487               L1702:
4040                     ; 1220     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2P) ;
4042  0487 721b530a      	bres	21258,#5
4043  048b               L3702:
4044                     ; 1224   TIM5->CCER1 |=  TIM5_CCER1_CC2E;
4046  048b 7218530a      	bset	21258,#4
4047                     ; 1225 }
4050  048f 5b03          	addw	sp,#3
4051  0491 81            	ret
4103                     ; 1241 static void TI3_Config(uint8_t TIM5_ICPolarity, uint8_t TIM5_ICSelection,
4103                     ; 1242                        uint8_t TIM5_ICFilter)
4103                     ; 1243 {
4104                     	switch	.text
4105  0492               L7_TI3_Config:
4107  0492 89            	pushw	x
4108  0493 88            	push	a
4109       00000001      OFST:	set	1
4112                     ; 1245   TIM5->CCER2 &=  (uint8_t)(~TIM5_CCER2_CC3E);
4114  0494 7211530b      	bres	21259,#0
4115                     ; 1248   TIM5->CCMR3 = (uint8_t)((uint8_t)(TIM5->CCMR3 & (uint8_t)(~( TIM5_CCMR_CCxS | TIM5_CCMR_ICxF))) 
4115                     ; 1249                           | (uint8_t)(( (TIM5_ICSelection)) | ((uint8_t)( TIM5_ICFilter << 4))));
4117  0498 7b06          	ld	a,(OFST+5,sp)
4118  049a 97            	ld	xl,a
4119  049b a610          	ld	a,#16
4120  049d 42            	mul	x,a
4121  049e 9f            	ld	a,xl
4122  049f 1a03          	or	a,(OFST+2,sp)
4123  04a1 6b01          	ld	(OFST+0,sp),a
4125  04a3 c65309        	ld	a,21257
4126  04a6 a40c          	and	a,#12
4127  04a8 1a01          	or	a,(OFST+0,sp)
4128  04aa c75309        	ld	21257,a
4129                     ; 1253   if (TIM5_ICPolarity != TIM5_ICPOLARITY_RISING)
4131  04ad 0d02          	tnz	(OFST+1,sp)
4132  04af 2706          	jreq	L3212
4133                     ; 1255     TIM5->CCER2 |= TIM5_CCER2_CC3P ;
4135  04b1 7212530b      	bset	21259,#1
4137  04b5 2004          	jra	L5212
4138  04b7               L3212:
4139                     ; 1259     TIM5->CCER2 &= (uint8_t)(~TIM5_CCER2_CC3P) ;
4141  04b7 7213530b      	bres	21259,#1
4142  04bb               L5212:
4143                     ; 1262   TIM5->CCER2 |=  TIM5_CCER2_CC3E;
4145  04bb 7210530b      	bset	21259,#0
4146                     ; 1263 }
4149  04bf 5b03          	addw	sp,#3
4150  04c1 81            	ret
4174                     ; 1271 void TIM5_InternalClockConfig(void)
4174                     ; 1272 {
4175                     	switch	.text
4176  04c2               _TIM5_InternalClockConfig:
4180                     ; 1274   TIM5->SMCR &=  (uint8_t)(~TIM5_SMCR_SMS);
4182  04c2 c65302        	ld	a,21250
4183  04c5 a4f8          	and	a,#248
4184  04c7 c75302        	ld	21250,a
4185                     ; 1275 }
4188  04ca 81            	ret
4287                     ; 1283 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4287                     ; 1284 {
4288                     	switch	.text
4289  04cb               _TIM5_SelectOutputTrigger:
4291  04cb 88            	push	a
4292  04cc 88            	push	a
4293       00000001      OFST:	set	1
4296                     ; 1285   uint8_t tmpcr2 = 0;
4298                     ; 1288   assert_param(IS_TIM5_TRGO_SOURCE_OK(TIM5_TRGOSource));
4300                     ; 1290   tmpcr2 = TIM5->CR2;
4302  04cd c65301        	ld	a,21249
4303  04d0 6b01          	ld	(OFST+0,sp),a
4305                     ; 1293   tmpcr2 &= (uint8_t)(~TIM5_CR2_MMS);
4307  04d2 7b01          	ld	a,(OFST+0,sp)
4308  04d4 a48f          	and	a,#143
4309  04d6 6b01          	ld	(OFST+0,sp),a
4311                     ; 1296   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
4313  04d8 7b01          	ld	a,(OFST+0,sp)
4314  04da 1a02          	or	a,(OFST+1,sp)
4315  04dc 6b01          	ld	(OFST+0,sp),a
4317                     ; 1298   TIM5->CR2 = tmpcr2;
4319  04de 7b01          	ld	a,(OFST+0,sp)
4320  04e0 c75301        	ld	21249,a
4321                     ; 1299 }
4324  04e3 85            	popw	x
4325  04e4 81            	ret
4408                     ; 1307 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
4408                     ; 1308 {
4409                     	switch	.text
4410  04e5               _TIM5_SelectSlaveMode:
4412  04e5 88            	push	a
4413  04e6 88            	push	a
4414       00000001      OFST:	set	1
4417                     ; 1309   uint8_t tmpsmcr = 0;
4419                     ; 1312   assert_param(IS_TIM5_SLAVE_MODE_OK(TIM5_SlaveMode));
4421                     ; 1314   tmpsmcr = TIM5->SMCR;
4423  04e7 c65302        	ld	a,21250
4424  04ea 6b01          	ld	(OFST+0,sp),a
4426                     ; 1317   tmpsmcr &= (uint8_t)(~TIM5_SMCR_SMS);
4428  04ec 7b01          	ld	a,(OFST+0,sp)
4429  04ee a4f8          	and	a,#248
4430  04f0 6b01          	ld	(OFST+0,sp),a
4432                     ; 1320   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
4434  04f2 7b01          	ld	a,(OFST+0,sp)
4435  04f4 1a02          	or	a,(OFST+1,sp)
4436  04f6 6b01          	ld	(OFST+0,sp),a
4438                     ; 1322   TIM5->SMCR = tmpsmcr;
4440  04f8 7b01          	ld	a,(OFST+0,sp)
4441  04fa c75302        	ld	21250,a
4442                     ; 1323 }
4445  04fd 85            	popw	x
4446  04fe 81            	ret
4512                     ; 1331 void TIM5_SelectInputTrigger(TIM5_TS_TypeDef TIM5_InputTriggerSource)
4512                     ; 1332 {
4513                     	switch	.text
4514  04ff               _TIM5_SelectInputTrigger:
4516  04ff 88            	push	a
4517  0500 88            	push	a
4518       00000001      OFST:	set	1
4521                     ; 1333   uint8_t tmpsmcr = 0;
4523                     ; 1336   assert_param(IS_TIM5_TRIGGER_SELECTION_OK(TIM5_InputTriggerSource));
4525                     ; 1338   tmpsmcr = TIM5->SMCR;
4527  0501 c65302        	ld	a,21250
4528  0504 6b01          	ld	(OFST+0,sp),a
4530                     ; 1341   tmpsmcr &= (uint8_t)(~TIM5_SMCR_TS);
4532  0506 7b01          	ld	a,(OFST+0,sp)
4533  0508 a48f          	and	a,#143
4534  050a 6b01          	ld	(OFST+0,sp),a
4536                     ; 1342   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4538  050c 7b01          	ld	a,(OFST+0,sp)
4539  050e 1a02          	or	a,(OFST+1,sp)
4540  0510 6b01          	ld	(OFST+0,sp),a
4542                     ; 1344   TIM5->SMCR = (uint8_t)tmpsmcr;
4544  0512 7b01          	ld	a,(OFST+0,sp)
4545  0514 c75302        	ld	21250,a
4546                     ; 1345 }
4549  0517 85            	popw	x
4550  0518 81            	ret
4663                     ; 1357 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
4663                     ; 1358                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
4663                     ; 1359                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
4663                     ; 1360 {
4664                     	switch	.text
4665  0519               _TIM5_EncoderInterfaceConfig:
4667  0519 89            	pushw	x
4668  051a 5203          	subw	sp,#3
4669       00000003      OFST:	set	3
4672                     ; 1361   uint8_t tmpsmcr = 0;
4674                     ; 1362   uint8_t tmpccmr1 = 0;
4676                     ; 1363   uint8_t tmpccmr2 = 0;
4678                     ; 1366   assert_param(IS_TIM5_ENCODER_MODE_OK(TIM5_EncoderMode));
4680                     ; 1367   assert_param(IS_TIM5_IC_POLARITY_OK(TIM5_IC1Polarity));
4682                     ; 1368   assert_param(IS_TIM5_IC_POLARITY_OK(TIM5_IC2Polarity));
4684                     ; 1370   tmpsmcr = TIM5->SMCR;
4686  051c c65302        	ld	a,21250
4687  051f 6b01          	ld	(OFST-2,sp),a
4689                     ; 1371   tmpccmr1 = TIM5->CCMR1;
4691  0521 c65307        	ld	a,21255
4692  0524 6b02          	ld	(OFST-1,sp),a
4694                     ; 1372   tmpccmr2 = TIM5->CCMR2;
4696  0526 c65308        	ld	a,21256
4697  0529 6b03          	ld	(OFST+0,sp),a
4699                     ; 1375   tmpsmcr &= (uint8_t)(TIM5_SMCR_MSM | TIM5_SMCR_TS)  ;
4701  052b 7b01          	ld	a,(OFST-2,sp)
4702  052d a4f0          	and	a,#240
4703  052f 6b01          	ld	(OFST-2,sp),a
4705                     ; 1376   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
4707  0531 9e            	ld	a,xh
4708  0532 1a01          	or	a,(OFST-2,sp)
4709  0534 6b01          	ld	(OFST-2,sp),a
4711                     ; 1379   tmpccmr1 &= (uint8_t)(~TIM5_CCMR_CCxS);
4713  0536 7b02          	ld	a,(OFST-1,sp)
4714  0538 a4fc          	and	a,#252
4715  053a 6b02          	ld	(OFST-1,sp),a
4717                     ; 1380   tmpccmr2 &= (uint8_t)(~TIM5_CCMR_CCxS);
4719  053c 7b03          	ld	a,(OFST+0,sp)
4720  053e a4fc          	and	a,#252
4721  0540 6b03          	ld	(OFST+0,sp),a
4723                     ; 1381   tmpccmr1 |= TIM5_CCMR_TIxDirect_Set;
4725  0542 7b02          	ld	a,(OFST-1,sp)
4726  0544 aa01          	or	a,#1
4727  0546 6b02          	ld	(OFST-1,sp),a
4729                     ; 1382   tmpccmr2 |= TIM5_CCMR_TIxDirect_Set;
4731  0548 7b03          	ld	a,(OFST+0,sp)
4732  054a aa01          	or	a,#1
4733  054c 6b03          	ld	(OFST+0,sp),a
4735                     ; 1385   if (TIM5_IC1Polarity == TIM5_ICPOLARITY_FALLING)
4737  054e 9f            	ld	a,xl
4738  054f a144          	cp	a,#68
4739  0551 2606          	jrne	L5432
4740                     ; 1387     TIM5->CCER1 |= TIM5_CCER1_CC1P ;
4742  0553 7212530a      	bset	21258,#1
4744  0557 2004          	jra	L7432
4745  0559               L5432:
4746                     ; 1391     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC1P) ;
4748  0559 7213530a      	bres	21258,#1
4749  055d               L7432:
4750                     ; 1394   if (TIM5_IC2Polarity == TIM5_ICPOLARITY_FALLING)
4752  055d 7b08          	ld	a,(OFST+5,sp)
4753  055f a144          	cp	a,#68
4754  0561 2606          	jrne	L1532
4755                     ; 1396     TIM5->CCER1 |= TIM5_CCER1_CC2P ;
4757  0563 721a530a      	bset	21258,#5
4759  0567 2004          	jra	L3532
4760  0569               L1532:
4761                     ; 1400     TIM5->CCER1 &= (uint8_t)(~TIM5_CCER1_CC2P) ;
4763  0569 721b530a      	bres	21258,#5
4764  056d               L3532:
4765                     ; 1403   TIM5->SMCR = tmpsmcr;
4767  056d 7b01          	ld	a,(OFST-2,sp)
4768  056f c75302        	ld	21250,a
4769                     ; 1404   TIM5->CCMR1 = tmpccmr1;
4771  0572 7b02          	ld	a,(OFST-1,sp)
4772  0574 c75307        	ld	21255,a
4773                     ; 1405   TIM5->CCMR2 = tmpccmr2;
4775  0577 7b03          	ld	a,(OFST+0,sp)
4776  0579 c75308        	ld	21256,a
4777                     ; 1406 }
4780  057c 5b05          	addw	sp,#5
4781  057e 81            	ret
4794                     	xdef	_TIM5_EncoderInterfaceConfig
4795                     	xdef	_TIM5_SelectSlaveMode
4796                     	xdef	_TIM5_SelectInputTrigger
4797                     	xdef	_TIM5_ClearITPendingBit
4798                     	xdef	_TIM5_GetITStatus
4799                     	xdef	_TIM5_ClearFlag
4800                     	xdef	_TIM5_GetFlagStatus
4801                     	xdef	_TIM5_GetPrescaler
4802                     	xdef	_TIM5_GetCounter
4803                     	xdef	_TIM5_GetCapture3
4804                     	xdef	_TIM5_GetCapture2
4805                     	xdef	_TIM5_GetCapture1
4806                     	xdef	_TIM5_SetIC3Prescaler
4807                     	xdef	_TIM5_SetIC2Prescaler
4808                     	xdef	_TIM5_SetIC1Prescaler
4809                     	xdef	_TIM5_SetCompare3
4810                     	xdef	_TIM5_SetCompare2
4811                     	xdef	_TIM5_SetCompare1
4812                     	xdef	_TIM5_SetAutoreload
4813                     	xdef	_TIM5_SetCounter
4814                     	xdef	_TIM5_SelectOCxM
4815                     	xdef	_TIM5_CCxCmd
4816                     	xdef	_TIM5_OC3PolarityConfig
4817                     	xdef	_TIM5_OC2PolarityConfig
4818                     	xdef	_TIM5_OC1PolarityConfig
4819                     	xdef	_TIM5_GenerateEvent
4820                     	xdef	_TIM5_OC3PreloadConfig
4821                     	xdef	_TIM5_OC2PreloadConfig
4822                     	xdef	_TIM5_OC1PreloadConfig
4823                     	xdef	_TIM5_ARRPreloadConfig
4824                     	xdef	_TIM5_ForcedOC3Config
4825                     	xdef	_TIM5_ForcedOC2Config
4826                     	xdef	_TIM5_ForcedOC1Config
4827                     	xdef	_TIM5_SelectOutputTrigger
4828                     	xdef	_TIM5_PrescalerConfig
4829                     	xdef	_TIM5_SelectOnePulseMode
4830                     	xdef	_TIM5_UpdateRequestConfig
4831                     	xdef	_TIM5_UpdateDisableConfig
4832                     	xdef	_TIM5_InternalClockConfig
4833                     	xdef	_TIM5_ITConfig
4834                     	xdef	_TIM5_Cmd
4835                     	xdef	_TIM5_PWMIConfig
4836                     	xdef	_TIM5_ICInit
4837                     	xdef	_TIM5_OC3Init
4838                     	xdef	_TIM5_OC2Init
4839                     	xdef	_TIM5_OC1Init
4840                     	xdef	_TIM5_TimeBaseInit
4841                     	xdef	_TIM5_DeInit
4860                     	end
