   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2650                     ; 17 void main(void)
2650                     ; 18 {
2652                     	switch	.text
2653  0000               _main:
2655  0000 5203          	subw	sp,#3
2656       00000003      OFST:	set	3
2659                     ; 19     uint8_t led_state = 0;        	// Guarda o estado atual do LED (0 = desligado, 1 = ligado)
2661  0002 0f03          	clr	(OFST+0,sp)
2663                     ; 20 		uint8_t last_button_state = 1; 	// Guarda o último estado lido do botão (1 = solto)
2665  0004 a601          	ld	a,#1
2666  0006 6b01          	ld	(OFST-2,sp),a
2668                     ; 23 		InitCLOCK();                   	// Configura o clock do microcontrolador
2670  0008 cd00a9        	call	_InitCLOCK
2672                     ; 24     InitGPIO();                    	// Configura os pinos de entrada e saída
2674  000b ad45          	call	_InitGPIO
2676                     ; 26 		GPIO_WriteHigh(LED_PORT, LED_PIN);
2678  000d 4b20          	push	#32
2679  000f ae5014        	ldw	x,#20500
2680  0012 cd0000        	call	_GPIO_WriteHigh
2682  0015 84            	pop	a
2683  0016               L7071:
2684                     ; 29         current_button = ReadButton();
2686  0016 ad51          	call	_ReadButton
2688  0018 6b02          	ld	(OFST-1,sp),a
2690                     ; 32         if (last_button_state == 1 && current_button == 0)
2692  001a 7b01          	ld	a,(OFST-2,sp)
2693  001c a101          	cp	a,#1
2694  001e 262c          	jrne	L3171
2696  0020 0d02          	tnz	(OFST-1,sp)
2697  0022 2628          	jrne	L3171
2698                     ; 34             led_state = !led_state; // Inverte o estado do LED (toggle)
2700  0024 0d03          	tnz	(OFST+0,sp)
2701  0026 2604          	jrne	L6
2702  0028 a601          	ld	a,#1
2703  002a 2001          	jra	L01
2704  002c               L6:
2705  002c 4f            	clr	a
2706  002d               L01:
2707  002d 6b03          	ld	(OFST+0,sp),a
2709                     ; 37             if (led_state)
2711  002f 0d03          	tnz	(OFST+0,sp)
2712  0031 270b          	jreq	L5171
2713                     ; 38                 GPIO_WriteHigh(LED_PORT, LED_PIN);  // Liga o LED
2715  0033 4b20          	push	#32
2716  0035 ae5014        	ldw	x,#20500
2717  0038 cd0000        	call	_GPIO_WriteHigh
2719  003b 84            	pop	a
2721  003c 2009          	jra	L7171
2722  003e               L5171:
2723                     ; 40                 GPIO_WriteLow(LED_PORT, LED_PIN);   // Desliga o LED
2725  003e 4b20          	push	#32
2726  0040 ae5014        	ldw	x,#20500
2727  0043 cd0000        	call	_GPIO_WriteLow
2729  0046 84            	pop	a
2730  0047               L7171:
2731                     ; 42             delay_ms(20); // Aguarda 20 ms para evitar múltiplos disparos (debounce)
2733  0047 ae0014        	ldw	x,#20
2734  004a ad30          	call	_delay_ms
2736  004c               L3171:
2737                     ; 45         last_button_state = current_button; // Atualiza o último estado do botão
2739  004c 7b02          	ld	a,(OFST-1,sp)
2740  004e 6b01          	ld	(OFST-2,sp),a
2743  0050 20c4          	jra	L7071
2767                     ; 50 void InitGPIO(void)
2767                     ; 51 {
2768                     	switch	.text
2769  0052               _InitGPIO:
2773                     ; 53     GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2775  0052 4be0          	push	#224
2776  0054 4b20          	push	#32
2777  0056 ae5014        	ldw	x,#20500
2778  0059 cd0000        	call	_GPIO_Init
2780  005c 85            	popw	x
2781                     ; 56     GPIO_Init(INPUT_PORT, INPUT_PIN, GPIO_MODE_IN_PU_NO_IT);
2783  005d 4b40          	push	#64
2784  005f 4b08          	push	#8
2785  0061 ae500a        	ldw	x,#20490
2786  0064 cd0000        	call	_GPIO_Init
2788  0067 85            	popw	x
2789                     ; 57 }
2792  0068 81            	ret
2816                     ; 60 uint8_t ReadButton(void)
2816                     ; 61 {
2817                     	switch	.text
2818  0069               _ReadButton:
2822                     ; 64     return (GPIO_ReadInputPin(INPUT_PORT, INPUT_PIN) == RESET);
2824  0069 4b08          	push	#8
2825  006b ae500a        	ldw	x,#20490
2826  006e cd0000        	call	_GPIO_ReadInputPin
2828  0071 5b01          	addw	sp,#1
2829  0073 4d            	tnz	a
2830  0074 2604          	jrne	L61
2831  0076 a601          	ld	a,#1
2832  0078 2001          	jra	L02
2833  007a               L61:
2834  007a 4f            	clr	a
2835  007b               L02:
2838  007b 81            	ret
2881                     ; 68 void delay_ms(uint16_t ms)
2881                     ; 69 {
2882                     	switch	.text
2883  007c               _delay_ms:
2885  007c 89            	pushw	x
2886  007d 5204          	subw	sp,#4
2887       00000004      OFST:	set	4
2890                     ; 73 	for (i = 0; i < (16000 / 1000) * ms; i++); // Assumindo clock de 16MHz
2892  007f ae0000        	ldw	x,#0
2893  0082 1f03          	ldw	(OFST-1,sp),x
2894  0084 ae0000        	ldw	x,#0
2895  0087 1f01          	ldw	(OFST-3,sp),x
2898  0089 2009          	jra	L7671
2899  008b               L3671:
2903  008b 96            	ldw	x,sp
2904  008c 1c0001        	addw	x,#OFST-3
2905  008f a601          	ld	a,#1
2906  0091 cd0000        	call	c_lgadc
2909  0094               L7671:
2912  0094 1e05          	ldw	x,(OFST+1,sp)
2913  0096 58            	sllw	x
2914  0097 58            	sllw	x
2915  0098 58            	sllw	x
2916  0099 58            	sllw	x
2917  009a cd0000        	call	c_uitolx
2919  009d 96            	ldw	x,sp
2920  009e 1c0001        	addw	x,#OFST-3
2921  00a1 cd0000        	call	c_lcmp
2923  00a4 22e5          	jrugt	L3671
2924                     ; 74 }
2927  00a6 5b06          	addw	sp,#6
2928  00a8 81            	ret
2961                     ; 77 void InitCLOCK(void)
2961                     ; 78 {
2962                     	switch	.text
2963  00a9               _InitCLOCK:
2967                     ; 79     CLK_DeInit(); // Reseta a configuração de clock para o padrão
2969  00a9 cd0000        	call	_CLK_DeInit
2971                     ; 81     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
2973  00ac 4f            	clr	a
2974  00ad cd0000        	call	_CLK_HSECmd
2976                     ; 82     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
2978  00b0 4f            	clr	a
2979  00b1 cd0000        	call	_CLK_LSICmd
2981                     ; 83     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
2983  00b4 a601          	ld	a,#1
2984  00b6 cd0000        	call	_CLK_HSICmd
2987  00b9               L5002:
2988                     ; 86     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
2990  00b9 ae0102        	ldw	x,#258
2991  00bc cd0000        	call	_CLK_GetFlagStatus
2993  00bf 4d            	tnz	a
2994  00c0 27f7          	jreq	L5002
2995                     ; 88     CLK_ClockSwitchCmd(ENABLE);                        // Habilita a troca de clock automática
2997  00c2 a601          	ld	a,#1
2998  00c4 cd0000        	call	_CLK_ClockSwitchCmd
3000                     ; 89     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);     // Prescaler HSI = 1 (clock total)
3002  00c7 4f            	clr	a
3003  00c8 cd0000        	call	_CLK_HSIPrescalerConfig
3005                     ; 90     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);           // Prescaler CPU = 1 (clock total)
3007  00cb a680          	ld	a,#128
3008  00cd cd0000        	call	_CLK_SYSCLKConfig
3010                     ; 93     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
3012  00d0 4b01          	push	#1
3013  00d2 4b00          	push	#0
3014  00d4 ae01e1        	ldw	x,#481
3015  00d7 cd0000        	call	_CLK_ClockSwitchConfig
3017  00da 85            	popw	x
3018                     ; 96     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
3020  00db 5f            	clrw	x
3021  00dc cd0000        	call	_CLK_PeripheralClockConfig
3023                     ; 97     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
3025  00df ae0100        	ldw	x,#256
3026  00e2 cd0000        	call	_CLK_PeripheralClockConfig
3028                     ; 98     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
3030  00e5 ae1301        	ldw	x,#4865
3031  00e8 cd0000        	call	_CLK_PeripheralClockConfig
3033                     ; 99     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
3035  00eb ae1200        	ldw	x,#4608
3036  00ee cd0000        	call	_CLK_PeripheralClockConfig
3038                     ; 100     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
3040  00f1 ae0300        	ldw	x,#768
3041  00f4 cd0000        	call	_CLK_PeripheralClockConfig
3043                     ; 101     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
3045  00f7 ae0700        	ldw	x,#1792
3046  00fa cd0000        	call	_CLK_PeripheralClockConfig
3048                     ; 102     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
3050  00fd ae0500        	ldw	x,#1280
3051  0100 cd0000        	call	_CLK_PeripheralClockConfig
3053                     ; 103 }
3056  0103 81            	ret
3069                     	xdef	_main
3070                     	xdef	_delay_ms
3071                     	xdef	_ReadButton
3072                     	xdef	_InitCLOCK
3073                     	xdef	_InitGPIO
3074                     	xref	_GPIO_ReadInputPin
3075                     	xref	_GPIO_WriteLow
3076                     	xref	_GPIO_WriteHigh
3077                     	xref	_GPIO_Init
3078                     	xref	_CLK_GetFlagStatus
3079                     	xref	_CLK_SYSCLKConfig
3080                     	xref	_CLK_HSIPrescalerConfig
3081                     	xref	_CLK_ClockSwitchConfig
3082                     	xref	_CLK_PeripheralClockConfig
3083                     	xref	_CLK_ClockSwitchCmd
3084                     	xref	_CLK_LSICmd
3085                     	xref	_CLK_HSICmd
3086                     	xref	_CLK_HSECmd
3087                     	xref	_CLK_DeInit
3106                     	xref	c_lcmp
3107                     	xref	c_uitolx
3108                     	xref	c_lgadc
3109                     	end
