   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2619                     ; 39 void main(void)
2619                     ; 40 {
2621                     	switch	.text
2622  0000               _main:
2626                     ; 41 	InitCLOCK();
2628  0000 cd0116        	call	_InitCLOCK
2630                     ; 42 	InitTIM4();
2632  0003 cd0171        	call	_InitTIM4
2634                     ; 43 	InitGPIO();
2636  0006 cd00d3        	call	_InitGPIO
2638  0009               L1761:
2639                     ; 47 		CONTAGEM();
2641  0009 ad02          	call	_CONTAGEM
2644  000b 20fc          	jra	L1761
2699                     ; 52 void CONTAGEM(void)
2699                     ; 53 {
2700                     	switch	.text
2701  000d               _CONTAGEM:
2703  000d 5203          	subw	sp,#3
2704       00000003      OFST:	set	3
2707                     ; 58 	for(i = 0; i <= 24; i++)
2709  000f 0f03          	clr	(OFST+0,sp)
2711  0011               L3271:
2712                     ; 60 		unidades = i % 10;
2714  0011 7b03          	ld	a,(OFST+0,sp)
2715  0013 5f            	clrw	x
2716  0014 97            	ld	xl,a
2717  0015 a60a          	ld	a,#10
2718  0017 62            	div	x,a
2719  0018 5f            	clrw	x
2720  0019 97            	ld	xl,a
2721  001a 9f            	ld	a,xl
2722  001b 6b01          	ld	(OFST-2,sp),a
2724                     ; 61 		dezenas = i / 10;
2726  001d 7b03          	ld	a,(OFST+0,sp)
2727  001f 5f            	clrw	x
2728  0020 97            	ld	xl,a
2729  0021 a60a          	ld	a,#10
2730  0023 62            	div	x,a
2731  0024 9f            	ld	a,xl
2732  0025 6b02          	ld	(OFST-1,sp),a
2734                     ; 64 		writeBCD(unidades);
2736  0027 7b01          	ld	a,(OFST-2,sp)
2737  0029 ad26          	call	_writeBCD
2739                     ; 65 		pulseLatch(LATCH_01_PORT, LATCH_01_PIN);
2741  002b 4b04          	push	#4
2742  002d ae500a        	ldw	x,#20490
2743  0030 cd00ba        	call	_pulseLatch
2745  0033 84            	pop	a
2746                     ; 68 		writeBCD(dezenas);
2748  0034 7b02          	ld	a,(OFST-1,sp)
2749  0036 ad19          	call	_writeBCD
2751                     ; 69 		pulseLatch(LATCH_02_PORT, LATCH_02_PIN);
2753  0038 4b02          	push	#2
2754  003a ae500a        	ldw	x,#20490
2755  003d ad7b          	call	_pulseLatch
2757  003f 84            	pop	a
2758                     ; 72 		Delay_ms_Timer(1000);
2760  0040 ae03e8        	ldw	x,#1000
2761  0043 cd0188        	call	_Delay_ms_Timer
2763                     ; 58 	for(i = 0; i <= 24; i++)
2765  0046 0c03          	inc	(OFST+0,sp)
2769  0048 7b03          	ld	a,(OFST+0,sp)
2770  004a a119          	cp	a,#25
2771  004c 25c3          	jrult	L3271
2772                     ; 74 }
2775  004e 5b03          	addw	sp,#3
2776  0050 81            	ret
2812                     ; 77 void writeBCD(uint8_t valor)
2812                     ; 78 {
2813                     	switch	.text
2814  0051               _writeBCD:
2816  0051 88            	push	a
2817       00000000      OFST:	set	0
2820                     ; 80 	if(valor & 0x01)
2822  0052 a501          	bcp	a,#1
2823  0054 270b          	jreq	L7471
2824                     ; 81 		GPIO_WriteHigh(LD_A_PORT, LD_A_PIN);
2826  0056 4b01          	push	#1
2827  0058 ae5005        	ldw	x,#20485
2828  005b cd0000        	call	_GPIO_WriteHigh
2830  005e 84            	pop	a
2832  005f 2009          	jra	L1571
2833  0061               L7471:
2834                     ; 83 		GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
2836  0061 4b01          	push	#1
2837  0063 ae5005        	ldw	x,#20485
2838  0066 cd0000        	call	_GPIO_WriteLow
2840  0069 84            	pop	a
2841  006a               L1571:
2842                     ; 86 	if(valor & 0x02)
2844  006a 7b01          	ld	a,(OFST+1,sp)
2845  006c a502          	bcp	a,#2
2846  006e 270b          	jreq	L3571
2847                     ; 87 		GPIO_WriteHigh(LD_B_PORT, LD_B_PIN);
2849  0070 4b02          	push	#2
2850  0072 ae5005        	ldw	x,#20485
2851  0075 cd0000        	call	_GPIO_WriteHigh
2853  0078 84            	pop	a
2855  0079 2009          	jra	L5571
2856  007b               L3571:
2857                     ; 89 		GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
2859  007b 4b02          	push	#2
2860  007d ae5005        	ldw	x,#20485
2861  0080 cd0000        	call	_GPIO_WriteLow
2863  0083 84            	pop	a
2864  0084               L5571:
2865                     ; 92 	if(valor & 0x04)
2867  0084 7b01          	ld	a,(OFST+1,sp)
2868  0086 a504          	bcp	a,#4
2869  0088 270b          	jreq	L7571
2870                     ; 93 		GPIO_WriteHigh(LD_C_PORT, LD_C_PIN);
2872  008a 4b04          	push	#4
2873  008c ae5005        	ldw	x,#20485
2874  008f cd0000        	call	_GPIO_WriteHigh
2876  0092 84            	pop	a
2878  0093 2009          	jra	L1671
2879  0095               L7571:
2880                     ; 95 		GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
2882  0095 4b04          	push	#4
2883  0097 ae5005        	ldw	x,#20485
2884  009a cd0000        	call	_GPIO_WriteLow
2886  009d 84            	pop	a
2887  009e               L1671:
2888                     ; 98 	if(valor & 0x08)
2890  009e 7b01          	ld	a,(OFST+1,sp)
2891  00a0 a508          	bcp	a,#8
2892  00a2 270b          	jreq	L3671
2893                     ; 99 		GPIO_WriteHigh(LD_D_PORT, LD_D_PIN);
2895  00a4 4b08          	push	#8
2896  00a6 ae5005        	ldw	x,#20485
2897  00a9 cd0000        	call	_GPIO_WriteHigh
2899  00ac 84            	pop	a
2901  00ad 2009          	jra	L5671
2902  00af               L3671:
2903                     ; 101 		GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
2905  00af 4b08          	push	#8
2906  00b1 ae5005        	ldw	x,#20485
2907  00b4 cd0000        	call	_GPIO_WriteLow
2909  00b7 84            	pop	a
2910  00b8               L5671:
2911                     ; 102 }
2914  00b8 84            	pop	a
2915  00b9 81            	ret
3016                     ; 105 void pulseLatch(GPIO_TypeDef* PORT, uint8_t PIN)
3016                     ; 106 {
3017                     	switch	.text
3018  00ba               _pulseLatch:
3020  00ba 89            	pushw	x
3021       00000000      OFST:	set	0
3024                     ; 107 	GPIO_WriteHigh(PORT, PIN);
3026  00bb 7b05          	ld	a,(OFST+5,sp)
3027  00bd 88            	push	a
3028  00be cd0000        	call	_GPIO_WriteHigh
3030  00c1 84            	pop	a
3031                     ; 108 	Delay_ms_Timer(1);
3033  00c2 ae0001        	ldw	x,#1
3034  00c5 cd0188        	call	_Delay_ms_Timer
3036                     ; 109 	GPIO_WriteLow(PORT, PIN);
3038  00c8 7b05          	ld	a,(OFST+5,sp)
3039  00ca 88            	push	a
3040  00cb 1e02          	ldw	x,(OFST+2,sp)
3041  00cd cd0000        	call	_GPIO_WriteLow
3043  00d0 84            	pop	a
3044                     ; 110 }
3047  00d1 85            	popw	x
3048  00d2 81            	ret
3072                     ; 113 void InitGPIO(void)
3072                     ; 114 {
3073                     	switch	.text
3074  00d3               _InitGPIO:
3078                     ; 115 	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3080  00d3 4be0          	push	#224
3081  00d5 4b01          	push	#1
3082  00d7 ae5005        	ldw	x,#20485
3083  00da cd0000        	call	_GPIO_Init
3085  00dd 85            	popw	x
3086                     ; 116 	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3088  00de 4be0          	push	#224
3089  00e0 4b02          	push	#2
3090  00e2 ae5005        	ldw	x,#20485
3091  00e5 cd0000        	call	_GPIO_Init
3093  00e8 85            	popw	x
3094                     ; 117 	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3096  00e9 4be0          	push	#224
3097  00eb 4b04          	push	#4
3098  00ed ae5005        	ldw	x,#20485
3099  00f0 cd0000        	call	_GPIO_Init
3101  00f3 85            	popw	x
3102                     ; 118 	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3104  00f4 4be0          	push	#224
3105  00f6 4b08          	push	#8
3106  00f8 ae5005        	ldw	x,#20485
3107  00fb cd0000        	call	_GPIO_Init
3109  00fe 85            	popw	x
3110                     ; 120 	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3112  00ff 4be0          	push	#224
3113  0101 4b04          	push	#4
3114  0103 ae500a        	ldw	x,#20490
3115  0106 cd0000        	call	_GPIO_Init
3117  0109 85            	popw	x
3118                     ; 121 	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
3120  010a 4be0          	push	#224
3121  010c 4b02          	push	#2
3122  010e ae500a        	ldw	x,#20490
3123  0111 cd0000        	call	_GPIO_Init
3125  0114 85            	popw	x
3126                     ; 122 }
3129  0115 81            	ret
3162                     ; 125 void InitCLOCK(void)
3162                     ; 126 {
3163                     	switch	.text
3164  0116               _InitCLOCK:
3168                     ; 127 	CLK_DeInit();
3170  0116 cd0000        	call	_CLK_DeInit
3172                     ; 128 	CLK_HSECmd(DISABLE);
3174  0119 4f            	clr	a
3175  011a cd0000        	call	_CLK_HSECmd
3177                     ; 129 	CLK_LSICmd(DISABLE);
3179  011d 4f            	clr	a
3180  011e cd0000        	call	_CLK_LSICmd
3182                     ; 130 	CLK_HSICmd(ENABLE);
3184  0121 a601          	ld	a,#1
3185  0123 cd0000        	call	_CLK_HSICmd
3188  0126               L5602:
3189                     ; 132 	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3191  0126 ae0102        	ldw	x,#258
3192  0129 cd0000        	call	_CLK_GetFlagStatus
3194  012c 4d            	tnz	a
3195  012d 27f7          	jreq	L5602
3196                     ; 134 	CLK_ClockSwitchCmd(ENABLE);
3198  012f a601          	ld	a,#1
3199  0131 cd0000        	call	_CLK_ClockSwitchCmd
3201                     ; 135 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
3203  0134 4f            	clr	a
3204  0135 cd0000        	call	_CLK_HSIPrescalerConfig
3206                     ; 136 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
3208  0138 a680          	ld	a,#128
3209  013a cd0000        	call	_CLK_SYSCLKConfig
3211                     ; 137 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3213  013d 4b01          	push	#1
3214  013f 4b00          	push	#0
3215  0141 ae01e1        	ldw	x,#481
3216  0144 cd0000        	call	_CLK_ClockSwitchConfig
3218  0147 85            	popw	x
3219                     ; 139 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3221  0148 5f            	clrw	x
3222  0149 cd0000        	call	_CLK_PeripheralClockConfig
3224                     ; 140 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3226  014c ae0100        	ldw	x,#256
3227  014f cd0000        	call	_CLK_PeripheralClockConfig
3229                     ; 141 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
3231  0152 ae1300        	ldw	x,#4864
3232  0155 cd0000        	call	_CLK_PeripheralClockConfig
3234                     ; 142 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3236  0158 ae1200        	ldw	x,#4608
3237  015b cd0000        	call	_CLK_PeripheralClockConfig
3239                     ; 143 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3241  015e ae0300        	ldw	x,#768
3242  0161 cd0000        	call	_CLK_PeripheralClockConfig
3244                     ; 144 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3246  0164 ae0700        	ldw	x,#1792
3247  0167 cd0000        	call	_CLK_PeripheralClockConfig
3249                     ; 145 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
3251  016a ae0401        	ldw	x,#1025
3252  016d cd0000        	call	_CLK_PeripheralClockConfig
3254                     ; 146 }
3257  0170 81            	ret
3284                     ; 149 void InitTIM4(void)
3284                     ; 150 {
3285                     	switch	.text
3286  0171               _InitTIM4:
3290                     ; 151 	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
3292  0171 ae0701        	ldw	x,#1793
3293  0174 cd0000        	call	_TIM4_PrescalerConfig
3295                     ; 152 	TIM4_SetAutoreload(125);
3297  0177 a67d          	ld	a,#125
3298  0179 cd0000        	call	_TIM4_SetAutoreload
3300                     ; 153 	TIM4_ITConfig(TIM4_IT_UPDATE, DISABLE);
3302  017c ae0100        	ldw	x,#256
3303  017f cd0000        	call	_TIM4_ITConfig
3305                     ; 154 	TIM4_Cmd(ENABLE);
3307  0182 a601          	ld	a,#1
3308  0184 cd0000        	call	_TIM4_Cmd
3310                     ; 155 }
3313  0187 81            	ret
3350                     ; 158 void Delay_ms_Timer(uint16_t ms)
3350                     ; 159 {
3351                     	switch	.text
3352  0188               _Delay_ms_Timer:
3354  0188 89            	pushw	x
3355       00000000      OFST:	set	0
3358  0189 2011          	jra	L1212
3359  018b               L7112:
3360                     ; 162 		TIM4_SetCounter(0);
3362  018b 4f            	clr	a
3363  018c cd0000        	call	_TIM4_SetCounter
3365                     ; 163 		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
3367  018f a601          	ld	a,#1
3368  0191 cd0000        	call	_TIM4_ClearFlag
3371  0194               L7212:
3372                     ; 164 		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE) == RESET);
3374  0194 a601          	ld	a,#1
3375  0196 cd0000        	call	_TIM4_GetFlagStatus
3377  0199 4d            	tnz	a
3378  019a 27f8          	jreq	L7212
3379  019c               L1212:
3380                     ; 160 	while(ms--)
3382  019c 1e01          	ldw	x,(OFST+1,sp)
3383  019e 1d0001        	subw	x,#1
3384  01a1 1f01          	ldw	(OFST+1,sp),x
3385  01a3 1c0001        	addw	x,#1
3386  01a6 a30000        	cpw	x,#0
3387  01a9 26e0          	jrne	L7112
3388                     ; 166 }
3391  01ab 85            	popw	x
3392  01ac 81            	ret
3405                     	xdef	_main
3406                     	xdef	_CONTAGEM
3407                     	xdef	_pulseLatch
3408                     	xdef	_writeBCD
3409                     	xdef	_Delay_ms_Timer
3410                     	xdef	_InitTIM4
3411                     	xdef	_InitGPIO
3412                     	xdef	_InitCLOCK
3413                     	xref	_TIM4_ClearFlag
3414                     	xref	_TIM4_GetFlagStatus
3415                     	xref	_TIM4_SetAutoreload
3416                     	xref	_TIM4_SetCounter
3417                     	xref	_TIM4_PrescalerConfig
3418                     	xref	_TIM4_ITConfig
3419                     	xref	_TIM4_Cmd
3420                     	xref	_GPIO_WriteLow
3421                     	xref	_GPIO_WriteHigh
3422                     	xref	_GPIO_Init
3423                     	xref	_CLK_GetFlagStatus
3424                     	xref	_CLK_SYSCLKConfig
3425                     	xref	_CLK_HSIPrescalerConfig
3426                     	xref	_CLK_ClockSwitchConfig
3427                     	xref	_CLK_PeripheralClockConfig
3428                     	xref	_CLK_ClockSwitchCmd
3429                     	xref	_CLK_LSICmd
3430                     	xref	_CLK_HSICmd
3431                     	xref	_CLK_HSECmd
3432                     	xref	_CLK_DeInit
3451                     	end
