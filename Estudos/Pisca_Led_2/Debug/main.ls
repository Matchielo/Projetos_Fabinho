   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     	bsct
2589  0000               _estado_led:
2590  0000 00            	dc.b	0
2622                     ; 21 void main(void)
2622                     ; 22 {
2624                     	switch	.text
2625  0000               _main:
2629                     ; 23 	InitCLOCK();
2631  0000 ad5e          	call	_InitCLOCK
2633                     ; 24 	InitGPIO();
2635  0002 ad50          	call	_InitGPIO
2637  0004               L1761:
2638                     ; 28 		Pisca_LED();
2640  0004 ad2b          	call	_Pisca_LED
2643  0006 20fc          	jra	L1761
2686                     ; 33 void Delay_ms(uint16_t ms)
2686                     ; 34 {
2687                     	switch	.text
2688  0008               _Delay_ms:
2690  0008 89            	pushw	x
2691  0009 89            	pushw	x
2692       00000002      OFST:	set	2
2695  000a 2013          	jra	L1271
2696  000c               L7171:
2697                     ; 38         for (i = 0; i < 2000; i++);
2699  000c 5f            	clrw	x
2700  000d 1f01          	ldw	(OFST-1,sp),x
2703  000f 2007          	jra	L1371
2704  0011               L5271:
2708  0011 1e01          	ldw	x,(OFST-1,sp)
2709  0013 1c0001        	addw	x,#1
2710  0016 1f01          	ldw	(OFST-1,sp),x
2712  0018               L1371:
2715  0018 1e01          	ldw	x,(OFST-1,sp)
2716  001a a307d0        	cpw	x,#2000
2717  001d 25f2          	jrult	L5271
2718  001f               L1271:
2719                     ; 36     while (ms--)
2721  001f 1e03          	ldw	x,(OFST+1,sp)
2722  0021 1d0001        	subw	x,#1
2723  0024 1f03          	ldw	(OFST+1,sp),x
2724  0026 1c0001        	addw	x,#1
2725  0029 a30000        	cpw	x,#0
2726  002c 26de          	jrne	L7171
2727                     ; 40 }
2730  002e 5b04          	addw	sp,#4
2731  0030 81            	ret
2758                     ; 44 void Pisca_LED(void)
2758                     ; 45 {
2759                     	switch	.text
2760  0031               _Pisca_LED:
2764                     ; 46 	GPIO_WriteHigh(GPIOE, GPIO_PIN_5);
2766  0031 4b20          	push	#32
2767  0033 ae5014        	ldw	x,#20500
2768  0036 cd0000        	call	_GPIO_WriteHigh
2770  0039 84            	pop	a
2771                     ; 47 	Delay_ms(500);  // LED ligado por 500ms
2773  003a ae01f4        	ldw	x,#500
2774  003d adc9          	call	_Delay_ms
2776                     ; 48 	estado_led =1;
2778  003f 35010000      	mov	_estado_led,#1
2779                     ; 50 	GPIO_WriteLow(GPIOE, GPIO_PIN_5);
2781  0043 4b20          	push	#32
2782  0045 ae5014        	ldw	x,#20500
2783  0048 cd0000        	call	_GPIO_WriteLow
2785  004b 84            	pop	a
2786                     ; 51 	Delay_ms(500);  // LED desligado por 500ms
2788  004c ae01f4        	ldw	x,#500
2789  004f adb7          	call	_Delay_ms
2791                     ; 52 	estado_led =0;
2793  0051 3f00          	clr	_estado_led
2794                     ; 53 }
2797  0053 81            	ret
2821                     ; 56 void InitGPIO(void)
2821                     ; 57 {
2822                     	switch	.text
2823  0054               _InitGPIO:
2827                     ; 58 	GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);  // LED na porta E5
2829  0054 4be0          	push	#224
2830  0056 4b20          	push	#32
2831  0058 ae5014        	ldw	x,#20500
2832  005b cd0000        	call	_GPIO_Init
2834  005e 85            	popw	x
2835                     ; 59 }
2838  005f 81            	ret
2871                     ; 63 void InitCLOCK(void)
2871                     ; 64 {
2872                     	switch	.text
2873  0060               _InitCLOCK:
2877                     ; 65 	CLK_DeInit();
2879  0060 cd0000        	call	_CLK_DeInit
2881                     ; 67 	CLK_HSECmd(DISABLE);
2883  0063 4f            	clr	a
2884  0064 cd0000        	call	_CLK_HSECmd
2886                     ; 68 	CLK_LSICmd(DISABLE);
2888  0067 4f            	clr	a
2889  0068 cd0000        	call	_CLK_LSICmd
2891                     ; 69 	CLK_HSICmd(ENABLE);  // Ativa HSI (16MHz)
2893  006b a601          	ld	a,#1
2894  006d cd0000        	call	_CLK_HSICmd
2897  0070               L7671:
2898                     ; 70 	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
2900  0070 ae0102        	ldw	x,#258
2901  0073 cd0000        	call	_CLK_GetFlagStatus
2903  0076 4d            	tnz	a
2904  0077 27f7          	jreq	L7671
2905                     ; 73 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);
2907  0079 a608          	ld	a,#8
2908  007b cd0000        	call	_CLK_HSIPrescalerConfig
2910                     ; 74 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
2912  007e a680          	ld	a,#128
2913  0080 cd0000        	call	_CLK_SYSCLKConfig
2915                     ; 76 	CLK_ClockSwitchCmd(ENABLE);
2917  0083 a601          	ld	a,#1
2918  0085 cd0000        	call	_CLK_ClockSwitchCmd
2920                     ; 77 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
2922  0088 4b01          	push	#1
2923  008a 4b00          	push	#0
2924  008c ae01e1        	ldw	x,#481
2925  008f cd0000        	call	_CLK_ClockSwitchConfig
2927  0092 85            	popw	x
2928                     ; 80 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
2930  0093 5f            	clrw	x
2931  0094 cd0000        	call	_CLK_PeripheralClockConfig
2933                     ; 81 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
2935  0097 ae0100        	ldw	x,#256
2936  009a cd0000        	call	_CLK_PeripheralClockConfig
2938                     ; 82 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
2940  009d ae1301        	ldw	x,#4865
2941  00a0 cd0000        	call	_CLK_PeripheralClockConfig
2943                     ; 83 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
2945  00a3 ae1200        	ldw	x,#4608
2946  00a6 cd0000        	call	_CLK_PeripheralClockConfig
2948                     ; 84 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
2950  00a9 ae0300        	ldw	x,#768
2951  00ac cd0000        	call	_CLK_PeripheralClockConfig
2953                     ; 85 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
2955  00af ae0701        	ldw	x,#1793
2956  00b2 cd0000        	call	_CLK_PeripheralClockConfig
2958                     ; 86 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
2960  00b5 ae0501        	ldw	x,#1281
2961  00b8 cd0000        	call	_CLK_PeripheralClockConfig
2963                     ; 87 }
2966  00bb 81            	ret
2990                     	xdef	_main
2991                     	xdef	_estado_led
2992                     	xdef	_Pisca_LED
2993                     	xdef	_Delay_ms
2994                     	xdef	_InitCLOCK
2995                     	xdef	_InitGPIO
2996                     	xref	_GPIO_WriteLow
2997                     	xref	_GPIO_WriteHigh
2998                     	xref	_GPIO_Init
2999                     	xref	_CLK_GetFlagStatus
3000                     	xref	_CLK_SYSCLKConfig
3001                     	xref	_CLK_HSIPrescalerConfig
3002                     	xref	_CLK_ClockSwitchConfig
3003                     	xref	_CLK_PeripheralClockConfig
3004                     	xref	_CLK_ClockSwitchCmd
3005                     	xref	_CLK_LSICmd
3006                     	xref	_CLK_HSICmd
3007                     	xref	_CLK_HSECmd
3008                     	xref	_CLK_DeInit
3027                     	end
