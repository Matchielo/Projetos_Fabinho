   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     	bsct
2589  0000               _pwm_call_h:
2590  0000 01f4          	dc.w	500
2591  0002               _pwm_call_l:
2592  0002 01f4          	dc.w	500
2593  0004               _pwm_call_fbk:
2594  0004 01f4          	dc.w	500
2595  0006               _pwm_alm_offh:
2596  0006 01f4          	dc.w	500
2597  0008               _pwm_alarm_h:
2598  0008 01f4          	dc.w	500
2599  000a               _pwm_alarm_l:
2600  000a 01f4          	dc.w	500
2601  000c               _i:
2602  000c 0000          	dc.w	0
2603  000e               _RF_IN_ON:
2604  000e 00            	dc.b	0
2605  000f               _dataEpromVector2:
2606  000f 0000          	dc.w	0
2607  0011               _dataBufferVector2:
2608  0011 0000          	dc.w	0
2609  0013               _sinLed:
2610  0013 00            	dc.b	0
2611  0014               _setCountP:
2612  0014 00            	dc.b	0
2613  0015               _setCountC:
2614  0015 00            	dc.b	0
2615  0016               _setCountE:
2616  0016 00            	dc.b	0
2617  0017               _setRepeat:
2618  0017 00            	dc.b	0
2619  0018               _stateBot:
2620  0018 00            	dc.b	0
2621  0019               _delayOn:
2622  0019 0000          	dc.w	0
2623  001b               _contMSeg:
2624  001b 00            	dc.b	0
2625  001c               _contSeg:
2626  001c 00            	dc.b	0
2627  001d               _debounceCh1:
2628  001d 0000          	dc.w	0
2629  001f               _debounceCh2:
2630  001f 0000          	dc.w	0
2631  0021               _counterP:
2632  0021 0000          	dc.w	0
2633  0023               _counterC:
2634  0023 0000          	dc.w	0
2635  0025               _counterE:
2636  0025 0000          	dc.w	0
2637  0027               _repeatCall:
2638  0027 0000          	dc.w	0
2639  0029               _digUni:
2640  0029 00            	dc.b	0
2641  002a               _digDez:
2642  002a 00            	dc.b	0
2643  002b               _digCen:
2644  002b 00            	dc.b	0
2645  002c               _guiDez:
2646  002c 00            	dc.b	0
2647  002d               _guiUni:
2648  002d 00            	dc.b	0
2649  002e               _guiFilaP:
2650  002e 00            	dc.b	0
2651  002f               _guiFilaC:
2652  002f 00            	dc.b	0
2653  0030               _guiFilaE:
2654  0030 00            	dc.b	0
2655  0031               _readChannel1:
2656  0031 00            	dc.b	0
2657  0032               _readChannel2:
2658  0032 00            	dc.b	0
2659  0033               _numGuiche:
2660  0033 00            	dc.b	0
2661  0034               _ultimaFilaChamada:
2662  0034 00            	dc.b	0
2663  0035               _saveData:
2664  0035 0000          	dc.w	0
2665  0037               _fh:
2666  0037 32            	dc.b	50
2667  0038               _vh:
2668  0038 19            	dc.b	25
2669  0039               _fl:
2670  0039 27            	dc.b	39
2671  003a               _vl:
2672  003a 12            	dc.b	18
2752                     ; 121 main()
2752                     ; 122 {
2754                     	switch	.text
2755  0000               _main:
2757  0000 89            	pushw	x
2758       00000002      OFST:	set	2
2761                     ; 123 	SetCLK(); 			// Init Clock to 16Mhz
2763  0001 cd0897        	call	_SetCLK
2765                     ; 124 	InitGPIO();			//
2767  0004 cd0829        	call	_InitGPIO
2769                     ; 125 	InitADC();			// Init adc conv. to set siren volum.
2771  0007 cd0828        	call	_InitADC
2773                     ; 126 	UnlockE2prom(); // Unlick inside eeprom
2775  000a cd089c        	call	_UnlockE2prom
2777                     ; 127 	TIM1_Config();  // Config PWM siren
2779  000d cd0787        	call	L3561_TIM1_Config
2781                     ; 128 	onInt_TM6();		// Config TIM6 to 50us interrupt receiving RF
2783  0010 cd0804        	call	_onInt_TM6
2785                     ; 131 	readChannel1 = readCh1;
2787  0013 4b80          	push	#128
2788  0015 ae5005        	ldw	x,#20485
2789  0018 cd0000        	call	_GPIO_ReadInputPin
2791  001b 5b01          	addw	sp,#1
2792  001d b731          	ld	_readChannel1,a
2793                     ; 132 	if (readChannel1 == 0)
2796  001f 3d31          	tnz	_readChannel1
2797  0021 2629          	jrne	L1071
2798                     ; 135 		Delay(100);
2800  0023 ae0064        	ldw	x,#100
2801  0026 89            	pushw	x
2802  0027 ae0000        	ldw	x,#0
2803  002a 89            	pushw	x
2804  002b cd0882        	call	_Delay
2806  002e 5b04          	addw	sp,#4
2807                     ; 136 		for (i = 4; i <= 400; i++)
2809  0030 ae0004        	ldw	x,#4
2810  0033 1f01          	ldw	(OFST-1,sp),x
2812  0035               L3071:
2813                     ; 138 			codGuiche1[i] = 0x00;
2815  0035 1e01          	ldw	x,(OFST-1,sp)
2816  0037 4f            	clr	a
2817  0038 1c0000        	addw	x,#_codGuiche1
2818  003b cd0000        	call	c_eewrc
2820                     ; 136 		for (i = 4; i <= 400; i++)
2822  003e 1e01          	ldw	x,(OFST-1,sp)
2823  0040 1c0001        	addw	x,#1
2824  0043 1f01          	ldw	(OFST-1,sp),x
2828  0045 1e01          	ldw	x,(OFST-1,sp)
2829  0047 a30191        	cpw	x,#401
2830  004a 25e9          	jrult	L3071
2831  004c               L1071:
2832                     ; 142 	showDisplay(888);
2834  004c ae0378        	ldw	x,#888
2835  004f cd0522        	call	_showDisplay
2837                     ; 143 	buzzerOnHi();
2839  0052 cd07b2        	call	_buzzerOnHi
2841                     ; 144 	Delay(100000);		
2843  0055 ae86a0        	ldw	x,#34464
2844  0058 89            	pushw	x
2845  0059 ae0001        	ldw	x,#1
2846  005c 89            	pushw	x
2847  005d cd0882        	call	_Delay
2849  0060 5b04          	addw	sp,#4
2850                     ; 145 	showDisplay(dataNull);
2852  0062 ae03e8        	ldw	x,#1000
2853  0065 cd0522        	call	_showDisplay
2855                     ; 146 	buzzerOnLow();
2857  0068 cd07cd        	call	_buzzerOnLow
2859                     ; 147 	Delay(100000);
2861  006b ae86a0        	ldw	x,#34464
2862  006e 89            	pushw	x
2863  006f ae0001        	ldw	x,#1
2864  0072 89            	pushw	x
2865  0073 cd0882        	call	_Delay
2867  0076 5b04          	addw	sp,#4
2868                     ; 148 	showDisplay(888);
2870  0078 ae0378        	ldw	x,#888
2871  007b cd0522        	call	_showDisplay
2873                     ; 149 	buzzerOnHi();
2875  007e cd07b2        	call	_buzzerOnHi
2877                     ; 150 	Delay(100000);
2879  0081 ae86a0        	ldw	x,#34464
2880  0084 89            	pushw	x
2881  0085 ae0001        	ldw	x,#1
2882  0088 89            	pushw	x
2883  0089 cd0882        	call	_Delay
2885  008c 5b04          	addw	sp,#4
2886                     ; 151 	showDisplay(dataNull);
2888  008e ae03e8        	ldw	x,#1000
2889  0091 cd0522        	call	_showDisplay
2891                     ; 152 	buzzerOnLow();
2893  0094 cd07cd        	call	_buzzerOnLow
2895                     ; 153 	Delay(100000);
2897  0097 ae86a0        	ldw	x,#34464
2898  009a 89            	pushw	x
2899  009b ae0001        	ldw	x,#1
2900  009e 89            	pushw	x
2901  009f cd0882        	call	_Delay
2903  00a2 5b04          	addw	sp,#4
2904                     ; 154 	showDisplay(0);
2906  00a4 5f            	clrw	x
2907  00a5 cd0522        	call	_showDisplay
2909                     ; 155 	turnOffbuzzer();
2911  00a8 cd07fb        	call	_turnOffbuzzer
2913  00ab               L1171:
2914                     ; 160 		RF_IN_ON = TRUE;
2916  00ab 3501000e      	mov	_RF_IN_ON,#1
2917                     ; 161 		HT_RC_Code_Ready_Overwrite = FALSE;
2919  00af 3f00          	clr	_HT_RC_Code_Ready_Overwrite
2920                     ; 164 		if (setCountP == TRUE)
2922  00b1 b614          	ld	a,_setCountP
2923  00b3 a101          	cp	a,#1
2924  00b5 2661          	jrne	L5171
2925                     ; 166 			if (++counterP >= 1000)
2927  00b7 be21          	ldw	x,_counterP
2928  00b9 1c0001        	addw	x,#1
2929  00bc bf21          	ldw	_counterP,x
2930  00be a303e8        	cpw	x,#1000
2931  00c1 2507          	jrult	L7171
2932                     ; 168 				counterP = 0;
2934  00c3 5f            	clrw	x
2935  00c4 bf21          	ldw	_counterP,x
2936                     ; 169 				setCountP = FALSE;
2938  00c6 3f14          	clr	_setCountP
2940  00c8 2002          	jra	L1271
2941  00ca               L7171:
2942                     ; 173 				setCountP = FALSE;
2944  00ca 3f14          	clr	_setCountP
2945  00cc               L1271:
2946                     ; 176 			showCharP();
2948  00cc cd072c        	call	_showCharP
2950                     ; 178 			showDisplay(dataNull);
2952  00cf ae03e8        	ldw	x,#1000
2953  00d2 cd0522        	call	_showDisplay
2955                     ; 179 			buzzerOnHi();
2957  00d5 cd07b2        	call	_buzzerOnHi
2959                     ; 180 			Delay(100000);		
2961  00d8 ae86a0        	ldw	x,#34464
2962  00db 89            	pushw	x
2963  00dc ae0001        	ldw	x,#1
2964  00df 89            	pushw	x
2965  00e0 cd0882        	call	_Delay
2967  00e3 5b04          	addw	sp,#4
2968                     ; 181 			showDisplay(counterP);
2970  00e5 be21          	ldw	x,_counterP
2971  00e7 cd0522        	call	_showDisplay
2973                     ; 182 			buzzerOnLow();
2975  00ea cd07cd        	call	_buzzerOnLow
2977                     ; 183 			Delay(100000);
2979  00ed ae86a0        	ldw	x,#34464
2980  00f0 89            	pushw	x
2981  00f1 ae0001        	ldw	x,#1
2982  00f4 89            	pushw	x
2983  00f5 cd0882        	call	_Delay
2985  00f8 5b04          	addw	sp,#4
2986                     ; 184 			showDisplay(dataNull);
2988  00fa ae03e8        	ldw	x,#1000
2989  00fd cd0522        	call	_showDisplay
2991                     ; 185 			buzzerOnHi();
2993  0100 cd07b2        	call	_buzzerOnHi
2995                     ; 186 			Delay(100000);
2997  0103 ae86a0        	ldw	x,#34464
2998  0106 89            	pushw	x
2999  0107 ae0001        	ldw	x,#1
3000  010a 89            	pushw	x
3001  010b cd0882        	call	_Delay
3003  010e 5b04          	addw	sp,#4
3004                     ; 187 			showDisplay(counterP);
3006  0110 be21          	ldw	x,_counterP
3007  0112 cd0522        	call	_showDisplay
3009                     ; 188 			turnOffbuzzer();
3011  0115 cd07fb        	call	_turnOffbuzzer
3013  0118               L5171:
3014                     ; 191 		if (setCountC == TRUE)
3016  0118 b615          	ld	a,_setCountC
3017  011a a101          	cp	a,#1
3018  011c 2661          	jrne	L3271
3019                     ; 193 			if (++counterC >= 1000)
3021  011e be23          	ldw	x,_counterC
3022  0120 1c0001        	addw	x,#1
3023  0123 bf23          	ldw	_counterC,x
3024  0125 a303e8        	cpw	x,#1000
3025  0128 2507          	jrult	L5271
3026                     ; 195 				counterC = 0;
3028  012a 5f            	clrw	x
3029  012b bf23          	ldw	_counterC,x
3030                     ; 196 				setCountC = FALSE;
3032  012d 3f15          	clr	_setCountC
3034  012f 2002          	jra	L7271
3035  0131               L5271:
3036                     ; 200 				setCountC = FALSE;
3038  0131 3f15          	clr	_setCountC
3039  0133               L7271:
3040                     ; 203 			showCharC();
3042  0133 cd074d        	call	_showCharC
3044                     ; 205 			showDisplay(dataNull);
3046  0136 ae03e8        	ldw	x,#1000
3047  0139 cd0522        	call	_showDisplay
3049                     ; 206 			buzzerOnHi();
3051  013c cd07b2        	call	_buzzerOnHi
3053                     ; 207 			Delay(100000);		
3055  013f ae86a0        	ldw	x,#34464
3056  0142 89            	pushw	x
3057  0143 ae0001        	ldw	x,#1
3058  0146 89            	pushw	x
3059  0147 cd0882        	call	_Delay
3061  014a 5b04          	addw	sp,#4
3062                     ; 208 			showDisplay(counterC);
3064  014c be23          	ldw	x,_counterC
3065  014e cd0522        	call	_showDisplay
3067                     ; 209 			buzzerOnLow();
3069  0151 cd07cd        	call	_buzzerOnLow
3071                     ; 210 			Delay(100000);
3073  0154 ae86a0        	ldw	x,#34464
3074  0157 89            	pushw	x
3075  0158 ae0001        	ldw	x,#1
3076  015b 89            	pushw	x
3077  015c cd0882        	call	_Delay
3079  015f 5b04          	addw	sp,#4
3080                     ; 211 			showDisplay(dataNull);
3082  0161 ae03e8        	ldw	x,#1000
3083  0164 cd0522        	call	_showDisplay
3085                     ; 212 			buzzerOnHi();
3087  0167 cd07b2        	call	_buzzerOnHi
3089                     ; 213 			Delay(100000);
3091  016a ae86a0        	ldw	x,#34464
3092  016d 89            	pushw	x
3093  016e ae0001        	ldw	x,#1
3094  0171 89            	pushw	x
3095  0172 cd0882        	call	_Delay
3097  0175 5b04          	addw	sp,#4
3098                     ; 214 			showDisplay(counterC);
3100  0177 be23          	ldw	x,_counterC
3101  0179 cd0522        	call	_showDisplay
3103                     ; 215 			turnOffbuzzer();
3105  017c cd07fb        	call	_turnOffbuzzer
3107  017f               L3271:
3108                     ; 218 		if (setCountE == TRUE)
3110  017f b616          	ld	a,_setCountE
3111  0181 a101          	cp	a,#1
3112  0183 2661          	jrne	L1371
3113                     ; 220 			if (++counterE >= 1000)
3115  0185 be25          	ldw	x,_counterE
3116  0187 1c0001        	addw	x,#1
3117  018a bf25          	ldw	_counterE,x
3118  018c a303e8        	cpw	x,#1000
3119  018f 2507          	jrult	L3371
3120                     ; 222 				counterE = 0;
3122  0191 5f            	clrw	x
3123  0192 bf25          	ldw	_counterE,x
3124                     ; 223 				setCountE = FALSE;
3126  0194 3f16          	clr	_setCountE
3128  0196 2002          	jra	L5371
3129  0198               L3371:
3130                     ; 227 				setCountE = FALSE;
3132  0198 3f16          	clr	_setCountE
3133  019a               L5371:
3134                     ; 230 			showCharE();
3136  019a cd076a        	call	_showCharE
3138                     ; 232 			showDisplay(dataNull);
3140  019d ae03e8        	ldw	x,#1000
3141  01a0 cd0522        	call	_showDisplay
3143                     ; 233 			buzzerOnHi();
3145  01a3 cd07b2        	call	_buzzerOnHi
3147                     ; 234 			Delay(100000);		
3149  01a6 ae86a0        	ldw	x,#34464
3150  01a9 89            	pushw	x
3151  01aa ae0001        	ldw	x,#1
3152  01ad 89            	pushw	x
3153  01ae cd0882        	call	_Delay
3155  01b1 5b04          	addw	sp,#4
3156                     ; 235 			showDisplay(counterE);
3158  01b3 be25          	ldw	x,_counterE
3159  01b5 cd0522        	call	_showDisplay
3161                     ; 236 			buzzerOnLow();
3163  01b8 cd07cd        	call	_buzzerOnLow
3165                     ; 237 			Delay(100000);
3167  01bb ae86a0        	ldw	x,#34464
3168  01be 89            	pushw	x
3169  01bf ae0001        	ldw	x,#1
3170  01c2 89            	pushw	x
3171  01c3 cd0882        	call	_Delay
3173  01c6 5b04          	addw	sp,#4
3174                     ; 238 			showDisplay(dataNull);
3176  01c8 ae03e8        	ldw	x,#1000
3177  01cb cd0522        	call	_showDisplay
3179                     ; 239 			buzzerOnHi();
3181  01ce cd07b2        	call	_buzzerOnHi
3183                     ; 240 			Delay(100000);
3185  01d1 ae86a0        	ldw	x,#34464
3186  01d4 89            	pushw	x
3187  01d5 ae0001        	ldw	x,#1
3188  01d8 89            	pushw	x
3189  01d9 cd0882        	call	_Delay
3191  01dc 5b04          	addw	sp,#4
3192                     ; 241 			showDisplay(counterE);
3194  01de be25          	ldw	x,_counterE
3195  01e0 cd0522        	call	_showDisplay
3197                     ; 242 			turnOffbuzzer();
3199  01e3 cd07fb        	call	_turnOffbuzzer
3201  01e6               L1371:
3202                     ; 245 		if (setRepeat == TRUE)
3204  01e6 b617          	ld	a,_setRepeat
3205  01e8 a101          	cp	a,#1
3206  01ea 2668          	jrne	L7371
3207                     ; 247 			if (ultimaFilaChamada == 0) numGuiche = guiFilaP;
3209  01ec 3d34          	tnz	_ultimaFilaChamada
3210  01ee 2603          	jrne	L1471
3213  01f0 452e33        	mov	_numGuiche,_guiFilaP
3214  01f3               L1471:
3215                     ; 248 			if (ultimaFilaChamada == 1) numGuiche = guiFilaC;
3217  01f3 b634          	ld	a,_ultimaFilaChamada
3218  01f5 a101          	cp	a,#1
3219  01f7 2603          	jrne	L3471
3222  01f9 452f33        	mov	_numGuiche,_guiFilaC
3223  01fc               L3471:
3224                     ; 249 			if (ultimaFilaChamada == 2) numGuiche = guiFilaE;
3226  01fc b634          	ld	a,_ultimaFilaChamada
3227  01fe a102          	cp	a,#2
3228  0200 2603          	jrne	L5471
3231  0202 453033        	mov	_numGuiche,_guiFilaE
3232  0205               L5471:
3233                     ; 251 			saveData = repeatCall;
3235  0205 be27          	ldw	x,_repeatCall
3236  0207 bf35          	ldw	_saveData,x
3237                     ; 252 			showDisplay(dataNull);
3239  0209 ae03e8        	ldw	x,#1000
3240  020c cd0522        	call	_showDisplay
3242                     ; 253 			buzzerOnHi();
3244  020f cd07b2        	call	_buzzerOnHi
3246                     ; 254 			Delay(100000);		
3248  0212 ae86a0        	ldw	x,#34464
3249  0215 89            	pushw	x
3250  0216 ae0001        	ldw	x,#1
3251  0219 89            	pushw	x
3252  021a cd0882        	call	_Delay
3254  021d 5b04          	addw	sp,#4
3255                     ; 255 			showDisplay(saveData);
3257  021f be35          	ldw	x,_saveData
3258  0221 cd0522        	call	_showDisplay
3260                     ; 256 			buzzerOnLow();
3262  0224 cd07cd        	call	_buzzerOnLow
3264                     ; 257 			Delay(100000);
3266  0227 ae86a0        	ldw	x,#34464
3267  022a 89            	pushw	x
3268  022b ae0001        	ldw	x,#1
3269  022e 89            	pushw	x
3270  022f cd0882        	call	_Delay
3272  0232 5b04          	addw	sp,#4
3273                     ; 258 			showDisplay(dataNull);
3275  0234 ae03e8        	ldw	x,#1000
3276  0237 cd0522        	call	_showDisplay
3278                     ; 259 			buzzerOnHi();
3280  023a cd07b2        	call	_buzzerOnHi
3282                     ; 260 			Delay(100000);
3284  023d ae86a0        	ldw	x,#34464
3285  0240 89            	pushw	x
3286  0241 ae0001        	ldw	x,#1
3287  0244 89            	pushw	x
3288  0245 cd0882        	call	_Delay
3290  0248 5b04          	addw	sp,#4
3291                     ; 261 			showDisplay(saveData);
3293  024a be35          	ldw	x,_saveData
3294  024c cd0522        	call	_showDisplay
3296                     ; 262 			turnOffbuzzer();
3298  024f cd07fb        	call	_turnOffbuzzer
3300                     ; 263 			setRepeat = FALSE;
3302  0252 3f17          	clr	_setRepeat
3303  0254               L7371:
3304                     ; 267 		readChannel1 = readCh1;
3306  0254 4b80          	push	#128
3307  0256 ae5005        	ldw	x,#20485
3308  0259 cd0000        	call	_GPIO_ReadInputPin
3310  025c 5b01          	addw	sp,#1
3311  025e b731          	ld	_readChannel1,a
3312                     ; 268 		if (readChannel1 == 0)
3315  0260 3d31          	tnz	_readChannel1
3316  0262 2628          	jrne	L7471
3317                     ; 270 			if (++debounceCh1 >= 250)
3319  0264 be1d          	ldw	x,_debounceCh1
3320  0266 1c0001        	addw	x,#1
3321  0269 bf1d          	ldw	_debounceCh1,x
3322  026b a300fa        	cpw	x,#250
3323  026e 251f          	jrult	L5571
3324                     ; 272 				--debounceCh1;
3326  0270 be1d          	ldw	x,_debounceCh1
3327  0272 1d0001        	subw	x,#1
3328  0275 bf1d          	ldw	_debounceCh1,x
3329                     ; 273 				if (Code_Ready == TRUE)
3331  0277 b600          	ld	a,_Code_Ready
3332  0279 a101          	cp	a,#1
3333  027b 2612          	jrne	L5571
3334                     ; 275 					save_code_to_eeprom();
3336  027d cd035d        	call	_save_code_to_eeprom
3338                     ; 276 					setCountP = FALSE;
3340  0280 3f14          	clr	_setCountP
3341                     ; 277 					setCountC = FALSE;
3343  0282 3f15          	clr	_setCountC
3344                     ; 278 					setCountE = FALSE;
3346  0284 3f16          	clr	_setCountE
3347                     ; 279 					setRepeat = FALSE;
3349  0286 3f17          	clr	_setRepeat
3350                     ; 280 					Code_Ready = FALSE;
3352  0288 3f00          	clr	_Code_Ready
3353  028a 2003          	jra	L5571
3354  028c               L7471:
3355                     ; 286 			debounceCh1 = 0;
3357  028c 5f            	clrw	x
3358  028d bf1d          	ldw	_debounceCh1,x
3359  028f               L5571:
3360                     ; 290 		readChannel2 = readCh2;
3362  028f 4b10          	push	#16
3363  0291 ae5019        	ldw	x,#20505
3364  0294 cd0000        	call	_GPIO_ReadInputPin
3366  0297 5b01          	addw	sp,#1
3367  0299 b732          	ld	_readChannel2,a
3368                     ; 291 		if (readChannel2 == 0)
3371  029b 3d32          	tnz	_readChannel2
3372  029d 2627          	jrne	L7571
3373                     ; 293 			if (++debounceCh2 >= 250)
3375  029f be1f          	ldw	x,_debounceCh2
3376  02a1 1c0001        	addw	x,#1
3377  02a4 bf1f          	ldw	_debounceCh2,x
3378  02a6 a300fa        	cpw	x,#250
3379  02a9 251e          	jrult	L5671
3380                     ; 295 				--debounceCh2;
3382  02ab be1f          	ldw	x,_debounceCh2
3383  02ad 1d0001        	subw	x,#1
3384  02b0 bf1f          	ldw	_debounceCh2,x
3385                     ; 296 				if (Code_Ready == TRUE)
3387  02b2 b600          	ld	a,_Code_Ready
3388  02b4 a101          	cp	a,#1
3389  02b6 2611          	jrne	L5671
3390                     ; 298 					save_preset_to_eeprom();
3392  02b8 ad21          	call	_save_preset_to_eeprom
3394                     ; 299 					setCountP = FALSE;
3396  02ba 3f14          	clr	_setCountP
3397                     ; 300 					setCountC = FALSE;
3399  02bc 3f15          	clr	_setCountC
3400                     ; 301 					setCountE = FALSE;
3402  02be 3f16          	clr	_setCountE
3403                     ; 302 					setRepeat = FALSE;
3405  02c0 3f17          	clr	_setRepeat
3406                     ; 303 					Code_Ready = FALSE;
3408  02c2 3f00          	clr	_Code_Ready
3409  02c4 2003          	jra	L5671
3410  02c6               L7571:
3411                     ; 309 			debounceCh2 = 0;
3413  02c6 5f            	clrw	x
3414  02c7 bf1f          	ldw	_debounceCh2,x
3415  02c9               L5671:
3416                     ; 313 		if (Code_Ready == TRUE)
3418  02c9 b600          	ld	a,_Code_Ready
3419  02cb a101          	cp	a,#1
3420  02cd 2703          	jreq	L6
3421  02cf cc00ab        	jp	L1171
3422  02d2               L6:
3423                     ; 315 			searchCode();
3425  02d2 cd0432        	call	_searchCode
3427                     ; 316 			Code_Ready = FALSE;
3429  02d5 3f00          	clr	_Code_Ready
3430  02d7 acab00ab      	jpf	L1171
3472                     ; 323 void save_preset_to_eeprom(void)
3472                     ; 324 {
3473                     	switch	.text
3474  02db               _save_preset_to_eeprom:
3476  02db 89            	pushw	x
3477       00000002      OFST:	set	2
3480                     ; 325 	int i = 0;
3482                     ; 326 	codGuiche1[i] 		= RF_CopyBuffer[0];
3484  02dc b600          	ld	a,_RF_CopyBuffer
3485  02de ae0000        	ldw	x,#_codGuiche1
3486  02e1 cd0000        	call	c_eewrc
3488                     ; 327 	codGuiche1[i + 1] = RF_CopyBuffer[1];
3490  02e4 b601          	ld	a,_RF_CopyBuffer+1
3491  02e6 ae0001        	ldw	x,#_codGuiche1+1
3492  02e9 cd0000        	call	c_eewrc
3494                     ; 328 	codGuiche1[i + 2] = RF_CopyBuffer[2];
3496  02ec b602          	ld	a,_RF_CopyBuffer+2
3497  02ee ae0002        	ldw	x,#_codGuiche1+2
3498  02f1 cd0000        	call	c_eewrc
3500                     ; 329 	codGuiche1[i + 3] = RF_CopyBuffer[3];
3502  02f4 b603          	ld	a,_RF_CopyBuffer+3
3503  02f6 ae0003        	ldw	x,#_codGuiche1+3
3504  02f9 cd0000        	call	c_eewrc
3506                     ; 331 	showDisplay(888);
3508  02fc ae0378        	ldw	x,#888
3509  02ff cd0522        	call	_showDisplay
3511                     ; 332 	buzzerOnHi();
3513  0302 cd07b2        	call	_buzzerOnHi
3515                     ; 333 	Delay(100000);		
3517  0305 ae86a0        	ldw	x,#34464
3518  0308 89            	pushw	x
3519  0309 ae0001        	ldw	x,#1
3520  030c 89            	pushw	x
3521  030d cd0882        	call	_Delay
3523  0310 5b04          	addw	sp,#4
3524                     ; 334 	showDisplay(dataNull);
3526  0312 ae03e8        	ldw	x,#1000
3527  0315 cd0522        	call	_showDisplay
3529                     ; 335 	buzzerOnLow();
3531  0318 cd07cd        	call	_buzzerOnLow
3533                     ; 336 	Delay(100000);
3535  031b ae86a0        	ldw	x,#34464
3536  031e 89            	pushw	x
3537  031f ae0001        	ldw	x,#1
3538  0322 89            	pushw	x
3539  0323 cd0882        	call	_Delay
3541  0326 5b04          	addw	sp,#4
3542                     ; 337 	showDisplay(888);
3544  0328 ae0378        	ldw	x,#888
3545  032b cd0522        	call	_showDisplay
3547                     ; 338 	buzzerOnHi();
3549  032e cd07b2        	call	_buzzerOnHi
3551                     ; 339 	Delay(100000);
3553  0331 ae86a0        	ldw	x,#34464
3554  0334 89            	pushw	x
3555  0335 ae0001        	ldw	x,#1
3556  0338 89            	pushw	x
3557  0339 cd0882        	call	_Delay
3559  033c 5b04          	addw	sp,#4
3560                     ; 340 	showDisplay(dataNull);
3562  033e ae03e8        	ldw	x,#1000
3563  0341 cd0522        	call	_showDisplay
3565                     ; 341 	buzzerOnLow();
3567  0344 cd07cd        	call	_buzzerOnLow
3569                     ; 342 	Delay(100000);
3571  0347 ae86a0        	ldw	x,#34464
3572  034a 89            	pushw	x
3573  034b ae0001        	ldw	x,#1
3574  034e 89            	pushw	x
3575  034f cd0882        	call	_Delay
3577  0352 5b04          	addw	sp,#4
3578                     ; 343 	showDisplay(0);
3580  0354 5f            	clrw	x
3581  0355 cd0522        	call	_showDisplay
3583                     ; 344 	turnOffbuzzer();
3585  0358 cd07fb        	call	_turnOffbuzzer
3587                     ; 346 	return;
3590  035b 85            	popw	x
3591  035c 81            	ret
3634                     ; 352 void save_code_to_eeprom(void)
3634                     ; 353 {
3635                     	switch	.text
3636  035d               _save_code_to_eeprom:
3638  035d 89            	pushw	x
3639       00000002      OFST:	set	2
3642                     ; 354 	uint16_t i = 4;
3644  035e ae0004        	ldw	x,#4
3645  0361 1f01          	ldw	(OFST-1,sp),x
3647                     ; 355 	if (searchCode() == 0)
3649  0363 cd0432        	call	_searchCode
3651  0366 4d            	tnz	a
3652  0367 2703          	jreq	L42
3653  0369 cc0426        	jp	L1302
3654  036c               L42:
3655                     ; 357 		return;
3658  036c 85            	popw	x
3659  036d 81            	ret
3660  036e               L7202:
3661                     ; 361 		if ((codGuiche1[i] + codGuiche1[i + 1] + codGuiche1[i + 2] + codGuiche1[i + 3]) == 0x0000)
3663  036e 1e01          	ldw	x,(OFST-1,sp)
3664  0370 d60001        	ld	a,(_codGuiche1+1,x)
3665  0373 5f            	clrw	x
3666  0374 1601          	ldw	y,(OFST-1,sp)
3667  0376 90db0000      	add	a,(_codGuiche1,y)
3668  037a 2401          	jrnc	L41
3669  037c 5c            	incw	x
3670  037d               L41:
3671  037d 1601          	ldw	y,(OFST-1,sp)
3672  037f 90db0002      	add	a,(_codGuiche1+2,y)
3673  0383 2401          	jrnc	L61
3674  0385 5c            	incw	x
3675  0386               L61:
3676  0386 1601          	ldw	y,(OFST-1,sp)
3677  0388 90db0003      	add	a,(_codGuiche1+3,y)
3678  038c 2401          	jrnc	L02
3679  038e 5c            	incw	x
3680  038f               L02:
3681  038f 02            	rlwa	x,a
3682  0390 5d            	tnzw	x
3683  0391 2703          	jreq	L62
3684  0393 cc041f        	jp	L5302
3685  0396               L62:
3686                     ; 363 			codGuiche1[i] 		= RF_CopyBuffer[0];
3688  0396 1e01          	ldw	x,(OFST-1,sp)
3689  0398 b600          	ld	a,_RF_CopyBuffer
3690  039a 1c0000        	addw	x,#_codGuiche1
3691  039d cd0000        	call	c_eewrc
3693                     ; 364 			codGuiche1[i + 1] = RF_CopyBuffer[1];
3695  03a0 1e01          	ldw	x,(OFST-1,sp)
3696  03a2 b601          	ld	a,_RF_CopyBuffer+1
3697  03a4 1c0001        	addw	x,#_codGuiche1+1
3698  03a7 cd0000        	call	c_eewrc
3700                     ; 365 			codGuiche1[i + 2] = RF_CopyBuffer[2];
3702  03aa 1e01          	ldw	x,(OFST-1,sp)
3703  03ac b602          	ld	a,_RF_CopyBuffer+2
3704  03ae 1c0002        	addw	x,#_codGuiche1+2
3705  03b1 cd0000        	call	c_eewrc
3707                     ; 366 			codGuiche1[i + 3] = RF_CopyBuffer[3];
3709  03b4 1e01          	ldw	x,(OFST-1,sp)
3710  03b6 b603          	ld	a,_RF_CopyBuffer+3
3711  03b8 1c0003        	addw	x,#_codGuiche1+3
3712  03bb cd0000        	call	c_eewrc
3714                     ; 368 			showDisplay(888);
3716  03be ae0378        	ldw	x,#888
3717  03c1 cd0522        	call	_showDisplay
3719                     ; 369 			buzzerOnHi();
3721  03c4 cd07b2        	call	_buzzerOnHi
3723                     ; 370 			Delay(100000);		
3725  03c7 ae86a0        	ldw	x,#34464
3726  03ca 89            	pushw	x
3727  03cb ae0001        	ldw	x,#1
3728  03ce 89            	pushw	x
3729  03cf cd0882        	call	_Delay
3731  03d2 5b04          	addw	sp,#4
3732                     ; 371 			showDisplay(dataNull);
3734  03d4 ae03e8        	ldw	x,#1000
3735  03d7 cd0522        	call	_showDisplay
3737                     ; 372 			buzzerOnLow();
3739  03da cd07cd        	call	_buzzerOnLow
3741                     ; 373 			Delay(100000);
3743  03dd ae86a0        	ldw	x,#34464
3744  03e0 89            	pushw	x
3745  03e1 ae0001        	ldw	x,#1
3746  03e4 89            	pushw	x
3747  03e5 cd0882        	call	_Delay
3749  03e8 5b04          	addw	sp,#4
3750                     ; 374 			showDisplay(888);
3752  03ea ae0378        	ldw	x,#888
3753  03ed cd0522        	call	_showDisplay
3755                     ; 375 			buzzerOnHi();
3757  03f0 cd07b2        	call	_buzzerOnHi
3759                     ; 376 			Delay(100000);
3761  03f3 ae86a0        	ldw	x,#34464
3762  03f6 89            	pushw	x
3763  03f7 ae0001        	ldw	x,#1
3764  03fa 89            	pushw	x
3765  03fb cd0882        	call	_Delay
3767  03fe 5b04          	addw	sp,#4
3768                     ; 377 			showDisplay(dataNull);
3770  0400 ae03e8        	ldw	x,#1000
3771  0403 cd0522        	call	_showDisplay
3773                     ; 378 			buzzerOnLow();
3775  0406 cd07cd        	call	_buzzerOnLow
3777                     ; 379 			Delay(100000);
3779  0409 ae86a0        	ldw	x,#34464
3780  040c 89            	pushw	x
3781  040d ae0001        	ldw	x,#1
3782  0410 89            	pushw	x
3783  0411 cd0882        	call	_Delay
3785  0414 5b04          	addw	sp,#4
3786                     ; 380 			showDisplay(0);
3788  0416 5f            	clrw	x
3789  0417 cd0522        	call	_showDisplay
3791                     ; 381 			turnOffbuzzer();
3793  041a cd07fb        	call	_turnOffbuzzer
3795                     ; 383 			return;
3797  041d 2011          	jra	L22
3798  041f               L5302:
3799                     ; 385 		i = i + 4;
3801  041f 1e01          	ldw	x,(OFST-1,sp)
3802  0421 1c0004        	addw	x,#4
3803  0424 1f01          	ldw	(OFST-1,sp),x
3805  0426               L1302:
3806                     ; 359 	while (i < 400)
3808  0426 1e01          	ldw	x,(OFST-1,sp)
3809  0428 a30190        	cpw	x,#400
3810  042b 2403          	jruge	L03
3811  042d cc036e        	jp	L7202
3812  0430               L03:
3813                     ; 387 }
3814  0430               L22:
3817  0430 85            	popw	x
3818  0431 81            	ret
3866                     ; 391 uint8_t searchCode(void)
3866                     ; 392 {
3867                     	switch	.text
3868  0432               _searchCode:
3870  0432 89            	pushw	x
3871       00000002      OFST:	set	2
3874                     ; 393 	uint16_t i = 0;
3876                     ; 394 	numGuiche = 1;
3878  0433 35010033      	mov	_numGuiche,#1
3879                     ; 395 	dataEpromVector2 = codGuiche1[i + 2] & 0xFC;	// Carrega endereço com dados mascarados
3881  0437 c60002        	ld	a,_codGuiche1+2
3882  043a a4fc          	and	a,#252
3883  043c 5f            	clrw	x
3884  043d 97            	ld	xl,a
3885  043e bf0f          	ldw	_dataEpromVector2,x
3886                     ; 396 	dataBufferVector2 = RF_CopyBuffer[2] & 0xFC;	// Carrega endereço com dados mascarados	
3888  0440 b602          	ld	a,_RF_CopyBuffer+2
3889  0442 a4fc          	and	a,#252
3890  0444 5f            	clrw	x
3891  0445 97            	ld	xl,a
3892  0446 bf11          	ldw	_dataBufferVector2,x
3893                     ; 399 	if ( codGuiche1[i]     == RF_CopyBuffer[0] && 
3893                     ; 400 			 codGuiche1[i + 1] == RF_CopyBuffer[1] &&
3893                     ; 401 			 dataEpromVector2 == dataBufferVector2 && // Teste com os dados mascarados
3893                     ; 402 			 codGuiche1[i + 3] == RF_CopyBuffer[3]
3893                     ; 403 			)
3895  0448 c60000        	ld	a,_codGuiche1
3896  044b b100          	cp	a,_RF_CopyBuffer
3897  044d 2640          	jrne	L5502
3899  044f c60001        	ld	a,_codGuiche1+1
3900  0452 b101          	cp	a,_RF_CopyBuffer+1
3901  0454 2639          	jrne	L5502
3903  0456 be0f          	ldw	x,_dataEpromVector2
3904  0458 b311          	cpw	x,_dataBufferVector2
3905  045a 2633          	jrne	L5502
3907  045c c60003        	ld	a,_codGuiche1+3
3908  045f b103          	cp	a,_RF_CopyBuffer+3
3909  0461 262c          	jrne	L5502
3910                     ; 405 		if ((RF_CopyBuffer[2] & 0x03) == 0x01) // Tecla 1
3912  0463 b602          	ld	a,_RF_CopyBuffer+2
3913  0465 a403          	and	a,#3
3914  0467 a101          	cp	a,#1
3915  0469 260c          	jrne	L7502
3916                     ; 407 			counterP++;
3918  046b be21          	ldw	x,_counterP
3919  046d 1c0001        	addw	x,#1
3920  0470 bf21          	ldw	_counterP,x
3921                     ; 408 			showDisplay(counterP);
3923  0472 be21          	ldw	x,_counterP
3924  0474 cd0522        	call	_showDisplay
3926  0477               L7502:
3927                     ; 410 		if ((RF_CopyBuffer[2] & 0x03) == 0x02) // Tecla 2
3929  0477 b602          	ld	a,_RF_CopyBuffer+2
3930  0479 a403          	and	a,#3
3931  047b a102          	cp	a,#2
3932  047d 260c          	jrne	L1602
3933                     ; 412 			counterC++;
3935  047f be23          	ldw	x,_counterC
3936  0481 1c0001        	addw	x,#1
3937  0484 bf23          	ldw	_counterC,x
3938                     ; 413 			showDisplay(counterC);
3940  0486 be23          	ldw	x,_counterC
3941  0488 cd0522        	call	_showDisplay
3943  048b               L1602:
3944                     ; 420 		return 1;
3946  048b a601          	ld	a,#1
3948  048d 204b          	jra	L43
3949  048f               L5502:
3950                     ; 424 	i = 4;
3952  048f ae0004        	ldw	x,#4
3953  0492 1f01          	ldw	(OFST-1,sp),x
3955  0494               L3602:
3956                     ; 427 		dataEpromVector2 = codGuiche1[i + 2] & 0xFC;	// Carrega endereço com dados mascarados
3958  0494 1e01          	ldw	x,(OFST-1,sp)
3959  0496 d60002        	ld	a,(_codGuiche1+2,x)
3960  0499 a4fc          	and	a,#252
3961  049b 5f            	clrw	x
3962  049c 97            	ld	xl,a
3963  049d bf0f          	ldw	_dataEpromVector2,x
3964                     ; 428 		dataBufferVector2 = RF_CopyBuffer[2] & 0xFC;	// Carrega endereço com dados mascarados
3966  049f b602          	ld	a,_RF_CopyBuffer+2
3967  04a1 a4fc          	and	a,#252
3968  04a3 5f            	clrw	x
3969  04a4 97            	ld	xl,a
3970  04a5 bf11          	ldw	_dataBufferVector2,x
3971                     ; 429 		if ( codGuiche1[i]     == RF_CopyBuffer[0] && 
3971                     ; 430 				 codGuiche1[i + 1] == RF_CopyBuffer[1] &&
3971                     ; 431 				 dataEpromVector2 == dataBufferVector2 && // Teste com os dados mascarados
3971                     ; 432 				 codGuiche1[i + 3] == RF_CopyBuffer[3]
3971                     ; 433 				)
3973  04a7 1e01          	ldw	x,(OFST-1,sp)
3974  04a9 d60000        	ld	a,(_codGuiche1,x)
3975  04ac b100          	cp	a,_RF_CopyBuffer
3976  04ae 2651          	jrne	L1702
3978  04b0 1e01          	ldw	x,(OFST-1,sp)
3979  04b2 d60001        	ld	a,(_codGuiche1+1,x)
3980  04b5 b101          	cp	a,_RF_CopyBuffer+1
3981  04b7 2648          	jrne	L1702
3983  04b9 be0f          	ldw	x,_dataEpromVector2
3984  04bb b311          	cpw	x,_dataBufferVector2
3985  04bd 2642          	jrne	L1702
3987  04bf 1e01          	ldw	x,(OFST-1,sp)
3988  04c1 d60003        	ld	a,(_codGuiche1+3,x)
3989  04c4 b103          	cp	a,_RF_CopyBuffer+3
3990  04c6 2639          	jrne	L1702
3991                     ; 435 			if ((RF_CopyBuffer[2] & 0x03) == 0x01)
3993  04c8 b602          	ld	a,_RF_CopyBuffer+2
3994  04ca a403          	and	a,#3
3995  04cc a101          	cp	a,#1
3996  04ce 260c          	jrne	L3702
3997                     ; 437 				setCountP = TRUE;
3999  04d0 35010014      	mov	_setCountP,#1
4000                     ; 438 				guiFilaP = numGuiche;
4002  04d4 45332e        	mov	_guiFilaP,_numGuiche
4003                     ; 439 				ultimaFilaChamada = 0; // 0 = P
4005  04d7 3f34          	clr	_ultimaFilaChamada
4006                     ; 440 				return 0;
4008  04d9 4f            	clr	a
4010  04da               L43:
4012  04da 85            	popw	x
4013  04db 81            	ret
4014  04dc               L3702:
4015                     ; 442 			if ((RF_CopyBuffer[2] & 0x03) == 0x02)
4017  04dc b602          	ld	a,_RF_CopyBuffer+2
4018  04de a403          	and	a,#3
4019  04e0 a102          	cp	a,#2
4020  04e2 260e          	jrne	L5702
4021                     ; 444 				setCountC = TRUE;
4023  04e4 35010015      	mov	_setCountC,#1
4024                     ; 445 				guiFilaC = numGuiche;
4026  04e8 45332f        	mov	_guiFilaC,_numGuiche
4027                     ; 446 				ultimaFilaChamada = 1; // 1 = C
4029  04eb 35010034      	mov	_ultimaFilaChamada,#1
4030                     ; 447 				return 0;
4032  04ef 4f            	clr	a
4034  04f0 20e8          	jra	L43
4035  04f2               L5702:
4036                     ; 449 			if ((RF_CopyBuffer[2] & 0x03) == 0x03)
4038  04f2 b602          	ld	a,_RF_CopyBuffer+2
4039  04f4 a403          	and	a,#3
4040  04f6 a103          	cp	a,#3
4041  04f8 2607          	jrne	L1702
4042                     ; 451 				setRepeat = TRUE;
4044  04fa 35010017      	mov	_setRepeat,#1
4045                     ; 457 				return 0; 
4047  04fe 4f            	clr	a
4049  04ff 20d9          	jra	L43
4050  0501               L1702:
4051                     ; 465 		i = i + 4;
4053  0501 1e01          	ldw	x,(OFST-1,sp)
4054  0503 1c0004        	addw	x,#4
4055  0506 1f01          	ldw	(OFST-1,sp),x
4057                     ; 466 		numGuiche++;
4059  0508 3c33          	inc	_numGuiche
4060                     ; 467 		if (numGuiche > 99) numGuiche = 99;
4062  050a b633          	ld	a,_numGuiche
4063  050c a164          	cp	a,#100
4064  050e 2504          	jrult	L1012
4067  0510 35630033      	mov	_numGuiche,#99
4068  0514               L1012:
4069                     ; 425 	while (i < 400)
4071  0514 1e01          	ldw	x,(OFST-1,sp)
4072  0516 a30190        	cpw	x,#400
4073  0519 2403cc0494    	jrult	L3602
4074                     ; 469 	return 1;
4076  051e a601          	ld	a,#1
4078  0520 20b8          	jra	L43
4124                     ; 474 void showDisplay(uint16_t data)
4124                     ; 475 {
4125                     	switch	.text
4126  0522               _showDisplay:
4128  0522 89            	pushw	x
4129  0523 88            	push	a
4130       00000001      OFST:	set	1
4133                     ; 476 	repeatCall = data;
4135  0524 bf27          	ldw	_repeatCall,x
4136                     ; 477 	if (data == dataNull)
4138  0526 a303e8        	cpw	x,#1000
4139  0529 2703          	jreq	L04
4140  052b cc05ff        	jp	L1212
4141  052e               L04:
4142                     ; 479 		PB_ODR = PB_ODR & 0xF0 | 0x0F;
4144  052e c65005        	ld	a,_PB_ODR
4145  0531 a4f0          	and	a,#240
4146  0533 aa0f          	or	a,#15
4147  0535 c75005        	ld	_PB_ODR,a
4148                     ; 480 		setDig1;
4150  0538 4b20          	push	#32
4151  053a ae5014        	ldw	x,#20500
4152  053d cd0000        	call	_GPIO_WriteHigh
4154  0540 84            	pop	a
4155                     ; 481 		Delay(10);
4158  0541 ae000a        	ldw	x,#10
4159  0544 89            	pushw	x
4160  0545 ae0000        	ldw	x,#0
4161  0548 89            	pushw	x
4162  0549 cd0882        	call	_Delay
4164  054c 5b04          	addw	sp,#4
4165                     ; 482 		resDig1;
4167  054e 4b20          	push	#32
4168  0550 ae5014        	ldw	x,#20500
4169  0553 cd0000        	call	_GPIO_WriteLow
4171  0556 84            	pop	a
4172                     ; 483 		PB_ODR = PB_ODR & 0xF0 | 0x0F;
4175  0557 c65005        	ld	a,_PB_ODR
4176  055a a4f0          	and	a,#240
4177  055c aa0f          	or	a,#15
4178  055e c75005        	ld	_PB_ODR,a
4179                     ; 484 		setDig2;
4181  0561 4b02          	push	#2
4182  0563 ae500a        	ldw	x,#20490
4183  0566 cd0000        	call	_GPIO_WriteHigh
4185  0569 84            	pop	a
4186                     ; 485 		Delay(10);
4189  056a ae000a        	ldw	x,#10
4190  056d 89            	pushw	x
4191  056e ae0000        	ldw	x,#0
4192  0571 89            	pushw	x
4193  0572 cd0882        	call	_Delay
4195  0575 5b04          	addw	sp,#4
4196                     ; 486 		resDig2;
4198  0577 4b02          	push	#2
4199  0579 ae500a        	ldw	x,#20490
4200  057c cd0000        	call	_GPIO_WriteLow
4202  057f 84            	pop	a
4203                     ; 487 		PB_ODR = PB_ODR & 0xF0 | 0x0F;
4206  0580 c65005        	ld	a,_PB_ODR
4207  0583 a4f0          	and	a,#240
4208  0585 aa0f          	or	a,#15
4209  0587 c75005        	ld	_PB_ODR,a
4210                     ; 488 		setDig3;
4212  058a 4b04          	push	#4
4213  058c ae500a        	ldw	x,#20490
4214  058f cd0000        	call	_GPIO_WriteHigh
4216  0592 84            	pop	a
4217                     ; 489 		Delay(10);
4220  0593 ae000a        	ldw	x,#10
4221  0596 89            	pushw	x
4222  0597 ae0000        	ldw	x,#0
4223  059a 89            	pushw	x
4224  059b cd0882        	call	_Delay
4226  059e 5b04          	addw	sp,#4
4227                     ; 490 		resDig3;
4229  05a0 4b04          	push	#4
4230  05a2 ae500a        	ldw	x,#20490
4231  05a5 cd0000        	call	_GPIO_WriteLow
4233  05a8 84            	pop	a
4234                     ; 492 		PB_ODR = PB_ODR & 0xF0 | 0x0F;
4237  05a9 c65005        	ld	a,_PB_ODR
4238  05ac a4f0          	and	a,#240
4239  05ae aa0f          	or	a,#15
4240  05b0 c75005        	ld	_PB_ODR,a
4241                     ; 493 		setDig4;
4243  05b3 4b08          	push	#8
4244  05b5 ae500a        	ldw	x,#20490
4245  05b8 cd0000        	call	_GPIO_WriteHigh
4247  05bb 84            	pop	a
4248                     ; 494 		Delay(10);
4251  05bc ae000a        	ldw	x,#10
4252  05bf 89            	pushw	x
4253  05c0 ae0000        	ldw	x,#0
4254  05c3 89            	pushw	x
4255  05c4 cd0882        	call	_Delay
4257  05c7 5b04          	addw	sp,#4
4258                     ; 495 		resDig4;
4260  05c9 4b08          	push	#8
4261  05cb ae500a        	ldw	x,#20490
4262  05ce cd0000        	call	_GPIO_WriteLow
4264  05d1 84            	pop	a
4265                     ; 496 		PB_ODR = PB_ODR & 0xF0 | 0x0F;
4268  05d2 c65005        	ld	a,_PB_ODR
4269  05d5 a4f0          	and	a,#240
4270  05d7 aa0f          	or	a,#15
4271  05d9 c75005        	ld	_PB_ODR,a
4272                     ; 497 		setDig5;
4274  05dc 4b10          	push	#16
4275  05de ae500a        	ldw	x,#20490
4276  05e1 cd0000        	call	_GPIO_WriteHigh
4278  05e4 84            	pop	a
4279                     ; 498 		Delay(10);
4282  05e5 ae000a        	ldw	x,#10
4283  05e8 89            	pushw	x
4284  05e9 ae0000        	ldw	x,#0
4285  05ec 89            	pushw	x
4286  05ed cd0882        	call	_Delay
4288  05f0 5b04          	addw	sp,#4
4289                     ; 499 		resDig5;		
4291  05f2 4b10          	push	#16
4292  05f4 ae500a        	ldw	x,#20490
4293  05f7 cd0000        	call	_GPIO_WriteLow
4295  05fa 84            	pop	a
4298  05fb ac270727      	jpf	L3212
4299  05ff               L1212:
4300                     ; 503 		digCen = data / 100;
4302  05ff 1e02          	ldw	x,(OFST+1,sp)
4303  0601 a664          	ld	a,#100
4304  0603 62            	div	x,a
4305  0604 01            	rrwa	x,a
4306  0605 b72b          	ld	_digCen,a
4307  0607 02            	rlwa	x,a
4308                     ; 504 		digDez = (data % 100) / 10;
4310  0608 1e02          	ldw	x,(OFST+1,sp)
4311  060a a664          	ld	a,#100
4312  060c 62            	div	x,a
4313  060d 5f            	clrw	x
4314  060e 97            	ld	xl,a
4315  060f a60a          	ld	a,#10
4316  0611 62            	div	x,a
4317  0612 01            	rrwa	x,a
4318  0613 b72a          	ld	_digDez,a
4319  0615 02            	rlwa	x,a
4320                     ; 505 		digUni = (data % 100) % 10;
4322  0616 1e02          	ldw	x,(OFST+1,sp)
4323  0618 a664          	ld	a,#100
4324  061a 62            	div	x,a
4325  061b 5f            	clrw	x
4326  061c 97            	ld	xl,a
4327  061d a60a          	ld	a,#10
4328  061f 62            	div	x,a
4329  0620 5f            	clrw	x
4330  0621 97            	ld	xl,a
4331  0622 01            	rrwa	x,a
4332  0623 b729          	ld	_digUni,a
4333  0625 02            	rlwa	x,a
4334                     ; 506 		PB_ODR = PB_ODR & 0xF0 | digCen & 0x0F;
4336  0626 b62b          	ld	a,_digCen
4337  0628 a40f          	and	a,#15
4338  062a 6b01          	ld	(OFST+0,sp),a
4340  062c c65005        	ld	a,_PB_ODR
4341  062f a4f0          	and	a,#240
4342  0631 1a01          	or	a,(OFST+0,sp)
4343  0633 c75005        	ld	_PB_ODR,a
4344                     ; 507 		setDig1;
4346  0636 4b20          	push	#32
4347  0638 ae5014        	ldw	x,#20500
4348  063b cd0000        	call	_GPIO_WriteHigh
4350  063e 84            	pop	a
4351                     ; 508 		Delay(10);
4354  063f ae000a        	ldw	x,#10
4355  0642 89            	pushw	x
4356  0643 ae0000        	ldw	x,#0
4357  0646 89            	pushw	x
4358  0647 cd0882        	call	_Delay
4360  064a 5b04          	addw	sp,#4
4361                     ; 509 		resDig1;
4363  064c 4b20          	push	#32
4364  064e ae5014        	ldw	x,#20500
4365  0651 cd0000        	call	_GPIO_WriteLow
4367  0654 84            	pop	a
4368                     ; 510 		PB_ODR = PB_ODR & 0xF0 | digDez & 0x0F;
4371  0655 b62a          	ld	a,_digDez
4372  0657 a40f          	and	a,#15
4373  0659 6b01          	ld	(OFST+0,sp),a
4375  065b c65005        	ld	a,_PB_ODR
4376  065e a4f0          	and	a,#240
4377  0660 1a01          	or	a,(OFST+0,sp)
4378  0662 c75005        	ld	_PB_ODR,a
4379                     ; 511 		setDig2;
4381  0665 4b02          	push	#2
4382  0667 ae500a        	ldw	x,#20490
4383  066a cd0000        	call	_GPIO_WriteHigh
4385  066d 84            	pop	a
4386                     ; 512 		Delay(10);
4389  066e ae000a        	ldw	x,#10
4390  0671 89            	pushw	x
4391  0672 ae0000        	ldw	x,#0
4392  0675 89            	pushw	x
4393  0676 cd0882        	call	_Delay
4395  0679 5b04          	addw	sp,#4
4396                     ; 513 		resDig2;
4398  067b 4b02          	push	#2
4399  067d ae500a        	ldw	x,#20490
4400  0680 cd0000        	call	_GPIO_WriteLow
4402  0683 84            	pop	a
4403                     ; 514 		PB_ODR = PB_ODR & 0xF0 | digUni & 0x0F;
4406  0684 b629          	ld	a,_digUni
4407  0686 a40f          	and	a,#15
4408  0688 6b01          	ld	(OFST+0,sp),a
4410  068a c65005        	ld	a,_PB_ODR
4411  068d a4f0          	and	a,#240
4412  068f 1a01          	or	a,(OFST+0,sp)
4413  0691 c75005        	ld	_PB_ODR,a
4414                     ; 515 		setDig3;
4416  0694 4b04          	push	#4
4417  0696 ae500a        	ldw	x,#20490
4418  0699 cd0000        	call	_GPIO_WriteHigh
4420  069c 84            	pop	a
4421                     ; 516 		Delay(10);
4424  069d ae000a        	ldw	x,#10
4425  06a0 89            	pushw	x
4426  06a1 ae0000        	ldw	x,#0
4427  06a4 89            	pushw	x
4428  06a5 cd0882        	call	_Delay
4430  06a8 5b04          	addw	sp,#4
4431                     ; 517 		resDig3;
4433  06aa 4b04          	push	#4
4434  06ac ae500a        	ldw	x,#20490
4435  06af cd0000        	call	_GPIO_WriteLow
4437  06b2 84            	pop	a
4438                     ; 519 		guiDez = numGuiche / 10;
4441  06b3 b633          	ld	a,_numGuiche
4442  06b5 5f            	clrw	x
4443  06b6 97            	ld	xl,a
4444  06b7 a60a          	ld	a,#10
4445  06b9 62            	div	x,a
4446  06ba 9f            	ld	a,xl
4447  06bb b72c          	ld	_guiDez,a
4448                     ; 520 		guiUni = numGuiche % 10;
4450  06bd b633          	ld	a,_numGuiche
4451  06bf 5f            	clrw	x
4452  06c0 97            	ld	xl,a
4453  06c1 a60a          	ld	a,#10
4454  06c3 62            	div	x,a
4455  06c4 5f            	clrw	x
4456  06c5 97            	ld	xl,a
4457  06c6 9f            	ld	a,xl
4458  06c7 b72d          	ld	_guiUni,a
4459                     ; 521 		PB_ODR = PB_ODR & 0xF0 | guiDez & 0x0F;
4461  06c9 b62c          	ld	a,_guiDez
4462  06cb a40f          	and	a,#15
4463  06cd 6b01          	ld	(OFST+0,sp),a
4465  06cf c65005        	ld	a,_PB_ODR
4466  06d2 a4f0          	and	a,#240
4467  06d4 1a01          	or	a,(OFST+0,sp)
4468  06d6 c75005        	ld	_PB_ODR,a
4469                     ; 522 		setDig4;
4471  06d9 4b08          	push	#8
4472  06db ae500a        	ldw	x,#20490
4473  06de cd0000        	call	_GPIO_WriteHigh
4475  06e1 84            	pop	a
4476                     ; 523 		Delay(10);
4479  06e2 ae000a        	ldw	x,#10
4480  06e5 89            	pushw	x
4481  06e6 ae0000        	ldw	x,#0
4482  06e9 89            	pushw	x
4483  06ea cd0882        	call	_Delay
4485  06ed 5b04          	addw	sp,#4
4486                     ; 524 		resDig4;
4488  06ef 4b08          	push	#8
4489  06f1 ae500a        	ldw	x,#20490
4490  06f4 cd0000        	call	_GPIO_WriteLow
4492  06f7 84            	pop	a
4493                     ; 525 		PB_ODR = PB_ODR & 0xF0 | guiUni & 0x0F;
4496  06f8 b62d          	ld	a,_guiUni
4497  06fa a40f          	and	a,#15
4498  06fc 6b01          	ld	(OFST+0,sp),a
4500  06fe c65005        	ld	a,_PB_ODR
4501  0701 a4f0          	and	a,#240
4502  0703 1a01          	or	a,(OFST+0,sp)
4503  0705 c75005        	ld	_PB_ODR,a
4504                     ; 526 		setDig5;
4506  0708 4b10          	push	#16
4507  070a ae500a        	ldw	x,#20490
4508  070d cd0000        	call	_GPIO_WriteHigh
4510  0710 84            	pop	a
4511                     ; 527 		Delay(10);
4514  0711 ae000a        	ldw	x,#10
4515  0714 89            	pushw	x
4516  0715 ae0000        	ldw	x,#0
4517  0718 89            	pushw	x
4518  0719 cd0882        	call	_Delay
4520  071c 5b04          	addw	sp,#4
4521                     ; 528 		resDig5;
4523  071e 4b10          	push	#16
4524  0720 ae500a        	ldw	x,#20490
4525  0723 cd0000        	call	_GPIO_WriteLow
4527  0726 84            	pop	a
4528  0727               L3212:
4529                     ; 530 	Code_Ready = FALSE;
4531  0727 3f00          	clr	_Code_Ready
4532                     ; 531 }
4535  0729 5b03          	addw	sp,#3
4536  072b 81            	ret
4561                     ; 535 void showCharP(void) 
4561                     ; 536 {
4562                     	switch	.text
4563  072c               _showCharP:
4567                     ; 537 	PC_ODR &= ~0xC0; 
4569  072c c6500a        	ld	a,_PC_ODR
4570  072f a43f          	and	a,#63
4571  0731 c7500a        	ld	_PC_ODR,a
4572                     ; 538 	PC_ODR |= 0xC0;
4574  0734 c6500a        	ld	a,_PC_ODR
4575  0737 aac0          	or	a,#192
4576  0739 c7500a        	ld	_PC_ODR,a
4577                     ; 539 	PD_ODR &= ~0x3D;
4579  073c c6500f        	ld	a,_PD_ODR
4580  073f a4c2          	and	a,#194
4581  0741 c7500f        	ld	_PD_ODR,a
4582                     ; 540 	PD_ODR |= 0x38;
4584  0744 c6500f        	ld	a,_PD_ODR
4585  0747 aa38          	or	a,#56
4586  0749 c7500f        	ld	_PD_ODR,a
4587                     ; 541 }
4590  074c 81            	ret
4615                     ; 544 void showCharC(void)
4615                     ; 545 {
4616                     	switch	.text
4617  074d               _showCharC:
4621                     ; 546 	PC_ODR &= ~0xC0;
4623  074d c6500a        	ld	a,_PC_ODR
4624  0750 a43f          	and	a,#63
4625  0752 c7500a        	ld	_PC_ODR,a
4626                     ; 547 	PC_ODR |= 0x40;
4628  0755 721c500a      	bset	_PC_ODR,#6
4629                     ; 548 	PD_ODR &= ~0x3D;
4631  0759 c6500f        	ld	a,_PD_ODR
4632  075c a4c2          	and	a,#194
4633  075e c7500f        	ld	_PD_ODR,a
4634                     ; 549 	PD_ODR |= 0x1C;	
4636  0761 c6500f        	ld	a,_PD_ODR
4637  0764 aa1c          	or	a,#28
4638  0766 c7500f        	ld	_PD_ODR,a
4639                     ; 550 }
4642  0769 81            	ret
4667                     ; 553 void showCharE(void)
4667                     ; 554 {
4668                     	switch	.text
4669  076a               _showCharE:
4673                     ; 555 	PC_ODR &= ~0xC0;
4675  076a c6500a        	ld	a,_PC_ODR
4676  076d a43f          	and	a,#63
4677  076f c7500a        	ld	_PC_ODR,a
4678                     ; 556 	PC_ODR |= 0x40;
4680  0772 721c500a      	bset	_PC_ODR,#6
4681                     ; 557 	PD_ODR &= ~0x3D;
4683  0776 c6500f        	ld	a,_PD_ODR
4684  0779 a4c2          	and	a,#194
4685  077b c7500f        	ld	_PD_ODR,a
4686                     ; 558 	PD_ODR |= 0x3C;	
4688  077e c6500f        	ld	a,_PD_ODR
4689  0781 aa3c          	or	a,#60
4690  0783 c7500f        	ld	_PD_ODR,a
4691                     ; 559 }
4694  0786 81            	ret
4717                     ; 563 static void TIM1_Config(void)
4717                     ; 564 {
4718                     	switch	.text
4719  0787               L3561_TIM1_Config:
4723                     ; 588 }
4727  0787 81            	ret
4761                     ; 592 static void TIM5_Config(void)
4761                     ; 593 {
4762                     	switch	.text
4763  0788               L5612_TIM5_Config:
4767                     ; 595 	TIM5_DeInit();
4769  0788 cd0000        	call	_TIM5_DeInit
4771                     ; 598 	TIM5_PSCR = 0;
4773  078b 725f530e      	clr	_TIM5_PSCR
4774                     ; 601 	TIM5_ARRH = fh;
4776  078f 550037530f    	mov	_TIM5_ARRH,_fh
4777                     ; 602 	TIM5_ARRL = 0x00;
4779  0794 725f5310      	clr	_TIM5_ARRL
4780                     ; 605 	TIM5_CCR3H = vh;
4782  0798 5500385315    	mov	_TIM5_CCR3H,_vh
4783                     ; 606 	TIM5_CCR3L = 0x00;
4785  079d 725f5316      	clr	_TIM5_CCR3L
4786                     ; 609 	TIM5_CCMR3 = 0x78;
4788  07a1 35785309      	mov	_TIM5_CCMR3,#120
4789                     ; 612 	TIM5_CCER2 = 0x03;
4791  07a5 3503530b      	mov	_TIM5_CCER2,#3
4792                     ; 615 	TIM5_CR1 |= (1 << 7);
4794  07a9 721e5300      	bset	_TIM5_CR1,#7
4795                     ; 618 	TIM5_CR1 |= TIM5_CR1_CEN;
4797  07ad 72105300      	bset	_TIM5_CR1,#0
4798                     ; 620 }
4801  07b1 81            	ret
4832                     ; 624 void buzzerOnHi(void)
4832                     ; 625 {
4833                     	switch	.text
4834  07b2               _buzzerOnHi:
4838                     ; 627 	TIM5_ARRH = fl;
4840  07b2 550039530f    	mov	_TIM5_ARRH,_fl
4841                     ; 628 	TIM5_ARRL = 0x00;
4843  07b7 725f5310      	clr	_TIM5_ARRL
4844                     ; 631 	TIM5_CCR3H = vl;
4846  07bb 55003a5315    	mov	_TIM5_CCR3H,_vl
4847                     ; 632 	TIM5_CCR3L = 0x00;
4849  07c0 725f5316      	clr	_TIM5_CCR3L
4850                     ; 635 	TIM5_CR1 |= TIM5_CR1_CEN;
4852  07c4 72105300      	bset	_TIM5_CR1,#0
4853                     ; 638 	TIM5_CCMR3 |= (1 << 5);
4855  07c8 721a5309      	bset	_TIM5_CCMR3,#5
4856                     ; 639 }
4859  07cc 81            	ret
4893                     ; 642 void buzzerOnLow(void)
4893                     ; 643 {
4894                     	switch	.text
4895  07cd               _buzzerOnLow:
4899                     ; 645 	TIM5_DeInit();
4901  07cd cd0000        	call	_TIM5_DeInit
4903                     ; 648 	TIM5_PSCR = 0x00;
4905  07d0 725f530e      	clr	_TIM5_PSCR
4906                     ; 651 	TIM5_ARRH = fh;
4908  07d4 550037530f    	mov	_TIM5_ARRH,_fh
4909                     ; 652 	TIM5_ARRL = 0x00;
4911  07d9 725f5310      	clr	_TIM5_ARRL
4912                     ; 655 	TIM5_CCR3H = vh;
4914  07dd 5500385315    	mov	_TIM5_CCR3H,_vh
4915                     ; 656 	TIM5_CCR3L = 0x00;
4917  07e2 725f5316      	clr	_TIM5_CCR3L
4918                     ; 659 	TIM5_CCMR3 = 0x70;  // OC3M = 111 (PWM1), OC3PE = 0
4920  07e6 35705309      	mov	_TIM5_CCMR3,#112
4921                     ; 662 	TIM5_CCMR3 = 0x78;  // OC3M = 111 (PWM1), OC3PE = 1
4923  07ea 35785309      	mov	_TIM5_CCMR3,#120
4924                     ; 665 	TIM5_CCER2 = 0x03;
4926  07ee 3503530b      	mov	_TIM5_CCER2,#3
4927                     ; 668 	TIM5_CR1 |= (1 << 7);  // ARPE = 1
4929  07f2 721e5300      	bset	_TIM5_CR1,#7
4930                     ; 669 	TIM5_CR1 |= (1 << 0);  // CEN = 1
4932  07f6 72105300      	bset	_TIM5_CR1,#0
4933                     ; 670 }
4936  07fa 81            	ret
4961                     ; 673 void turnOffbuzzer(void)
4961                     ; 674 {
4962                     	switch	.text
4963  07fb               _turnOffbuzzer:
4967                     ; 675 	TIM5_CR1 &= ~(1 << 0);     // Desliga o contador (CEN = 0)
4969  07fb 72115300      	bres	_TIM5_CR1,#0
4970                     ; 676 	TIM5_CCMR3 &= ~(1 << 5);   // Desativa preload (OC3PE = 0)
4972  07ff 721b5309      	bres	_TIM5_CCMR3,#5
4973                     ; 677 }
4976  0803 81            	ret
5005                     ; 682 void onInt_TM6(void)
5005                     ; 683 {
5006                     	switch	.text
5007  0804               _onInt_TM6:
5011                     ; 684 	TIM6_CR1  = 0b00000001;
5013  0804 35015340      	mov	_TIM6_CR1,#1
5014                     ; 685 	TIM6_IER  = 0b00000001;
5016  0808 35015343      	mov	_TIM6_IER,#1
5017                     ; 686 	TIM6_CNTR = 0b00000001;
5019  080c 35015346      	mov	_TIM6_CNTR,#1
5020                     ; 687 	TIM6_ARR	= 0b00000001;
5022  0810 35015348      	mov	_TIM6_ARR,#1
5023                     ; 688 	TIM6_SR		= 0b00000001;
5025  0814 35015344      	mov	_TIM6_SR,#1
5026                     ; 689 	TIM6_PSCR = 0b00000010;
5028  0818 35025347      	mov	_TIM6_PSCR,#2
5029                     ; 690 	TIM6_ARR  = 198;
5031  081c 35c65348      	mov	_TIM6_ARR,#198
5032                     ; 691 	TIM6_IER	|= 0x00;
5034  0820 c65343        	ld	a,_TIM6_IER
5035                     ; 692 	TIM6_CR1	|= 0x00;
5037  0823 c65340        	ld	a,_TIM6_CR1
5038                     ; 694 	RIM
5041  0826 9a            RIM
5043                     ; 696 }
5046  0827 81            	ret
5069                     ; 706 void	InitADC (void)
5069                     ; 707 {
5070                     	switch	.text
5071  0828               _InitADC:
5075                     ; 709 }
5079  0828 81            	ret
5103                     ; 714 void InitGPIO(void)
5103                     ; 715 {
5104                     	switch	.text
5105  0829               _InitGPIO:
5109                     ; 717 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT); // RF Module Input
5111  0829 4b00          	push	#0
5112  082b 4b02          	push	#2
5113  082d ae5000        	ldw	x,#20480
5114  0830 cd0000        	call	_GPIO_Init
5116  0833 85            	popw	x
5117                     ; 718 	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); // CH1 tact switch key
5119  0834 4b40          	push	#64
5120  0836 4b80          	push	#128
5121  0838 ae5005        	ldw	x,#20485
5122  083b cd0000        	call	_GPIO_Init
5124  083e 85            	popw	x
5125                     ; 719 	GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // CH2 tact switch key
5127  083f 4b40          	push	#64
5128  0841 4b10          	push	#16
5129  0843 ae5019        	ldw	x,#20505
5130  0846 cd0000        	call	_GPIO_Init
5132  0849 85            	popw	x
5133                     ; 722 	GPIO_Init(GPIOA, GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); // PA2 => Barr Pin 5 Display out | PA3 => PWM TIM5_CH3
5135  084a 4be0          	push	#224
5136  084c 4b0c          	push	#12
5137  084e ae5000        	ldw	x,#20480
5138  0851 cd0000        	call	_GPIO_Init
5140  0854 85            	popw	x
5141                     ; 723 	GPIO_Init(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);	// PB0 ~ PB3 = BCD/7Seg | PB6 => Eeprom Write Protect / Mode Write
5143  0855 4be0          	push	#224
5144  0857 4b0f          	push	#15
5145  0859 ae5005        	ldw	x,#20485
5146  085c cd0000        	call	_GPIO_Init
5148  085f 85            	popw	x
5149                     ; 724 	GPIO_Init(GPIOC, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch	1 to 5
5151  0860 4be0          	push	#224
5152  0862 4bfe          	push	#254
5153  0864 ae500a        	ldw	x,#20490
5154  0867 cd0000        	call	_GPIO_Init
5156  086a 85            	popw	x
5157                     ; 725 	GPIO_Init(GPIOD, GPIO_PIN_0 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
5159  086b 4be0          	push	#224
5160  086d 4bfd          	push	#253
5161  086f ae500f        	ldw	x,#20495
5162  0872 cd0000        	call	_GPIO_Init
5164  0875 85            	popw	x
5165                     ; 726 	GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST); // Display Latch	0 		
5167  0876 4be0          	push	#224
5168  0878 4b20          	push	#32
5169  087a ae5014        	ldw	x,#20500
5170  087d cd0000        	call	_GPIO_Init
5172  0880 85            	popw	x
5173                     ; 728 }
5176  0881 81            	ret
5210                     ; 732 void Delay(uint32_t nCount)
5210                     ; 733 {
5211                     	switch	.text
5212  0882               _Delay:
5214       00000000      OFST:	set	0
5217  0882 2009          	jra	L7722
5218  0884               L5722:
5219                     ; 737     nCount--;
5221  0884 96            	ldw	x,sp
5222  0885 1c0003        	addw	x,#OFST+3
5223  0888 a601          	ld	a,#1
5224  088a cd0000        	call	c_lgsbc
5226  088d               L7722:
5227                     ; 735   while (nCount != 0)
5229  088d 96            	ldw	x,sp
5230  088e 1c0003        	addw	x,#OFST+3
5231  0891 cd0000        	call	c_lzmp
5233  0894 26ee          	jrne	L5722
5234                     ; 739 }
5237  0896 81            	ret
5261                     ; 743 void SetCLK(void)
5261                     ; 744 {
5262                     	switch	.text
5263  0897               _SetCLK:
5267                     ; 745 	CLK_CKDIVR = 0b00000000;
5269  0897 725f50c6      	clr	_CLK_CKDIVR
5270                     ; 746 }
5273  089b 81            	ret
5297                     ; 750 void UnlockE2prom(void)
5297                     ; 751 {
5298                     	switch	.text
5299  089c               _UnlockE2prom:
5303                     ; 752 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
5305  089c a6f7          	ld	a,#247
5306  089e cd0000        	call	_FLASH_Unlock
5308                     ; 753 }
5311  08a1 81            	ret
5338                     ; 757 @far @interrupt void TIM6_UPD_IRQHandler (void)
5338                     ; 758 {
5340                     	switch	.text
5341  08a2               f_TIM6_UPD_IRQHandler:
5343  08a2 8a            	push	cc
5344  08a3 84            	pop	a
5345  08a4 a4bf          	and	a,#191
5346  08a6 88            	push	a
5347  08a7 86            	pop	cc
5348  08a8 3b0002        	push	c_x+2
5349  08ab be00          	ldw	x,c_x
5350  08ad 89            	pushw	x
5351  08ae 3b0002        	push	c_y+2
5352  08b1 be00          	ldw	x,c_y
5353  08b3 89            	pushw	x
5356                     ; 760 	if(RF_IN_ON)
5358  08b4 3d0e          	tnz	_RF_IN_ON
5359  08b6 2703          	jreq	L3332
5360                     ; 762 		Read_RF_6P20();
5362  08b8 cd0000        	call	_Read_RF_6P20
5364  08bb               L3332:
5365                     ; 765 	TIM6_SR = 0;		
5367  08bb 725f5344      	clr	_TIM6_SR
5368                     ; 766 }
5371  08bf 85            	popw	x
5372  08c0 bf00          	ldw	c_y,x
5373  08c2 320002        	pop	c_y+2
5374  08c5 85            	popw	x
5375  08c6 bf00          	ldw	c_x,x
5376  08c8 320002        	pop	c_x+2
5377  08cb 80            	iret
5805                     	xdef	f_TIM6_UPD_IRQHandler
5806                     	xdef	_main
5807                     	xdef	_save_preset_to_eeprom
5808                     	xdef	_showCharE
5809                     	xdef	_showCharC
5810                     	xdef	_showCharP
5811                     	xdef	_turnOffbuzzer
5812                     	xdef	_buzzerOnLow
5813                     	xdef	_buzzerOnHi
5814                     	xdef	_searchCode
5815                     	xdef	_save_code_to_eeprom
5816                     	xdef	_showDisplay
5817                     	xdef	_onInt_TM6
5818                     	xdef	_UnlockE2prom
5819                     	xdef	_InitADC
5820                     	xdef	_SetCLK
5821                     	xdef	_Delay
5822                     	xdef	_InitGPIO
5823                     	xdef	_vl
5824                     	xdef	_fl
5825                     	xdef	_vh
5826                     	xdef	_fh
5827                     	xdef	_saveData
5828                     	xdef	_ultimaFilaChamada
5829                     	xdef	_numGuiche
5830                     	xdef	_readChannel2
5831                     	xdef	_readChannel1
5832                     	xdef	_guiFilaE
5833                     	xdef	_guiFilaC
5834                     	xdef	_guiFilaP
5835                     	xdef	_guiUni
5836                     	xdef	_guiDez
5837                     	xdef	_digCen
5838                     	xdef	_digDez
5839                     	xdef	_digUni
5840                     	xdef	_repeatCall
5841                     	xdef	_counterE
5842                     	xdef	_counterC
5843                     	xdef	_counterP
5844                     	xdef	_debounceCh2
5845                     	xdef	_debounceCh1
5846                     	xdef	_contSeg
5847                     	xdef	_contMSeg
5848                     	xdef	_delayOn
5849                     	xdef	_stateBot
5850                     	xdef	_setRepeat
5851                     	xdef	_setCountE
5852                     	xdef	_setCountC
5853                     	xdef	_setCountP
5854                     	xdef	_sinLed
5855                     .eeprom:	section	.data
5856  0000               _codGuiche1:
5857  0000 00000000      	ds.b	4
5858                     	xdef	_codGuiche1
5859                     	xdef	_dataBufferVector2
5860                     	xdef	_dataEpromVector2
5861                     	xdef	_RF_IN_ON
5862                     	xdef	_i
5863                     	xdef	_pwm_alarm_l
5864                     	xdef	_pwm_alarm_h
5865                     	xdef	_pwm_alm_offh
5866                     	xdef	_pwm_call_fbk
5867                     	xdef	_pwm_call_l
5868                     	xdef	_pwm_call_h
5869                     	xref	_Read_RF_6P20
5870                     	xref.b	_Code_Ready
5871                     	xref.b	_HT_RC_Code_Ready_Overwrite
5872                     	xref.b	_RF_CopyBuffer
5873                     	xref	_TIM5_DeInit
5874                     	xref	_GPIO_ReadInputPin
5875                     	xref	_GPIO_WriteLow
5876                     	xref	_GPIO_WriteHigh
5877                     	xref	_GPIO_Init
5878                     	xref	_FLASH_Unlock
5879                     	xref.b	c_x
5880                     	xref.b	c_y
5900                     	xref	c_lzmp
5901                     	xref	c_lgsbc
5902                     	xref	c_eewrc
5903                     	end
