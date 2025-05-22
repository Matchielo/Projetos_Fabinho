   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2620                     ; 22 void main(void)
2620                     ; 23 {
2622                     	switch	.text
2623  0000               _main:
2627                     ; 24     InitCLOCK();
2629  0000 ad47          	call	_InitCLOCK
2631                     ; 25     InitGPIO();
2633  0002 ad1b          	call	_InitGPIO
2635  0004               L1761:
2636                     ; 29         if (ReadButton()) {
2638  0004 ad30          	call	_ReadButton
2640  0006 4d            	tnz	a
2641  0007 270b          	jreq	L5761
2642                     ; 31             GPIO_WriteHigh(LED_PORT, LED_PIN);
2644  0009 4b20          	push	#32
2645  000b ae5014        	ldw	x,#20500
2646  000e cd0000        	call	_GPIO_WriteHigh
2648  0011 84            	pop	a
2650  0012 20f0          	jra	L1761
2651  0014               L5761:
2652                     ; 34             GPIO_WriteLow(LED_PORT, LED_PIN);
2654  0014 4b20          	push	#32
2655  0016 ae5014        	ldw	x,#20500
2656  0019 cd0000        	call	_GPIO_WriteLow
2658  001c 84            	pop	a
2659  001d 20e5          	jra	L1761
2683                     ; 40 void InitGPIO(void)
2683                     ; 41 {
2684                     	switch	.text
2685  001f               _InitGPIO:
2689                     ; 43     GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2691  001f 4be0          	push	#224
2692  0021 4b20          	push	#32
2693  0023 ae5014        	ldw	x,#20500
2694  0026 cd0000        	call	_GPIO_Init
2696  0029 85            	popw	x
2697                     ; 46     GPIO_Init(INPUT_PORT, INPUT_PIN, GPIO_MODE_IN_PU_NO_IT);
2699  002a 4b40          	push	#64
2700  002c 4b08          	push	#8
2701  002e ae500a        	ldw	x,#20490
2702  0031 cd0000        	call	_GPIO_Init
2704  0034 85            	popw	x
2705                     ; 47 }
2708  0035 81            	ret
2732                     ; 50 uint8_t ReadButton(void)
2732                     ; 51 {
2733                     	switch	.text
2734  0036               _ReadButton:
2738                     ; 53     return (GPIO_ReadInputPin(INPUT_PORT, INPUT_PIN) == RESET);
2740  0036 4b08          	push	#8
2741  0038 ae500a        	ldw	x,#20490
2742  003b cd0000        	call	_GPIO_ReadInputPin
2744  003e 5b01          	addw	sp,#1
2745  0040 4d            	tnz	a
2746  0041 2604          	jrne	L21
2747  0043 a601          	ld	a,#1
2748  0045 2001          	jra	L41
2749  0047               L21:
2750  0047 4f            	clr	a
2751  0048               L41:
2754  0048 81            	ret
2787                     ; 57 void InitCLOCK(void)
2787                     ; 58 {
2788                     	switch	.text
2789  0049               _InitCLOCK:
2793                     ; 59     CLK_DeInit(); 
2795  0049 cd0000        	call	_CLK_DeInit
2797                     ; 61     CLK_HSECmd(DISABLE);
2799  004c 4f            	clr	a
2800  004d cd0000        	call	_CLK_HSECmd
2802                     ; 62     CLK_LSICmd(DISABLE);
2804  0050 4f            	clr	a
2805  0051 cd0000        	call	_CLK_LSICmd
2807                     ; 63     CLK_HSICmd(ENABLE);  // Clock interno de 16 MHz
2809  0054 a601          	ld	a,#1
2810  0056 cd0000        	call	_CLK_HSICmd
2813  0059               L3371:
2814                     ; 64     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
2816  0059 ae0102        	ldw	x,#258
2817  005c cd0000        	call	_CLK_GetFlagStatus
2819  005f 4d            	tnz	a
2820  0060 27f7          	jreq	L3371
2821                     ; 66     CLK_ClockSwitchCmd(ENABLE);
2823  0062 a601          	ld	a,#1
2824  0064 cd0000        	call	_CLK_ClockSwitchCmd
2826                     ; 67     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2828  0067 4f            	clr	a
2829  0068 cd0000        	call	_CLK_HSIPrescalerConfig
2831                     ; 68     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
2833  006b a680          	ld	a,#128
2834  006d cd0000        	call	_CLK_SYSCLKConfig
2836                     ; 70     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
2838  0070 4b01          	push	#1
2839  0072 4b00          	push	#0
2840  0074 ae01e1        	ldw	x,#481
2841  0077 cd0000        	call	_CLK_ClockSwitchConfig
2843  007a 85            	popw	x
2844                     ; 73     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
2846  007b 5f            	clrw	x
2847  007c cd0000        	call	_CLK_PeripheralClockConfig
2849                     ; 74     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
2851  007f ae0100        	ldw	x,#256
2852  0082 cd0000        	call	_CLK_PeripheralClockConfig
2854                     ; 75     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, ENABLE);
2856  0085 ae1301        	ldw	x,#4865
2857  0088 cd0000        	call	_CLK_PeripheralClockConfig
2859                     ; 76     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
2861  008b ae1200        	ldw	x,#4608
2862  008e cd0000        	call	_CLK_PeripheralClockConfig
2864                     ; 77     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
2866  0091 ae0300        	ldw	x,#768
2867  0094 cd0000        	call	_CLK_PeripheralClockConfig
2869                     ; 78     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
2871  0097 ae0701        	ldw	x,#1793
2872  009a cd0000        	call	_CLK_PeripheralClockConfig
2874                     ; 79     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
2876  009d ae0501        	ldw	x,#1281
2877  00a0 cd0000        	call	_CLK_PeripheralClockConfig
2879                     ; 80 }
2882  00a3 81            	ret
2895                     	xdef	_main
2896                     	xdef	_ReadButton
2897                     	xdef	_InitCLOCK
2898                     	xdef	_InitGPIO
2899                     	xref	_GPIO_ReadInputPin
2900                     	xref	_GPIO_WriteLow
2901                     	xref	_GPIO_WriteHigh
2902                     	xref	_GPIO_Init
2903                     	xref	_CLK_GetFlagStatus
2904                     	xref	_CLK_SYSCLKConfig
2905                     	xref	_CLK_HSIPrescalerConfig
2906                     	xref	_CLK_ClockSwitchConfig
2907                     	xref	_CLK_PeripheralClockConfig
2908                     	xref	_CLK_ClockSwitchCmd
2909                     	xref	_CLK_LSICmd
2910                     	xref	_CLK_HSICmd
2911                     	xref	_CLK_HSECmd
2912                     	xref	_CLK_DeInit
2931                     	end
