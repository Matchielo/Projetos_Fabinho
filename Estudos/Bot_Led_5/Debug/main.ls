   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2651                     ; 29 main()
2651                     ; 30 {
2653                     	switch	.text
2654  0000               _main:
2656  0000 5203          	subw	sp,#3
2657       00000003      OFST:	set	3
2660                     ; 31 	uint8_t estado_led = 0;
2662  0002 0f03          	clr	(OFST+0,sp)
2664                     ; 34 	uint8_t last_button_state = 1;
2666  0004 a601          	ld	a,#1
2667  0006 6b01          	ld	(OFST-2,sp),a
2669                     ; 36 	InitCLOCK();
2671  0008 cd0100        	call	_InitCLOCK
2673                     ; 37 	InitGPIO();
2675  000b ad6f          	call	_InitGPIO
2677                     ; 39 	GPIO_WriteHigh(LED_01_PORT, LED_01_PIN); // LED_01 ligado no início
2679  000d 4b20          	push	#32
2680  000f ae5014        	ldw	x,#20500
2681  0012 cd0000        	call	_GPIO_WriteHigh
2683  0015 84            	pop	a
2684                     ; 40 	GPIO_WriteLow(LED_02_PORT, LED_02_PIN);  // LED_02 desligado no início
2686  0016 4b04          	push	#4
2687  0018 ae500a        	ldw	x,#20490
2688  001b cd0000        	call	_GPIO_WriteLow
2690  001e 84            	pop	a
2691                     ; 41 	GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);  // Buzzer desligado no início
2693  001f 4b10          	push	#16
2694  0021 ae500a        	ldw	x,#20490
2695  0024 cd0000        	call	_GPIO_WriteLow
2697  0027 84            	pop	a
2698  0028               L7071:
2699                     ; 45 		current_button = ReadButton();
2701  0028 cd00d4        	call	_ReadButton
2703  002b 6b02          	ld	(OFST-1,sp),a
2705                     ; 48 		if (current_button == 0 && last_button_state == 1)
2707  002d 0d02          	tnz	(OFST-1,sp)
2708  002f 2645          	jrne	L3171
2710  0031 7b01          	ld	a,(OFST-2,sp)
2711  0033 a101          	cp	a,#1
2712  0035 263f          	jrne	L3171
2713                     ; 51 			estado_led = !estado_led;
2715  0037 0d03          	tnz	(OFST+0,sp)
2716  0039 2604          	jrne	L6
2717  003b a601          	ld	a,#1
2718  003d 2001          	jra	L01
2719  003f               L6:
2720  003f 4f            	clr	a
2721  0040               L01:
2722  0040 6b03          	ld	(OFST+0,sp),a
2724                     ; 54 			if (estado_led) // Se estado_led é 1 (LED_02 deve ligar, LED_01 apagar)
2726  0042 0d03          	tnz	(OFST+0,sp)
2727  0044 2714          	jreq	L5171
2728                     ; 56 				GPIO_WriteLow(LED_01_PORT, LED_01_PIN);
2730  0046 4b20          	push	#32
2731  0048 ae5014        	ldw	x,#20500
2732  004b cd0000        	call	_GPIO_WriteLow
2734  004e 84            	pop	a
2735                     ; 57 				GPIO_WriteHigh(LED_02_PORT, LED_02_PIN);
2737  004f 4b04          	push	#4
2738  0051 ae500a        	ldw	x,#20490
2739  0054 cd0000        	call	_GPIO_WriteHigh
2741  0057 84            	pop	a
2743  0058 2012          	jra	L7171
2744  005a               L5171:
2745                     ; 61 				GPIO_WriteHigh(LED_01_PORT, LED_01_PIN);
2747  005a 4b20          	push	#32
2748  005c ae5014        	ldw	x,#20500
2749  005f cd0000        	call	_GPIO_WriteHigh
2751  0062 84            	pop	a
2752                     ; 62 				GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
2754  0063 4b04          	push	#4
2755  0065 ae500a        	ldw	x,#20490
2756  0068 cd0000        	call	_GPIO_WriteLow
2758  006b 84            	pop	a
2759  006c               L7171:
2760                     ; 65 			delay_ms(20); // CORRIGIDO: Chamada para 'delay_ms' (minúscula)
2762  006c ae0014        	ldw	x,#20
2763  006f ad38          	call	_delay_ms
2765                     ; 68 			PlayBuzzerTone(5000);
2767  0071 ae1388        	ldw	x,#5000
2768  0074 ad71          	call	_PlayBuzzerTone
2770  0076               L3171:
2771                     ; 71 		last_button_state = current_button;
2773  0076 7b02          	ld	a,(OFST-1,sp)
2774  0078 6b01          	ld	(OFST-2,sp),a
2777  007a 20ac          	jra	L7071
2801                     ; 76 void InitGPIO(void)
2801                     ; 77 {
2802                     	switch	.text
2803  007c               _InitGPIO:
2807                     ; 79 	GPIO_Init(LED_01_PORT, LED_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2809  007c 4be0          	push	#224
2810  007e 4b20          	push	#32
2811  0080 ae5014        	ldw	x,#20500
2812  0083 cd0000        	call	_GPIO_Init
2814  0086 85            	popw	x
2815                     ; 80 	GPIO_Init(LED_02_PORT, LED_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2817  0087 4be0          	push	#224
2818  0089 4b04          	push	#4
2819  008b ae500a        	ldw	x,#20490
2820  008e cd0000        	call	_GPIO_Init
2822  0091 85            	popw	x
2823                     ; 83 	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
2825  0092 4b40          	push	#64
2826  0094 4b02          	push	#2
2827  0096 ae500a        	ldw	x,#20490
2828  0099 cd0000        	call	_GPIO_Init
2830  009c 85            	popw	x
2831                     ; 86 	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2833  009d 4be0          	push	#224
2834  009f 4b10          	push	#16
2835  00a1 ae500a        	ldw	x,#20490
2836  00a4 cd0000        	call	_GPIO_Init
2838  00a7 85            	popw	x
2839                     ; 87 }
2842  00a8 81            	ret
2885                     ; 90 void delay_ms(uint16_t ms)
2885                     ; 91 {
2886                     	switch	.text
2887  00a9               _delay_ms:
2889  00a9 89            	pushw	x
2890  00aa 5204          	subw	sp,#4
2891       00000004      OFST:	set	4
2894                     ; 95 	for (i = 0; i < (16000UL / 1000UL) * ms; i++); // CORRIGIDO: Adicionado UL para cálculo robusto
2896  00ac ae0000        	ldw	x,#0
2897  00af 1f03          	ldw	(OFST-1,sp),x
2898  00b1 ae0000        	ldw	x,#0
2899  00b4 1f01          	ldw	(OFST-3,sp),x
2902  00b6 2009          	jra	L7571
2903  00b8               L3571:
2907  00b8 96            	ldw	x,sp
2908  00b9 1c0001        	addw	x,#OFST-3
2909  00bc a601          	ld	a,#1
2910  00be cd0000        	call	c_lgadc
2913  00c1               L7571:
2916  00c1 1e05          	ldw	x,(OFST+1,sp)
2917  00c3 a610          	ld	a,#16
2918  00c5 cd0000        	call	c_cmulx
2920  00c8 96            	ldw	x,sp
2921  00c9 1c0001        	addw	x,#OFST-3
2922  00cc cd0000        	call	c_lcmp
2924  00cf 22e7          	jrugt	L3571
2925                     ; 96 }
2928  00d1 5b06          	addw	sp,#6
2929  00d3 81            	ret
2953                     ; 99 uint8_t ReadButton (void)
2953                     ; 100 {
2954                     	switch	.text
2955  00d4               _ReadButton:
2959                     ; 103 	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
2961  00d4 4b02          	push	#2
2962  00d6 ae500a        	ldw	x,#20490
2963  00d9 cd0000        	call	_GPIO_ReadInputPin
2965  00dc 5b01          	addw	sp,#1
2966  00de 4d            	tnz	a
2967  00df 2604          	jrne	L02
2968  00e1 a601          	ld	a,#1
2969  00e3 2001          	jra	L22
2970  00e5               L02:
2971  00e5 4f            	clr	a
2972  00e6               L22:
2975  00e6 81            	ret
3012                     ; 107 void PlayBuzzerTone(uint16_t duration_ms)
3012                     ; 108 {
3013                     	switch	.text
3014  00e7               _PlayBuzzerTone:
3016  00e7 89            	pushw	x
3017       00000000      OFST:	set	0
3020                     ; 109     GPIO_WriteHigh(BUZZER_PORT, BUZZER_PIN); // Liga o buzzer
3022  00e8 4b10          	push	#16
3023  00ea ae500a        	ldw	x,#20490
3024  00ed cd0000        	call	_GPIO_WriteHigh
3026  00f0 84            	pop	a
3027                     ; 110     delay_ms(duration_ms);                   
3029  00f1 1e01          	ldw	x,(OFST+1,sp)
3030  00f3 adb4          	call	_delay_ms
3032                     ; 111     GPIO_WriteLow(BUZZER_PORT, BUZZER_PIN);  // Desliga o buzzer
3034  00f5 4b10          	push	#16
3035  00f7 ae500a        	ldw	x,#20490
3036  00fa cd0000        	call	_GPIO_WriteLow
3038  00fd 84            	pop	a
3039                     ; 112 }
3042  00fe 85            	popw	x
3043  00ff 81            	ret
3076                     ; 115 void InitCLOCK(void)
3076                     ; 116 {
3077                     	switch	.text
3078  0100               _InitCLOCK:
3082                     ; 117     CLK_DeInit(); // Reseta a configuração de clock para o padrão
3084  0100 cd0000        	call	_CLK_DeInit
3086                     ; 119     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
3088  0103 4f            	clr	a
3089  0104 cd0000        	call	_CLK_HSECmd
3091                     ; 120     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
3093  0107 4f            	clr	a
3094  0108 cd0000        	call	_CLK_LSICmd
3096                     ; 121     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3098  010b a601          	ld	a,#1
3099  010d cd0000        	call	_CLK_HSICmd
3102  0110               L3202:
3103                     ; 124     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3105  0110 ae0102        	ldw	x,#258
3106  0113 cd0000        	call	_CLK_GetFlagStatus
3108  0116 4d            	tnz	a
3109  0117 27f7          	jreq	L3202
3110                     ; 126     CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
3112  0119 a601          	ld	a,#1
3113  011b cd0000        	call	_CLK_ClockSwitchCmd
3115                     ; 127     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
3117  011e 4f            	clr	a
3118  011f cd0000        	call	_CLK_HSIPrescalerConfig
3120                     ; 128     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)
3122  0122 a680          	ld	a,#128
3123  0124 cd0000        	call	_CLK_SYSCLKConfig
3125                     ; 131     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3127  0127 4b01          	push	#1
3128  0129 4b00          	push	#0
3129  012b ae01e1        	ldw	x,#481
3130  012e cd0000        	call	_CLK_ClockSwitchConfig
3132  0131 85            	popw	x
3133                     ; 134     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3135  0132 5f            	clrw	x
3136  0133 cd0000        	call	_CLK_PeripheralClockConfig
3138                     ; 135     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3140  0136 ae0100        	ldw	x,#256
3141  0139 cd0000        	call	_CLK_PeripheralClockConfig
3143                     ; 136     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
3145  013c ae1300        	ldw	x,#4864
3146  013f cd0000        	call	_CLK_PeripheralClockConfig
3148                     ; 137     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3150  0142 ae1200        	ldw	x,#4608
3151  0145 cd0000        	call	_CLK_PeripheralClockConfig
3153                     ; 138     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3155  0148 ae0300        	ldw	x,#768
3156  014b cd0000        	call	_CLK_PeripheralClockConfig
3158                     ; 139     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3160  014e ae0700        	ldw	x,#1792
3161  0151 cd0000        	call	_CLK_PeripheralClockConfig
3163                     ; 140     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
3165  0154 ae0500        	ldw	x,#1280
3166  0157 cd0000        	call	_CLK_PeripheralClockConfig
3168                     ; 141 }
3171  015a 81            	ret
3184                     	xdef	_main
3185                     	xdef	_PlayBuzzerTone
3186                     	xdef	_delay_ms
3187                     	xdef	_ReadButton
3188                     	xdef	_InitCLOCK
3189                     	xdef	_InitGPIO
3190                     	xref	_GPIO_ReadInputPin
3191                     	xref	_GPIO_WriteLow
3192                     	xref	_GPIO_WriteHigh
3193                     	xref	_GPIO_Init
3194                     	xref	_CLK_GetFlagStatus
3195                     	xref	_CLK_SYSCLKConfig
3196                     	xref	_CLK_HSIPrescalerConfig
3197                     	xref	_CLK_ClockSwitchConfig
3198                     	xref	_CLK_PeripheralClockConfig
3199                     	xref	_CLK_ClockSwitchCmd
3200                     	xref	_CLK_LSICmd
3201                     	xref	_CLK_HSICmd
3202                     	xref	_CLK_HSECmd
3203                     	xref	_CLK_DeInit
3222                     	xref	c_lcmp
3223                     	xref	c_cmulx
3224                     	xref	c_lgadc
3225                     	end
