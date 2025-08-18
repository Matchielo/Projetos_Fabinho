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
2672                     ; 173 main()
2672                     ; 174 {
2674                     	switch	.text
2675  0000               _main:
2677  0000 89            	pushw	x
2678       00000002      OFST:	set	2
2681                     ; 175 		SetCLK();        // Ajusta clock para 16 MHz (máxima velocidade ? leitura RF mais precisa)
2683  0001 cd022c        	call	_SetCLK
2685                     ; 176     InitGPIO();      // Configura entradas e saídas
2687  0004 cd01c9        	call	_InitGPIO
2689                     ; 177     UnlockE2prom();  // Permite gravação na EEPROM
2691  0007 cd0231        	call	_UnlockE2prom
2693                     ; 178     onInt_TM6();     // Ativa Timer 6 para interrupção periódica usada na leitura RF
2695  000a cd0237        	call	_onInt_TM6
2697                     ; 179 		TIM1_Config();
2699  000d cd0285        	call	_TIM1_Config
2701                     ; 180 		ITC_SetSoftwarePriority(ITC_IRQ_TIM1_OVF, ITC_PRIORITYLEVEL_1);
2703  0010 ae0b01        	ldw	x,#2817
2704  0013 cd0000        	call	_ITC_SetSoftwarePriority
2706                     ; 182 		enableInterrupts();	
2709  0016 9a            rim
2711                     ; 186 		InitDisplay();
2714  0017 cd03e2        	call	_InitDisplay
2716                     ; 190     if (readCh1 == 0)
2718  001a 4b80          	push	#128
2719  001c ae5005        	ldw	x,#20485
2720  001f cd0000        	call	_GPIO_ReadInputPin
2722  0022 5b01          	addw	sp,#1
2723  0024 4d            	tnz	a
2724  0025 2627          	jrne	L7071
2725                     ; 193         Delay(100); // Debounce simples
2727  0027 ae0064        	ldw	x,#100
2728  002a 89            	pushw	x
2729  002b ae0000        	ldw	x,#0
2730  002e 89            	pushw	x
2731  002f cd0217        	call	_Delay
2733  0032 5b04          	addw	sp,#4
2734                     ; 194         for (i = 0; i < 4; i++)
2736  0034 5f            	clrw	x
2737  0035 1f01          	ldw	(OFST-1,sp),x
2739  0037               L1071:
2740                     ; 196             codControler[i] = 0x00; // Apaga todos os códigos RF da EEPROM
2742  0037 1e01          	ldw	x,(OFST-1,sp)
2743  0039 4f            	clr	a
2744  003a 1c0000        	addw	x,#_codControler
2745  003d cd0000        	call	c_eewrc
2747                     ; 194         for (i = 0; i < 4; i++)
2749  0040 1e01          	ldw	x,(OFST-1,sp)
2750  0042 1c0001        	addw	x,#1
2751  0045 1f01          	ldw	(OFST-1,sp),x
2755  0047 1e01          	ldw	x,(OFST-1,sp)
2756  0049 a30004        	cpw	x,#4
2757  004c 25e9          	jrult	L1071
2758  004e               L7071:
2759                     ; 206         if (rf_cooldown > 0)
2761  004e be08          	ldw	x,_rf_cooldown
2762  0050 2707          	jreq	L3171
2763                     ; 208             rf_cooldown--;
2765  0052 be08          	ldw	x,_rf_cooldown
2766  0054 1d0001        	subw	x,#1
2767  0057 bf08          	ldw	_rf_cooldown,x
2768  0059               L3171:
2769                     ; 211         RF_IN_ON = TRUE; // Habilita leitura RF na leitura da interrupção
2771  0059 35010003      	mov	_RF_IN_ON,#1
2772                     ; 212         HT_RC_Code_Ready_Overwrite = FALSE; // Reseta flag do protocolo RF
2774  005d 3f00          	clr	_HT_RC_Code_Ready_Overwrite
2775                     ; 217         if (readCh1 == 0)
2777  005f 4b80          	push	#128
2778  0061 ae5005        	ldw	x,#20485
2779  0064 cd0000        	call	_GPIO_ReadInputPin
2781  0067 5b01          	addw	sp,#1
2782  0069 4d            	tnz	a
2783  006a 2649          	jrne	L5171
2784                     ; 219             if (++debounceCh1 >= 250)
2786  006c be04          	ldw	x,_debounceCh1
2787  006e 1c0001        	addw	x,#1
2788  0071 bf04          	ldw	_debounceCh1,x
2789  0073 a300fa        	cpw	x,#250
2790  0076 2540          	jrult	L5271
2791                     ; 221                 --debounceCh1;
2793  0078 be04          	ldw	x,_debounceCh1
2794  007a 1d0001        	subw	x,#1
2795  007d bf04          	ldw	_debounceCh1,x
2796                     ; 224 							Delay(50000);
2798  007f aec350        	ldw	x,#50000
2799  0082 89            	pushw	x
2800  0083 ae0000        	ldw	x,#0
2801  0086 89            	pushw	x
2802  0087 cd0217        	call	_Delay
2804  008a 5b04          	addw	sp,#4
2805                     ; 226                 if (Code_Ready == TRUE)
2807  008c b600          	ld	a,_Code_Ready
2808  008e a101          	cp	a,#1
2809  0090 2614          	jrne	L1271
2810                     ; 228                     save_code_to_eeprom(); // Salva o código recebido.
2812  0092 cd014f        	call	_save_code_to_eeprom
2814                     ; 229                     Code_Ready = FALSE;
2816  0095 3f00          	clr	_Code_Ready
2817                     ; 232                     Delay(200000);
2819  0097 ae0d40        	ldw	x,#3392
2820  009a 89            	pushw	x
2821  009b ae0003        	ldw	x,#3
2822  009e 89            	pushw	x
2823  009f cd0217        	call	_Delay
2825  00a2 5b04          	addw	sp,#4
2827  00a4 2012          	jra	L5271
2828  00a6               L1271:
2829                     ; 236                     Delay(100000);
2831  00a6 ae86a0        	ldw	x,#34464
2832  00a9 89            	pushw	x
2833  00aa ae0001        	ldw	x,#1
2834  00ad 89            	pushw	x
2835  00ae cd0217        	call	_Delay
2837  00b1 5b04          	addw	sp,#4
2838  00b3 2003          	jra	L5271
2839  00b5               L5171:
2840                     ; 242             debounceCh1 = 0;	// Reseta o contador se o botão for solto.
2842  00b5 5f            	clrw	x
2843  00b6 bf04          	ldw	_debounceCh1,x
2844  00b8               L5271:
2845                     ; 246         if (Code_Ready == TRUE && rf_cooldown == 0)
2847  00b8 b600          	ld	a,_Code_Ready
2848  00ba a101          	cp	a,#1
2849  00bc 2610          	jrne	L7271
2851  00be be08          	ldw	x,_rf_cooldown
2852  00c0 260c          	jrne	L7271
2853                     ; 248             searchCode(); // Busca código na EEPROM e executa a ação
2855  00c2 cd0172        	call	_searchCode
2857                     ; 249             Code_Ready = FALSE;	// Reseta a flag para o próximo comando.
2859  00c5 3f00          	clr	_Code_Ready
2860                     ; 252             rf_cooldown = 3000;
2862  00c7 ae0bb8        	ldw	x,#3000
2863  00ca bf08          	ldw	_rf_cooldown,x
2865  00cc 2080          	jra	L7071
2866  00ce               L7271:
2867                     ; 254         else if (Code_Ready == TRUE && rf_cooldown > 0)
2869  00ce b600          	ld	a,_Code_Ready
2870  00d0 a101          	cp	a,#1
2871  00d2 26f8          	jrne	L7071
2873  00d4 be08          	ldw	x,_rf_cooldown
2874  00d6 27f4          	jreq	L7071
2875                     ; 257             Code_Ready = FALSE;
2877  00d8 3f00          	clr	_Code_Ready
2878  00da cc004e        	jra	L7071
2907                     ; 280 void BOT_14S(void)
2907                     ; 281 {
2908                     	switch	.text
2909  00dd               _BOT_14S:
2913                     ; 282 	tempo_restante = 14;						// Define o tempo inicial da contagem.
2915  00dd 350e000a      	mov	_tempo_restante,#14
2916                     ; 283 	contador_ms = 0;								// Zera o contador de mls para um novo segundo inicial.
2918  00e1 5f            	clrw	x
2919  00e2 bf0b          	ldw	_contador_ms,x
2920                     ; 284 	fim_contagem_estado = 0;        // Cancela qualquer animação final que esteja ocorrendo
2922  00e4 3f0f          	clr	_fim_contagem_estado
2923                     ; 285 	flag_start = 1;                 // Habilita o botão de pause
2925  00e6 3501000e      	mov	_flag_start,#1
2926                     ; 286 	flag_run = 1;                   // Inicia a contagem na ISR
2928  00ea 3501000d      	mov	_flag_run,#1
2929                     ; 288 	AtualizarDisplay(tempo_restante);
2931  00ee b60a          	ld	a,_tempo_restante
2932  00f0 cd03af        	call	_AtualizarDisplay
2934                     ; 289 }
2937  00f3 81            	ret
2966                     ; 304 void BOT_24S(void)
2966                     ; 305 {
2967                     	switch	.text
2968  00f4               _BOT_24S:
2972                     ; 306 	tempo_restante = 24;						// Define o tempo inicial da contagem.
2974  00f4 3518000a      	mov	_tempo_restante,#24
2975                     ; 307 	contador_ms = 0;								// Zera o contador de mls para um novo segundo inicial.
2977  00f8 5f            	clrw	x
2978  00f9 bf0b          	ldw	_contador_ms,x
2979                     ; 308 	fim_contagem_estado = 0;        // Cancela qualquer animação final que esteja ocorrendo
2981  00fb 3f0f          	clr	_fim_contagem_estado
2982                     ; 309 	flag_start = 1;                 // Habilita o botão de pause
2984  00fd 3501000e      	mov	_flag_start,#1
2985                     ; 310 	flag_run = 1;                   // Inicia a contagem na ISR
2987  0101 3501000d      	mov	_flag_run,#1
2988                     ; 312 	AtualizarDisplay(tempo_restante);
2990  0105 b60a          	ld	a,_tempo_restante
2991  0107 cd03af        	call	_AtualizarDisplay
2993                     ; 313 }
2996  010a 81            	ret
3023                     ; 328 void BOT_PAUSE(void)
3023                     ; 329 {
3024                     	switch	.text
3025  010b               _BOT_PAUSE:
3029                     ; 331 	if (flag_start == 1)
3031  010b b60e          	ld	a,_flag_start
3032  010d a101          	cp	a,#1
3033  010f 2618          	jrne	L5671
3034                     ; 334 		flag_run = !flag_run;
3036  0111 3d0d          	tnz	_flag_run
3037  0113 2604          	jrne	L41
3038  0115 a601          	ld	a,#1
3039  0117 2001          	jra	L61
3040  0119               L41:
3041  0119 4f            	clr	a
3042  011a               L61:
3043  011a b70d          	ld	_flag_run,a
3044                     ; 337 		if (flag_run == 0 && fim_contagem_estado > 0)
3046  011c 3d0d          	tnz	_flag_run
3047  011e 2609          	jrne	L5671
3049  0120 3d0f          	tnz	_fim_contagem_estado
3050  0122 2705          	jreq	L5671
3051                     ; 339 			BuzzerBeep(100000);
3053  0124 ae86a0        	ldw	x,#34464
3054  0127 ad01          	call	_BuzzerBeep
3056  0129               L5671:
3057                     ; 342 }
3060  0129 81            	ret
3097                     ; 361 void BuzzerBeep(uint16_t duration)
3097                     ; 362 {
3098                     	switch	.text
3099  012a               _BuzzerBeep:
3101  012a 89            	pushw	x
3102       00000000      OFST:	set	0
3105                     ; 363     BUZZER_ON;
3107  012b 4b01          	push	#1
3108  012d ae500f        	ldw	x,#20495
3109  0130 cd0000        	call	_GPIO_WriteHigh
3111  0133 84            	pop	a
3112                     ; 364     Delay(duration);
3114  0134 1e01          	ldw	x,(OFST+1,sp)
3115  0136 cd0000        	call	c_uitolx
3117  0139 be02          	ldw	x,c_lreg+2
3118  013b 89            	pushw	x
3119  013c be00          	ldw	x,c_lreg
3120  013e 89            	pushw	x
3121  013f cd0217        	call	_Delay
3123  0142 5b04          	addw	sp,#4
3124                     ; 365     BUZZER_OFF;
3126  0144 4b01          	push	#1
3127  0146 ae500f        	ldw	x,#20495
3128  0149 cd0000        	call	_GPIO_WriteLow
3130  014c 84            	pop	a
3131                     ; 366 }
3134  014d 85            	popw	x
3135  014e 81            	ret
3172                     ; 382 void save_code_to_eeprom(void)
3172                     ; 383 {
3173                     	switch	.text
3174  014f               _save_code_to_eeprom:
3176  014f 89            	pushw	x
3177       00000002      OFST:	set	2
3180                     ; 384     int i = 0;
3182                     ; 385     codControler[i]     = RF_CopyBuffer[0];
3184  0150 b600          	ld	a,_RF_CopyBuffer
3185  0152 ae0000        	ldw	x,#_codControler
3186  0155 cd0000        	call	c_eewrc
3188                     ; 386     codControler[i + 1] = RF_CopyBuffer[1];
3190  0158 b601          	ld	a,_RF_CopyBuffer+1
3191  015a ae0001        	ldw	x,#_codControler+1
3192  015d cd0000        	call	c_eewrc
3194                     ; 387     codControler[i + 2] = RF_CopyBuffer[2];
3196  0160 b602          	ld	a,_RF_CopyBuffer+2
3197  0162 ae0002        	ldw	x,#_codControler+2
3198  0165 cd0000        	call	c_eewrc
3200                     ; 388     codControler[i + 3] = RF_CopyBuffer[3];
3202  0168 b603          	ld	a,_RF_CopyBuffer+3
3203  016a ae0003        	ldw	x,#_codControler+3
3204  016d cd0000        	call	c_eewrc
3206                     ; 389 }
3209  0170 85            	popw	x
3210  0171 81            	ret
3268                     ; 411 uint8_t searchCode(void)
3268                     ; 412 {
3269                     	switch	.text
3270  0172               _searchCode:
3272  0172 5204          	subw	sp,#4
3273       00000004      OFST:	set	4
3276                     ; 413     int i = 0;
3278                     ; 418     id_salvo_mascarado    = codControler[i + 2] & 0xFC;
3280  0174 c60002        	ld	a,_codControler+2
3281  0177 a4fc          	and	a,#252
3282  0179 6b03          	ld	(OFST-1,sp),a
3284                     ; 419     id_recebido_mascarado = RF_CopyBuffer[2]  & 0xFC;
3286  017b b602          	ld	a,_RF_CopyBuffer+2
3287  017d a4fc          	and	a,#252
3288  017f 6b04          	ld	(OFST+0,sp),a
3290                     ; 422     if (codControler[i]     == RF_CopyBuffer[0] && 
3290                     ; 423         codControler[i + 1] == RF_CopyBuffer[1] &&
3290                     ; 424         id_salvo_mascarado  == id_recebido_mascarado && // Compara usando a máscara
3290                     ; 425         codControler[i + 3] == RF_CopyBuffer[3])
3292  0181 c60000        	ld	a,_codControler
3293  0184 b100          	cp	a,_RF_CopyBuffer
3294  0186 263c          	jrne	L3502
3296  0188 c60001        	ld	a,_codControler+1
3297  018b b101          	cp	a,_RF_CopyBuffer+1
3298  018d 2635          	jrne	L3502
3300  018f 7b03          	ld	a,(OFST-1,sp)
3301  0191 1104          	cp	a,(OFST+0,sp)
3302  0193 262f          	jrne	L3502
3304  0195 c60003        	ld	a,_codControler+3
3305  0198 b103          	cp	a,_RF_CopyBuffer+3
3306  019a 2628          	jrne	L3502
3307                     ; 429         if ((RF_CopyBuffer[2] & 0x03) == 0x01) // Tecla 1
3309  019c b602          	ld	a,_RF_CopyBuffer+2
3310  019e a403          	and	a,#3
3311  01a0 a101          	cp	a,#1
3312  01a2 2605          	jrne	L5502
3313                     ; 431             BOT_14S();
3315  01a4 cd00dd        	call	_BOT_14S
3318  01a7 2018          	jra	L7502
3319  01a9               L5502:
3320                     ; 434         else if ((RF_CopyBuffer[2] & 0x03) == 0x02) // Tecla 2
3322  01a9 b602          	ld	a,_RF_CopyBuffer+2
3323  01ab a403          	and	a,#3
3324  01ad a102          	cp	a,#2
3325  01af 2605          	jrne	L1602
3326                     ; 436             BOT_24S();
3328  01b1 cd00f4        	call	_BOT_24S
3331  01b4 200b          	jra	L7502
3332  01b6               L1602:
3333                     ; 439         else if ((RF_CopyBuffer[2] & 0x03) == 0x03) // Tecla 3 (ou 4 dependendo do controle)
3335  01b6 b602          	ld	a,_RF_CopyBuffer+2
3336  01b8 a403          	and	a,#3
3337  01ba a103          	cp	a,#3
3338  01bc 2603          	jrne	L7502
3339                     ; 441             BOT_PAUSE();
3341  01be cd010b        	call	_BOT_PAUSE
3343  01c1               L7502:
3344                     ; 445         return 0; // Código encontrado e ação executada
3346  01c1 4f            	clr	a
3348  01c2 2002          	jra	L62
3349  01c4               L3502:
3350                     ; 451         return 1;
3352  01c4 a601          	ld	a,#1
3354  01c6               L62:
3356  01c6 5b04          	addw	sp,#4
3357  01c8 81            	ret
3381                     ; 470 void InitGPIO(void)
3381                     ; 471 {
3382                     	switch	.text
3383  01c9               _InitGPIO:
3387                     ; 473     GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); // Botão CH1
3389  01c9 4b40          	push	#64
3390  01cb 4b80          	push	#128
3391  01cd ae5005        	ldw	x,#20485
3392  01d0 cd0000        	call	_GPIO_Init
3394  01d3 85            	popw	x
3395                     ; 474     GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // Botão CH2
3397  01d4 4b40          	push	#64
3398  01d6 4b10          	push	#16
3399  01d8 ae5019        	ldw	x,#20505
3400  01db cd0000        	call	_GPIO_Init
3402  01de 85            	popw	x
3403                     ; 477     GPIO_Init(GPIOA, GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PA2: Display | PA3: PWM buzzer
3405  01df 4be0          	push	#224
3406  01e1 4b0c          	push	#12
3407  01e3 ae5000        	ldw	x,#20480
3408  01e6 cd0000        	call	_GPIO_Init
3410  01e9 85            	popw	x
3411                     ; 478     GPIO_Init(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PB0~PB3: BCD/7Seg
3413  01ea 4be0          	push	#224
3414  01ec 4b0f          	push	#15
3415  01ee ae5005        	ldw	x,#20485
3416  01f1 cd0000        	call	_GPIO_Init
3418  01f4 85            	popw	x
3419                     ; 479     GPIO_Init(GPIOC, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch
3421  01f5 4be0          	push	#224
3422  01f7 4bfe          	push	#254
3423  01f9 ae500a        	ldw	x,#20490
3424  01fc cd0000        	call	_GPIO_Init
3426  01ff 85            	popw	x
3427                     ; 480     GPIO_Init(GPIOD, GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
3429  0200 4be0          	push	#224
3430  0202 4bfd          	push	#253
3431  0204 ae500f        	ldw	x,#20495
3432  0207 cd0000        	call	_GPIO_Init
3434  020a 85            	popw	x
3435                     ; 481     GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch 0
3437  020b 4be0          	push	#224
3438  020d 4b20          	push	#32
3439  020f ae5014        	ldw	x,#20500
3440  0212 cd0000        	call	_GPIO_Init
3442  0215 85            	popw	x
3443                     ; 482 }
3446  0216 81            	ret
3480                     ; 499 void Delay(uint32_t nCount)
3480                     ; 500 {
3481                     	switch	.text
3482  0217               _Delay:
3484       00000000      OFST:	set	0
3487  0217 2009          	jra	L1212
3488  0219               L7112:
3489                     ; 503         nCount--;
3491  0219 96            	ldw	x,sp
3492  021a 1c0003        	addw	x,#OFST+3
3493  021d a601          	ld	a,#1
3494  021f cd0000        	call	c_lgsbc
3496  0222               L1212:
3497                     ; 501     while (nCount != 0)
3499  0222 96            	ldw	x,sp
3500  0223 1c0003        	addw	x,#OFST+3
3501  0226 cd0000        	call	c_lzmp
3503  0229 26ee          	jrne	L7112
3504                     ; 505 }
3507  022b 81            	ret
3531                     ; 521 void SetCLK(void)
3531                     ; 522 {
3532                     	switch	.text
3533  022c               _SetCLK:
3537                     ; 523     CLK_CKDIVR = 0b00000000; // Sem divisão, máxima frequência
3539  022c 725f50c6      	clr	_CLK_CKDIVR
3540                     ; 524 }
3543  0230 81            	ret
3567                     ; 541 void UnlockE2prom(void)
3567                     ; 542 {
3568                     	switch	.text
3569  0231               _UnlockE2prom:
3573                     ; 543     FLASH_Unlock(FLASH_MEMTYPE_DATA);
3575  0231 a6f7          	ld	a,#247
3576  0233 cd0000        	call	_FLASH_Unlock
3578                     ; 544 }
3581  0236 81            	ret
3610                     ; 564 void onInt_TM6(void)
3610                     ; 565 {
3611                     	switch	.text
3612  0237               _onInt_TM6:
3616                     ; 566     TIM6_CR1  = 0b00000001; // Liga Timer 6
3618  0237 35015340      	mov	_TIM6_CR1,#1
3619                     ; 567     TIM6_IER  = 0b00000001; // Habilita interrupção
3621  023b 35015343      	mov	_TIM6_IER,#1
3622                     ; 568     TIM6_CNTR = 0b00000001; // Inicializa contador
3624  023f 35015346      	mov	_TIM6_CNTR,#1
3625                     ; 569     TIM6_ARR  = 0b00000001; // Valor inicial do ARR
3627  0243 35015348      	mov	_TIM6_ARR,#1
3628                     ; 570     TIM6_SR   = 0b00000001; // Limpa flag de status
3630  0247 35015344      	mov	_TIM6_SR,#1
3631                     ; 571     TIM6_PSCR = 0b00000010; // Prescaler
3633  024b 35025347      	mov	_TIM6_PSCR,#2
3634                     ; 572     TIM6_ARR  = 198;        // Valor para gerar 50us (com 16MHz)
3636  024f 35c65348      	mov	_TIM6_ARR,#198
3637                     ; 573     TIM6_IER  |= 0x00;
3639  0253 c65343        	ld	a,_TIM6_IER
3640                     ; 574     TIM6_CR1  |= 0x00;
3642  0256 c65340        	ld	a,_TIM6_CR1
3643                     ; 576     RIM             // Habilita interrupções globais
3646  0259 9a            RIM             // Habilita interrupções globais
3648                     ; 578 }
3651  025a 81            	ret
3678                     ; 598 @far @interrupt void TIM6_UPD_IRQHandler (void)
3678                     ; 599 {
3680                     	switch	.text
3681  025b               f_TIM6_UPD_IRQHandler:
3683  025b 8a            	push	cc
3684  025c 84            	pop	a
3685  025d a4bf          	and	a,#191
3686  025f 88            	push	a
3687  0260 86            	pop	cc
3688  0261 3b0002        	push	c_x+2
3689  0264 be00          	ldw	x,c_x
3690  0266 89            	pushw	x
3691  0267 3b0002        	push	c_y+2
3692  026a be00          	ldw	x,c_y
3693  026c 89            	pushw	x
3696                     ; 600     if(RF_IN_ON)
3698  026d 3d03          	tnz	_RF_IN_ON
3699  026f 2703          	jreq	L5612
3700                     ; 602         Read_RF_6P20(); // Decodifica sinal RF recebido pela antena
3702  0271 cd0000        	call	_Read_RF_6P20
3704  0274               L5612:
3705                     ; 604     TIM6_SR = 0;
3707  0274 725f5344      	clr	_TIM6_SR
3708                     ; 605 }
3711  0278 85            	popw	x
3712  0279 bf00          	ldw	c_y,x
3713  027b 320002        	pop	c_y+2
3714  027e 85            	popw	x
3715  027f bf00          	ldw	c_x,x
3716  0281 320002        	pop	c_x+2
3717  0284 80            	iret
3744                     ; 609 void TIM1_Config(void)
3744                     ; 610 {
3746                     	switch	.text
3747  0285               _TIM1_Config:
3751                     ; 612 	TIM1_DeInit();
3753  0285 cd0000        	call	_TIM1_DeInit
3755                     ; 616 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
3757  0288 ae0701        	ldw	x,#1793
3758  028b cd0000        	call	_CLK_PeripheralClockConfig
3760                     ; 627 	TIM1_TimeBaseInit(128, TIM1_COUNTERMODE_UP, 124, 0);
3762  028e 4b00          	push	#0
3763  0290 ae007c        	ldw	x,#124
3764  0293 89            	pushw	x
3765  0294 4b00          	push	#0
3766  0296 ae0080        	ldw	x,#128
3767  0299 cd0000        	call	_TIM1_TimeBaseInit
3769  029c 5b04          	addw	sp,#4
3770                     ; 630 	TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
3772  029e ae0101        	ldw	x,#257
3773  02a1 cd0000        	call	_TIM1_ITConfig
3775                     ; 633 	TIM1_Cmd(ENABLE);
3777  02a4 a601          	ld	a,#1
3778  02a6 cd0000        	call	_TIM1_Cmd
3780                     ; 634 }
3783  02a9 81            	ret
3818                     ; 639 @far @interrupt void TIM1_UPD_IRQHandler (void)
3818                     ; 640 {
3820                     	switch	.text
3821  02aa               f_TIM1_UPD_IRQHandler:
3823  02aa 8a            	push	cc
3824  02ab 84            	pop	a
3825  02ac a4bf          	and	a,#191
3826  02ae 88            	push	a
3827  02af 86            	pop	cc
3828  02b0 3b0002        	push	c_x+2
3829  02b3 be00          	ldw	x,c_x
3830  02b5 89            	pushw	x
3831  02b6 3b0002        	push	c_y+2
3832  02b9 be00          	ldw	x,c_y
3833  02bb 89            	pushw	x
3836                     ; 642 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
3838  02bc a601          	ld	a,#1
3839  02be cd0000        	call	_TIM1_ClearITPendingBit
3841                     ; 646 	if (flag_run == 0)
3843  02c1 3d0d          	tnz	_flag_run
3844  02c3 2754          	jreq	L05
3845                     ; 648 		return; // Sai da interrupção imediatamente.
3847                     ; 654 	if (fim_contagem_estado == 0)
3849  02c5 3d0f          	tnz	_fim_contagem_estado
3850  02c7 2646          	jrne	L1122
3851                     ; 656 		contador_ms++;
3853  02c9 be0b          	ldw	x,_contador_ms
3854  02cb 1c0001        	addw	x,#1
3855  02ce bf0b          	ldw	_contador_ms,x
3856                     ; 657 		if (contador_ms >= 1000) // 1 segundo se passou
3858  02d0 be0b          	ldw	x,_contador_ms
3859  02d2 a303e8        	cpw	x,#1000
3860  02d5 2538          	jrult	L1122
3861                     ; 659 			contador_ms = 0;
3863  02d7 5f            	clrw	x
3864  02d8 bf0b          	ldw	_contador_ms,x
3865                     ; 660 			if (tempo_restante > 0)
3867  02da 3d0a          	tnz	_tempo_restante
3868  02dc 2707          	jreq	L5122
3869                     ; 662 				tempo_restante--;
3871  02de 3a0a          	dec	_tempo_restante
3872                     ; 663 				AtualizarDisplay(tempo_restante);
3874  02e0 b60a          	ld	a,_tempo_restante
3875  02e2 cd03af        	call	_AtualizarDisplay
3877  02e5               L5122:
3878                     ; 666 			if (tempo_restante == 0) // Transição para a animação final
3880  02e5 3d0a          	tnz	_tempo_restante
3881  02e7 2626          	jrne	L1122
3882                     ; 670 				fim_contagem_estado = 1;
3884  02e9 3501000f      	mov	_fim_contagem_estado,#1
3885                     ; 671 				contador_ms_sequencia = 0;
3887  02ed 5f            	clrw	x
3888  02ee bf10          	ldw	_contador_ms_sequencia,x
3889                     ; 672 				BUZZER_ON;
3891  02f0 4b01          	push	#1
3892  02f2 ae500f        	ldw	x,#20495
3893  02f5 cd0000        	call	_GPIO_WriteHigh
3895  02f8 84            	pop	a
3896                     ; 673 				Delay(400000);
3898  02f9 ae1a80        	ldw	x,#6784
3899  02fc 89            	pushw	x
3900  02fd ae0006        	ldw	x,#6
3901  0300 89            	pushw	x
3902  0301 cd0217        	call	_Delay
3904  0304 5b04          	addw	sp,#4
3905                     ; 674 				BUZZER_OFF;
3907  0306 4b01          	push	#1
3908  0308 ae500f        	ldw	x,#20495
3909  030b cd0000        	call	_GPIO_WriteLow
3911  030e 84            	pop	a
3912  030f               L1122:
3913                     ; 680 	if(fim_contagem_estado > 0)
3915  030f 3d0f          	tnz	_fim_contagem_estado
3916  0311 2706          	jreq	L1222
3917                     ; 684 					fim_contagem_estado = 0;
3919  0313 3f0f          	clr	_fim_contagem_estado
3920                     ; 685 					flag_run = 0;
3922  0315 3f0d          	clr	_flag_run
3923                     ; 686 					flag_start = 0;
3925  0317 3f0e          	clr	_flag_start
3926  0319               L1222:
3927                     ; 690 }
3928  0319               L05:
3931  0319 85            	popw	x
3932  031a bf00          	ldw	c_y,x
3933  031c 320002        	pop	c_y+2
3934  031f 85            	popw	x
3935  0320 bf00          	ldw	c_x,x
3936  0322 320002        	pop	c_x+2
3937  0325 80            	iret
3972                     ; 691 void WriteBCD(uint8_t valor)
3972                     ; 692 {
3974                     	switch	.text
3975  0326               _WriteBCD:
3977  0326 88            	push	a
3978       00000000      OFST:	set	0
3981                     ; 693 	(valor & 0x01) ? BCD_A_ON : BCD_A_OFF;
3983  0327 a501          	bcp	a,#1
3984  0329 270c          	jreq	L45
3985  032b 4b01          	push	#1
3986  032d ae5005        	ldw	x,#20485
3987  0330 cd0000        	call	_GPIO_WriteHigh
3989  0333 5b01          	addw	sp,#1
3990  0335 200a          	jra	L65
3991  0337               L45:
3992  0337 4b01          	push	#1
3993  0339 ae5005        	ldw	x,#20485
3994  033c cd0000        	call	_GPIO_WriteLow
3996  033f 5b01          	addw	sp,#1
3997  0341               L65:
3998                     ; 694 	(valor & 0x02) ? BCD_B_ON : BCD_B_OFF;
4000  0341 7b01          	ld	a,(OFST+1,sp)
4001  0343 a502          	bcp	a,#2
4002  0345 270c          	jreq	L06
4003  0347 4b02          	push	#2
4004  0349 ae5005        	ldw	x,#20485
4005  034c cd0000        	call	_GPIO_WriteHigh
4007  034f 5b01          	addw	sp,#1
4008  0351 200a          	jra	L26
4009  0353               L06:
4010  0353 4b02          	push	#2
4011  0355 ae5005        	ldw	x,#20485
4012  0358 cd0000        	call	_GPIO_WriteLow
4014  035b 5b01          	addw	sp,#1
4015  035d               L26:
4016                     ; 695 	(valor & 0x04) ? BCD_C_ON : BCD_C_OFF;
4018  035d 7b01          	ld	a,(OFST+1,sp)
4019  035f a504          	bcp	a,#4
4020  0361 270c          	jreq	L46
4021  0363 4b04          	push	#4
4022  0365 ae5005        	ldw	x,#20485
4023  0368 cd0000        	call	_GPIO_WriteHigh
4025  036b 5b01          	addw	sp,#1
4026  036d 200a          	jra	L66
4027  036f               L46:
4028  036f 4b04          	push	#4
4029  0371 ae5005        	ldw	x,#20485
4030  0374 cd0000        	call	_GPIO_WriteLow
4032  0377 5b01          	addw	sp,#1
4033  0379               L66:
4034                     ; 696 	(valor & 0x08) ? BCD_D_ON : BCD_D_OFF;
4036  0379 7b01          	ld	a,(OFST+1,sp)
4037  037b a508          	bcp	a,#8
4038  037d 270c          	jreq	L07
4039  037f 4b08          	push	#8
4040  0381 ae5005        	ldw	x,#20485
4041  0384 cd0000        	call	_GPIO_WriteHigh
4043  0387 5b01          	addw	sp,#1
4044  0389 200a          	jra	L27
4045  038b               L07:
4046  038b 4b08          	push	#8
4047  038d ae5005        	ldw	x,#20485
4048  0390 cd0000        	call	_GPIO_WriteLow
4050  0393 5b01          	addw	sp,#1
4051  0395               L27:
4052                     ; 697 }
4055  0395 84            	pop	a
4056  0396 81            	ret
4157                     ; 699 void PulseLatch(GPIO_TypeDef* porta, uint8_t pino)
4157                     ; 700 {
4158                     	switch	.text
4159  0397               _PulseLatch:
4161  0397 89            	pushw	x
4162       00000000      OFST:	set	0
4165                     ; 701 	GPIO_WriteHigh(porta, pino);
4167  0398 7b05          	ld	a,(OFST+5,sp)
4168  039a 88            	push	a
4169  039b cd0000        	call	_GPIO_WriteHigh
4171  039e 84            	pop	a
4172                     ; 702 	NOP(); NOP(); NOP(); NOP();
4175  039f 9d            nop
4180  03a0 9d            nop
4185  03a1 9d            nop
4190  03a2 9d            nop
4192                     ; 703 	GPIO_WriteLow(porta, pino);
4194  03a3 7b05          	ld	a,(OFST+5,sp)
4195  03a5 88            	push	a
4196  03a6 1e02          	ldw	x,(OFST+2,sp)
4197  03a8 cd0000        	call	_GPIO_WriteLow
4199  03ab 84            	pop	a
4200                     ; 704 }
4203  03ac 85            	popw	x
4204  03ad 81            	ret
4227                     ; 706 void ApagarDisplay(void)
4227                     ; 707 {
4228                     	switch	.text
4229  03ae               _ApagarDisplay:
4233                     ; 709 }
4236  03ae 81            	ret
4290                     ; 711 void AtualizarDisplay(uint8_t valor)
4290                     ; 712 {
4291                     	switch	.text
4292  03af               _AtualizarDisplay:
4294  03af 88            	push	a
4295  03b0 89            	pushw	x
4296       00000002      OFST:	set	2
4299                     ; 713 	uint8_t unidades = valor % 10;
4301  03b1 5f            	clrw	x
4302  03b2 97            	ld	xl,a
4303  03b3 a60a          	ld	a,#10
4304  03b5 62            	div	x,a
4305  03b6 5f            	clrw	x
4306  03b7 97            	ld	xl,a
4307  03b8 9f            	ld	a,xl
4308  03b9 6b01          	ld	(OFST-1,sp),a
4310                     ; 714 	uint8_t dezenas = valor / 10;
4312  03bb 7b03          	ld	a,(OFST+1,sp)
4313  03bd 5f            	clrw	x
4314  03be 97            	ld	xl,a
4315  03bf a60a          	ld	a,#10
4316  03c1 62            	div	x,a
4317  03c2 9f            	ld	a,xl
4318  03c3 6b02          	ld	(OFST+0,sp),a
4320                     ; 716 	WriteBCD(unidades);
4322  03c5 7b01          	ld	a,(OFST-1,sp)
4323  03c7 cd0326        	call	_WriteBCD
4325                     ; 717 	PulseLatch(LATCH_01_PORT, LATCH_01_PIN);
4327  03ca 4b04          	push	#4
4328  03cc ae500a        	ldw	x,#20490
4329  03cf adc6          	call	_PulseLatch
4331  03d1 84            	pop	a
4332                     ; 719 	WriteBCD(dezenas);
4334  03d2 7b02          	ld	a,(OFST+0,sp)
4335  03d4 cd0326        	call	_WriteBCD
4337                     ; 720 	PulseLatch(LATCH_02_PORT, LATCH_02_PIN);
4339  03d7 4b02          	push	#2
4340  03d9 ae500a        	ldw	x,#20490
4341  03dc adb9          	call	_PulseLatch
4343  03de 84            	pop	a
4344                     ; 721 }
4347  03df 5b03          	addw	sp,#3
4348  03e1 81            	ret
4385                     ; 723 void InitDisplay(void)
4385                     ; 724 {
4386                     	switch	.text
4387  03e2               _InitDisplay:
4389  03e2 88            	push	a
4390       00000001      OFST:	set	1
4393                     ; 727     for (i = 0; i < 3; i++)
4395  03e3 0f01          	clr	(OFST+0,sp)
4397  03e5               L1732:
4398                     ; 730         BCD_A_ON;
4400  03e5 4b01          	push	#1
4401  03e7 ae5005        	ldw	x,#20485
4402  03ea cd0000        	call	_GPIO_WriteHigh
4404  03ed 84            	pop	a
4405                     ; 731         BCD_B_ON;
4407  03ee 4b02          	push	#2
4408  03f0 ae5005        	ldw	x,#20485
4409  03f3 cd0000        	call	_GPIO_WriteHigh
4411  03f6 84            	pop	a
4412                     ; 732         BCD_C_ON;
4414  03f7 4b04          	push	#4
4415  03f9 ae5005        	ldw	x,#20485
4416  03fc cd0000        	call	_GPIO_WriteHigh
4418  03ff 84            	pop	a
4419                     ; 733         BCD_D_ON;
4421  0400 4b08          	push	#8
4422  0402 ae5005        	ldw	x,#20485
4423  0405 cd0000        	call	_GPIO_WriteHigh
4425  0408 84            	pop	a
4426                     ; 734         GPIO_WriteHigh(GPIOC, GPIO_PIN_7); // Latch
4428  0409 4b80          	push	#128
4429  040b ae500a        	ldw	x,#20490
4430  040e cd0000        	call	_GPIO_WriteHigh
4432  0411 84            	pop	a
4433                     ; 735         GPIO_WriteLow(GPIOC, GPIO_PIN_7);
4435  0412 4b80          	push	#128
4436  0414 ae500a        	ldw	x,#20490
4437  0417 cd0000        	call	_GPIO_WriteLow
4439  041a 84            	pop	a
4440                     ; 737         Delay(1000); // espera 300ms
4442  041b ae03e8        	ldw	x,#1000
4443  041e 89            	pushw	x
4444  041f ae0000        	ldw	x,#0
4445  0422 89            	pushw	x
4446  0423 cd0217        	call	_Delay
4448  0426 5b04          	addw	sp,#4
4449                     ; 740         BCD_A_OFF;
4451  0428 4b01          	push	#1
4452  042a ae5005        	ldw	x,#20485
4453  042d cd0000        	call	_GPIO_WriteLow
4455  0430 84            	pop	a
4456                     ; 741         BCD_B_OFF;
4458  0431 4b02          	push	#2
4459  0433 ae5005        	ldw	x,#20485
4460  0436 cd0000        	call	_GPIO_WriteLow
4462  0439 84            	pop	a
4463                     ; 742         BCD_C_OFF;
4465  043a 4b04          	push	#4
4466  043c ae5005        	ldw	x,#20485
4467  043f cd0000        	call	_GPIO_WriteLow
4469  0442 84            	pop	a
4470                     ; 743         BCD_D_OFF;
4472  0443 4b08          	push	#8
4473  0445 ae5005        	ldw	x,#20485
4474  0448 cd0000        	call	_GPIO_WriteLow
4476  044b 84            	pop	a
4477                     ; 744         GPIO_WriteHigh(GPIOC, GPIO_PIN_7); // Latch
4479  044c 4b80          	push	#128
4480  044e ae500a        	ldw	x,#20490
4481  0451 cd0000        	call	_GPIO_WriteHigh
4483  0454 84            	pop	a
4484                     ; 745         GPIO_WriteLow(GPIOC, GPIO_PIN_7);
4486  0455 4b80          	push	#128
4487  0457 ae500a        	ldw	x,#20490
4488  045a cd0000        	call	_GPIO_WriteLow
4490  045d 84            	pop	a
4491                     ; 747         Delay(1000); // espera 300ms
4493  045e ae03e8        	ldw	x,#1000
4494  0461 89            	pushw	x
4495  0462 ae0000        	ldw	x,#0
4496  0465 89            	pushw	x
4497  0466 cd0217        	call	_Delay
4499  0469 5b04          	addw	sp,#4
4500                     ; 727     for (i = 0; i < 3; i++)
4502  046b 0c01          	inc	(OFST+0,sp)
4506  046d 7b01          	ld	a,(OFST+0,sp)
4507  046f a103          	cp	a,#3
4508  0471 2403cc03e5    	jrult	L1732
4509                     ; 749 }
4512  0476 84            	pop	a
4513  0477 81            	ret
4681                     	xdef	f_TIM1_UPD_IRQHandler
4682                     	xdef	f_TIM6_UPD_IRQHandler
4683                     	xdef	_main
4684                     	xdef	_InitDisplay
4685                     	xdef	_AtualizarDisplay
4686                     	xdef	_ApagarDisplay
4687                     	xdef	_PulseLatch
4688                     	xdef	_WriteBCD
4689                     	xdef	_BuzzerBeep
4690                     	xdef	_searchCode
4691                     	xdef	_save_code_to_eeprom
4692                     	xdef	_UnlockE2prom
4693                     	xdef	_TIM1_Config
4694                     	xdef	_onInt_TM6
4695                     	xdef	_BOT_PAUSE
4696                     	xdef	_BOT_24S
4697                     	xdef	_BOT_14S
4698                     	xdef	_SetCLK
4699                     	xdef	_Delay
4700                     	xdef	_InitGPIO
4701                     	xdef	_contador_ms_sequencia
4702                     	xdef	_fim_contagem_estado
4703                     	xdef	_flag_start
4704                     	xdef	_flag_run
4705                     	xdef	_contador_ms
4706                     	xdef	_tempo_restante
4707                     .eeprom:	section	.data
4708  0000               _codControler:
4709  0000 00000000      	ds.b	4
4710                     	xdef	_codControler
4711                     	xdef	_rf_cooldown
4712                     	xdef	_debounceCh2
4713                     	xdef	_debounceCh1
4714                     	xdef	_RF_IN_ON
4715                     	xdef	_led3State
4716                     	xdef	_led2State
4717                     	xdef	_led1State
4718                     	xref	_Read_RF_6P20
4719                     	xref.b	_Code_Ready
4720                     	xref.b	_HT_RC_Code_Ready_Overwrite
4721                     	xref.b	_RF_CopyBuffer
4722                     	xref	_TIM1_ClearITPendingBit
4723                     	xref	_TIM1_ITConfig
4724                     	xref	_TIM1_Cmd
4725                     	xref	_TIM1_TimeBaseInit
4726                     	xref	_TIM1_DeInit
4727                     	xref	_ITC_SetSoftwarePriority
4728                     	xref	_GPIO_ReadInputPin
4729                     	xref	_GPIO_WriteLow
4730                     	xref	_GPIO_WriteHigh
4731                     	xref	_GPIO_Init
4732                     	xref	_FLASH_Unlock
4733                     	xref	_CLK_PeripheralClockConfig
4734                     	xref.b	c_lreg
4735                     	xref.b	c_x
4736                     	xref.b	c_y
4756                     	xref	c_lzmp
4757                     	xref	c_lgsbc
4758                     	xref	c_uitolx
4759                     	xref	c_eewrc
4760                     	end
