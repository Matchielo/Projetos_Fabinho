   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2615                     ; 37 main()
2615                     ; 38 {
2617                     	switch	.text
2618  0000               _main:
2622  0000               L1761:
2623  0000 20fe          	jra	L1761
2647                     ; 45 void InitGPIO(void)
2647                     ; 46 {
2648                     	switch	.text
2649  0002               _InitGPIO:
2653                     ; 48 	GPIO_Init(LED_01_PORT, LED_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2655  0002 4be0          	push	#224
2656  0004 4b20          	push	#32
2657  0006 ae5014        	ldw	x,#20500
2658  0009 cd0000        	call	_GPIO_Init
2660  000c 85            	popw	x
2661                     ; 49 }
2664  000d 81            	ret
2697                     ; 53 void InitCLOCK(void)
2697                     ; 54 {
2698                     	switch	.text
2699  000e               _InitCLOCK:
2703                     ; 55     CLK_DeInit(); // Reseta a configuração de clock para o padrão
2705  000e cd0000        	call	_CLK_DeInit
2707                     ; 57     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
2709  0011 4f            	clr	a
2710  0012 cd0000        	call	_CLK_HSECmd
2712                     ; 58     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
2714  0015 4f            	clr	a
2715  0016 cd0000        	call	_CLK_LSICmd
2717                     ; 59     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
2719  0019 a601          	ld	a,#1
2720  001b cd0000        	call	_CLK_HSICmd
2723  001e               L7171:
2724                     ; 62     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
2726  001e ae0102        	ldw	x,#258
2727  0021 cd0000        	call	_CLK_GetFlagStatus
2729  0024 4d            	tnz	a
2730  0025 27f7          	jreq	L7171
2731                     ; 64     CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
2733  0027 a601          	ld	a,#1
2734  0029 cd0000        	call	_CLK_ClockSwitchCmd
2736                     ; 65     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
2738  002c 4f            	clr	a
2739  002d cd0000        	call	_CLK_HSIPrescalerConfig
2741                     ; 66     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)
2743  0030 a680          	ld	a,#128
2744  0032 cd0000        	call	_CLK_SYSCLKConfig
2746                     ; 69     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
2748  0035 4b01          	push	#1
2749  0037 4b00          	push	#0
2750  0039 ae01e1        	ldw	x,#481
2751  003c cd0000        	call	_CLK_ClockSwitchConfig
2753  003f 85            	popw	x
2754                     ; 72     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
2756  0040 5f            	clrw	x
2757  0041 cd0000        	call	_CLK_PeripheralClockConfig
2759                     ; 73     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
2761  0044 ae0100        	ldw	x,#256
2762  0047 cd0000        	call	_CLK_PeripheralClockConfig
2764                     ; 74     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
2766  004a ae1300        	ldw	x,#4864
2767  004d cd0000        	call	_CLK_PeripheralClockConfig
2769                     ; 75     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
2771  0050 ae1200        	ldw	x,#4608
2772  0053 cd0000        	call	_CLK_PeripheralClockConfig
2774                     ; 76     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
2776  0056 ae0300        	ldw	x,#768
2777  0059 cd0000        	call	_CLK_PeripheralClockConfig
2779                     ; 77     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
2781  005c ae0700        	ldw	x,#1792
2782  005f cd0000        	call	_CLK_PeripheralClockConfig
2784                     ; 78     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
2786  0062 ae0500        	ldw	x,#1280
2787  0065 cd0000        	call	_CLK_PeripheralClockConfig
2789                     ; 79 }
2792  0068 81            	ret
2805                     	xdef	_main
2806                     	xdef	_InitCLOCK
2807                     	xdef	_InitGPIO
2808                     	xref	_GPIO_Init
2809                     	xref	_CLK_GetFlagStatus
2810                     	xref	_CLK_SYSCLKConfig
2811                     	xref	_CLK_HSIPrescalerConfig
2812                     	xref	_CLK_ClockSwitchConfig
2813                     	xref	_CLK_PeripheralClockConfig
2814                     	xref	_CLK_ClockSwitchCmd
2815                     	xref	_CLK_LSICmd
2816                     	xref	_CLK_HSICmd
2817                     	xref	_CLK_HSECmd
2818                     	xref	_CLK_DeInit
2837                     	end
