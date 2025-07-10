   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2662                     ; 76 void main(void)
2662                     ; 77 {
2664                     	switch	.text
2665  0000               _main:
2667  0000 5204          	subw	sp,#4
2668       00000004      OFST:	set	4
2671                     ; 81 	uint8_t last_state_btn1 = 1;
2673  0002 a601          	ld	a,#1
2674  0004 6b01          	ld	(OFST-3,sp),a
2676                     ; 82 	uint8_t last_state_btn2 = 1;
2678  0006 a601          	ld	a,#1
2679  0008 6b02          	ld	(OFST-2,sp),a
2681                     ; 87 	InitCLOCK();  // Configura o clock do microcontrolador
2683  000a cd02df        	call	_InitCLOCK
2685                     ; 88 	InitTIM4();   // Configura o Timer 4 para atrasos
2687  000d cd033a        	call	_InitTIM4
2689                     ; 89 	InitGPIO();   // Configura os pinos de entrada/saída
2691  0010 cd027b        	call	_InitGPIO
2693                     ; 92 	LED(4, 500);
2695  0013 ae01f4        	ldw	x,#500
2696  0016 89            	pushw	x
2697  0017 a604          	ld	a,#4
2698  0019 cd00db        	call	_LED
2700  001c 85            	popw	x
2701  001d               L3171:
2702                     ; 99         current_state_btn1 = ReadButton(BOT_1_PORT, BOT_1_PIN);
2704  001d 4b04          	push	#4
2705  001f ae500f        	ldw	x,#20495
2706  0022 ad6f          	call	_ReadButton
2708  0024 5b01          	addw	sp,#1
2709  0026 6b03          	ld	(OFST-1,sp),a
2711                     ; 100         current_state_btn2 = ReadButton(BOT_2_PORT, BOT_2_PIN);
2713  0028 4b08          	push	#8
2714  002a ae500f        	ldw	x,#20495
2715  002d ad64          	call	_ReadButton
2717  002f 5b01          	addw	sp,#1
2718  0031 6b04          	ld	(OFST+0,sp),a
2720                     ; 104         if ((last_state_btn1 == 1) && (current_state_btn1 == 0))
2722  0033 7b01          	ld	a,(OFST-3,sp)
2723  0035 a101          	cp	a,#1
2724  0037 2622          	jrne	L7171
2726  0039 0d03          	tnz	(OFST-1,sp)
2727  003b 261e          	jrne	L7171
2728                     ; 106             Delay_ms_Timer(50); // Atraso de 50ms para Debounce: espera para ver se o pressionamento é estável.
2730  003d ae0032        	ldw	x,#50
2731  0040 cd0351        	call	_Delay_ms_Timer
2733                     ; 109             if (ReadButton(BOT_1_PORT, BOT_1_PIN) == 0)
2735  0043 4b04          	push	#4
2736  0045 ae500f        	ldw	x,#20495
2737  0048 ad49          	call	_ReadButton
2739  004a 5b01          	addw	sp,#1
2740  004c 4d            	tnz	a
2741  004d 260c          	jrne	L7171
2742                     ; 111                 Contagem_14s();   // Chama a função de contagem regressiva de 14 segundos
2744  004f cd0161        	call	_Contagem_14s
2746                     ; 112                 BUZZER(1, 500);   // Aciona o buzzer/LED uma vez por 500ms ao final da contagem
2748  0052 ae01f4        	ldw	x,#500
2749  0055 89            	pushw	x
2750  0056 a601          	ld	a,#1
2751  0058 ad4c          	call	_BUZZER
2753  005a 85            	popw	x
2754  005b               L7171:
2755                     ; 118         if ((last_state_btn2 == 1) && (current_state_btn2 == 0))
2757  005b 7b02          	ld	a,(OFST-2,sp)
2758  005d a101          	cp	a,#1
2759  005f 2622          	jrne	L3271
2761  0061 0d04          	tnz	(OFST+0,sp)
2762  0063 261e          	jrne	L3271
2763                     ; 120             Delay_ms_Timer(50); // Debounce
2765  0065 ae0032        	ldw	x,#50
2766  0068 cd0351        	call	_Delay_ms_Timer
2768                     ; 121             if (ReadButton(BOT_2_PORT, BOT_2_PIN) == 0) // Confirma se continua pressionado
2770  006b 4b08          	push	#8
2771  006d ae500f        	ldw	x,#20495
2772  0070 ad21          	call	_ReadButton
2774  0072 5b01          	addw	sp,#1
2775  0074 4d            	tnz	a
2776  0075 260c          	jrne	L3271
2777                     ; 123                 Contagem_24s();   // Chama a função de contagem regressiva de 24 segundos
2779  0077 cd01ad        	call	_Contagem_24s
2781                     ; 124                 BUZZER(1, 500);   // Aciona o buzzer/LED uma vez por 500ms ao final da contagem
2783  007a ae01f4        	ldw	x,#500
2784  007d 89            	pushw	x
2785  007e a601          	ld	a,#1
2786  0080 ad24          	call	_BUZZER
2788  0082 85            	popw	x
2789  0083               L3271:
2790                     ; 129         last_state_btn1 = current_state_btn1;
2792  0083 7b03          	ld	a,(OFST-1,sp)
2793  0085 6b01          	ld	(OFST-3,sp),a
2795                     ; 130         last_state_btn2 = current_state_btn2;
2797  0087 7b04          	ld	a,(OFST+0,sp)
2798  0089 6b02          	ld	(OFST-2,sp),a
2800                     ; 132         Delay_ms_Timer(20); // Pequeno atraso no loop principal para evitar "polling" excessivo
2802  008b ae0014        	ldw	x,#20
2803  008e cd0351        	call	_Delay_ms_Timer
2806  0091 208a          	jra	L3171
2905                     ; 142 uint8_t ReadButton(GPIO_TypeDef* PORT, uint8_t PIN)
2905                     ; 143 {
2906                     	switch	.text
2907  0093               _ReadButton:
2909  0093 89            	pushw	x
2910       00000000      OFST:	set	0
2913                     ; 144 	return (GPIO_ReadInputPin(PORT, PIN) == RESET) ? 0 : 1;
2915  0094 7b05          	ld	a,(OFST+5,sp)
2916  0096 88            	push	a
2917  0097 cd0000        	call	_GPIO_ReadInputPin
2919  009a 5b01          	addw	sp,#1
2920  009c 4d            	tnz	a
2921  009d 2603          	jrne	L01
2922  009f 4f            	clr	a
2923  00a0 2002          	jra	L21
2924  00a2               L01:
2925  00a2 a601          	ld	a,#1
2926  00a4               L21:
2929  00a4 85            	popw	x
2930  00a5 81            	ret
2986                     ; 150 void BUZZER (uint8_t num_acm, uint16_t temp_acm)
2986                     ; 151 {
2987                     	switch	.text
2988  00a6               _BUZZER:
2990  00a6 88            	push	a
2991  00a7 88            	push	a
2992       00000001      OFST:	set	1
2995                     ; 153 	for(i = 0; i < num_acm; i++)
2997  00a8 0f01          	clr	(OFST+0,sp)
3000  00aa 2027          	jra	L5302
3001  00ac               L1302:
3002                     ; 155 		GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN); // Ativa o buzzer/LED (define o pino como HIGH)
3004  00ac 4b01          	push	#1
3005  00ae ae500f        	ldw	x,#20495
3006  00b1 cd0000        	call	_GPIO_WriteHigh
3008  00b4 84            	pop	a
3009                     ; 156 		LED(4, 500);                             // Chama a função LED para piscar os displays BCD como um efeito visual
3011  00b5 ae01f4        	ldw	x,#500
3012  00b8 89            	pushw	x
3013  00b9 a604          	ld	a,#4
3014  00bb ad1e          	call	_LED
3016  00bd 85            	popw	x
3017                     ; 157 		Delay_ms_Timer(temp_acm);                // Mantém o buzzer/LED ativo pelo tempo especificado
3019  00be 1e05          	ldw	x,(OFST+4,sp)
3020  00c0 cd0351        	call	_Delay_ms_Timer
3022                     ; 159 		GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);  // Desativa o buzzer/LED (define o pino como LOW)
3024  00c3 4b01          	push	#1
3025  00c5 ae500f        	ldw	x,#20495
3026  00c8 cd0000        	call	_GPIO_WriteLow
3028  00cb 84            	pop	a
3029                     ; 160 		Delay_ms_Timer(temp_acm);                // Mantém o buzzer/LED desativado pelo tempo especificado
3031  00cc 1e05          	ldw	x,(OFST+4,sp)
3032  00ce cd0351        	call	_Delay_ms_Timer
3034                     ; 153 	for(i = 0; i < num_acm; i++)
3036  00d1 0c01          	inc	(OFST+0,sp)
3038  00d3               L5302:
3041  00d3 7b01          	ld	a,(OFST+0,sp)
3042  00d5 1102          	cp	a,(OFST+1,sp)
3043  00d7 25d3          	jrult	L1302
3044                     ; 162 }
3047  00d9 85            	popw	x
3048  00da 81            	ret
3104                     ; 167 void LED (uint8_t num_acm, uint16_t temp_acm)
3104                     ; 168 {
3105                     	switch	.text
3106  00db               _LED:
3108  00db 88            	push	a
3109  00dc 88            	push	a
3110       00000001      OFST:	set	1
3113                     ; 170 	for(i = 0; i < num_acm; i++)
3115  00dd 0f01          	clr	(OFST+0,sp)
3118  00df 2078          	jra	L3702
3119  00e1               L7602:
3120                     ; 173 		GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);
3122  00e1 4b01          	push	#1
3123  00e3 ae5005        	ldw	x,#20485
3124  00e6 cd0000        	call	_GPIO_WriteHigh
3126  00e9 84            	pop	a
3127                     ; 174 		GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);
3129  00ea 4b02          	push	#2
3130  00ec ae5005        	ldw	x,#20485
3131  00ef cd0000        	call	_GPIO_WriteHigh
3133  00f2 84            	pop	a
3134                     ; 175 		GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);
3136  00f3 4b04          	push	#4
3137  00f5 ae5005        	ldw	x,#20485
3138  00f8 cd0000        	call	_GPIO_WriteHigh
3140  00fb 84            	pop	a
3141                     ; 176 		GPIO_WriteHigh(LD_D_PORT, LD_D_PIN);
3143  00fc 4b08          	push	#8
3144  00fe ae5005        	ldw	x,#20485
3145  0101 cd0000        	call	_GPIO_WriteHigh
3147  0104 84            	pop	a
3148                     ; 177 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades
3150  0105 4b04          	push	#4
3151  0107 ae500a        	ldw	x,#20490
3152  010a cd0262        	call	_pulseLatch
3154  010d 84            	pop	a
3155                     ; 178 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das dezenas
3157  010e 4b02          	push	#2
3158  0110 ae500a        	ldw	x,#20490
3159  0113 cd0262        	call	_pulseLatch
3161  0116 84            	pop	a
3162                     ; 180 		Delay_ms_Timer(temp_acm); // Mantém os displays acesos pelo tempo especificado
3164  0117 1e05          	ldw	x,(OFST+4,sp)
3165  0119 cd0351        	call	_Delay_ms_Timer
3167                     ; 183 		GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
3169  011c 4b01          	push	#1
3170  011e ae5005        	ldw	x,#20485
3171  0121 cd0000        	call	_GPIO_WriteLow
3173  0124 84            	pop	a
3174                     ; 184 		GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
3176  0125 4b02          	push	#2
3177  0127 ae5005        	ldw	x,#20485
3178  012a cd0000        	call	_GPIO_WriteLow
3180  012d 84            	pop	a
3181                     ; 185 		GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
3183  012e 4b04          	push	#4
3184  0130 ae5005        	ldw	x,#20485
3185  0133 cd0000        	call	_GPIO_WriteLow
3187  0136 84            	pop	a
3188                     ; 186 		GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
3190  0137 4b08          	push	#8
3191  0139 ae5005        	ldw	x,#20485
3192  013c cd0000        	call	_GPIO_WriteLow
3194  013f 84            	pop	a
3195                     ; 187 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor "apagado" nas unidades
3197  0140 4b04          	push	#4
3198  0142 ae500a        	ldw	x,#20490
3199  0145 cd0262        	call	_pulseLatch
3201  0148 84            	pop	a
3202                     ; 188 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor "apagado" nas dezenas
3204  0149 4b02          	push	#2
3205  014b ae500a        	ldw	x,#20490
3206  014e cd0262        	call	_pulseLatch
3208  0151 84            	pop	a
3209                     ; 190 		Delay_ms_Timer(temp_acm); // Mantém os displays apagados pelo tempo especificado
3211  0152 1e05          	ldw	x,(OFST+4,sp)
3212  0154 cd0351        	call	_Delay_ms_Timer
3214                     ; 170 	for(i = 0; i < num_acm; i++)
3216  0157 0c01          	inc	(OFST+0,sp)
3218  0159               L3702:
3221  0159 7b01          	ld	a,(OFST+0,sp)
3222  015b 1102          	cp	a,(OFST+1,sp)
3223  015d 2582          	jrult	L7602
3224                     ; 192 }
3227  015f 85            	popw	x
3228  0160 81            	ret
3283                     ; 195 void Contagem_14s(void)
3283                     ; 196 {
3284                     	switch	.text
3285  0161               _Contagem_14s:
3287  0161 5204          	subw	sp,#4
3288       00000004      OFST:	set	4
3291                     ; 202 	for(i = 14; i >= 0; i--)
3293  0163 ae000e        	ldw	x,#14
3294  0166 1f03          	ldw	(OFST-1,sp),x
3296  0168               L5212:
3297                     ; 204 		unidades = i % 10;  // Calcula o dígito das unidades (resto da divisão por 10)
3299  0168 1e03          	ldw	x,(OFST-1,sp)
3300  016a a60a          	ld	a,#10
3301  016c cd0000        	call	c_smodx
3303  016f 01            	rrwa	x,a
3304  0170 6b01          	ld	(OFST-3,sp),a
3305  0172 02            	rlwa	x,a
3307                     ; 205 		dezenas = i / 10;   // Calcula o dígito das dezenas (resultado da divisão inteira por 10)
3309  0173 1e03          	ldw	x,(OFST-1,sp)
3310  0175 a60a          	ld	a,#10
3311  0177 cd0000        	call	c_sdivx
3313  017a 01            	rrwa	x,a
3314  017b 6b02          	ld	(OFST-2,sp),a
3315  017d 02            	rlwa	x,a
3317                     ; 207 		writeBCD(unidades);         // Envia o dígito das unidades para os pinos BCD
3319  017e 7b01          	ld	a,(OFST-3,sp)
3320  0180 ad77          	call	_writeBCD
3322                     ; 208 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades
3324  0182 4b04          	push	#4
3325  0184 ae500a        	ldw	x,#20490
3326  0187 cd0262        	call	_pulseLatch
3328  018a 84            	pop	a
3329                     ; 210 		writeBCD(dezenas);          // Envia o dígito das dezenas para os pinos BCD
3331  018b 7b02          	ld	a,(OFST-2,sp)
3332  018d ad6a          	call	_writeBCD
3334                     ; 211 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das dezenas
3336  018f 4b02          	push	#2
3337  0191 ae500a        	ldw	x,#20490
3338  0194 cd0262        	call	_pulseLatch
3340  0197 84            	pop	a
3341                     ; 213 		Delay_ms_Timer(1000); // Aguarda 1 segundo antes de decrementar a contagem.
3343  0198 ae03e8        	ldw	x,#1000
3344  019b cd0351        	call	_Delay_ms_Timer
3346                     ; 202 	for(i = 14; i >= 0; i--)
3348  019e 1e03          	ldw	x,(OFST-1,sp)
3349  01a0 1d0001        	subw	x,#1
3350  01a3 1f03          	ldw	(OFST-1,sp),x
3354  01a5 9c            	rvf
3355  01a6 1e03          	ldw	x,(OFST-1,sp)
3356  01a8 2ebe          	jrsge	L5212
3357                     ; 216 }
3360  01aa 5b04          	addw	sp,#4
3361  01ac 81            	ret
3416                     ; 220 void Contagem_24s(void)
3416                     ; 221 {
3417                     	switch	.text
3418  01ad               _Contagem_24s:
3420  01ad 5204          	subw	sp,#4
3421       00000004      OFST:	set	4
3424                     ; 226 	for(i = 24; i >= 0; i--)
3426  01af ae0018        	ldw	x,#24
3427  01b2 1f03          	ldw	(OFST-1,sp),x
3429  01b4               L1612:
3430                     ; 228 		unidades = i % 10;
3432  01b4 1e03          	ldw	x,(OFST-1,sp)
3433  01b6 a60a          	ld	a,#10
3434  01b8 cd0000        	call	c_smodx
3436  01bb 01            	rrwa	x,a
3437  01bc 6b01          	ld	(OFST-3,sp),a
3438  01be 02            	rlwa	x,a
3440                     ; 229 		dezenas = i / 10;
3442  01bf 1e03          	ldw	x,(OFST-1,sp)
3443  01c1 a60a          	ld	a,#10
3444  01c3 cd0000        	call	c_sdivx
3446  01c6 01            	rrwa	x,a
3447  01c7 6b02          	ld	(OFST-2,sp),a
3448  01c9 02            	rlwa	x,a
3450                     ; 231 		writeBCD(unidades);
3452  01ca 7b01          	ld	a,(OFST-3,sp)
3453  01cc ad2b          	call	_writeBCD
3455                     ; 232 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
3457  01ce 4b04          	push	#4
3458  01d0 ae500a        	ldw	x,#20490
3459  01d3 cd0262        	call	_pulseLatch
3461  01d6 84            	pop	a
3462                     ; 234 		writeBCD(dezenas);
3464  01d7 7b02          	ld	a,(OFST-2,sp)
3465  01d9 ad1e          	call	_writeBCD
3467                     ; 235 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
3469  01db 4b02          	push	#2
3470  01dd ae500a        	ldw	x,#20490
3471  01e0 cd0262        	call	_pulseLatch
3473  01e3 84            	pop	a
3474                     ; 237 		Delay_ms_Timer(1000); // Aguarda 1 segundo
3476  01e4 ae03e8        	ldw	x,#1000
3477  01e7 cd0351        	call	_Delay_ms_Timer
3479                     ; 226 	for(i = 24; i >= 0; i--)
3481  01ea 1e03          	ldw	x,(OFST-1,sp)
3482  01ec 1d0001        	subw	x,#1
3483  01ef 1f03          	ldw	(OFST-1,sp),x
3487  01f1 9c            	rvf
3488  01f2 1e03          	ldw	x,(OFST-1,sp)
3489  01f4 2ebe          	jrsge	L1612
3490                     ; 239 }
3493  01f6 5b04          	addw	sp,#4
3494  01f8 81            	ret
3530                     ; 244 void writeBCD(uint8_t valor)
3530                     ; 245 {
3531                     	switch	.text
3532  01f9               _writeBCD:
3534  01f9 88            	push	a
3535       00000000      OFST:	set	0
3538                     ; 248 	if(valor & 0x01) GPIO_WriteHigh(LD_A_PORT, LD_A_PIN); else GPIO_WriteLow(LD_A_PORT, LD_A_PIN); // Bit 0 (1)
3540  01fa a501          	bcp	a,#1
3541  01fc 270b          	jreq	L5022
3544  01fe 4b01          	push	#1
3545  0200 ae5005        	ldw	x,#20485
3546  0203 cd0000        	call	_GPIO_WriteHigh
3548  0206 84            	pop	a
3550  0207 2009          	jra	L7022
3551  0209               L5022:
3554  0209 4b01          	push	#1
3555  020b ae5005        	ldw	x,#20485
3556  020e cd0000        	call	_GPIO_WriteLow
3558  0211 84            	pop	a
3559  0212               L7022:
3560                     ; 249 	if(valor & 0x02) GPIO_WriteHigh(LD_B_PORT, LD_B_PIN); else GPIO_WriteLow(LD_B_PORT, LD_B_PIN); // Bit 1 (2)
3562  0212 7b01          	ld	a,(OFST+1,sp)
3563  0214 a502          	bcp	a,#2
3564  0216 270b          	jreq	L1122
3567  0218 4b02          	push	#2
3568  021a ae5005        	ldw	x,#20485
3569  021d cd0000        	call	_GPIO_WriteHigh
3571  0220 84            	pop	a
3573  0221 2009          	jra	L3122
3574  0223               L1122:
3577  0223 4b02          	push	#2
3578  0225 ae5005        	ldw	x,#20485
3579  0228 cd0000        	call	_GPIO_WriteLow
3581  022b 84            	pop	a
3582  022c               L3122:
3583                     ; 250 	if(valor & 0x04) GPIO_WriteHigh(LD_C_PORT, LD_C_PIN); else GPIO_WriteLow(LD_C_PORT, LD_C_PIN); // Bit 2 (4)
3585  022c 7b01          	ld	a,(OFST+1,sp)
3586  022e a504          	bcp	a,#4
3587  0230 270b          	jreq	L5122
3590  0232 4b04          	push	#4
3591  0234 ae5005        	ldw	x,#20485
3592  0237 cd0000        	call	_GPIO_WriteHigh
3594  023a 84            	pop	a
3596  023b 2009          	jra	L7122
3597  023d               L5122:
3600  023d 4b04          	push	#4
3601  023f ae5005        	ldw	x,#20485
3602  0242 cd0000        	call	_GPIO_WriteLow
3604  0245 84            	pop	a
3605  0246               L7122:
3606                     ; 251 	if(valor & 0x08) GPIO_WriteHigh(LD_D_PORT, LD_D_PIN); else GPIO_WriteLow(LD_D_PORT, LD_D_PIN); // Bit 3 (8)
3608  0246 7b01          	ld	a,(OFST+1,sp)
3609  0248 a508          	bcp	a,#8
3610  024a 270b          	jreq	L1222
3613  024c 4b08          	push	#8
3614  024e ae5005        	ldw	x,#20485
3615  0251 cd0000        	call	_GPIO_WriteHigh
3617  0254 84            	pop	a
3619  0255 2009          	jra	L3222
3620  0257               L1222:
3623  0257 4b08          	push	#8
3624  0259 ae5005        	ldw	x,#20485
3625  025c cd0000        	call	_GPIO_WriteLow
3627  025f 84            	pop	a
3628  0260               L3222:
3629                     ; 252 }
3632  0260 84            	pop	a
3633  0261 81            	ret
3682                     ; 258 void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN)
3682                     ; 259 {
3683                     	switch	.text
3684  0262               _pulseLatch:
3686  0262 89            	pushw	x
3687       00000000      OFST:	set	0
3690                     ; 260 	GPIO_WriteHigh(PORT, PIN);  // Define o pino latch como HIGH
3692  0263 7b05          	ld	a,(OFST+5,sp)
3693  0265 88            	push	a
3694  0266 cd0000        	call	_GPIO_WriteHigh
3696  0269 84            	pop	a
3697                     ; 261 	Delay_ms_Timer(1);          // Aguarda um pequeno tempo (1ms) para garantir o pulso
3699  026a ae0001        	ldw	x,#1
3700  026d cd0351        	call	_Delay_ms_Timer
3702                     ; 262 	GPIO_WriteLow(PORT, PIN);   // Define o pino latch como LOW
3704  0270 7b05          	ld	a,(OFST+5,sp)
3705  0272 88            	push	a
3706  0273 1e02          	ldw	x,(OFST+2,sp)
3707  0275 cd0000        	call	_GPIO_WriteLow
3709  0278 84            	pop	a
3710                     ; 263 }
3713  0279 85            	popw	x
3714  027a 81            	ret
3738                     ; 267 void InitGPIO(void)
3738                     ; 268 {
3739                     	switch	.text
3740  027b               _InitGPIO:
3744                     ; 272 	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3746  027b 4be0          	push	#224
3747  027d 4b01          	push	#1
3748  027f ae5005        	ldw	x,#20485
3749  0282 cd0000        	call	_GPIO_Init
3751  0285 85            	popw	x
3752                     ; 273 	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3754  0286 4be0          	push	#224
3755  0288 4b02          	push	#2
3756  028a ae5005        	ldw	x,#20485
3757  028d cd0000        	call	_GPIO_Init
3759  0290 85            	popw	x
3760                     ; 274 	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3762  0291 4be0          	push	#224
3763  0293 4b04          	push	#4
3764  0295 ae5005        	ldw	x,#20485
3765  0298 cd0000        	call	_GPIO_Init
3767  029b 85            	popw	x
3768                     ; 275 	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3770  029c 4be0          	push	#224
3771  029e 4b08          	push	#8
3772  02a0 ae5005        	ldw	x,#20485
3773  02a3 cd0000        	call	_GPIO_Init
3775  02a6 85            	popw	x
3776                     ; 278 	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3778  02a7 4be0          	push	#224
3779  02a9 4b04          	push	#4
3780  02ab ae500a        	ldw	x,#20490
3781  02ae cd0000        	call	_GPIO_Init
3783  02b1 85            	popw	x
3784                     ; 279 	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3786  02b2 4be0          	push	#224
3787  02b4 4b02          	push	#2
3788  02b6 ae500a        	ldw	x,#20490
3789  02b9 cd0000        	call	_GPIO_Init
3791  02bc 85            	popw	x
3792                     ; 284 	GPIO_Init(BOT_1_PORT, BOT_1_PIN, GPIO_MODE_IN_PU_NO_IT);
3794  02bd 4b40          	push	#64
3795  02bf 4b04          	push	#4
3796  02c1 ae500f        	ldw	x,#20495
3797  02c4 cd0000        	call	_GPIO_Init
3799  02c7 85            	popw	x
3800                     ; 285 	GPIO_Init(BOT_2_PORT, BOT_2_PIN, GPIO_MODE_IN_PU_NO_IT);
3802  02c8 4b40          	push	#64
3803  02ca 4b08          	push	#8
3804  02cc ae500f        	ldw	x,#20495
3805  02cf cd0000        	call	_GPIO_Init
3807  02d2 85            	popw	x
3808                     ; 288 	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3810  02d3 4be0          	push	#224
3811  02d5 4b01          	push	#1
3812  02d7 ae500f        	ldw	x,#20495
3813  02da cd0000        	call	_GPIO_Init
3815  02dd 85            	popw	x
3816                     ; 289 }
3819  02de 81            	ret
3852                     ; 294 void InitCLOCK(void)
3852                     ; 295 {
3853                     	switch	.text
3854  02df               _InitCLOCK:
3858                     ; 296 	CLK_DeInit(); // Reseta todas as configurações do clock para os valores padrão de fábrica.
3860  02df cd0000        	call	_CLK_DeInit
3862                     ; 298 	CLK_HSECmd(DISABLE); // Desabilita o oscilador externo de alta velocidade (HSE), se houver.
3864  02e2 4f            	clr	a
3865  02e3 cd0000        	call	_CLK_HSECmd
3867                     ; 299 	CLK_LSICmd(DISABLE); // Desabilita o oscilador interno de baixa velocidade (LSI), usado para RTC/AWU.
3869  02e6 4f            	clr	a
3870  02e7 cd0000        	call	_CLK_LSICmd
3872                     ; 300 	CLK_HSICmd(ENABLE);  // Habilita o oscilador interno de alta velocidade (HSI).
3874  02ea a601          	ld	a,#1
3875  02ec cd0000        	call	_CLK_HSICmd
3878  02ef               L3722:
3879                     ; 303 	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3881  02ef ae0102        	ldw	x,#258
3882  02f2 cd0000        	call	_CLK_GetFlagStatus
3884  02f5 4d            	tnz	a
3885  02f6 27f7          	jreq	L3722
3886                     ; 305 	CLK_ClockSwitchCmd(ENABLE);              // Permite a troca da fonte de clock.
3888  02f8 a601          	ld	a,#1
3889  02fa cd0000        	call	_CLK_ClockSwitchCmd
3891                     ; 306 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // Define o prescaler do HSI para DIV1 (16MHz / 1 = 16MHz).
3893  02fd 4f            	clr	a
3894  02fe cd0000        	call	_CLK_HSIPrescalerConfig
3896                     ; 307 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // Define o prescaler da CPU para DIV1 (CPU roda na velocidade do clock do sistema).
3898  0301 a680          	ld	a,#128
3899  0303 cd0000        	call	_CLK_SYSCLKConfig
3901                     ; 309 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3903  0306 4b01          	push	#1
3904  0308 4b00          	push	#0
3905  030a ae01e1        	ldw	x,#481
3906  030d cd0000        	call	_CLK_ClockSwitchConfig
3908  0310 85            	popw	x
3909                     ; 312 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3911  0311 5f            	clrw	x
3912  0312 cd0000        	call	_CLK_PeripheralClockConfig
3914                     ; 313 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3916  0315 ae0100        	ldw	x,#256
3917  0318 cd0000        	call	_CLK_PeripheralClockConfig
3919                     ; 314 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
3921  031b ae1300        	ldw	x,#4864
3922  031e cd0000        	call	_CLK_PeripheralClockConfig
3924                     ; 315 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3926  0321 ae1200        	ldw	x,#4608
3927  0324 cd0000        	call	_CLK_PeripheralClockConfig
3929                     ; 316 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3931  0327 ae0300        	ldw	x,#768
3932  032a cd0000        	call	_CLK_PeripheralClockConfig
3934                     ; 317 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3936  032d ae0700        	ldw	x,#1792
3937  0330 cd0000        	call	_CLK_PeripheralClockConfig
3939                     ; 318 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE); // Habilita o clock para o Timer 4, pois ele será usado.
3941  0333 ae0401        	ldw	x,#1025
3942  0336 cd0000        	call	_CLK_PeripheralClockConfig
3944                     ; 319 }
3947  0339 81            	ret
3974                     ; 332 void InitTIM4(void)
3974                     ; 333 {
3975                     	switch	.text
3976  033a               _InitTIM4:
3980                     ; 335 	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
3982  033a ae0701        	ldw	x,#1793
3983  033d cd0000        	call	_TIM4_PrescalerConfig
3985                     ; 338 	TIM4_SetAutoreload(125);
3987  0340 a67d          	ld	a,#125
3988  0342 cd0000        	call	_TIM4_SetAutoreload
3990                     ; 341 	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
3992  0345 ae0100        	ldw	x,#256
3993  0348 cd0000        	call	_TIM4_ITConfig
3995                     ; 343 	TIM4_Cmd(ENABLE);
3997  034b a601          	ld	a,#1
3998  034d cd0000        	call	_TIM4_Cmd
4000                     ; 344 }
4003  0350 81            	ret
4040                     ; 350 void Delay_ms_Timer(uint16_t ms)
4040                     ; 351 {
4041                     	switch	.text
4042  0351               _Delay_ms_Timer:
4044  0351 89            	pushw	x
4045       00000000      OFST:	set	0
4048  0352 2011          	jra	L7232
4049  0354               L5232:
4050                     ; 355 		TIM4_SetCounter(0);       // Zera o contador do Timer 4.
4052  0354 4f            	clr	a
4053  0355 cd0000        	call	_TIM4_SetCounter
4055                     ; 356 		TIM4_ClearFlag(TIM4_FLAG_UPDATE); // Limpa o flag de atualização (transbordamento) do Timer 4.
4057  0358 a601          	ld	a,#1
4058  035a cd0000        	call	_TIM4_ClearFlag
4061  035d               L5332:
4062                     ; 359 		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
4064  035d a601          	ld	a,#1
4065  035f cd0000        	call	_TIM4_GetFlagStatus
4067  0362 4d            	tnz	a
4068  0363 27f8          	jreq	L5332
4069  0365               L7232:
4070                     ; 353 	while(ms--)
4072  0365 1e01          	ldw	x,(OFST+1,sp)
4073  0367 1d0001        	subw	x,#1
4074  036a 1f01          	ldw	(OFST+1,sp),x
4075  036c 1c0001        	addw	x,#1
4076  036f a30000        	cpw	x,#0
4077  0372 26e0          	jrne	L5232
4078                     ; 361 }
4081  0374 85            	popw	x
4082  0375 81            	ret
4095                     	xdef	_main
4096                     	xdef	_LED
4097                     	xdef	_BUZZER
4098                     	xdef	_ReadButton
4099                     	xdef	_Contagem_24s
4100                     	xdef	_Contagem_14s
4101                     	xdef	_pulseLatch
4102                     	xdef	_writeBCD
4103                     	xdef	_Delay_ms_Timer
4104                     	xdef	_InitTIM4
4105                     	xdef	_InitGPIO
4106                     	xdef	_InitCLOCK
4107                     	xref	_TIM4_ClearFlag
4108                     	xref	_TIM4_GetFlagStatus
4109                     	xref	_TIM4_SetAutoreload
4110                     	xref	_TIM4_SetCounter
4111                     	xref	_TIM4_PrescalerConfig
4112                     	xref	_TIM4_ITConfig
4113                     	xref	_TIM4_Cmd
4114                     	xref	_GPIO_ReadInputPin
4115                     	xref	_GPIO_WriteLow
4116                     	xref	_GPIO_WriteHigh
4117                     	xref	_GPIO_Init
4118                     	xref	_CLK_GetFlagStatus
4119                     	xref	_CLK_SYSCLKConfig
4120                     	xref	_CLK_HSIPrescalerConfig
4121                     	xref	_CLK_ClockSwitchConfig
4122                     	xref	_CLK_PeripheralClockConfig
4123                     	xref	_CLK_ClockSwitchCmd
4124                     	xref	_CLK_LSICmd
4125                     	xref	_CLK_HSICmd
4126                     	xref	_CLK_HSECmd
4127                     	xref	_CLK_DeInit
4128                     	xref.b	c_x
4147                     	xref	c_sdivx
4148                     	xref	c_smodx
4149                     	end
