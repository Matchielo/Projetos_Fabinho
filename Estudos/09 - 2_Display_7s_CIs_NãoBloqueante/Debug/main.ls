   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     	bsct
2589  0000               _tempo_restante:
2590  0000 00            	dc.b	0
2591  0001               _em_contagem:
2592  0001 00            	dc.b	0
2593  0002               _contador_ms:
2594  0002 0000          	dc.w	0
2595  0004               _fim_contagem_estado:
2596  0004 00            	dc.b	0
2597  0005               _contador_ms_sequencia:
2598  0005 0000          	dc.w	0
2641                     ; 53 void main(void)
2641                     ; 54 {
2643                     	switch	.text
2644  0000               _main:
2648                     ; 55     InitCLOCK();
2650  0000 cd0209        	call	_InitCLOCK
2652                     ; 56     InitGPIO();
2654  0003 cd01a5        	call	_InitGPIO
2656                     ; 59     ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_1);
2658  0006 ae1701        	ldw	x,#5889
2659  0009 cd0000        	call	_ITC_SetSoftwarePriority
2661                     ; 60     TIM4_Config();
2663  000c cd0264        	call	_TIM4_Config
2665                     ; 61     enableInterrupts();
2668  000f 9a            rim
2670                     ; 63     apagarDisplay(); // Garante que o display comece apagado
2673  0010 cd0301        	call	_apagarDisplay
2675  0013               L1761:
2676                     ; 68         if (GPIO_ReadInputPin(BOTAO_14_PORT, BOTAO_14_PIN) == RESET)
2678  0013 4b04          	push	#4
2679  0015 ae500f        	ldw	x,#20495
2680  0018 cd0000        	call	_GPIO_ReadInputPin
2682  001b 5b01          	addw	sp,#1
2683  001d 4d            	tnz	a
2684  001e 2622          	jrne	L5761
2685                     ; 71             tempo_restante = 14;
2687  0020 350e0000      	mov	_tempo_restante,#14
2688                     ; 72             em_contagem = 1;
2690  0024 35010001      	mov	_em_contagem,#1
2691                     ; 73             contador_ms = 0;
2693  0028 5f            	clrw	x
2694  0029 bf02          	ldw	_contador_ms,x
2695                     ; 74             fim_contagem_estado = 0; // Garante que a sequência de finalização seja cancelada
2697  002b 3f04          	clr	_fim_contagem_estado
2698                     ; 75             atualizarDisplay(tempo_restante); // ATUALIZAÇÃO IMEDIATA
2700  002d b600          	ld	a,_tempo_restante
2701  002f cd0336        	call	_atualizarDisplay
2704  0032 2001          	jra	L1071
2705  0034               L7761:
2706                     ; 77             while(GPIO_ReadInputPin(BOTAO_14_PORT, BOTAO_14_PIN) == RESET) { NOP(); } // Simples debouncing
2709  0034 9d            nop
2711  0035               L1071:
2714  0035 4b04          	push	#4
2715  0037 ae500f        	ldw	x,#20495
2716  003a cd0000        	call	_GPIO_ReadInputPin
2718  003d 5b01          	addw	sp,#1
2719  003f 4d            	tnz	a
2720  0040 27f2          	jreq	L7761
2721  0042               L5761:
2722                     ; 81         if (GPIO_ReadInputPin(BOTAO_24_PORT, BOTAO_24_PIN) == RESET)
2724  0042 4b08          	push	#8
2725  0044 ae500f        	ldw	x,#20495
2726  0047 cd0000        	call	_GPIO_ReadInputPin
2728  004a 5b01          	addw	sp,#1
2729  004c 4d            	tnz	a
2730  004d 26c4          	jrne	L1761
2731                     ; 84             tempo_restante = 24;
2733  004f 35180000      	mov	_tempo_restante,#24
2734                     ; 85             em_contagem = 1;
2736  0053 35010001      	mov	_em_contagem,#1
2737                     ; 86             contador_ms = 0;
2739  0057 5f            	clrw	x
2740  0058 bf02          	ldw	_contador_ms,x
2741                     ; 87             fim_contagem_estado = 0; // Garante que a sequência de finalização seja cancelada
2743  005a 3f04          	clr	_fim_contagem_estado
2744                     ; 88             atualizarDisplay(tempo_restante); // ATUALIZAÇÃO IMEDIATA
2746  005c b600          	ld	a,_tempo_restante
2747  005e cd0336        	call	_atualizarDisplay
2750  0061 2001          	jra	L1171
2751  0063               L7071:
2752                     ; 90             while(GPIO_ReadInputPin(BOTAO_24_PORT, BOTAO_24_PIN) == RESET) { NOP(); } // Simples debouncing
2755  0063 9d            nop
2757  0064               L1171:
2760  0064 4b08          	push	#8
2761  0066 ae500f        	ldw	x,#20495
2762  0069 cd0000        	call	_GPIO_ReadInputPin
2764  006c 5b01          	addw	sp,#1
2765  006e 4d            	tnz	a
2766  006f 27f2          	jreq	L7071
2767  0071 20a0          	jra	L1761
2801                     ; 96 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
2801                     ; 97 {
2803                     	switch	.text
2804  0073               f_TIM4_UPD_OVF_IRQHandler:
2806  0073 8a            	push	cc
2807  0074 84            	pop	a
2808  0075 a4bf          	and	a,#191
2809  0077 88            	push	a
2810  0078 86            	pop	cc
2811  0079 3b0002        	push	c_x+2
2812  007c be00          	ldw	x,c_x
2813  007e 89            	pushw	x
2814  007f 3b0002        	push	c_y+2
2815  0082 be00          	ldw	x,c_y
2816  0084 89            	pushw	x
2819                     ; 98     TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
2821  0085 a601          	ld	a,#1
2822  0087 cd0000        	call	_TIM4_ClearITPendingBit
2824                     ; 101     if (em_contagem)
2826  008a 3d01          	tnz	_em_contagem
2827  008c 2729          	jreq	L1471
2828                     ; 103         contador_ms++;
2830  008e be02          	ldw	x,_contador_ms
2831  0090 1c0001        	addw	x,#1
2832  0093 bf02          	ldw	_contador_ms,x
2833                     ; 104         if (contador_ms >= 1000) // Passou 1 segundo
2835  0095 be02          	ldw	x,_contador_ms
2836  0097 a303e8        	cpw	x,#1000
2837  009a 251b          	jrult	L1471
2838                     ; 106             contador_ms = 0;
2840  009c 5f            	clrw	x
2841  009d bf02          	ldw	_contador_ms,x
2842                     ; 108             if (tempo_restante > 0)
2844  009f 3d00          	tnz	_tempo_restante
2845  00a1 2707          	jreq	L5471
2846                     ; 110                 tempo_restante--;
2848  00a3 3a00          	dec	_tempo_restante
2849                     ; 111                 atualizarDisplay(tempo_restante);
2851  00a5 b600          	ld	a,_tempo_restante
2852  00a7 cd0336        	call	_atualizarDisplay
2854  00aa               L5471:
2855                     ; 114             if (tempo_restante == 0) // Se a contagem acabou de zerar
2857  00aa 3d00          	tnz	_tempo_restante
2858  00ac 2609          	jrne	L1471
2859                     ; 116                 em_contagem = 0;
2861  00ae 3f01          	clr	_em_contagem
2862                     ; 117                 fim_contagem_estado = 1;        // Dispara a sequência de finalização
2864  00b0 35010004      	mov	_fim_contagem_estado,#1
2865                     ; 118                 contador_ms_sequencia = 0;      // Zera o contador da sequência
2867  00b4 5f            	clrw	x
2868  00b5 bf05          	ldw	_contador_ms_sequencia,x
2869  00b7               L1471:
2870                     ; 124     if (fim_contagem_estado > 0)
2872  00b7 3d04          	tnz	_fim_contagem_estado
2873  00b9 2604          	jrne	L01
2874  00bb ac980198      	jpf	L1571
2875  00bf               L01:
2876                     ; 126         contador_ms_sequencia++;
2878  00bf be05          	ldw	x,_contador_ms_sequencia
2879  00c1 1c0001        	addw	x,#1
2880  00c4 bf05          	ldw	_contador_ms_sequencia,x
2881                     ; 128         switch (fim_contagem_estado)
2883  00c6 b604          	ld	a,_fim_contagem_estado
2885                     ; 166                 break;
2886  00c8 4a            	dec	a
2887  00c9 2717          	jreq	L5171
2888  00cb 4a            	dec	a
2889  00cc 2734          	jreq	L7171
2890  00ce 4a            	dec	a
2891  00cf 274c          	jreq	L1271
2892  00d1 4a            	dec	a
2893  00d2 2763          	jreq	L3271
2894  00d4 4a            	dec	a
2895  00d5 277b          	jreq	L5271
2896  00d7 4a            	dec	a
2897  00d8 2604ac6c016c  	jreq	L7271
2898  00de ac980198      	jpf	L1571
2899  00e2               L5171:
2900                     ; 130             case 1: // Estado 1: Apaga o display (Blink 1)
2900                     ; 131                 if(contador_ms_sequencia == 1) { apagarDisplay(); }
2902  00e2 be05          	ldw	x,_contador_ms_sequencia
2903  00e4 a30001        	cpw	x,#1
2904  00e7 2603          	jrne	L7571
2907  00e9 cd0301        	call	_apagarDisplay
2909  00ec               L7571:
2910                     ; 132                 if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 2; }
2912  00ec be05          	ldw	x,_contador_ms_sequencia
2913  00ee a300c8        	cpw	x,#200
2914  00f1 2404          	jruge	L21
2915  00f3 ac980198      	jpf	L1571
2916  00f7               L21:
2919  00f7 5f            	clrw	x
2920  00f8 bf05          	ldw	_contador_ms_sequencia,x
2923  00fa 35020004      	mov	_fim_contagem_estado,#2
2924  00fe ac980198      	jpf	L1571
2925  0102               L7171:
2926                     ; 135             case 2: // Estado 2: Mostra "00" (Blink 1)
2926                     ; 136                 if(contador_ms_sequencia == 1) { atualizarDisplay(0); }
2928  0102 be05          	ldw	x,_contador_ms_sequencia
2929  0104 a30001        	cpw	x,#1
2930  0107 2604          	jrne	L3671
2933  0109 4f            	clr	a
2934  010a cd0336        	call	_atualizarDisplay
2936  010d               L3671:
2937                     ; 137                 if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 3; }
2939  010d be05          	ldw	x,_contador_ms_sequencia
2940  010f a300c8        	cpw	x,#200
2941  0112 25ea          	jrult	L1571
2944  0114 5f            	clrw	x
2945  0115 bf05          	ldw	_contador_ms_sequencia,x
2948  0117 35030004      	mov	_fim_contagem_estado,#3
2949  011b 207b          	jra	L1571
2950  011d               L1271:
2951                     ; 140             case 3: // Estado 3: Apaga o display (Blink 2)
2951                     ; 141                 if(contador_ms_sequencia == 1) { apagarDisplay(); }
2953  011d be05          	ldw	x,_contador_ms_sequencia
2954  011f a30001        	cpw	x,#1
2955  0122 2603          	jrne	L7671
2958  0124 cd0301        	call	_apagarDisplay
2960  0127               L7671:
2961                     ; 142                 if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 4; }
2963  0127 be05          	ldw	x,_contador_ms_sequencia
2964  0129 a300c8        	cpw	x,#200
2965  012c 256a          	jrult	L1571
2968  012e 5f            	clrw	x
2969  012f bf05          	ldw	_contador_ms_sequencia,x
2972  0131 35040004      	mov	_fim_contagem_estado,#4
2973  0135 2061          	jra	L1571
2974  0137               L3271:
2975                     ; 145             case 4: // Estado 4: Mostra "00" (Blink 2)
2975                     ; 146                 if(contador_ms_sequencia == 1) { atualizarDisplay(0); }
2977  0137 be05          	ldw	x,_contador_ms_sequencia
2978  0139 a30001        	cpw	x,#1
2979  013c 2604          	jrne	L3771
2982  013e 4f            	clr	a
2983  013f cd0336        	call	_atualizarDisplay
2985  0142               L3771:
2986                     ; 147                 if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 5; }
2988  0142 be05          	ldw	x,_contador_ms_sequencia
2989  0144 a300c8        	cpw	x,#200
2990  0147 254f          	jrult	L1571
2993  0149 5f            	clrw	x
2994  014a bf05          	ldw	_contador_ms_sequencia,x
2997  014c 35050004      	mov	_fim_contagem_estado,#5
2998  0150 2046          	jra	L1571
2999  0152               L5271:
3000                     ; 150             case 5: // Estado 5: Apaga o display (Blink 3)
3000                     ; 151                 if(contador_ms_sequencia == 1) { apagarDisplay(); }
3002  0152 be05          	ldw	x,_contador_ms_sequencia
3003  0154 a30001        	cpw	x,#1
3004  0157 2603          	jrne	L7771
3007  0159 cd0301        	call	_apagarDisplay
3009  015c               L7771:
3010                     ; 152                 if(contador_ms_sequencia >= 200) { contador_ms_sequencia = 0; fim_contagem_estado = 6; }
3012  015c be05          	ldw	x,_contador_ms_sequencia
3013  015e a300c8        	cpw	x,#200
3014  0161 2535          	jrult	L1571
3017  0163 5f            	clrw	x
3018  0164 bf05          	ldw	_contador_ms_sequencia,x
3021  0166 35060004      	mov	_fim_contagem_estado,#6
3022  016a 202c          	jra	L1571
3023  016c               L7271:
3024                     ; 155             case 6: // Estado 6: Mostra "00" (Blink 3) e liga o Buzzer
3024                     ; 156                 if(contador_ms_sequencia == 1) { 
3026  016c be05          	ldw	x,_contador_ms_sequencia
3027  016e a30001        	cpw	x,#1
3028  0171 260d          	jrne	L3002
3029                     ; 157                     atualizarDisplay(0); 
3031  0173 4f            	clr	a
3032  0174 cd0336        	call	_atualizarDisplay
3034                     ; 158                     GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
3036  0177 4b01          	push	#1
3037  0179 ae500f        	ldw	x,#20495
3038  017c cd0000        	call	_GPIO_WriteHigh
3040  017f 84            	pop	a
3041  0180               L3002:
3042                     ; 160                 if(contador_ms_sequencia >= 1000) { // Deixa o som por 300ms
3044  0180 be05          	ldw	x,_contador_ms_sequencia
3045  0182 a303e8        	cpw	x,#1000
3046  0185 2511          	jrult	L1571
3047                     ; 161                     GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
3049  0187 4b01          	push	#1
3050  0189 ae500f        	ldw	x,#20495
3051  018c cd0000        	call	_GPIO_WriteLow
3053  018f 84            	pop	a
3054                     ; 162                     apagarDisplay();
3056  0190 cd0301        	call	_apagarDisplay
3058                     ; 163                     contador_ms_sequencia = 0;
3060  0193 5f            	clrw	x
3061  0194 bf05          	ldw	_contador_ms_sequencia,x
3062                     ; 164                     fim_contagem_estado = 0; // Fim da sequência
3064  0196 3f04          	clr	_fim_contagem_estado
3065  0198               L5571:
3066  0198               L1571:
3067                     ; 169 }
3070  0198 85            	popw	x
3071  0199 bf00          	ldw	c_y,x
3072  019b 320002        	pop	c_y+2
3073  019e 85            	popw	x
3074  019f bf00          	ldw	c_x,x
3075  01a1 320002        	pop	c_x+2
3076  01a4 80            	iret
3099                     ; 172 void InitGPIO(void)
3099                     ; 173 {
3101                     	switch	.text
3102  01a5               _InitGPIO:
3106                     ; 174     GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3108  01a5 4be0          	push	#224
3109  01a7 4b01          	push	#1
3110  01a9 ae5005        	ldw	x,#20485
3111  01ac cd0000        	call	_GPIO_Init
3113  01af 85            	popw	x
3114                     ; 175     GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3116  01b0 4be0          	push	#224
3117  01b2 4b02          	push	#2
3118  01b4 ae5005        	ldw	x,#20485
3119  01b7 cd0000        	call	_GPIO_Init
3121  01ba 85            	popw	x
3122                     ; 176     GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3124  01bb 4be0          	push	#224
3125  01bd 4b04          	push	#4
3126  01bf ae5005        	ldw	x,#20485
3127  01c2 cd0000        	call	_GPIO_Init
3129  01c5 85            	popw	x
3130                     ; 177     GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3132  01c6 4be0          	push	#224
3133  01c8 4b08          	push	#8
3134  01ca ae5005        	ldw	x,#20485
3135  01cd cd0000        	call	_GPIO_Init
3137  01d0 85            	popw	x
3138                     ; 179     GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3140  01d1 4be0          	push	#224
3141  01d3 4b04          	push	#4
3142  01d5 ae500a        	ldw	x,#20490
3143  01d8 cd0000        	call	_GPIO_Init
3145  01db 85            	popw	x
3146                     ; 180     GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3148  01dc 4be0          	push	#224
3149  01de 4b02          	push	#2
3150  01e0 ae500a        	ldw	x,#20490
3151  01e3 cd0000        	call	_GPIO_Init
3153  01e6 85            	popw	x
3154                     ; 182     GPIO_Init(BOTAO_14_PORT, BOTAO_14_PIN, GPIO_MODE_IN_PU_NO_IT);
3156  01e7 4b40          	push	#64
3157  01e9 4b04          	push	#4
3158  01eb ae500f        	ldw	x,#20495
3159  01ee cd0000        	call	_GPIO_Init
3161  01f1 85            	popw	x
3162                     ; 183     GPIO_Init(BOTAO_24_PORT, BOTAO_24_PIN, GPIO_MODE_IN_PU_NO_IT);
3164  01f2 4b40          	push	#64
3165  01f4 4b08          	push	#8
3166  01f6 ae500f        	ldw	x,#20495
3167  01f9 cd0000        	call	_GPIO_Init
3169  01fc 85            	popw	x
3170                     ; 185     GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3172  01fd 4be0          	push	#224
3173  01ff 4b01          	push	#1
3174  0201 ae500f        	ldw	x,#20495
3175  0204 cd0000        	call	_GPIO_Init
3177  0207 85            	popw	x
3178                     ; 186 }
3181  0208 81            	ret
3214                     ; 187 void InitCLOCK(void)
3214                     ; 188 {
3215                     	switch	.text
3216  0209               _InitCLOCK:
3220                     ; 189     CLK_DeInit(); // Reseta todas as configurações do clock para os valores padrão de fábrica.
3222  0209 cd0000        	call	_CLK_DeInit
3224                     ; 191     CLK_HSECmd(DISABLE); // Desabilita o oscilador externo de alta velocidade (HSE), se houver.
3226  020c 4f            	clr	a
3227  020d cd0000        	call	_CLK_HSECmd
3229                     ; 192     CLK_LSICmd(DISABLE); // Desabilita o oscilador interno de baixa velocidade (LSI), usado para RTC/AWU.
3231  0210 4f            	clr	a
3232  0211 cd0000        	call	_CLK_LSICmd
3234                     ; 193     CLK_HSICmd(ENABLE);  // Habilita o oscilador interno de alta velocidade (HSI).
3236  0214 a601          	ld	a,#1
3237  0216 cd0000        	call	_CLK_HSICmd
3240  0219               L1302:
3241                     ; 196     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3243  0219 ae0102        	ldw	x,#258
3244  021c cd0000        	call	_CLK_GetFlagStatus
3246  021f 4d            	tnz	a
3247  0220 27f7          	jreq	L1302
3248                     ; 198     CLK_ClockSwitchCmd(ENABLE);          // Permite a troca da fonte de clock.
3250  0222 a601          	ld	a,#1
3251  0224 cd0000        	call	_CLK_ClockSwitchCmd
3253                     ; 199     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // Define o prescaler do HSI para DIV1 (16MHz / 1 = 16MHz).
3255  0227 4f            	clr	a
3256  0228 cd0000        	call	_CLK_HSIPrescalerConfig
3258                     ; 200     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // Define o prescaler da CPU para DIV1 (CPU roda na velocidade do clock do sistema).
3260  022b a680          	ld	a,#128
3261  022d cd0000        	call	_CLK_SYSCLKConfig
3263                     ; 202     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3265  0230 4b01          	push	#1
3266  0232 4b00          	push	#0
3267  0234 ae01e1        	ldw	x,#481
3268  0237 cd0000        	call	_CLK_ClockSwitchConfig
3270  023a 85            	popw	x
3271                     ; 205     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3273  023b 5f            	clrw	x
3274  023c cd0000        	call	_CLK_PeripheralClockConfig
3276                     ; 206     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3278  023f ae0100        	ldw	x,#256
3279  0242 cd0000        	call	_CLK_PeripheralClockConfig
3281                     ; 207     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
3283  0245 ae1300        	ldw	x,#4864
3284  0248 cd0000        	call	_CLK_PeripheralClockConfig
3286                     ; 208     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3288  024b ae1200        	ldw	x,#4608
3289  024e cd0000        	call	_CLK_PeripheralClockConfig
3291                     ; 209     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3293  0251 ae0300        	ldw	x,#768
3294  0254 cd0000        	call	_CLK_PeripheralClockConfig
3296                     ; 210     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3298  0257 ae0700        	ldw	x,#1792
3299  025a cd0000        	call	_CLK_PeripheralClockConfig
3301                     ; 211     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE); // Habilita o clock para o Timer 4, pois ele será usado.
3303  025d ae0401        	ldw	x,#1025
3304  0260 cd0000        	call	_CLK_PeripheralClockConfig
3306                     ; 212 }
3309  0263 81            	ret
3336                     ; 214 void TIM4_Config(void)
3336                     ; 215 {
3337                     	switch	.text
3338  0264               _TIM4_Config:
3342                     ; 219     TIM4_DeInit();
3344  0264 cd0000        	call	_TIM4_DeInit
3346                     ; 220     TIM4_TimeBaseInit(TIM4_PRESCALER_128, 124); // 124 para dar 125 ciclos
3348  0267 ae077c        	ldw	x,#1916
3349  026a cd0000        	call	_TIM4_TimeBaseInit
3351                     ; 221     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
3353  026d ae0101        	ldw	x,#257
3354  0270 cd0000        	call	_TIM4_ITConfig
3356                     ; 222     TIM4_Cmd(ENABLE);
3358  0273 a601          	ld	a,#1
3359  0275 cd0000        	call	_TIM4_Cmd
3361                     ; 223 }
3364  0278 81            	ret
3400                     ; 225 void writeBCD(uint8_t valor)
3400                     ; 226 {
3401                     	switch	.text
3402  0279               _writeBCD:
3404  0279 88            	push	a
3405       00000000      OFST:	set	0
3408                     ; 227     (valor & 0x01) ? GPIO_WriteHigh(LD_A_PORT, LD_A_PIN) : GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
3410  027a a501          	bcp	a,#1
3411  027c 270c          	jreq	L42
3412  027e 4b01          	push	#1
3413  0280 ae5005        	ldw	x,#20485
3414  0283 cd0000        	call	_GPIO_WriteHigh
3416  0286 5b01          	addw	sp,#1
3417  0288 200a          	jra	L62
3418  028a               L42:
3419  028a 4b01          	push	#1
3420  028c ae5005        	ldw	x,#20485
3421  028f cd0000        	call	_GPIO_WriteLow
3423  0292 5b01          	addw	sp,#1
3424  0294               L62:
3425                     ; 228     (valor & 0x02) ? GPIO_WriteHigh(LD_B_PORT, LD_B_PIN) : GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
3427  0294 7b01          	ld	a,(OFST+1,sp)
3428  0296 a502          	bcp	a,#2
3429  0298 270c          	jreq	L03
3430  029a 4b02          	push	#2
3431  029c ae5005        	ldw	x,#20485
3432  029f cd0000        	call	_GPIO_WriteHigh
3434  02a2 5b01          	addw	sp,#1
3435  02a4 200a          	jra	L23
3436  02a6               L03:
3437  02a6 4b02          	push	#2
3438  02a8 ae5005        	ldw	x,#20485
3439  02ab cd0000        	call	_GPIO_WriteLow
3441  02ae 5b01          	addw	sp,#1
3442  02b0               L23:
3443                     ; 229     (valor & 0x04) ? GPIO_WriteHigh(LD_C_PORT, LD_C_PIN) : GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
3445  02b0 7b01          	ld	a,(OFST+1,sp)
3446  02b2 a504          	bcp	a,#4
3447  02b4 270c          	jreq	L43
3448  02b6 4b04          	push	#4
3449  02b8 ae5005        	ldw	x,#20485
3450  02bb cd0000        	call	_GPIO_WriteHigh
3452  02be 5b01          	addw	sp,#1
3453  02c0 200a          	jra	L63
3454  02c2               L43:
3455  02c2 4b04          	push	#4
3456  02c4 ae5005        	ldw	x,#20485
3457  02c7 cd0000        	call	_GPIO_WriteLow
3459  02ca 5b01          	addw	sp,#1
3460  02cc               L63:
3461                     ; 230     (valor & 0x08) ? GPIO_WriteHigh(LD_D_PORT, LD_D_PIN) : GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
3463  02cc 7b01          	ld	a,(OFST+1,sp)
3464  02ce a508          	bcp	a,#8
3465  02d0 270c          	jreq	L04
3466  02d2 4b08          	push	#8
3467  02d4 ae5005        	ldw	x,#20485
3468  02d7 cd0000        	call	_GPIO_WriteHigh
3470  02da 5b01          	addw	sp,#1
3471  02dc 200a          	jra	L24
3472  02de               L04:
3473  02de 4b08          	push	#8
3474  02e0 ae5005        	ldw	x,#20485
3475  02e3 cd0000        	call	_GPIO_WriteLow
3477  02e6 5b01          	addw	sp,#1
3478  02e8               L24:
3479                     ; 231 }
3482  02e8 84            	pop	a
3483  02e9 81            	ret
3584                     ; 233 void pulseLatch(GPIO_TypeDef* porta, uint8_t pino)
3584                     ; 234 {
3585                     	switch	.text
3586  02ea               _pulseLatch:
3588  02ea 89            	pushw	x
3589       00000000      OFST:	set	0
3592                     ; 235     GPIO_WriteHigh(porta, pino);
3594  02eb 7b05          	ld	a,(OFST+5,sp)
3595  02ed 88            	push	a
3596  02ee cd0000        	call	_GPIO_WriteHigh
3598  02f1 84            	pop	a
3599                     ; 237     NOP(); NOP(); NOP(); NOP();
3602  02f2 9d            nop
3607  02f3 9d            nop
3612  02f4 9d            nop
3617  02f5 9d            nop
3619                     ; 238     GPIO_WriteLow(porta, pino);
3621  02f6 7b05          	ld	a,(OFST+5,sp)
3622  02f8 88            	push	a
3623  02f9 1e02          	ldw	x,(OFST+2,sp)
3624  02fb cd0000        	call	_GPIO_WriteLow
3626  02fe 84            	pop	a
3627                     ; 239 }
3630  02ff 85            	popw	x
3631  0300 81            	ret
3656                     ; 241 void apagarDisplay(void)
3656                     ; 242 {
3657                     	switch	.text
3658  0301               _apagarDisplay:
3662                     ; 244     GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
3664  0301 4b01          	push	#1
3665  0303 ae5005        	ldw	x,#20485
3666  0306 cd0000        	call	_GPIO_WriteLow
3668  0309 84            	pop	a
3669                     ; 245     GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
3671  030a 4b02          	push	#2
3672  030c ae5005        	ldw	x,#20485
3673  030f cd0000        	call	_GPIO_WriteLow
3675  0312 84            	pop	a
3676                     ; 246     GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
3678  0313 4b04          	push	#4
3679  0315 ae5005        	ldw	x,#20485
3680  0318 cd0000        	call	_GPIO_WriteLow
3682  031b 84            	pop	a
3683                     ; 247     GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
3685  031c 4b08          	push	#8
3686  031e ae5005        	ldw	x,#20485
3687  0321 cd0000        	call	_GPIO_WriteLow
3689  0324 84            	pop	a
3690                     ; 248     pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3692  0325 4b04          	push	#4
3693  0327 ae500a        	ldw	x,#20490
3694  032a adbe          	call	_pulseLatch
3696  032c 84            	pop	a
3697                     ; 249     pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3699  032d 4b02          	push	#2
3700  032f ae500a        	ldw	x,#20490
3701  0332 adb6          	call	_pulseLatch
3703  0334 84            	pop	a
3704                     ; 250 }
3707  0335 81            	ret
3761                     ; 252 void atualizarDisplay(uint8_t valor)
3761                     ; 253 {
3762                     	switch	.text
3763  0336               _atualizarDisplay:
3765  0336 88            	push	a
3766  0337 89            	pushw	x
3767       00000002      OFST:	set	2
3770                     ; 254     uint8_t unidades = valor % 10;
3772  0338 5f            	clrw	x
3773  0339 97            	ld	xl,a
3774  033a a60a          	ld	a,#10
3775  033c 62            	div	x,a
3776  033d 5f            	clrw	x
3777  033e 97            	ld	xl,a
3778  033f 9f            	ld	a,xl
3779  0340 6b01          	ld	(OFST-1,sp),a
3781                     ; 255     uint8_t dezenas = valor / 10;
3783  0342 7b03          	ld	a,(OFST+1,sp)
3784  0344 5f            	clrw	x
3785  0345 97            	ld	xl,a
3786  0346 a60a          	ld	a,#10
3787  0348 62            	div	x,a
3788  0349 9f            	ld	a,xl
3789  034a 6b02          	ld	(OFST+0,sp),a
3791                     ; 258     writeBCD(unidades);
3793  034c 7b01          	ld	a,(OFST-1,sp)
3794  034e cd0279        	call	_writeBCD
3796                     ; 259     pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3798  0351 4b04          	push	#4
3799  0353 ae500a        	ldw	x,#20490
3800  0356 ad92          	call	_pulseLatch
3802  0358 84            	pop	a
3803                     ; 262     writeBCD(dezenas);
3805  0359 7b02          	ld	a,(OFST+0,sp)
3806  035b cd0279        	call	_writeBCD
3808                     ; 263     pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3810  035e 4b02          	push	#2
3811  0360 ae500a        	ldw	x,#20490
3812  0363 ad85          	call	_pulseLatch
3814  0365 84            	pop	a
3815                     ; 264 }
3818  0366 5b03          	addw	sp,#3
3819  0368 81            	ret
3881                     	xdef	f_TIM4_UPD_OVF_IRQHandler
3882                     	xdef	_main
3883                     	xdef	_atualizarDisplay
3884                     	xdef	_apagarDisplay
3885                     	xdef	_pulseLatch
3886                     	xdef	_writeBCD
3887                     	xdef	_TIM4_Config
3888                     	xdef	_InitCLOCK
3889                     	xdef	_InitGPIO
3890                     	xdef	_contador_ms_sequencia
3891                     	xdef	_fim_contagem_estado
3892                     	xdef	_contador_ms
3893                     	xdef	_em_contagem
3894                     	xdef	_tempo_restante
3895                     	xref	_TIM4_ClearITPendingBit
3896                     	xref	_TIM4_ITConfig
3897                     	xref	_TIM4_Cmd
3898                     	xref	_TIM4_TimeBaseInit
3899                     	xref	_TIM4_DeInit
3900                     	xref	_ITC_SetSoftwarePriority
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
3915                     	xref.b	c_x
3916                     	xref.b	c_y
3935                     	end
