   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2615                     ; 38 main()
2615                     ; 39 {
2617                     	switch	.text
2618  0000               _main:
2622  0000               L1761:
2623                     ; 40 	while (1);
2625  0000 20fe          	jra	L1761
2649                     ; 44 void InitGPIO(void)
2649                     ; 45 {
2650                     	switch	.text
2651  0002               _InitGPIO:
2655                     ; 46 	GPIO_Init(SEG_A_PORT, SEG_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2657  0002 4be0          	push	#224
2658  0004 4b40          	push	#64
2659  0006 ae500a        	ldw	x,#20490
2660  0009 cd0000        	call	_GPIO_Init
2662  000c 85            	popw	x
2663                     ; 47 	GPIO_Init(SEG_B_PORT, SEG_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2665  000d 4be0          	push	#224
2666  000f 4b80          	push	#128
2667  0011 ae500a        	ldw	x,#20490
2668  0014 cd0000        	call	_GPIO_Init
2670  0017 85            	popw	x
2671                     ; 48 	GPIO_Init(SEG_C_PORT, SEG_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2673  0018 4be0          	push	#224
2674  001a 4b01          	push	#1
2675  001c ae500f        	ldw	x,#20495
2676  001f cd0000        	call	_GPIO_Init
2678  0022 85            	popw	x
2679                     ; 49 	GPIO_Init(SEG_D_PORT, SEG_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2681  0023 4be0          	push	#224
2682  0025 4b02          	push	#2
2683  0027 ae500f        	ldw	x,#20495
2684  002a cd0000        	call	_GPIO_Init
2686  002d 85            	popw	x
2687                     ; 50 	GPIO_Init(SEG_E_PORT, SEG_E_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2689  002e 4be0          	push	#224
2690  0030 4b04          	push	#4
2691  0032 ae500f        	ldw	x,#20495
2692  0035 cd0000        	call	_GPIO_Init
2694  0038 85            	popw	x
2695                     ; 51 	GPIO_Init(SEG_F_PORT, SEG_F_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2697  0039 4be0          	push	#224
2698  003b 4b08          	push	#8
2699  003d ae500f        	ldw	x,#20495
2700  0040 cd0000        	call	_GPIO_Init
2702  0043 85            	popw	x
2703                     ; 52 	GPIO_Init(SEG_G_PORT, SEG_G_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
2705  0044 4be0          	push	#224
2706  0046 4b10          	push	#16
2707  0048 ae500f        	ldw	x,#20495
2708  004b cd0000        	call	_GPIO_Init
2710  004e 85            	popw	x
2711                     ; 53 }
2714  004f 81            	ret
2757                     ; 55 void Delay_ms(uint16_t ms)
2757                     ; 56 {
2758                     	switch	.text
2759  0050               _Delay_ms:
2761  0050 89            	pushw	x
2762  0051 5204          	subw	sp,#4
2763       00000004      OFST:	set	4
2766                     ; 58 	for (i = 0; i < (16000UL / 1000UL) * ms; i++);
2768  0053 ae0000        	ldw	x,#0
2769  0056 1f03          	ldw	(OFST-1,sp),x
2770  0058 ae0000        	ldw	x,#0
2771  005b 1f01          	ldw	(OFST-3,sp),x
2774  005d 2009          	jra	L3371
2775  005f               L7271:
2779  005f 96            	ldw	x,sp
2780  0060 1c0001        	addw	x,#OFST-3
2781  0063 a601          	ld	a,#1
2782  0065 cd0000        	call	c_lgadc
2785  0068               L3371:
2788  0068 1e05          	ldw	x,(OFST+1,sp)
2789  006a a610          	ld	a,#16
2790  006c cd0000        	call	c_cmulx
2792  006f 96            	ldw	x,sp
2793  0070 1c0001        	addw	x,#OFST-3
2794  0073 cd0000        	call	c_lcmp
2796  0076 22e7          	jrugt	L7271
2797                     ; 59 }
2800  0078 5b06          	addw	sp,#6
2801  007a 81            	ret
2834                     ; 62 void InitCLOCK(void)
2834                     ; 63 {
2835                     	switch	.text
2836  007b               _InitCLOCK:
2840                     ; 64     CLK_DeInit(); // Reseta a configuração de clock para o padrão
2842  007b cd0000        	call	_CLK_DeInit
2844                     ; 66     CLK_HSECmd(DISABLE);  // Desativa o oscilador externo
2846  007e 4f            	clr	a
2847  007f cd0000        	call	_CLK_HSECmd
2849                     ; 67     CLK_LSICmd(DISABLE);  // Desativa o clock lento interno
2851  0082 4f            	clr	a
2852  0083 cd0000        	call	_CLK_LSICmd
2854                     ; 68     CLK_HSICmd(ENABLE);   // Ativa o oscilador interno de alta velocidade (HSI = 16 MHz)
2856  0086 a601          	ld	a,#1
2857  0088 cd0000        	call	_CLK_HSICmd
2860  008b               L1571:
2861                     ; 71     while (CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
2863  008b ae0102        	ldw	x,#258
2864  008e cd0000        	call	_CLK_GetFlagStatus
2866  0091 4d            	tnz	a
2867  0092 27f7          	jreq	L1571
2868                     ; 73     CLK_ClockSwitchCmd(ENABLE);                      // Habilita a troca de clock automática
2870  0094 a601          	ld	a,#1
2871  0096 cd0000        	call	_CLK_ClockSwitchCmd
2873                     ; 74     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   // Prescaler HSI = 1 (clock total)
2875  0099 4f            	clr	a
2876  009a cd0000        	call	_CLK_HSIPrescalerConfig
2878                     ; 75     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);         // Prescaler CPU = 1 (clock total)
2880  009d a680          	ld	a,#128
2881  009f cd0000        	call	_CLK_SYSCLKConfig
2883                     ; 78     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_ENABLE);
2885  00a2 4b01          	push	#1
2886  00a4 4b00          	push	#0
2887  00a6 ae01e1        	ldw	x,#481
2888  00a9 cd0000        	call	_CLK_ClockSwitchConfig
2890  00ac 85            	popw	x
2891                     ; 81     CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
2893  00ad 5f            	clrw	x
2894  00ae cd0000        	call	_CLK_PeripheralClockConfig
2896                     ; 82     CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
2898  00b1 ae0100        	ldw	x,#256
2899  00b4 cd0000        	call	_CLK_PeripheralClockConfig
2901                     ; 83     CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE); // Desativado, se não usar. Se usar, habilite.
2903  00b7 ae1300        	ldw	x,#4864
2904  00ba cd0000        	call	_CLK_PeripheralClockConfig
2906                     ; 84     CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
2908  00bd ae1200        	ldw	x,#4608
2909  00c0 cd0000        	call	_CLK_PeripheralClockConfig
2911                     ; 85     CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, DISABLE);
2913  00c3 ae0300        	ldw	x,#768
2914  00c6 cd0000        	call	_CLK_PeripheralClockConfig
2916                     ; 86     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, DISABLE);
2918  00c9 ae0700        	ldw	x,#1792
2919  00cc cd0000        	call	_CLK_PeripheralClockConfig
2921                     ; 87     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, DISABLE);
2923  00cf ae0500        	ldw	x,#1280
2924  00d2 cd0000        	call	_CLK_PeripheralClockConfig
2926                     ; 88 }
2929  00d5 81            	ret
2942                     	xdef	_main
2943                     	xdef	_InitCLOCK
2944                     	xdef	_Delay_ms
2945                     	xdef	_InitGPIO
2946                     	xref	_GPIO_Init
2947                     	xref	_CLK_GetFlagStatus
2948                     	xref	_CLK_SYSCLKConfig
2949                     	xref	_CLK_HSIPrescalerConfig
2950                     	xref	_CLK_ClockSwitchConfig
2951                     	xref	_CLK_PeripheralClockConfig
2952                     	xref	_CLK_ClockSwitchCmd
2953                     	xref	_CLK_LSICmd
2954                     	xref	_CLK_HSICmd
2955                     	xref	_CLK_HSECmd
2956                     	xref	_CLK_DeInit
2975                     	xref	c_lcmp
2976                     	xref	c_cmulx
2977                     	xref	c_lgadc
2978                     	end
