   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2661                     ; 55 void main(void)
2661                     ; 56 {
2663                     	switch	.text
2664  0000               _main:
2666  0000 5204          	subw	sp,#4
2667       00000004      OFST:	set	4
2670                     ; 57 	uint8_t last_state_btn1 = 1;
2672  0002 a601          	ld	a,#1
2673  0004 6b01          	ld	(OFST-3,sp),a
2675                     ; 58 	uint8_t last_state_btn2 = 1;
2677  0006 a601          	ld	a,#1
2678  0008 6b02          	ld	(OFST-2,sp),a
2680                     ; 62 	InitCLOCK();
2682  000a cd02dd        	call	_InitCLOCK
2684                     ; 63 	InitTIM4();
2686  000d cd0338        	call	_InitTIM4
2688                     ; 64 	InitGPIO();
2690  0010 cd0279        	call	_InitGPIO
2692  0013               L3171:
2693                     ; 68     current_state_btn1 = ReadButton(BOT_1_PORT, BOT_1_PIN);
2695  0013 4b40          	push	#64
2696  0015 ae500a        	ldw	x,#20490
2697  0018 ad6f          	call	_ReadButton
2699  001a 5b01          	addw	sp,#1
2700  001c 6b03          	ld	(OFST-1,sp),a
2702                     ; 69     current_state_btn2 = ReadButton(BOT_2_PORT, BOT_2_PIN);
2704  001e 4b80          	push	#128
2705  0020 ae500a        	ldw	x,#20490
2706  0023 ad64          	call	_ReadButton
2708  0025 5b01          	addw	sp,#1
2709  0027 6b04          	ld	(OFST+0,sp),a
2711                     ; 72     if ((last_state_btn1 == 1) && (current_state_btn1 == 0))
2713  0029 7b01          	ld	a,(OFST-3,sp)
2714  002b a101          	cp	a,#1
2715  002d 2622          	jrne	L7171
2717  002f 0d03          	tnz	(OFST-1,sp)
2718  0031 261e          	jrne	L7171
2719                     ; 74         Delay_ms_Timer(50);  // Debounce
2721  0033 ae0032        	ldw	x,#50
2722  0036 cd034f        	call	_Delay_ms_Timer
2724                     ; 75         if (ReadButton(BOT_1_PORT, BOT_1_PIN) == 0)  // Confirma se continua pressionado
2726  0039 4b40          	push	#64
2727  003b ae500a        	ldw	x,#20490
2728  003e ad49          	call	_ReadButton
2730  0040 5b01          	addw	sp,#1
2731  0042 4d            	tnz	a
2732  0043 260c          	jrne	L7171
2733                     ; 77             Contagem_14s();
2735  0045 cd0157        	call	_Contagem_14s
2737                     ; 78             BUZZER(1, 500);
2739  0048 ae01f4        	ldw	x,#500
2740  004b 89            	pushw	x
2741  004c a601          	ld	a,#1
2742  004e ad4c          	call	_BUZZER
2744  0050 85            	popw	x
2745  0051               L7171:
2746                     ; 83     if ((last_state_btn2 == 1) && (current_state_btn2 == 0))
2748  0051 7b02          	ld	a,(OFST-2,sp)
2749  0053 a101          	cp	a,#1
2750  0055 2622          	jrne	L3271
2752  0057 0d04          	tnz	(OFST+0,sp)
2753  0059 261e          	jrne	L3271
2754                     ; 85         Delay_ms_Timer(50);  // Debounce
2756  005b ae0032        	ldw	x,#50
2757  005e cd034f        	call	_Delay_ms_Timer
2759                     ; 86         if (ReadButton(BOT_2_PORT, BOT_2_PIN) == 0)  // Confirma se continua pressionado
2761  0061 4b80          	push	#128
2762  0063 ae500a        	ldw	x,#20490
2763  0066 ad21          	call	_ReadButton
2765  0068 5b01          	addw	sp,#1
2766  006a 4d            	tnz	a
2767  006b 260c          	jrne	L3271
2768                     ; 88             Contagem_24s();
2770  006d cd01a3        	call	_Contagem_24s
2772                     ; 89             BUZZER(1, 500);
2774  0070 ae01f4        	ldw	x,#500
2775  0073 89            	pushw	x
2776  0074 a601          	ld	a,#1
2777  0076 ad24          	call	_BUZZER
2779  0078 85            	popw	x
2780  0079               L3271:
2781                     ; 93     last_state_btn1 = current_state_btn1;
2783  0079 7b03          	ld	a,(OFST-1,sp)
2784  007b 6b01          	ld	(OFST-3,sp),a
2786                     ; 94     last_state_btn2 = current_state_btn2;
2788  007d 7b04          	ld	a,(OFST+0,sp)
2789  007f 6b02          	ld	(OFST-2,sp),a
2791                     ; 96     Delay_ms_Timer(20);  // Pequeno delay no loop principal
2793  0081 ae0014        	ldw	x,#20
2794  0084 cd034f        	call	_Delay_ms_Timer
2797  0087 208a          	jra	L3171
2896                     ; 102 uint8_t ReadButton(GPIO_TypeDef* PORT, uint8_t PIN)
2896                     ; 103 {
2897                     	switch	.text
2898  0089               _ReadButton:
2900  0089 89            	pushw	x
2901       00000000      OFST:	set	0
2904                     ; 104 	return (GPIO_ReadInputPin(PORT, PIN) == RESET) ? 0 : 1;
2906  008a 7b05          	ld	a,(OFST+5,sp)
2907  008c 88            	push	a
2908  008d cd0000        	call	_GPIO_ReadInputPin
2910  0090 5b01          	addw	sp,#1
2911  0092 4d            	tnz	a
2912  0093 2603          	jrne	L01
2913  0095 4f            	clr	a
2914  0096 2002          	jra	L21
2915  0098               L01:
2916  0098 a601          	ld	a,#1
2917  009a               L21:
2920  009a 85            	popw	x
2921  009b 81            	ret
2977                     ; 108 void BUZZER (uint8_t num_acm, uint16_t temp_acm)
2977                     ; 109 {
2978                     	switch	.text
2979  009c               _BUZZER:
2981  009c 88            	push	a
2982  009d 88            	push	a
2983       00000001      OFST:	set	1
2986                     ; 111 	for(i = 0; i < num_acm; i++)
2988  009e 0f01          	clr	(OFST+0,sp)
2991  00a0 2027          	jra	L5302
2992  00a2               L1302:
2993                     ; 113 		GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
2995  00a2 4b01          	push	#1
2996  00a4 ae500f        	ldw	x,#20495
2997  00a7 cd0000        	call	_GPIO_WriteHigh
2999  00aa 84            	pop	a
3000                     ; 114 		LED(4, 500);
3002  00ab ae01f4        	ldw	x,#500
3003  00ae 89            	pushw	x
3004  00af a604          	ld	a,#4
3005  00b1 ad1e          	call	_LED
3007  00b3 85            	popw	x
3008                     ; 115 		Delay_ms_Timer(temp_acm);
3010  00b4 1e05          	ldw	x,(OFST+4,sp)
3011  00b6 cd034f        	call	_Delay_ms_Timer
3013                     ; 117 		GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
3015  00b9 4b01          	push	#1
3016  00bb ae500f        	ldw	x,#20495
3017  00be cd0000        	call	_GPIO_WriteLow
3019  00c1 84            	pop	a
3020                     ; 118 		Delay_ms_Timer(temp_acm);
3022  00c2 1e05          	ldw	x,(OFST+4,sp)
3023  00c4 cd034f        	call	_Delay_ms_Timer
3025                     ; 111 	for(i = 0; i < num_acm; i++)
3027  00c7 0c01          	inc	(OFST+0,sp)
3029  00c9               L5302:
3032  00c9 7b01          	ld	a,(OFST+0,sp)
3033  00cb 1102          	cp	a,(OFST+1,sp)
3034  00cd 25d3          	jrult	L1302
3035                     ; 120 }
3038  00cf 85            	popw	x
3039  00d0 81            	ret
3095                     ; 123 void LED (uint8_t num_acm, uint16_t temp_acm)
3095                     ; 124 {
3096                     	switch	.text
3097  00d1               _LED:
3099  00d1 88            	push	a
3100  00d2 88            	push	a
3101       00000001      OFST:	set	1
3104                     ; 126 	for(i = 0; i < num_acm; i++)
3106  00d3 0f01          	clr	(OFST+0,sp)
3109  00d5 2078          	jra	L3702
3110  00d7               L7602:
3111                     ; 129 		GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);
3113  00d7 4b01          	push	#1
3114  00d9 ae5005        	ldw	x,#20485
3115  00dc cd0000        	call	_GPIO_WriteHigh
3117  00df 84            	pop	a
3118                     ; 130 		GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);
3120  00e0 4b02          	push	#2
3121  00e2 ae5005        	ldw	x,#20485
3122  00e5 cd0000        	call	_GPIO_WriteHigh
3124  00e8 84            	pop	a
3125                     ; 131 		GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);
3127  00e9 4b04          	push	#4
3128  00eb ae5005        	ldw	x,#20485
3129  00ee cd0000        	call	_GPIO_WriteHigh
3131  00f1 84            	pop	a
3132                     ; 132 		GPIO_WriteHigh(LD_D_PORT, LD_D_PIN);
3134  00f2 4b08          	push	#8
3135  00f4 ae5005        	ldw	x,#20485
3136  00f7 cd0000        	call	_GPIO_WriteHigh
3138  00fa 84            	pop	a
3139                     ; 133 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3141  00fb 4b04          	push	#4
3142  00fd ae500a        	ldw	x,#20490
3143  0100 cd0260        	call	_pulseLatch
3145  0103 84            	pop	a
3146                     ; 134 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3148  0104 4b02          	push	#2
3149  0106 ae500a        	ldw	x,#20490
3150  0109 cd0260        	call	_pulseLatch
3152  010c 84            	pop	a
3153                     ; 136 		Delay_ms_Timer(temp_acm);
3155  010d 1e05          	ldw	x,(OFST+4,sp)
3156  010f cd034f        	call	_Delay_ms_Timer
3158                     ; 138 		GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
3160  0112 4b01          	push	#1
3161  0114 ae5005        	ldw	x,#20485
3162  0117 cd0000        	call	_GPIO_WriteLow
3164  011a 84            	pop	a
3165                     ; 139 		GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
3167  011b 4b02          	push	#2
3168  011d ae5005        	ldw	x,#20485
3169  0120 cd0000        	call	_GPIO_WriteLow
3171  0123 84            	pop	a
3172                     ; 140 		GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
3174  0124 4b04          	push	#4
3175  0126 ae5005        	ldw	x,#20485
3176  0129 cd0000        	call	_GPIO_WriteLow
3178  012c 84            	pop	a
3179                     ; 141 		GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
3181  012d 4b08          	push	#8
3182  012f ae5005        	ldw	x,#20485
3183  0132 cd0000        	call	_GPIO_WriteLow
3185  0135 84            	pop	a
3186                     ; 142 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3188  0136 4b04          	push	#4
3189  0138 ae500a        	ldw	x,#20490
3190  013b cd0260        	call	_pulseLatch
3192  013e 84            	pop	a
3193                     ; 143 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3195  013f 4b02          	push	#2
3196  0141 ae500a        	ldw	x,#20490
3197  0144 cd0260        	call	_pulseLatch
3199  0147 84            	pop	a
3200                     ; 145 		Delay_ms_Timer(temp_acm);
3202  0148 1e05          	ldw	x,(OFST+4,sp)
3203  014a cd034f        	call	_Delay_ms_Timer
3205                     ; 126 	for(i = 0; i < num_acm; i++)
3207  014d 0c01          	inc	(OFST+0,sp)
3209  014f               L3702:
3212  014f 7b01          	ld	a,(OFST+0,sp)
3213  0151 1102          	cp	a,(OFST+1,sp)
3214  0153 2582          	jrult	L7602
3215                     ; 147 }
3218  0155 85            	popw	x
3219  0156 81            	ret
3274                     ; 150 void Contagem_14s(void)
3274                     ; 151 {
3275                     	switch	.text
3276  0157               _Contagem_14s:
3278  0157 5204          	subw	sp,#4
3279       00000004      OFST:	set	4
3282                     ; 156 	for(i = 14; i >= 0; i--)
3284  0159 ae000e        	ldw	x,#14
3285  015c 1f03          	ldw	(OFST-1,sp),x
3287  015e               L5212:
3288                     ; 158 		unidades = i % 10;
3290  015e 1e03          	ldw	x,(OFST-1,sp)
3291  0160 a60a          	ld	a,#10
3292  0162 cd0000        	call	c_smodx
3294  0165 01            	rrwa	x,a
3295  0166 6b01          	ld	(OFST-3,sp),a
3296  0168 02            	rlwa	x,a
3298                     ; 159 		dezenas = i / 10;
3300  0169 1e03          	ldw	x,(OFST-1,sp)
3301  016b a60a          	ld	a,#10
3302  016d cd0000        	call	c_sdivx
3304  0170 01            	rrwa	x,a
3305  0171 6b02          	ld	(OFST-2,sp),a
3306  0173 02            	rlwa	x,a
3308                     ; 161 		writeBCD(unidades);
3310  0174 7b01          	ld	a,(OFST-3,sp)
3311  0176 ad77          	call	_writeBCD
3313                     ; 162 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3315  0178 4b04          	push	#4
3316  017a ae500a        	ldw	x,#20490
3317  017d cd0260        	call	_pulseLatch
3319  0180 84            	pop	a
3320                     ; 164 		writeBCD(dezenas);
3322  0181 7b02          	ld	a,(OFST-2,sp)
3323  0183 ad6a          	call	_writeBCD
3325                     ; 165 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3327  0185 4b02          	push	#2
3328  0187 ae500a        	ldw	x,#20490
3329  018a cd0260        	call	_pulseLatch
3331  018d 84            	pop	a
3332                     ; 167 		Delay_ms_Timer(1000);
3334  018e ae03e8        	ldw	x,#1000
3335  0191 cd034f        	call	_Delay_ms_Timer
3337                     ; 156 	for(i = 14; i >= 0; i--)
3339  0194 1e03          	ldw	x,(OFST-1,sp)
3340  0196 1d0001        	subw	x,#1
3341  0199 1f03          	ldw	(OFST-1,sp),x
3345  019b 9c            	rvf
3346  019c 1e03          	ldw	x,(OFST-1,sp)
3347  019e 2ebe          	jrsge	L5212
3348                     ; 169 }
3351  01a0 5b04          	addw	sp,#4
3352  01a2 81            	ret
3407                     ; 172 void Contagem_24s(void)
3407                     ; 173 {
3408                     	switch	.text
3409  01a3               _Contagem_24s:
3411  01a3 5204          	subw	sp,#4
3412       00000004      OFST:	set	4
3415                     ; 178 	for(i = 24; i >= 0; i--)
3417  01a5 ae0018        	ldw	x,#24
3418  01a8 1f03          	ldw	(OFST-1,sp),x
3420  01aa               L1612:
3421                     ; 180 		unidades = i % 10;
3423  01aa 1e03          	ldw	x,(OFST-1,sp)
3424  01ac a60a          	ld	a,#10
3425  01ae cd0000        	call	c_smodx
3427  01b1 01            	rrwa	x,a
3428  01b2 6b01          	ld	(OFST-3,sp),a
3429  01b4 02            	rlwa	x,a
3431                     ; 181 		dezenas = i / 10;
3433  01b5 1e03          	ldw	x,(OFST-1,sp)
3434  01b7 a60a          	ld	a,#10
3435  01b9 cd0000        	call	c_sdivx
3437  01bc 01            	rrwa	x,a
3438  01bd 6b02          	ld	(OFST-2,sp),a
3439  01bf 02            	rlwa	x,a
3441                     ; 183 		writeBCD(unidades);
3443  01c0 7b01          	ld	a,(OFST-3,sp)
3444  01c2 ad2b          	call	_writeBCD
3446                     ; 184 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3448  01c4 4b04          	push	#4
3449  01c6 ae500a        	ldw	x,#20490
3450  01c9 cd0260        	call	_pulseLatch
3452  01cc 84            	pop	a
3453                     ; 186 		writeBCD(dezenas);
3455  01cd 7b02          	ld	a,(OFST-2,sp)
3456  01cf ad1e          	call	_writeBCD
3458                     ; 187 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3460  01d1 4b02          	push	#2
3461  01d3 ae500a        	ldw	x,#20490
3462  01d6 cd0260        	call	_pulseLatch
3464  01d9 84            	pop	a
3465                     ; 189 		Delay_ms_Timer(1000);
3467  01da ae03e8        	ldw	x,#1000
3468  01dd cd034f        	call	_Delay_ms_Timer
3470                     ; 178 	for(i = 24; i >= 0; i--)
3472  01e0 1e03          	ldw	x,(OFST-1,sp)
3473  01e2 1d0001        	subw	x,#1
3474  01e5 1f03          	ldw	(OFST-1,sp),x
3478  01e7 9c            	rvf
3479  01e8 1e03          	ldw	x,(OFST-1,sp)
3480  01ea 2ebe          	jrsge	L1612
3481                     ; 191 }
3484  01ec 5b04          	addw	sp,#4
3485  01ee 81            	ret
3521                     ; 194 void writeBCD(uint8_t valor)
3521                     ; 195 {
3522                     	switch	.text
3523  01ef               _writeBCD:
3525  01ef 88            	push	a
3526       00000000      OFST:	set	0
3529                     ; 196 	(valor & 0x01) ? GPIO_WriteHigh(LD_A_PORT, LD_A_PIN) : GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
3531  01f0 a501          	bcp	a,#1
3532  01f2 270c          	jreq	L62
3533  01f4 4b01          	push	#1
3534  01f6 ae5005        	ldw	x,#20485
3535  01f9 cd0000        	call	_GPIO_WriteHigh
3537  01fc 5b01          	addw	sp,#1
3538  01fe 200a          	jra	L03
3539  0200               L62:
3540  0200 4b01          	push	#1
3541  0202 ae5005        	ldw	x,#20485
3542  0205 cd0000        	call	_GPIO_WriteLow
3544  0208 5b01          	addw	sp,#1
3545  020a               L03:
3546                     ; 197 	(valor & 0x02) ? GPIO_WriteHigh(LD_B_PORT, LD_B_PIN) : GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
3548  020a 7b01          	ld	a,(OFST+1,sp)
3549  020c a502          	bcp	a,#2
3550  020e 270c          	jreq	L23
3551  0210 4b02          	push	#2
3552  0212 ae5005        	ldw	x,#20485
3553  0215 cd0000        	call	_GPIO_WriteHigh
3555  0218 5b01          	addw	sp,#1
3556  021a 200a          	jra	L43
3557  021c               L23:
3558  021c 4b02          	push	#2
3559  021e ae5005        	ldw	x,#20485
3560  0221 cd0000        	call	_GPIO_WriteLow
3562  0224 5b01          	addw	sp,#1
3563  0226               L43:
3564                     ; 198 	(valor & 0x04) ? GPIO_WriteHigh(LD_C_PORT, LD_C_PIN) : GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
3566  0226 7b01          	ld	a,(OFST+1,sp)
3567  0228 a504          	bcp	a,#4
3568  022a 270c          	jreq	L63
3569  022c 4b04          	push	#4
3570  022e ae5005        	ldw	x,#20485
3571  0231 cd0000        	call	_GPIO_WriteHigh
3573  0234 5b01          	addw	sp,#1
3574  0236 200a          	jra	L04
3575  0238               L63:
3576  0238 4b04          	push	#4
3577  023a ae5005        	ldw	x,#20485
3578  023d cd0000        	call	_GPIO_WriteLow
3580  0240 5b01          	addw	sp,#1
3581  0242               L04:
3582                     ; 199 	(valor & 0x08) ? GPIO_WriteHigh(LD_D_PORT, LD_D_PIN) : GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
3584  0242 7b01          	ld	a,(OFST+1,sp)
3585  0244 a508          	bcp	a,#8
3586  0246 270c          	jreq	L24
3587  0248 4b08          	push	#8
3588  024a ae5005        	ldw	x,#20485
3589  024d cd0000        	call	_GPIO_WriteHigh
3591  0250 5b01          	addw	sp,#1
3592  0252 200a          	jra	L44
3593  0254               L24:
3594  0254 4b08          	push	#8
3595  0256 ae5005        	ldw	x,#20485
3596  0259 cd0000        	call	_GPIO_WriteLow
3598  025c 5b01          	addw	sp,#1
3599  025e               L44:
3600                     ; 200 }
3603  025e 84            	pop	a
3604  025f 81            	ret
3653                     ; 203 void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN)
3653                     ; 204 {
3654                     	switch	.text
3655  0260               _pulseLatch:
3657  0260 89            	pushw	x
3658       00000000      OFST:	set	0
3661                     ; 205 	GPIO_WriteHigh(PORT, PIN);
3663  0261 7b05          	ld	a,(OFST+5,sp)
3664  0263 88            	push	a
3665  0264 cd0000        	call	_GPIO_WriteHigh
3667  0267 84            	pop	a
3668                     ; 206 	Delay_ms_Timer(1);
3670  0268 ae0001        	ldw	x,#1
3671  026b cd034f        	call	_Delay_ms_Timer
3673                     ; 207 	GPIO_WriteLow(PORT, PIN);
3675  026e 7b05          	ld	a,(OFST+5,sp)
3676  0270 88            	push	a
3677  0271 1e02          	ldw	x,(OFST+2,sp)
3678  0273 cd0000        	call	_GPIO_WriteLow
3680  0276 84            	pop	a
3681                     ; 208 }
3684  0277 85            	popw	x
3685  0278 81            	ret
3709                     ; 211 void InitGPIO(void)
3709                     ; 212 {
3710                     	switch	.text
3711  0279               _InitGPIO:
3715                     ; 213 	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3717  0279 4be0          	push	#224
3718  027b 4b01          	push	#1
3719  027d ae5005        	ldw	x,#20485
3720  0280 cd0000        	call	_GPIO_Init
3722  0283 85            	popw	x
3723                     ; 214 	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3725  0284 4be0          	push	#224
3726  0286 4b02          	push	#2
3727  0288 ae5005        	ldw	x,#20485
3728  028b cd0000        	call	_GPIO_Init
3730  028e 85            	popw	x
3731                     ; 215 	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3733  028f 4be0          	push	#224
3734  0291 4b04          	push	#4
3735  0293 ae5005        	ldw	x,#20485
3736  0296 cd0000        	call	_GPIO_Init
3738  0299 85            	popw	x
3739                     ; 216 	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3741  029a 4be0          	push	#224
3742  029c 4b08          	push	#8
3743  029e ae5005        	ldw	x,#20485
3744  02a1 cd0000        	call	_GPIO_Init
3746  02a4 85            	popw	x
3747                     ; 218 	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3749  02a5 4be0          	push	#224
3750  02a7 4b04          	push	#4
3751  02a9 ae500a        	ldw	x,#20490
3752  02ac cd0000        	call	_GPIO_Init
3754  02af 85            	popw	x
3755                     ; 219 	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3757  02b0 4be0          	push	#224
3758  02b2 4b02          	push	#2
3759  02b4 ae500a        	ldw	x,#20490
3760  02b7 cd0000        	call	_GPIO_Init
3762  02ba 85            	popw	x
3763                     ; 221 	GPIO_Init(BOT_1_PORT, BOT_1_PIN, GPIO_MODE_IN_PU_NO_IT);
3765  02bb 4b40          	push	#64
3766  02bd 4b40          	push	#64
3767  02bf ae500a        	ldw	x,#20490
3768  02c2 cd0000        	call	_GPIO_Init
3770  02c5 85            	popw	x
3771                     ; 222 	GPIO_Init(BOT_2_PORT, BOT_2_PIN, GPIO_MODE_IN_PU_NO_IT);
3773  02c6 4b40          	push	#64
3774  02c8 4b80          	push	#128
3775  02ca ae500a        	ldw	x,#20490
3776  02cd cd0000        	call	_GPIO_Init
3778  02d0 85            	popw	x
3779                     ; 224 	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3781  02d1 4be0          	push	#224
3782  02d3 4b01          	push	#1
3783  02d5 ae500f        	ldw	x,#20495
3784  02d8 cd0000        	call	_GPIO_Init
3786  02db 85            	popw	x
3787                     ; 225 }
3790  02dc 81            	ret
3823                     ; 228 void InitCLOCK(void)
3823                     ; 229 {
3824                     	switch	.text
3825  02dd               _InitCLOCK:
3829                     ; 230 	CLK_DeInit();
3831  02dd cd0000        	call	_CLK_DeInit
3833                     ; 231 	CLK_HSECmd(DISABLE);
3835  02e0 4f            	clr	a
3836  02e1 cd0000        	call	_CLK_HSECmd
3838                     ; 232 	CLK_LSICmd(DISABLE);
3840  02e4 4f            	clr	a
3841  02e5 cd0000        	call	_CLK_LSICmd
3843                     ; 233 	CLK_HSICmd(ENABLE);
3845  02e8 a601          	ld	a,#1
3846  02ea cd0000        	call	_CLK_HSICmd
3849  02ed               L3522:
3850                     ; 235 	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3852  02ed ae0102        	ldw	x,#258
3853  02f0 cd0000        	call	_CLK_GetFlagStatus
3855  02f3 4d            	tnz	a
3856  02f4 27f7          	jreq	L3522
3857                     ; 237 	CLK_ClockSwitchCmd(ENABLE);
3859  02f6 a601          	ld	a,#1
3860  02f8 cd0000        	call	_CLK_ClockSwitchCmd
3862                     ; 238 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
3864  02fb 4f            	clr	a
3865  02fc cd0000        	call	_CLK_HSIPrescalerConfig
3867                     ; 239 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
3869  02ff a680          	ld	a,#128
3870  0301 cd0000        	call	_CLK_SYSCLKConfig
3872                     ; 240 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3874  0304 4b01          	push	#1
3875  0306 4b00          	push	#0
3876  0308 ae01e1        	ldw	x,#481
3877  030b cd0000        	call	_CLK_ClockSwitchConfig
3879  030e 85            	popw	x
3880                     ; 242 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3882  030f 5f            	clrw	x
3883  0310 cd0000        	call	_CLK_PeripheralClockConfig
3885                     ; 243 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3887  0313 ae0100        	ldw	x,#256
3888  0316 cd0000        	call	_CLK_PeripheralClockConfig
3890                     ; 244 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
3892  0319 ae1300        	ldw	x,#4864
3893  031c cd0000        	call	_CLK_PeripheralClockConfig
3895                     ; 245 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3897  031f ae1200        	ldw	x,#4608
3898  0322 cd0000        	call	_CLK_PeripheralClockConfig
3900                     ; 246 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3902  0325 ae0300        	ldw	x,#768
3903  0328 cd0000        	call	_CLK_PeripheralClockConfig
3905                     ; 247 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3907  032b ae0700        	ldw	x,#1792
3908  032e cd0000        	call	_CLK_PeripheralClockConfig
3910                     ; 248 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
3912  0331 ae0401        	ldw	x,#1025
3913  0334 cd0000        	call	_CLK_PeripheralClockConfig
3915                     ; 249 }
3918  0337 81            	ret
3945                     ; 252 void InitTIM4(void)
3945                     ; 253 {
3946                     	switch	.text
3947  0338               _InitTIM4:
3951                     ; 254 	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
3953  0338 ae0701        	ldw	x,#1793
3954  033b cd0000        	call	_TIM4_PrescalerConfig
3956                     ; 255 	TIM4_SetAutoreload(125);
3958  033e a67d          	ld	a,#125
3959  0340 cd0000        	call	_TIM4_SetAutoreload
3961                     ; 256 	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
3963  0343 ae0100        	ldw	x,#256
3964  0346 cd0000        	call	_TIM4_ITConfig
3966                     ; 257 	TIM4_Cmd(ENABLE);
3968  0349 a601          	ld	a,#1
3969  034b cd0000        	call	_TIM4_Cmd
3971                     ; 258 }
3974  034e 81            	ret
4011                     ; 261 void Delay_ms_Timer(uint16_t ms)
4011                     ; 262 {
4012                     	switch	.text
4013  034f               _Delay_ms_Timer:
4015  034f 89            	pushw	x
4016       00000000      OFST:	set	0
4019  0350 2011          	jra	L7032
4020  0352               L5032:
4021                     ; 265 		TIM4_SetCounter(0);
4023  0352 4f            	clr	a
4024  0353 cd0000        	call	_TIM4_SetCounter
4026                     ; 266 		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
4028  0356 a601          	ld	a,#1
4029  0358 cd0000        	call	_TIM4_ClearFlag
4032  035b               L5132:
4033                     ; 267 		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
4035  035b a601          	ld	a,#1
4036  035d cd0000        	call	_TIM4_GetFlagStatus
4038  0360 4d            	tnz	a
4039  0361 27f8          	jreq	L5132
4040  0363               L7032:
4041                     ; 263 	while(ms--)
4043  0363 1e01          	ldw	x,(OFST+1,sp)
4044  0365 1d0001        	subw	x,#1
4045  0368 1f01          	ldw	(OFST+1,sp),x
4046  036a 1c0001        	addw	x,#1
4047  036d a30000        	cpw	x,#0
4048  0370 26e0          	jrne	L5032
4049                     ; 269 }
4052  0372 85            	popw	x
4053  0373 81            	ret
4066                     	xdef	_main
4067                     	xdef	_LED
4068                     	xdef	_BUZZER
4069                     	xdef	_ReadButton
4070                     	xdef	_Contagem_24s
4071                     	xdef	_Contagem_14s
4072                     	xdef	_pulseLatch
4073                     	xdef	_writeBCD
4074                     	xdef	_Delay_ms_Timer
4075                     	xdef	_InitTIM4
4076                     	xdef	_InitGPIO
4077                     	xdef	_InitCLOCK
4078                     	xref	_TIM4_ClearFlag
4079                     	xref	_TIM4_GetFlagStatus
4080                     	xref	_TIM4_SetAutoreload
4081                     	xref	_TIM4_SetCounter
4082                     	xref	_TIM4_PrescalerConfig
4083                     	xref	_TIM4_ITConfig
4084                     	xref	_TIM4_Cmd
4085                     	xref	_GPIO_ReadInputPin
4086                     	xref	_GPIO_WriteLow
4087                     	xref	_GPIO_WriteHigh
4088                     	xref	_GPIO_Init
4089                     	xref	_CLK_GetFlagStatus
4090                     	xref	_CLK_SYSCLKConfig
4091                     	xref	_CLK_HSIPrescalerConfig
4092                     	xref	_CLK_ClockSwitchConfig
4093                     	xref	_CLK_PeripheralClockConfig
4094                     	xref	_CLK_ClockSwitchCmd
4095                     	xref	_CLK_LSICmd
4096                     	xref	_CLK_HSICmd
4097                     	xref	_CLK_HSECmd
4098                     	xref	_CLK_DeInit
4099                     	xref.b	c_x
4118                     	xref	c_sdivx
4119                     	xref	c_smodx
4120                     	end
