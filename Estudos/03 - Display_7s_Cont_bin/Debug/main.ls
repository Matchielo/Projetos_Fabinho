   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     .const:	section	.text
2589  0000               _patters:
2590  0000 c0            	dc.b	192
2591  0001 f9            	dc.b	249
2592  0002 a4            	dc.b	164
2593  0003 b0            	dc.b	176
2594  0004 99            	dc.b	153
2595  0005 92            	dc.b	146
2596  0006 82            	dc.b	130
2597  0007 f8            	dc.b	248
2598  0008 80            	dc.b	128
2599  0009 90            	dc.b	144
2630                     ; 59 main()
2630                     ; 60 {
2632                     	switch	.text
2633  0000               _main:
2637                     ; 61 	InitCLOCK();
2639  0000 ad7d          	call	_InitCLOCK
2641                     ; 62 	InitGPIO();
2643  0002 ad02          	call	_InitGPIO
2645  0004               L1761:
2646                     ; 64 	while (1);
2648  0004 20fe          	jra	L1761
2672                     ; 68 void InitGPIO(void)
2672                     ; 69 {
2673                     	switch	.text
2674  0006               _InitGPIO:
2678                     ; 70 	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2680  0006 4be0          	push	#224
2681  0008 4b40          	push	#64
2682  000a ae500a        	ldw	x,#20490
2683  000d cd0000        	call	_GPIO_Init
2685  0010 85            	popw	x
2686                     ; 71 	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2688  0011 4be0          	push	#224
2689  0013 4b80          	push	#128
2690  0015 ae500a        	ldw	x,#20490
2691  0018 cd0000        	call	_GPIO_Init
2693  001b 85            	popw	x
2694                     ; 72 	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2696  001c 4be0          	push	#224
2697  001e 4b01          	push	#1
2698  0020 ae500f        	ldw	x,#20495
2699  0023 cd0000        	call	_GPIO_Init
2701  0026 85            	popw	x
2702                     ; 73 	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2704  0027 4be0          	push	#224
2705  0029 4b02          	push	#2
2706  002b ae500f        	ldw	x,#20495
2707  002e cd0000        	call	_GPIO_Init
2709  0031 85            	popw	x
2710                     ; 74 	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2712  0032 4be0          	push	#224
2713  0034 4b04          	push	#4
2714  0036 ae500f        	ldw	x,#20495
2715  0039 cd0000        	call	_GPIO_Init
2717  003c 85            	popw	x
2718                     ; 75 	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2720  003d 4be0          	push	#224
2721  003f 4b08          	push	#8
2722  0041 ae500f        	ldw	x,#20495
2723  0044 cd0000        	call	_GPIO_Init
2725  0047 85            	popw	x
2726                     ; 76 	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2728  0048 4be0          	push	#224
2729  004a 4b10          	push	#16
2730  004c ae500f        	ldw	x,#20495
2731  004f cd0000        	call	_GPIO_Init
2733  0052 85            	popw	x
2734                     ; 77 }
2737  0053 81            	ret
2780                     ; 80 void Delay_ms(uint16_t ms)
2780                     ; 81 {
2781                     	switch	.text
2782  0054               _Delay_ms:
2784  0054 89            	pushw	x
2785  0055 5204          	subw	sp,#4
2786       00000004      OFST:	set	4
2789                     ; 83 	for (i = 0; i < (16000UL / 1000UL) * ms; i++);
2791  0057 ae0000        	ldw	x,#0
2792  005a 1f03          	ldw	(OFST-1,sp),x
2793  005c ae0000        	ldw	x,#0
2794  005f 1f01          	ldw	(OFST-3,sp),x
2797  0061 2009          	jra	L3371
2798  0063               L7271:
2802  0063 96            	ldw	x,sp
2803  0064 1c0001        	addw	x,#OFST-3
2804  0067 a601          	ld	a,#1
2805  0069 cd0000        	call	c_lgadc
2808  006c               L3371:
2811  006c 1e05          	ldw	x,(OFST+1,sp)
2812  006e a610          	ld	a,#16
2813  0070 cd0000        	call	c_cmulx
2815  0073 96            	ldw	x,sp
2816  0074 1c0001        	addw	x,#OFST-3
2817  0077 cd0000        	call	c_lcmp
2819  007a 22e7          	jrugt	L7271
2820                     ; 84 }
2823  007c 5b06          	addw	sp,#6
2824  007e 81            	ret
2857                     ; 87 void InitCLOCK(void)
2857                     ; 88 {
2858                     	switch	.text
2859  007f               _InitCLOCK:
2863                     ; 89     CLK_DeInit(); // Reseta a configuração de clock para o padrão
2865  007f cd0000        	call	_CLK_DeInit
2867                     ; 91     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
2869  0082 4f            	clr	a
2870  0083 cd0000        	call	_CLK_HSECmd
2872                     ; 92     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
2874  0086 4f            	clr	a
2875  0087 cd0000        	call	_CLK_LSICmd
2877                     ; 93     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
2879  008a a601          	ld	a,#1
2880  008c cd0000        	call	_CLK_HSICmd
2883  008f               L1571:
2884                     ; 96     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
2886  008f ae0102        	ldw	x,#258
2887  0092 cd0000        	call	_CLK_GetFlagStatus
2889  0095 4d            	tnz	a
2890  0096 27f7          	jreq	L1571
2891                     ; 98     CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
2893  0098 a601          	ld	a,#1
2894  009a cd0000        	call	_CLK_ClockSwitchCmd
2896                     ; 99     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
2898  009d 4f            	clr	a
2899  009e cd0000        	call	_CLK_HSIPrescalerConfig
2901                     ; 100     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)
2903  00a1 a680          	ld	a,#128
2904  00a3 cd0000        	call	_CLK_SYSCLKConfig
2906                     ; 103     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
2908  00a6 4b01          	push	#1
2909  00a8 4b00          	push	#0
2910  00aa ae01e1        	ldw	x,#481
2911  00ad cd0000        	call	_CLK_ClockSwitchConfig
2913  00b0 85            	popw	x
2914                     ; 106     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
2916  00b1 5f            	clrw	x
2917  00b2 cd0000        	call	_CLK_PeripheralClockConfig
2919                     ; 107     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
2921  00b5 ae0100        	ldw	x,#256
2922  00b8 cd0000        	call	_CLK_PeripheralClockConfig
2924                     ; 108     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
2926  00bb ae1300        	ldw	x,#4864
2927  00be cd0000        	call	_CLK_PeripheralClockConfig
2929                     ; 109     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
2931  00c1 ae1200        	ldw	x,#4608
2932  00c4 cd0000        	call	_CLK_PeripheralClockConfig
2934                     ; 110     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
2936  00c7 ae0300        	ldw	x,#768
2937  00ca cd0000        	call	_CLK_PeripheralClockConfig
2939                     ; 111     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
2941  00cd ae0700        	ldw	x,#1792
2942  00d0 cd0000        	call	_CLK_PeripheralClockConfig
2944                     ; 112     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
2946  00d3 ae0500        	ldw	x,#1280
2947  00d6 cd0000        	call	_CLK_PeripheralClockConfig
2949                     ; 113 }
2952  00d9 81            	ret
2977                     	xdef	_main
2978                     	xdef	_Delay_ms
2979                     	xdef	_InitGPIO
2980                     	xdef	_InitCLOCK
2981                     	xdef	_patters
2982                     	xref	_GPIO_Init
2983                     	xref	_CLK_GetFlagStatus
2984                     	xref	_CLK_SYSCLKConfig
2985                     	xref	_CLK_HSIPrescalerConfig
2986                     	xref	_CLK_ClockSwitchConfig
2987                     	xref	_CLK_PeripheralClockConfig
2988                     	xref	_CLK_ClockSwitchCmd
2989                     	xref	_CLK_LSICmd
2990                     	xref	_CLK_HSICmd
2991                     	xref	_CLK_HSECmd
2992                     	xref	_CLK_DeInit
3011                     	xref	c_lcmp
3012                     	xref	c_cmulx
3013                     	xref	c_lgadc
3014                     	end
