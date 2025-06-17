   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2664                     ; 56 void main(void)
2664                     ; 57 {
2666                     	switch	.text
2667  0000               _main:
2669  0000 5204          	subw	sp,#4
2670       00000004      OFST:	set	4
2673                     ; 58 	uint8_t last_button_state_01 = 1;
2675  0002 a601          	ld	a,#1
2676  0004 6b01          	ld	(OFST-3,sp),a
2678                     ; 59 	uint8_t last_button_state_02 = 1;
2680  0006 a601          	ld	a,#1
2681  0008 6b02          	ld	(OFST-2,sp),a
2683                     ; 64 	InitCLOCK();
2685  000a cd0271        	call	_InitCLOCK
2687                     ; 65 	InitTIM4();
2689  000d cd02cc        	call	_InitTIM4
2691                     ; 66 	InitGPIO();
2693  0010 cd020d        	call	_InitGPIO
2695  0013               L3171:
2696                     ; 70 			current_button_01 = ReadButton_01();
2698  0013 ad44          	call	_ReadButton_01
2700  0015 6b03          	ld	(OFST-1,sp),a
2702                     ; 71 			current_button_02 = ReadButton_02();
2704  0017 ad53          	call	_ReadButton_02
2706  0019 6b04          	ld	(OFST+0,sp),a
2708                     ; 73 			if (last_button_state_01 == 1 && current_button_01 == 0)
2710  001b 7b01          	ld	a,(OFST-3,sp)
2711  001d a101          	cp	a,#1
2712  001f 2612          	jrne	L7171
2714  0021 0d03          	tnz	(OFST-1,sp)
2715  0023 260e          	jrne	L7171
2716                     ; 75 				Contagem_14s();
2718  0025 cd00f3        	call	_Contagem_14s
2720                     ; 76 				LED_BUZZER(3, 500);
2722  0028 ae01f4        	ldw	x,#500
2723  002b 89            	pushw	x
2724  002c a603          	ld	a,#3
2725  002e ad4f          	call	_LED_BUZZER
2727  0030 85            	popw	x
2729  0031 2016          	jra	L1271
2730  0033               L7171:
2731                     ; 79 			else if (last_button_state_02 == 1 && current_button_02 == 0)
2733  0033 7b02          	ld	a,(OFST-2,sp)
2734  0035 a101          	cp	a,#1
2735  0037 2610          	jrne	L1271
2737  0039 0d04          	tnz	(OFST+0,sp)
2738  003b 260c          	jrne	L1271
2739                     ; 81 				Contagem_24s();
2741  003d cd013f        	call	_Contagem_24s
2743                     ; 82 				LED_BUZZER(3, 500);
2745  0040 ae01f4        	ldw	x,#500
2746  0043 89            	pushw	x
2747  0044 a603          	ld	a,#3
2748  0046 ad37          	call	_LED_BUZZER
2750  0048 85            	popw	x
2751  0049               L1271:
2752                     ; 85 			last_button_state_01 = current_button_01;
2754  0049 7b03          	ld	a,(OFST-1,sp)
2755  004b 6b01          	ld	(OFST-3,sp),a
2757                     ; 86 			last_button_state_02 = current_button_02;
2759  004d 7b04          	ld	a,(OFST+0,sp)
2760  004f 6b02          	ld	(OFST-2,sp),a
2762                     ; 88 			Delay_ms_Timer(20);
2764  0051 ae0014        	ldw	x,#20
2765  0054 cd02e3        	call	_Delay_ms_Timer
2768  0057 20ba          	jra	L3171
2792                     ; 94 uint8_t ReadButton_01(void)
2792                     ; 95 {
2793                     	switch	.text
2794  0059               _ReadButton_01:
2798                     ; 96 	return (GPIO_ReadInputPin(BOT_1_PORT,BOT_1_PIN) == RESET);
2800  0059 4b40          	push	#64
2801  005b ae500a        	ldw	x,#20490
2802  005e cd0000        	call	_GPIO_ReadInputPin
2804  0061 5b01          	addw	sp,#1
2805  0063 4d            	tnz	a
2806  0064 2604          	jrne	L01
2807  0066 a601          	ld	a,#1
2808  0068 2001          	jra	L21
2809  006a               L01:
2810  006a 4f            	clr	a
2811  006b               L21:
2814  006b 81            	ret
2838                     ; 99 uint8_t ReadButton_02(void)
2838                     ; 100 {
2839                     	switch	.text
2840  006c               _ReadButton_02:
2844                     ; 101 	return (GPIO_ReadInputPin(BOT_2_PORT,BOT_2_PIN) == RESET);
2846  006c 4b80          	push	#128
2847  006e ae500a        	ldw	x,#20490
2848  0071 cd0000        	call	_GPIO_ReadInputPin
2850  0074 5b01          	addw	sp,#1
2851  0076 4d            	tnz	a
2852  0077 2604          	jrne	L61
2853  0079 a601          	ld	a,#1
2854  007b 2001          	jra	L02
2855  007d               L61:
2856  007d 4f            	clr	a
2857  007e               L02:
2860  007e 81            	ret
2915                     ; 106 void LED_BUZZER (uint8_t num_acm, uint16_t temp_acm)
2915                     ; 107 {
2916                     	switch	.text
2917  007f               _LED_BUZZER:
2919  007f 88            	push	a
2920  0080 88            	push	a
2921       00000001      OFST:	set	1
2924                     ; 109 	for(i = 0; i < num_acm; i++)
2926  0081 0f01          	clr	(OFST+0,sp)
2929  0083 2066          	jra	L7771
2930  0085               L3771:
2931                     ; 111 		GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
2933  0085 4b01          	push	#1
2934  0087 ae500f        	ldw	x,#20495
2935  008a cd0000        	call	_GPIO_WriteHigh
2937  008d 84            	pop	a
2938                     ; 113 		GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
2940  008e 4b01          	push	#1
2941  0090 ae5005        	ldw	x,#20485
2942  0093 cd0000        	call	_GPIO_WriteLow
2944  0096 84            	pop	a
2945                     ; 114 		GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
2947  0097 4b02          	push	#2
2948  0099 ae5005        	ldw	x,#20485
2949  009c cd0000        	call	_GPIO_WriteLow
2951  009f 84            	pop	a
2952                     ; 115 		GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
2954  00a0 4b04          	push	#4
2955  00a2 ae5005        	ldw	x,#20485
2956  00a5 cd0000        	call	_GPIO_WriteLow
2958  00a8 84            	pop	a
2959                     ; 116 		GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
2961  00a9 4b08          	push	#8
2962  00ab ae5005        	ldw	x,#20485
2963  00ae cd0000        	call	_GPIO_WriteLow
2965  00b1 84            	pop	a
2966                     ; 118 		Delay_ms_Timer(temp_acm);
2968  00b2 1e05          	ldw	x,(OFST+4,sp)
2969  00b4 cd02e3        	call	_Delay_ms_Timer
2971                     ; 120 		GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
2973  00b7 4b01          	push	#1
2974  00b9 ae500f        	ldw	x,#20495
2975  00bc cd0000        	call	_GPIO_WriteLow
2977  00bf 84            	pop	a
2978                     ; 122 		GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);
2980  00c0 4b01          	push	#1
2981  00c2 ae5005        	ldw	x,#20485
2982  00c5 cd0000        	call	_GPIO_WriteHigh
2984  00c8 84            	pop	a
2985                     ; 123 		GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);
2987  00c9 4b02          	push	#2
2988  00cb ae5005        	ldw	x,#20485
2989  00ce cd0000        	call	_GPIO_WriteHigh
2991  00d1 84            	pop	a
2992                     ; 124 		GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);
2994  00d2 4b04          	push	#4
2995  00d4 ae5005        	ldw	x,#20485
2996  00d7 cd0000        	call	_GPIO_WriteHigh
2998  00da 84            	pop	a
2999                     ; 125 		GPIO_WriteHigh(LD_D_PORT, LD_D_PIN);
3001  00db 4b08          	push	#8
3002  00dd ae5005        	ldw	x,#20485
3003  00e0 cd0000        	call	_GPIO_WriteHigh
3005  00e3 84            	pop	a
3006                     ; 127 		Delay_ms_Timer(temp_acm);
3008  00e4 1e05          	ldw	x,(OFST+4,sp)
3009  00e6 cd02e3        	call	_Delay_ms_Timer
3011                     ; 109 	for(i = 0; i < num_acm; i++)
3013  00e9 0c01          	inc	(OFST+0,sp)
3015  00eb               L7771:
3018  00eb 7b01          	ld	a,(OFST+0,sp)
3019  00ed 1102          	cp	a,(OFST+1,sp)
3020  00ef 2594          	jrult	L3771
3021                     ; 129 }
3024  00f1 85            	popw	x
3025  00f2 81            	ret
3080                     ; 132 void Contagem_14s(void)
3080                     ; 133 {
3081                     	switch	.text
3082  00f3               _Contagem_14s:
3084  00f3 5204          	subw	sp,#4
3085       00000004      OFST:	set	4
3088                     ; 138 	for(i = 14; i >= 0; i--)
3090  00f5 ae000e        	ldw	x,#14
3091  00f8 1f03          	ldw	(OFST-1,sp),x
3093  00fa               L1302:
3094                     ; 140 		unidades = i % 10;
3096  00fa 1e03          	ldw	x,(OFST-1,sp)
3097  00fc a60a          	ld	a,#10
3098  00fe cd0000        	call	c_smodx
3100  0101 01            	rrwa	x,a
3101  0102 6b01          	ld	(OFST-3,sp),a
3102  0104 02            	rlwa	x,a
3104                     ; 141 		dezenas = i / 10;
3106  0105 1e03          	ldw	x,(OFST-1,sp)
3107  0107 a60a          	ld	a,#10
3108  0109 cd0000        	call	c_sdivx
3110  010c 01            	rrwa	x,a
3111  010d 6b02          	ld	(OFST-2,sp),a
3112  010f 02            	rlwa	x,a
3114                     ; 143 		writeBCD(unidades);
3116  0110 7b01          	ld	a,(OFST-3,sp)
3117  0112 ad77          	call	_writeBCD
3119                     ; 144 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3121  0114 4b04          	push	#4
3122  0116 ae500a        	ldw	x,#20490
3123  0119 cd01f4        	call	_pulseLatch
3125  011c 84            	pop	a
3126                     ; 146 		writeBCD(dezenas);
3128  011d 7b02          	ld	a,(OFST-2,sp)
3129  011f ad6a          	call	_writeBCD
3131                     ; 147 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3133  0121 4b02          	push	#2
3134  0123 ae500a        	ldw	x,#20490
3135  0126 cd01f4        	call	_pulseLatch
3137  0129 84            	pop	a
3138                     ; 149 		Delay_ms_Timer(1000);
3140  012a ae03e8        	ldw	x,#1000
3141  012d cd02e3        	call	_Delay_ms_Timer
3143                     ; 138 	for(i = 14; i >= 0; i--)
3145  0130 1e03          	ldw	x,(OFST-1,sp)
3146  0132 1d0001        	subw	x,#1
3147  0135 1f03          	ldw	(OFST-1,sp),x
3151  0137 9c            	rvf
3152  0138 1e03          	ldw	x,(OFST-1,sp)
3153  013a 2ebe          	jrsge	L1302
3154                     ; 151 }
3157  013c 5b04          	addw	sp,#4
3158  013e 81            	ret
3213                     ; 153 void Contagem_24s(void)
3213                     ; 154 {
3214                     	switch	.text
3215  013f               _Contagem_24s:
3217  013f 5204          	subw	sp,#4
3218       00000004      OFST:	set	4
3221                     ; 159 	for(i = 24; i >= 0; i--)
3223  0141 ae0018        	ldw	x,#24
3224  0144 1f03          	ldw	(OFST-1,sp),x
3226  0146               L5602:
3227                     ; 161 		unidades = i % 10;
3229  0146 1e03          	ldw	x,(OFST-1,sp)
3230  0148 a60a          	ld	a,#10
3231  014a cd0000        	call	c_smodx
3233  014d 01            	rrwa	x,a
3234  014e 6b01          	ld	(OFST-3,sp),a
3235  0150 02            	rlwa	x,a
3237                     ; 162 		dezenas = i / 10;
3239  0151 1e03          	ldw	x,(OFST-1,sp)
3240  0153 a60a          	ld	a,#10
3241  0155 cd0000        	call	c_sdivx
3243  0158 01            	rrwa	x,a
3244  0159 6b02          	ld	(OFST-2,sp),a
3245  015b 02            	rlwa	x,a
3247                     ; 164 		writeBCD(unidades);
3249  015c 7b01          	ld	a,(OFST-3,sp)
3250  015e ad2b          	call	_writeBCD
3252                     ; 165 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3254  0160 4b04          	push	#4
3255  0162 ae500a        	ldw	x,#20490
3256  0165 cd01f4        	call	_pulseLatch
3258  0168 84            	pop	a
3259                     ; 167 		writeBCD(dezenas);
3261  0169 7b02          	ld	a,(OFST-2,sp)
3262  016b ad1e          	call	_writeBCD
3264                     ; 168 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3266  016d 4b02          	push	#2
3267  016f ae500a        	ldw	x,#20490
3268  0172 cd01f4        	call	_pulseLatch
3270  0175 84            	pop	a
3271                     ; 170 		Delay_ms_Timer(1000);
3273  0176 ae03e8        	ldw	x,#1000
3274  0179 cd02e3        	call	_Delay_ms_Timer
3276                     ; 159 	for(i = 24; i >= 0; i--)
3278  017c 1e03          	ldw	x,(OFST-1,sp)
3279  017e 1d0001        	subw	x,#1
3280  0181 1f03          	ldw	(OFST-1,sp),x
3284  0183 9c            	rvf
3285  0184 1e03          	ldw	x,(OFST-1,sp)
3286  0186 2ebe          	jrsge	L5602
3287                     ; 172 }
3290  0188 5b04          	addw	sp,#4
3291  018a 81            	ret
3327                     ; 175 void writeBCD(uint8_t valor)
3327                     ; 176 {
3328                     	switch	.text
3329  018b               _writeBCD:
3331  018b 88            	push	a
3332       00000000      OFST:	set	0
3335                     ; 177 	if(valor & 0x01)
3337  018c a501          	bcp	a,#1
3338  018e 270b          	jreq	L1112
3339                     ; 178 		GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);
3341  0190 4b01          	push	#1
3342  0192 ae5005        	ldw	x,#20485
3343  0195 cd0000        	call	_GPIO_WriteHigh
3345  0198 84            	pop	a
3347  0199 2009          	jra	L3112
3348  019b               L1112:
3349                     ; 180 		GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
3351  019b 4b01          	push	#1
3352  019d ae5005        	ldw	x,#20485
3353  01a0 cd0000        	call	_GPIO_WriteLow
3355  01a3 84            	pop	a
3356  01a4               L3112:
3357                     ; 182 	if(valor & 0x02)
3359  01a4 7b01          	ld	a,(OFST+1,sp)
3360  01a6 a502          	bcp	a,#2
3361  01a8 270b          	jreq	L5112
3362                     ; 183 		GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);
3364  01aa 4b02          	push	#2
3365  01ac ae5005        	ldw	x,#20485
3366  01af cd0000        	call	_GPIO_WriteHigh
3368  01b2 84            	pop	a
3370  01b3 2009          	jra	L7112
3371  01b5               L5112:
3372                     ; 185 		GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
3374  01b5 4b02          	push	#2
3375  01b7 ae5005        	ldw	x,#20485
3376  01ba cd0000        	call	_GPIO_WriteLow
3378  01bd 84            	pop	a
3379  01be               L7112:
3380                     ; 187 	if(valor & 0x04)
3382  01be 7b01          	ld	a,(OFST+1,sp)
3383  01c0 a504          	bcp	a,#4
3384  01c2 270b          	jreq	L1212
3385                     ; 188 		GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);
3387  01c4 4b04          	push	#4
3388  01c6 ae5005        	ldw	x,#20485
3389  01c9 cd0000        	call	_GPIO_WriteHigh
3391  01cc 84            	pop	a
3393  01cd 2009          	jra	L3212
3394  01cf               L1212:
3395                     ; 190 		GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
3397  01cf 4b04          	push	#4
3398  01d1 ae5005        	ldw	x,#20485
3399  01d4 cd0000        	call	_GPIO_WriteLow
3401  01d7 84            	pop	a
3402  01d8               L3212:
3403                     ; 192 	if(valor & 0x08)
3405  01d8 7b01          	ld	a,(OFST+1,sp)
3406  01da a508          	bcp	a,#8
3407  01dc 270b          	jreq	L5212
3408                     ; 193 		GPIO_WriteHigh(LD_D_PORT, LD_D_PIN);
3410  01de 4b08          	push	#8
3411  01e0 ae5005        	ldw	x,#20485
3412  01e3 cd0000        	call	_GPIO_WriteHigh
3414  01e6 84            	pop	a
3416  01e7 2009          	jra	L7212
3417  01e9               L5212:
3418                     ; 195 		GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
3420  01e9 4b08          	push	#8
3421  01eb ae5005        	ldw	x,#20485
3422  01ee cd0000        	call	_GPIO_WriteLow
3424  01f1 84            	pop	a
3425  01f2               L7212:
3426                     ; 196 }
3429  01f2 84            	pop	a
3430  01f3 81            	ret
3531                     ; 199 void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN)
3531                     ; 200 {
3532                     	switch	.text
3533  01f4               _pulseLatch:
3535  01f4 89            	pushw	x
3536       00000000      OFST:	set	0
3539                     ; 201 	GPIO_WriteHigh(PORT, PIN);
3541  01f5 7b05          	ld	a,(OFST+5,sp)
3542  01f7 88            	push	a
3543  01f8 cd0000        	call	_GPIO_WriteHigh
3545  01fb 84            	pop	a
3546                     ; 202 	Delay_ms_Timer(1);
3548  01fc ae0001        	ldw	x,#1
3549  01ff cd02e3        	call	_Delay_ms_Timer
3551                     ; 203 	GPIO_WriteLow(PORT, PIN);
3553  0202 7b05          	ld	a,(OFST+5,sp)
3554  0204 88            	push	a
3555  0205 1e02          	ldw	x,(OFST+2,sp)
3556  0207 cd0000        	call	_GPIO_WriteLow
3558  020a 84            	pop	a
3559                     ; 204 }
3562  020b 85            	popw	x
3563  020c 81            	ret
3587                     ; 207 void InitGPIO(void)
3587                     ; 208 {
3588                     	switch	.text
3589  020d               _InitGPIO:
3593                     ; 209 	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3595  020d 4be0          	push	#224
3596  020f 4b01          	push	#1
3597  0211 ae5005        	ldw	x,#20485
3598  0214 cd0000        	call	_GPIO_Init
3600  0217 85            	popw	x
3601                     ; 210 	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3603  0218 4be0          	push	#224
3604  021a 4b02          	push	#2
3605  021c ae5005        	ldw	x,#20485
3606  021f cd0000        	call	_GPIO_Init
3608  0222 85            	popw	x
3609                     ; 211 	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3611  0223 4be0          	push	#224
3612  0225 4b04          	push	#4
3613  0227 ae5005        	ldw	x,#20485
3614  022a cd0000        	call	_GPIO_Init
3616  022d 85            	popw	x
3617                     ; 212 	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3619  022e 4be0          	push	#224
3620  0230 4b08          	push	#8
3621  0232 ae5005        	ldw	x,#20485
3622  0235 cd0000        	call	_GPIO_Init
3624  0238 85            	popw	x
3625                     ; 214 	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3627  0239 4be0          	push	#224
3628  023b 4b04          	push	#4
3629  023d ae500a        	ldw	x,#20490
3630  0240 cd0000        	call	_GPIO_Init
3632  0243 85            	popw	x
3633                     ; 215 	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3635  0244 4be0          	push	#224
3636  0246 4b02          	push	#2
3637  0248 ae500a        	ldw	x,#20490
3638  024b cd0000        	call	_GPIO_Init
3640  024e 85            	popw	x
3641                     ; 217 	GPIO_Init(BOT_1_PORT, BOT_1_PIN, GPIO_MODE_IN_PU_NO_IT);
3643  024f 4b40          	push	#64
3644  0251 4b40          	push	#64
3645  0253 ae500a        	ldw	x,#20490
3646  0256 cd0000        	call	_GPIO_Init
3648  0259 85            	popw	x
3649                     ; 218 	GPIO_Init(BOT_2_PORT, BOT_2_PIN, GPIO_MODE_IN_PU_NO_IT);
3651  025a 4b40          	push	#64
3652  025c 4b80          	push	#128
3653  025e ae500a        	ldw	x,#20490
3654  0261 cd0000        	call	_GPIO_Init
3656  0264 85            	popw	x
3657                     ; 220 	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3659  0265 4be0          	push	#224
3660  0267 4b01          	push	#1
3661  0269 ae500f        	ldw	x,#20495
3662  026c cd0000        	call	_GPIO_Init
3664  026f 85            	popw	x
3665                     ; 221 }
3668  0270 81            	ret
3701                     ; 224 void InitCLOCK(void)
3701                     ; 225 {
3702                     	switch	.text
3703  0271               _InitCLOCK:
3707                     ; 226 	CLK_DeInit();
3709  0271 cd0000        	call	_CLK_DeInit
3711                     ; 227 	CLK_HSECmd(DISABLE);
3713  0274 4f            	clr	a
3714  0275 cd0000        	call	_CLK_HSECmd
3716                     ; 228 	CLK_LSICmd(DISABLE);
3718  0278 4f            	clr	a
3719  0279 cd0000        	call	_CLK_LSICmd
3721                     ; 229 	CLK_HSICmd(ENABLE);
3723  027c a601          	ld	a,#1
3724  027e cd0000        	call	_CLK_HSICmd
3727  0281               L7222:
3728                     ; 231 	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3730  0281 ae0102        	ldw	x,#258
3731  0284 cd0000        	call	_CLK_GetFlagStatus
3733  0287 4d            	tnz	a
3734  0288 27f7          	jreq	L7222
3735                     ; 233 	CLK_ClockSwitchCmd(ENABLE);
3737  028a a601          	ld	a,#1
3738  028c cd0000        	call	_CLK_ClockSwitchCmd
3740                     ; 234 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
3742  028f 4f            	clr	a
3743  0290 cd0000        	call	_CLK_HSIPrescalerConfig
3745                     ; 235 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
3747  0293 a680          	ld	a,#128
3748  0295 cd0000        	call	_CLK_SYSCLKConfig
3750                     ; 236 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3752  0298 4b01          	push	#1
3753  029a 4b00          	push	#0
3754  029c ae01e1        	ldw	x,#481
3755  029f cd0000        	call	_CLK_ClockSwitchConfig
3757  02a2 85            	popw	x
3758                     ; 238 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3760  02a3 5f            	clrw	x
3761  02a4 cd0000        	call	_CLK_PeripheralClockConfig
3763                     ; 239 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3765  02a7 ae0100        	ldw	x,#256
3766  02aa cd0000        	call	_CLK_PeripheralClockConfig
3768                     ; 240 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
3770  02ad ae1300        	ldw	x,#4864
3771  02b0 cd0000        	call	_CLK_PeripheralClockConfig
3773                     ; 241 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3775  02b3 ae1200        	ldw	x,#4608
3776  02b6 cd0000        	call	_CLK_PeripheralClockConfig
3778                     ; 242 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3780  02b9 ae0300        	ldw	x,#768
3781  02bc cd0000        	call	_CLK_PeripheralClockConfig
3783                     ; 243 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3785  02bf ae0700        	ldw	x,#1792
3786  02c2 cd0000        	call	_CLK_PeripheralClockConfig
3788                     ; 244 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
3790  02c5 ae0401        	ldw	x,#1025
3791  02c8 cd0000        	call	_CLK_PeripheralClockConfig
3793                     ; 245 }
3796  02cb 81            	ret
3823                     ; 248 void InitTIM4(void)
3823                     ; 249 {
3824                     	switch	.text
3825  02cc               _InitTIM4:
3829                     ; 250 	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
3831  02cc ae0701        	ldw	x,#1793
3832  02cf cd0000        	call	_TIM4_PrescalerConfig
3834                     ; 251 	TIM4_SetAutoreload(125);
3836  02d2 a67d          	ld	a,#125
3837  02d4 cd0000        	call	_TIM4_SetAutoreload
3839                     ; 252 	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
3841  02d7 ae0100        	ldw	x,#256
3842  02da cd0000        	call	_TIM4_ITConfig
3844                     ; 253 	TIM4_Cmd(ENABLE);
3846  02dd a601          	ld	a,#1
3847  02df cd0000        	call	_TIM4_Cmd
3849                     ; 254 }
3852  02e2 81            	ret
3889                     ; 257 void Delay_ms_Timer(uint16_t ms)
3889                     ; 258 {
3890                     	switch	.text
3891  02e3               _Delay_ms_Timer:
3893  02e3 89            	pushw	x
3894       00000000      OFST:	set	0
3897  02e4 2011          	jra	L3622
3898  02e6               L1622:
3899                     ; 261 		TIM4_SetCounter(0);
3901  02e6 4f            	clr	a
3902  02e7 cd0000        	call	_TIM4_SetCounter
3904                     ; 262 		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
3906  02ea a601          	ld	a,#1
3907  02ec cd0000        	call	_TIM4_ClearFlag
3910  02ef               L1722:
3911                     ; 263 		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
3913  02ef a601          	ld	a,#1
3914  02f1 cd0000        	call	_TIM4_GetFlagStatus
3916  02f4 4d            	tnz	a
3917  02f5 27f8          	jreq	L1722
3918  02f7               L3622:
3919                     ; 259 	while(ms--)
3921  02f7 1e01          	ldw	x,(OFST+1,sp)
3922  02f9 1d0001        	subw	x,#1
3923  02fc 1f01          	ldw	(OFST+1,sp),x
3924  02fe 1c0001        	addw	x,#1
3925  0301 a30000        	cpw	x,#0
3926  0304 26e0          	jrne	L1622
3927                     ; 265 }
3930  0306 85            	popw	x
3931  0307 81            	ret
3944                     	xdef	_main
3945                     	xdef	_LED_BUZZER
3946                     	xdef	_ReadButton_02
3947                     	xdef	_ReadButton_01
3948                     	xdef	_Contagem_24s
3949                     	xdef	_Contagem_14s
3950                     	xdef	_pulseLatch
3951                     	xdef	_writeBCD
3952                     	xdef	_Delay_ms_Timer
3953                     	xdef	_InitTIM4
3954                     	xdef	_InitGPIO
3955                     	xdef	_InitCLOCK
3956                     	xref	_TIM4_ClearFlag
3957                     	xref	_TIM4_GetFlagStatus
3958                     	xref	_TIM4_SetAutoreload
3959                     	xref	_TIM4_SetCounter
3960                     	xref	_TIM4_PrescalerConfig
3961                     	xref	_TIM4_ITConfig
3962                     	xref	_TIM4_Cmd
3963                     	xref	_GPIO_ReadInputPin
3964                     	xref	_GPIO_WriteLow
3965                     	xref	_GPIO_WriteHigh
3966                     	xref	_GPIO_Init
3967                     	xref	_CLK_GetFlagStatus
3968                     	xref	_CLK_SYSCLKConfig
3969                     	xref	_CLK_HSIPrescalerConfig
3970                     	xref	_CLK_ClockSwitchConfig
3971                     	xref	_CLK_PeripheralClockConfig
3972                     	xref	_CLK_ClockSwitchCmd
3973                     	xref	_CLK_LSICmd
3974                     	xref	_CLK_HSICmd
3975                     	xref	_CLK_HSECmd
3976                     	xref	_CLK_DeInit
3977                     	xref.b	c_x
3996                     	xref	c_sdivx
3997                     	xref	c_smodx
3998                     	end
