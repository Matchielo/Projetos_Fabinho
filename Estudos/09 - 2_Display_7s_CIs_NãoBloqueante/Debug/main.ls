   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     	bsct
2589  0000               _rtc_tick:
2590  0000 00            	dc.b	0
2591  0001               _countdown:
2592  0001 00            	dc.b	0
2593  0002               _contando:
2594  0002 00            	dc.b	0
2635                     ; 52 void main(void)
2635                     ; 53 {
2637                     	switch	.text
2638  0000               _main:
2642                     ; 54     InitCLOCK();
2644  0000 ad61          	call	_InitCLOCK
2646                     ; 55     InitGPIO();
2648  0002 ad64          	call	_InitGPIO
2650                     ; 56     InitTIM4();
2652  0004 cd00cc        	call	_InitTIM4
2654                     ; 57     InitI2C();
2656  0007 cd00e3        	call	_InitI2C
2658                     ; 59     enableInterrupts();
2661  000a 9a            rim
2663  000b               L1761:
2664                     ; 63         if (!contando)
2666  000b 3d02          	tnz	_contando
2667  000d 262c          	jrne	L5761
2668                     ; 65             if (ReadButton(BOT_1_PORT, BOT_1_PIN) == 0)
2670  000f 4b04          	push	#4
2671  0011 ae500f        	ldw	x,#20495
2672  0014 cd0136        	call	_ReadButton
2674  0017 5b01          	addw	sp,#1
2675  0019 4d            	tnz	a
2676  001a 260a          	jrne	L7761
2677                     ; 67                 countdown = 14;
2679  001c 350e0001      	mov	_countdown,#14
2680                     ; 68                 contando = 1;
2682  0020 35010002      	mov	_contando,#1
2684  0024 2015          	jra	L5761
2685  0026               L7761:
2686                     ; 70             else if (ReadButton(BOT_2_PORT, BOT_2_PIN) == 0)
2688  0026 4b08          	push	#8
2689  0028 ae500f        	ldw	x,#20495
2690  002b cd0136        	call	_ReadButton
2692  002e 5b01          	addw	sp,#1
2693  0030 4d            	tnz	a
2694  0031 2608          	jrne	L5761
2695                     ; 72                 countdown = 24;
2697  0033 35180001      	mov	_countdown,#24
2698                     ; 73                 contando = 1;
2700  0037 35010002      	mov	_contando,#1
2701  003b               L5761:
2702                     ; 77         if (rtc_tick)
2704  003b 3d00          	tnz	_rtc_tick
2705  003d 27cc          	jreq	L1761
2706                     ; 79             rtc_tick = 0;
2708  003f 3f00          	clr	_rtc_tick
2709                     ; 81             if (contando)
2711  0041 3d02          	tnz	_contando
2712  0043 27c6          	jreq	L1761
2713                     ; 83                 mostrar_no_display(countdown);
2715  0045 b601          	ld	a,_countdown
2716  0047 cd01b7        	call	_mostrar_no_display
2718                     ; 84                 i2c_pulsar();
2720  004a cd0105        	call	_i2c_pulsar
2722                     ; 86                 if (countdown == 0)
2724  004d 3d01          	tnz	_countdown
2725  004f 260e          	jrne	L1171
2726                     ; 88                     contando = 0;
2728  0051 3f02          	clr	_contando
2729                     ; 89                     BUZZER(1, 500);
2731  0053 ae01f4        	ldw	x,#500
2732  0056 89            	pushw	x
2733  0057 a601          	ld	a,#1
2734  0059 cd0149        	call	_BUZZER
2736  005c 85            	popw	x
2738  005d 20ac          	jra	L1761
2739  005f               L1171:
2740                     ; 93                     countdown--;
2742  005f 3a01          	dec	_countdown
2743  0061 20a8          	jra	L1761
2767                     ; 100 void InitCLOCK(void)
2767                     ; 101 {
2768                     	switch	.text
2769  0063               _InitCLOCK:
2773                     ; 102     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2775  0063 4f            	clr	a
2776  0064 cd0000        	call	_CLK_HSIPrescalerConfig
2778                     ; 103 }
2781  0067 81            	ret
2805                     ; 105 void InitGPIO(void)
2805                     ; 106 {
2806                     	switch	.text
2807  0068               _InitGPIO:
2811                     ; 107     GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2813  0068 4be0          	push	#224
2814  006a 4b01          	push	#1
2815  006c ae5005        	ldw	x,#20485
2816  006f cd0000        	call	_GPIO_Init
2818  0072 85            	popw	x
2819                     ; 108     GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2821  0073 4be0          	push	#224
2822  0075 4b02          	push	#2
2823  0077 ae5005        	ldw	x,#20485
2824  007a cd0000        	call	_GPIO_Init
2826  007d 85            	popw	x
2827                     ; 109     GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2829  007e 4be0          	push	#224
2830  0080 4b04          	push	#4
2831  0082 ae5005        	ldw	x,#20485
2832  0085 cd0000        	call	_GPIO_Init
2834  0088 85            	popw	x
2835                     ; 110     GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2837  0089 4be0          	push	#224
2838  008b 4b08          	push	#8
2839  008d ae5005        	ldw	x,#20485
2840  0090 cd0000        	call	_GPIO_Init
2842  0093 85            	popw	x
2843                     ; 112     GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2845  0094 4be0          	push	#224
2846  0096 4b04          	push	#4
2847  0098 ae500a        	ldw	x,#20490
2848  009b cd0000        	call	_GPIO_Init
2850  009e 85            	popw	x
2851                     ; 113     GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2853  009f 4be0          	push	#224
2854  00a1 4b02          	push	#2
2855  00a3 ae500a        	ldw	x,#20490
2856  00a6 cd0000        	call	_GPIO_Init
2858  00a9 85            	popw	x
2859                     ; 115     GPIO_Init(BOT_1_PORT, BOT_1_PIN, GPIO_MODE_IN_PU_NO_IT);
2861  00aa 4b40          	push	#64
2862  00ac 4b04          	push	#4
2863  00ae ae500f        	ldw	x,#20495
2864  00b1 cd0000        	call	_GPIO_Init
2866  00b4 85            	popw	x
2867                     ; 116     GPIO_Init(BOT_2_PORT, BOT_2_PIN, GPIO_MODE_IN_PU_NO_IT);
2869  00b5 4b40          	push	#64
2870  00b7 4b08          	push	#8
2871  00b9 ae500f        	ldw	x,#20495
2872  00bc cd0000        	call	_GPIO_Init
2874  00bf 85            	popw	x
2875                     ; 118     GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2877  00c0 4be0          	push	#224
2878  00c2 4b01          	push	#1
2879  00c4 ae500f        	ldw	x,#20495
2880  00c7 cd0000        	call	_GPIO_Init
2882  00ca 85            	popw	x
2883                     ; 119 }
2886  00cb 81            	ret
2913                     ; 121 void InitTIM4(void)
2913                     ; 122 {
2914                     	switch	.text
2915  00cc               _InitTIM4:
2919                     ; 123     TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
2921  00cc ae0701        	ldw	x,#1793
2922  00cf cd0000        	call	_TIM4_PrescalerConfig
2924                     ; 124     TIM4_SetAutoreload(125);
2926  00d2 a67d          	ld	a,#125
2927  00d4 cd0000        	call	_TIM4_SetAutoreload
2929                     ; 125     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
2931  00d7 ae0101        	ldw	x,#257
2932  00da cd0000        	call	_TIM4_ITConfig
2934                     ; 126     TIM4_Cmd(ENABLE);
2936  00dd a601          	ld	a,#1
2937  00df cd0000        	call	_TIM4_Cmd
2939                     ; 127 }
2942  00e2 81            	ret
2968                     ; 129 void InitI2C(void)
2968                     ; 130 {
2969                     	switch	.text
2970  00e3               _InitI2C:
2974                     ; 131     I2C_DeInit();
2976  00e3 cd0000        	call	_I2C_DeInit
2978                     ; 132     I2C_Cmd(ENABLE);
2980  00e6 a601          	ld	a,#1
2981  00e8 cd0000        	call	_I2C_Cmd
2983                     ; 133     I2C_Init(100000, 0xA0, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
2985  00eb 4b10          	push	#16
2986  00ed 4b00          	push	#0
2987  00ef 4b01          	push	#1
2988  00f1 4b00          	push	#0
2989  00f3 ae00a0        	ldw	x,#160
2990  00f6 89            	pushw	x
2991  00f7 ae86a0        	ldw	x,#34464
2992  00fa 89            	pushw	x
2993  00fb ae0001        	ldw	x,#1
2994  00fe 89            	pushw	x
2995  00ff cd0000        	call	_I2C_Init
2997  0102 5b0a          	addw	sp,#10
2998                     ; 134 }
3001  0104 81            	ret
3029                     ; 136 void i2c_pulsar(void)
3029                     ; 137 {
3030                     	switch	.text
3031  0105               _i2c_pulsar:
3035                     ; 138     I2C_GenerateSTART(ENABLE);
3037  0105 a601          	ld	a,#1
3038  0107 cd0000        	call	_I2C_GenerateSTART
3041  010a               L7671:
3042                     ; 139     while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
3044  010a ae0301        	ldw	x,#769
3045  010d cd0000        	call	_I2C_CheckEvent
3047  0110 4d            	tnz	a
3048  0111 27f7          	jreq	L7671
3049                     ; 141     I2C_Send7bitAddress(0xD0, I2C_DIRECTION_TX);
3051  0113 aed000        	ldw	x,#53248
3052  0116 cd0000        	call	_I2C_Send7bitAddress
3055  0119               L5771:
3056                     ; 142     while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
3058  0119 ae0782        	ldw	x,#1922
3059  011c cd0000        	call	_I2C_CheckEvent
3061  011f 4d            	tnz	a
3062  0120 27f7          	jreq	L5771
3063                     ; 144     I2C_SendData(0x01);
3065  0122 a601          	ld	a,#1
3066  0124 cd0000        	call	_I2C_SendData
3069  0127               L3002:
3070                     ; 145     while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
3072  0127 ae0784        	ldw	x,#1924
3073  012a cd0000        	call	_I2C_CheckEvent
3075  012d 4d            	tnz	a
3076  012e 27f7          	jreq	L3002
3077                     ; 147     I2C_GenerateSTOP(ENABLE);
3079  0130 a601          	ld	a,#1
3080  0132 cd0000        	call	_I2C_GenerateSTOP
3082                     ; 148 }
3085  0135 81            	ret
3184                     ; 150 uint8_t ReadButton(GPIO_TypeDef* PORT, uint8_t PIN)
3184                     ; 151 {
3185                     	switch	.text
3186  0136               _ReadButton:
3188  0136 89            	pushw	x
3189       00000000      OFST:	set	0
3192                     ; 152     return (GPIO_ReadInputPin(PORT, PIN) == RESET) ? 0 : 1;
3194  0137 7b05          	ld	a,(OFST+5,sp)
3195  0139 88            	push	a
3196  013a cd0000        	call	_GPIO_ReadInputPin
3198  013d 5b01          	addw	sp,#1
3199  013f 4d            	tnz	a
3200  0140 2603          	jrne	L22
3201  0142 4f            	clr	a
3202  0143 2002          	jra	L42
3203  0145               L22:
3204  0145 a601          	ld	a,#1
3205  0147               L42:
3208  0147 85            	popw	x
3209  0148 81            	ret
3263                     .const:	section	.text
3264  0000               L03:
3265  0000 00001f40      	dc.l	8000
3266                     ; 155 void BUZZER(uint8_t vezes, uint16_t tempo)
3266                     ; 156 {
3267                     	switch	.text
3268  0149               _BUZZER:
3270  0149 88            	push	a
3271  014a 5205          	subw	sp,#5
3272       00000005      OFST:	set	5
3275                     ; 159     for (i = 0; i < vezes; i++)
3277  014c 0f01          	clr	(OFST-4,sp)
3280  014e 205e          	jra	L5112
3281  0150               L1112:
3282                     ; 161         GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
3284  0150 4b01          	push	#1
3285  0152 ae500f        	ldw	x,#20495
3286  0155 cd0000        	call	_GPIO_WriteHigh
3288  0158 84            	pop	a
3289                     ; 162         for (j = 0; j < 8000; j++); // atraso rudimentar
3291  0159 ae0000        	ldw	x,#0
3292  015c 1f04          	ldw	(OFST-1,sp),x
3293  015e ae0000        	ldw	x,#0
3294  0161 1f02          	ldw	(OFST-3,sp),x
3297  0163 2009          	jra	L5212
3298  0165               L1212:
3302  0165 96            	ldw	x,sp
3303  0166 1c0002        	addw	x,#OFST-3
3304  0169 a601          	ld	a,#1
3305  016b cd0000        	call	c_lgadc
3308  016e               L5212:
3311  016e 9c            	rvf
3312  016f 96            	ldw	x,sp
3313  0170 1c0002        	addw	x,#OFST-3
3314  0173 cd0000        	call	c_ltor
3316  0176 ae0000        	ldw	x,#L03
3317  0179 cd0000        	call	c_lcmp
3319  017c 2fe7          	jrslt	L1212
3320                     ; 163         GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
3322  017e 4b01          	push	#1
3323  0180 ae500f        	ldw	x,#20495
3324  0183 cd0000        	call	_GPIO_WriteLow
3326  0186 84            	pop	a
3327                     ; 164         for (j = 0; j < 8000; j++);
3329  0187 ae0000        	ldw	x,#0
3330  018a 1f04          	ldw	(OFST-1,sp),x
3331  018c ae0000        	ldw	x,#0
3332  018f 1f02          	ldw	(OFST-3,sp),x
3335  0191 2009          	jra	L5312
3336  0193               L1312:
3340  0193 96            	ldw	x,sp
3341  0194 1c0002        	addw	x,#OFST-3
3342  0197 a601          	ld	a,#1
3343  0199 cd0000        	call	c_lgadc
3346  019c               L5312:
3349  019c 9c            	rvf
3350  019d 96            	ldw	x,sp
3351  019e 1c0002        	addw	x,#OFST-3
3352  01a1 cd0000        	call	c_ltor
3354  01a4 ae0000        	ldw	x,#L03
3355  01a7 cd0000        	call	c_lcmp
3357  01aa 2fe7          	jrslt	L1312
3358                     ; 159     for (i = 0; i < vezes; i++)
3360  01ac 0c01          	inc	(OFST-4,sp)
3362  01ae               L5112:
3365  01ae 7b01          	ld	a,(OFST-4,sp)
3366  01b0 1106          	cp	a,(OFST+1,sp)
3367  01b2 259c          	jrult	L1112
3368                     ; 166 }
3371  01b4 5b06          	addw	sp,#6
3372  01b6 81            	ret
3426                     ; 168 void mostrar_no_display(uint8_t valor)
3426                     ; 169 {
3427                     	switch	.text
3428  01b7               _mostrar_no_display:
3430  01b7 88            	push	a
3431  01b8 89            	pushw	x
3432       00000002      OFST:	set	2
3435                     ; 170     uint8_t u = valor % 10;
3437  01b9 5f            	clrw	x
3438  01ba 97            	ld	xl,a
3439  01bb a60a          	ld	a,#10
3440  01bd 62            	div	x,a
3441  01be 5f            	clrw	x
3442  01bf 97            	ld	xl,a
3443  01c0 9f            	ld	a,xl
3444  01c1 6b01          	ld	(OFST-1,sp),a
3446                     ; 171     uint8_t d = valor / 10;
3448  01c3 7b03          	ld	a,(OFST+1,sp)
3449  01c5 5f            	clrw	x
3450  01c6 97            	ld	xl,a
3451  01c7 a60a          	ld	a,#10
3452  01c9 62            	div	x,a
3453  01ca 9f            	ld	a,xl
3454  01cb 6b02          	ld	(OFST+0,sp),a
3456                     ; 172     writeBCD(u);
3458  01cd 7b01          	ld	a,(OFST-1,sp)
3459  01cf ad17          	call	_writeBCD
3461                     ; 173     pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3463  01d1 4b04          	push	#4
3464  01d3 ae500a        	ldw	x,#20490
3465  01d6 ad5d          	call	_pulseLatch
3467  01d8 84            	pop	a
3468                     ; 174     writeBCD(d);
3470  01d9 7b02          	ld	a,(OFST+0,sp)
3471  01db ad0b          	call	_writeBCD
3473                     ; 175     pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3475  01dd 4b02          	push	#2
3476  01df ae500a        	ldw	x,#20490
3477  01e2 ad51          	call	_pulseLatch
3479  01e4 84            	pop	a
3480                     ; 176 }
3483  01e5 5b03          	addw	sp,#3
3484  01e7 81            	ret
3519                     ; 178 void writeBCD(uint8_t valor)
3519                     ; 179 {
3520                     	switch	.text
3521  01e8               _writeBCD:
3523  01e8 88            	push	a
3524       00000000      OFST:	set	0
3527                     ; 180     GPIO_Write(LD_A_PORT, (valor & 0x01) ? GPIO_PIN_0 : 0);
3529  01e9 a501          	bcp	a,#1
3530  01eb 2704          	jreq	L63
3531  01ed a601          	ld	a,#1
3532  01ef 2001          	jra	L04
3533  01f1               L63:
3534  01f1 4f            	clr	a
3535  01f2               L04:
3536  01f2 88            	push	a
3537  01f3 ae5005        	ldw	x,#20485
3538  01f6 cd0000        	call	_GPIO_Write
3540  01f9 84            	pop	a
3541                     ; 181     GPIO_Write(LD_B_PORT, (valor & 0x02) ? GPIO_PIN_1 : 0);
3543  01fa 7b01          	ld	a,(OFST+1,sp)
3544  01fc a502          	bcp	a,#2
3545  01fe 2704          	jreq	L24
3546  0200 a602          	ld	a,#2
3547  0202 2001          	jra	L44
3548  0204               L24:
3549  0204 4f            	clr	a
3550  0205               L44:
3551  0205 88            	push	a
3552  0206 ae5005        	ldw	x,#20485
3553  0209 cd0000        	call	_GPIO_Write
3555  020c 84            	pop	a
3556                     ; 182     GPIO_Write(LD_C_PORT, (valor & 0x04) ? GPIO_PIN_2 : 0);
3558  020d 7b01          	ld	a,(OFST+1,sp)
3559  020f a504          	bcp	a,#4
3560  0211 2704          	jreq	L64
3561  0213 a604          	ld	a,#4
3562  0215 2001          	jra	L05
3563  0217               L64:
3564  0217 4f            	clr	a
3565  0218               L05:
3566  0218 88            	push	a
3567  0219 ae5005        	ldw	x,#20485
3568  021c cd0000        	call	_GPIO_Write
3570  021f 84            	pop	a
3571                     ; 183     GPIO_Write(LD_D_PORT, (valor & 0x08) ? GPIO_PIN_3 : 0);
3573  0220 7b01          	ld	a,(OFST+1,sp)
3574  0222 a508          	bcp	a,#8
3575  0224 2704          	jreq	L25
3576  0226 a608          	ld	a,#8
3577  0228 2001          	jra	L45
3578  022a               L25:
3579  022a 4f            	clr	a
3580  022b               L45:
3581  022b 88            	push	a
3582  022c ae5005        	ldw	x,#20485
3583  022f cd0000        	call	_GPIO_Write
3585  0232 84            	pop	a
3586                     ; 184 }
3589  0233 84            	pop	a
3590  0234 81            	ret
3647                     	switch	.const
3648  0004               L06:
3649  0004 000003e8      	dc.l	1000
3650                     ; 186 void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN)
3650                     ; 187 {
3651                     	switch	.text
3652  0235               _pulseLatch:
3654  0235 89            	pushw	x
3655  0236 5204          	subw	sp,#4
3656       00000004      OFST:	set	4
3659                     ; 191     GPIO_WriteHigh(PORT, PIN);
3661  0238 7b09          	ld	a,(OFST+5,sp)
3662  023a 88            	push	a
3663  023b cd0000        	call	_GPIO_WriteHigh
3665  023e 84            	pop	a
3666                     ; 192     for (i = 0; i < 1000; i++); // pulso
3668  023f ae0000        	ldw	x,#0
3669  0242 1f03          	ldw	(OFST-1,sp),x
3670  0244 ae0000        	ldw	x,#0
3671  0247 1f01          	ldw	(OFST-3,sp),x
3674  0249 2009          	jra	L1422
3675  024b               L5322:
3679  024b 96            	ldw	x,sp
3680  024c 1c0001        	addw	x,#OFST-3
3681  024f a601          	ld	a,#1
3682  0251 cd0000        	call	c_lgadc
3685  0254               L1422:
3688  0254 9c            	rvf
3689  0255 96            	ldw	x,sp
3690  0256 1c0001        	addw	x,#OFST-3
3691  0259 cd0000        	call	c_ltor
3693  025c ae0004        	ldw	x,#L06
3694  025f cd0000        	call	c_lcmp
3696  0262 2fe7          	jrslt	L5322
3697                     ; 193     GPIO_WriteLow(PORT, PIN);
3699  0264 7b09          	ld	a,(OFST+5,sp)
3700  0266 88            	push	a
3701  0267 1e06          	ldw	x,(OFST+2,sp)
3702  0269 cd0000        	call	_GPIO_WriteLow
3704  026c 84            	pop	a
3705                     ; 194 }
3708  026d 5b06          	addw	sp,#6
3709  026f 81            	ret
3712                     	bsct
3713  0003               L5422_ms:
3714  0003 0000          	dc.w	0
3749                     ; 197 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
3749                     ; 198 {
3751                     	switch	.text
3752  0270               f_TIM4_UPD_OVF_IRQHandler:
3754  0270 8a            	push	cc
3755  0271 84            	pop	a
3756  0272 a4bf          	and	a,#191
3757  0274 88            	push	a
3758  0275 86            	pop	cc
3759  0276 3b0002        	push	c_x+2
3760  0279 be00          	ldw	x,c_x
3761  027b 89            	pushw	x
3762  027c 3b0002        	push	c_y+2
3763  027f be00          	ldw	x,c_y
3764  0281 89            	pushw	x
3767                     ; 200     TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
3769  0282 a601          	ld	a,#1
3770  0284 cd0000        	call	_TIM4_ClearITPendingBit
3772                     ; 201     ms++;
3774  0287 be03          	ldw	x,L5422_ms
3775  0289 1c0001        	addw	x,#1
3776  028c bf03          	ldw	L5422_ms,x
3777                     ; 202     if (ms >= 1000)
3779  028e be03          	ldw	x,L5422_ms
3780  0290 a303e8        	cpw	x,#1000
3781  0293 2507          	jrult	L5622
3782                     ; 204         ms = 0;
3784  0295 5f            	clrw	x
3785  0296 bf03          	ldw	L5422_ms,x
3786                     ; 205         rtc_tick = 1;
3788  0298 35010000      	mov	_rtc_tick,#1
3789  029c               L5622:
3790                     ; 207 }
3793  029c 85            	popw	x
3794  029d bf00          	ldw	c_y,x
3795  029f 320002        	pop	c_y+2
3796  02a2 85            	popw	x
3797  02a3 bf00          	ldw	c_x,x
3798  02a5 320002        	pop	c_x+2
3799  02a8 80            	iret
3840                     	xdef	f_TIM4_UPD_OVF_IRQHandler
3841                     	xdef	_main
3842                     	xdef	_ReadButton
3843                     	xdef	_i2c_pulsar
3844                     	xdef	_BUZZER
3845                     	xdef	_pulseLatch
3846                     	xdef	_writeBCD
3847                     	xdef	_mostrar_no_display
3848                     	xdef	_InitI2C
3849                     	xdef	_InitTIM4
3850                     	xdef	_InitCLOCK
3851                     	xdef	_InitGPIO
3852                     	xdef	_contando
3853                     	xdef	_countdown
3854                     	xdef	_rtc_tick
3855                     	xref	_TIM4_ClearITPendingBit
3856                     	xref	_TIM4_SetAutoreload
3857                     	xref	_TIM4_PrescalerConfig
3858                     	xref	_TIM4_ITConfig
3859                     	xref	_TIM4_Cmd
3860                     	xref	_I2C_CheckEvent
3861                     	xref	_I2C_SendData
3862                     	xref	_I2C_Send7bitAddress
3863                     	xref	_I2C_GenerateSTOP
3864                     	xref	_I2C_GenerateSTART
3865                     	xref	_I2C_Cmd
3866                     	xref	_I2C_Init
3867                     	xref	_I2C_DeInit
3868                     	xref	_GPIO_ReadInputPin
3869                     	xref	_GPIO_WriteLow
3870                     	xref	_GPIO_WriteHigh
3871                     	xref	_GPIO_Write
3872                     	xref	_GPIO_Init
3873                     	xref	_CLK_HSIPrescalerConfig
3874                     	xref.b	c_x
3875                     	xref.b	c_y
3894                     	xref	c_lcmp
3895                     	xref	c_ltor
3896                     	xref	c_lgadc
3897                     	end
