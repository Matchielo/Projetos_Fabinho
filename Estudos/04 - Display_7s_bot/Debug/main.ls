   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2652                     ; 47 void main()
2652                     ; 48 {
2654                     	switch	.text
2655  0000               _main:
2657  0000 5203          	subw	sp,#3
2658       00000003      OFST:	set	3
2661                     ; 49 	uint8_t last_button_state = 1; 			// Guarda o último estado lido do botão (1 = solto)
2663  0002 a601          	ld	a,#1
2664  0004 6b01          	ld	(OFST-2,sp),a
2666                     ; 51 	uint8_t button_action_pending = 0;	// variável de controle para debounce
2668  0006 0f02          	clr	(OFST-1,sp)
2670                     ; 53 	InitCLOCK();    // Inicializa o clock do sistema
2672  0008 cd03a9        	call	_InitCLOCK
2674                     ; 54  	InitTIM4();     // AGORA CHAMA INITTIM4
2676  000b cd0392        	call	_InitTIM4
2678                     ; 55  	InitGPIO();     // Inicializa os pinos GPIO para o display e botão
2680  000e cd00ba        	call	_InitGPIO
2682                     ; 56 	Display_Off();  // Garante que o display comece apagado
2684  0011 ad67          	call	_Display_Off
2686  0013               L7071:
2687                     ; 60 		current_button = ReadButton(); 		// Lê o estado atual do botão
2689  0013 ad30          	call	_ReadButton
2691  0015 6b03          	ld	(OFST+0,sp),a
2693                     ; 63 		if (last_button_state == 1 && current_button == 0) // Se o botão acabou de ser pressionado
2695  0017 7b01          	ld	a,(OFST-2,sp)
2696  0019 a101          	cp	a,#1
2697  001b 2610          	jrne	L3171
2699  001d 0d03          	tnz	(OFST+0,sp)
2700  001f 260c          	jrne	L3171
2701                     ; 65 			if (button_action_pending == 0) // Garante que a ação ocorre uma vez por pressionamento
2703  0021 0d02          	tnz	(OFST-1,sp)
2704  0023 2614          	jrne	L7171
2705                     ; 67 				contarDigitos();            // Chama a função de contagem
2707  0025 ad31          	call	_contarDigitos
2709                     ; 68 				button_action_pending = 1;  // Sinaliza que a ação está pendente
2711  0027 a601          	ld	a,#1
2712  0029 6b02          	ld	(OFST-1,sp),a
2714  002b 200c          	jra	L7171
2715  002d               L3171:
2716                     ; 73 		else if (last_button_state == 0 && current_button == 1) // Se o botão acabou de ser solto
2718  002d 0d01          	tnz	(OFST-2,sp)
2719  002f 2608          	jrne	L7171
2721  0031 7b03          	ld	a,(OFST+0,sp)
2722  0033 a101          	cp	a,#1
2723  0035 2602          	jrne	L7171
2724                     ; 75 			button_action_pending = 0; // Permite uma nova ação no próximo pressionamento
2726  0037 0f02          	clr	(OFST-1,sp)
2728  0039               L7171:
2729                     ; 79 		last_button_state = current_button;
2731  0039 7b03          	ld	a,(OFST+0,sp)
2732  003b 6b01          	ld	(OFST-2,sp),a
2734                     ; 80 		Delay_ms_Timer(20); // Pequeno atraso para ajudar no debounce
2736  003d ae0014        	ldw	x,#20
2737  0040 cd036d        	call	_Delay_ms_Timer
2740  0043 20ce          	jra	L7071
2764                     ; 92 uint8_t ReadButton(void)
2764                     ; 93 {
2765                     	switch	.text
2766  0045               _ReadButton:
2770                     ; 98 	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
2772  0045 4b10          	push	#16
2773  0047 ae500a        	ldw	x,#20490
2774  004a cd0000        	call	_GPIO_ReadInputPin
2776  004d 5b01          	addw	sp,#1
2777  004f 4d            	tnz	a
2778  0050 2604          	jrne	L01
2779  0052 a601          	ld	a,#1
2780  0054 2001          	jra	L21
2781  0056               L01:
2782  0056 4f            	clr	a
2783  0057               L21:
2786  0057 81            	ret
2823                     ; 102 void contarDigitos(void)
2823                     ; 103 {
2824                     	switch	.text
2825  0058               _contarDigitos:
2827  0058 89            	pushw	x
2828       00000002      OFST:	set	2
2831                     ; 106  	for (i = 0; i < 10; i++)
2833  0059 5f            	clrw	x
2834  005a 1f01          	ldw	(OFST-1,sp),x
2836  005c               L1571:
2837                     ; 108  	 	Display_7s(i);        // Exibe o dígito atual
2839  005c 1e01          	ldw	x,(OFST-1,sp)
2840  005e cd0113        	call	_Display_7s
2842                     ; 109  	 	Delay_ms_Timer(1000); // Espera 1 segundo
2844  0061 ae03e8        	ldw	x,#1000
2845  0064 cd036d        	call	_Delay_ms_Timer
2847                     ; 106  	for (i = 0; i < 10; i++)
2849  0067 1e01          	ldw	x,(OFST-1,sp)
2850  0069 1c0001        	addw	x,#1
2851  006c 1f01          	ldw	(OFST-1,sp),x
2855  006e 9c            	rvf
2856  006f 1e01          	ldw	x,(OFST-1,sp)
2857  0071 a3000a        	cpw	x,#10
2858  0074 2fe6          	jrslt	L1571
2859                     ; 112 	Display_Off(); // Apaga o display após terminar a contagem
2861  0076 ad02          	call	_Display_Off
2863                     ; 113 }
2866  0078 85            	popw	x
2867  0079 81            	ret
2891                     ; 116 void Display_Off(void)
2891                     ; 117 {
2892                     	switch	.text
2893  007a               _Display_Off:
2897                     ; 119     GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
2899  007a 4b40          	push	#64
2900  007c ae500a        	ldw	x,#20490
2901  007f cd0000        	call	_GPIO_WriteHigh
2903  0082 84            	pop	a
2904                     ; 120     GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
2906  0083 4b80          	push	#128
2907  0085 ae500a        	ldw	x,#20490
2908  0088 cd0000        	call	_GPIO_WriteHigh
2910  008b 84            	pop	a
2911                     ; 121     GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
2913  008c 4b01          	push	#1
2914  008e ae500f        	ldw	x,#20495
2915  0091 cd0000        	call	_GPIO_WriteHigh
2917  0094 84            	pop	a
2918                     ; 122     GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
2920  0095 4b02          	push	#2
2921  0097 ae500f        	ldw	x,#20495
2922  009a cd0000        	call	_GPIO_WriteHigh
2924  009d 84            	pop	a
2925                     ; 123     GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
2927  009e 4b04          	push	#4
2928  00a0 ae500f        	ldw	x,#20495
2929  00a3 cd0000        	call	_GPIO_WriteHigh
2931  00a6 84            	pop	a
2932                     ; 124     GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
2934  00a7 4b08          	push	#8
2935  00a9 ae500f        	ldw	x,#20495
2936  00ac cd0000        	call	_GPIO_WriteHigh
2938  00af 84            	pop	a
2939                     ; 125     GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
2941  00b0 4b10          	push	#16
2942  00b2 ae500f        	ldw	x,#20495
2943  00b5 cd0000        	call	_GPIO_WriteHigh
2945  00b8 84            	pop	a
2946                     ; 126 }
2949  00b9 81            	ret
2973                     ; 129 void InitGPIO(void)
2973                     ; 130 {
2974                     	switch	.text
2975  00ba               _InitGPIO:
2979                     ; 132 	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2981  00ba 4be0          	push	#224
2982  00bc 4b40          	push	#64
2983  00be ae500a        	ldw	x,#20490
2984  00c1 cd0000        	call	_GPIO_Init
2986  00c4 85            	popw	x
2987                     ; 133 	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2989  00c5 4be0          	push	#224
2990  00c7 4b80          	push	#128
2991  00c9 ae500a        	ldw	x,#20490
2992  00cc cd0000        	call	_GPIO_Init
2994  00cf 85            	popw	x
2995                     ; 134 	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2997  00d0 4be0          	push	#224
2998  00d2 4b01          	push	#1
2999  00d4 ae500f        	ldw	x,#20495
3000  00d7 cd0000        	call	_GPIO_Init
3002  00da 85            	popw	x
3003                     ; 135 	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3005  00db 4be0          	push	#224
3006  00dd 4b02          	push	#2
3007  00df ae500f        	ldw	x,#20495
3008  00e2 cd0000        	call	_GPIO_Init
3010  00e5 85            	popw	x
3011                     ; 136 	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3013  00e6 4be0          	push	#224
3014  00e8 4b04          	push	#4
3015  00ea ae500f        	ldw	x,#20495
3016  00ed cd0000        	call	_GPIO_Init
3018  00f0 85            	popw	x
3019                     ; 137 	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3021  00f1 4be0          	push	#224
3022  00f3 4b08          	push	#8
3023  00f5 ae500f        	ldw	x,#20495
3024  00f8 cd0000        	call	_GPIO_Init
3026  00fb 85            	popw	x
3027                     ; 138 	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3029  00fc 4be0          	push	#224
3030  00fe 4b10          	push	#16
3031  0100 ae500f        	ldw	x,#20495
3032  0103 cd0000        	call	_GPIO_Init
3034  0106 85            	popw	x
3035                     ; 141 	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
3037  0107 4b40          	push	#64
3038  0109 4b10          	push	#16
3039  010b ae500a        	ldw	x,#20490
3040  010e cd0000        	call	_GPIO_Init
3042  0111 85            	popw	x
3043                     ; 142 }
3046  0112 81            	ret
3083                     ; 145 void Display_7s(int SEG)
3083                     ; 146 {
3084                     	switch	.text
3085  0113               _Display_7s:
3087  0113 89            	pushw	x
3088       00000000      OFST:	set	0
3091                     ; 149 	GPIO_WriteHigh(SEG_A_PORT, SEG_A_PIN);
3093  0114 4b40          	push	#64
3094  0116 ae500a        	ldw	x,#20490
3095  0119 cd0000        	call	_GPIO_WriteHigh
3097  011c 84            	pop	a
3098                     ; 150 	GPIO_WriteHigh(SEG_B_PORT, SEG_B_PIN);
3100  011d 4b80          	push	#128
3101  011f ae500a        	ldw	x,#20490
3102  0122 cd0000        	call	_GPIO_WriteHigh
3104  0125 84            	pop	a
3105                     ; 151 	GPIO_WriteHigh(SEG_C_PORT, SEG_C_PIN);
3107  0126 4b01          	push	#1
3108  0128 ae500f        	ldw	x,#20495
3109  012b cd0000        	call	_GPIO_WriteHigh
3111  012e 84            	pop	a
3112                     ; 152 	GPIO_WriteHigh(SEG_D_PORT, SEG_D_PIN);
3114  012f 4b02          	push	#2
3115  0131 ae500f        	ldw	x,#20495
3116  0134 cd0000        	call	_GPIO_WriteHigh
3118  0137 84            	pop	a
3119                     ; 153 	GPIO_WriteHigh(SEG_E_PORT, SEG_E_PIN);
3121  0138 4b04          	push	#4
3122  013a ae500f        	ldw	x,#20495
3123  013d cd0000        	call	_GPIO_WriteHigh
3125  0140 84            	pop	a
3126                     ; 154 	GPIO_WriteHigh(SEG_F_PORT, SEG_F_PIN);
3128  0141 4b08          	push	#8
3129  0143 ae500f        	ldw	x,#20495
3130  0146 cd0000        	call	_GPIO_WriteHigh
3132  0149 84            	pop	a
3133                     ; 155 	GPIO_WriteHigh(SEG_G_PORT, SEG_G_PIN);
3135  014a 4b10          	push	#16
3136  014c ae500f        	ldw	x,#20495
3137  014f cd0000        	call	_GPIO_WriteHigh
3139  0152 84            	pop	a
3140                     ; 157 	switch (SEG) {
3142  0153 1e01          	ldw	x,(OFST+1,sp)
3144                     ; 239 		break;
3145  0155 5d            	tnzw	x
3146  0156 273a          	jreq	L7771
3147  0158 5a            	decw	x
3148  0159 2771          	jreq	L1002
3149  015b 5a            	decw	x
3150  015c 2603cc01e2    	jreq	L3002
3151  0161 5a            	decw	x
3152  0162 2603          	jrne	L42
3153  0164 cc0213        	jp	L5002
3154  0167               L42:
3155  0167 5a            	decw	x
3156  0168 2603          	jrne	L62
3157  016a cc0244        	jp	L7002
3158  016d               L62:
3159  016d 5a            	decw	x
3160  016e 2603          	jrne	L03
3161  0170 cc026c        	jp	L1102
3162  0173               L03:
3163  0173 5a            	decw	x
3164  0174 2603          	jrne	L23
3165  0176 cc029d        	jp	L3102
3166  0179               L23:
3167  0179 5a            	decw	x
3168  017a 2603          	jrne	L43
3169  017c cc02d7        	jp	L5102
3170  017f               L43:
3171  017f 5a            	decw	x
3172  0180 2603          	jrne	L63
3173  0182 cc02f4        	jp	L7102
3174  0185               L63:
3175  0185 5a            	decw	x
3176  0186 2603          	jrne	L04
3177  0188 cc0335        	jp	L1202
3178  018b               L04:
3179  018b               L3202:
3180                     ; 237 		default: // Em caso de número inválido, apaga o display
3180                     ; 238  	 	Display_Off(); 
3182  018b cd007a        	call	_Display_Off
3184                     ; 239 		break;
3186  018e ac6b036b      	jpf	L5402
3187  0192               L7771:
3188                     ; 158 		case 0: // Digito 0 (todos menos G)
3188                     ; 159 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3190  0192 4b40          	push	#64
3191  0194 ae500a        	ldw	x,#20490
3192  0197 cd0000        	call	_GPIO_WriteLow
3194  019a 84            	pop	a
3195                     ; 160 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3197  019b 4b80          	push	#128
3198  019d ae500a        	ldw	x,#20490
3199  01a0 cd0000        	call	_GPIO_WriteLow
3201  01a3 84            	pop	a
3202                     ; 161 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3204  01a4 4b01          	push	#1
3205  01a6 ae500f        	ldw	x,#20495
3206  01a9 cd0000        	call	_GPIO_WriteLow
3208  01ac 84            	pop	a
3209                     ; 162 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3211  01ad 4b02          	push	#2
3212  01af ae500f        	ldw	x,#20495
3213  01b2 cd0000        	call	_GPIO_WriteLow
3215  01b5 84            	pop	a
3216                     ; 163 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3218  01b6 4b04          	push	#4
3219  01b8 ae500f        	ldw	x,#20495
3220  01bb cd0000        	call	_GPIO_WriteLow
3222  01be 84            	pop	a
3223                     ; 164 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3225  01bf 4b08          	push	#8
3226  01c1 ae500f        	ldw	x,#20495
3227  01c4 cd0000        	call	_GPIO_WriteLow
3229  01c7 84            	pop	a
3230                     ; 165 		break;		
3232  01c8 ac6b036b      	jpf	L5402
3233  01cc               L1002:
3234                     ; 167 		case 1: // Digito 1 (B e C)
3234                     ; 168 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3236  01cc 4b80          	push	#128
3237  01ce ae500a        	ldw	x,#20490
3238  01d1 cd0000        	call	_GPIO_WriteLow
3240  01d4 84            	pop	a
3241                     ; 169 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3243  01d5 4b01          	push	#1
3244  01d7 ae500f        	ldw	x,#20495
3245  01da cd0000        	call	_GPIO_WriteLow
3247  01dd 84            	pop	a
3248                     ; 170 		break;
3250  01de ac6b036b      	jpf	L5402
3251  01e2               L3002:
3252                     ; 172 		case 2: // Digito 2 (A, B, G, E, D)
3252                     ; 173 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3254  01e2 4b40          	push	#64
3255  01e4 ae500a        	ldw	x,#20490
3256  01e7 cd0000        	call	_GPIO_WriteLow
3258  01ea 84            	pop	a
3259                     ; 174 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3261  01eb 4b80          	push	#128
3262  01ed ae500a        	ldw	x,#20490
3263  01f0 cd0000        	call	_GPIO_WriteLow
3265  01f3 84            	pop	a
3266                     ; 175 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3268  01f4 4b10          	push	#16
3269  01f6 ae500f        	ldw	x,#20495
3270  01f9 cd0000        	call	_GPIO_WriteLow
3272  01fc 84            	pop	a
3273                     ; 176 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3275  01fd 4b04          	push	#4
3276  01ff ae500f        	ldw	x,#20495
3277  0202 cd0000        	call	_GPIO_WriteLow
3279  0205 84            	pop	a
3280                     ; 177 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3282  0206 4b02          	push	#2
3283  0208 ae500f        	ldw	x,#20495
3284  020b cd0000        	call	_GPIO_WriteLow
3286  020e 84            	pop	a
3287                     ; 178 		break;
3289  020f ac6b036b      	jpf	L5402
3290  0213               L5002:
3291                     ; 180 		case 3: // Digito 3 (A, B, G, C, D)
3291                     ; 181 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3293  0213 4b40          	push	#64
3294  0215 ae500a        	ldw	x,#20490
3295  0218 cd0000        	call	_GPIO_WriteLow
3297  021b 84            	pop	a
3298                     ; 182 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3300  021c 4b80          	push	#128
3301  021e ae500a        	ldw	x,#20490
3302  0221 cd0000        	call	_GPIO_WriteLow
3304  0224 84            	pop	a
3305                     ; 183 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3307  0225 4b10          	push	#16
3308  0227 ae500f        	ldw	x,#20495
3309  022a cd0000        	call	_GPIO_WriteLow
3311  022d 84            	pop	a
3312                     ; 184 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3314  022e 4b01          	push	#1
3315  0230 ae500f        	ldw	x,#20495
3316  0233 cd0000        	call	_GPIO_WriteLow
3318  0236 84            	pop	a
3319                     ; 185 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3321  0237 4b02          	push	#2
3322  0239 ae500f        	ldw	x,#20495
3323  023c cd0000        	call	_GPIO_WriteLow
3325  023f 84            	pop	a
3326                     ; 186 		break;
3328  0240 ac6b036b      	jpf	L5402
3329  0244               L7002:
3330                     ; 188 		case 4: // Digito 4 (F, G, B, C)
3330                     ; 189 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3332  0244 4b08          	push	#8
3333  0246 ae500f        	ldw	x,#20495
3334  0249 cd0000        	call	_GPIO_WriteLow
3336  024c 84            	pop	a
3337                     ; 190 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3339  024d 4b10          	push	#16
3340  024f ae500f        	ldw	x,#20495
3341  0252 cd0000        	call	_GPIO_WriteLow
3343  0255 84            	pop	a
3344                     ; 191 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3346  0256 4b80          	push	#128
3347  0258 ae500a        	ldw	x,#20490
3348  025b cd0000        	call	_GPIO_WriteLow
3350  025e 84            	pop	a
3351                     ; 192 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3353  025f 4b01          	push	#1
3354  0261 ae500f        	ldw	x,#20495
3355  0264 cd0000        	call	_GPIO_WriteLow
3357  0267 84            	pop	a
3358                     ; 193 		break;
3360  0268 ac6b036b      	jpf	L5402
3361  026c               L1102:
3362                     ; 195 		case 5: // Digito 5 (A, F, G, C, D)
3362                     ; 196 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3364  026c 4b40          	push	#64
3365  026e ae500a        	ldw	x,#20490
3366  0271 cd0000        	call	_GPIO_WriteLow
3368  0274 84            	pop	a
3369                     ; 197 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3371  0275 4b08          	push	#8
3372  0277 ae500f        	ldw	x,#20495
3373  027a cd0000        	call	_GPIO_WriteLow
3375  027d 84            	pop	a
3376                     ; 198 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3378  027e 4b10          	push	#16
3379  0280 ae500f        	ldw	x,#20495
3380  0283 cd0000        	call	_GPIO_WriteLow
3382  0286 84            	pop	a
3383                     ; 199 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3385  0287 4b01          	push	#1
3386  0289 ae500f        	ldw	x,#20495
3387  028c cd0000        	call	_GPIO_WriteLow
3389  028f 84            	pop	a
3390                     ; 200 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3392  0290 4b02          	push	#2
3393  0292 ae500f        	ldw	x,#20495
3394  0295 cd0000        	call	_GPIO_WriteLow
3396  0298 84            	pop	a
3397                     ; 201 		break;
3399  0299 ac6b036b      	jpf	L5402
3400  029d               L3102:
3401                     ; 203 		case 6: // Digito 6 (A, F, G, E, C, D)
3401                     ; 204 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3403  029d 4b40          	push	#64
3404  029f ae500a        	ldw	x,#20490
3405  02a2 cd0000        	call	_GPIO_WriteLow
3407  02a5 84            	pop	a
3408                     ; 205 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3410  02a6 4b08          	push	#8
3411  02a8 ae500f        	ldw	x,#20495
3412  02ab cd0000        	call	_GPIO_WriteLow
3414  02ae 84            	pop	a
3415                     ; 206 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3417  02af 4b10          	push	#16
3418  02b1 ae500f        	ldw	x,#20495
3419  02b4 cd0000        	call	_GPIO_WriteLow
3421  02b7 84            	pop	a
3422                     ; 207 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3424  02b8 4b04          	push	#4
3425  02ba ae500f        	ldw	x,#20495
3426  02bd cd0000        	call	_GPIO_WriteLow
3428  02c0 84            	pop	a
3429                     ; 208 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3431  02c1 4b01          	push	#1
3432  02c3 ae500f        	ldw	x,#20495
3433  02c6 cd0000        	call	_GPIO_WriteLow
3435  02c9 84            	pop	a
3436                     ; 209 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3438  02ca 4b02          	push	#2
3439  02cc ae500f        	ldw	x,#20495
3440  02cf cd0000        	call	_GPIO_WriteLow
3442  02d2 84            	pop	a
3443                     ; 210 		break;
3445  02d3 ac6b036b      	jpf	L5402
3446  02d7               L5102:
3447                     ; 212 		case 7: // Digito 7 (A, B, C)
3447                     ; 213 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3449  02d7 4b40          	push	#64
3450  02d9 ae500a        	ldw	x,#20490
3451  02dc cd0000        	call	_GPIO_WriteLow
3453  02df 84            	pop	a
3454                     ; 214 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3456  02e0 4b80          	push	#128
3457  02e2 ae500a        	ldw	x,#20490
3458  02e5 cd0000        	call	_GPIO_WriteLow
3460  02e8 84            	pop	a
3461                     ; 215 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3463  02e9 4b01          	push	#1
3464  02eb ae500f        	ldw	x,#20495
3465  02ee cd0000        	call	_GPIO_WriteLow
3467  02f1 84            	pop	a
3468                     ; 216 		break;
3470  02f2 2077          	jra	L5402
3471  02f4               L7102:
3472                     ; 218 		case 8: // Digito 8 (Todos os segmentos)
3472                     ; 219 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3474  02f4 4b40          	push	#64
3475  02f6 ae500a        	ldw	x,#20490
3476  02f9 cd0000        	call	_GPIO_WriteLow
3478  02fc 84            	pop	a
3479                     ; 220 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3481  02fd 4b80          	push	#128
3482  02ff ae500a        	ldw	x,#20490
3483  0302 cd0000        	call	_GPIO_WriteLow
3485  0305 84            	pop	a
3486                     ; 221 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3488  0306 4b01          	push	#1
3489  0308 ae500f        	ldw	x,#20495
3490  030b cd0000        	call	_GPIO_WriteLow
3492  030e 84            	pop	a
3493                     ; 222 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3495  030f 4b02          	push	#2
3496  0311 ae500f        	ldw	x,#20495
3497  0314 cd0000        	call	_GPIO_WriteLow
3499  0317 84            	pop	a
3500                     ; 223 		GPIO_WriteLow(SEG_E_PORT, SEG_E_PIN);
3502  0318 4b04          	push	#4
3503  031a ae500f        	ldw	x,#20495
3504  031d cd0000        	call	_GPIO_WriteLow
3506  0320 84            	pop	a
3507                     ; 224 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3509  0321 4b08          	push	#8
3510  0323 ae500f        	ldw	x,#20495
3511  0326 cd0000        	call	_GPIO_WriteLow
3513  0329 84            	pop	a
3514                     ; 225 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3516  032a 4b10          	push	#16
3517  032c ae500f        	ldw	x,#20495
3518  032f cd0000        	call	_GPIO_WriteLow
3520  0332 84            	pop	a
3521                     ; 226 		break;
3523  0333 2036          	jra	L5402
3524  0335               L1202:
3525                     ; 228 		case 9: // Digito 9 (A, B, G, F, C, D)
3525                     ; 229 		GPIO_WriteLow(SEG_A_PORT, SEG_A_PIN);
3527  0335 4b40          	push	#64
3528  0337 ae500a        	ldw	x,#20490
3529  033a cd0000        	call	_GPIO_WriteLow
3531  033d 84            	pop	a
3532                     ; 230 		GPIO_WriteLow(SEG_B_PORT, SEG_B_PIN);
3534  033e 4b80          	push	#128
3535  0340 ae500a        	ldw	x,#20490
3536  0343 cd0000        	call	_GPIO_WriteLow
3538  0346 84            	pop	a
3539                     ; 231 		GPIO_WriteLow(SEG_G_PORT, SEG_G_PIN);
3541  0347 4b10          	push	#16
3542  0349 ae500f        	ldw	x,#20495
3543  034c cd0000        	call	_GPIO_WriteLow
3545  034f 84            	pop	a
3546                     ; 232 		GPIO_WriteLow(SEG_F_PORT, SEG_F_PIN);
3548  0350 4b08          	push	#8
3549  0352 ae500f        	ldw	x,#20495
3550  0355 cd0000        	call	_GPIO_WriteLow
3552  0358 84            	pop	a
3553                     ; 233 		GPIO_WriteLow(SEG_C_PORT, SEG_C_PIN);
3555  0359 4b01          	push	#1
3556  035b ae500f        	ldw	x,#20495
3557  035e cd0000        	call	_GPIO_WriteLow
3559  0361 84            	pop	a
3560                     ; 234 		GPIO_WriteLow(SEG_D_PORT, SEG_D_PIN);
3562  0362 4b02          	push	#2
3563  0364 ae500f        	ldw	x,#20495
3564  0367 cd0000        	call	_GPIO_WriteLow
3566  036a 84            	pop	a
3567                     ; 235 		break;
3569  036b               L5402:
3570                     ; 241 }
3573  036b 85            	popw	x
3574  036c 81            	ret
3611                     ; 244 void Delay_ms_Timer(uint16_t ms)
3611                     ; 245 {
3612                     	switch	.text
3613  036d               _Delay_ms_Timer:
3615  036d 89            	pushw	x
3616       00000000      OFST:	set	0
3619  036e 2011          	jra	L7602
3620  0370               L5602:
3621                     ; 248 		TIM4_SetCounter(0); 										// Reinicia o contador do timer
3623  0370 4f            	clr	a
3624  0371 cd0000        	call	_TIM4_SetCounter
3626                     ; 249 		TIM4_ClearFlag(TIM4_FLAG_UPDATE); 			// Limpa a flag de estouro (update event)
3628  0374 a601          	ld	a,#1
3629  0376 cd0000        	call	_TIM4_ClearFlag
3632  0379               L5702:
3633                     ; 253 		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
3635  0379 a601          	ld	a,#1
3636  037b cd0000        	call	_TIM4_GetFlagStatus
3638  037e 4d            	tnz	a
3639  037f 27f8          	jreq	L5702
3640  0381               L7602:
3641                     ; 246 	while(ms--) // Loop para o número de milissegundos
3643  0381 1e01          	ldw	x,(OFST+1,sp)
3644  0383 1d0001        	subw	x,#1
3645  0386 1f01          	ldw	(OFST+1,sp),x
3646  0388 1c0001        	addw	x,#1
3647  038b a30000        	cpw	x,#0
3648  038e 26e0          	jrne	L5602
3649                     ; 255 }
3652  0390 85            	popw	x
3653  0391 81            	ret
3680                     ; 258 void InitTIM4(void)
3680                     ; 259 {
3681                     	switch	.text
3682  0392               _InitTIM4:
3686                     ; 263 	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
3688  0392 ae0701        	ldw	x,#1793
3689  0395 cd0000        	call	_TIM4_PrescalerConfig
3691                     ; 268 	TIM4_SetAutoreload(125); // O timer contará de 0 a 124, estourando em 125 (125 ticks)
3693  0398 a67d          	ld	a,#125
3694  039a cd0000        	call	_TIM4_SetAutoreload
3696                     ; 271 	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
3698  039d ae0100        	ldw	x,#256
3699  03a0 cd0000        	call	_TIM4_ITConfig
3701                     ; 274 	TIM4_Cmd(ENABLE);
3703  03a3 a601          	ld	a,#1
3704  03a5 cd0000        	call	_TIM4_Cmd
3706                     ; 275 }
3709  03a8 81            	ret
3742                     ; 278 void InitCLOCK(void)
3742                     ; 279 {
3743                     	switch	.text
3744  03a9               _InitCLOCK:
3748                     ; 280  	CLK_DeInit(); // Reseta a configuração de clock para o padrão
3750  03a9 cd0000        	call	_CLK_DeInit
3752                     ; 282  	CLK_HSECmd(DISABLE); 	// Desativa o oscilador externo (High-Speed External)
3754  03ac 4f            	clr	a
3755  03ad cd0000        	call	_CLK_HSECmd
3757                     ; 283  	CLK_LSICmd(DISABLE); 	// Desativa o clock lento interno (Low-Speed Internal)
3759  03b0 4f            	clr	a
3760  03b1 cd0000        	call	_CLK_LSICmd
3762                     ; 284  	CLK_HSICmd(ENABLE); 	// Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3764  03b4 a601          	ld	a,#1
3765  03b6 cd0000        	call	_CLK_HSICmd
3768  03b9               L3212:
3769                     ; 287  	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3771  03b9 ae0102        	ldw	x,#258
3772  03bc cd0000        	call	_CLK_GetFlagStatus
3774  03bf 4d            	tnz	a
3775  03c0 27f7          	jreq	L3212
3776                     ; 289  	CLK_ClockSwitchCmd(ENABLE); 	 	 	 	 	 	 // Habilita a troca de clock automática
3778  03c2 a601          	ld	a,#1
3779  03c4 cd0000        	call	_CLK_ClockSwitchCmd
3781                     ; 290  	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); 	// Prescaler HSI = 1 (clock total de 16MHz)
3783  03c7 4f            	clr	a
3784  03c8 cd0000        	call	_CLK_HSIPrescalerConfig
3786                     ; 291  	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 	 	 // Prescaler CPU = 1 (CPU também roda a 16MHz)
3788  03cb a680          	ld	a,#128
3789  03cd cd0000        	call	_CLK_SYSCLKConfig
3791                     ; 294  	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3793  03d0 4b01          	push	#1
3794  03d2 4b00          	push	#0
3795  03d4 ae01e1        	ldw	x,#481
3796  03d7 cd0000        	call	_CLK_ClockSwitchConfig
3798  03da 85            	popw	x
3799                     ; 297  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3801  03db 5f            	clrw	x
3802  03dc cd0000        	call	_CLK_PeripheralClockConfig
3804                     ; 298  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3806  03df ae0100        	ldw	x,#256
3807  03e2 cd0000        	call	_CLK_PeripheralClockConfig
3809                     ; 299  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se for usar ADC, habilite.
3811  03e5 ae1300        	ldw	x,#4864
3812  03e8 cd0000        	call	_CLK_PeripheralClockConfig
3814                     ; 300  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3816  03eb ae1200        	ldw	x,#4608
3817  03ee cd0000        	call	_CLK_PeripheralClockConfig
3819                     ; 301  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3821  03f1 ae0300        	ldw	x,#768
3822  03f4 cd0000        	call	_CLK_PeripheralClockConfig
3824                     ; 302  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3826  03f7 ae0700        	ldw	x,#1792
3827  03fa cd0000        	call	_CLK_PeripheralClockConfig
3829                     ; 304  	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);  // HABILITADO O CLOCK PARA O TIMER 4
3831  03fd ae0401        	ldw	x,#1025
3832  0400 cd0000        	call	_CLK_PeripheralClockConfig
3834                     ; 305 }
3837  0403 81            	ret
3850                     	xdef	_main
3851                     	xdef	_Display_Off
3852                     	xdef	_ReadButton
3853                     	xdef	_contarDigitos
3854                     	xdef	_Display_7s
3855                     	xdef	_InitTIM4
3856                     	xdef	_Delay_ms_Timer
3857                     	xdef	_InitCLOCK
3858                     	xdef	_InitGPIO
3859                     	xref	_TIM4_ClearFlag
3860                     	xref	_TIM4_GetFlagStatus
3861                     	xref	_TIM4_SetAutoreload
3862                     	xref	_TIM4_SetCounter
3863                     	xref	_TIM4_PrescalerConfig
3864                     	xref	_TIM4_ITConfig
3865                     	xref	_TIM4_Cmd
3866                     	xref	_GPIO_ReadInputPin
3867                     	xref	_GPIO_WriteLow
3868                     	xref	_GPIO_WriteHigh
3869                     	xref	_GPIO_Init
3870                     	xref	_CLK_GetFlagStatus
3871                     	xref	_CLK_SYSCLKConfig
3872                     	xref	_CLK_HSIPrescalerConfig
3873                     	xref	_CLK_ClockSwitchConfig
3874                     	xref	_CLK_PeripheralClockConfig
3875                     	xref	_CLK_ClockSwitchCmd
3876                     	xref	_CLK_LSICmd
3877                     	xref	_CLK_HSICmd
3878                     	xref	_CLK_HSECmd
3879                     	xref	_CLK_DeInit
3898                     	end
