   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     	bsct
2589  0000               _tempo_restante:
2590  0000 00            	dc.b	0
2591  0001               _contador_ms:
2592  0001 0000          	dc.w	0
2593  0003               _flag_run:
2594  0003 00            	dc.b	0
2595  0004               _flag_start:
2596  0004 00            	dc.b	0
2597  0005               _fim_contagem_estado:
2598  0005 00            	dc.b	0
2599  0006               _contador_ms_sequencia:
2600  0006 0000          	dc.w	0
2643                     ; 88 main()
2643                     ; 89 {
2645                     	switch	.text
2646  0000               _main:
2650                     ; 90 	InitCLOCK();		// Configura o oscilador interno (HSI) para 16MHz e distribui clocks.
2652  0000 cd025b        	call	_InitCLOCK
2654                     ; 91 	InitGPIO();			// Configura os pinos para displays, botões e buzzer.
2656  0003 cd01ec        	call	_InitGPIO
2658                     ; 95 	ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
2660  0006 ae1701        	ldw	x,#5889
2661  0009 cd0000        	call	_ITC_SetSoftwarePriority
2663                     ; 97 	TIM4_Config();				// Configura o Timer 4 para gerar uma interrupção a cada 1 milissegundo.
2665  000c cd02b6        	call	_TIM4_Config
2667                     ; 100 	enableInterrupts();		// Sem isso, mesmo que o Timer 4 gere interrupções, a CPU as ignora.
2670  000f 9a            rim
2672                     ; 102 	ApagarDisplay();		// Garante que os displays comecem desligados ao ligar o aparelho.
2675  0010 cd0353        	call	_ApagarDisplay
2677  0013               L1761:
2678                     ; 112 		if(GPIO_ReadInputPin(BOTAO_14S_PORT, BOTAO_14S_PIN) == RESET)
2680  0013 4b04          	push	#4
2681  0015 ae500f        	ldw	x,#20495
2682  0018 cd0000        	call	_GPIO_ReadInputPin
2684  001b 5b01          	addw	sp,#1
2685  001d 4d            	tnz	a
2686  001e 2623          	jrne	L5761
2687                     ; 114 			tempo_restante = 14;						// Define o tempo inicial da contagem.
2689  0020 350e0000      	mov	_tempo_restante,#14
2690                     ; 115 			contador_ms = 0;								// Zera o contador de mls para um novo segundo inicial.
2692  0024 5f            	clrw	x
2693  0025 bf01          	ldw	_contador_ms,x
2694                     ; 116 			fim_contagem_estado = 0;        // Cancela qualquer animação final que esteja ocorrendo
2696  0027 3f05          	clr	_fim_contagem_estado
2697                     ; 117 			flag_start = 1;                 // Habilita o botão de pause
2699  0029 35010004      	mov	_flag_start,#1
2700                     ; 118 			flag_run = 1;                   // Inicia a contagem na ISR
2702  002d 35010003      	mov	_flag_run,#1
2703                     ; 120 			AtualizarDisplay(tempo_restante);
2705  0031 b600          	ld	a,_tempo_restante
2706  0033 cd0388        	call	_AtualizarDisplay
2709  0036               L1071:
2710                     ; 125 			while(GPIO_ReadInputPin(BOTAO_14S_PORT, BOTAO_14S_PIN) == RESET);
2712  0036 4b04          	push	#4
2713  0038 ae500f        	ldw	x,#20495
2714  003b cd0000        	call	_GPIO_ReadInputPin
2716  003e 5b01          	addw	sp,#1
2717  0040 4d            	tnz	a
2718  0041 27f3          	jreq	L1071
2719  0043               L5761:
2720                     ; 129 		if(GPIO_ReadInputPin(BOTAO_24S_PORT, BOTAO_24S_PIN) == RESET)
2722  0043 4b08          	push	#8
2723  0045 ae500f        	ldw	x,#20495
2724  0048 cd0000        	call	_GPIO_ReadInputPin
2726  004b 5b01          	addw	sp,#1
2727  004d 4d            	tnz	a
2728  004e 2623          	jrne	L5071
2729                     ; 131 			tempo_restante = 24;
2731  0050 35180000      	mov	_tempo_restante,#24
2732                     ; 132 			contador_ms = 0;
2734  0054 5f            	clrw	x
2735  0055 bf01          	ldw	_contador_ms,x
2736                     ; 133 			fim_contagem_estado = 0;        // Cancela qualquer animação final
2738  0057 3f05          	clr	_fim_contagem_estado
2739                     ; 134 			flag_start = 1;                 // Habilita o botão de pause
2741  0059 35010004      	mov	_flag_start,#1
2742                     ; 135 			flag_run = 1;                   // Inicia a contagem na ISR
2744  005d 35010003      	mov	_flag_run,#1
2745                     ; 137 			AtualizarDisplay(tempo_restante);
2747  0061 b600          	ld	a,_tempo_restante
2748  0063 cd0388        	call	_AtualizarDisplay
2751  0066               L1171:
2752                     ; 139 			while(GPIO_ReadInputPin(BOTAO_24S_PORT, BOTAO_24S_PIN) == RESET);
2754  0066 4b08          	push	#8
2755  0068 ae500f        	ldw	x,#20495
2756  006b cd0000        	call	_GPIO_ReadInputPin
2758  006e 5b01          	addw	sp,#1
2759  0070 4d            	tnz	a
2760  0071 27f3          	jreq	L1171
2761  0073               L5071:
2762                     ; 143 		if(GPIO_ReadInputPin(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN) == RESET)
2764  0073 4b10          	push	#16
2765  0075 ae500f        	ldw	x,#20495
2766  0078 cd0000        	call	_GPIO_ReadInputPin
2768  007b 5b01          	addw	sp,#1
2769  007d 4d            	tnz	a
2770  007e 2693          	jrne	L1761
2771                     ; 146 			if (flag_start == 1)
2773  0080 b604          	ld	a,_flag_start
2774  0082 a101          	cp	a,#1
2775  0084 261c          	jrne	L5271
2776                     ; 149 				flag_run = !flag_run;
2778  0086 3d03          	tnz	_flag_run
2779  0088 2604          	jrne	L6
2780  008a a601          	ld	a,#1
2781  008c 2001          	jra	L01
2782  008e               L6:
2783  008e 4f            	clr	a
2784  008f               L01:
2785  008f b703          	ld	_flag_run,a
2786                     ; 152                 if (flag_run == 0 && fim_contagem_estado > 0)
2788  0091 3d03          	tnz	_flag_run
2789  0093 260d          	jrne	L5271
2791  0095 3d05          	tnz	_fim_contagem_estado
2792  0097 2709          	jreq	L5271
2793                     ; 154                     GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
2795  0099 4b01          	push	#1
2796  009b ae500f        	ldw	x,#20495
2797  009e cd0000        	call	_GPIO_WriteLow
2799  00a1 84            	pop	a
2800  00a2               L5271:
2801                     ; 159 			while(GPIO_ReadInputPin(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN) == RESET);
2803  00a2 4b10          	push	#16
2804  00a4 ae500f        	ldw	x,#20495
2805  00a7 cd0000        	call	_GPIO_ReadInputPin
2807  00aa 5b01          	addw	sp,#1
2808  00ac 4d            	tnz	a
2809  00ad 27f3          	jreq	L5271
2810  00af ac130013      	jpf	L1761
2845                     ; 166 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
2845                     ; 167 {
2847                     	switch	.text
2848  00b3               f_TIM4_UPD_OVF_IRQHandler:
2850  00b3 8a            	push	cc
2851  00b4 84            	pop	a
2852  00b5 a4bf          	and	a,#191
2853  00b7 88            	push	a
2854  00b8 86            	pop	cc
2855  00b9 3b0002        	push	c_x+2
2856  00bc be00          	ldw	x,c_x
2857  00be 89            	pushw	x
2858  00bf 3b0002        	push	c_y+2
2859  00c2 be00          	ldw	x,c_y
2860  00c4 89            	pushw	x
2863                     ; 169 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
2865  00c5 a601          	ld	a,#1
2866  00c7 cd0000        	call	_TIM4_ClearITPendingBit
2868                     ; 173 	if (flag_run == 0)
2870  00ca 3d03          	tnz	_flag_run
2871  00cc 2604          	jrne	L61
2872  00ce acdf01df      	jpf	L41
2873  00d2               L61:
2874                     ; 175 		return; // Sai da interrupção imediatamente.
2876                     ; 181 	if (fim_contagem_estado == 0)
2878  00d2 3d05          	tnz	_fim_contagem_estado
2879  00d4 2627          	jrne	L7571
2880                     ; 183 		contador_ms++;
2882  00d6 be01          	ldw	x,_contador_ms
2883  00d8 1c0001        	addw	x,#1
2884  00db bf01          	ldw	_contador_ms,x
2885                     ; 184 		if (contador_ms >= 1000) // 1 segundo se passou
2887  00dd be01          	ldw	x,_contador_ms
2888  00df a303e8        	cpw	x,#1000
2889  00e2 2519          	jrult	L7571
2890                     ; 186 			contador_ms = 0;
2892  00e4 5f            	clrw	x
2893  00e5 bf01          	ldw	_contador_ms,x
2894                     ; 187 			if (tempo_restante > 0)
2896  00e7 3d00          	tnz	_tempo_restante
2897  00e9 2707          	jreq	L3671
2898                     ; 189 				tempo_restante--;
2900  00eb 3a00          	dec	_tempo_restante
2901                     ; 190 				AtualizarDisplay(tempo_restante);
2903  00ed b600          	ld	a,_tempo_restante
2904  00ef cd0388        	call	_AtualizarDisplay
2906  00f2               L3671:
2907                     ; 193 			if (tempo_restante == 0) // Transição para a animação final
2909  00f2 3d00          	tnz	_tempo_restante
2910  00f4 2607          	jrne	L7571
2911                     ; 197 				fim_contagem_estado = 1;
2913  00f6 35010005      	mov	_fim_contagem_estado,#1
2914                     ; 198 				contador_ms_sequencia = 0;
2916  00fa 5f            	clrw	x
2917  00fb bf06          	ldw	_contador_ms_sequencia,x
2918  00fd               L7571:
2919                     ; 204 	if(fim_contagem_estado > 0)
2921  00fd 3d05          	tnz	_fim_contagem_estado
2922  00ff 2604          	jrne	L02
2923  0101 acdf01df      	jpf	L7671
2924  0105               L02:
2925                     ; 206 		contador_ms_sequencia++;
2927  0105 be06          	ldw	x,_contador_ms_sequencia
2928  0107 1c0001        	addw	x,#1
2929  010a bf06          	ldw	_contador_ms_sequencia,x
2930                     ; 208 		switch(fim_contagem_estado)
2932  010c b605          	ld	a,_fim_contagem_estado
2934                     ; 249 				break;
2935  010e 4a            	dec	a
2936  010f 2717          	jreq	L1371
2937  0111 4a            	dec	a
2938  0112 2734          	jreq	L3371
2939  0114 4a            	dec	a
2940  0115 274c          	jreq	L5371
2941  0117 4a            	dec	a
2942  0118 2763          	jreq	L7371
2943  011a 4a            	dec	a
2944  011b 277b          	jreq	L1471
2945  011d 4a            	dec	a
2946  011e 2604acb201b2  	jreq	L3471
2947  0124 acdf01df      	jpf	L7671
2948  0128               L1371:
2949                     ; 210 			case 1: // Estado 1: Apaga o display
2949                     ; 211 				if(contador_ms_sequencia == 1){ ApagarDisplay(); }
2951  0128 be06          	ldw	x,_contador_ms_sequencia
2952  012a a30001        	cpw	x,#1
2953  012d 2603          	jrne	L5771
2956  012f cd0353        	call	_ApagarDisplay
2958  0132               L5771:
2959                     ; 212 				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 2; }
2961  0132 be06          	ldw	x,_contador_ms_sequencia
2962  0134 a300c8        	cpw	x,#200
2963  0137 2404          	jruge	L22
2964  0139 acdf01df      	jpf	L7671
2965  013d               L22:
2968  013d 5f            	clrw	x
2969  013e bf06          	ldw	_contador_ms_sequencia,x
2972  0140 35020005      	mov	_fim_contagem_estado,#2
2973  0144 acdf01df      	jpf	L7671
2974  0148               L3371:
2975                     ; 215 			case 2:	// Estado 2: Mostra "00"
2975                     ; 216 				if(contador_ms_sequencia == 1){ AtualizarDisplay(0); }	
2977  0148 be06          	ldw	x,_contador_ms_sequencia
2978  014a a30001        	cpw	x,#1
2979  014d 2604          	jrne	L1002
2982  014f 4f            	clr	a
2983  0150 cd0388        	call	_AtualizarDisplay
2985  0153               L1002:
2986                     ; 217 				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 3; }
2988  0153 be06          	ldw	x,_contador_ms_sequencia
2989  0155 a300c8        	cpw	x,#200
2990  0158 25ea          	jrult	L7671
2993  015a 5f            	clrw	x
2994  015b bf06          	ldw	_contador_ms_sequencia,x
2997  015d 35030005      	mov	_fim_contagem_estado,#3
2998  0161 207c          	jra	L7671
2999  0163               L5371:
3000                     ; 220 			case 3:	// Estado 3: Apaga o display
3000                     ; 221 				if(contador_ms_sequencia == 1){ ApagarDisplay(); }
3002  0163 be06          	ldw	x,_contador_ms_sequencia
3003  0165 a30001        	cpw	x,#1
3004  0168 2603          	jrne	L5002
3007  016a cd0353        	call	_ApagarDisplay
3009  016d               L5002:
3010                     ; 222 				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 4; }
3012  016d be06          	ldw	x,_contador_ms_sequencia
3013  016f a300c8        	cpw	x,#200
3014  0172 256b          	jrult	L7671
3017  0174 5f            	clrw	x
3018  0175 bf06          	ldw	_contador_ms_sequencia,x
3021  0177 35040005      	mov	_fim_contagem_estado,#4
3022  017b 2062          	jra	L7671
3023  017d               L7371:
3024                     ; 225 			case 4:	// Estado 4: Mostra "00"
3024                     ; 226 				if(contador_ms_sequencia == 1){ AtualizarDisplay(0); }	
3026  017d be06          	ldw	x,_contador_ms_sequencia
3027  017f a30001        	cpw	x,#1
3028  0182 2604          	jrne	L1102
3031  0184 4f            	clr	a
3032  0185 cd0388        	call	_AtualizarDisplay
3034  0188               L1102:
3035                     ; 227 				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 5; }
3037  0188 be06          	ldw	x,_contador_ms_sequencia
3038  018a a300c8        	cpw	x,#200
3039  018d 2550          	jrult	L7671
3042  018f 5f            	clrw	x
3043  0190 bf06          	ldw	_contador_ms_sequencia,x
3046  0192 35050005      	mov	_fim_contagem_estado,#5
3047  0196 2047          	jra	L7671
3048  0198               L1471:
3049                     ; 230 			case 5:	// Estado 5: Apaga o display
3049                     ; 231 				if(contador_ms_sequencia == 1){ ApagarDisplay(); }
3051  0198 be06          	ldw	x,_contador_ms_sequencia
3052  019a a30001        	cpw	x,#1
3053  019d 2603          	jrne	L5102
3056  019f cd0353        	call	_ApagarDisplay
3058  01a2               L5102:
3059                     ; 232 				if(contador_ms_sequencia >= 200){ contador_ms_sequencia = 0; fim_contagem_estado = 6; }
3061  01a2 be06          	ldw	x,_contador_ms_sequencia
3062  01a4 a300c8        	cpw	x,#200
3063  01a7 2536          	jrult	L7671
3066  01a9 5f            	clrw	x
3067  01aa bf06          	ldw	_contador_ms_sequencia,x
3070  01ac 35060005      	mov	_fim_contagem_estado,#6
3071  01b0 202d          	jra	L7671
3072  01b2               L3471:
3073                     ; 235 			case 6:	// Estado 6: Mostra "00", liga o Buzzer e finaliza tudo.
3073                     ; 236 				if(contador_ms_sequencia == 1){
3075  01b2 be06          	ldw	x,_contador_ms_sequencia
3076  01b4 a30001        	cpw	x,#1
3077  01b7 260d          	jrne	L1202
3078                     ; 237 					AtualizarDisplay(0);
3080  01b9 4f            	clr	a
3081  01ba cd0388        	call	_AtualizarDisplay
3083                     ; 238 					GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
3085  01bd 4b01          	push	#1
3086  01bf ae500f        	ldw	x,#20495
3087  01c2 cd0000        	call	_GPIO_WriteHigh
3089  01c5 84            	pop	a
3090  01c6               L1202:
3091                     ; 240 				if(contador_ms_sequencia >= 1000){ // Mantém por 1 segundo
3093  01c6 be06          	ldw	x,_contador_ms_sequencia
3094  01c8 a303e8        	cpw	x,#1000
3095  01cb 2512          	jrult	L7671
3096                     ; 241 					GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
3098  01cd 4b01          	push	#1
3099  01cf ae500f        	ldw	x,#20495
3100  01d2 cd0000        	call	_GPIO_WriteLow
3102  01d5 84            	pop	a
3103                     ; 242 					ApagarDisplay();
3105  01d6 cd0353        	call	_ApagarDisplay
3107                     ; 245 					fim_contagem_estado = 0;
3109  01d9 3f05          	clr	_fim_contagem_estado
3110                     ; 246 					flag_run = 0;
3112  01db 3f03          	clr	_flag_run
3113                     ; 247 					flag_start = 0;
3115  01dd 3f04          	clr	_flag_start
3116  01df               L3771:
3117  01df               L7671:
3118                     ; 252 }
3119  01df               L41:
3122  01df 85            	popw	x
3123  01e0 bf00          	ldw	c_y,x
3124  01e2 320002        	pop	c_y+2
3125  01e5 85            	popw	x
3126  01e6 bf00          	ldw	c_x,x
3127  01e8 320002        	pop	c_x+2
3128  01eb 80            	iret
3151                     ; 256 void InitGPIO(void)
3151                     ; 257 {
3153                     	switch	.text
3154  01ec               _InitGPIO:
3158                     ; 258     GPIO_Init(BCD_A_PORT, BCD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3160  01ec 4be0          	push	#224
3161  01ee 4b01          	push	#1
3162  01f0 ae5005        	ldw	x,#20485
3163  01f3 cd0000        	call	_GPIO_Init
3165  01f6 85            	popw	x
3166                     ; 259     GPIO_Init(BCD_B_PORT, BCD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3168  01f7 4be0          	push	#224
3169  01f9 4b02          	push	#2
3170  01fb ae5005        	ldw	x,#20485
3171  01fe cd0000        	call	_GPIO_Init
3173  0201 85            	popw	x
3174                     ; 260     GPIO_Init(BCD_C_PORT, BCD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3176  0202 4be0          	push	#224
3177  0204 4b04          	push	#4
3178  0206 ae5005        	ldw	x,#20485
3179  0209 cd0000        	call	_GPIO_Init
3181  020c 85            	popw	x
3182                     ; 261     GPIO_Init(BCD_D_PORT, BCD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3184  020d 4be0          	push	#224
3185  020f 4b08          	push	#8
3186  0211 ae5005        	ldw	x,#20485
3187  0214 cd0000        	call	_GPIO_Init
3189  0217 85            	popw	x
3190                     ; 262     GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3192  0218 4be0          	push	#224
3193  021a 4b04          	push	#4
3194  021c ae500a        	ldw	x,#20490
3195  021f cd0000        	call	_GPIO_Init
3197  0222 85            	popw	x
3198                     ; 263     GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3200  0223 4be0          	push	#224
3201  0225 4b02          	push	#2
3202  0227 ae500a        	ldw	x,#20490
3203  022a cd0000        	call	_GPIO_Init
3205  022d 85            	popw	x
3206                     ; 264     GPIO_Init(BOTAO_14S_PORT, BOTAO_14S_PIN, GPIO_MODE_IN_PU_NO_IT);
3208  022e 4b40          	push	#64
3209  0230 4b04          	push	#4
3210  0232 ae500f        	ldw	x,#20495
3211  0235 cd0000        	call	_GPIO_Init
3213  0238 85            	popw	x
3214                     ; 265     GPIO_Init(BOTAO_24S_PORT, BOTAO_24S_PIN, GPIO_MODE_IN_PU_NO_IT);
3216  0239 4b40          	push	#64
3217  023b 4b08          	push	#8
3218  023d ae500f        	ldw	x,#20495
3219  0240 cd0000        	call	_GPIO_Init
3221  0243 85            	popw	x
3222                     ; 266     GPIO_Init(BOTAO_PAUSE_PORT, BOTAO_PAUSE_PIN, GPIO_MODE_IN_PU_NO_IT);
3224  0244 4b40          	push	#64
3225  0246 4b10          	push	#16
3226  0248 ae500f        	ldw	x,#20495
3227  024b cd0000        	call	_GPIO_Init
3229  024e 85            	popw	x
3230                     ; 267     GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3232  024f 4be0          	push	#224
3233  0251 4b01          	push	#1
3234  0253 ae500f        	ldw	x,#20495
3235  0256 cd0000        	call	_GPIO_Init
3237  0259 85            	popw	x
3238                     ; 268 }
3241  025a 81            	ret
3274                     ; 270 void InitCLOCK(void)
3274                     ; 271 {
3275                     	switch	.text
3276  025b               _InitCLOCK:
3280                     ; 272     CLK_DeInit();
3282  025b cd0000        	call	_CLK_DeInit
3284                     ; 273     CLK_HSECmd(DISABLE);
3286  025e 4f            	clr	a
3287  025f cd0000        	call	_CLK_HSECmd
3289                     ; 274     CLK_LSICmd(DISABLE);
3291  0262 4f            	clr	a
3292  0263 cd0000        	call	_CLK_LSICmd
3294                     ; 275     CLK_HSICmd(ENABLE);
3296  0266 a601          	ld	a,#1
3297  0268 cd0000        	call	_CLK_HSICmd
3300  026b               L7402:
3301                     ; 276     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3303  026b ae0102        	ldw	x,#258
3304  026e cd0000        	call	_CLK_GetFlagStatus
3306  0271 4d            	tnz	a
3307  0272 27f7          	jreq	L7402
3308                     ; 277     CLK_ClockSwitchCmd(ENABLE);
3310  0274 a601          	ld	a,#1
3311  0276 cd0000        	call	_CLK_ClockSwitchCmd
3313                     ; 278     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
3315  0279 4f            	clr	a
3316  027a cd0000        	call	_CLK_HSIPrescalerConfig
3318                     ; 279     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
3320  027d a680          	ld	a,#128
3321  027f cd0000        	call	_CLK_SYSCLKConfig
3323                     ; 280     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3325  0282 4b01          	push	#1
3326  0284 4b00          	push	#0
3327  0286 ae01e1        	ldw	x,#481
3328  0289 cd0000        	call	_CLK_ClockSwitchConfig
3330  028c 85            	popw	x
3331                     ; 281     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3333  028d 5f            	clrw	x
3334  028e cd0000        	call	_CLK_PeripheralClockConfig
3336                     ; 282     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3338  0291 ae0100        	ldw	x,#256
3339  0294 cd0000        	call	_CLK_PeripheralClockConfig
3341                     ; 283     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
3343  0297 ae1300        	ldw	x,#4864
3344  029a cd0000        	call	_CLK_PeripheralClockConfig
3346                     ; 284     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3348  029d ae1200        	ldw	x,#4608
3349  02a0 cd0000        	call	_CLK_PeripheralClockConfig
3351                     ; 285     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3353  02a3 ae0300        	ldw	x,#768
3354  02a6 cd0000        	call	_CLK_PeripheralClockConfig
3356                     ; 286     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3358  02a9 ae0700        	ldw	x,#1792
3359  02ac cd0000        	call	_CLK_PeripheralClockConfig
3361                     ; 287     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
3363  02af ae0401        	ldw	x,#1025
3364  02b2 cd0000        	call	_CLK_PeripheralClockConfig
3366                     ; 288 }
3369  02b5 81            	ret
3396                     ; 290 void TIM4_Config(void)
3396                     ; 291 {
3397                     	switch	.text
3398  02b6               _TIM4_Config:
3402                     ; 292 	TIM4_DeInit();
3404  02b6 cd0000        	call	_TIM4_DeInit
3406                     ; 293 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124);
3408  02b9 ae077c        	ldw	x,#1916
3409  02bc cd0000        	call	_TIM4_TimeBaseInit
3411                     ; 294 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
3413  02bf ae0101        	ldw	x,#257
3414  02c2 cd0000        	call	_TIM4_ITConfig
3416                     ; 295 	TIM4_Cmd(ENABLE);
3418  02c5 a601          	ld	a,#1
3419  02c7 cd0000        	call	_TIM4_Cmd
3421                     ; 296 }
3424  02ca 81            	ret
3460                     ; 298 void WriteBCD(uint8_t valor)
3460                     ; 299 {
3461                     	switch	.text
3462  02cb               _WriteBCD:
3464  02cb 88            	push	a
3465       00000000      OFST:	set	0
3468                     ; 300 	(valor & 0x01) ? GPIO_WriteHigh(BCD_A_PORT, BCD_A_PIN) : GPIO_WriteLow(BCD_A_PORT, BCD_A_PIN);
3470  02cc a501          	bcp	a,#1
3471  02ce 270c          	jreq	L43
3472  02d0 4b01          	push	#1
3473  02d2 ae5005        	ldw	x,#20485
3474  02d5 cd0000        	call	_GPIO_WriteHigh
3476  02d8 5b01          	addw	sp,#1
3477  02da 200a          	jra	L63
3478  02dc               L43:
3479  02dc 4b01          	push	#1
3480  02de ae5005        	ldw	x,#20485
3481  02e1 cd0000        	call	_GPIO_WriteLow
3483  02e4 5b01          	addw	sp,#1
3484  02e6               L63:
3485                     ; 301 	(valor & 0x02) ? GPIO_WriteHigh(BCD_B_PORT, BCD_B_PIN) : GPIO_WriteLow(BCD_B_PORT, BCD_B_PIN);
3487  02e6 7b01          	ld	a,(OFST+1,sp)
3488  02e8 a502          	bcp	a,#2
3489  02ea 270c          	jreq	L04
3490  02ec 4b02          	push	#2
3491  02ee ae5005        	ldw	x,#20485
3492  02f1 cd0000        	call	_GPIO_WriteHigh
3494  02f4 5b01          	addw	sp,#1
3495  02f6 200a          	jra	L24
3496  02f8               L04:
3497  02f8 4b02          	push	#2
3498  02fa ae5005        	ldw	x,#20485
3499  02fd cd0000        	call	_GPIO_WriteLow
3501  0300 5b01          	addw	sp,#1
3502  0302               L24:
3503                     ; 302 	(valor & 0x04) ? GPIO_WriteHigh(BCD_C_PORT, BCD_C_PIN) : GPIO_WriteLow(BCD_C_PORT, BCD_C_PIN);
3505  0302 7b01          	ld	a,(OFST+1,sp)
3506  0304 a504          	bcp	a,#4
3507  0306 270c          	jreq	L44
3508  0308 4b04          	push	#4
3509  030a ae5005        	ldw	x,#20485
3510  030d cd0000        	call	_GPIO_WriteHigh
3512  0310 5b01          	addw	sp,#1
3513  0312 200a          	jra	L64
3514  0314               L44:
3515  0314 4b04          	push	#4
3516  0316 ae5005        	ldw	x,#20485
3517  0319 cd0000        	call	_GPIO_WriteLow
3519  031c 5b01          	addw	sp,#1
3520  031e               L64:
3521                     ; 303 	(valor & 0x08) ? GPIO_WriteHigh(BCD_D_PORT, BCD_D_PIN) : GPIO_WriteLow(BCD_D_PORT, BCD_D_PIN);
3523  031e 7b01          	ld	a,(OFST+1,sp)
3524  0320 a508          	bcp	a,#8
3525  0322 270c          	jreq	L05
3526  0324 4b08          	push	#8
3527  0326 ae5005        	ldw	x,#20485
3528  0329 cd0000        	call	_GPIO_WriteHigh
3530  032c 5b01          	addw	sp,#1
3531  032e 200a          	jra	L25
3532  0330               L05:
3533  0330 4b08          	push	#8
3534  0332 ae5005        	ldw	x,#20485
3535  0335 cd0000        	call	_GPIO_WriteLow
3537  0338 5b01          	addw	sp,#1
3538  033a               L25:
3539                     ; 304 }
3542  033a 84            	pop	a
3543  033b 81            	ret
3644                     ; 306 void PulseLatch(GPIO_TypeDef* porta, uint8_t pino)
3644                     ; 307 {
3645                     	switch	.text
3646  033c               _PulseLatch:
3648  033c 89            	pushw	x
3649       00000000      OFST:	set	0
3652                     ; 308 	GPIO_WriteHigh(porta, pino);
3654  033d 7b05          	ld	a,(OFST+5,sp)
3655  033f 88            	push	a
3656  0340 cd0000        	call	_GPIO_WriteHigh
3658  0343 84            	pop	a
3659                     ; 309 	NOP(); NOP(); NOP(); NOP();
3662  0344 9d            nop
3667  0345 9d            nop
3672  0346 9d            nop
3677  0347 9d            nop
3679                     ; 310 	GPIO_WriteLow(porta, pino);
3681  0348 7b05          	ld	a,(OFST+5,sp)
3682  034a 88            	push	a
3683  034b 1e02          	ldw	x,(OFST+2,sp)
3684  034d cd0000        	call	_GPIO_WriteLow
3686  0350 84            	pop	a
3687                     ; 311 }
3690  0351 85            	popw	x
3691  0352 81            	ret
3716                     ; 313 void ApagarDisplay(void)
3716                     ; 314 {
3717                     	switch	.text
3718  0353               _ApagarDisplay:
3722                     ; 315 	GPIO_WriteLow(BCD_A_PORT, BCD_A_PIN);
3724  0353 4b01          	push	#1
3725  0355 ae5005        	ldw	x,#20485
3726  0358 cd0000        	call	_GPIO_WriteLow
3728  035b 84            	pop	a
3729                     ; 316 	GPIO_WriteLow(BCD_B_PORT, BCD_B_PIN);
3731  035c 4b02          	push	#2
3732  035e ae5005        	ldw	x,#20485
3733  0361 cd0000        	call	_GPIO_WriteLow
3735  0364 84            	pop	a
3736                     ; 317 	GPIO_WriteLow(BCD_C_PORT, BCD_C_PIN);
3738  0365 4b04          	push	#4
3739  0367 ae5005        	ldw	x,#20485
3740  036a cd0000        	call	_GPIO_WriteLow
3742  036d 84            	pop	a
3743                     ; 318 	GPIO_WriteLow(BCD_D_PORT, BCD_D_PIN);
3745  036e 4b08          	push	#8
3746  0370 ae5005        	ldw	x,#20485
3747  0373 cd0000        	call	_GPIO_WriteLow
3749  0376 84            	pop	a
3750                     ; 319 	PulseLatch(LATCH_01_PORT,LATCH_01_PIN);
3752  0377 4b04          	push	#4
3753  0379 ae500a        	ldw	x,#20490
3754  037c adbe          	call	_PulseLatch
3756  037e 84            	pop	a
3757                     ; 320 	PulseLatch(LATCH_02_PORT,LATCH_02_PIN);
3759  037f 4b02          	push	#2
3760  0381 ae500a        	ldw	x,#20490
3761  0384 adb6          	call	_PulseLatch
3763  0386 84            	pop	a
3764                     ; 321 }
3767  0387 81            	ret
3821                     ; 323 void AtualizarDisplay(uint8_t valor)
3821                     ; 324 {
3822                     	switch	.text
3823  0388               _AtualizarDisplay:
3825  0388 88            	push	a
3826  0389 89            	pushw	x
3827       00000002      OFST:	set	2
3830                     ; 325 	uint8_t unidades = valor % 10;
3832  038a 5f            	clrw	x
3833  038b 97            	ld	xl,a
3834  038c a60a          	ld	a,#10
3835  038e 62            	div	x,a
3836  038f 5f            	clrw	x
3837  0390 97            	ld	xl,a
3838  0391 9f            	ld	a,xl
3839  0392 6b01          	ld	(OFST-1,sp),a
3841                     ; 326 	uint8_t dezenas = valor / 10;
3843  0394 7b03          	ld	a,(OFST+1,sp)
3844  0396 5f            	clrw	x
3845  0397 97            	ld	xl,a
3846  0398 a60a          	ld	a,#10
3847  039a 62            	div	x,a
3848  039b 9f            	ld	a,xl
3849  039c 6b02          	ld	(OFST+0,sp),a
3851                     ; 328 	WriteBCD(unidades);
3853  039e 7b01          	ld	a,(OFST-1,sp)
3854  03a0 cd02cb        	call	_WriteBCD
3856                     ; 329 	PulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3858  03a3 4b04          	push	#4
3859  03a5 ae500a        	ldw	x,#20490
3860  03a8 ad92          	call	_PulseLatch
3862  03aa 84            	pop	a
3863                     ; 331 	WriteBCD(dezenas);
3865  03ab 7b02          	ld	a,(OFST+0,sp)
3866  03ad cd02cb        	call	_WriteBCD
3868                     ; 332 	PulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3870  03b0 4b02          	push	#2
3871  03b2 ae500a        	ldw	x,#20490
3872  03b5 ad85          	call	_PulseLatch
3874  03b7 84            	pop	a
3875                     ; 333 }	
3878  03b8 5b03          	addw	sp,#3
3879  03ba 81            	ret
3950                     	xdef	f_TIM4_UPD_OVF_IRQHandler
3951                     	xdef	_main
3952                     	xdef	_AtualizarDisplay
3953                     	xdef	_ApagarDisplay
3954                     	xdef	_PulseLatch
3955                     	xdef	_WriteBCD
3956                     	xdef	_TIM4_Config
3957                     	xdef	_InitCLOCK
3958                     	xdef	_InitGPIO
3959                     	xdef	_contador_ms_sequencia
3960                     	xdef	_fim_contagem_estado
3961                     	xdef	_flag_start
3962                     	xdef	_flag_run
3963                     	xdef	_contador_ms
3964                     	xdef	_tempo_restante
3965                     	xref	_TIM4_ClearITPendingBit
3966                     	xref	_TIM4_ITConfig
3967                     	xref	_TIM4_Cmd
3968                     	xref	_TIM4_TimeBaseInit
3969                     	xref	_TIM4_DeInit
3970                     	xref	_ITC_SetSoftwarePriority
3971                     	xref	_GPIO_ReadInputPin
3972                     	xref	_GPIO_WriteLow
3973                     	xref	_GPIO_WriteHigh
3974                     	xref	_GPIO_Init
3975                     	xref	_CLK_GetFlagStatus
3976                     	xref	_CLK_SYSCLKConfig
3977                     	xref	_CLK_HSIPrescalerConfig
3978                     	xref	_CLK_ClockSwitchConfig
3979                     	xref	_CLK_PeripheralClockConfig
3980                     	xref	_CLK_ClockSwitchCmd
3981                     	xref	_CLK_LSICmd
3982                     	xref	_CLK_HSICmd
3983                     	xref	_CLK_HSECmd
3984                     	xref	_CLK_DeInit
3985                     	xref.b	c_x
3986                     	xref.b	c_y
4005                     	end
