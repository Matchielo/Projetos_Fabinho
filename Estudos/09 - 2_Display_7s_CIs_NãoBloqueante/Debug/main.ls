   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2615                     ; 58 main()
2615                     ; 59 {
2617                     	switch	.text
2618  0000               _main:
2622  0000               L1761:
2623                     ; 60 	while (1);
2625  0000 20fe          	jra	L1761
2649                     ; 64 uint8_t ReadButton_Pause(void)
2649                     ; 65 {
2650                     	switch	.text
2651  0002               _ReadButton_Pause:
2655                     ; 66 	return (GPIO_ReadInputPin(BOT_PAUSE_PORT, BOT_PAUSE_PIN) == RESET);
2657  0002 4b40          	push	#64
2658  0004 ae500a        	ldw	x,#20490
2659  0007 cd0000        	call	_GPIO_ReadInputPin
2661  000a 5b01          	addw	sp,#1
2662  000c 4d            	tnz	a
2663  000d 2604          	jrne	L01
2664  000f a601          	ld	a,#1
2665  0011 2001          	jra	L21
2666  0013               L01:
2667  0013 4f            	clr	a
2668  0014               L21:
2671  0014 81            	ret
2695                     ; 68 uint8_t ReadButton_14s(void)
2695                     ; 69 {
2696                     	switch	.text
2697  0015               _ReadButton_14s:
2701                     ; 70 	return (GPIO_ReadInputPin(BOT_14S_PORT, BOT_14S_PIN) == RESET);
2703  0015 4b04          	push	#4
2704  0017 ae500f        	ldw	x,#20495
2705  001a cd0000        	call	_GPIO_ReadInputPin
2707  001d 5b01          	addw	sp,#1
2708  001f 4d            	tnz	a
2709  0020 2604          	jrne	L61
2710  0022 a601          	ld	a,#1
2711  0024 2001          	jra	L02
2712  0026               L61:
2713  0026 4f            	clr	a
2714  0027               L02:
2717  0027 81            	ret
2741                     ; 72 uint8_t ReadButton_24s(void)
2741                     ; 73 {
2742                     	switch	.text
2743  0028               _ReadButton_24s:
2747                     ; 74 	return (GPIO_ReadInputPin(BOT_24S_PORT, BOT_24S_PIN) == RESET);
2749  0028 4b08          	push	#8
2750  002a ae500f        	ldw	x,#20495
2751  002d cd0000        	call	_GPIO_ReadInputPin
2753  0030 5b01          	addw	sp,#1
2754  0032 4d            	tnz	a
2755  0033 2604          	jrne	L42
2756  0035 a601          	ld	a,#1
2757  0037 2001          	jra	L62
2758  0039               L42:
2759  0039 4f            	clr	a
2760  003a               L62:
2763  003a 81            	ret
2787                     ; 78 void InitGPIO (void)
2787                     ; 79 {
2788                     	switch	.text
2789  003b               _InitGPIO:
2793                     ; 81 	GPIO_Init(BCD_A_PORT, BCD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2795  003b 4be0          	push	#224
2796  003d 4b01          	push	#1
2797  003f ae5005        	ldw	x,#20485
2798  0042 cd0000        	call	_GPIO_Init
2800  0045 85            	popw	x
2801                     ; 82 	GPIO_Init(BCD_B_PORT, BCD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2803  0046 4be0          	push	#224
2804  0048 4b02          	push	#2
2805  004a ae5005        	ldw	x,#20485
2806  004d cd0000        	call	_GPIO_Init
2808  0050 85            	popw	x
2809                     ; 83 	GPIO_Init(BCD_C_PORT, BCD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2811  0051 4be0          	push	#224
2812  0053 4b04          	push	#4
2813  0055 ae5005        	ldw	x,#20485
2814  0058 cd0000        	call	_GPIO_Init
2816  005b 85            	popw	x
2817                     ; 84 	GPIO_Init(BCD_D_PORT, BCD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2819  005c 4be0          	push	#224
2820  005e 4b08          	push	#8
2821  0060 ae5005        	ldw	x,#20485
2822  0063 cd0000        	call	_GPIO_Init
2824  0066 85            	popw	x
2825                     ; 87 	GPIO_Init(LE_01_PORT, LE_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2827  0067 4be0          	push	#224
2828  0069 4b04          	push	#4
2829  006b ae500a        	ldw	x,#20490
2830  006e cd0000        	call	_GPIO_Init
2832  0071 85            	popw	x
2833                     ; 88 	GPIO_Init(LE_02_PORT, LE_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2835  0072 4be0          	push	#224
2836  0074 4b02          	push	#2
2837  0076 ae500a        	ldw	x,#20490
2838  0079 cd0000        	call	_GPIO_Init
2840  007c 85            	popw	x
2841                     ; 91 	GPIO_Init(BOT_PAUSE_PORT, BOT_PAUSE_PIN, GPIO_MODE_IN_PU_NO_IT);
2843  007d 4b40          	push	#64
2844  007f 4b40          	push	#64
2845  0081 ae500a        	ldw	x,#20490
2846  0084 cd0000        	call	_GPIO_Init
2848  0087 85            	popw	x
2849                     ; 92 	GPIO_Init(BOT_14S_PORT, BOT_14S_PIN, GPIO_MODE_IN_PU_NO_IT);
2851  0088 4b40          	push	#64
2852  008a 4b04          	push	#4
2853  008c ae500f        	ldw	x,#20495
2854  008f cd0000        	call	_GPIO_Init
2856  0092 85            	popw	x
2857                     ; 93 	GPIO_Init(BOT_24S_PORT, BOT_24S_PIN, GPIO_MODE_IN_PU_NO_IT);
2859  0093 4b40          	push	#64
2860  0095 4b08          	push	#8
2861  0097 ae500f        	ldw	x,#20495
2862  009a cd0000        	call	_GPIO_Init
2864  009d 85            	popw	x
2865                     ; 96 	GPIO_Init(BUZZER_PORT, BUZZER_PIN, GPIO_MODE_OUT_PP_LOW_FAST);	
2867  009e 4be0          	push	#224
2868  00a0 4b01          	push	#1
2869  00a2 ae500f        	ldw	x,#20495
2870  00a5 cd0000        	call	_GPIO_Init
2872  00a8 85            	popw	x
2873                     ; 97 }
2876  00a9 81            	ret
2909                     ; 100 void InitCLOCK(void)
2909                     ; 101 {
2910                     	switch	.text
2911  00aa               _InitCLOCK:
2915                     ; 102 	CLK_DeInit();
2917  00aa cd0000        	call	_CLK_DeInit
2919                     ; 103 	CLK_HSECmd(DISABLE);
2921  00ad 4f            	clr	a
2922  00ae cd0000        	call	_CLK_HSECmd
2924                     ; 104 	CLK_LSICmd(DISABLE);
2926  00b1 4f            	clr	a
2927  00b2 cd0000        	call	_CLK_LSICmd
2929                     ; 105 	CLK_HSICmd(ENABLE);
2931  00b5 a601          	ld	a,#1
2932  00b7 cd0000        	call	_CLK_HSICmd
2935  00ba               L7471:
2936                     ; 107 	while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
2938  00ba ae0102        	ldw	x,#258
2939  00bd cd0000        	call	_CLK_GetFlagStatus
2941  00c0 4d            	tnz	a
2942  00c1 27f7          	jreq	L7471
2943                     ; 109 	CLK_ClockSwitchCmd(ENABLE);
2945  00c3 a601          	ld	a,#1
2946  00c5 cd0000        	call	_CLK_ClockSwitchCmd
2948                     ; 110 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
2950  00c8 4f            	clr	a
2951  00c9 cd0000        	call	_CLK_HSIPrescalerConfig
2953                     ; 111 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
2955  00cc a680          	ld	a,#128
2956  00ce cd0000        	call	_CLK_SYSCLKConfig
2958                     ; 112 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
2960  00d1 4b01          	push	#1
2961  00d3 4b00          	push	#0
2962  00d5 ae01e1        	ldw	x,#481
2963  00d8 cd0000        	call	_CLK_ClockSwitchConfig
2965  00db 85            	popw	x
2966                     ; 114 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
2968  00dc 5f            	clrw	x
2969  00dd cd0000        	call	_CLK_PeripheralClockConfig
2971                     ; 115 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
2973  00e0 ae0100        	ldw	x,#256
2974  00e3 cd0000        	call	_CLK_PeripheralClockConfig
2976                     ; 116 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
2978  00e6 ae1300        	ldw	x,#4864
2979  00e9 cd0000        	call	_CLK_PeripheralClockConfig
2981                     ; 117 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
2983  00ec ae1200        	ldw	x,#4608
2984  00ef cd0000        	call	_CLK_PeripheralClockConfig
2986                     ; 118 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
2988  00f2 ae0300        	ldw	x,#768
2989  00f5 cd0000        	call	_CLK_PeripheralClockConfig
2991                     ; 119 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
2993  00f8 ae0700        	ldw	x,#1792
2994  00fb cd0000        	call	_CLK_PeripheralClockConfig
2996                     ; 120 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
2998  00fe ae0401        	ldw	x,#1025
2999  0101 cd0000        	call	_CLK_PeripheralClockConfig
3001                     ; 121 }
3004  0104 81            	ret
3032                     ; 125 void InitTIM4(void)
3032                     ; 126 {
3033                     	switch	.text
3034  0105               _InitTIM4:
3038                     ; 127 	TIM4_PrescalerConfig(TIM4_PRESCALER_128, TIM4_PSCRELOADMODE_IMMEDIATE);
3040  0105 ae0701        	ldw	x,#1793
3041  0108 cd0000        	call	_TIM4_PrescalerConfig
3043                     ; 128 	TIM4_SetAutoreload(124);
3045  010b a67c          	ld	a,#124
3046  010d cd0000        	call	_TIM4_SetAutoreload
3048                     ; 129 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
3050  0110 a601          	ld	a,#1
3051  0112 cd0000        	call	_TIM4_ClearFlag
3053                     ; 130 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
3055  0115 ae0101        	ldw	x,#257
3056  0118 cd0000        	call	_TIM4_ITConfig
3058                     ; 131 	TIM4_Cmd(ENABLE);
3060  011b a601          	ld	a,#1
3061  011d cd0000        	call	_TIM4_Cmd
3063                     ; 132 }
3066  0120 81            	ret
3103                     ; 136 void Delay_ms_timer(uint16_t ms)
3103                     ; 137 {
3104                     	switch	.text
3105  0121               _Delay_ms_timer:
3107  0121 89            	pushw	x
3108       00000000      OFST:	set	0
3111  0122 2011          	jra	L3002
3112  0124               L1002:
3113                     ; 140 		TIM4_SetCounter(0);
3115  0124 4f            	clr	a
3116  0125 cd0000        	call	_TIM4_SetCounter
3118                     ; 141 		TIM4_ClearFlag(TIM4_FLAG_UPDATE);
3120  0128 a601          	ld	a,#1
3121  012a cd0000        	call	_TIM4_ClearFlag
3124  012d               L1102:
3125                     ; 142 		while(TIM4_GetFlagStatus(TIM4_FLAG_UPDATE)==RESET);
3127  012d a601          	ld	a,#1
3128  012f cd0000        	call	_TIM4_GetFlagStatus
3130  0132 4d            	tnz	a
3131  0133 27f8          	jreq	L1102
3132  0135               L3002:
3133                     ; 138 	while(ms--)
3135  0135 1e01          	ldw	x,(OFST+1,sp)
3136  0137 1d0001        	subw	x,#1
3137  013a 1f01          	ldw	(OFST+1,sp),x
3138  013c 1c0001        	addw	x,#1
3139  013f a30000        	cpw	x,#0
3140  0142 26e0          	jrne	L1002
3141                     ; 144 }
3144  0144 85            	popw	x
3145  0145 81            	ret
3158                     	xdef	_main
3159                     	xdef	_ReadButton_24s
3160                     	xdef	_ReadButton_14s
3161                     	xdef	_ReadButton_Pause
3162                     	xdef	_InitTIM4
3163                     	xdef	_Delay_ms_timer
3164                     	xdef	_InitGPIO
3165                     	xdef	_InitCLOCK
3166                     	xref	_TIM4_ClearFlag
3167                     	xref	_TIM4_GetFlagStatus
3168                     	xref	_TIM4_SetAutoreload
3169                     	xref	_TIM4_SetCounter
3170                     	xref	_TIM4_PrescalerConfig
3171                     	xref	_TIM4_ITConfig
3172                     	xref	_TIM4_Cmd
3173                     	xref	_GPIO_ReadInputPin
3174                     	xref	_GPIO_Init
3175                     	xref	_CLK_GetFlagStatus
3176                     	xref	_CLK_SYSCLKConfig
3177                     	xref	_CLK_HSIPrescalerConfig
3178                     	xref	_CLK_ClockSwitchConfig
3179                     	xref	_CLK_PeripheralClockConfig
3180                     	xref	_CLK_ClockSwitchCmd
3181                     	xref	_CLK_LSICmd
3182                     	xref	_CLK_HSICmd
3183                     	xref	_CLK_HSECmd
3184                     	xref	_CLK_DeInit
3203                     	end
