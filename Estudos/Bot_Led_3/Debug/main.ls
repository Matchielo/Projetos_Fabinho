   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2650                     ; 26 main()
2650                     ; 27 {
2652                     	switch	.text
2653  0000               _main:
2655  0000 5203          	subw	sp,#3
2656       00000003      OFST:	set	3
2659                     ; 28 	uint8_t last_button_state = 1; 			// Guarda o último estado lido do botão (1 = solto)
2661  0002 a601          	ld	a,#1
2662  0004 6b01          	ld	(OFST-2,sp),a
2664                     ; 30 	uint8_t button_action_pending = 0;	// variável de controle
2666  0006 0f02          	clr	(OFST-1,sp)
2668                     ; 32 	InitCLOCK();
2670  0008 cd00db        	call	_InitCLOCK
2672                     ; 33 	InitGPIO();
2674  000b ad4d          	call	_InitGPIO
2676                     ; 36 	GPIO_WriteLow(LED_PORT, LED_PIN);
2678  000d 4b20          	push	#32
2679  000f ae5014        	ldw	x,#20500
2680  0012 cd0000        	call	_GPIO_WriteLow
2682  0015 84            	pop	a
2683  0016               L7071:
2684                     ; 40 		current_button = ReadButton(); 		// CB recebe o valor do estado do Botão atual
2686  0016 ad59          	call	_ReadButton
2688  0018 6b03          	ld	(OFST+0,sp),a
2690                     ; 42 		if (last_button_state == 1 && current_button == 0)
2692  001a 7b01          	ld	a,(OFST-2,sp)
2693  001c a101          	cp	a,#1
2694  001e 2628          	jrne	L3171
2696  0020 0d03          	tnz	(OFST+0,sp)
2697  0022 2624          	jrne	L3171
2698                     ; 45 			if (button_action_pending == 0) // Garante que a ação ocorre uma vez por pressionamento
2700  0024 0d02          	tnz	(OFST-1,sp)
2701  0026 262c          	jrne	L7171
2702                     ; 47 				button_action_pending == 1;					// Marca que a ação do botão foi detectada
2704  0028 7b02          	ld	a,(OFST-1,sp)
2705  002a a101          	cp	a,#1
2706  002c 2605          	jrne	L6
2707  002e ae0001        	ldw	x,#1
2708  0031 2001          	jra	L01
2709  0033               L6:
2710  0033 5f            	clrw	x
2711  0034               L01:
2712                     ; 48 				BlinkLed(3,500);										// Pisca o LED 3 vezes (100ms on/off)
2714  0034 ae01f4        	ldw	x,#500
2715  0037 89            	pushw	x
2716  0038 a603          	ld	a,#3
2717  003a ad75          	call	_BlinkLed
2719  003c 85            	popw	x
2720                     ; 49 				GPIO_WriteLow(LED_PORT, LED_PIN); 	// Garante que o LED fique apagado após piscar
2722  003d 4b20          	push	#32
2723  003f ae5014        	ldw	x,#20500
2724  0042 cd0000        	call	_GPIO_WriteLow
2726  0045 84            	pop	a
2727  0046 200c          	jra	L7171
2728  0048               L3171:
2729                     ; 54 		else if (last_button_state == 0 && current_button == 1)
2731  0048 0d01          	tnz	(OFST-2,sp)
2732  004a 2608          	jrne	L7171
2734  004c 7b03          	ld	a,(OFST+0,sp)
2735  004e a101          	cp	a,#1
2736  0050 2602          	jrne	L7171
2737                     ; 56 			button_action_pending = 0; // permite uma nova ação no próximo pressionamento
2739  0052 0f02          	clr	(OFST-1,sp)
2741  0054               L7171:
2742                     ; 60         last_button_state = current_button;
2744  0054 7b03          	ld	a,(OFST+0,sp)
2745  0056 6b01          	ld	(OFST-2,sp),a
2748  0058 20bc          	jra	L7071
2772                     ; 66 void InitGPIO(void)
2772                     ; 67 {
2773                     	switch	.text
2774  005a               _InitGPIO:
2778                     ; 69 	GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2780  005a 4be0          	push	#224
2781  005c 4b20          	push	#32
2782  005e ae5014        	ldw	x,#20500
2783  0061 cd0000        	call	_GPIO_Init
2785  0064 85            	popw	x
2786                     ; 72 	GPIO_Init(BOTAO_PORT, BOTAO_PIN, GPIO_MODE_IN_PU_NO_IT);
2788  0065 4b40          	push	#64
2789  0067 4b08          	push	#8
2790  0069 ae500a        	ldw	x,#20490
2791  006c cd0000        	call	_GPIO_Init
2793  006f 85            	popw	x
2794                     ; 73 }
2797  0070 81            	ret
2821                     ; 76 uint8_t ReadButton(void)
2821                     ; 77 {
2822                     	switch	.text
2823  0071               _ReadButton:
2827                     ; 80 	return (GPIO_ReadInputPin(BOTAO_PORT, BOTAO_PIN) == RESET);
2829  0071 4b08          	push	#8
2830  0073 ae500a        	ldw	x,#20490
2831  0076 cd0000        	call	_GPIO_ReadInputPin
2833  0079 5b01          	addw	sp,#1
2834  007b 4d            	tnz	a
2835  007c 2604          	jrne	L61
2836  007e a601          	ld	a,#1
2837  0080 2001          	jra	L02
2838  0082               L61:
2839  0082 4f            	clr	a
2840  0083               L02:
2843  0083 81            	ret
2886                     ; 84 void Delay_ms(uint16_t ms)
2886                     ; 85 {
2887                     	switch	.text
2888  0084               _Delay_ms:
2890  0084 89            	pushw	x
2891  0085 5204          	subw	sp,#4
2892       00000004      OFST:	set	4
2895                     ; 89 	for (i = 0; i < (16000 / 1000) * ms; i++); // Assumindo clock de 16MHz
2897  0087 ae0000        	ldw	x,#0
2898  008a 1f03          	ldw	(OFST-1,sp),x
2899  008c ae0000        	ldw	x,#0
2900  008f 1f01          	ldw	(OFST-3,sp),x
2903  0091 2009          	jra	L1771
2904  0093               L5671:
2908  0093 96            	ldw	x,sp
2909  0094 1c0001        	addw	x,#OFST-3
2910  0097 a601          	ld	a,#1
2911  0099 cd0000        	call	c_lgadc
2914  009c               L1771:
2917  009c 1e05          	ldw	x,(OFST+1,sp)
2918  009e 58            	sllw	x
2919  009f 58            	sllw	x
2920  00a0 58            	sllw	x
2921  00a1 58            	sllw	x
2922  00a2 cd0000        	call	c_uitolx
2924  00a5 96            	ldw	x,sp
2925  00a6 1c0001        	addw	x,#OFST-3
2926  00a9 cd0000        	call	c_lcmp
2928  00ac 22e5          	jrugt	L5671
2929                     ; 90 }
2932  00ae 5b06          	addw	sp,#6
2933  00b0 81            	ret
2988                     ; 93 void BlinkLed(uint8_t num_blinks, uint16_t blink_delay)
2988                     ; 94 {
2989                     	switch	.text
2990  00b1               _BlinkLed:
2992  00b1 88            	push	a
2993  00b2 88            	push	a
2994       00000001      OFST:	set	1
2997                     ; 96 	for(i=0; i < num_blinks; i++)
2999  00b3 0f01          	clr	(OFST+0,sp)
3002  00b5 201c          	jra	L7202
3003  00b7               L3202:
3004                     ; 98 		GPIO_WriteHigh(LED_PORT, LED_PIN);
3006  00b7 4b20          	push	#32
3007  00b9 ae5014        	ldw	x,#20500
3008  00bc cd0000        	call	_GPIO_WriteHigh
3010  00bf 84            	pop	a
3011                     ; 99 		Delay_ms(blink_delay);
3013  00c0 1e05          	ldw	x,(OFST+4,sp)
3014  00c2 adc0          	call	_Delay_ms
3016                     ; 100 		GPIO_WriteLow(LED_PORT, LED_PIN);
3018  00c4 4b20          	push	#32
3019  00c6 ae5014        	ldw	x,#20500
3020  00c9 cd0000        	call	_GPIO_WriteLow
3022  00cc 84            	pop	a
3023                     ; 101 		Delay_ms(blink_delay);
3025  00cd 1e05          	ldw	x,(OFST+4,sp)
3026  00cf adb3          	call	_Delay_ms
3028                     ; 96 	for(i=0; i < num_blinks; i++)
3030  00d1 0c01          	inc	(OFST+0,sp)
3032  00d3               L7202:
3035  00d3 7b01          	ld	a,(OFST+0,sp)
3036  00d5 1102          	cp	a,(OFST+1,sp)
3037  00d7 25de          	jrult	L3202
3038                     ; 104 }
3041  00d9 85            	popw	x
3042  00da 81            	ret
3075                     ; 106 void InitCLOCK(void)
3075                     ; 107 {
3076                     	switch	.text
3077  00db               _InitCLOCK:
3081                     ; 108     CLK_DeInit(); // Reseta a configuração de clock para o padrão
3083  00db cd0000        	call	_CLK_DeInit
3085                     ; 110     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
3087  00de 4f            	clr	a
3088  00df cd0000        	call	_CLK_HSECmd
3090                     ; 111     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
3092  00e2 4f            	clr	a
3093  00e3 cd0000        	call	_CLK_LSICmd
3095                     ; 112     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
3097  00e6 a601          	ld	a,#1
3098  00e8 cd0000        	call	_CLK_HSICmd
3101  00eb               L5402:
3102                     ; 115     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
3104  00eb ae0102        	ldw	x,#258
3105  00ee cd0000        	call	_CLK_GetFlagStatus
3107  00f1 4d            	tnz	a
3108  00f2 27f7          	jreq	L5402
3109                     ; 117     CLK_ClockSwitchCmd(ENABLE);                        // Habilita a troca de clock automática
3111  00f4 a601          	ld	a,#1
3112  00f6 cd0000        	call	_CLK_ClockSwitchCmd
3114                     ; 118     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);     // Prescaler HSI = 1 (clock total)
3116  00f9 4f            	clr	a
3117  00fa cd0000        	call	_CLK_HSIPrescalerConfig
3119                     ; 119     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);           // Prescaler CPU = 1 (clock total)
3121  00fd a680          	ld	a,#128
3122  00ff cd0000        	call	_CLK_SYSCLKConfig
3124                     ; 122     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3126  0102 4b01          	push	#1
3127  0104 4b00          	push	#0
3128  0106 ae01e1        	ldw	x,#481
3129  0109 cd0000        	call	_CLK_ClockSwitchConfig
3131  010c 85            	popw	x
3132                     ; 125     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3134  010d 5f            	clrw	x
3135  010e cd0000        	call	_CLK_PeripheralClockConfig
3137                     ; 126     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3139  0111 ae0100        	ldw	x,#256
3140  0114 cd0000        	call	_CLK_PeripheralClockConfig
3142                     ; 127     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
3144  0117 ae1301        	ldw	x,#4865
3145  011a cd0000        	call	_CLK_PeripheralClockConfig
3147                     ; 128     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3149  011d ae1200        	ldw	x,#4608
3150  0120 cd0000        	call	_CLK_PeripheralClockConfig
3152                     ; 129     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3154  0123 ae0300        	ldw	x,#768
3155  0126 cd0000        	call	_CLK_PeripheralClockConfig
3157                     ; 130     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3159  0129 ae0700        	ldw	x,#1792
3160  012c cd0000        	call	_CLK_PeripheralClockConfig
3162                     ; 131     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
3164  012f ae0500        	ldw	x,#1280
3165  0132 cd0000        	call	_CLK_PeripheralClockConfig
3167                     ; 132 }
3170  0135 81            	ret
3183                     	xdef	_Delay_ms
3184                     	xdef	_main
3185                     	xdef	_BlinkLed
3186                     	xdef	_ReadButton
3187                     	xdef	_InitCLOCK
3188                     	xdef	_InitGPIO
3189                     	xref	_GPIO_ReadInputPin
3190                     	xref	_GPIO_WriteLow
3191                     	xref	_GPIO_WriteHigh
3192                     	xref	_GPIO_Init
3193                     	xref	_CLK_GetFlagStatus
3194                     	xref	_CLK_SYSCLKConfig
3195                     	xref	_CLK_HSIPrescalerConfig
3196                     	xref	_CLK_ClockSwitchConfig
3197                     	xref	_CLK_PeripheralClockConfig
3198                     	xref	_CLK_ClockSwitchCmd
3199                     	xref	_CLK_LSICmd
3200                     	xref	_CLK_HSICmd
3201                     	xref	_CLK_HSECmd
3202                     	xref	_CLK_DeInit
3221                     	xref	c_lcmp
3222                     	xref	c_uitolx
3223                     	xref	c_lgadc
3224                     	end
