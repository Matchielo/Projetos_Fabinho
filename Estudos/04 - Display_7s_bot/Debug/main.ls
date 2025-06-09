   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2651                     ; 45 void main()
2651                     ; 46 {
2653                     	switch	.text
2654  0000               _main:
2656  0000 5203          	subw	sp,#3
2657       00000003      OFST:	set	3
2660                     ; 47 	uint8_t last_button_state = 1; 			// Guarda o último estado lido do botão (1 = solto)
2662  0002 a601          	ld	a,#1
2663  0004 6b01          	ld	(OFST-2,sp),a
2665                     ; 49 	uint8_t button_action_pending = 0;	// variável de controle
2667  0006 0f02          	clr	(OFST-1,sp)
2669                     ; 51 		InitCLOCK();
2671  0008 cd0410        	call	_InitCLOCK
2673                     ; 52     InitGPIO();
2675  000b cd00b7        	call	_InitGPIO
2677                     ; 53 		Display_Off();
2679  000e ad67          	call	_Display_Off
2681  0010               L7071:
2682                     ; 57 				current_button = ReadButton(); 		// CB recebe o valor do estado do Botão atual
2684  0010 ad30          	call	_ReadButton
2686  0012 6b03          	ld	(OFST+0,sp),a
2688                     ; 59 			if (last_button_state == 1 && current_button == 0)
2690  0014 7b01          	ld	a,(OFST-2,sp)
2691  0016 a101          	cp	a,#1
2692  0018 2610          	jrne	L3171
2694  001a 0d03          	tnz	(OFST+0,sp)
2695  001c 260c          	jrne	L3171
2696                     ; 62 				if (button_action_pending == 0) // Garante que a ação ocorre uma vez por pressionamento
2698  001e 0d02          	tnz	(OFST-1,sp)
2699  0020 2614          	jrne	L7171
2700                     ; 64 					contarDigitos();
2702  0022 ad31          	call	_contarDigitos
2704                     ; 65 					button_action_pending = 1;
2706  0024 a601          	ld	a,#1
2707  0026 6b02          	ld	(OFST-1,sp),a
2709  0028 200c          	jra	L7171
2710  002a               L3171:
2711                     ; 70 			else if (last_button_state == 0 && current_button == 1)
2713  002a 0d01          	tnz	(OFST-2,sp)
2714  002c 2608          	jrne	L7171
2716  002e 7b03          	ld	a,(OFST+0,sp)
2717  0030 a101          	cp	a,#1
2718  0032 2602          	jrne	L7171
2719                     ; 72 				button_action_pending = 0; // permite uma nova ação no próximo pressionamento
2721  0034 0f02          	clr	(OFST-1,sp)
2723  0036               L7171:
2724                     ; 77 					last_button_state = current_button;
2726  0036 7b03          	ld	a,(OFST+0,sp)
2727  0038 6b01          	ld	(OFST-2,sp),a
2729                     ; 78 					Delay_ms(20);
2731  003a ae0014        	ldw	x,#20
2732  003d cd03e5        	call	_Delay_ms
2735  0040 20ce          	jra	L7071
2759                     ; 83 uint8_t ReadButton(void)
2759                     ; 84 {
2760                     	switch	.text
2761  0042               _ReadButton:
2765                     ; 87 	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
2767  0042 4b10          	push	#16
2768  0044 ae500a        	ldw	x,#20490
2769  0047 cd0000        	call	_GPIO_ReadInputPin
2771  004a 5b01          	addw	sp,#1
2772  004c 4d            	tnz	a
2773  004d 2604          	jrne	L01
2774  004f a601          	ld	a,#1
2775  0051 2001          	jra	L21
2776  0053               L01:
2777  0053 4f            	clr	a
2778  0054               L21:
2781  0054 81            	ret
2818                     ; 90 void contarDigitos(void)
2818                     ; 91 {
2819                     	switch	.text
2820  0055               _contarDigitos:
2822  0055 89            	pushw	x
2823       00000002      OFST:	set	2
2826                     ; 96     for (i = 0; i < 10; i++)
2828  0056 5f            	clrw	x
2829  0057 1f01          	ldw	(OFST-1,sp),x
2831  0059               L1571:
2832                     ; 98         Display_7s(i);
2834  0059 1e01          	ldw	x,(OFST-1,sp)
2835  005b cd0110        	call	_Display_7s
2837                     ; 99         Delay_ms(1000); // Espera 1 segundo
2839  005e ae03e8        	ldw	x,#1000
2840  0061 cd03e5        	call	_Delay_ms
2842                     ; 96     for (i = 0; i < 10; i++)
2844  0064 1e01          	ldw	x,(OFST-1,sp)
2845  0066 1c0001        	addw	x,#1
2846  0069 1f01          	ldw	(OFST-1,sp),x
2850  006b 9c            	rvf
2851  006c 1e01          	ldw	x,(OFST-1,sp)
2852  006e a3000a        	cpw	x,#10
2853  0071 2fe6          	jrslt	L1571
2854                     ; 102 		Display_Off(); // Apaga o display após terminar a contagem
2856  0073 ad02          	call	_Display_Off
2858                     ; 103 }
2861  0075 85            	popw	x
2862  0076 81            	ret
2886                     ; 106 void Display_Off(void)
2886                     ; 107 {
2887                     	switch	.text
2888  0077               _Display_Off:
2892                     ; 109     GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
2894  0077 4b40          	push	#64
2895  0079 ae500a        	ldw	x,#20490
2896  007c cd0000        	call	_GPIO_WriteHigh
2898  007f 84            	pop	a
2899                     ; 110     GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
2901  0080 4b80          	push	#128
2902  0082 ae500a        	ldw	x,#20490
2903  0085 cd0000        	call	_GPIO_WriteHigh
2905  0088 84            	pop	a
2906                     ; 111     GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
2908  0089 4b01          	push	#1
2909  008b ae500f        	ldw	x,#20495
2910  008e cd0000        	call	_GPIO_WriteHigh
2912  0091 84            	pop	a
2913                     ; 112     GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
2915  0092 4b02          	push	#2
2916  0094 ae500f        	ldw	x,#20495
2917  0097 cd0000        	call	_GPIO_WriteHigh
2919  009a 84            	pop	a
2920                     ; 113     GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
2922  009b 4b04          	push	#4
2923  009d ae500f        	ldw	x,#20495
2924  00a0 cd0000        	call	_GPIO_WriteHigh
2926  00a3 84            	pop	a
2927                     ; 114     GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
2929  00a4 4b08          	push	#8
2930  00a6 ae500f        	ldw	x,#20495
2931  00a9 cd0000        	call	_GPIO_WriteHigh
2933  00ac 84            	pop	a
2934                     ; 115     GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
2936  00ad 4b10          	push	#16
2937  00af ae500f        	ldw	x,#20495
2938  00b2 cd0000        	call	_GPIO_WriteHigh
2940  00b5 84            	pop	a
2941                     ; 116 }
2944  00b6 81            	ret
2968                     ; 119 void InitGPIO(void)
2968                     ; 120 {
2969                     	switch	.text
2970  00b7               _InitGPIO:
2974                     ; 122 	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2976  00b7 4be0          	push	#224
2977  00b9 4b40          	push	#64
2978  00bb ae500a        	ldw	x,#20490
2979  00be cd0000        	call	_GPIO_Init
2981  00c1 85            	popw	x
2982                     ; 123 	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2984  00c2 4be0          	push	#224
2985  00c4 4b80          	push	#128
2986  00c6 ae500a        	ldw	x,#20490
2987  00c9 cd0000        	call	_GPIO_Init
2989  00cc 85            	popw	x
2990                     ; 124 	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2992  00cd 4be0          	push	#224
2993  00cf 4b01          	push	#1
2994  00d1 ae500f        	ldw	x,#20495
2995  00d4 cd0000        	call	_GPIO_Init
2997  00d7 85            	popw	x
2998                     ; 125 	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3000  00d8 4be0          	push	#224
3001  00da 4b02          	push	#2
3002  00dc ae500f        	ldw	x,#20495
3003  00df cd0000        	call	_GPIO_Init
3005  00e2 85            	popw	x
3006                     ; 126 	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3008  00e3 4be0          	push	#224
3009  00e5 4b04          	push	#4
3010  00e7 ae500f        	ldw	x,#20495
3011  00ea cd0000        	call	_GPIO_Init
3013  00ed 85            	popw	x
3014                     ; 127 	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3016  00ee 4be0          	push	#224
3017  00f0 4b08          	push	#8
3018  00f2 ae500f        	ldw	x,#20495
3019  00f5 cd0000        	call	_GPIO_Init
3021  00f8 85            	popw	x
3022                     ; 128 	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3024  00f9 4be0          	push	#224
3025  00fb 4b10          	push	#16
3026  00fd ae500f        	ldw	x,#20495
3027  0100 cd0000        	call	_GPIO_Init
3029  0103 85            	popw	x
3030                     ; 131 	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
3032  0104 4b40          	push	#64
3033  0106 4b10          	push	#16
3034  0108 ae500a        	ldw	x,#20490
3035  010b cd0000        	call	_GPIO_Init
3037  010e 85            	popw	x
3038                     ; 132 }
3041  010f 81            	ret
3078                     ; 134 void Display_7s(int SEG)
3078                     ; 135 {
3079                     	switch	.text
3080  0110               _Display_7s:
3084                     ; 136 	switch (SEG) {
3087                     ; 248 		break;
3088  0110 5d            	tnzw	x
3089  0111 273a          	jreq	L7771
3090  0113 5a            	decw	x
3091  0114 277a          	jreq	L1002
3092  0116 5a            	decw	x
3093  0117 2603          	jrne	L42
3094  0119 cc01d3        	jp	L3002
3095  011c               L42:
3096  011c 5a            	decw	x
3097  011d 2603          	jrne	L62
3098  011f cc0216        	jp	L5002
3099  0122               L62:
3100  0122 5a            	decw	x
3101  0123 2603          	jrne	L03
3102  0125 cc0259        	jp	L7002
3103  0128               L03:
3104  0128 5a            	decw	x
3105  0129 2603          	jrne	L23
3106  012b cc029c        	jp	L1102
3107  012e               L23:
3108  012e 5a            	decw	x
3109  012f 2603          	jrne	L43
3110  0131 cc02df        	jp	L3102
3111  0134               L43:
3112  0134 5a            	decw	x
3113  0135 2603          	jrne	L63
3114  0137 cc0322        	jp	L5102
3115  013a               L63:
3116  013a 5a            	decw	x
3117  013b 2603          	jrne	L04
3118  013d cc0364        	jp	L7102
3119  0140               L04:
3120  0140 5a            	decw	x
3121  0141 2603          	jrne	L24
3122  0143 cc03a5        	jp	L1202
3123  0146               L24:
3124  0146               L3202:
3125                     ; 246 		default:
3125                     ; 247     Display_Off(); // Em caso de número inválido, apaga o display
3127  0146 cd0077        	call	_Display_Off
3129                     ; 248 		break;
3131  0149 ace403e4      	jpf	L5402
3132  014d               L7771:
3133                     ; 138 		case 0:
3133                     ; 139 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3135  014d 4b40          	push	#64
3136  014f ae500a        	ldw	x,#20490
3137  0152 cd0000        	call	_GPIO_WriteLow
3139  0155 84            	pop	a
3140                     ; 140 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3142  0156 4b80          	push	#128
3143  0158 ae500a        	ldw	x,#20490
3144  015b cd0000        	call	_GPIO_WriteLow
3146  015e 84            	pop	a
3147                     ; 141 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3149  015f 4b01          	push	#1
3150  0161 ae500f        	ldw	x,#20495
3151  0164 cd0000        	call	_GPIO_WriteLow
3153  0167 84            	pop	a
3154                     ; 142 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3156  0168 4b02          	push	#2
3157  016a ae500f        	ldw	x,#20495
3158  016d cd0000        	call	_GPIO_WriteLow
3160  0170 84            	pop	a
3161                     ; 143 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3163  0171 4b04          	push	#4
3164  0173 ae500f        	ldw	x,#20495
3165  0176 cd0000        	call	_GPIO_WriteLow
3167  0179 84            	pop	a
3168                     ; 144 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3170  017a 4b08          	push	#8
3171  017c ae500f        	ldw	x,#20495
3172  017f cd0000        	call	_GPIO_WriteLow
3174  0182 84            	pop	a
3175                     ; 145 		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
3177  0183 4b10          	push	#16
3178  0185 ae500f        	ldw	x,#20495
3179  0188 cd0000        	call	_GPIO_WriteHigh
3181  018b 84            	pop	a
3182                     ; 146 		break;		
3184  018c ace403e4      	jpf	L5402
3185  0190               L1002:
3186                     ; 148 		case 1:
3186                     ; 149 		GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
3188  0190 4b40          	push	#64
3189  0192 ae500a        	ldw	x,#20490
3190  0195 cd0000        	call	_GPIO_WriteHigh
3192  0198 84            	pop	a
3193                     ; 150 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3195  0199 4b80          	push	#128
3196  019b ae500a        	ldw	x,#20490
3197  019e cd0000        	call	_GPIO_WriteLow
3199  01a1 84            	pop	a
3200                     ; 151 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3202  01a2 4b01          	push	#1
3203  01a4 ae500f        	ldw	x,#20495
3204  01a7 cd0000        	call	_GPIO_WriteLow
3206  01aa 84            	pop	a
3207                     ; 152 		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3209  01ab 4b02          	push	#2
3210  01ad ae500f        	ldw	x,#20495
3211  01b0 cd0000        	call	_GPIO_WriteHigh
3213  01b3 84            	pop	a
3214                     ; 153 		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3216  01b4 4b04          	push	#4
3217  01b6 ae500f        	ldw	x,#20495
3218  01b9 cd0000        	call	_GPIO_WriteHigh
3220  01bc 84            	pop	a
3221                     ; 154 		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3223  01bd 4b08          	push	#8
3224  01bf ae500f        	ldw	x,#20495
3225  01c2 cd0000        	call	_GPIO_WriteHigh
3227  01c5 84            	pop	a
3228                     ; 155 		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
3230  01c6 4b10          	push	#16
3231  01c8 ae500f        	ldw	x,#20495
3232  01cb cd0000        	call	_GPIO_WriteHigh
3234  01ce 84            	pop	a
3235                     ; 156 		break;
3237  01cf ace403e4      	jpf	L5402
3238  01d3               L3002:
3239                     ; 159 		case 2:
3239                     ; 160 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3241  01d3 4b40          	push	#64
3242  01d5 ae500a        	ldw	x,#20490
3243  01d8 cd0000        	call	_GPIO_WriteLow
3245  01db 84            	pop	a
3246                     ; 161 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3248  01dc 4b80          	push	#128
3249  01de ae500a        	ldw	x,#20490
3250  01e1 cd0000        	call	_GPIO_WriteLow
3252  01e4 84            	pop	a
3253                     ; 162 		GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
3255  01e5 4b01          	push	#1
3256  01e7 ae500f        	ldw	x,#20495
3257  01ea cd0000        	call	_GPIO_WriteHigh
3259  01ed 84            	pop	a
3260                     ; 163 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3262  01ee 4b02          	push	#2
3263  01f0 ae500f        	ldw	x,#20495
3264  01f3 cd0000        	call	_GPIO_WriteLow
3266  01f6 84            	pop	a
3267                     ; 164 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3269  01f7 4b04          	push	#4
3270  01f9 ae500f        	ldw	x,#20495
3271  01fc cd0000        	call	_GPIO_WriteLow
3273  01ff 84            	pop	a
3274                     ; 165 		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3276  0200 4b08          	push	#8
3277  0202 ae500f        	ldw	x,#20495
3278  0205 cd0000        	call	_GPIO_WriteHigh
3280  0208 84            	pop	a
3281                     ; 166 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3283  0209 4b10          	push	#16
3284  020b ae500f        	ldw	x,#20495
3285  020e cd0000        	call	_GPIO_WriteLow
3287  0211 84            	pop	a
3288                     ; 167 		break;
3290  0212 ace403e4      	jpf	L5402
3291  0216               L5002:
3292                     ; 170 		case 3:
3292                     ; 171 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3294  0216 4b40          	push	#64
3295  0218 ae500a        	ldw	x,#20490
3296  021b cd0000        	call	_GPIO_WriteLow
3298  021e 84            	pop	a
3299                     ; 172 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3301  021f 4b80          	push	#128
3302  0221 ae500a        	ldw	x,#20490
3303  0224 cd0000        	call	_GPIO_WriteLow
3305  0227 84            	pop	a
3306                     ; 173 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3308  0228 4b01          	push	#1
3309  022a ae500f        	ldw	x,#20495
3310  022d cd0000        	call	_GPIO_WriteLow
3312  0230 84            	pop	a
3313                     ; 174 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3315  0231 4b02          	push	#2
3316  0233 ae500f        	ldw	x,#20495
3317  0236 cd0000        	call	_GPIO_WriteLow
3319  0239 84            	pop	a
3320                     ; 175 		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3322  023a 4b04          	push	#4
3323  023c ae500f        	ldw	x,#20495
3324  023f cd0000        	call	_GPIO_WriteHigh
3326  0242 84            	pop	a
3327                     ; 176 		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3329  0243 4b08          	push	#8
3330  0245 ae500f        	ldw	x,#20495
3331  0248 cd0000        	call	_GPIO_WriteHigh
3333  024b 84            	pop	a
3334                     ; 177 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3336  024c 4b10          	push	#16
3337  024e ae500f        	ldw	x,#20495
3338  0251 cd0000        	call	_GPIO_WriteLow
3340  0254 84            	pop	a
3341                     ; 178 		break;
3343  0255 ace403e4      	jpf	L5402
3344  0259               L7002:
3345                     ; 181 		case 4:
3345                     ; 182 		GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
3347  0259 4b40          	push	#64
3348  025b ae500a        	ldw	x,#20490
3349  025e cd0000        	call	_GPIO_WriteHigh
3351  0261 84            	pop	a
3352                     ; 183 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3354  0262 4b80          	push	#128
3355  0264 ae500a        	ldw	x,#20490
3356  0267 cd0000        	call	_GPIO_WriteLow
3358  026a 84            	pop	a
3359                     ; 184 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3361  026b 4b01          	push	#1
3362  026d ae500f        	ldw	x,#20495
3363  0270 cd0000        	call	_GPIO_WriteLow
3365  0273 84            	pop	a
3366                     ; 185 		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3368  0274 4b02          	push	#2
3369  0276 ae500f        	ldw	x,#20495
3370  0279 cd0000        	call	_GPIO_WriteHigh
3372  027c 84            	pop	a
3373                     ; 186 		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3375  027d 4b04          	push	#4
3376  027f ae500f        	ldw	x,#20495
3377  0282 cd0000        	call	_GPIO_WriteHigh
3379  0285 84            	pop	a
3380                     ; 187 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3382  0286 4b08          	push	#8
3383  0288 ae500f        	ldw	x,#20495
3384  028b cd0000        	call	_GPIO_WriteLow
3386  028e 84            	pop	a
3387                     ; 188 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3389  028f 4b10          	push	#16
3390  0291 ae500f        	ldw	x,#20495
3391  0294 cd0000        	call	_GPIO_WriteLow
3393  0297 84            	pop	a
3394                     ; 189 		break;
3396  0298 ace403e4      	jpf	L5402
3397  029c               L1102:
3398                     ; 192 		case 5:
3398                     ; 193 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3400  029c 4b40          	push	#64
3401  029e ae500a        	ldw	x,#20490
3402  02a1 cd0000        	call	_GPIO_WriteLow
3404  02a4 84            	pop	a
3405                     ; 194 		GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
3407  02a5 4b80          	push	#128
3408  02a7 ae500a        	ldw	x,#20490
3409  02aa cd0000        	call	_GPIO_WriteHigh
3411  02ad 84            	pop	a
3412                     ; 195 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3414  02ae 4b01          	push	#1
3415  02b0 ae500f        	ldw	x,#20495
3416  02b3 cd0000        	call	_GPIO_WriteLow
3418  02b6 84            	pop	a
3419                     ; 196 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3421  02b7 4b02          	push	#2
3422  02b9 ae500f        	ldw	x,#20495
3423  02bc cd0000        	call	_GPIO_WriteLow
3425  02bf 84            	pop	a
3426                     ; 197 		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3428  02c0 4b04          	push	#4
3429  02c2 ae500f        	ldw	x,#20495
3430  02c5 cd0000        	call	_GPIO_WriteHigh
3432  02c8 84            	pop	a
3433                     ; 198 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3435  02c9 4b08          	push	#8
3436  02cb ae500f        	ldw	x,#20495
3437  02ce cd0000        	call	_GPIO_WriteLow
3439  02d1 84            	pop	a
3440                     ; 199 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3442  02d2 4b10          	push	#16
3443  02d4 ae500f        	ldw	x,#20495
3444  02d7 cd0000        	call	_GPIO_WriteLow
3446  02da 84            	pop	a
3447                     ; 200 		break;
3449  02db ace403e4      	jpf	L5402
3450  02df               L3102:
3451                     ; 203 		case 6:
3451                     ; 204 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3453  02df 4b40          	push	#64
3454  02e1 ae500a        	ldw	x,#20490
3455  02e4 cd0000        	call	_GPIO_WriteLow
3457  02e7 84            	pop	a
3458                     ; 205 		GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
3460  02e8 4b80          	push	#128
3461  02ea ae500a        	ldw	x,#20490
3462  02ed cd0000        	call	_GPIO_WriteHigh
3464  02f0 84            	pop	a
3465                     ; 206 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3467  02f1 4b01          	push	#1
3468  02f3 ae500f        	ldw	x,#20495
3469  02f6 cd0000        	call	_GPIO_WriteLow
3471  02f9 84            	pop	a
3472                     ; 207 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3474  02fa 4b02          	push	#2
3475  02fc ae500f        	ldw	x,#20495
3476  02ff cd0000        	call	_GPIO_WriteLow
3478  0302 84            	pop	a
3479                     ; 208 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3481  0303 4b04          	push	#4
3482  0305 ae500f        	ldw	x,#20495
3483  0308 cd0000        	call	_GPIO_WriteLow
3485  030b 84            	pop	a
3486                     ; 209 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3488  030c 4b08          	push	#8
3489  030e ae500f        	ldw	x,#20495
3490  0311 cd0000        	call	_GPIO_WriteLow
3492  0314 84            	pop	a
3493                     ; 210 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3495  0315 4b10          	push	#16
3496  0317 ae500f        	ldw	x,#20495
3497  031a cd0000        	call	_GPIO_WriteLow
3499  031d 84            	pop	a
3500                     ; 211 		break;
3502  031e ace403e4      	jpf	L5402
3503  0322               L5102:
3504                     ; 214 		case 7:
3504                     ; 215 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3506  0322 4b40          	push	#64
3507  0324 ae500a        	ldw	x,#20490
3508  0327 cd0000        	call	_GPIO_WriteLow
3510  032a 84            	pop	a
3511                     ; 216 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3513  032b 4b80          	push	#128
3514  032d ae500a        	ldw	x,#20490
3515  0330 cd0000        	call	_GPIO_WriteLow
3517  0333 84            	pop	a
3518                     ; 217 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3520  0334 4b01          	push	#1
3521  0336 ae500f        	ldw	x,#20495
3522  0339 cd0000        	call	_GPIO_WriteLow
3524  033c 84            	pop	a
3525                     ; 218 		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3527  033d 4b02          	push	#2
3528  033f ae500f        	ldw	x,#20495
3529  0342 cd0000        	call	_GPIO_WriteHigh
3531  0345 84            	pop	a
3532                     ; 219 		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3534  0346 4b04          	push	#4
3535  0348 ae500f        	ldw	x,#20495
3536  034b cd0000        	call	_GPIO_WriteHigh
3538  034e 84            	pop	a
3539                     ; 220 		GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3541  034f 4b08          	push	#8
3542  0351 ae500f        	ldw	x,#20495
3543  0354 cd0000        	call	_GPIO_WriteHigh
3545  0357 84            	pop	a
3546                     ; 221 		GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
3548  0358 4b10          	push	#16
3549  035a ae500f        	ldw	x,#20495
3550  035d cd0000        	call	_GPIO_WriteHigh
3552  0360 84            	pop	a
3553                     ; 222 		break;
3555  0361 cc03e4        	jra	L5402
3556  0364               L7102:
3557                     ; 225 		case 8:
3557                     ; 226 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3559  0364 4b40          	push	#64
3560  0366 ae500a        	ldw	x,#20490
3561  0369 cd0000        	call	_GPIO_WriteLow
3563  036c 84            	pop	a
3564                     ; 227 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3566  036d 4b80          	push	#128
3567  036f ae500a        	ldw	x,#20490
3568  0372 cd0000        	call	_GPIO_WriteLow
3570  0375 84            	pop	a
3571                     ; 228 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3573  0376 4b01          	push	#1
3574  0378 ae500f        	ldw	x,#20495
3575  037b cd0000        	call	_GPIO_WriteLow
3577  037e 84            	pop	a
3578                     ; 229 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3580  037f 4b02          	push	#2
3581  0381 ae500f        	ldw	x,#20495
3582  0384 cd0000        	call	_GPIO_WriteLow
3584  0387 84            	pop	a
3585                     ; 230 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3587  0388 4b04          	push	#4
3588  038a ae500f        	ldw	x,#20495
3589  038d cd0000        	call	_GPIO_WriteLow
3591  0390 84            	pop	a
3592                     ; 231 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3594  0391 4b08          	push	#8
3595  0393 ae500f        	ldw	x,#20495
3596  0396 cd0000        	call	_GPIO_WriteLow
3598  0399 84            	pop	a
3599                     ; 232 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3601  039a 4b10          	push	#16
3602  039c ae500f        	ldw	x,#20495
3603  039f cd0000        	call	_GPIO_WriteLow
3605  03a2 84            	pop	a
3606                     ; 233 		break;
3608  03a3 203f          	jra	L5402
3609  03a5               L1202:
3610                     ; 236 		case 9:
3610                     ; 237 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3612  03a5 4b40          	push	#64
3613  03a7 ae500a        	ldw	x,#20490
3614  03aa cd0000        	call	_GPIO_WriteLow
3616  03ad 84            	pop	a
3617                     ; 238 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3619  03ae 4b80          	push	#128
3620  03b0 ae500a        	ldw	x,#20490
3621  03b3 cd0000        	call	_GPIO_WriteLow
3623  03b6 84            	pop	a
3624                     ; 239 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3626  03b7 4b01          	push	#1
3627  03b9 ae500f        	ldw	x,#20495
3628  03bc cd0000        	call	_GPIO_WriteLow
3630  03bf 84            	pop	a
3631                     ; 240 		GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3633  03c0 4b02          	push	#2
3634  03c2 ae500f        	ldw	x,#20495
3635  03c5 cd0000        	call	_GPIO_WriteHigh
3637  03c8 84            	pop	a
3638                     ; 241 		GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3640  03c9 4b04          	push	#4
3641  03cb ae500f        	ldw	x,#20495
3642  03ce cd0000        	call	_GPIO_WriteHigh
3644  03d1 84            	pop	a
3645                     ; 242 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3647  03d2 4b08          	push	#8
3648  03d4 ae500f        	ldw	x,#20495
3649  03d7 cd0000        	call	_GPIO_WriteLow
3651  03da 84            	pop	a
3652                     ; 243 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3654  03db 4b10          	push	#16
3655  03dd ae500f        	ldw	x,#20495
3656  03e0 cd0000        	call	_GPIO_WriteLow
3658  03e3 84            	pop	a
3659                     ; 244 		break;
3661  03e4               L5402:
3662                     ; 250 }
3665  03e4 81            	ret
3708                     ; 252 void Delay_ms(uint16_t ms)
3708                     ; 253 {
3709                     	switch	.text
3710  03e5               _Delay_ms:
3712  03e5 89            	pushw	x
3713  03e6 5204          	subw	sp,#4
3714       00000004      OFST:	set	4
3717                     ; 255 	for (i = 0; i < (16000UL / 100UL) * ms; i++);
3719  03e8 ae0000        	ldw	x,#0
3720  03eb 1f03          	ldw	(OFST-1,sp),x
3721  03ed ae0000        	ldw	x,#0
3722  03f0 1f01          	ldw	(OFST-3,sp),x
3725  03f2 2009          	jra	L5702
3726  03f4               L1702:
3730  03f4 96            	ldw	x,sp
3731  03f5 1c0001        	addw	x,#OFST-3
3732  03f8 a601          	ld	a,#1
3733  03fa cd0000        	call	c_lgadc
3736  03fd               L5702:
3739  03fd 1e05          	ldw	x,(OFST+1,sp)
3740  03ff a6a0          	ld	a,#160
3741  0401 cd0000        	call	c_cmulx
3743  0404 96            	ldw	x,sp
3744  0405 1c0001        	addw	x,#OFST-3
3745  0408 cd0000        	call	c_lcmp
3747  040b 22e7          	jrugt	L1702
3748                     ; 256 }
3751  040d 5b06          	addw	sp,#6
3752  040f 81            	ret
3785                     ; 259 void InitCLOCK(void)
3785                     ; 260 {
3786                     	switch	.text
3787  0410               _InitCLOCK:
3791                     ; 261     CLK_DeInit(); // Reseta a configuração de clock para o padrão
3793  0410 cd0000        	call	_CLK_DeInit
3795                     ; 263     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
3797  0413 4f            	clr	a
3798  0414 cd0000        	call	_CLK_HSECmd
3800                     ; 264     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
3802  0417 4f            	clr	a
3803  0418 cd0000        	call	_CLK_LSICmd
3805                     ; 265     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3807  041b a601          	ld	a,#1
3808  041d cd0000        	call	_CLK_HSICmd
3811  0420               L3112:
3812                     ; 268     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3814  0420 ae0102        	ldw	x,#258
3815  0423 cd0000        	call	_CLK_GetFlagStatus
3817  0426 4d            	tnz	a
3818  0427 27f7          	jreq	L3112
3819                     ; 270     CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
3821  0429 a601          	ld	a,#1
3822  042b cd0000        	call	_CLK_ClockSwitchCmd
3824                     ; 271     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
3826  042e 4f            	clr	a
3827  042f cd0000        	call	_CLK_HSIPrescalerConfig
3829                     ; 272     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)
3831  0432 a680          	ld	a,#128
3832  0434 cd0000        	call	_CLK_SYSCLKConfig
3834                     ; 275     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3836  0437 4b01          	push	#1
3837  0439 4b00          	push	#0
3838  043b ae01e1        	ldw	x,#481
3839  043e cd0000        	call	_CLK_ClockSwitchConfig
3841  0441 85            	popw	x
3842                     ; 278     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3844  0442 5f            	clrw	x
3845  0443 cd0000        	call	_CLK_PeripheralClockConfig
3847                     ; 279     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3849  0446 ae0100        	ldw	x,#256
3850  0449 cd0000        	call	_CLK_PeripheralClockConfig
3852                     ; 280     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
3854  044c ae1300        	ldw	x,#4864
3855  044f cd0000        	call	_CLK_PeripheralClockConfig
3857                     ; 281     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3859  0452 ae1200        	ldw	x,#4608
3860  0455 cd0000        	call	_CLK_PeripheralClockConfig
3862                     ; 282     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3864  0458 ae0300        	ldw	x,#768
3865  045b cd0000        	call	_CLK_PeripheralClockConfig
3867                     ; 283     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3869  045e ae0700        	ldw	x,#1792
3870  0461 cd0000        	call	_CLK_PeripheralClockConfig
3872                     ; 284     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
3874  0464 ae0500        	ldw	x,#1280
3875  0467 cd0000        	call	_CLK_PeripheralClockConfig
3877                     ; 285 }
3880  046a 81            	ret
3893                     	xdef	_main
3894                     	xdef	_Display_Off
3895                     	xdef	_ReadButton
3896                     	xdef	_contarDigitos
3897                     	xdef	_Display_7s
3898                     	xdef	_InitCLOCK
3899                     	xdef	_Delay_ms
3900                     	xdef	_InitGPIO
3901                     	xref	_GPIO_ReadInputPin
3902                     	xref	_GPIO_WriteLow
3903                     	xref	_GPIO_WriteHigh
3904                     	xref	_GPIO_Init
3905                     	xref	_CLK_GetFlagStatus
3906                     	xref	_CLK_SYSCLKConfig
3907                     	xref	_CLK_HSIPrescalerConfig
3908                     	xref	_CLK_ClockSwitchConfig
3909                     	xref	_CLK_PeripheralClockConfig
3910                     	xref	_CLK_ClockSwitchCmd
3911                     	xref	_CLK_LSICmd
3912                     	xref	_CLK_HSICmd
3913                     	xref	_CLK_HSECmd
3914                     	xref	_CLK_DeInit
3933                     	xref	c_lcmp
3934                     	xref	c_cmulx
3935                     	xref	c_lgadc
3936                     	end
