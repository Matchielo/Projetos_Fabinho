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
2633                     ; 65 main()
2633                     ; 66 {
2635                     	switch	.text
2636  0000               _main:
2640                     ; 67 	InitCLOCK();
2642  0000 cd0239        	call	_InitCLOCK
2644                     ; 68 	InitTIM4();     // AGORA CHAMA INITTIM4
2646  0003 cd0222        	call	_InitTIM4
2648                     ; 69 	InitGPIO();
2650  0006 ad62          	call	_InitGPIO
2652                     ; 72 	GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
2654  0008 4b40          	push	#64
2655  000a ae500a        	ldw	x,#20490
2656  000d cd0000        	call	_GPIO_WriteHigh
2658  0010 84            	pop	a
2659                     ; 73 	GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
2661  0011 4b80          	push	#128
2662  0013 ae500a        	ldw	x,#20490
2663  0016 cd0000        	call	_GPIO_WriteHigh
2665  0019 84            	pop	a
2666                     ; 74   GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
2668  001a 4b01          	push	#1
2669  001c ae500f        	ldw	x,#20495
2670  001f cd0000        	call	_GPIO_WriteHigh
2672  0022 84            	pop	a
2673                     ; 75   GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
2675  0023 4b02          	push	#2
2676  0025 ae500f        	ldw	x,#20495
2677  0028 cd0000        	call	_GPIO_WriteHigh
2679  002b 84            	pop	a
2680                     ; 76   GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
2682  002c 4b04          	push	#4
2683  002e ae500f        	ldw	x,#20495
2684  0031 cd0000        	call	_GPIO_WriteHigh
2686  0034 84            	pop	a
2687                     ; 77   GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
2689  0035 4b08          	push	#8
2690  0037 ae500f        	ldw	x,#20495
2691  003a cd0000        	call	_GPIO_WriteHigh
2693  003d 84            	pop	a
2694                     ; 78   GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
2696  003e 4b10          	push	#16
2697  0040 ae500f        	ldw	x,#20495
2698  0043 cd0000        	call	_GPIO_WriteHigh
2700  0046 84            	pop	a
2701  0047               L1761:
2702                     ; 82 		mostrardigitos();
2704  0047 ad02          	call	_mostrardigitos
2707  0049 20fc          	jra	L1761
2743                     ; 87 void mostrardigitos(void)
2743                     ; 88 {
2744                     	switch	.text
2745  004b               _mostrardigitos:
2747  004b 89            	pushw	x
2748       00000002      OFST:	set	2
2751                     ; 91 		for (i = 0; i < 10; i++)
2753  004c 5f            	clrw	x
2754  004d 1f01          	ldw	(OFST-1,sp),x
2756  004f               L3171:
2757                     ; 93 			display_digit(i); // Chama a função genérica para exibir o dígito 'i'
2759  004f 7b02          	ld	a,(OFST+0,sp)
2760  0051 ad65          	call	_display_digit
2762                     ; 94 			Delay_ms_Timer(1000);   // Espera 1 segundo
2764  0053 ae03e8        	ldw	x,#1000
2765  0056 cd01fd        	call	_Delay_ms_Timer
2767                     ; 91 		for (i = 0; i < 10; i++)
2769  0059 1e01          	ldw	x,(OFST-1,sp)
2770  005b 1c0001        	addw	x,#1
2771  005e 1f01          	ldw	(OFST-1,sp),x
2775  0060 9c            	rvf
2776  0061 1e01          	ldw	x,(OFST-1,sp)
2777  0063 a3000a        	cpw	x,#10
2778  0066 2fe7          	jrslt	L3171
2779                     ; 96 }
2782  0068 85            	popw	x
2783  0069 81            	ret
2807                     ; 98 void InitGPIO(void)
2807                     ; 99 {
2808                     	switch	.text
2809  006a               _InitGPIO:
2813                     ; 100 	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
2815  006a 4bf0          	push	#240
2816  006c 4b40          	push	#64
2817  006e ae500a        	ldw	x,#20490
2818  0071 cd0000        	call	_GPIO_Init
2820  0074 85            	popw	x
2821                     ; 101 	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
2823  0075 4bf0          	push	#240
2824  0077 4b80          	push	#128
2825  0079 ae500a        	ldw	x,#20490
2826  007c cd0000        	call	_GPIO_Init
2828  007f 85            	popw	x
2829                     ; 102 	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
2831  0080 4bf0          	push	#240
2832  0082 4b01          	push	#1
2833  0084 ae500f        	ldw	x,#20495
2834  0087 cd0000        	call	_GPIO_Init
2836  008a 85            	popw	x
2837                     ; 103 	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
2839  008b 4bf0          	push	#240
2840  008d 4b02          	push	#2
2841  008f ae500f        	ldw	x,#20495
2842  0092 cd0000        	call	_GPIO_Init
2844  0095 85            	popw	x
2845                     ; 104 	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
2847  0096 4bf0          	push	#240
2848  0098 4b04          	push	#4
2849  009a ae500f        	ldw	x,#20495
2850  009d cd0000        	call	_GPIO_Init
2852  00a0 85            	popw	x
2853                     ; 105 	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
2855  00a1 4bf0          	push	#240
2856  00a3 4b08          	push	#8
2857  00a5 ae500f        	ldw	x,#20495
2858  00a8 cd0000        	call	_GPIO_Init
2860  00ab 85            	popw	x
2861                     ; 106 	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
2863  00ac 4bf0          	push	#240
2864  00ae 4b10          	push	#16
2865  00b0 ae500f        	ldw	x,#20495
2866  00b3 cd0000        	call	_GPIO_Init
2868  00b6 85            	popw	x
2869                     ; 107 }
2872  00b7 81            	ret
2918                     ; 110 void display_digit(uint8_t digit_value)
2918                     ; 111 {
2919                     	switch	.text
2920  00b8               _display_digit:
2922  00b8 88            	push	a
2923  00b9 88            	push	a
2924       00000001      OFST:	set	1
2927                     ; 117 	if (digit_value > 9)
2929  00ba a10a          	cp	a,#10
2930  00bc 2541          	jrult	L3571
2931                     ; 119 		GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
2933  00be 4b40          	push	#64
2934  00c0 ae500a        	ldw	x,#20490
2935  00c3 cd0000        	call	_GPIO_WriteHigh
2937  00c6 84            	pop	a
2938                     ; 120 		GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
2940  00c7 4b80          	push	#128
2941  00c9 ae500a        	ldw	x,#20490
2942  00cc cd0000        	call	_GPIO_WriteHigh
2944  00cf 84            	pop	a
2945                     ; 121 		GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
2947  00d0 4b01          	push	#1
2948  00d2 ae500f        	ldw	x,#20495
2949  00d5 cd0000        	call	_GPIO_WriteHigh
2951  00d8 84            	pop	a
2952                     ; 122 		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
2954  00d9 4b02          	push	#2
2955  00db ae500f        	ldw	x,#20495
2956  00de cd0000        	call	_GPIO_WriteHigh
2958  00e1 84            	pop	a
2959                     ; 123 		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
2961  00e2 4b04          	push	#4
2962  00e4 ae500f        	ldw	x,#20495
2963  00e7 cd0000        	call	_GPIO_WriteHigh
2965  00ea 84            	pop	a
2966                     ; 124 		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
2968  00eb 4b08          	push	#8
2969  00ed ae500f        	ldw	x,#20495
2970  00f0 cd0000        	call	_GPIO_WriteHigh
2972  00f3 84            	pop	a
2973                     ; 125 		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
2975  00f4 4b10          	push	#16
2976  00f6 ae500f        	ldw	x,#20495
2977  00f9 cd0000        	call	_GPIO_WriteHigh
2979  00fc 84            	pop	a
2980                     ; 126 		return;
2983  00fd 85            	popw	x
2984  00fe 81            	ret
2985  00ff               L3571:
2986                     ; 130 	pattern = digit_patterns[digit_value];
2988  00ff 7b02          	ld	a,(OFST+1,sp)
2989  0101 5f            	clrw	x
2990  0102 97            	ld	xl,a
2991  0103 d60000        	ld	a,(_digit_patterns,x)
2992  0106 6b01          	ld	(OFST+0,sp),a
2994                     ; 139 	if (!((pattern >> 0) & 0x01))
2996  0108 7b01          	ld	a,(OFST+0,sp)
2997  010a 5f            	clrw	x
2998  010b a501          	bcp	a,#1
2999  010d 260b          	jrne	L5571
3000                     ; 140 		{ GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN); }
3002  010f 4b40          	push	#64
3003  0111 ae500a        	ldw	x,#20490
3004  0114 cd0000        	call	_GPIO_WriteLow
3006  0117 84            	pop	a
3008  0118 2009          	jra	L7571
3009  011a               L5571:
3010                     ; 142 		{ GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN); }
3012  011a 4b40          	push	#64
3013  011c ae500a        	ldw	x,#20490
3014  011f cd0000        	call	_GPIO_WriteHigh
3016  0122 84            	pop	a
3017  0123               L7571:
3018                     ; 145 	if (!((pattern >> 1) & 0x01))
3020  0123 7b01          	ld	a,(OFST+0,sp)
3021  0125 44            	srl	a
3022  0126 5f            	clrw	x
3023  0127 a401          	and	a,#1
3024  0129 5f            	clrw	x
3025  012a 5f            	clrw	x
3026  012b 97            	ld	xl,a
3027  012c a30000        	cpw	x,#0
3028  012f 260b          	jrne	L1671
3029                     ; 146 		{ GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN); }
3031  0131 4b80          	push	#128
3032  0133 ae500a        	ldw	x,#20490
3033  0136 cd0000        	call	_GPIO_WriteLow
3035  0139 84            	pop	a
3037  013a 2009          	jra	L3671
3038  013c               L1671:
3039                     ; 148 		{ GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN); }
3041  013c 4b80          	push	#128
3042  013e ae500a        	ldw	x,#20490
3043  0141 cd0000        	call	_GPIO_WriteHigh
3045  0144 84            	pop	a
3046  0145               L3671:
3047                     ; 151 	if (!((pattern >> 2) & 0x01))
3049  0145 7b01          	ld	a,(OFST+0,sp)
3050  0147 44            	srl	a
3051  0148 44            	srl	a
3052  0149 5f            	clrw	x
3053  014a a401          	and	a,#1
3054  014c 5f            	clrw	x
3055  014d 5f            	clrw	x
3056  014e 97            	ld	xl,a
3057  014f a30000        	cpw	x,#0
3058  0152 260b          	jrne	L5671
3059                     ; 152 		{ GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN); }
3061  0154 4b01          	push	#1
3062  0156 ae500f        	ldw	x,#20495
3063  0159 cd0000        	call	_GPIO_WriteLow
3065  015c 84            	pop	a
3067  015d 2009          	jra	L7671
3068  015f               L5671:
3069                     ; 154 		{ GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN); }
3071  015f 4b01          	push	#1
3072  0161 ae500f        	ldw	x,#20495
3073  0164 cd0000        	call	_GPIO_WriteHigh
3075  0167 84            	pop	a
3076  0168               L7671:
3077                     ; 157 	if (!((pattern >> 3) & 0x01))
3079  0168 7b01          	ld	a,(OFST+0,sp)
3080  016a 44            	srl	a
3081  016b 44            	srl	a
3082  016c 44            	srl	a
3083  016d 5f            	clrw	x
3084  016e a401          	and	a,#1
3085  0170 5f            	clrw	x
3086  0171 5f            	clrw	x
3087  0172 97            	ld	xl,a
3088  0173 a30000        	cpw	x,#0
3089  0176 260b          	jrne	L1771
3090                     ; 158 		{ GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN); }
3092  0178 4b02          	push	#2
3093  017a ae500f        	ldw	x,#20495
3094  017d cd0000        	call	_GPIO_WriteLow
3096  0180 84            	pop	a
3098  0181 2009          	jra	L3771
3099  0183               L1771:
3100                     ; 160 		{ GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN); }
3102  0183 4b02          	push	#2
3103  0185 ae500f        	ldw	x,#20495
3104  0188 cd0000        	call	_GPIO_WriteHigh
3106  018b 84            	pop	a
3107  018c               L3771:
3108                     ; 163 	if (!((pattern >> 4) & 0x01))
3110  018c 7b01          	ld	a,(OFST+0,sp)
3111  018e 4e            	swap	a
3112  018f a40f          	and	a,#15
3113  0191 5f            	clrw	x
3114  0192 a401          	and	a,#1
3115  0194 5f            	clrw	x
3116  0195 5f            	clrw	x
3117  0196 97            	ld	xl,a
3118  0197 a30000        	cpw	x,#0
3119  019a 260b          	jrne	L5771
3120                     ; 164 		{ GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN); }
3122  019c 4b04          	push	#4
3123  019e ae500f        	ldw	x,#20495
3124  01a1 cd0000        	call	_GPIO_WriteLow
3126  01a4 84            	pop	a
3128  01a5 2009          	jra	L7771
3129  01a7               L5771:
3130                     ; 166 		{ GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN); }
3132  01a7 4b04          	push	#4
3133  01a9 ae500f        	ldw	x,#20495
3134  01ac cd0000        	call	_GPIO_WriteHigh
3136  01af 84            	pop	a
3137  01b0               L7771:
3138                     ; 169 	if (!((pattern >> 5) & 0x01))
3140  01b0 7b01          	ld	a,(OFST+0,sp)
3141  01b2 4e            	swap	a
3142  01b3 44            	srl	a
3143  01b4 a407          	and	a,#7
3144  01b6 5f            	clrw	x
3145  01b7 a401          	and	a,#1
3146  01b9 5f            	clrw	x
3147  01ba 5f            	clrw	x
3148  01bb 97            	ld	xl,a
3149  01bc a30000        	cpw	x,#0
3150  01bf 260b          	jrne	L1002
3151                     ; 170 		{ GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN); }
3153  01c1 4b08          	push	#8
3154  01c3 ae500f        	ldw	x,#20495
3155  01c6 cd0000        	call	_GPIO_WriteLow
3157  01c9 84            	pop	a
3159  01ca 2009          	jra	L3002
3160  01cc               L1002:
3161                     ; 172 		{ GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN); }
3163  01cc 4b08          	push	#8
3164  01ce ae500f        	ldw	x,#20495
3165  01d1 cd0000        	call	_GPIO_WriteHigh
3167  01d4 84            	pop	a
3168  01d5               L3002:
3169                     ; 175 	if (!((pattern >> 6) & 0x01))
3171  01d5 7b01          	ld	a,(OFST+0,sp)
3172  01d7 4e            	swap	a
3173  01d8 44            	srl	a
3174  01d9 44            	srl	a
3175  01da a403          	and	a,#3
3176  01dc 5f            	clrw	x
3177  01dd a401          	and	a,#1
3178  01df 5f            	clrw	x
3179  01e0 5f            	clrw	x
3180  01e1 97            	ld	xl,a
3181  01e2 a30000        	cpw	x,#0
3182  01e5 260b          	jrne	L5002
3183                     ; 176 		{ GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN); }
3185  01e7 4b10          	push	#16
3186  01e9 ae500f        	ldw	x,#20495
3187  01ec cd0000        	call	_GPIO_WriteLow
3189  01ef 84            	pop	a
3191  01f0 2009          	jra	L7002
3192  01f2               L5002:
3193                     ; 178 		{ GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN); }
3195  01f2 4b10          	push	#16
3196  01f4 ae500f        	ldw	x,#20495
3197  01f7 cd0000        	call	_GPIO_WriteHigh
3199  01fa 84            	pop	a
3200  01fb               L7002:
3201                     ; 179 }
3204  01fb 85            	popw	x
3205  01fc 81            	ret
3242                     ; 182 void Delay_ms_Timer(uint16_t ms)
3242                     ; 183 {
3243                     	switch	.text
3244  01fd               _Delay_ms_Timer:
3246  01fd 89            	pushw	x
3247       00000000      OFST:	set	0
3250  01fe 2011          	jra	L1302
3251  0200               L7202:
3252                     ; 186 		TIM4_SetCounter(0); 										// Reinicia o contador do timer
3254  0200 4f            	clr	a
3255  0201 cd0000        	call	_TIM4_SetCounter
3257                     ; 187 		TIM4_ClearFlag(TIM4_FLAG_UPDATE); 			// Limpa a flag de estouro (update event)
3259  0204 a601          	ld	a,#1
3260  0206 cd0000        	call	_TIM4_ClearFlag
3263  0209               L7302:
3264                     ; 191 		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
3266  0209 a601          	ld	a,#1
3267  020b cd0000        	call	_TIM4_GetFlagStatus
3269  020e 4d            	tnz	a
3270  020f 27f8          	jreq	L7302
3271  0211               L1302:
3272                     ; 184 	while(ms--) // Loop para o número de milissegundos
3274  0211 1e01          	ldw	x,(OFST+1,sp)
3275  0213 1d0001        	subw	x,#1
3276  0216 1f01          	ldw	(OFST+1,sp),x
3277  0218 1c0001        	addw	x,#1
3278  021b a30000        	cpw	x,#0
3279  021e 26e0          	jrne	L7202
3280                     ; 193 }
3283  0220 85            	popw	x
3284  0221 81            	ret
3311                     ; 196 void InitTIM4(void)
3311                     ; 197 {
3312                     	switch	.text
3313  0222               _InitTIM4:
3317                     ; 201 	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
3319  0222 ae0701        	ldw	x,#1793
3320  0225 cd0000        	call	_TIM4_PrescalerConfig
3322                     ; 206 	TIM4_SetAutoreload(125); // O timer contará de 0 a 124, estourando em 125 (125 ticks)
3324  0228 a67d          	ld	a,#125
3325  022a cd0000        	call	_TIM4_SetAutoreload
3327                     ; 209 	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
3329  022d ae0100        	ldw	x,#256
3330  0230 cd0000        	call	_TIM4_ITConfig
3332                     ; 212 	TIM4_Cmd(ENABLE);
3334  0233 a601          	ld	a,#1
3335  0235 cd0000        	call	_TIM4_Cmd
3337                     ; 213 }
3340  0238 81            	ret
3373                     ; 216 void InitCLOCK(void)
3373                     ; 217 {
3374                     	switch	.text
3375  0239               _InitCLOCK:
3379                     ; 218  	CLK_DeInit(); // Reseta a configuração de clock para o padrão
3381  0239 cd0000        	call	_CLK_DeInit
3383                     ; 220  	CLK_HSECmd(DISABLE); 	// Desativa o oscilador externo (High-Speed External)
3385  023c 4f            	clr	a
3386  023d cd0000        	call	_CLK_HSECmd
3388                     ; 221  	CLK_LSICmd(DISABLE); 	// Desativa o clock lento interno (Low-Speed Internal)
3390  0240 4f            	clr	a
3391  0241 cd0000        	call	_CLK_LSICmd
3393                     ; 222  	CLK_HSICmd(ENABLE); 	// Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3395  0244 a601          	ld	a,#1
3396  0246 cd0000        	call	_CLK_HSICmd
3399  0249               L5602:
3400                     ; 225  	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3402  0249 ae0102        	ldw	x,#258
3403  024c cd0000        	call	_CLK_GetFlagStatus
3405  024f 4d            	tnz	a
3406  0250 27f7          	jreq	L5602
3407                     ; 227  	CLK_ClockSwitchCmd(ENABLE); 	 	 	 	 	 	 // Habilita a troca de clock automática
3409  0252 a601          	ld	a,#1
3410  0254 cd0000        	call	_CLK_ClockSwitchCmd
3412                     ; 228  	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); 	// Prescaler HSI = 1 (clock total de 16MHz)
3414  0257 4f            	clr	a
3415  0258 cd0000        	call	_CLK_HSIPrescalerConfig
3417                     ; 229  	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 	 	 // Prescaler CPU = 1 (CPU também roda a 16MHz)
3419  025b a680          	ld	a,#128
3420  025d cd0000        	call	_CLK_SYSCLKConfig
3422                     ; 232  	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3424  0260 4b01          	push	#1
3425  0262 4b00          	push	#0
3426  0264 ae01e1        	ldw	x,#481
3427  0267 cd0000        	call	_CLK_ClockSwitchConfig
3429  026a 85            	popw	x
3430                     ; 235  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3432  026b 5f            	clrw	x
3433  026c cd0000        	call	_CLK_PeripheralClockConfig
3435                     ; 236  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3437  026f ae0100        	ldw	x,#256
3438  0272 cd0000        	call	_CLK_PeripheralClockConfig
3440                     ; 237  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se for usar ADC, habilite.
3442  0275 ae1300        	ldw	x,#4864
3443  0278 cd0000        	call	_CLK_PeripheralClockConfig
3445                     ; 238  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3447  027b ae1200        	ldw	x,#4608
3448  027e cd0000        	call	_CLK_PeripheralClockConfig
3450                     ; 239  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3452  0281 ae0300        	ldw	x,#768
3453  0284 cd0000        	call	_CLK_PeripheralClockConfig
3455                     ; 240  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3457  0287 ae0700        	ldw	x,#1792
3458  028a cd0000        	call	_CLK_PeripheralClockConfig
3460                     ; 242  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);  // HABILITADO O CLOCK PARA O TIMER 4
3462  028d ae0401        	ldw	x,#1025
3463  0290 cd0000        	call	_CLK_PeripheralClockConfig
3465                     ; 243 }
3468  0293 81            	ret
3493                     	xdef	_main
3494                     	xdef	_InitTIM4
3495                     	xdef	_Delay_ms_Timer
3496                     	xdef	_mostrardigitos
3497                     	xdef	_display_digit
3498                     	xdef	_InitGPIO
3499                     	xdef	_InitCLOCK
3500                     	xdef	_digit_patterns
3501                     	xref	_TIM4_ClearFlag
3502                     	xref	_TIM4_GetFlagStatus
3503                     	xref	_TIM4_SetAutoreload
3504                     	xref	_TIM4_SetCounter
3505                     	xref	_TIM4_PrescalerConfig
3506                     	xref	_TIM4_ITConfig
3507                     	xref	_TIM4_Cmd
3508                     	xref	_GPIO_WriteLow
3509                     	xref	_GPIO_WriteHigh
3510                     	xref	_GPIO_Init
3511                     	xref	_CLK_GetFlagStatus
3512                     	xref	_CLK_SYSCLKConfig
3513                     	xref	_CLK_HSIPrescalerConfig
3514                     	xref	_CLK_ClockSwitchConfig
3515                     	xref	_CLK_PeripheralClockConfig
3516                     	xref	_CLK_ClockSwitchCmd
3517                     	xref	_CLK_LSICmd
3518                     	xref	_CLK_HSICmd
3519                     	xref	_CLK_HSECmd
3520                     	xref	_CLK_DeInit
3539                     	end
