   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2653                     ; 41 main()
2653                     ; 42 {
2655                     	switch	.text
2656  0000               _main:
2658  0000 5203          	subw	sp,#3
2659       00000003      OFST:	set	3
2662                     ; 43 	uint8_t last_button_state = 1;			// Guarda o último estado lido do botão (1 = solto)
2664  0002 a601          	ld	a,#1
2665  0004 6b01          	ld	(OFST-2,sp),a
2667                     ; 46 	uint8_t alternate_led_state = 1;		//  Controla o estado dos LEDs 01 e 02 (0=LED_01 aceso, 1=LED_02 aceso)
2669  0006 a601          	ld	a,#1
2670  0008 6b03          	ld	(OFST+0,sp),a
2672                     ; 48 	InitCLOCK();
2674  000a cd0175        	call	_InitCLOCK
2676                     ; 49 	InitGPIO();
2678  000d cd0093        	call	_InitGPIO
2680                     ; 52 	GPIO_WriteHigh(LED_01_PORT, LED_01_PIN);
2682  0010 4b20          	push	#32
2683  0012 ae5014        	ldw	x,#20500
2684  0015 cd0000        	call	_GPIO_WriteHigh
2686  0018 84            	pop	a
2687                     ; 53 	GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
2689  0019 4b04          	push	#4
2690  001b ae500a        	ldw	x,#20490
2691  001e cd0000        	call	_GPIO_WriteLow
2693  0021 84            	pop	a
2694                     ; 54 	GPIO_WriteLow(LED_03_PORT, LED_03_PIN);
2696  0022 4b08          	push	#8
2697  0024 ae500a        	ldw	x,#20490
2698  0027 cd0000        	call	_GPIO_WriteLow
2700  002a 84            	pop	a
2701                     ; 55 	GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
2703  002b 4b10          	push	#16
2704  002d ae500a        	ldw	x,#20490
2705  0030 cd0000        	call	_GPIO_WriteLow
2707  0033 84            	pop	a
2708  0034               L7071:
2709                     ; 59 		current_button = ReadButton();			// CB recebe o valor do estado do Botão atual
2711  0034 cd00f6        	call	_ReadButton
2713  0037 6b02          	ld	(OFST-1,sp),a
2715                     ; 62 		if (last_button_state == 1 && current_button == 0)
2717  0039 7b01          	ld	a,(OFST-2,sp)
2718  003b a101          	cp	a,#1
2719  003d 2639          	jrne	L3171
2721  003f 0d02          	tnz	(OFST-1,sp)
2722  0041 2635          	jrne	L3171
2723                     ; 65 			GPIO_WriteLow(LED_01_PORT, LED_01_PIN);
2725  0043 4b20          	push	#32
2726  0045 ae5014        	ldw	x,#20500
2727  0048 cd0000        	call	_GPIO_WriteLow
2729  004b 84            	pop	a
2730                     ; 66 			GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
2732  004c 4b04          	push	#4
2733  004e ae500a        	ldw	x,#20490
2734  0051 cd0000        	call	_GPIO_WriteLow
2736  0054 84            	pop	a
2737                     ; 68 			LedBuzzer (3,1000);									// Faz o acioonamento do buzzer e o led 3x
2739  0055 ae03e8        	ldw	x,#1000
2740  0058 89            	pushw	x
2741  0059 a603          	ld	a,#3
2742  005b cd0109        	call	_LedBuzzer
2744  005e 85            	popw	x
2745                     ; 70 			GPIO_WriteLow(LED_03_PORT, LED_03_PIN);
2747  005f 4b08          	push	#8
2748  0061 ae500a        	ldw	x,#20490
2749  0064 cd0000        	call	_GPIO_WriteLow
2751  0067 84            	pop	a
2752                     ; 71 			GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
2754  0068 4b10          	push	#16
2755  006a ae500a        	ldw	x,#20490
2756  006d cd0000        	call	_GPIO_WriteLow
2758  0070 84            	pop	a
2759                     ; 73 			Delay_ms(50); // Debounce para o pressionamento do botão
2761  0071 ae0032        	ldw	x,#50
2762  0074 ad55          	call	_Delay_ms
2765  0076 2015          	jra	L5171
2766  0078               L3171:
2767                     ; 78 			Led_State_01_02(alternate_led_state); 
2769  0078 7b03          	ld	a,(OFST+0,sp)
2770  007a cd0145        	call	_Led_State_01_02
2772                     ; 79 			alternate_led_state = !alternate_led_state; // Inverte o estado para a próxima alternância
2774  007d 0d03          	tnz	(OFST+0,sp)
2775  007f 2604          	jrne	L6
2776  0081 a601          	ld	a,#1
2777  0083 2001          	jra	L01
2778  0085               L6:
2779  0085 4f            	clr	a
2780  0086               L01:
2781  0086 6b03          	ld	(OFST+0,sp),a
2783                     ; 80 			Delay_ms(10);
2785  0088 ae000a        	ldw	x,#10
2786  008b ad3e          	call	_Delay_ms
2788  008d               L5171:
2789                     ; 84 		last_button_state = current_button;
2791  008d 7b02          	ld	a,(OFST-1,sp)
2792  008f 6b01          	ld	(OFST-2,sp),a
2795  0091 20a1          	jra	L7071
2819                     ; 90 void InitGPIO(void)
2819                     ; 91 {
2820                     	switch	.text
2821  0093               _InitGPIO:
2825                     ; 93 	GPIO_Init(LED_01_PORT, LED_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2827  0093 4be0          	push	#224
2828  0095 4b20          	push	#32
2829  0097 ae5014        	ldw	x,#20500
2830  009a cd0000        	call	_GPIO_Init
2832  009d 85            	popw	x
2833                     ; 94 	GPIO_Init(LED_02_PORT, LED_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2835  009e 4be0          	push	#224
2836  00a0 4b04          	push	#4
2837  00a2 ae500a        	ldw	x,#20490
2838  00a5 cd0000        	call	_GPIO_Init
2840  00a8 85            	popw	x
2841                     ; 95 	GPIO_Init(LED_03_PORT, LED_03_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2843  00a9 4be0          	push	#224
2844  00ab 4b08          	push	#8
2845  00ad ae500a        	ldw	x,#20490
2846  00b0 cd0000        	call	_GPIO_Init
2848  00b3 85            	popw	x
2849                     ; 98 	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
2851  00b4 4b40          	push	#64
2852  00b6 4b02          	push	#2
2853  00b8 ae500a        	ldw	x,#20490
2854  00bb cd0000        	call	_GPIO_Init
2856  00be 85            	popw	x
2857                     ; 101 	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2859  00bf 4be0          	push	#224
2860  00c1 4b10          	push	#16
2861  00c3 ae500a        	ldw	x,#20490
2862  00c6 cd0000        	call	_GPIO_Init
2864  00c9 85            	popw	x
2865                     ; 102 }
2868  00ca 81            	ret
2911                     ; 105 void Delay_ms(uint16_t ms)
2911                     ; 106 {
2912                     	switch	.text
2913  00cb               _Delay_ms:
2915  00cb 89            	pushw	x
2916  00cc 5204          	subw	sp,#4
2917       00000004      OFST:	set	4
2920                     ; 108 	for ( i = 0; i < (16000UL / 1000UL) * ms; i++);
2922  00ce ae0000        	ldw	x,#0
2923  00d1 1f03          	ldw	(OFST-1,sp),x
2924  00d3 ae0000        	ldw	x,#0
2925  00d6 1f01          	ldw	(OFST-3,sp),x
2928  00d8 2009          	jra	L5571
2929  00da               L1571:
2933  00da 96            	ldw	x,sp
2934  00db 1c0001        	addw	x,#OFST-3
2935  00de a601          	ld	a,#1
2936  00e0 cd0000        	call	c_lgadc
2939  00e3               L5571:
2942  00e3 1e05          	ldw	x,(OFST+1,sp)
2943  00e5 a610          	ld	a,#16
2944  00e7 cd0000        	call	c_cmulx
2946  00ea 96            	ldw	x,sp
2947  00eb 1c0001        	addw	x,#OFST-3
2948  00ee cd0000        	call	c_lcmp
2950  00f1 22e7          	jrugt	L1571
2951                     ; 109 }
2954  00f3 5b06          	addw	sp,#6
2955  00f5 81            	ret
2979                     ; 112 uint8_t ReadButton (void)
2979                     ; 113 {
2980                     	switch	.text
2981  00f6               _ReadButton:
2985                     ; 116 	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
2987  00f6 4b02          	push	#2
2988  00f8 ae500a        	ldw	x,#20490
2989  00fb cd0000        	call	_GPIO_ReadInputPin
2991  00fe 5b01          	addw	sp,#1
2992  0100 4d            	tnz	a
2993  0101 2604          	jrne	L02
2994  0103 a601          	ld	a,#1
2995  0105 2001          	jra	L22
2996  0107               L02:
2997  0107 4f            	clr	a
2998  0108               L22:
3001  0108 81            	ret
3056                     ; 120 void LedBuzzer(uint8_t num_acionamento, uint16_t temp_acionamento)
3056                     ; 121 {
3057                     	switch	.text
3058  0109               _LedBuzzer:
3060  0109 88            	push	a
3061  010a 88            	push	a
3062       00000001      OFST:	set	1
3065                     ; 123 	for (i = 0; i < num_acionamento; i++)
3067  010b 0f01          	clr	(OFST+0,sp)
3070  010d 202e          	jra	L3202
3071  010f               L7102:
3072                     ; 125 		GPIO_WriteHigh(LED_03_PORT, LED_03_PIN);
3074  010f 4b08          	push	#8
3075  0111 ae500a        	ldw	x,#20490
3076  0114 cd0000        	call	_GPIO_WriteHigh
3078  0117 84            	pop	a
3079                     ; 126 		GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN);
3081  0118 4b10          	push	#16
3082  011a ae500a        	ldw	x,#20490
3083  011d cd0000        	call	_GPIO_WriteHigh
3085  0120 84            	pop	a
3086                     ; 127 		Delay_ms(temp_acionamento);
3088  0121 1e05          	ldw	x,(OFST+4,sp)
3089  0123 ada6          	call	_Delay_ms
3091                     ; 128 		GPIO_WriteLow(LED_03_PORT, LED_03_PIN);
3093  0125 4b08          	push	#8
3094  0127 ae500a        	ldw	x,#20490
3095  012a cd0000        	call	_GPIO_WriteLow
3097  012d 84            	pop	a
3098                     ; 129 		GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);
3100  012e 4b10          	push	#16
3101  0130 ae500a        	ldw	x,#20490
3102  0133 cd0000        	call	_GPIO_WriteLow
3104  0136 84            	pop	a
3105                     ; 130 		Delay_ms(temp_acionamento);
3107  0137 1e05          	ldw	x,(OFST+4,sp)
3108  0139 ad90          	call	_Delay_ms
3110                     ; 123 	for (i = 0; i < num_acionamento; i++)
3112  013b 0c01          	inc	(OFST+0,sp)
3114  013d               L3202:
3117  013d 7b01          	ld	a,(OFST+0,sp)
3118  013f 1102          	cp	a,(OFST+1,sp)
3119  0141 25cc          	jrult	L7102
3120                     ; 132 }
3123  0143 85            	popw	x
3124  0144 81            	ret
3161                     ; 133 void Led_State_01_02(uint8_t current_state) 
3161                     ; 134 {
3162                     	switch	.text
3163  0145               _Led_State_01_02:
3167                     ; 135 	if (current_state == 0)											// Se o estado é 0 (aciona LED_01)
3169  0145 4d            	tnz	a
3170  0146 2614          	jrne	L5402
3171                     ; 137 		GPIO_WriteHigh(LED_01_PORT, LED_01_PIN);
3173  0148 4b20          	push	#32
3174  014a ae5014        	ldw	x,#20500
3175  014d cd0000        	call	_GPIO_WriteHigh
3177  0150 84            	pop	a
3178                     ; 138 		GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
3180  0151 4b04          	push	#4
3181  0153 ae500a        	ldw	x,#20490
3182  0156 cd0000        	call	_GPIO_WriteLow
3184  0159 84            	pop	a
3186  015a 2012          	jra	L7402
3187  015c               L5402:
3188                     ; 142 		GPIO_WriteLow(LED_01_PORT, LED_01_PIN);
3190  015c 4b20          	push	#32
3191  015e ae5014        	ldw	x,#20500
3192  0161 cd0000        	call	_GPIO_WriteLow
3194  0164 84            	pop	a
3195                     ; 143 		GPIO_WriteHigh(LED_02_PORT, LED_02_PIN);
3197  0165 4b04          	push	#4
3198  0167 ae500a        	ldw	x,#20490
3199  016a cd0000        	call	_GPIO_WriteHigh
3201  016d 84            	pop	a
3202  016e               L7402:
3203                     ; 145 	 Delay_ms(2000);
3205  016e ae07d0        	ldw	x,#2000
3206  0171 cd00cb        	call	_Delay_ms
3208                     ; 146 }
3211  0174 81            	ret
3244                     ; 149 void InitCLOCK(void)
3244                     ; 150 {
3245                     	switch	.text
3246  0175               _InitCLOCK:
3250                     ; 151     CLK_DeInit(); // Reseta a configuração de clock para o padrão
3252  0175 cd0000        	call	_CLK_DeInit
3254                     ; 153     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
3256  0178 4f            	clr	a
3257  0179 cd0000        	call	_CLK_HSECmd
3259                     ; 154     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
3261  017c 4f            	clr	a
3262  017d cd0000        	call	_CLK_LSICmd
3264                     ; 155     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3266  0180 a601          	ld	a,#1
3267  0182 cd0000        	call	_CLK_HSICmd
3270  0185               L3602:
3271                     ; 158     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3273  0185 ae0102        	ldw	x,#258
3274  0188 cd0000        	call	_CLK_GetFlagStatus
3276  018b 4d            	tnz	a
3277  018c 27f7          	jreq	L3602
3278                     ; 160     CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
3280  018e a601          	ld	a,#1
3281  0190 cd0000        	call	_CLK_ClockSwitchCmd
3283                     ; 161     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
3285  0193 4f            	clr	a
3286  0194 cd0000        	call	_CLK_HSIPrescalerConfig
3288                     ; 162     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)
3290  0197 a680          	ld	a,#128
3291  0199 cd0000        	call	_CLK_SYSCLKConfig
3293                     ; 165     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3295  019c 4b01          	push	#1
3296  019e 4b00          	push	#0
3297  01a0 ae01e1        	ldw	x,#481
3298  01a3 cd0000        	call	_CLK_ClockSwitchConfig
3300  01a6 85            	popw	x
3301                     ; 168     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3303  01a7 5f            	clrw	x
3304  01a8 cd0000        	call	_CLK_PeripheralClockConfig
3306                     ; 169     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3308  01ab ae0100        	ldw	x,#256
3309  01ae cd0000        	call	_CLK_PeripheralClockConfig
3311                     ; 170     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
3313  01b1 ae1300        	ldw	x,#4864
3314  01b4 cd0000        	call	_CLK_PeripheralClockConfig
3316                     ; 171     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3318  01b7 ae1200        	ldw	x,#4608
3319  01ba cd0000        	call	_CLK_PeripheralClockConfig
3321                     ; 172     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3323  01bd ae0300        	ldw	x,#768
3324  01c0 cd0000        	call	_CLK_PeripheralClockConfig
3326                     ; 173     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3328  01c3 ae0700        	ldw	x,#1792
3329  01c6 cd0000        	call	_CLK_PeripheralClockConfig
3331                     ; 174     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
3333  01c9 ae0500        	ldw	x,#1280
3334  01cc cd0000        	call	_CLK_PeripheralClockConfig
3336                     ; 175 }
3339  01cf 81            	ret
3352                     	xdef	_main
3353                     	xdef	_Led_State_01_02
3354                     	xdef	_LedBuzzer
3355                     	xdef	_ReadButton
3356                     	xdef	_Delay_ms
3357                     	xdef	_InitCLOCK
3358                     	xdef	_InitGPIO
3359                     	xref	_GPIO_ReadInputPin
3360                     	xref	_GPIO_WriteLow
3361                     	xref	_GPIO_WriteHigh
3362                     	xref	_GPIO_Init
3363                     	xref	_CLK_GetFlagStatus
3364                     	xref	_CLK_SYSCLKConfig
3365                     	xref	_CLK_HSIPrescalerConfig
3366                     	xref	_CLK_ClockSwitchConfig
3367                     	xref	_CLK_PeripheralClockConfig
3368                     	xref	_CLK_ClockSwitchCmd
3369                     	xref	_CLK_LSICmd
3370                     	xref	_CLK_HSICmd
3371                     	xref	_CLK_HSECmd
3372                     	xref	_CLK_DeInit
3391                     	xref	c_lcmp
3392                     	xref	c_cmulx
3393                     	xref	c_lgadc
3394                     	end
