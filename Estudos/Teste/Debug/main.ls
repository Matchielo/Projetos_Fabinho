   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     	bsct
2589  0000               _led1State:
2590  0000 00            	dc.b	0
2591  0001               _led2State:
2592  0001 00            	dc.b	0
2593  0002               _led3State:
2594  0002 00            	dc.b	0
2595  0003               _RF_IN_ON:
2596  0003 00            	dc.b	0
2597  0004               _debounceCh1:
2598  0004 0000          	dc.w	0
2599  0006               _debounceCh2:
2600  0006 0000          	dc.w	0
2601  0008               _rf_cooldown:
2602  0008 0000          	dc.w	0
2603  000a               _tempo_restante:
2604  000a 00            	dc.b	0
2605  000b               _contador_ms:
2606  000b 0000          	dc.w	0
2607  000d               _flag_run:
2608  000d 00            	dc.b	0
2609  000e               _flag_start:
2610  000e 00            	dc.b	0
2611  000f               _fim_contagem_estado:
2612  000f 00            	dc.b	0
2613  0010               _contador_ms_sequencia:
2614  0010 0000          	dc.w	0
2673                     ; 174 main()
2673                     ; 175 {
2675                     	switch	.text
2676  0000               _main:
2678  0000 89            	pushw	x
2679       00000002      OFST:	set	2
2682                     ; 176 		SetCLK();        // Ajusta clock para 16 MHz (máxima velocidade ? leitura RF mais precisa)
2684  0001 cd0225        	call	_SetCLK
2686                     ; 177     InitGPIO();      // Configura entradas e saídas
2688  0004 cd01c2        	call	_InitGPIO
2690                     ; 178     UnlockE2prom();  // Permite gravação na EEPROM
2692  0007 cd022a        	call	_UnlockE2prom
2694                     ; 179     onInt_TM6();     // Ativa Timer 6 para interrupção periódica usada na leitura RF
2696  000a cd0230        	call	_onInt_TM6
2698                     ; 180 		TIM1_Config();
2700  000d cd027e        	call	_TIM1_Config
2702                     ; 181 		ITC_SetSoftwarePriority(ITC_IRQ_TIM1_OVF, ITC_PRIORITYLEVEL_1);
2704  0010 ae0b01        	ldw	x,#2817
2705  0013 cd0000        	call	_ITC_SetSoftwarePriority
2707                     ; 183 		enableInterrupts();	
2710  0016 9a            rim
2712                     ; 185 	  PiscaDisplay();
2715  0017 cd03f0        	call	_PiscaDisplay
2717                     ; 189     if (readCh1 == 0)
2719  001a 4b20          	push	#32
2720  001c ae500f        	ldw	x,#20495
2721  001f cd0000        	call	_GPIO_ReadInputPin
2723  0022 5b01          	addw	sp,#1
2724  0024 4d            	tnz	a
2725  0025 2627          	jrne	L7071
2726                     ; 192         Delay(100); // Debounce simples
2728  0027 ae0064        	ldw	x,#100
2729  002a 89            	pushw	x
2730  002b ae0000        	ldw	x,#0
2731  002e 89            	pushw	x
2732  002f cd0210        	call	_Delay
2734  0032 5b04          	addw	sp,#4
2735                     ; 193         for (i = 0; i < 4; i++)
2737  0034 5f            	clrw	x
2738  0035 1f01          	ldw	(OFST-1,sp),x
2740  0037               L1071:
2741                     ; 195             codControler[i] = 0x00; // Apaga todos os códigos RF da EEPROM
2743  0037 1e01          	ldw	x,(OFST-1,sp)
2744  0039 4f            	clr	a
2745  003a 1c0000        	addw	x,#_codControler
2746  003d cd0000        	call	c_eewrc
2748                     ; 193         for (i = 0; i < 4; i++)
2750  0040 1e01          	ldw	x,(OFST-1,sp)
2751  0042 1c0001        	addw	x,#1
2752  0045 1f01          	ldw	(OFST-1,sp),x
2756  0047 1e01          	ldw	x,(OFST-1,sp)
2757  0049 a30004        	cpw	x,#4
2758  004c 25e9          	jrult	L1071
2759  004e               L7071:
2760                     ; 209 			if (rf_cooldown > 0)
2762  004e be08          	ldw	x,_rf_cooldown
2763  0050 2707          	jreq	L3171
2764                     ; 211 					rf_cooldown--;
2766  0052 be08          	ldw	x,_rf_cooldown
2767  0054 1d0001        	subw	x,#1
2768  0057 bf08          	ldw	_rf_cooldown,x
2769  0059               L3171:
2770                     ; 214 			RF_IN_ON = TRUE; // Habilita leitura RF na leitura da interrupção
2772  0059 35010003      	mov	_RF_IN_ON,#1
2773                     ; 215 			HT_RC_Code_Ready_Overwrite = FALSE; // Reseta flag do protocolo RF
2775  005d 3f00          	clr	_HT_RC_Code_Ready_Overwrite
2776                     ; 220 			if (readCh1 == 0)
2778  005f 4b20          	push	#32
2779  0061 ae500f        	ldw	x,#20495
2780  0064 cd0000        	call	_GPIO_ReadInputPin
2782  0067 5b01          	addw	sp,#1
2783  0069 4d            	tnz	a
2784  006a 2642          	jrne	L5171
2785                     ; 222 					if (++debounceCh1 >= 250)
2787  006c be04          	ldw	x,_debounceCh1
2788  006e 1c0001        	addw	x,#1
2789  0071 bf04          	ldw	_debounceCh1,x
2790  0073 a300fa        	cpw	x,#250
2791  0076 2539          	jrult	L5271
2792                     ; 224 							--debounceCh1;
2794  0078 be04          	ldw	x,_debounceCh1
2795  007a 1d0001        	subw	x,#1
2796  007d bf04          	ldw	_debounceCh1,x
2797                     ; 227 						 Delay(200000);
2799  007f ae0d40        	ldw	x,#3392
2800  0082 89            	pushw	x
2801  0083 ae0003        	ldw	x,#3
2802  0086 89            	pushw	x
2803  0087 cd0210        	call	_Delay
2805  008a 5b04          	addw	sp,#4
2806                     ; 229 							if (Code_Ready == TRUE)
2808  008c b600          	ld	a,_Code_Ready
2809  008e a101          	cp	a,#1
2810  0090 260d          	jrne	L1271
2811                     ; 231 									save_code_to_eeprom(); // Salva o código recebido.
2813  0092 cd0148        	call	_save_code_to_eeprom
2815                     ; 232 									Code_Ready = FALSE;
2817  0095 3f00          	clr	_Code_Ready
2818                     ; 234 									BuzzerBeep(100000);
2820  0097 ae86a0        	ldw	x,#34464
2821  009a cd0123        	call	_BuzzerBeep
2824  009d 2012          	jra	L5271
2825  009f               L1271:
2826                     ; 239 									Delay(100000);
2828  009f ae86a0        	ldw	x,#34464
2829  00a2 89            	pushw	x
2830  00a3 ae0001        	ldw	x,#1
2831  00a6 89            	pushw	x
2832  00a7 cd0210        	call	_Delay
2834  00aa 5b04          	addw	sp,#4
2835  00ac 2003          	jra	L5271
2836  00ae               L5171:
2837                     ; 245 					debounceCh1 = 0;	// Reseta o contador se o botão for solto.
2839  00ae 5f            	clrw	x
2840  00af bf04          	ldw	_debounceCh1,x
2841  00b1               L5271:
2842                     ; 249 			if (Code_Ready == TRUE && rf_cooldown == 0)
2844  00b1 b600          	ld	a,_Code_Ready
2845  00b3 a101          	cp	a,#1
2846  00b5 2610          	jrne	L7271
2848  00b7 be08          	ldw	x,_rf_cooldown
2849  00b9 260c          	jrne	L7271
2850                     ; 251 					searchCode(); // Busca código na EEPROM e executa a ação
2852  00bb cd016b        	call	_searchCode
2854                     ; 252 					Code_Ready = FALSE;	// Reseta a flag para o próximo comando.
2856  00be 3f00          	clr	_Code_Ready
2857                     ; 255 					rf_cooldown = 3000;
2859  00c0 ae0bb8        	ldw	x,#3000
2860  00c3 bf08          	ldw	_rf_cooldown,x
2862  00c5 2087          	jra	L7071
2863  00c7               L7271:
2864                     ; 257 			else if (Code_Ready == TRUE && rf_cooldown > 0)
2866  00c7 b600          	ld	a,_Code_Ready
2867  00c9 a101          	cp	a,#1
2868  00cb 2681          	jrne	L7071
2870  00cd be08          	ldw	x,_rf_cooldown
2871  00cf 27f4          	jreq	L7071
2872                     ; 260 					Code_Ready = FALSE;
2874  00d1 3f00          	clr	_Code_Ready
2875  00d3 cc004e        	jra	L7071
2904                     ; 283 void BOT_14S(void)
2904                     ; 284 {
2905                     	switch	.text
2906  00d6               _BOT_14S:
2910                     ; 285 	tempo_restante = 14;						// Define o tempo inicial da contagem.
2912  00d6 350e000a      	mov	_tempo_restante,#14
2913                     ; 286 	contador_ms = 0;								// Zera o contador de mls para um novo segundo inicial.
2915  00da 5f            	clrw	x
2916  00db bf0b          	ldw	_contador_ms,x
2917                     ; 287 	fim_contagem_estado = 0;        // Cancela qualquer animação final que esteja ocorrendo
2919  00dd 3f0f          	clr	_fim_contagem_estado
2920                     ; 288 	flag_start = 1;                 // Habilita o botão de pause
2922  00df 3501000e      	mov	_flag_start,#1
2923                     ; 289 	flag_run = 1;                   // Inicia a contagem na ISR
2925  00e3 3501000d      	mov	_flag_run,#1
2926                     ; 291 	AtualizarDisplay(tempo_restante);
2928  00e7 b60a          	ld	a,_tempo_restante
2929  00e9 cd0388        	call	_AtualizarDisplay
2931                     ; 292 }
2934  00ec 81            	ret
2963                     ; 307 void BOT_24S(void)
2963                     ; 308 {
2964                     	switch	.text
2965  00ed               _BOT_24S:
2969                     ; 309 	tempo_restante = 24;						// Define o tempo inicial da contagem.
2971  00ed 3518000a      	mov	_tempo_restante,#24
2972                     ; 310 	contador_ms = 0;								// Zera o contador de mls para um novo segundo inicial.
2974  00f1 5f            	clrw	x
2975  00f2 bf0b          	ldw	_contador_ms,x
2976                     ; 311 	fim_contagem_estado = 0;        // Cancela qualquer animação final que esteja ocorrendo
2978  00f4 3f0f          	clr	_fim_contagem_estado
2979                     ; 312 	flag_start = 1;                 // Habilita o botão de pause
2981  00f6 3501000e      	mov	_flag_start,#1
2982                     ; 313 	flag_run = 1;                   // Inicia a contagem na ISR
2984  00fa 3501000d      	mov	_flag_run,#1
2985                     ; 315 	AtualizarDisplay(tempo_restante);
2987  00fe b60a          	ld	a,_tempo_restante
2988  0100 cd0388        	call	_AtualizarDisplay
2990                     ; 316 }
2993  0103 81            	ret
3020                     ; 331 void BOT_PAUSE(void)
3020                     ; 332 {
3021                     	switch	.text
3022  0104               _BOT_PAUSE:
3026                     ; 334 	if (flag_start == 1)
3028  0104 b60e          	ld	a,_flag_start
3029  0106 a101          	cp	a,#1
3030  0108 2618          	jrne	L5671
3031                     ; 337 		flag_run = !flag_run;
3033  010a 3d0d          	tnz	_flag_run
3034  010c 2604          	jrne	L41
3035  010e a601          	ld	a,#1
3036  0110 2001          	jra	L61
3037  0112               L41:
3038  0112 4f            	clr	a
3039  0113               L61:
3040  0113 b70d          	ld	_flag_run,a
3041                     ; 340 		if (flag_run == 0 && fim_contagem_estado > 0)
3043  0115 3d0d          	tnz	_flag_run
3044  0117 2609          	jrne	L5671
3046  0119 3d0f          	tnz	_fim_contagem_estado
3047  011b 2705          	jreq	L5671
3048                     ; 342 			BuzzerBeep(100000);
3050  011d ae86a0        	ldw	x,#34464
3051  0120 ad01          	call	_BuzzerBeep
3053  0122               L5671:
3054                     ; 345 }
3057  0122 81            	ret
3094                     ; 364 void BuzzerBeep(uint16_t duration)
3094                     ; 365 {
3095                     	switch	.text
3096  0123               _BuzzerBeep:
3098  0123 89            	pushw	x
3099       00000000      OFST:	set	0
3102                     ; 366     BUZZER_ON;
3104  0124 4b40          	push	#64
3105  0126 ae500a        	ldw	x,#20490
3106  0129 cd0000        	call	_GPIO_WriteHigh
3108  012c 84            	pop	a
3109                     ; 367     Delay(duration);
3111  012d 1e01          	ldw	x,(OFST+1,sp)
3112  012f cd0000        	call	c_uitolx
3114  0132 be02          	ldw	x,c_lreg+2
3115  0134 89            	pushw	x
3116  0135 be00          	ldw	x,c_lreg
3117  0137 89            	pushw	x
3118  0138 cd0210        	call	_Delay
3120  013b 5b04          	addw	sp,#4
3121                     ; 368     BUZZER_OFF;
3123  013d 4b40          	push	#64
3124  013f ae500a        	ldw	x,#20490
3125  0142 cd0000        	call	_GPIO_WriteLow
3127  0145 84            	pop	a
3128                     ; 369 }
3131  0146 85            	popw	x
3132  0147 81            	ret
3169                     ; 385 void save_code_to_eeprom(void)
3169                     ; 386 {
3170                     	switch	.text
3171  0148               _save_code_to_eeprom:
3173  0148 89            	pushw	x
3174       00000002      OFST:	set	2
3177                     ; 387 	int i = 0;
3179                     ; 388 	codControler[i]     = RF_CopyBuffer[0];
3181  0149 b600          	ld	a,_RF_CopyBuffer
3182  014b ae0000        	ldw	x,#_codControler
3183  014e cd0000        	call	c_eewrc
3185                     ; 389 	codControler[i + 1] = RF_CopyBuffer[1];
3187  0151 b601          	ld	a,_RF_CopyBuffer+1
3188  0153 ae0001        	ldw	x,#_codControler+1
3189  0156 cd0000        	call	c_eewrc
3191                     ; 390 	codControler[i + 2] = RF_CopyBuffer[2];
3193  0159 b602          	ld	a,_RF_CopyBuffer+2
3194  015b ae0002        	ldw	x,#_codControler+2
3195  015e cd0000        	call	c_eewrc
3197                     ; 391 	codControler[i + 3] = RF_CopyBuffer[3];
3199  0161 b603          	ld	a,_RF_CopyBuffer+3
3200  0163 ae0003        	ldw	x,#_codControler+3
3201  0166 cd0000        	call	c_eewrc
3203                     ; 392 }
3206  0169 85            	popw	x
3207  016a 81            	ret
3265                     ; 414 uint8_t searchCode(void)
3265                     ; 415 {
3266                     	switch	.text
3267  016b               _searchCode:
3269  016b 5204          	subw	sp,#4
3270       00000004      OFST:	set	4
3273                     ; 416 	int i = 0;
3275                     ; 421 	id_salvo_mascarado    = codControler[i + 2] & 0xFC;
3277  016d c60002        	ld	a,_codControler+2
3278  0170 a4fc          	and	a,#252
3279  0172 6b03          	ld	(OFST-1,sp),a
3281                     ; 422 	id_recebido_mascarado = RF_CopyBuffer[2] & 0xFC;
3283  0174 b602          	ld	a,_RF_CopyBuffer+2
3284  0176 a4fc          	and	a,#252
3285  0178 6b04          	ld	(OFST+0,sp),a
3287                     ; 425 	if (codControler[i]     == RF_CopyBuffer[0] && 
3287                     ; 426 		codControler[i + 1] == RF_CopyBuffer[1] &&
3287                     ; 427 		id_salvo_mascarado  == id_recebido_mascarado && // Compara usando a máscara
3287                     ; 428 		codControler[i + 3] == RF_CopyBuffer[3])
3289  017a c60000        	ld	a,_codControler
3290  017d b100          	cp	a,_RF_CopyBuffer
3291  017f 263c          	jrne	L3502
3293  0181 c60001        	ld	a,_codControler+1
3294  0184 b101          	cp	a,_RF_CopyBuffer+1
3295  0186 2635          	jrne	L3502
3297  0188 7b03          	ld	a,(OFST-1,sp)
3298  018a 1104          	cp	a,(OFST+0,sp)
3299  018c 262f          	jrne	L3502
3301  018e c60003        	ld	a,_codControler+3
3302  0191 b103          	cp	a,_RF_CopyBuffer+3
3303  0193 2628          	jrne	L3502
3304                     ; 432 		if ((RF_CopyBuffer[2] & 0x03) == 0x01) // Tecla 1
3306  0195 b602          	ld	a,_RF_CopyBuffer+2
3307  0197 a403          	and	a,#3
3308  0199 a101          	cp	a,#1
3309  019b 2605          	jrne	L5502
3310                     ; 434 			BOT_14S();
3312  019d cd00d6        	call	_BOT_14S
3315  01a0 2018          	jra	L7502
3316  01a2               L5502:
3317                     ; 437 		else if ((RF_CopyBuffer[2] & 0x03) == 0x02) // Tecla 2
3319  01a2 b602          	ld	a,_RF_CopyBuffer+2
3320  01a4 a403          	and	a,#3
3321  01a6 a102          	cp	a,#2
3322  01a8 2605          	jrne	L1602
3323                     ; 439 			BOT_24S();
3325  01aa cd00ed        	call	_BOT_24S
3328  01ad 200b          	jra	L7502
3329  01af               L1602:
3330                     ; 442 		else if ((RF_CopyBuffer[2] & 0x03) == 0x03) // Tecla 3 (ou 4 dependendo do controle)
3332  01af b602          	ld	a,_RF_CopyBuffer+2
3333  01b1 a403          	and	a,#3
3334  01b3 a103          	cp	a,#3
3335  01b5 2603          	jrne	L7502
3336                     ; 444 			BOT_PAUSE();
3338  01b7 cd0104        	call	_BOT_PAUSE
3340  01ba               L7502:
3341                     ; 448 		return 0; // Código encontrado e ação executada
3343  01ba 4f            	clr	a
3345  01bb 2002          	jra	L62
3346  01bd               L3502:
3347                     ; 454 		return 1;
3349  01bd a601          	ld	a,#1
3351  01bf               L62:
3353  01bf 5b04          	addw	sp,#4
3354  01c1 81            	ret
3378                     ; 473 void InitGPIO(void)
3378                     ; 474 {
3379                     	switch	.text
3380  01c2               _InitGPIO:
3384                     ; 476     GPIO_Init(GPIOD, GPIO_PIN_5, GPIO_MODE_IN_PU_NO_IT); // Botão CH1
3386  01c2 4b40          	push	#64
3387  01c4 4b20          	push	#32
3388  01c6 ae500f        	ldw	x,#20495
3389  01c9 cd0000        	call	_GPIO_Init
3391  01cc 85            	popw	x
3392                     ; 477     GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // Botão CH2
3394  01cd 4b40          	push	#64
3395  01cf 4b10          	push	#16
3396  01d1 ae5019        	ldw	x,#20505
3397  01d4 cd0000        	call	_GPIO_Init
3399  01d7 85            	popw	x
3400                     ; 480     GPIO_Init(GPIOA, GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PA2: Display | PA3: PWM buzzer
3402  01d8 4be0          	push	#224
3403  01da 4b0c          	push	#12
3404  01dc ae5000        	ldw	x,#20480
3405  01df cd0000        	call	_GPIO_Init
3407  01e2 85            	popw	x
3408                     ; 481     GPIO_Init(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PB0~PB3: BCD/7Seg
3410  01e3 4be0          	push	#224
3411  01e5 4b0f          	push	#15
3412  01e7 ae5005        	ldw	x,#20485
3413  01ea cd0000        	call	_GPIO_Init
3415  01ed 85            	popw	x
3416                     ; 482     GPIO_Init(GPIOC, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch
3418  01ee 4be0          	push	#224
3419  01f0 4bfe          	push	#254
3420  01f2 ae500a        	ldw	x,#20490
3421  01f5 cd0000        	call	_GPIO_Init
3423  01f8 85            	popw	x
3424                     ; 483     GPIO_Init(GPIOD, GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
3426  01f9 4be0          	push	#224
3427  01fb 4bdd          	push	#221
3428  01fd ae500f        	ldw	x,#20495
3429  0200 cd0000        	call	_GPIO_Init
3431  0203 85            	popw	x
3432                     ; 484     GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch 0
3434  0204 4be0          	push	#224
3435  0206 4b20          	push	#32
3436  0208 ae5014        	ldw	x,#20500
3437  020b cd0000        	call	_GPIO_Init
3439  020e 85            	popw	x
3440                     ; 485 }
3443  020f 81            	ret
3477                     ; 502 void Delay(uint32_t nCount)
3477                     ; 503 {
3478                     	switch	.text
3479  0210               _Delay:
3481       00000000      OFST:	set	0
3484  0210 2009          	jra	L1212
3485  0212               L7112:
3486                     ; 506         nCount--;
3488  0212 96            	ldw	x,sp
3489  0213 1c0003        	addw	x,#OFST+3
3490  0216 a601          	ld	a,#1
3491  0218 cd0000        	call	c_lgsbc
3493  021b               L1212:
3494                     ; 504     while (nCount != 0)
3496  021b 96            	ldw	x,sp
3497  021c 1c0003        	addw	x,#OFST+3
3498  021f cd0000        	call	c_lzmp
3500  0222 26ee          	jrne	L7112
3501                     ; 508 }
3504  0224 81            	ret
3528                     ; 524 void SetCLK(void)
3528                     ; 525 {
3529                     	switch	.text
3530  0225               _SetCLK:
3534                     ; 526     CLK_CKDIVR = 0b00000000; // Sem divisão, máxima frequência
3536  0225 725f50c6      	clr	_CLK_CKDIVR
3537                     ; 527 }
3540  0229 81            	ret
3564                     ; 544 void UnlockE2prom(void)
3564                     ; 545 {
3565                     	switch	.text
3566  022a               _UnlockE2prom:
3570                     ; 546     FLASH_Unlock(FLASH_MEMTYPE_DATA);
3572  022a a6f7          	ld	a,#247
3573  022c cd0000        	call	_FLASH_Unlock
3575                     ; 547 }
3578  022f 81            	ret
3607                     ; 567 void onInt_TM6(void)
3607                     ; 568 {
3608                     	switch	.text
3609  0230               _onInt_TM6:
3613                     ; 569     TIM6_CR1  = 0b00000001; // Liga Timer 6
3615  0230 35015340      	mov	_TIM6_CR1,#1
3616                     ; 570     TIM6_IER  = 0b00000001; // Habilita interrupção
3618  0234 35015343      	mov	_TIM6_IER,#1
3619                     ; 571     TIM6_CNTR = 0b00000001; // Inicializa contador
3621  0238 35015346      	mov	_TIM6_CNTR,#1
3622                     ; 572     TIM6_ARR  = 0b00000001; // Valor inicial do ARR
3624  023c 35015348      	mov	_TIM6_ARR,#1
3625                     ; 573     TIM6_SR   = 0b00000001; // Limpa flag de status
3627  0240 35015344      	mov	_TIM6_SR,#1
3628                     ; 574     TIM6_PSCR = 0b00000010; // Prescaler
3630  0244 35025347      	mov	_TIM6_PSCR,#2
3631                     ; 575     TIM6_ARR  = 198;        // Valor para gerar 50us (com 16MHz)
3633  0248 35c65348      	mov	_TIM6_ARR,#198
3634                     ; 576     TIM6_IER  |= 0x00;
3636  024c c65343        	ld	a,_TIM6_IER
3637                     ; 577     TIM6_CR1  |= 0x00;
3639  024f c65340        	ld	a,_TIM6_CR1
3640                     ; 579     RIM             // Habilita interrupções globais
3643  0252 9a            RIM             // Habilita interrupções globais
3645                     ; 581 }
3648  0253 81            	ret
3675                     ; 601 @far @interrupt void TIM6_UPD_IRQHandler (void)
3675                     ; 602 {
3677                     	switch	.text
3678  0254               f_TIM6_UPD_IRQHandler:
3680  0254 8a            	push	cc
3681  0255 84            	pop	a
3682  0256 a4bf          	and	a,#191
3683  0258 88            	push	a
3684  0259 86            	pop	cc
3685  025a 3b0002        	push	c_x+2
3686  025d be00          	ldw	x,c_x
3687  025f 89            	pushw	x
3688  0260 3b0002        	push	c_y+2
3689  0263 be00          	ldw	x,c_y
3690  0265 89            	pushw	x
3693                     ; 603     if(RF_IN_ON)
3695  0266 3d03          	tnz	_RF_IN_ON
3696  0268 2703          	jreq	L5612
3697                     ; 605         Read_RF_6P20(); // Decodifica sinal RF recebido pela antena
3699  026a cd0000        	call	_Read_RF_6P20
3701  026d               L5612:
3702                     ; 607     TIM6_SR = 0;
3704  026d 725f5344      	clr	_TIM6_SR
3705                     ; 608 }
3708  0271 85            	popw	x
3709  0272 bf00          	ldw	c_y,x
3710  0274 320002        	pop	c_y+2
3711  0277 85            	popw	x
3712  0278 bf00          	ldw	c_x,x
3713  027a 320002        	pop	c_x+2
3714  027d 80            	iret
3741                     ; 612 void TIM1_Config(void)
3741                     ; 613 {
3743                     	switch	.text
3744  027e               _TIM1_Config:
3748                     ; 615 	TIM1_DeInit();
3750  027e cd0000        	call	_TIM1_DeInit
3752                     ; 619 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
3754  0281 ae0701        	ldw	x,#1793
3755  0284 cd0000        	call	_CLK_PeripheralClockConfig
3757                     ; 630 	TIM1_TimeBaseInit(128, TIM1_COUNTERMODE_UP, 124, 0);
3759  0287 4b00          	push	#0
3760  0289 ae007c        	ldw	x,#124
3761  028c 89            	pushw	x
3762  028d 4b00          	push	#0
3763  028f ae0080        	ldw	x,#128
3764  0292 cd0000        	call	_TIM1_TimeBaseInit
3766  0295 5b04          	addw	sp,#4
3767                     ; 633 	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
3769  0297 ae0101        	ldw	x,#257
3770  029a cd0000        	call	_TIM1_ITConfig
3772                     ; 636 	TIM1_Cmd(ENABLE);
3774  029d a601          	ld	a,#1
3775  029f cd0000        	call	_TIM1_Cmd
3777                     ; 637 }
3780  02a2 81            	ret
3812                     ; 642 @far @interrupt void TIM1_UPD_IRQHandler (void)
3812                     ; 643 {
3814                     	switch	.text
3815  02a3               f_TIM1_UPD_IRQHandler:
3817  02a3 8a            	push	cc
3818  02a4 84            	pop	a
3819  02a5 a4bf          	and	a,#191
3820  02a7 88            	push	a
3821  02a8 86            	pop	cc
3822  02a9 3b0002        	push	c_x+2
3823  02ac be00          	ldw	x,c_x
3824  02ae 89            	pushw	x
3825  02af 3b0002        	push	c_y+2
3826  02b2 be00          	ldw	x,c_y
3827  02b4 89            	pushw	x
3830                     ; 645 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
3832  02b5 a601          	ld	a,#1
3833  02b7 cd0000        	call	_TIM1_ClearITPendingBit
3835                     ; 649 	if (flag_run == 0)
3837  02ba 3d0d          	tnz	_flag_run
3838  02bc 2735          	jreq	L05
3839                     ; 651 		return; // Sai da interrupção imediatamente.
3841                     ; 657 	if (fim_contagem_estado == 0)
3843  02be 3d0f          	tnz	_fim_contagem_estado
3844  02c0 2627          	jrne	L1122
3845                     ; 659 		contador_ms++;
3847  02c2 be0b          	ldw	x,_contador_ms
3848  02c4 1c0001        	addw	x,#1
3849  02c7 bf0b          	ldw	_contador_ms,x
3850                     ; 660 		if (contador_ms >= 1000) // 1 segundo se passou
3852  02c9 be0b          	ldw	x,_contador_ms
3853  02cb a303e8        	cpw	x,#1000
3854  02ce 2519          	jrult	L1122
3855                     ; 662 			contador_ms = 0;
3857  02d0 5f            	clrw	x
3858  02d1 bf0b          	ldw	_contador_ms,x
3859                     ; 663 			if (tempo_restante > 0)
3861  02d3 3d0a          	tnz	_tempo_restante
3862  02d5 2707          	jreq	L5122
3863                     ; 665 				tempo_restante--;
3865  02d7 3a0a          	dec	_tempo_restante
3866                     ; 666 				AtualizarDisplay(tempo_restante);
3868  02d9 b60a          	ld	a,_tempo_restante
3869  02db cd0388        	call	_AtualizarDisplay
3871  02de               L5122:
3872                     ; 669 			if (tempo_restante == 0) // Transição para a animação final
3874  02de 3d0a          	tnz	_tempo_restante
3875  02e0 2607          	jrne	L1122
3876                     ; 673 				fim_contagem_estado = 1;
3878  02e2 3501000f      	mov	_fim_contagem_estado,#1
3879                     ; 674 				contador_ms_sequencia = 0;
3881  02e6 5f            	clrw	x
3882  02e7 bf10          	ldw	_contador_ms_sequencia,x
3883  02e9               L1122:
3884                     ; 683 	if(fim_contagem_estado > 0)
3886  02e9 3d0f          	tnz	_fim_contagem_estado
3887  02eb 2706          	jreq	L1222
3888                     ; 687 					fim_contagem_estado = 0;
3890  02ed 3f0f          	clr	_fim_contagem_estado
3891                     ; 688 					flag_run = 0;
3893  02ef 3f0d          	clr	_flag_run
3894                     ; 689 					flag_start = 0;
3896  02f1 3f0e          	clr	_flag_start
3897  02f3               L1222:
3898                     ; 693 }
3899  02f3               L05:
3902  02f3 85            	popw	x
3903  02f4 bf00          	ldw	c_y,x
3904  02f6 320002        	pop	c_y+2
3905  02f9 85            	popw	x
3906  02fa bf00          	ldw	c_x,x
3907  02fc 320002        	pop	c_x+2
3908  02ff 80            	iret
3943                     ; 694 void WriteBCD(uint8_t valor)
3943                     ; 695 {
3945                     	switch	.text
3946  0300               _WriteBCD:
3948  0300 88            	push	a
3949       00000000      OFST:	set	0
3952                     ; 696 	(valor & 0x01) ? BCD_A_ON : BCD_A_OFF;
3954  0301 a501          	bcp	a,#1
3955  0303 270c          	jreq	L45
3956  0305 4b01          	push	#1
3957  0307 ae5005        	ldw	x,#20485
3958  030a cd0000        	call	_GPIO_WriteHigh
3960  030d 5b01          	addw	sp,#1
3961  030f 200a          	jra	L65
3962  0311               L45:
3963  0311 4b01          	push	#1
3964  0313 ae5005        	ldw	x,#20485
3965  0316 cd0000        	call	_GPIO_WriteLow
3967  0319 5b01          	addw	sp,#1
3968  031b               L65:
3969                     ; 697 	(valor & 0x02) ? BCD_B_ON : BCD_B_OFF;
3971  031b 7b01          	ld	a,(OFST+1,sp)
3972  031d a502          	bcp	a,#2
3973  031f 270c          	jreq	L06
3974  0321 4b02          	push	#2
3975  0323 ae5005        	ldw	x,#20485
3976  0326 cd0000        	call	_GPIO_WriteHigh
3978  0329 5b01          	addw	sp,#1
3979  032b 200a          	jra	L26
3980  032d               L06:
3981  032d 4b02          	push	#2
3982  032f ae5005        	ldw	x,#20485
3983  0332 cd0000        	call	_GPIO_WriteLow
3985  0335 5b01          	addw	sp,#1
3986  0337               L26:
3987                     ; 698 	(valor & 0x04) ? BCD_C_ON : BCD_C_OFF;
3989  0337 7b01          	ld	a,(OFST+1,sp)
3990  0339 a504          	bcp	a,#4
3991  033b 270c          	jreq	L46
3992  033d 4b04          	push	#4
3993  033f ae5005        	ldw	x,#20485
3994  0342 cd0000        	call	_GPIO_WriteHigh
3996  0345 5b01          	addw	sp,#1
3997  0347 200a          	jra	L66
3998  0349               L46:
3999  0349 4b04          	push	#4
4000  034b ae5005        	ldw	x,#20485
4001  034e cd0000        	call	_GPIO_WriteLow
4003  0351 5b01          	addw	sp,#1
4004  0353               L66:
4005                     ; 699 	(valor & 0x08) ? BCD_D_ON : BCD_D_OFF;
4007  0353 7b01          	ld	a,(OFST+1,sp)
4008  0355 a508          	bcp	a,#8
4009  0357 270c          	jreq	L07
4010  0359 4b08          	push	#8
4011  035b ae5005        	ldw	x,#20485
4012  035e cd0000        	call	_GPIO_WriteHigh
4014  0361 5b01          	addw	sp,#1
4015  0363 200a          	jra	L27
4016  0365               L07:
4017  0365 4b08          	push	#8
4018  0367 ae5005        	ldw	x,#20485
4019  036a cd0000        	call	_GPIO_WriteLow
4021  036d 5b01          	addw	sp,#1
4022  036f               L27:
4023                     ; 700 }
4026  036f 84            	pop	a
4027  0370 81            	ret
4128                     ; 702 void PulseLatch(GPIO_TypeDef* porta, uint8_t pino)
4128                     ; 703 {
4129                     	switch	.text
4130  0371               _PulseLatch:
4132  0371 89            	pushw	x
4133       00000000      OFST:	set	0
4136                     ; 704 	GPIO_WriteHigh(porta, pino);
4138  0372 7b05          	ld	a,(OFST+5,sp)
4139  0374 88            	push	a
4140  0375 cd0000        	call	_GPIO_WriteHigh
4142  0378 84            	pop	a
4143                     ; 705 	NOP(); NOP(); NOP(); NOP();
4146  0379 9d            nop
4151  037a 9d            nop
4156  037b 9d            nop
4161  037c 9d            nop
4163                     ; 706 	GPIO_WriteLow(porta, pino);
4165  037d 7b05          	ld	a,(OFST+5,sp)
4166  037f 88            	push	a
4167  0380 1e02          	ldw	x,(OFST+2,sp)
4168  0382 cd0000        	call	_GPIO_WriteLow
4170  0385 84            	pop	a
4171                     ; 707 }
4174  0386 85            	popw	x
4175  0387 81            	ret
4229                     ; 710 void AtualizarDisplay(uint8_t valor)
4229                     ; 711 {
4230                     	switch	.text
4231  0388               _AtualizarDisplay:
4233  0388 88            	push	a
4234  0389 89            	pushw	x
4235       00000002      OFST:	set	2
4238                     ; 712 	uint8_t unidades = valor % 10;
4240  038a 5f            	clrw	x
4241  038b 97            	ld	xl,a
4242  038c a60a          	ld	a,#10
4243  038e 62            	div	x,a
4244  038f 5f            	clrw	x
4245  0390 97            	ld	xl,a
4246  0391 9f            	ld	a,xl
4247  0392 6b01          	ld	(OFST-1,sp),a
4249                     ; 713 	uint8_t dezenas = valor / 10;
4251  0394 7b03          	ld	a,(OFST+1,sp)
4252  0396 5f            	clrw	x
4253  0397 97            	ld	xl,a
4254  0398 a60a          	ld	a,#10
4255  039a 62            	div	x,a
4256  039b 9f            	ld	a,xl
4257  039c 6b02          	ld	(OFST+0,sp),a
4259                     ; 715 	WriteBCD(unidades);
4261  039e 7b01          	ld	a,(OFST-1,sp)
4262  03a0 cd0300        	call	_WriteBCD
4264                     ; 716 	PulseLatch(LATCH_01_PORT, LATCH_01_PIN);
4266  03a3 4b10          	push	#16
4267  03a5 ae500a        	ldw	x,#20490
4268  03a8 adc7          	call	_PulseLatch
4270  03aa 84            	pop	a
4271                     ; 718 	WriteBCD(dezenas);
4273  03ab 7b02          	ld	a,(OFST+0,sp)
4274  03ad cd0300        	call	_WriteBCD
4276                     ; 719 	PulseLatch(LATCH_02_PORT, LATCH_02_PIN);
4278  03b0 4b20          	push	#32
4279  03b2 ae500a        	ldw	x,#20490
4280  03b5 adba          	call	_PulseLatch
4282  03b7 84            	pop	a
4283                     ; 720 }
4286  03b8 5b03          	addw	sp,#3
4287  03ba 81            	ret
4312                     ; 722 void ApagarDisplay(void)
4312                     ; 723 {
4313                     	switch	.text
4314  03bb               _ApagarDisplay:
4318                     ; 724 	BCD_A_ON;
4320  03bb 4b01          	push	#1
4321  03bd ae5005        	ldw	x,#20485
4322  03c0 cd0000        	call	_GPIO_WriteHigh
4324  03c3 84            	pop	a
4325                     ; 725 	BCD_B_ON;
4327  03c4 4b02          	push	#2
4328  03c6 ae5005        	ldw	x,#20485
4329  03c9 cd0000        	call	_GPIO_WriteHigh
4331  03cc 84            	pop	a
4332                     ; 726 	BCD_C_ON;
4334  03cd 4b04          	push	#4
4335  03cf ae5005        	ldw	x,#20485
4336  03d2 cd0000        	call	_GPIO_WriteHigh
4338  03d5 84            	pop	a
4339                     ; 727 	BCD_D_ON;
4341  03d6 4b08          	push	#8
4342  03d8 ae5005        	ldw	x,#20485
4343  03db cd0000        	call	_GPIO_WriteHigh
4345  03de 84            	pop	a
4346                     ; 728 	PulseLatch(LATCH_01_PORT,LATCH_01_PIN);
4348  03df 4b10          	push	#16
4349  03e1 ae500a        	ldw	x,#20490
4350  03e4 ad8b          	call	_PulseLatch
4352  03e6 84            	pop	a
4353                     ; 729 	PulseLatch(LATCH_02_PORT,LATCH_02_PIN);
4355  03e7 4b20          	push	#32
4356  03e9 ae500a        	ldw	x,#20490
4357  03ec ad83          	call	_PulseLatch
4359  03ee 84            	pop	a
4360                     ; 730 }
4363  03ef 81            	ret
4389                     ; 732 void PiscaDisplay(void)
4389                     ; 733 {
4390                     	switch	.text
4391  03f0               _PiscaDisplay:
4395                     ; 734 	AtualizarDisplay(0);
4397  03f0 4f            	clr	a
4398  03f1 ad95          	call	_AtualizarDisplay
4400                     ; 735 	Delay(200000);
4402  03f3 ae0d40        	ldw	x,#3392
4403  03f6 89            	pushw	x
4404  03f7 ae0003        	ldw	x,#3
4405  03fa 89            	pushw	x
4406  03fb cd0210        	call	_Delay
4408  03fe 5b04          	addw	sp,#4
4409                     ; 736 	ApagarDisplay();
4411  0400 adb9          	call	_ApagarDisplay
4413                     ; 737 	Delay(200000);
4415  0402 ae0d40        	ldw	x,#3392
4416  0405 89            	pushw	x
4417  0406 ae0003        	ldw	x,#3
4418  0409 89            	pushw	x
4419  040a cd0210        	call	_Delay
4421  040d 5b04          	addw	sp,#4
4422                     ; 738 	AtualizarDisplay(0);
4424  040f 4f            	clr	a
4425  0410 cd0388        	call	_AtualizarDisplay
4427                     ; 739 	Delay(200000);
4429  0413 ae0d40        	ldw	x,#3392
4430  0416 89            	pushw	x
4431  0417 ae0003        	ldw	x,#3
4432  041a 89            	pushw	x
4433  041b cd0210        	call	_Delay
4435  041e 5b04          	addw	sp,#4
4436                     ; 740 	ApagarDisplay();
4438  0420 ad99          	call	_ApagarDisplay
4440                     ; 741 	Delay(200000);
4442  0422 ae0d40        	ldw	x,#3392
4443  0425 89            	pushw	x
4444  0426 ae0003        	ldw	x,#3
4445  0429 89            	pushw	x
4446  042a cd0210        	call	_Delay
4448  042d 5b04          	addw	sp,#4
4449                     ; 742 	AtualizarDisplay(0);
4451  042f 4f            	clr	a
4452  0430 cd0388        	call	_AtualizarDisplay
4454                     ; 743 }
4457  0433 81            	ret
4625                     	xdef	f_TIM1_UPD_IRQHandler
4626                     	xdef	f_TIM6_UPD_IRQHandler
4627                     	xdef	_main
4628                     	xdef	_PiscaDisplay
4629                     	xdef	_AtualizarDisplay
4630                     	xdef	_PulseLatch
4631                     	xdef	_WriteBCD
4632                     	xdef	_BuzzerBeep
4633                     	xdef	_searchCode
4634                     	xdef	_save_code_to_eeprom
4635                     	xdef	_UnlockE2prom
4636                     	xdef	_TIM1_Config
4637                     	xdef	_onInt_TM6
4638                     	xdef	_ApagarDisplay
4639                     	xdef	_BOT_PAUSE
4640                     	xdef	_BOT_24S
4641                     	xdef	_BOT_14S
4642                     	xdef	_SetCLK
4643                     	xdef	_Delay
4644                     	xdef	_InitGPIO
4645                     	xdef	_contador_ms_sequencia
4646                     	xdef	_fim_contagem_estado
4647                     	xdef	_flag_start
4648                     	xdef	_flag_run
4649                     	xdef	_contador_ms
4650                     	xdef	_tempo_restante
4651                     .eeprom:	section	.data
4652  0000               _codControler:
4653  0000 00000000      	ds.b	4
4654                     	xdef	_codControler
4655                     	xdef	_rf_cooldown
4656                     	xdef	_debounceCh2
4657                     	xdef	_debounceCh1
4658                     	xdef	_RF_IN_ON
4659                     	xdef	_led3State
4660                     	xdef	_led2State
4661                     	xdef	_led1State
4662                     	xref	_Read_RF_6P20
4663                     	xref.b	_Code_Ready
4664                     	xref.b	_HT_RC_Code_Ready_Overwrite
4665                     	xref.b	_RF_CopyBuffer
4666                     	xref	_TIM1_ClearITPendingBit
4667                     	xref	_TIM1_ITConfig
4668                     	xref	_TIM1_Cmd
4669                     	xref	_TIM1_TimeBaseInit
4670                     	xref	_TIM1_DeInit
4671                     	xref	_ITC_SetSoftwarePriority
4672                     	xref	_GPIO_ReadInputPin
4673                     	xref	_GPIO_WriteLow
4674                     	xref	_GPIO_WriteHigh
4675                     	xref	_GPIO_Init
4676                     	xref	_FLASH_Unlock
4677                     	xref	_CLK_PeripheralClockConfig
4678                     	xref.b	c_lreg
4679                     	xref.b	c_x
4680                     	xref.b	c_y
4700                     	xref	c_lzmp
4701                     	xref	c_lgsbc
4702                     	xref	c_uitolx
4703                     	xref	c_eewrc
4704                     	end
