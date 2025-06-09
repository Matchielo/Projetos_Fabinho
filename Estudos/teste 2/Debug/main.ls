   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2628                     ; 48 main()
2628                     ; 49 {
2630                     	switch	.text
2631  0000               _main:
2635                     ; 50 	InitCLOCK();
2637  0000 cd0354        	call	_InitCLOCK
2639                     ; 51 	InitGPIO();
2641  0003 ad56          	call	_InitGPIO
2643  0005               L1761:
2644                     ; 57 		seg_0();
2646  0005 cd00d4        	call	_seg_0
2648                     ; 58 		Delay_ms(1000);
2650  0008 ae03e8        	ldw	x,#1000
2651  000b cd00a9        	call	_Delay_ms
2653                     ; 59 		seg_1();
2655  000e cd0114        	call	_seg_1
2657                     ; 60 		Delay_ms(1000);
2659  0011 ae03e8        	ldw	x,#1000
2660  0014 cd00a9        	call	_Delay_ms
2662                     ; 61 		seg_2();
2664  0017 cd0154        	call	_seg_2
2666                     ; 62 		Delay_ms(1000);
2668  001a ae03e8        	ldw	x,#1000
2669  001d cd00a9        	call	_Delay_ms
2671                     ; 63 		seg_3();
2673  0020 cd0194        	call	_seg_3
2675                     ; 64 		Delay_ms(1000);
2677  0023 ae03e8        	ldw	x,#1000
2678  0026 cd00a9        	call	_Delay_ms
2680                     ; 65 		seg_4();
2682  0029 cd01d4        	call	_seg_4
2684                     ; 66 		Delay_ms(1000);
2686  002c ae03e8        	ldw	x,#1000
2687  002f ad78          	call	_Delay_ms
2689                     ; 67 		seg_5();
2691  0031 cd0214        	call	_seg_5
2693                     ; 68 		Delay_ms(1000);
2695  0034 ae03e8        	ldw	x,#1000
2696  0037 ad70          	call	_Delay_ms
2698                     ; 69 		seg_6();
2700  0039 cd0254        	call	_seg_6
2702                     ; 70 		Delay_ms(1000);
2704  003c ae03e8        	ldw	x,#1000
2705  003f ad68          	call	_Delay_ms
2707                     ; 71 		seg_7();
2709  0041 cd0294        	call	_seg_7
2711                     ; 72 		Delay_ms(1000);
2713  0044 ae03e8        	ldw	x,#1000
2714  0047 ad60          	call	_Delay_ms
2716                     ; 73 		seg_8();
2718  0049 cd02d4        	call	_seg_8
2720                     ; 74 		Delay_ms(1000);
2722  004c ae03e8        	ldw	x,#1000
2723  004f ad58          	call	_Delay_ms
2725                     ; 75 		seg_9();
2727  0051 cd0314        	call	_seg_9
2729                     ; 76 		Delay_ms(1000);
2731  0054 ae03e8        	ldw	x,#1000
2732  0057 ad50          	call	_Delay_ms
2735  0059 20aa          	jra	L1761
2759                     ; 82 void InitGPIO(void)
2759                     ; 83 {
2760                     	switch	.text
2761  005b               _InitGPIO:
2765                     ; 84 	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2767  005b 4be0          	push	#224
2768  005d 4b40          	push	#64
2769  005f ae500a        	ldw	x,#20490
2770  0062 cd0000        	call	_GPIO_Init
2772  0065 85            	popw	x
2773                     ; 85 	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2775  0066 4be0          	push	#224
2776  0068 4b80          	push	#128
2777  006a ae500a        	ldw	x,#20490
2778  006d cd0000        	call	_GPIO_Init
2780  0070 85            	popw	x
2781                     ; 86 	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2783  0071 4be0          	push	#224
2784  0073 4b01          	push	#1
2785  0075 ae500f        	ldw	x,#20495
2786  0078 cd0000        	call	_GPIO_Init
2788  007b 85            	popw	x
2789                     ; 87 	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2791  007c 4be0          	push	#224
2792  007e 4b02          	push	#2
2793  0080 ae500f        	ldw	x,#20495
2794  0083 cd0000        	call	_GPIO_Init
2796  0086 85            	popw	x
2797                     ; 88 	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2799  0087 4be0          	push	#224
2800  0089 4b04          	push	#4
2801  008b ae500f        	ldw	x,#20495
2802  008e cd0000        	call	_GPIO_Init
2804  0091 85            	popw	x
2805                     ; 89 	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2807  0092 4be0          	push	#224
2808  0094 4b08          	push	#8
2809  0096 ae500f        	ldw	x,#20495
2810  0099 cd0000        	call	_GPIO_Init
2812  009c 85            	popw	x
2813                     ; 90 	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2815  009d 4be0          	push	#224
2816  009f 4b10          	push	#16
2817  00a1 ae500f        	ldw	x,#20495
2818  00a4 cd0000        	call	_GPIO_Init
2820  00a7 85            	popw	x
2821                     ; 91 }
2824  00a8 81            	ret
2867                     ; 93 void Delay_ms(uint16_t ms)
2867                     ; 94 {
2868                     	switch	.text
2869  00a9               _Delay_ms:
2871  00a9 89            	pushw	x
2872  00aa 5204          	subw	sp,#4
2873       00000004      OFST:	set	4
2876                     ; 96 	for (i = 0; i < (16000UL / 100UL) * ms; i++);
2878  00ac ae0000        	ldw	x,#0
2879  00af 1f03          	ldw	(OFST-1,sp),x
2880  00b1 ae0000        	ldw	x,#0
2881  00b4 1f01          	ldw	(OFST-3,sp),x
2884  00b6 2009          	jra	L3371
2885  00b8               L7271:
2889  00b8 96            	ldw	x,sp
2890  00b9 1c0001        	addw	x,#OFST-3
2891  00bc a601          	ld	a,#1
2892  00be cd0000        	call	c_lgadc
2895  00c1               L3371:
2898  00c1 1e05          	ldw	x,(OFST+1,sp)
2899  00c3 a6a0          	ld	a,#160
2900  00c5 cd0000        	call	c_cmulx
2902  00c8 96            	ldw	x,sp
2903  00c9 1c0001        	addw	x,#OFST-3
2904  00cc cd0000        	call	c_lcmp
2906  00cf 22e7          	jrugt	L7271
2907                     ; 97 }
2910  00d1 5b06          	addw	sp,#6
2911  00d3 81            	ret
2936                     ; 99 void seg_0(void)
2936                     ; 100 {
2937                     	switch	.text
2938  00d4               _seg_0:
2942                     ; 101 	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
2944  00d4 4b40          	push	#64
2945  00d6 ae500a        	ldw	x,#20490
2946  00d9 cd0000        	call	_GPIO_WriteLow
2948  00dc 84            	pop	a
2949                     ; 102 	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
2951  00dd 4b80          	push	#128
2952  00df ae500a        	ldw	x,#20490
2953  00e2 cd0000        	call	_GPIO_WriteLow
2955  00e5 84            	pop	a
2956                     ; 103 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
2958  00e6 4b01          	push	#1
2959  00e8 ae500f        	ldw	x,#20495
2960  00eb cd0000        	call	_GPIO_WriteLow
2962  00ee 84            	pop	a
2963                     ; 104 	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
2965  00ef 4b02          	push	#2
2966  00f1 ae500f        	ldw	x,#20495
2967  00f4 cd0000        	call	_GPIO_WriteLow
2969  00f7 84            	pop	a
2970                     ; 105 	GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
2972  00f8 4b04          	push	#4
2973  00fa ae500f        	ldw	x,#20495
2974  00fd cd0000        	call	_GPIO_WriteLow
2976  0100 84            	pop	a
2977                     ; 106 	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
2979  0101 4b08          	push	#8
2980  0103 ae500f        	ldw	x,#20495
2981  0106 cd0000        	call	_GPIO_WriteLow
2983  0109 84            	pop	a
2984                     ; 107 	GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
2986  010a 4b10          	push	#16
2987  010c ae500f        	ldw	x,#20495
2988  010f cd0000        	call	_GPIO_WriteHigh
2990  0112 84            	pop	a
2991                     ; 108 }
2994  0113 81            	ret
3019                     ; 109 void seg_1(void)
3019                     ; 110 {
3020                     	switch	.text
3021  0114               _seg_1:
3025                     ; 111 	GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
3027  0114 4b40          	push	#64
3028  0116 ae500a        	ldw	x,#20490
3029  0119 cd0000        	call	_GPIO_WriteHigh
3031  011c 84            	pop	a
3032                     ; 112 	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3034  011d 4b80          	push	#128
3035  011f ae500a        	ldw	x,#20490
3036  0122 cd0000        	call	_GPIO_WriteLow
3038  0125 84            	pop	a
3039                     ; 113 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3041  0126 4b01          	push	#1
3042  0128 ae500f        	ldw	x,#20495
3043  012b cd0000        	call	_GPIO_WriteLow
3045  012e 84            	pop	a
3046                     ; 114 	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3048  012f 4b02          	push	#2
3049  0131 ae500f        	ldw	x,#20495
3050  0134 cd0000        	call	_GPIO_WriteHigh
3052  0137 84            	pop	a
3053                     ; 115 	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3055  0138 4b04          	push	#4
3056  013a ae500f        	ldw	x,#20495
3057  013d cd0000        	call	_GPIO_WriteHigh
3059  0140 84            	pop	a
3060                     ; 116 	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3062  0141 4b08          	push	#8
3063  0143 ae500f        	ldw	x,#20495
3064  0146 cd0000        	call	_GPIO_WriteHigh
3066  0149 84            	pop	a
3067                     ; 117 	GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
3069  014a 4b10          	push	#16
3070  014c ae500f        	ldw	x,#20495
3071  014f cd0000        	call	_GPIO_WriteHigh
3073  0152 84            	pop	a
3074                     ; 118 }
3077  0153 81            	ret
3102                     ; 119 void seg_2(void)
3102                     ; 120 {
3103                     	switch	.text
3104  0154               _seg_2:
3108                     ; 121 	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3110  0154 4b40          	push	#64
3111  0156 ae500a        	ldw	x,#20490
3112  0159 cd0000        	call	_GPIO_WriteLow
3114  015c 84            	pop	a
3115                     ; 122 	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3117  015d 4b80          	push	#128
3118  015f ae500a        	ldw	x,#20490
3119  0162 cd0000        	call	_GPIO_WriteLow
3121  0165 84            	pop	a
3122                     ; 123 	GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
3124  0166 4b01          	push	#1
3125  0168 ae500f        	ldw	x,#20495
3126  016b cd0000        	call	_GPIO_WriteHigh
3128  016e 84            	pop	a
3129                     ; 124 	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3131  016f 4b02          	push	#2
3132  0171 ae500f        	ldw	x,#20495
3133  0174 cd0000        	call	_GPIO_WriteLow
3135  0177 84            	pop	a
3136                     ; 125 	GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3138  0178 4b04          	push	#4
3139  017a ae500f        	ldw	x,#20495
3140  017d cd0000        	call	_GPIO_WriteLow
3142  0180 84            	pop	a
3143                     ; 126 	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3145  0181 4b08          	push	#8
3146  0183 ae500f        	ldw	x,#20495
3147  0186 cd0000        	call	_GPIO_WriteHigh
3149  0189 84            	pop	a
3150                     ; 127 	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3152  018a 4b10          	push	#16
3153  018c ae500f        	ldw	x,#20495
3154  018f cd0000        	call	_GPIO_WriteLow
3156  0192 84            	pop	a
3157                     ; 128 }
3160  0193 81            	ret
3185                     ; 129 void seg_3(void)
3185                     ; 130 {
3186                     	switch	.text
3187  0194               _seg_3:
3191                     ; 131 	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3193  0194 4b40          	push	#64
3194  0196 ae500a        	ldw	x,#20490
3195  0199 cd0000        	call	_GPIO_WriteLow
3197  019c 84            	pop	a
3198                     ; 132 	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3200  019d 4b80          	push	#128
3201  019f ae500a        	ldw	x,#20490
3202  01a2 cd0000        	call	_GPIO_WriteLow
3204  01a5 84            	pop	a
3205                     ; 133 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3207  01a6 4b01          	push	#1
3208  01a8 ae500f        	ldw	x,#20495
3209  01ab cd0000        	call	_GPIO_WriteLow
3211  01ae 84            	pop	a
3212                     ; 134 	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3214  01af 4b02          	push	#2
3215  01b1 ae500f        	ldw	x,#20495
3216  01b4 cd0000        	call	_GPIO_WriteLow
3218  01b7 84            	pop	a
3219                     ; 135 	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3221  01b8 4b04          	push	#4
3222  01ba ae500f        	ldw	x,#20495
3223  01bd cd0000        	call	_GPIO_WriteHigh
3225  01c0 84            	pop	a
3226                     ; 136 	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3228  01c1 4b08          	push	#8
3229  01c3 ae500f        	ldw	x,#20495
3230  01c6 cd0000        	call	_GPIO_WriteHigh
3232  01c9 84            	pop	a
3233                     ; 137 	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3235  01ca 4b10          	push	#16
3236  01cc ae500f        	ldw	x,#20495
3237  01cf cd0000        	call	_GPIO_WriteLow
3239  01d2 84            	pop	a
3240                     ; 138 }
3243  01d3 81            	ret
3268                     ; 139 void seg_4(void)
3268                     ; 140 {
3269                     	switch	.text
3270  01d4               _seg_4:
3274                     ; 141 	GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
3276  01d4 4b40          	push	#64
3277  01d6 ae500a        	ldw	x,#20490
3278  01d9 cd0000        	call	_GPIO_WriteHigh
3280  01dc 84            	pop	a
3281                     ; 142 	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3283  01dd 4b80          	push	#128
3284  01df ae500a        	ldw	x,#20490
3285  01e2 cd0000        	call	_GPIO_WriteLow
3287  01e5 84            	pop	a
3288                     ; 143 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3290  01e6 4b01          	push	#1
3291  01e8 ae500f        	ldw	x,#20495
3292  01eb cd0000        	call	_GPIO_WriteLow
3294  01ee 84            	pop	a
3295                     ; 144 	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3297  01ef 4b02          	push	#2
3298  01f1 ae500f        	ldw	x,#20495
3299  01f4 cd0000        	call	_GPIO_WriteHigh
3301  01f7 84            	pop	a
3302                     ; 145 	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3304  01f8 4b04          	push	#4
3305  01fa ae500f        	ldw	x,#20495
3306  01fd cd0000        	call	_GPIO_WriteHigh
3308  0200 84            	pop	a
3309                     ; 146 	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3311  0201 4b08          	push	#8
3312  0203 ae500f        	ldw	x,#20495
3313  0206 cd0000        	call	_GPIO_WriteLow
3315  0209 84            	pop	a
3316                     ; 147 	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3318  020a 4b10          	push	#16
3319  020c ae500f        	ldw	x,#20495
3320  020f cd0000        	call	_GPIO_WriteLow
3322  0212 84            	pop	a
3323                     ; 148 }
3326  0213 81            	ret
3351                     ; 149 void seg_5(void)
3351                     ; 150 {
3352                     	switch	.text
3353  0214               _seg_5:
3357                     ; 151 	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3359  0214 4b40          	push	#64
3360  0216 ae500a        	ldw	x,#20490
3361  0219 cd0000        	call	_GPIO_WriteLow
3363  021c 84            	pop	a
3364                     ; 152 	GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
3366  021d 4b80          	push	#128
3367  021f ae500a        	ldw	x,#20490
3368  0222 cd0000        	call	_GPIO_WriteHigh
3370  0225 84            	pop	a
3371                     ; 153 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3373  0226 4b01          	push	#1
3374  0228 ae500f        	ldw	x,#20495
3375  022b cd0000        	call	_GPIO_WriteLow
3377  022e 84            	pop	a
3378                     ; 154 	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3380  022f 4b02          	push	#2
3381  0231 ae500f        	ldw	x,#20495
3382  0234 cd0000        	call	_GPIO_WriteLow
3384  0237 84            	pop	a
3385                     ; 155 	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3387  0238 4b04          	push	#4
3388  023a ae500f        	ldw	x,#20495
3389  023d cd0000        	call	_GPIO_WriteHigh
3391  0240 84            	pop	a
3392                     ; 156 	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3394  0241 4b08          	push	#8
3395  0243 ae500f        	ldw	x,#20495
3396  0246 cd0000        	call	_GPIO_WriteLow
3398  0249 84            	pop	a
3399                     ; 157 	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3401  024a 4b10          	push	#16
3402  024c ae500f        	ldw	x,#20495
3403  024f cd0000        	call	_GPIO_WriteLow
3405  0252 84            	pop	a
3406                     ; 158 }
3409  0253 81            	ret
3434                     ; 159 void seg_6(void)
3434                     ; 160 {
3435                     	switch	.text
3436  0254               _seg_6:
3440                     ; 161 	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3442  0254 4b40          	push	#64
3443  0256 ae500a        	ldw	x,#20490
3444  0259 cd0000        	call	_GPIO_WriteLow
3446  025c 84            	pop	a
3447                     ; 162 	GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
3449  025d 4b80          	push	#128
3450  025f ae500a        	ldw	x,#20490
3451  0262 cd0000        	call	_GPIO_WriteHigh
3453  0265 84            	pop	a
3454                     ; 163 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3456  0266 4b01          	push	#1
3457  0268 ae500f        	ldw	x,#20495
3458  026b cd0000        	call	_GPIO_WriteLow
3460  026e 84            	pop	a
3461                     ; 164 	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3463  026f 4b02          	push	#2
3464  0271 ae500f        	ldw	x,#20495
3465  0274 cd0000        	call	_GPIO_WriteLow
3467  0277 84            	pop	a
3468                     ; 165 	GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3470  0278 4b04          	push	#4
3471  027a ae500f        	ldw	x,#20495
3472  027d cd0000        	call	_GPIO_WriteLow
3474  0280 84            	pop	a
3475                     ; 166 	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3477  0281 4b08          	push	#8
3478  0283 ae500f        	ldw	x,#20495
3479  0286 cd0000        	call	_GPIO_WriteLow
3481  0289 84            	pop	a
3482                     ; 167 	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3484  028a 4b10          	push	#16
3485  028c ae500f        	ldw	x,#20495
3486  028f cd0000        	call	_GPIO_WriteLow
3488  0292 84            	pop	a
3489                     ; 168 }
3492  0293 81            	ret
3517                     ; 169 void seg_7(void)
3517                     ; 170 {
3518                     	switch	.text
3519  0294               _seg_7:
3523                     ; 171 	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3525  0294 4b40          	push	#64
3526  0296 ae500a        	ldw	x,#20490
3527  0299 cd0000        	call	_GPIO_WriteLow
3529  029c 84            	pop	a
3530                     ; 172 	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3532  029d 4b80          	push	#128
3533  029f ae500a        	ldw	x,#20490
3534  02a2 cd0000        	call	_GPIO_WriteLow
3536  02a5 84            	pop	a
3537                     ; 173 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3539  02a6 4b01          	push	#1
3540  02a8 ae500f        	ldw	x,#20495
3541  02ab cd0000        	call	_GPIO_WriteLow
3543  02ae 84            	pop	a
3544                     ; 174 	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3546  02af 4b02          	push	#2
3547  02b1 ae500f        	ldw	x,#20495
3548  02b4 cd0000        	call	_GPIO_WriteHigh
3550  02b7 84            	pop	a
3551                     ; 175 	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3553  02b8 4b04          	push	#4
3554  02ba ae500f        	ldw	x,#20495
3555  02bd cd0000        	call	_GPIO_WriteHigh
3557  02c0 84            	pop	a
3558                     ; 176 	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3560  02c1 4b08          	push	#8
3561  02c3 ae500f        	ldw	x,#20495
3562  02c6 cd0000        	call	_GPIO_WriteHigh
3564  02c9 84            	pop	a
3565                     ; 177 	GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
3567  02ca 4b10          	push	#16
3568  02cc ae500f        	ldw	x,#20495
3569  02cf cd0000        	call	_GPIO_WriteHigh
3571  02d2 84            	pop	a
3572                     ; 178 }
3575  02d3 81            	ret
3599                     ; 179 void seg_8(void)
3599                     ; 180 {
3600                     	switch	.text
3601  02d4               _seg_8:
3605                     ; 181 	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3607  02d4 4b40          	push	#64
3608  02d6 ae500a        	ldw	x,#20490
3609  02d9 cd0000        	call	_GPIO_WriteLow
3611  02dc 84            	pop	a
3612                     ; 182 	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3614  02dd 4b80          	push	#128
3615  02df ae500a        	ldw	x,#20490
3616  02e2 cd0000        	call	_GPIO_WriteLow
3618  02e5 84            	pop	a
3619                     ; 183 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3621  02e6 4b01          	push	#1
3622  02e8 ae500f        	ldw	x,#20495
3623  02eb cd0000        	call	_GPIO_WriteLow
3625  02ee 84            	pop	a
3626                     ; 184 	GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3628  02ef 4b02          	push	#2
3629  02f1 ae500f        	ldw	x,#20495
3630  02f4 cd0000        	call	_GPIO_WriteLow
3632  02f7 84            	pop	a
3633                     ; 185 	GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3635  02f8 4b04          	push	#4
3636  02fa ae500f        	ldw	x,#20495
3637  02fd cd0000        	call	_GPIO_WriteLow
3639  0300 84            	pop	a
3640                     ; 186 	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3642  0301 4b08          	push	#8
3643  0303 ae500f        	ldw	x,#20495
3644  0306 cd0000        	call	_GPIO_WriteLow
3646  0309 84            	pop	a
3647                     ; 187 	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3649  030a 4b10          	push	#16
3650  030c ae500f        	ldw	x,#20495
3651  030f cd0000        	call	_GPIO_WriteLow
3653  0312 84            	pop	a
3654                     ; 188 }
3657  0313 81            	ret
3682                     ; 189 void seg_9(void)
3682                     ; 190 {
3683                     	switch	.text
3684  0314               _seg_9:
3688                     ; 191 	GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3690  0314 4b40          	push	#64
3691  0316 ae500a        	ldw	x,#20490
3692  0319 cd0000        	call	_GPIO_WriteLow
3694  031c 84            	pop	a
3695                     ; 192 	GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3697  031d 4b80          	push	#128
3698  031f ae500a        	ldw	x,#20490
3699  0322 cd0000        	call	_GPIO_WriteLow
3701  0325 84            	pop	a
3702                     ; 193 	GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3704  0326 4b01          	push	#1
3705  0328 ae500f        	ldw	x,#20495
3706  032b cd0000        	call	_GPIO_WriteLow
3708  032e 84            	pop	a
3709                     ; 194 	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3711  032f 4b02          	push	#2
3712  0331 ae500f        	ldw	x,#20495
3713  0334 cd0000        	call	_GPIO_WriteHigh
3715  0337 84            	pop	a
3716                     ; 195 	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3718  0338 4b04          	push	#4
3719  033a ae500f        	ldw	x,#20495
3720  033d cd0000        	call	_GPIO_WriteHigh
3722  0340 84            	pop	a
3723                     ; 196 	GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3725  0341 4b08          	push	#8
3726  0343 ae500f        	ldw	x,#20495
3727  0346 cd0000        	call	_GPIO_WriteLow
3729  0349 84            	pop	a
3730                     ; 197 	GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3732  034a 4b10          	push	#16
3733  034c ae500f        	ldw	x,#20495
3734  034f cd0000        	call	_GPIO_WriteLow
3736  0352 84            	pop	a
3737                     ; 198 }
3740  0353 81            	ret
3773                     ; 201 void InitCLOCK(void)
3773                     ; 202 {
3774                     	switch	.text
3775  0354               _InitCLOCK:
3779                     ; 203     CLK_DeInit(); // Reseta a configuração de clock para o padrão
3781  0354 cd0000        	call	_CLK_DeInit
3783                     ; 205     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
3785  0357 4f            	clr	a
3786  0358 cd0000        	call	_CLK_HSECmd
3788                     ; 206     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
3790  035b 4f            	clr	a
3791  035c cd0000        	call	_CLK_LSICmd
3793                     ; 207     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3795  035f a601          	ld	a,#1
3796  0361 cd0000        	call	_CLK_HSICmd
3799  0364               L1702:
3800                     ; 210     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3802  0364 ae0102        	ldw	x,#258
3803  0367 cd0000        	call	_CLK_GetFlagStatus
3805  036a 4d            	tnz	a
3806  036b 27f7          	jreq	L1702
3807                     ; 212     CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
3809  036d a601          	ld	a,#1
3810  036f cd0000        	call	_CLK_ClockSwitchCmd
3812                     ; 213     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
3814  0372 4f            	clr	a
3815  0373 cd0000        	call	_CLK_HSIPrescalerConfig
3817                     ; 214     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)
3819  0376 a680          	ld	a,#128
3820  0378 cd0000        	call	_CLK_SYSCLKConfig
3822                     ; 217     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3824  037b 4b01          	push	#1
3825  037d 4b00          	push	#0
3826  037f ae01e1        	ldw	x,#481
3827  0382 cd0000        	call	_CLK_ClockSwitchConfig
3829  0385 85            	popw	x
3830                     ; 220     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3832  0386 5f            	clrw	x
3833  0387 cd0000        	call	_CLK_PeripheralClockConfig
3835                     ; 221     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3837  038a ae0100        	ldw	x,#256
3838  038d cd0000        	call	_CLK_PeripheralClockConfig
3840                     ; 222     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
3842  0390 ae1300        	ldw	x,#4864
3843  0393 cd0000        	call	_CLK_PeripheralClockConfig
3845                     ; 223     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3847  0396 ae1200        	ldw	x,#4608
3848  0399 cd0000        	call	_CLK_PeripheralClockConfig
3850                     ; 224     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3852  039c ae0300        	ldw	x,#768
3853  039f cd0000        	call	_CLK_PeripheralClockConfig
3855                     ; 225     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3857  03a2 ae0700        	ldw	x,#1792
3858  03a5 cd0000        	call	_CLK_PeripheralClockConfig
3860                     ; 226     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
3862  03a8 ae0500        	ldw	x,#1280
3863  03ab cd0000        	call	_CLK_PeripheralClockConfig
3865                     ; 227 }
3868  03ae 81            	ret
3881                     	xdef	_main
3882                     	xdef	_seg_9
3883                     	xdef	_seg_8
3884                     	xdef	_seg_7
3885                     	xdef	_seg_6
3886                     	xdef	_seg_5
3887                     	xdef	_seg_4
3888                     	xdef	_seg_3
3889                     	xdef	_seg_2
3890                     	xdef	_seg_1
3891                     	xdef	_seg_0
3892                     	xdef	_InitCLOCK
3893                     	xdef	_Delay_ms
3894                     	xdef	_InitGPIO
3895                     	xref	_GPIO_WriteLow
3896                     	xref	_GPIO_WriteHigh
3897                     	xref	_GPIO_Init
3898                     	xref	_CLK_GetFlagStatus
3899                     	xref	_CLK_SYSCLKConfig
3900                     	xref	_CLK_HSIPrescalerConfig
3901                     	xref	_CLK_ClockSwitchConfig
3902                     	xref	_CLK_PeripheralClockConfig
3903                     	xref	_CLK_ClockSwitchCmd
3904                     	xref	_CLK_LSICmd
3905                     	xref	_CLK_HSICmd
3906                     	xref	_CLK_HSECmd
3907                     	xref	_CLK_DeInit
3926                     	xref	c_lcmp
3927                     	xref	c_cmulx
3928                     	xref	c_lgadc
3929                     	end
