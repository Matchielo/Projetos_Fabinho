   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     .const:	section	.text
2589  0000               _digit_patterns:
2590  0000 c0            	dc.b	192
2591  0001 f9            	dc.b	249
2592  0002 a4            	dc.b	164
2593  0003 b0            	dc.b	176
2594  0004 99            	dc.b	153
2595  0005 92            	dc.b	146
2596  0006 82            	dc.b	130
2597  0007 f8            	dc.b	248
2598  0008 80            	dc.b	128
2599  0009 90            	dc.b	144
2655                     ; 81 main()
2655                     ; 82 {
2657                     	switch	.text
2658  0000               _main:
2660  0000 89            	pushw	x
2661       00000002      OFST:	set	2
2664                     ; 83 	uint8_t last_button_state = 1; 				// Guarda o último estado lido do botão (1 = solto)
2666  0001 a601          	ld	a,#1
2667  0003 6b01          	ld	(OFST-1,sp),a
2669                     ; 86 	InitCLOCK();
2671  0005 cd0273        	call	_InitCLOCK
2673                     ; 87 	InitTIM4();     
2675  0008 cd025c        	call	_InitTIM4
2677                     ; 88 	InitGPIO();
2679  000b cd0096        	call	_InitGPIO
2681                     ; 89 	Display_Off();  
2683  000e cd00fa        	call	_Display_Off
2685  0011               L3071:
2686                     ; 93 		current_button = ReadButton(); 		// Lê o estado atual do botão
2688  0011 ad1a          	call	_ReadButton
2690  0013 6b02          	ld	(OFST+0,sp),a
2692                     ; 95 		if (last_button_state == 1 && current_button == 0)
2694  0015 7b01          	ld	a,(OFST-1,sp)
2695  0017 a101          	cp	a,#1
2696  0019 2606          	jrne	L7071
2698  001b 0d02          	tnz	(OFST+0,sp)
2699  001d 2602          	jrne	L7071
2700                     ; 97 				mostrardigitos();
2702  001f ad4b          	call	_mostrardigitos
2704  0021               L7071:
2705                     ; 100 		last_button_state = current_button;
2707  0021 7b02          	ld	a,(OFST+0,sp)
2708  0023 6b01          	ld	(OFST-1,sp),a
2710                     ; 101 		Delay_ms_Timer(20); // Pequeno atraso para ajudar no debounce
2712  0025 ae0014        	ldw	x,#20
2713  0028 cd0237        	call	_Delay_ms_Timer
2716  002b 20e4          	jra	L3071
2740                     ; 114 uint8_t ReadButton(void)
2740                     ; 115 {
2741                     	switch	.text
2742  002d               _ReadButton:
2746                     ; 120 	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
2748  002d 4b10          	push	#16
2749  002f ae500a        	ldw	x,#20490
2750  0032 cd0000        	call	_GPIO_ReadInputPin
2752  0035 5b01          	addw	sp,#1
2753  0037 4d            	tnz	a
2754  0038 2604          	jrne	L01
2755  003a a601          	ld	a,#1
2756  003c 2001          	jra	L21
2757  003e               L01:
2758  003e 4f            	clr	a
2759  003f               L21:
2762  003f 81            	ret
2817                     ; 124 void LedBuzzer(uint8_t num_acionamento, uint16_t temp_acionamento)
2817                     ; 125 {
2818                     	switch	.text
2819  0040               _LedBuzzer:
2821  0040 88            	push	a
2822  0041 88            	push	a
2823       00000001      OFST:	set	1
2826                     ; 127 	for (i = 0; i < num_acionamento; i++)
2828  0042 0f01          	clr	(OFST+0,sp)
2831  0044 201e          	jra	L3571
2832  0046               L7471:
2833                     ; 129 		GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
2835  0046 4b80          	push	#128
2836  0048 ae500f        	ldw	x,#20495
2837  004b cd0000        	call	_GPIO_WriteHigh
2839  004e 84            	pop	a
2840                     ; 130 		Delay_ms_Timer(temp_acionamento);
2842  004f 1e05          	ldw	x,(OFST+4,sp)
2843  0051 cd0237        	call	_Delay_ms_Timer
2845                     ; 131 		GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
2847  0054 4b80          	push	#128
2848  0056 ae500f        	ldw	x,#20495
2849  0059 cd0000        	call	_GPIO_WriteLow
2851  005c 84            	pop	a
2852                     ; 132 		Delay_ms_Timer(temp_acionamento);
2854  005d 1e05          	ldw	x,(OFST+4,sp)
2855  005f cd0237        	call	_Delay_ms_Timer
2857                     ; 127 	for (i = 0; i < num_acionamento; i++)
2859  0062 0c01          	inc	(OFST+0,sp)
2861  0064               L3571:
2864  0064 7b01          	ld	a,(OFST+0,sp)
2865  0066 1102          	cp	a,(OFST+1,sp)
2866  0068 25dc          	jrult	L7471
2867                     ; 134 }
2870  006a 85            	popw	x
2871  006b 81            	ret
2909                     ; 136 void mostrardigitos(void)
2909                     ; 137 {
2910                     	switch	.text
2911  006c               _mostrardigitos:
2913  006c 89            	pushw	x
2914       00000002      OFST:	set	2
2917                     ; 140 		for (i = 9; i >= 0; i--)
2919  006d ae0009        	ldw	x,#9
2920  0070 1f01          	ldw	(OFST-1,sp),x
2922  0072               L5771:
2923                     ; 142 			display_digit(i); // Chama a função genérica para exibir o dígito 'i'
2925  0072 7b02          	ld	a,(OFST+0,sp)
2926  0074 cd013a        	call	_display_digit
2928                     ; 143 			Delay_ms_Timer(1000);   // Espera 1 segundo
2930  0077 ae03e8        	ldw	x,#1000
2931  007a cd0237        	call	_Delay_ms_Timer
2933                     ; 140 		for (i = 9; i >= 0; i--)
2935  007d 1e01          	ldw	x,(OFST-1,sp)
2936  007f 1d0001        	subw	x,#1
2937  0082 1f01          	ldw	(OFST-1,sp),x
2941  0084 9c            	rvf
2942  0085 1e01          	ldw	x,(OFST-1,sp)
2943  0087 2ee9          	jrsge	L5771
2944                     ; 145 		LedBuzzer (3,1000);
2946  0089 ae03e8        	ldw	x,#1000
2947  008c 89            	pushw	x
2948  008d a603          	ld	a,#3
2949  008f adaf          	call	_LedBuzzer
2951  0091 85            	popw	x
2952                     ; 146 		Display_Off(); // Apaga o display após terminar a contagem
2954  0092 ad66          	call	_Display_Off
2956                     ; 147 }
2959  0094 85            	popw	x
2960  0095 81            	ret
2984                     ; 150 void InitGPIO(void)
2984                     ; 151 {
2985                     	switch	.text
2986  0096               _InitGPIO:
2990                     ; 153 	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
2992  0096 4bf0          	push	#240
2993  0098 4b40          	push	#64
2994  009a ae500a        	ldw	x,#20490
2995  009d cd0000        	call	_GPIO_Init
2997  00a0 85            	popw	x
2998                     ; 154 	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
3000  00a1 4bf0          	push	#240
3001  00a3 4b80          	push	#128
3002  00a5 ae500a        	ldw	x,#20490
3003  00a8 cd0000        	call	_GPIO_Init
3005  00ab 85            	popw	x
3006                     ; 155 	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
3008  00ac 4bf0          	push	#240
3009  00ae 4b01          	push	#1
3010  00b0 ae500f        	ldw	x,#20495
3011  00b3 cd0000        	call	_GPIO_Init
3013  00b6 85            	popw	x
3014                     ; 156 	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
3016  00b7 4bf0          	push	#240
3017  00b9 4b20          	push	#32
3018  00bb ae500f        	ldw	x,#20495
3019  00be cd0000        	call	_GPIO_Init
3021  00c1 85            	popw	x
3022                     ; 157 	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
3024  00c2 4bf0          	push	#240
3025  00c4 4b04          	push	#4
3026  00c6 ae500f        	ldw	x,#20495
3027  00c9 cd0000        	call	_GPIO_Init
3029  00cc 85            	popw	x
3030                     ; 158 	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
3032  00cd 4bf0          	push	#240
3033  00cf 4b08          	push	#8
3034  00d1 ae500f        	ldw	x,#20495
3035  00d4 cd0000        	call	_GPIO_Init
3037  00d7 85            	popw	x
3038                     ; 159 	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
3040  00d8 4bf0          	push	#240
3041  00da 4b10          	push	#16
3042  00dc ae500f        	ldw	x,#20495
3043  00df cd0000        	call	_GPIO_Init
3045  00e2 85            	popw	x
3046                     ; 162 	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
3048  00e3 4b40          	push	#64
3049  00e5 4b10          	push	#16
3050  00e7 ae500a        	ldw	x,#20490
3051  00ea cd0000        	call	_GPIO_Init
3053  00ed 85            	popw	x
3054                     ; 166 	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3056  00ee 4be0          	push	#224
3057  00f0 4b80          	push	#128
3058  00f2 ae500f        	ldw	x,#20495
3059  00f5 cd0000        	call	_GPIO_Init
3061  00f8 85            	popw	x
3062                     ; 167 }
3065  00f9 81            	ret
3090                     ; 170 void Display_Off(void)
3090                     ; 171 {
3091                     	switch	.text
3092  00fa               _Display_Off:
3096                     ; 173     GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3098  00fa 4b40          	push	#64
3099  00fc ae500a        	ldw	x,#20490
3100  00ff cd0000        	call	_GPIO_WriteLow
3102  0102 84            	pop	a
3103                     ; 174 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3105  0103 4b80          	push	#128
3106  0105 ae500a        	ldw	x,#20490
3107  0108 cd0000        	call	_GPIO_WriteLow
3109  010b 84            	pop	a
3110                     ; 175 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3112  010c 4b01          	push	#1
3113  010e ae500f        	ldw	x,#20495
3114  0111 cd0000        	call	_GPIO_WriteLow
3116  0114 84            	pop	a
3117                     ; 176 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3119  0115 4b20          	push	#32
3120  0117 ae500f        	ldw	x,#20495
3121  011a cd0000        	call	_GPIO_WriteLow
3123  011d 84            	pop	a
3124                     ; 177 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3126  011e 4b04          	push	#4
3127  0120 ae500f        	ldw	x,#20495
3128  0123 cd0000        	call	_GPIO_WriteLow
3130  0126 84            	pop	a
3131                     ; 178 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3133  0127 4b08          	push	#8
3134  0129 ae500f        	ldw	x,#20495
3135  012c cd0000        	call	_GPIO_WriteLow
3137  012f 84            	pop	a
3138                     ; 179 		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
3140  0130 4b10          	push	#16
3141  0132 ae500f        	ldw	x,#20495
3142  0135 cd0000        	call	_GPIO_WriteHigh
3144  0138 84            	pop	a
3145                     ; 180 }
3148  0139 81            	ret
3194                     ; 183 void display_digit(uint8_t digit_value)
3194                     ; 184 {
3195                     	switch	.text
3196  013a               _display_digit:
3198  013a 88            	push	a
3199       00000001      OFST:	set	1
3202                     ; 203 	pattern = digit_patterns[digit_value];
3204  013b 5f            	clrw	x
3205  013c 97            	ld	xl,a
3206  013d d60000        	ld	a,(_digit_patterns,x)
3207  0140 6b01          	ld	(OFST+0,sp),a
3209                     ; 212 	if (!((pattern >> 0) & 0x01))
3211  0142 7b01          	ld	a,(OFST+0,sp)
3212  0144 5f            	clrw	x
3213  0145 a501          	bcp	a,#1
3214  0147 260b          	jrne	L5402
3215                     ; 213 		{ GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN); }
3217  0149 4b40          	push	#64
3218  014b ae500a        	ldw	x,#20490
3219  014e cd0000        	call	_GPIO_WriteLow
3221  0151 84            	pop	a
3223  0152 2009          	jra	L7402
3224  0154               L5402:
3225                     ; 215 		{ GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN); }
3227  0154 4b40          	push	#64
3228  0156 ae500a        	ldw	x,#20490
3229  0159 cd0000        	call	_GPIO_WriteHigh
3231  015c 84            	pop	a
3232  015d               L7402:
3233                     ; 218 	if (!((pattern >> 1) & 0x01))
3235  015d 7b01          	ld	a,(OFST+0,sp)
3236  015f 44            	srl	a
3237  0160 5f            	clrw	x
3238  0161 a401          	and	a,#1
3239  0163 5f            	clrw	x
3240  0164 5f            	clrw	x
3241  0165 97            	ld	xl,a
3242  0166 a30000        	cpw	x,#0
3243  0169 260b          	jrne	L1502
3244                     ; 219 		{ GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN); }
3246  016b 4b80          	push	#128
3247  016d ae500a        	ldw	x,#20490
3248  0170 cd0000        	call	_GPIO_WriteLow
3250  0173 84            	pop	a
3252  0174 2009          	jra	L3502
3253  0176               L1502:
3254                     ; 221 		{ GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN); }
3256  0176 4b80          	push	#128
3257  0178 ae500a        	ldw	x,#20490
3258  017b cd0000        	call	_GPIO_WriteHigh
3260  017e 84            	pop	a
3261  017f               L3502:
3262                     ; 224 	if (!((pattern >> 2) & 0x01))
3264  017f 7b01          	ld	a,(OFST+0,sp)
3265  0181 44            	srl	a
3266  0182 44            	srl	a
3267  0183 5f            	clrw	x
3268  0184 a401          	and	a,#1
3269  0186 5f            	clrw	x
3270  0187 5f            	clrw	x
3271  0188 97            	ld	xl,a
3272  0189 a30000        	cpw	x,#0
3273  018c 260b          	jrne	L5502
3274                     ; 225 		{ GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN); }
3276  018e 4b01          	push	#1
3277  0190 ae500f        	ldw	x,#20495
3278  0193 cd0000        	call	_GPIO_WriteLow
3280  0196 84            	pop	a
3282  0197 2009          	jra	L7502
3283  0199               L5502:
3284                     ; 227 		{ GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN); }
3286  0199 4b01          	push	#1
3287  019b ae500f        	ldw	x,#20495
3288  019e cd0000        	call	_GPIO_WriteHigh
3290  01a1 84            	pop	a
3291  01a2               L7502:
3292                     ; 230 	if (!((pattern >> 3) & 0x01))
3294  01a2 7b01          	ld	a,(OFST+0,sp)
3295  01a4 44            	srl	a
3296  01a5 44            	srl	a
3297  01a6 44            	srl	a
3298  01a7 5f            	clrw	x
3299  01a8 a401          	and	a,#1
3300  01aa 5f            	clrw	x
3301  01ab 5f            	clrw	x
3302  01ac 97            	ld	xl,a
3303  01ad a30000        	cpw	x,#0
3304  01b0 260b          	jrne	L1602
3305                     ; 231 		{ GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN); }
3307  01b2 4b20          	push	#32
3308  01b4 ae500f        	ldw	x,#20495
3309  01b7 cd0000        	call	_GPIO_WriteLow
3311  01ba 84            	pop	a
3313  01bb 2009          	jra	L3602
3314  01bd               L1602:
3315                     ; 233 		{ GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN); }
3317  01bd 4b20          	push	#32
3318  01bf ae500f        	ldw	x,#20495
3319  01c2 cd0000        	call	_GPIO_WriteHigh
3321  01c5 84            	pop	a
3322  01c6               L3602:
3323                     ; 236 	if (!((pattern >> 4) & 0x01))
3325  01c6 7b01          	ld	a,(OFST+0,sp)
3326  01c8 4e            	swap	a
3327  01c9 a40f          	and	a,#15
3328  01cb 5f            	clrw	x
3329  01cc a401          	and	a,#1
3330  01ce 5f            	clrw	x
3331  01cf 5f            	clrw	x
3332  01d0 97            	ld	xl,a
3333  01d1 a30000        	cpw	x,#0
3334  01d4 260b          	jrne	L5602
3335                     ; 237 		{ GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN); }
3337  01d6 4b04          	push	#4
3338  01d8 ae500f        	ldw	x,#20495
3339  01db cd0000        	call	_GPIO_WriteLow
3341  01de 84            	pop	a
3343  01df 2009          	jra	L7602
3344  01e1               L5602:
3345                     ; 239 		{ GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN); }
3347  01e1 4b04          	push	#4
3348  01e3 ae500f        	ldw	x,#20495
3349  01e6 cd0000        	call	_GPIO_WriteHigh
3351  01e9 84            	pop	a
3352  01ea               L7602:
3353                     ; 242 	if (!((pattern >> 5) & 0x01))
3355  01ea 7b01          	ld	a,(OFST+0,sp)
3356  01ec 4e            	swap	a
3357  01ed 44            	srl	a
3358  01ee a407          	and	a,#7
3359  01f0 5f            	clrw	x
3360  01f1 a401          	and	a,#1
3361  01f3 5f            	clrw	x
3362  01f4 5f            	clrw	x
3363  01f5 97            	ld	xl,a
3364  01f6 a30000        	cpw	x,#0
3365  01f9 260b          	jrne	L1702
3366                     ; 243 		{ GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN); }
3368  01fb 4b08          	push	#8
3369  01fd ae500f        	ldw	x,#20495
3370  0200 cd0000        	call	_GPIO_WriteLow
3372  0203 84            	pop	a
3374  0204 2009          	jra	L3702
3375  0206               L1702:
3376                     ; 245 		{ GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN); }
3378  0206 4b08          	push	#8
3379  0208 ae500f        	ldw	x,#20495
3380  020b cd0000        	call	_GPIO_WriteHigh
3382  020e 84            	pop	a
3383  020f               L3702:
3384                     ; 248 	if (!((pattern >> 6) & 0x01))
3386  020f 7b01          	ld	a,(OFST+0,sp)
3387  0211 4e            	swap	a
3388  0212 44            	srl	a
3389  0213 44            	srl	a
3390  0214 a403          	and	a,#3
3391  0216 5f            	clrw	x
3392  0217 a401          	and	a,#1
3393  0219 5f            	clrw	x
3394  021a 5f            	clrw	x
3395  021b 97            	ld	xl,a
3396  021c a30000        	cpw	x,#0
3397  021f 260b          	jrne	L5702
3398                     ; 249 		{ GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN); }
3400  0221 4b10          	push	#16
3401  0223 ae500f        	ldw	x,#20495
3402  0226 cd0000        	call	_GPIO_WriteLow
3404  0229 84            	pop	a
3406  022a 2009          	jra	L7702
3407  022c               L5702:
3408                     ; 251 		{ GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN); }
3410  022c 4b10          	push	#16
3411  022e ae500f        	ldw	x,#20495
3412  0231 cd0000        	call	_GPIO_WriteHigh
3414  0234 84            	pop	a
3415  0235               L7702:
3416                     ; 252 }
3419  0235 84            	pop	a
3420  0236 81            	ret
3457                     ; 255 void Delay_ms_Timer(uint16_t ms)
3457                     ; 256 {
3458                     	switch	.text
3459  0237               _Delay_ms_Timer:
3461  0237 89            	pushw	x
3462       00000000      OFST:	set	0
3465  0238 2011          	jra	L1212
3466  023a               L7112:
3467                     ; 259 		TIM4_SetCounter(0); 										// Reinicia o contador do timer
3469  023a 4f            	clr	a
3470  023b cd0000        	call	_TIM4_SetCounter
3472                     ; 260 		TIM4_ClearFlag(TIM4_FLAG_UPDATE); 			// Limpa a flag de estouro (update event)
3474  023e a601          	ld	a,#1
3475  0240 cd0000        	call	_TIM4_ClearFlag
3478  0243               L7212:
3479                     ; 264 		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
3481  0243 a601          	ld	a,#1
3482  0245 cd0000        	call	_TIM4_GetFlagStatus
3484  0248 4d            	tnz	a
3485  0249 27f8          	jreq	L7212
3486  024b               L1212:
3487                     ; 257 	while(ms--) // Loop para o número de milissegundos
3489  024b 1e01          	ldw	x,(OFST+1,sp)
3490  024d 1d0001        	subw	x,#1
3491  0250 1f01          	ldw	(OFST+1,sp),x
3492  0252 1c0001        	addw	x,#1
3493  0255 a30000        	cpw	x,#0
3494  0258 26e0          	jrne	L7112
3495                     ; 266 }
3498  025a 85            	popw	x
3499  025b 81            	ret
3526                     ; 269 void InitTIM4(void)
3526                     ; 270 {
3527                     	switch	.text
3528  025c               _InitTIM4:
3532                     ; 274 	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
3534  025c ae0701        	ldw	x,#1793
3535  025f cd0000        	call	_TIM4_PrescalerConfig
3537                     ; 279 	TIM4_SetAutoreload(125); // O timer contará de 0 a 124, estourando em 125 (125 ticks)
3539  0262 a67d          	ld	a,#125
3540  0264 cd0000        	call	_TIM4_SetAutoreload
3542                     ; 282 	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
3544  0267 ae0100        	ldw	x,#256
3545  026a cd0000        	call	_TIM4_ITConfig
3547                     ; 285 	TIM4_Cmd(ENABLE);
3549  026d a601          	ld	a,#1
3550  026f cd0000        	call	_TIM4_Cmd
3552                     ; 286 }
3555  0272 81            	ret
3588                     ; 289 void InitCLOCK(void)
3588                     ; 290 {
3589                     	switch	.text
3590  0273               _InitCLOCK:
3594                     ; 291  	CLK_DeInit(); // Reseta a configuração de clock para o padrão
3596  0273 cd0000        	call	_CLK_DeInit
3598                     ; 293  	CLK_HSECmd(DISABLE); 	// Desativa o oscilador externo (High-Speed External)
3600  0276 4f            	clr	a
3601  0277 cd0000        	call	_CLK_HSECmd
3603                     ; 294  	CLK_LSICmd(DISABLE); 	// Desativa o clock lento interno (Low-Speed Internal)
3605  027a 4f            	clr	a
3606  027b cd0000        	call	_CLK_LSICmd
3608                     ; 295  	CLK_HSICmd(ENABLE); 	// Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3610  027e a601          	ld	a,#1
3611  0280 cd0000        	call	_CLK_HSICmd
3614  0283               L5512:
3615                     ; 298  	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3617  0283 ae0102        	ldw	x,#258
3618  0286 cd0000        	call	_CLK_GetFlagStatus
3620  0289 4d            	tnz	a
3621  028a 27f7          	jreq	L5512
3622                     ; 300  	CLK_ClockSwitchCmd(ENABLE); 	 	 	 	 	 	 // Habilita a troca de clock automática
3624  028c a601          	ld	a,#1
3625  028e cd0000        	call	_CLK_ClockSwitchCmd
3627                     ; 301  	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); 	// Prescaler HSI = 1 (clock total de 16MHz)
3629  0291 4f            	clr	a
3630  0292 cd0000        	call	_CLK_HSIPrescalerConfig
3632                     ; 302  	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 	 	 // Prescaler CPU = 1 (CPU também roda a 16MHz)
3634  0295 a680          	ld	a,#128
3635  0297 cd0000        	call	_CLK_SYSCLKConfig
3637                     ; 305  	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3639  029a 4b01          	push	#1
3640  029c 4b00          	push	#0
3641  029e ae01e1        	ldw	x,#481
3642  02a1 cd0000        	call	_CLK_ClockSwitchConfig
3644  02a4 85            	popw	x
3645                     ; 308  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3647  02a5 5f            	clrw	x
3648  02a6 cd0000        	call	_CLK_PeripheralClockConfig
3650                     ; 309  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3652  02a9 ae0100        	ldw	x,#256
3653  02ac cd0000        	call	_CLK_PeripheralClockConfig
3655                     ; 310  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se for usar ADC, habilite.
3657  02af ae1300        	ldw	x,#4864
3658  02b2 cd0000        	call	_CLK_PeripheralClockConfig
3660                     ; 311  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3662  02b5 ae1200        	ldw	x,#4608
3663  02b8 cd0000        	call	_CLK_PeripheralClockConfig
3665                     ; 312  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3667  02bb ae0300        	ldw	x,#768
3668  02be cd0000        	call	_CLK_PeripheralClockConfig
3670                     ; 313  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3672  02c1 ae0700        	ldw	x,#1792
3673  02c4 cd0000        	call	_CLK_PeripheralClockConfig
3675                     ; 315  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);  // HABILITADO O CLOCK PARA O TIMER 4
3677  02c7 ae0401        	ldw	x,#1025
3678  02ca cd0000        	call	_CLK_PeripheralClockConfig
3680                     ; 316 }
3683  02cd 81            	ret
3708                     	xdef	_main
3709                     	xdef	_InitTIM4
3710                     	xdef	_Delay_ms_Timer
3711                     	xdef	_LedBuzzer
3712                     	xdef	_ReadButton
3713                     	xdef	_Display_Off
3714                     	xdef	_mostrardigitos
3715                     	xdef	_display_digit
3716                     	xdef	_InitGPIO
3717                     	xdef	_InitCLOCK
3718                     	xdef	_digit_patterns
3719                     	xref	_TIM4_ClearFlag
3720                     	xref	_TIM4_GetFlagStatus
3721                     	xref	_TIM4_SetAutoreload
3722                     	xref	_TIM4_SetCounter
3723                     	xref	_TIM4_PrescalerConfig
3724                     	xref	_TIM4_ITConfig
3725                     	xref	_TIM4_Cmd
3726                     	xref	_GPIO_ReadInputPin
3727                     	xref	_GPIO_WriteLow
3728                     	xref	_GPIO_WriteHigh
3729                     	xref	_GPIO_Init
3730                     	xref	_CLK_GetFlagStatus
3731                     	xref	_CLK_SYSCLKConfig
3732                     	xref	_CLK_HSIPrescalerConfig
3733                     	xref	_CLK_ClockSwitchConfig
3734                     	xref	_CLK_PeripheralClockConfig
3735                     	xref	_CLK_ClockSwitchCmd
3736                     	xref	_CLK_LSICmd
3737                     	xref	_CLK_HSICmd
3738                     	xref	_CLK_HSECmd
3739                     	xref	_CLK_DeInit
3758                     	end
