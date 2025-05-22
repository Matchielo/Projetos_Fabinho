   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2620                     ; 19 main()
2620                     ; 20 {
2622                     	switch	.text
2623  0000               _main:
2627                     ; 21 	InitCLOCK();
2629  0000 ad2c          	call	_InitCLOCK
2631                     ; 22 	InitGPIO();
2633  0002 ad1e          	call	_InitGPIO
2635  0004               L1761:
2636                     ; 26 		GPIO_WriteHigh(GPIOE, GPIO_PIN_5);
2638  0004 4b20          	push	#32
2639  0006 ae5014        	ldw	x,#20500
2640  0009 cd0000        	call	_GPIO_WriteHigh
2642  000c 84            	pop	a
2643                     ; 27 		Delay_ms(10000);
2645  000d ae2710        	ldw	x,#10000
2646  0010 ad78          	call	_Delay_ms
2648                     ; 28 		GPIO_WriteLow(GPIOE, GPIO_PIN_5);
2650  0012 4b20          	push	#32
2651  0014 ae5014        	ldw	x,#20500
2652  0017 cd0000        	call	_GPIO_WriteLow
2654  001a 84            	pop	a
2655                     ; 29 		Delay_ms(10000);
2657  001b ae2710        	ldw	x,#10000
2658  001e ad6a          	call	_Delay_ms
2661  0020 20e2          	jra	L1761
2685                     ; 36 void InitGPIO()
2685                     ; 37 {
2686                     	switch	.text
2687  0022               _InitGPIO:
2691                     ; 38 	GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
2693  0022 4be0          	push	#224
2694  0024 4b20          	push	#32
2695  0026 ae5014        	ldw	x,#20500
2696  0029 cd0000        	call	_GPIO_Init
2698  002c 85            	popw	x
2699                     ; 39 }
2702  002d 81            	ret
2735                     ; 44 void InitCLOCK()
2735                     ; 45 {
2736                     	switch	.text
2737  002e               _InitCLOCK:
2741                     ; 46 	CLK_DeInit(); 
2743  002e cd0000        	call	_CLK_DeInit
2745                     ; 48 	CLK_HSECmd(DISABLE);
2747  0031 4f            	clr	a
2748  0032 cd0000        	call	_CLK_HSECmd
2750                     ; 49 	CLK_LSICmd(DISABLE);
2752  0035 4f            	clr	a
2753  0036 cd0000        	call	_CLK_LSICmd
2755                     ; 50 	CLK_HSICmd(ENABLE);																																	//HSI Full Clock = 16MHz
2757  0039 a601          	ld	a,#1
2758  003b cd0000        	call	_CLK_HSICmd
2761  003e               L7171:
2762                     ; 51 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
2764  003e ae0102        	ldw	x,#258
2765  0041 cd0000        	call	_CLK_GetFlagStatus
2767  0044 4d            	tnz	a
2768  0045 27f7          	jreq	L7171
2769                     ; 53 	CLK_ClockSwitchCmd(ENABLE);
2771  0047 a601          	ld	a,#1
2772  0049 cd0000        	call	_CLK_ClockSwitchCmd
2774                     ; 54 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);              		//Divisible by 1; 2; 4; 8
2776  004c a608          	ld	a,#8
2777  004e cd0000        	call	_CLK_HSIPrescalerConfig
2779                     ; 55 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);																						//Divisible by 1; 2; 4; 8; 16; 32; 64; 128
2781  0051 a680          	ld	a,#128
2782  0053 cd0000        	call	_CLK_SYSCLKConfig
2784                     ; 57 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
2786  0056 4b01          	push	#1
2787  0058 4b00          	push	#0
2788  005a ae01e1        	ldw	x,#481
2789  005d cd0000        	call	_CLK_ClockSwitchConfig
2791  0060 85            	popw	x
2792                     ; 59 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
2794  0061 5f            	clrw	x
2795  0062 cd0000        	call	_CLK_PeripheralClockConfig
2797                     ; 60 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
2799  0065 ae0100        	ldw	x,#256
2800  0068 cd0000        	call	_CLK_PeripheralClockConfig
2802                     ; 61 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
2804  006b ae1301        	ldw	x,#4865
2805  006e cd0000        	call	_CLK_PeripheralClockConfig
2807                     ; 62 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
2809  0071 ae1200        	ldw	x,#4608
2810  0074 cd0000        	call	_CLK_PeripheralClockConfig
2812                     ; 63 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
2814  0077 ae0300        	ldw	x,#768
2815  007a cd0000        	call	_CLK_PeripheralClockConfig
2817                     ; 64 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
2819  007d ae0701        	ldw	x,#1793
2820  0080 cd0000        	call	_CLK_PeripheralClockConfig
2822                     ; 65 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
2824  0083 ae0501        	ldw	x,#1281
2825  0086 cd0000        	call	_CLK_PeripheralClockConfig
2827                     ; 66 }
2830  0089 81            	ret
2873                     ; 69 void Delay_ms(uint16_t ms)
2873                     ; 70 {
2874                     	switch	.text
2875  008a               _Delay_ms:
2877  008a 89            	pushw	x
2878  008b 5204          	subw	sp,#4
2879       00000004      OFST:	set	4
2882                     ; 73 	for (i = 0; i < (8 * 10) * ms; i++); // Começando com um fator de 80
2884  008d ae0000        	ldw	x,#0
2885  0090 1f03          	ldw	(OFST-1,sp),x
2886  0092 ae0000        	ldw	x,#0
2887  0095 1f01          	ldw	(OFST-3,sp),x
2890  0097 2009          	jra	L1571
2891  0099               L5471:
2895  0099 96            	ldw	x,sp
2896  009a 1c0001        	addw	x,#OFST-3
2897  009d a601          	ld	a,#1
2898  009f cd0000        	call	c_lgadc
2901  00a2               L1571:
2904  00a2 1e05          	ldw	x,(OFST+1,sp)
2905  00a4 a650          	ld	a,#80
2906  00a6 cd0000        	call	c_bmulx
2908  00a9 cd0000        	call	c_uitolx
2910  00ac 96            	ldw	x,sp
2911  00ad 1c0001        	addw	x,#OFST-3
2912  00b0 cd0000        	call	c_lcmp
2914  00b3 22e4          	jrugt	L5471
2915                     ; 74 }
2918  00b5 5b06          	addw	sp,#6
2919  00b7 81            	ret
2932                     	xdef	_main
2933                     	xdef	_Delay_ms
2934                     	xdef	_InitCLOCK
2935                     	xdef	_InitGPIO
2936                     	xref	_GPIO_WriteLow
2937                     	xref	_GPIO_WriteHigh
2938                     	xref	_GPIO_Init
2939                     	xref	_CLK_GetFlagStatus
2940                     	xref	_CLK_SYSCLKConfig
2941                     	xref	_CLK_HSIPrescalerConfig
2942                     	xref	_CLK_ClockSwitchConfig
2943                     	xref	_CLK_PeripheralClockConfig
2944                     	xref	_CLK_ClockSwitchCmd
2945                     	xref	_CLK_LSICmd
2946                     	xref	_CLK_HSICmd
2947                     	xref	_CLK_HSECmd
2948                     	xref	_CLK_DeInit
2949                     	xref.b	c_x
2968                     	xref	c_lcmp
2969                     	xref	c_uitolx
2970                     	xref	c_bmulx
2971                     	xref	c_lgadc
2972                     	end
