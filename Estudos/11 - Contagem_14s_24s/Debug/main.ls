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
2659                     ; 132 main()
2659                     ; 133 {
2661                     	switch	.text
2662  0000               _main:
2664  0000 89            	pushw	x
2665       00000002      OFST:	set	2
2668                     ; 134 		SetCLK();        // Ajusta clock para 16 MHz (máxima velocidade ? leitura RF mais precisa)
2670  0001 cd03dc        	call	_SetCLK
2672                     ; 135     InitGPIO();      // Configura entradas e saídas
2674  0004 cd0384        	call	_InitGPIO
2676                     ; 136     UnlockE2prom();  // Permite gravação na EEPROM
2678  0007 cd03e1        	call	_UnlockE2prom
2680                     ; 137     onInt_TM6();     // Ativa Timer 6 para interrupção periódica usada na leitura RF
2682  000a cd03e7        	call	_onInt_TM6
2684                     ; 141     if (readCh1 == 0)
2686  000d 4b80          	push	#128
2687  000f ae5005        	ldw	x,#20485
2688  0012 cd0000        	call	_GPIO_ReadInputPin
2690  0015 5b01          	addw	sp,#1
2691  0017 4d            	tnz	a
2692  0018 2627          	jrne	L7761
2693                     ; 144         Delay(100); // Debounce simples
2695  001a ae0064        	ldw	x,#100
2696  001d 89            	pushw	x
2697  001e ae0000        	ldw	x,#0
2698  0021 89            	pushw	x
2699  0022 cd03c7        	call	_Delay
2701  0025 5b04          	addw	sp,#4
2702                     ; 145         for (i = 0; i < 4; i++)
2704  0027 5f            	clrw	x
2705  0028 1f01          	ldw	(OFST-1,sp),x
2707  002a               L1071:
2708                     ; 147             codControler[i] = 0x00; // Apaga todos os códigos RF da EEPROM
2710  002a 1e01          	ldw	x,(OFST-1,sp)
2711  002c 4f            	clr	a
2712  002d 1c0000        	addw	x,#_codControler
2713  0030 cd0000        	call	c_eewrc
2715                     ; 145         for (i = 0; i < 4; i++)
2717  0033 1e01          	ldw	x,(OFST-1,sp)
2718  0035 1c0001        	addw	x,#1
2719  0038 1f01          	ldw	(OFST-1,sp),x
2723  003a 1e01          	ldw	x,(OFST-1,sp)
2724  003c a30004        	cpw	x,#4
2725  003f 25e9          	jrult	L1071
2726  0041               L7761:
2727                     ; 153     LED1_ON;
2729  0041 4b04          	push	#4
2730  0043 ae500f        	ldw	x,#20495
2731  0046 cd0000        	call	_GPIO_WriteLow
2733  0049 84            	pop	a
2734                     ; 154     LED2_ON;
2736  004a 4b08          	push	#8
2737  004c ae500f        	ldw	x,#20495
2738  004f cd0000        	call	_GPIO_WriteLow
2740  0052 84            	pop	a
2741                     ; 155     LED3_ON;
2743  0053 4b10          	push	#16
2744  0055 ae500f        	ldw	x,#20495
2745  0058 cd0000        	call	_GPIO_WriteLow
2747  005b 84            	pop	a
2748                     ; 156     Delay(100000);
2750  005c ae86a0        	ldw	x,#34464
2751  005f 89            	pushw	x
2752  0060 ae0001        	ldw	x,#1
2753  0063 89            	pushw	x
2754  0064 cd03c7        	call	_Delay
2756  0067 5b04          	addw	sp,#4
2757                     ; 157     LED1_OFF;
2759  0069 4b04          	push	#4
2760  006b ae500f        	ldw	x,#20495
2761  006e cd0000        	call	_GPIO_WriteHigh
2763  0071 84            	pop	a
2764                     ; 158     LED2_OFF;
2766  0072 4b08          	push	#8
2767  0074 ae500f        	ldw	x,#20495
2768  0077 cd0000        	call	_GPIO_WriteHigh
2770  007a 84            	pop	a
2771                     ; 159     LED3_OFF;
2773  007b 4b10          	push	#16
2774  007d ae500f        	ldw	x,#20495
2775  0080 cd0000        	call	_GPIO_WriteHigh
2777  0083 84            	pop	a
2778                     ; 160     Delay(100000);
2780  0084 ae86a0        	ldw	x,#34464
2781  0087 89            	pushw	x
2782  0088 ae0001        	ldw	x,#1
2783  008b 89            	pushw	x
2784  008c cd03c7        	call	_Delay
2786  008f 5b04          	addw	sp,#4
2787                     ; 161     LED1_ON;
2789  0091 4b04          	push	#4
2790  0093 ae500f        	ldw	x,#20495
2791  0096 cd0000        	call	_GPIO_WriteLow
2793  0099 84            	pop	a
2794                     ; 162     LED2_ON;
2796  009a 4b08          	push	#8
2797  009c ae500f        	ldw	x,#20495
2798  009f cd0000        	call	_GPIO_WriteLow
2800  00a2 84            	pop	a
2801                     ; 163     LED3_ON;
2803  00a3 4b10          	push	#16
2804  00a5 ae500f        	ldw	x,#20495
2805  00a8 cd0000        	call	_GPIO_WriteLow
2807  00ab 84            	pop	a
2808                     ; 164     Delay(100000);
2810  00ac ae86a0        	ldw	x,#34464
2811  00af 89            	pushw	x
2812  00b0 ae0001        	ldw	x,#1
2813  00b3 89            	pushw	x
2814  00b4 cd03c7        	call	_Delay
2816  00b7 5b04          	addw	sp,#4
2817                     ; 165     LED1_OFF;
2819  00b9 4b04          	push	#4
2820  00bb ae500f        	ldw	x,#20495
2821  00be cd0000        	call	_GPIO_WriteHigh
2823  00c1 84            	pop	a
2824                     ; 166     LED2_OFF;
2826  00c2 4b08          	push	#8
2827  00c4 ae500f        	ldw	x,#20495
2828  00c7 cd0000        	call	_GPIO_WriteHigh
2830  00ca 84            	pop	a
2831                     ; 167     LED3_OFF;
2833  00cb 4b10          	push	#16
2834  00cd ae500f        	ldw	x,#20495
2835  00d0 cd0000        	call	_GPIO_WriteHigh
2837  00d3 84            	pop	a
2838                     ; 168     Delay(100000);
2840  00d4 ae86a0        	ldw	x,#34464
2841  00d7 89            	pushw	x
2842  00d8 ae0001        	ldw	x,#1
2843  00db 89            	pushw	x
2844  00dc cd03c7        	call	_Delay
2846  00df 5b04          	addw	sp,#4
2847                     ; 169     LED1_ON;
2849  00e1 4b04          	push	#4
2850  00e3 ae500f        	ldw	x,#20495
2851  00e6 cd0000        	call	_GPIO_WriteLow
2853  00e9 84            	pop	a
2854                     ; 170     LED2_ON;
2856  00ea 4b08          	push	#8
2857  00ec ae500f        	ldw	x,#20495
2858  00ef cd0000        	call	_GPIO_WriteLow
2860  00f2 84            	pop	a
2861                     ; 171     LED3_ON;
2863  00f3 4b10          	push	#16
2864  00f5 ae500f        	ldw	x,#20495
2865  00f8 cd0000        	call	_GPIO_WriteLow
2867  00fb 84            	pop	a
2868                     ; 172     Delay(100000);
2870  00fc ae86a0        	ldw	x,#34464
2871  00ff 89            	pushw	x
2872  0100 ae0001        	ldw	x,#1
2873  0103 89            	pushw	x
2874  0104 cd03c7        	call	_Delay
2876  0107 5b04          	addw	sp,#4
2877                     ; 173     LED1_OFF;
2879  0109 4b04          	push	#4
2880  010b ae500f        	ldw	x,#20495
2881  010e cd0000        	call	_GPIO_WriteHigh
2883  0111 84            	pop	a
2884                     ; 174     LED2_OFF;
2886  0112 4b08          	push	#8
2887  0114 ae500f        	ldw	x,#20495
2888  0117 cd0000        	call	_GPIO_WriteHigh
2890  011a 84            	pop	a
2891                     ; 175     LED3_OFF;
2893  011b 4b10          	push	#16
2894  011d ae500f        	ldw	x,#20495
2895  0120 cd0000        	call	_GPIO_WriteHigh
2897  0123 84            	pop	a
2898                     ; 176     Delay(100000);
2900  0124 ae86a0        	ldw	x,#34464
2901  0127 89            	pushw	x
2902  0128 ae0001        	ldw	x,#1
2903  012b 89            	pushw	x
2904  012c cd03c7        	call	_Delay
2906  012f 5b04          	addw	sp,#4
2907  0131               L7071:
2908                     ; 184         if (rf_cooldown > 0)
2910  0131 be08          	ldw	x,_rf_cooldown
2911  0133 2707          	jreq	L3171
2912                     ; 186             rf_cooldown--;
2914  0135 be08          	ldw	x,_rf_cooldown
2915  0137 1d0001        	subw	x,#1
2916  013a bf08          	ldw	_rf_cooldown,x
2917  013c               L3171:
2918                     ; 189         RF_IN_ON = TRUE; // Habilita leitura RF na leitura da interrupção
2920  013c 35010003      	mov	_RF_IN_ON,#1
2921                     ; 190         HT_RC_Code_Ready_Overwrite = FALSE; // Reseta flag do protocolo RF
2923  0140 3f00          	clr	_HT_RC_Code_Ready_Overwrite
2924                     ; 195         if (readCh1 == 0)
2926  0142 4b80          	push	#128
2927  0144 ae5005        	ldw	x,#20485
2928  0147 cd0000        	call	_GPIO_ReadInputPin
2930  014a 5b01          	addw	sp,#1
2931  014c 4d            	tnz	a
2932  014d 2703          	jreq	L6
2933  014f cc0209        	jp	L5171
2934  0152               L6:
2935                     ; 197             if (++debounceCh1 >= 250)
2937  0152 be04          	ldw	x,_debounceCh1
2938  0154 1c0001        	addw	x,#1
2939  0157 bf04          	ldw	_debounceCh1,x
2940  0159 a300fa        	cpw	x,#250
2941  015c 2403          	jruge	L01
2942  015e cc020c        	jp	L5271
2943  0161               L01:
2944                     ; 199                 --debounceCh1;
2946  0161 be04          	ldw	x,_debounceCh1
2947  0163 1d0001        	subw	x,#1
2948  0166 bf04          	ldw	_debounceCh1,x
2949                     ; 201                 LED1_OFF;
2951  0168 4b04          	push	#4
2952  016a ae500f        	ldw	x,#20495
2953  016d cd0000        	call	_GPIO_WriteHigh
2955  0170 84            	pop	a
2956                     ; 202 								LED2_OFF;
2958  0171 4b08          	push	#8
2959  0173 ae500f        	ldw	x,#20495
2960  0176 cd0000        	call	_GPIO_WriteHigh
2962  0179 84            	pop	a
2963                     ; 203 								LED3_OFF;
2965  017a 4b10          	push	#16
2966  017c ae500f        	ldw	x,#20495
2967  017f cd0000        	call	_GPIO_WriteHigh
2969  0182 84            	pop	a
2970                     ; 204                 BuzzerBeep(50000);
2972  0183 aec350        	ldw	x,#50000
2973  0186 cd02ac        	call	_BuzzerBeep
2975                     ; 206                 if (Code_Ready == TRUE)
2977  0189 b600          	ld	a,_Code_Ready
2978  018b a101          	cp	a,#1
2979  018d 2650          	jrne	L1271
2980                     ; 208                     save_code_to_eeprom(); // Salva o código recebido.
2982  018f cd02d1        	call	_save_code_to_eeprom
2984                     ; 209                     Code_Ready = FALSE;
2986  0192 3f00          	clr	_Code_Ready
2987                     ; 211                     LED1_OFF;
2989  0194 4b04          	push	#4
2990  0196 ae500f        	ldw	x,#20495
2991  0199 cd0000        	call	_GPIO_WriteHigh
2993  019c 84            	pop	a
2994                     ; 212 										LED2_OFF;
2996  019d 4b08          	push	#8
2997  019f ae500f        	ldw	x,#20495
2998  01a2 cd0000        	call	_GPIO_WriteHigh
3000  01a5 84            	pop	a
3001                     ; 213 										LED3_OFF;
3003  01a6 4b10          	push	#16
3004  01a8 ae500f        	ldw	x,#20495
3005  01ab cd0000        	call	_GPIO_WriteHigh
3007  01ae 84            	pop	a
3008                     ; 214                     BuzzerBeep(100000);
3010  01af ae86a0        	ldw	x,#34464
3011  01b2 cd02ac        	call	_BuzzerBeep
3013                     ; 215                     Delay(200000);
3015  01b5 ae0d40        	ldw	x,#3392
3016  01b8 89            	pushw	x
3017  01b9 ae0003        	ldw	x,#3
3018  01bc 89            	pushw	x
3019  01bd cd03c7        	call	_Delay
3021  01c0 5b04          	addw	sp,#4
3022                     ; 216                     LED1_ON;
3024  01c2 4b04          	push	#4
3025  01c4 ae500f        	ldw	x,#20495
3026  01c7 cd0000        	call	_GPIO_WriteLow
3028  01ca 84            	pop	a
3029                     ; 217                     LED2_ON;
3031  01cb 4b08          	push	#8
3032  01cd ae500f        	ldw	x,#20495
3033  01d0 cd0000        	call	_GPIO_WriteLow
3035  01d3 84            	pop	a
3036                     ; 218 										LED2_ON;
3038  01d4 4b08          	push	#8
3039  01d6 ae500f        	ldw	x,#20495
3040  01d9 cd0000        	call	_GPIO_WriteLow
3042  01dc 84            	pop	a
3044  01dd 202d          	jra	L5271
3045  01df               L1271:
3046                     ; 222                     Delay(100000);
3048  01df ae86a0        	ldw	x,#34464
3049  01e2 89            	pushw	x
3050  01e3 ae0001        	ldw	x,#1
3051  01e6 89            	pushw	x
3052  01e7 cd03c7        	call	_Delay
3054  01ea 5b04          	addw	sp,#4
3055                     ; 223                     LED1_ON;
3057  01ec 4b04          	push	#4
3058  01ee ae500f        	ldw	x,#20495
3059  01f1 cd0000        	call	_GPIO_WriteLow
3061  01f4 84            	pop	a
3062                     ; 224                     LED2_ON;
3064  01f5 4b08          	push	#8
3065  01f7 ae500f        	ldw	x,#20495
3066  01fa cd0000        	call	_GPIO_WriteLow
3068  01fd 84            	pop	a
3069                     ; 225 										LED2_ON;
3071  01fe 4b08          	push	#8
3072  0200 ae500f        	ldw	x,#20495
3073  0203 cd0000        	call	_GPIO_WriteLow
3075  0206 84            	pop	a
3076  0207 2003          	jra	L5271
3077  0209               L5171:
3078                     ; 231             debounceCh1 = 0;	// Reseta o contador se o botão for solto.
3080  0209 5f            	clrw	x
3081  020a bf04          	ldw	_debounceCh1,x
3082  020c               L5271:
3083                     ; 235         if (Code_Ready == TRUE && rf_cooldown == 0)
3085  020c b600          	ld	a,_Code_Ready
3086  020e a101          	cp	a,#1
3087  0210 2612          	jrne	L7271
3089  0212 be08          	ldw	x,_rf_cooldown
3090  0214 260e          	jrne	L7271
3091                     ; 237             searchCode(); // Busca código na EEPROM e executa a ação
3093  0216 cd02f4        	call	_searchCode
3095                     ; 238             Code_Ready = FALSE;	// Reseta a flag para o próximo comando.
3097  0219 3f00          	clr	_Code_Ready
3098                     ; 241             rf_cooldown = 3000;
3100  021b ae0bb8        	ldw	x,#3000
3101  021e bf08          	ldw	_rf_cooldown,x
3103  0220 ac310131      	jpf	L7071
3104  0224               L7271:
3105                     ; 243         else if (Code_Ready == TRUE && rf_cooldown > 0)
3107  0224 b600          	ld	a,_Code_Ready
3108  0226 a101          	cp	a,#1
3109  0228 2703          	jreq	L21
3110  022a cc0131        	jp	L7071
3111  022d               L21:
3113  022d be08          	ldw	x,_rf_cooldown
3114  022f 2603          	jrne	L41
3115  0231 cc0131        	jp	L7071
3116  0234               L41:
3117                     ; 246             Code_Ready = FALSE;
3119  0234 3f00          	clr	_Code_Ready
3120  0236 ac310131      	jpf	L7071
3147                     ; 269 void ToggleLED1(void)
3147                     ; 270 {
3148                     	switch	.text
3149  023a               _ToggleLED1:
3153                     ; 271     if (led1State)
3155  023a 3d00          	tnz	_led1State
3156  023c 270b          	jreq	L5471
3157                     ; 273         LED1_OFF;
3159  023e 4b04          	push	#4
3160  0240 ae500f        	ldw	x,#20495
3161  0243 cd0000        	call	_GPIO_WriteHigh
3163  0246 84            	pop	a
3165  0247 2009          	jra	L7471
3166  0249               L5471:
3167                     ; 278         LED1_ON;
3169  0249 4b04          	push	#4
3170  024b ae500f        	ldw	x,#20495
3171  024e cd0000        	call	_GPIO_WriteLow
3173  0251 84            	pop	a
3174  0252               L7471:
3175                     ; 281 		Delay(100000);
3177  0252 ae86a0        	ldw	x,#34464
3178  0255 89            	pushw	x
3179  0256 ae0001        	ldw	x,#1
3180  0259 89            	pushw	x
3181  025a cd03c7        	call	_Delay
3183  025d 5b04          	addw	sp,#4
3184                     ; 282 }
3187  025f 81            	ret
3214                     ; 297 void ToggleLED2(void)
3214                     ; 298 {
3215                     	switch	.text
3216  0260               _ToggleLED2:
3220                     ; 299     if (led2State)
3222  0260 3d01          	tnz	_led2State
3223  0262 270b          	jreq	L1671
3224                     ; 301         LED2_OFF;
3226  0264 4b08          	push	#8
3227  0266 ae500f        	ldw	x,#20495
3228  0269 cd0000        	call	_GPIO_WriteHigh
3230  026c 84            	pop	a
3232  026d 2009          	jra	L3671
3233  026f               L1671:
3234                     ; 306         LED2_ON;
3236  026f 4b08          	push	#8
3237  0271 ae500f        	ldw	x,#20495
3238  0274 cd0000        	call	_GPIO_WriteLow
3240  0277 84            	pop	a
3241  0278               L3671:
3242                     ; 309 		Delay(100000);
3244  0278 ae86a0        	ldw	x,#34464
3245  027b 89            	pushw	x
3246  027c ae0001        	ldw	x,#1
3247  027f 89            	pushw	x
3248  0280 cd03c7        	call	_Delay
3250  0283 5b04          	addw	sp,#4
3251                     ; 310 }
3254  0285 81            	ret
3281                     ; 325 void ToggleLED3(void)
3281                     ; 326 {
3282                     	switch	.text
3283  0286               _ToggleLED3:
3287                     ; 327     if (led3State)
3289  0286 3d02          	tnz	_led3State
3290  0288 270b          	jreq	L5771
3291                     ; 329         LED3_OFF;
3293  028a 4b10          	push	#16
3294  028c ae500f        	ldw	x,#20495
3295  028f cd0000        	call	_GPIO_WriteHigh
3297  0292 84            	pop	a
3299  0293 2009          	jra	L7771
3300  0295               L5771:
3301                     ; 334         LED3_ON;
3303  0295 4b10          	push	#16
3304  0297 ae500f        	ldw	x,#20495
3305  029a cd0000        	call	_GPIO_WriteLow
3307  029d 84            	pop	a
3308  029e               L7771:
3309                     ; 337 		Delay(100000);
3311  029e ae86a0        	ldw	x,#34464
3312  02a1 89            	pushw	x
3313  02a2 ae0001        	ldw	x,#1
3314  02a5 89            	pushw	x
3315  02a6 cd03c7        	call	_Delay
3317  02a9 5b04          	addw	sp,#4
3318                     ; 338 }
3321  02ab 81            	ret
3358                     ; 357 void BuzzerBeep(uint16_t duration)
3358                     ; 358 {
3359                     	switch	.text
3360  02ac               _BuzzerBeep:
3362  02ac 89            	pushw	x
3363       00000000      OFST:	set	0
3366                     ; 359     BUZZER_ON;
3368  02ad 4b01          	push	#1
3369  02af ae500f        	ldw	x,#20495
3370  02b2 cd0000        	call	_GPIO_WriteHigh
3372  02b5 84            	pop	a
3373                     ; 360     Delay(duration);
3375  02b6 1e01          	ldw	x,(OFST+1,sp)
3376  02b8 cd0000        	call	c_uitolx
3378  02bb be02          	ldw	x,c_lreg+2
3379  02bd 89            	pushw	x
3380  02be be00          	ldw	x,c_lreg
3381  02c0 89            	pushw	x
3382  02c1 cd03c7        	call	_Delay
3384  02c4 5b04          	addw	sp,#4
3385                     ; 361     BUZZER_OFF;
3387  02c6 4b01          	push	#1
3388  02c8 ae500f        	ldw	x,#20495
3389  02cb cd0000        	call	_GPIO_WriteLow
3391  02ce 84            	pop	a
3392                     ; 362 }
3395  02cf 85            	popw	x
3396  02d0 81            	ret
3433                     ; 378 void save_code_to_eeprom(void)
3433                     ; 379 {
3434                     	switch	.text
3435  02d1               _save_code_to_eeprom:
3437  02d1 89            	pushw	x
3438       00000002      OFST:	set	2
3441                     ; 380     int i = 0;
3443                     ; 381     codControler[i]     = RF_CopyBuffer[0];
3445  02d2 b600          	ld	a,_RF_CopyBuffer
3446  02d4 ae0000        	ldw	x,#_codControler
3447  02d7 cd0000        	call	c_eewrc
3449                     ; 382     codControler[i + 1] = RF_CopyBuffer[1];
3451  02da b601          	ld	a,_RF_CopyBuffer+1
3452  02dc ae0001        	ldw	x,#_codControler+1
3453  02df cd0000        	call	c_eewrc
3455                     ; 383     codControler[i + 2] = RF_CopyBuffer[2];
3457  02e2 b602          	ld	a,_RF_CopyBuffer+2
3458  02e4 ae0002        	ldw	x,#_codControler+2
3459  02e7 cd0000        	call	c_eewrc
3461                     ; 384     codControler[i + 3] = RF_CopyBuffer[3];
3463  02ea b603          	ld	a,_RF_CopyBuffer+3
3464  02ec ae0003        	ldw	x,#_codControler+3
3465  02ef cd0000        	call	c_eewrc
3467                     ; 385 }
3470  02f2 85            	popw	x
3471  02f3 81            	ret
3533                     ; 407 uint8_t searchCode(void)
3533                     ; 408 {
3534                     	switch	.text
3535  02f4               _searchCode:
3537  02f4 5204          	subw	sp,#4
3538       00000004      OFST:	set	4
3541                     ; 409     int i = 0;
3543                     ; 414     id_salvo_mascarado    = codControler[i + 2] & 0xFC;
3545  02f6 c60002        	ld	a,_codControler+2
3546  02f9 a4fc          	and	a,#252
3547  02fb 6b03          	ld	(OFST-1,sp),a
3549                     ; 415     id_recebido_mascarado = RF_CopyBuffer[2]  & 0xFC;
3551  02fd b602          	ld	a,_RF_CopyBuffer+2
3552  02ff a4fc          	and	a,#252
3553  0301 6b04          	ld	(OFST+0,sp),a
3555                     ; 418     if (codControler[i]     == RF_CopyBuffer[0] && 
3555                     ; 419         codControler[i + 1] == RF_CopyBuffer[1] &&
3555                     ; 420         id_salvo_mascarado  == id_recebido_mascarado && // Compara usando a máscara
3555                     ; 421         codControler[i + 3] == RF_CopyBuffer[3])
3557  0303 c60000        	ld	a,_codControler
3558  0306 b100          	cp	a,_RF_CopyBuffer
3559  0308 266f          	jrne	L3602
3561  030a c60001        	ld	a,_codControler+1
3562  030d b101          	cp	a,_RF_CopyBuffer+1
3563  030f 2668          	jrne	L3602
3565  0311 7b03          	ld	a,(OFST-1,sp)
3566  0313 1104          	cp	a,(OFST+0,sp)
3567  0315 2662          	jrne	L3602
3569  0317 c60003        	ld	a,_codControler+3
3570  031a b103          	cp	a,_RF_CopyBuffer+3
3571  031c 265b          	jrne	L3602
3572                     ; 425         if ((RF_CopyBuffer[2] & 0x03) == 0x01) // Tecla 1
3574  031e b602          	ld	a,_RF_CopyBuffer+2
3575  0320 a403          	and	a,#3
3576  0322 a101          	cp	a,#1
3577  0324 2616          	jrne	L5602
3578                     ; 427 						led1State = !led1State;
3580  0326 3d00          	tnz	_led1State
3581  0328 2604          	jrne	L23
3582  032a a601          	ld	a,#1
3583  032c 2001          	jra	L43
3584  032e               L23:
3585  032e 4f            	clr	a
3586  032f               L43:
3587  032f b700          	ld	_led1State,a
3588                     ; 428             ToggleLED1();
3590  0331 cd023a        	call	_ToggleLED1
3592                     ; 429             BuzzerBeep(30000);
3594  0334 ae7530        	ldw	x,#30000
3595  0337 cd02ac        	call	_BuzzerBeep
3598  033a 203a          	jra	L7602
3599  033c               L5602:
3600                     ; 431         else if ((RF_CopyBuffer[2] & 0x03) == 0x02) // Tecla 2
3602  033c b602          	ld	a,_RF_CopyBuffer+2
3603  033e a403          	and	a,#3
3604  0340 a102          	cp	a,#2
3605  0342 2616          	jrne	L1702
3606                     ; 433             ToggleLED2();
3608  0344 cd0260        	call	_ToggleLED2
3610                     ; 434 						led2State = !led2State;
3612  0347 3d01          	tnz	_led2State
3613  0349 2604          	jrne	L63
3614  034b a601          	ld	a,#1
3615  034d 2001          	jra	L04
3616  034f               L63:
3617  034f 4f            	clr	a
3618  0350               L04:
3619  0350 b701          	ld	_led2State,a
3620                     ; 435             BuzzerBeep(30000);
3622  0352 ae7530        	ldw	x,#30000
3623  0355 cd02ac        	call	_BuzzerBeep
3626  0358 201c          	jra	L7602
3627  035a               L1702:
3628                     ; 437         else if ((RF_CopyBuffer[2] & 0x03) == 0x03) // Tecla 3 (ou 4 dependendo do controle)
3630  035a b602          	ld	a,_RF_CopyBuffer+2
3631  035c a403          	and	a,#3
3632  035e a103          	cp	a,#3
3633  0360 2614          	jrne	L7602
3634                     ; 439             ToggleLED3();
3636  0362 cd0286        	call	_ToggleLED3
3638                     ; 440 						led3State = !led3State;
3640  0365 3d02          	tnz	_led3State
3641  0367 2604          	jrne	L24
3642  0369 a601          	ld	a,#1
3643  036b 2001          	jra	L44
3644  036d               L24:
3645  036d 4f            	clr	a
3646  036e               L44:
3647  036e b702          	ld	_led3State,a
3648                     ; 441             BuzzerBeep(30000);
3650  0370 ae7530        	ldw	x,#30000
3651  0373 cd02ac        	call	_BuzzerBeep
3653  0376               L7602:
3654                     ; 444         return 0; // Código encontrado e ação executada
3656  0376 4f            	clr	a
3658  0377 2008          	jra	L64
3659  0379               L3602:
3660                     ; 449         BuzzerBeep(15000);
3662  0379 ae3a98        	ldw	x,#15000
3663  037c cd02ac        	call	_BuzzerBeep
3665                     ; 450         return 1;
3667  037f a601          	ld	a,#1
3669  0381               L64:
3671  0381 5b04          	addw	sp,#4
3672  0383 81            	ret
3696                     ; 469 void InitGPIO(void)
3696                     ; 470 {
3697                     	switch	.text
3698  0384               _InitGPIO:
3702                     ; 472     GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); // Botão CH1
3704  0384 4b40          	push	#64
3705  0386 4b80          	push	#128
3706  0388 ae5005        	ldw	x,#20485
3707  038b cd0000        	call	_GPIO_Init
3709  038e 85            	popw	x
3710                     ; 473     GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // Botão CH2
3712  038f 4b40          	push	#64
3713  0391 4b10          	push	#16
3714  0393 ae5019        	ldw	x,#20505
3715  0396 cd0000        	call	_GPIO_Init
3717  0399 85            	popw	x
3718                     ; 476     GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST); // Buzzer no PD0
3720  039a 4be0          	push	#224
3721  039c 4b01          	push	#1
3722  039e ae500f        	ldw	x,#20495
3723  03a1 cd0000        	call	_GPIO_Init
3725  03a4 85            	popw	x
3726                     ; 477     GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); // LED1 no PD2
3728  03a5 4be0          	push	#224
3729  03a7 4b04          	push	#4
3730  03a9 ae500f        	ldw	x,#20495
3731  03ac cd0000        	call	_GPIO_Init
3733  03af 85            	popw	x
3734                     ; 478     GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // LED2 no PD3
3736  03b0 4be0          	push	#224
3737  03b2 4b08          	push	#8
3738  03b4 ae500f        	ldw	x,#20495
3739  03b7 cd0000        	call	_GPIO_Init
3741  03ba 85            	popw	x
3742                     ; 479     GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST); // LED3 no PD4
3744  03bb 4be0          	push	#224
3745  03bd 4b10          	push	#16
3746  03bf ae500f        	ldw	x,#20495
3747  03c2 cd0000        	call	_GPIO_Init
3749  03c5 85            	popw	x
3750                     ; 480 }
3753  03c6 81            	ret
3787                     ; 497 void Delay(uint32_t nCount)
3787                     ; 498 {
3788                     	switch	.text
3789  03c7               _Delay:
3791       00000000      OFST:	set	0
3794  03c7 2009          	jra	L1312
3795  03c9               L7212:
3796                     ; 501         nCount--;
3798  03c9 96            	ldw	x,sp
3799  03ca 1c0003        	addw	x,#OFST+3
3800  03cd a601          	ld	a,#1
3801  03cf cd0000        	call	c_lgsbc
3803  03d2               L1312:
3804                     ; 499     while (nCount != 0)
3806  03d2 96            	ldw	x,sp
3807  03d3 1c0003        	addw	x,#OFST+3
3808  03d6 cd0000        	call	c_lzmp
3810  03d9 26ee          	jrne	L7212
3811                     ; 503 }
3814  03db 81            	ret
3838                     ; 519 void SetCLK(void)
3838                     ; 520 {
3839                     	switch	.text
3840  03dc               _SetCLK:
3844                     ; 521     CLK_CKDIVR = 0b00000000; // Sem divisão, máxima frequência
3846  03dc 725f50c6      	clr	_CLK_CKDIVR
3847                     ; 522 }
3850  03e0 81            	ret
3874                     ; 539 void UnlockE2prom(void)
3874                     ; 540 {
3875                     	switch	.text
3876  03e1               _UnlockE2prom:
3880                     ; 541     FLASH_Unlock(FLASH_MEMTYPE_DATA);
3882  03e1 a6f7          	ld	a,#247
3883  03e3 cd0000        	call	_FLASH_Unlock
3885                     ; 542 }
3888  03e6 81            	ret
3917                     ; 562 void onInt_TM6(void)
3917                     ; 563 {
3918                     	switch	.text
3919  03e7               _onInt_TM6:
3923                     ; 564     TIM6_CR1  = 0b00000001; // Liga Timer 6
3925  03e7 35015340      	mov	_TIM6_CR1,#1
3926                     ; 565     TIM6_IER  = 0b00000001; // Habilita interrupção
3928  03eb 35015343      	mov	_TIM6_IER,#1
3929                     ; 566     TIM6_CNTR = 0b00000001; // Inicializa contador
3931  03ef 35015346      	mov	_TIM6_CNTR,#1
3932                     ; 567     TIM6_ARR  = 0b00000001; // Valor inicial do ARR
3934  03f3 35015348      	mov	_TIM6_ARR,#1
3935                     ; 568     TIM6_SR   = 0b00000001; // Limpa flag de status
3937  03f7 35015344      	mov	_TIM6_SR,#1
3938                     ; 569     TIM6_PSCR = 0b00000010; // Prescaler
3940  03fb 35025347      	mov	_TIM6_PSCR,#2
3941                     ; 570     TIM6_ARR  = 198;        // Valor para gerar 50us (com 16MHz)
3943  03ff 35c65348      	mov	_TIM6_ARR,#198
3944                     ; 571     TIM6_IER  |= 0x00;
3946  0403 c65343        	ld	a,_TIM6_IER
3947                     ; 572     TIM6_CR1  |= 0x00;
3949  0406 c65340        	ld	a,_TIM6_CR1
3950                     ; 574     RIM             // Habilita interrupções globais
3953  0409 9a            RIM             // Habilita interrupções globais
3955                     ; 576 }
3958  040a 81            	ret
3985                     ; 596 @far @interrupt void TIM6_UPD_IRQHandler (void)
3985                     ; 597 {
3987                     	switch	.text
3988  040b               f_TIM6_UPD_IRQHandler:
3990  040b 8a            	push	cc
3991  040c 84            	pop	a
3992  040d a4bf          	and	a,#191
3993  040f 88            	push	a
3994  0410 86            	pop	cc
3995  0411 3b0002        	push	c_x+2
3996  0414 be00          	ldw	x,c_x
3997  0416 89            	pushw	x
3998  0417 3b0002        	push	c_y+2
3999  041a be00          	ldw	x,c_y
4000  041c 89            	pushw	x
4003                     ; 598     if(RF_IN_ON)
4005  041d 3d03          	tnz	_RF_IN_ON
4006  041f 2703          	jreq	L5712
4007                     ; 600         Read_RF_6P20(); // Decodifica sinal RF recebido pela antena
4009  0421 cd0000        	call	_Read_RF_6P20
4011  0424               L5712:
4012                     ; 602     TIM6_SR = 0;
4014  0424 725f5344      	clr	_TIM6_SR
4015                     ; 603 }
4018  0428 85            	popw	x
4019  0429 bf00          	ldw	c_y,x
4020  042b 320002        	pop	c_y+2
4021  042e 85            	popw	x
4022  042f bf00          	ldw	c_x,x
4023  0431 320002        	pop	c_x+2
4024  0434 80            	iret
4135                     	xdef	f_TIM6_UPD_IRQHandler
4136                     	xdef	_main
4137                     	xdef	_BuzzerBeep
4138                     	xdef	_searchCode
4139                     	xdef	_save_code_to_eeprom
4140                     	xdef	_UnlockE2prom
4141                     	xdef	_onInt_TM6
4142                     	xdef	_ToggleLED3
4143                     	xdef	_ToggleLED2
4144                     	xdef	_ToggleLED1
4145                     	xdef	_SetCLK
4146                     	xdef	_Delay
4147                     	xdef	_InitGPIO
4148                     .eeprom:	section	.data
4149  0000               _codControler:
4150  0000 00000000      	ds.b	4
4151                     	xdef	_codControler
4152                     	xdef	_rf_cooldown
4153                     	xdef	_debounceCh2
4154                     	xdef	_debounceCh1
4155                     	xdef	_RF_IN_ON
4156                     	xdef	_led3State
4157                     	xdef	_led2State
4158                     	xdef	_led1State
4159                     	xref	_Read_RF_6P20
4160                     	xref.b	_Code_Ready
4161                     	xref.b	_HT_RC_Code_Ready_Overwrite
4162                     	xref.b	_RF_CopyBuffer
4163                     	xref	_GPIO_ReadInputPin
4164                     	xref	_GPIO_WriteLow
4165                     	xref	_GPIO_WriteHigh
4166                     	xref	_GPIO_Init
4167                     	xref	_FLASH_Unlock
4168                     	xref.b	c_lreg
4169                     	xref.b	c_x
4170                     	xref.b	c_y
4190                     	xref	c_lzmp
4191                     	xref	c_lgsbc
4192                     	xref	c_uitolx
4193                     	xref	c_eewrc
4194                     	end
