   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2650                     ; 26 main()
2650                     ; 27 {
2652                     	switch	.text
2653  0000               _main:
2655  0000 5203          	subw	sp,#3
2656       00000003      OFST:	set	3
2659                     ; 28 	uint8_t estado_led = 0;				// Guarda o estado do Led 01 - inicia apagado
2661  0002 0f03          	clr	(OFST+0,sp)
2663                     ; 30 	uint8_t last_button_state = 1; 		// Guarda o último estado lido do botão (1 = solto)
2665  0004 a601          	ld	a,#1
2666  0006 6b01          	ld	(OFST-2,sp),a
2668                     ; 33 	InitCLOCK();                   		// Configura o clock do microcontrolador
2670  0008 cd00d0        	call	_InitCLOCK
2672                     ; 34 	InitGPIO();                    		// Configura os pinos de entrada e saída
2674  000b ad61          	call	_InitGPIO
2676                     ; 37     GPIO_WriteHigh(LED_01_PORT, LED_01_PIN);
2678  000d 4b20          	push	#32
2679  000f ae5014        	ldw	x,#20500
2680  0012 cd0000        	call	_GPIO_WriteHigh
2682  0015 84            	pop	a
2683                     ; 38     GPIO_WriteLow(LED_02_PORT, LED_02_PIN);
2685  0016 4b10          	push	#16
2686  0018 ae500a        	ldw	x,#20490
2687  001b cd0000        	call	_GPIO_WriteLow
2689  001e 84            	pop	a
2690  001f               L7071:
2691                     ; 43 		current_button = ReadButton();
2693  001f cd00bd        	call	_ReadButton
2695  0022 6b02          	ld	(OFST-1,sp),a
2697                     ; 46 		if (current_button == 0 && last_button_state == 1) // Detecção de borda de descida
2699  0024 0d02          	tnz	(OFST-1,sp)
2700  0026 2640          	jrne	L3171
2702  0028 7b01          	ld	a,(OFST-2,sp)
2703  002a a101          	cp	a,#1
2704  002c 263a          	jrne	L3171
2705                     ; 49 			estado_led = !estado_led; // 0 vira 1, 1 vira 0
2707  002e 0d03          	tnz	(OFST+0,sp)
2708  0030 2604          	jrne	L6
2709  0032 a601          	ld	a,#1
2710  0034 2001          	jra	L01
2711  0036               L6:
2712  0036 4f            	clr	a
2713  0037               L01:
2714  0037 6b03          	ld	(OFST+0,sp),a
2716                     ; 52 			if (estado_led) // Se estado_led é 1 (anteriormente era 0)
2718  0039 0d03          	tnz	(OFST+0,sp)
2719  003b 2714          	jreq	L5171
2720                     ; 54 				GPIO_WriteHigh(LED_02_PORT, LED_02_PIN); // Liga LED_02
2722  003d 4b10          	push	#16
2723  003f ae500a        	ldw	x,#20490
2724  0042 cd0000        	call	_GPIO_WriteHigh
2726  0045 84            	pop	a
2727                     ; 55 				GPIO_WriteLow(LED_01_PORT, LED_01_PIN);	// Apaga LED_01
2729  0046 4b20          	push	#32
2730  0048 ae5014        	ldw	x,#20500
2731  004b cd0000        	call	_GPIO_WriteLow
2733  004e 84            	pop	a
2735  004f 2012          	jra	L7171
2736  0051               L5171:
2737                     ; 59 				GPIO_WriteHigh(LED_01_PORT, LED_01_PIN); // Liga LED_01
2739  0051 4b20          	push	#32
2740  0053 ae5014        	ldw	x,#20500
2741  0056 cd0000        	call	_GPIO_WriteHigh
2743  0059 84            	pop	a
2744                     ; 60 				GPIO_WriteLow(LED_02_PORT, LED_02_PIN); // Apaga LED_02
2746  005a 4b10          	push	#16
2747  005c ae500a        	ldw	x,#20490
2748  005f cd0000        	call	_GPIO_WriteLow
2750  0062 84            	pop	a
2751  0063               L7171:
2752                     ; 63 			delay_ms(20); // Aguarda 20 ms para evitar múltiplos disparos (debounce)
2754  0063 ae0014        	ldw	x,#20
2755  0066 ad28          	call	_delay_ms
2757  0068               L3171:
2758                     ; 66         last_button_state = current_button;
2760  0068 7b02          	ld	a,(OFST-1,sp)
2761  006a 6b01          	ld	(OFST-2,sp),a
2764  006c 20b1          	jra	L7071
2788                     ; 71 void InitGPIO(void)
2788                     ; 72 {
2789                     	switch	.text
2790  006e               _InitGPIO:
2794                     ; 74 	GPIO_Init(LED_01_PORT, LED_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2796  006e 4be0          	push	#224
2797  0070 4b20          	push	#32
2798  0072 ae5014        	ldw	x,#20500
2799  0075 cd0000        	call	_GPIO_Init
2801  0078 85            	popw	x
2802                     ; 75 	GPIO_Init(LED_02_PORT, LED_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2804  0079 4be0          	push	#224
2805  007b 4b10          	push	#16
2806  007d ae500a        	ldw	x,#20490
2807  0080 cd0000        	call	_GPIO_Init
2809  0083 85            	popw	x
2810                     ; 78 	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);	
2812  0084 4b40          	push	#64
2813  0086 4b08          	push	#8
2814  0088 ae500a        	ldw	x,#20490
2815  008b cd0000        	call	_GPIO_Init
2817  008e 85            	popw	x
2818                     ; 79 }
2821  008f 81            	ret
2864                     ; 82 void delay_ms(uint16_t ms)
2864                     ; 83 {
2865                     	switch	.text
2866  0090               _delay_ms:
2868  0090 89            	pushw	x
2869  0091 5204          	subw	sp,#4
2870       00000004      OFST:	set	4
2873                     ; 87 	for (i = 0; i < (16000 / 1000) * ms; i++); // Assumindo clock de 16MHz
2875  0093 ae0000        	ldw	x,#0
2876  0096 1f03          	ldw	(OFST-1,sp),x
2877  0098 ae0000        	ldw	x,#0
2878  009b 1f01          	ldw	(OFST-3,sp),x
2881  009d 2009          	jra	L7571
2882  009f               L3571:
2886  009f 96            	ldw	x,sp
2887  00a0 1c0001        	addw	x,#OFST-3
2888  00a3 a601          	ld	a,#1
2889  00a5 cd0000        	call	c_lgadc
2892  00a8               L7571:
2895  00a8 1e05          	ldw	x,(OFST+1,sp)
2896  00aa 58            	sllw	x
2897  00ab 58            	sllw	x
2898  00ac 58            	sllw	x
2899  00ad 58            	sllw	x
2900  00ae cd0000        	call	c_uitolx
2902  00b1 96            	ldw	x,sp
2903  00b2 1c0001        	addw	x,#OFST-3
2904  00b5 cd0000        	call	c_lcmp
2906  00b8 22e5          	jrugt	L3571
2907                     ; 88 }
2910  00ba 5b06          	addw	sp,#6
2911  00bc 81            	ret
2935                     ; 91 uint8_t ReadButton(void)
2935                     ; 92 {
2936                     	switch	.text
2937  00bd               _ReadButton:
2941                     ; 95 	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
2943  00bd 4b08          	push	#8
2944  00bf ae500a        	ldw	x,#20490
2945  00c2 cd0000        	call	_GPIO_ReadInputPin
2947  00c5 5b01          	addw	sp,#1
2948  00c7 4d            	tnz	a
2949  00c8 2604          	jrne	L02
2950  00ca a601          	ld	a,#1
2951  00cc 2001          	jra	L22
2952  00ce               L02:
2953  00ce 4f            	clr	a
2954  00cf               L22:
2957  00cf 81            	ret
2990                     ; 99 void InitCLOCK(void)
2990                     ; 100 {
2991                     	switch	.text
2992  00d0               _InitCLOCK:
2996                     ; 101     CLK_DeInit(); // Reseta a configuração de clock para o padrão
2998  00d0 cd0000        	call	_CLK_DeInit
3000                     ; 103     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
3002  00d3 4f            	clr	a
3003  00d4 cd0000        	call	_CLK_HSECmd
3005                     ; 104     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
3007  00d7 4f            	clr	a
3008  00d8 cd0000        	call	_CLK_LSICmd
3010                     ; 105     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3012  00db a601          	ld	a,#1
3013  00dd cd0000        	call	_CLK_HSICmd
3016  00e0               L5002:
3017                     ; 108     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3019  00e0 ae0102        	ldw	x,#258
3020  00e3 cd0000        	call	_CLK_GetFlagStatus
3022  00e6 4d            	tnz	a
3023  00e7 27f7          	jreq	L5002
3024                     ; 110     CLK_ClockSwitchCmd(ENABLE);                        // Habilita a troca de clock automática
3026  00e9 a601          	ld	a,#1
3027  00eb cd0000        	call	_CLK_ClockSwitchCmd
3029                     ; 111     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);     // Prescaler HSI = 1 (clock total)
3031  00ee 4f            	clr	a
3032  00ef cd0000        	call	_CLK_HSIPrescalerConfig
3034                     ; 112     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);           // Prescaler CPU = 1 (clock total)
3036  00f2 a680          	ld	a,#128
3037  00f4 cd0000        	call	_CLK_SYSCLKConfig
3039                     ; 115     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3041  00f7 4b01          	push	#1
3042  00f9 4b00          	push	#0
3043  00fb ae01e1        	ldw	x,#481
3044  00fe cd0000        	call	_CLK_ClockSwitchConfig
3046  0101 85            	popw	x
3047                     ; 118     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3049  0102 5f            	clrw	x
3050  0103 cd0000        	call	_CLK_PeripheralClockConfig
3052                     ; 119     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3054  0106 ae0100        	ldw	x,#256
3055  0109 cd0000        	call	_CLK_PeripheralClockConfig
3057                     ; 120     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
3059  010c ae1301        	ldw	x,#4865
3060  010f cd0000        	call	_CLK_PeripheralClockConfig
3062                     ; 121     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3064  0112 ae1200        	ldw	x,#4608
3065  0115 cd0000        	call	_CLK_PeripheralClockConfig
3067                     ; 122     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3069  0118 ae0300        	ldw	x,#768
3070  011b cd0000        	call	_CLK_PeripheralClockConfig
3072                     ; 123     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3074  011e ae0700        	ldw	x,#1792
3075  0121 cd0000        	call	_CLK_PeripheralClockConfig
3077                     ; 124     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
3079  0124 ae0500        	ldw	x,#1280
3080  0127 cd0000        	call	_CLK_PeripheralClockConfig
3082                     ; 125 }
3085  012a 81            	ret
3098                     	xdef	_main
3099                     	xdef	_delay_ms
3100                     	xdef	_ReadButton
3101                     	xdef	_InitCLOCK
3102                     	xdef	_InitGPIO
3103                     	xref	_GPIO_ReadInputPin
3104                     	xref	_GPIO_WriteLow
3105                     	xref	_GPIO_WriteHigh
3106                     	xref	_GPIO_Init
3107                     	xref	_CLK_GetFlagStatus
3108                     	xref	_CLK_SYSCLKConfig
3109                     	xref	_CLK_HSIPrescalerConfig
3110                     	xref	_CLK_ClockSwitchConfig
3111                     	xref	_CLK_PeripheralClockConfig
3112                     	xref	_CLK_ClockSwitchCmd
3113                     	xref	_CLK_LSICmd
3114                     	xref	_CLK_HSICmd
3115                     	xref	_CLK_HSECmd
3116                     	xref	_CLK_DeInit
3135                     	xref	c_lcmp
3136                     	xref	c_uitolx
3137                     	xref	c_lgadc
3138                     	end
