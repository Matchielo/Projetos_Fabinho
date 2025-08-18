   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
2588                     	bsct
2589  0000               _HT_StateRegister:
2590  0000 03            	dc.b	3
2591  0001               _HT_TimeCounter:
2592  0001 00            	dc.b	0
2593  0002               _RF_Blocker:
2594  0002 0000          	dc.w	0
2595  0004               _HT_RC_Code_Ready:
2596  0004 00            	dc.b	0
2597  0005               _HT_RC_Code_Ready_Overwrite:
2598  0005 00            	dc.b	0
2599  0006               _HCS_RC_Code_Ready_Overwrite:
2600  0006 00            	dc.b	0
2601  0007               _Code_Ready:
2602  0007 00            	dc.b	0
2641                     ; 72 void Read_RF_6P20(void)																		/*!< Call every 50us Int Timer 4 */
2641                     ; 73 {
2643                     	switch	.text
2644  0000               _Read_RF_6P20:
2648                     ; 76 	if ((HT_RC_Code_Ready_Overwrite)||(HCS_RC_Code_Ready_Overwrite)) return;
2650  0000 3d05          	tnz	_HT_RC_Code_Ready_Overwrite
2651  0002 2604          	jrne	L3071
2653  0004 3d06          	tnz	_HCS_RC_Code_Ready_Overwrite
2654  0006 2701          	jreq	L1071
2655  0008               L3071:
2659  0008 81            	ret
2660  0009               L1071:
2661                     ; 77 	if (Code_Ready == TRUE) return;
2663  0009 b607          	ld	a,_Code_Ready
2664  000b a101          	cp	a,#1
2665  000d 2601          	jrne	L5071
2669  000f 81            	ret
2670  0010               L5071:
2671                     ; 79 	RF_SampleBit=0;
2673  0010 3f01          	clr	_RF_SampleBit
2674                     ; 81 	if(rf_read){
2676  0012 4b02          	push	#2
2677  0014 ae5000        	ldw	x,#20480
2678  0017 cd0000        	call	_GPIO_ReadInputPin
2680  001a 5b01          	addw	sp,#1
2681  001c 4d            	tnz	a
2682  001d 2702          	jreq	L7071
2683                     ; 82 	RF_SampleBit++; //if(IN_RF_DATA) RF_SampleBit++; //*!< sampling RF pin verify
2685  001f 3c01          	inc	_RF_SampleBit
2686  0021               L7071:
2687                     ; 85 	switch(HT_StateRegister)
2689  0021 b600          	ld	a,_HT_StateRegister
2691                     ; 94 			break;
2692  0023 4a            	dec	a
2693  0024 270a          	jreq	L3561
2694  0026 4a            	dec	a
2695  0027 270b          	jreq	L5561
2696  0029 4a            	dec	a
2697  002a 270c          	jreq	L7561
2698  002c               L1661:
2699                     ; 93 		default: HT_ReceptionStart();				//!< Start Reception 
2701  002c ad0d          	call	_HT_ReceptionStart
2703                     ; 94 			break;
2705  002e 200a          	jra	L3171
2706  0030               L3561:
2707                     ; 87 		case 1:  HT_FallingEdge();					//!< Search Falling :::....Edge 
2709  0030 ad2f          	call	_HT_FallingEdge
2711                     ; 88 			break;
2713  0032 2006          	jra	L3171
2714  0034               L5561:
2715                     ; 89 		case 2:  HT_RisingEdge();						//!< Search Rising ....::: Edge 
2717  0034 ad53          	call	_HT_RisingEdge
2719                     ; 90 			break;
2721  0036 2002          	jra	L3171
2722  0038               L7561:
2723                     ; 91 		case 3:  HT_SearchPilot();					//!< Search Pilot Preriod 
2725  0038 ad08          	call	_HT_SearchPilot
2727                     ; 92 			break;
2729  003a               L3171:
2730                     ; 96 }
2733  003a 81            	ret
2758                     ; 100 void HT_ReceptionStart(void)
2758                     ; 101 {	
2759                     	switch	.text
2760  003b               _HT_ReceptionStart:
2764                     ; 102 	HT_StateRegister	= 3;
2766  003b 35030000      	mov	_HT_StateRegister,#3
2767                     ; 103 	HT_TimeCounter		= 0;
2769  003f 3f01          	clr	_HT_TimeCounter
2770                     ; 104 }
2773  0041 81            	ret
2803                     ; 107 void HT_SearchPilot(void)
2803                     ; 108 {
2804                     	switch	.text
2805  0042               _HT_SearchPilot:
2809                     ; 109 	if (RF_SampleBit)											// Detects Level 1 / Detecta Nivel 1
2811  0042 3d01          	tnz	_RF_SampleBit
2812  0044 2718          	jreq	L5371
2813                     ; 111 		if (HT_TimeCounter>HT_PILOT_MIN)	  // Yes, Check Time at 0 is Greater than Minimum Acceptable / 
2815  0046 b601          	ld	a,_HT_TimeCounter
2816  0048 a1a1          	cp	a,#161
2817  004a 250e          	jrult	L7371
2818                     ; 114 			HT_StateRegister = 1;								// Sim, vai proximo Estado
2820  004c 35010000      	mov	_HT_StateRegister,#1
2821                     ; 115 			HT_TimeCounter = 0;
2823  0050 3f01          	clr	_HT_TimeCounter
2824                     ; 116 			HT_BitCounter = 0;
2826  0052 3f03          	clr	_HT_BitCounter
2827                     ; 117 			HT_Pointer = 0;
2829  0054 3f04          	clr	_HT_Pointer
2830                     ; 118 			HT_Buffer[3] = 0;
2832  0056 3f08          	clr	_HT_Buffer+3
2834  0058 2006          	jra	L3471
2835  005a               L7371:
2836                     ; 120 		else  HT_ReceptionStart();					// No, Underflow.
2838  005a addf          	call	_HT_ReceptionStart
2840  005c 2002          	jra	L3471
2841  005e               L5371:
2842                     ; 122 	else if (++HT_TimeCounter > HT_PILOT_MAX) HT_ReceptionStart(); // HT_TimeCounter--;
2844  005e 3c01          	inc	_HT_TimeCounter
2846  0060               L3471:
2847                     ; 123 }
2850  0060 81            	ret
2879                     ; 126 void HT_FallingEdge(void)
2879                     ; 127 {		// Borda Descida;
2880                     	switch	.text
2881  0061               _HT_FallingEdge:
2885                     ; 128 	if (!RF_SampleBit)
2887  0061 3d01          	tnz	_RF_SampleBit
2888  0063 2619          	jrne	L7571
2889                     ; 130 		if (HT_TimeCounter<HT_BIT_MIN)
2891  0065 b601          	ld	a,_HT_TimeCounter
2892  0067 a106          	cp	a,#6
2893  0069 2403          	jruge	L1671
2894                     ; 132 			HT_ReceptionStart();	// Underflow.
2896  006b adce          	call	_HT_ReceptionStart
2898                     ; 133 			return;
2901  006d 81            	ret
2902  006e               L1671:
2903                     ; 135 		if(!HT_BitCounter)
2905  006e 3d03          	tnz	_HT_BitCounter
2906  0070 2606          	jrne	L3671
2907                     ; 136 			HT_BitTime = (HT_TimeCounter+3);	//(HT_TimeCounter+3);
2909  0072 b601          	ld	a,_HT_TimeCounter
2910  0074 ab03          	add	a,#3
2911  0076 b702          	ld	_HT_BitTime,a
2912  0078               L3671:
2913                     ; 137 		HT_TimeCounter = 0;
2915  0078 3f01          	clr	_HT_TimeCounter
2916                     ; 138 		HT_StateRegister++;							// Proxima etapa.
2918  007a 3c00          	inc	_HT_StateRegister
2920  007c 200a          	jra	L5671
2921  007e               L7571:
2922                     ; 140 	else if(++HT_TimeCounter>HT_BIT_MAX) HT_ReceptionStart();	// Overflow.
2924  007e 3c01          	inc	_HT_TimeCounter
2925  0080 b601          	ld	a,_HT_TimeCounter
2926  0082 a11a          	cp	a,#26
2927  0084 2502          	jrult	L5671
2930  0086 adb3          	call	_HT_ReceptionStart
2932  0088               L5671:
2933                     ; 141 }
2936  0088 81            	ret
2973                     ; 144 void HT_RisingEdge(void)
2973                     ; 145 {		// Borda Subida;
2974                     	switch	.text
2975  0089               _HT_RisingEdge:
2979                     ; 146 	if (RF_SampleBit)
2981  0089 3d01          	tnz	_RF_SampleBit
2982  008b 2772          	jreq	L1002
2983                     ; 148 		if (HT_TimeCounter<HT_BIT_MIN)
2985  008d b601          	ld	a,_HT_TimeCounter
2986  008f a106          	cp	a,#6
2987  0091 2403          	jruge	L3002
2988                     ; 150 			HT_ReceptionStart();													// Underflow ou overflow.
2990  0093 ada6          	call	_HT_ReceptionStart
2992                     ; 151 			return;
2995  0095 81            	ret
2996  0096               L3002:
2997                     ; 153 		RF_HTBitSave=0;
2999  0096 3f00          	clr	_RF_HTBitSave
3000                     ; 154 		if(HT_TimeCounter>HT_BitTime) RF_HTBitSave=1;
3002  0098 b601          	ld	a,_HT_TimeCounter
3003  009a b102          	cp	a,_HT_BitTime
3004  009c 2304          	jrule	L5002
3007  009e 35010000      	mov	_RF_HTBitSave,#1
3008  00a2               L5002:
3009                     ; 155 		HT_TimeCounter = 0;
3011  00a2 3f01          	clr	_HT_TimeCounter
3012                     ; 156 		HT_StateRegister--;
3014  00a4 3a00          	dec	_HT_StateRegister
3015                     ; 157 		HT_Buffer[HT_Pointer]<<= 1;              				// rotate 
3017  00a6 b604          	ld	a,_HT_Pointer
3018  00a8 5f            	clrw	x
3019  00a9 97            	ld	xl,a
3020  00aa 6805          	sll	(_HT_Buffer,x)
3021                     ; 158 		if (RF_HTBitSave)	HT_Buffer[HT_Pointer]+=0x01; 	// Adiciona 1.
3023  00ac 3d00          	tnz	_RF_HTBitSave
3024  00ae 2706          	jreq	L7002
3027  00b0 b604          	ld	a,_HT_Pointer
3028  00b2 5f            	clrw	x
3029  00b3 97            	ld	xl,a
3030  00b4 6c05          	inc	(_HT_Buffer,x)
3031  00b6               L7002:
3032                     ; 160 		if ((++HT_BitCounter&7)==0) HT_Pointer++;
3034  00b6 3c03          	inc	_HT_BitCounter
3035  00b8 b603          	ld	a,_HT_BitCounter
3036  00ba a507          	bcp	a,#7
3037  00bc 2602          	jrne	L1102
3040  00be 3c04          	inc	_HT_Pointer
3041  00c0               L1102:
3042                     ; 161 		if (HT_BitCounter==HT_BITS_TARGET)
3044  00c0 b603          	ld	a,_HT_BitCounter
3045  00c2 a11c          	cp	a,#28
3046  00c4 2644          	jrne	L3202
3047                     ; 163 			if(HT_Buffer[3]==0x05)			// Valida o 0101 do final do codigo HT6P20
3049  00c6 b608          	ld	a,_HT_Buffer+3
3050  00c8 a105          	cp	a,#5
3051  00ca 262e          	jrne	L5102
3052                     ; 165 				if (HT_RC_Code_Ready)
3054  00cc 3d04          	tnz	_HT_RC_Code_Ready
3055  00ce 2718          	jreq	L7102
3056                     ; 167 					HT_RC_Code_Ready = FALSE;
3058  00d0 3f04          	clr	_HT_RC_Code_Ready
3059                     ; 168 					HT_RC_Code_Ready_Overwrite = TRUE;
3061  00d2 35010005      	mov	_HT_RC_Code_Ready_Overwrite,#1
3062                     ; 169 					Code_Ready = TRUE;
3064  00d6 35010007      	mov	_Code_Ready,#1
3065                     ; 171 					RF_CopyBuffer[0] = HT_Buffer[0];
3067  00da 45050d        	mov	_RF_CopyBuffer,_HT_Buffer
3068                     ; 172 					RF_CopyBuffer[1] = HT_Buffer[1];
3070  00dd 45060e        	mov	_RF_CopyBuffer+1,_HT_Buffer+1
3071                     ; 173 					RF_CopyBuffer[2] = HT_Buffer[2];
3073  00e0 45070f        	mov	_RF_CopyBuffer+2,_HT_Buffer+2
3074                     ; 174 					RF_CopyBuffer[3] = HT_Buffer[3];
3076  00e3 450810        	mov	_RF_CopyBuffer+3,_HT_Buffer+3
3078  00e6 2012          	jra	L5102
3079  00e8               L7102:
3080                     ; 181 					HT_RC_Code_Ready_Overwrite = FALSE;
3082  00e8 3f05          	clr	_HT_RC_Code_Ready_Overwrite
3083                     ; 182 					HT_RC_Code_Ready = TRUE;
3085  00ea 35010004      	mov	_HT_RC_Code_Ready,#1
3086                     ; 183 					RF_OldBuffer[0] = HT_Buffer[0];
3088  00ee 450509        	mov	_RF_OldBuffer,_HT_Buffer
3089                     ; 184 					RF_OldBuffer[1] = HT_Buffer[1];
3091  00f1 45060a        	mov	_RF_OldBuffer+1,_HT_Buffer+1
3092                     ; 185 					RF_OldBuffer[2] = HT_Buffer[2];
3094  00f4 45070b        	mov	_RF_OldBuffer+2,_HT_Buffer+2
3095                     ; 186 					RF_OldBuffer[3] = HT_Buffer[3];
3097  00f7 45080c        	mov	_RF_OldBuffer+3,_HT_Buffer+3
3098  00fa               L5102:
3099                     ; 189 			HT_ReceptionStart();
3101  00fa cd003b        	call	_HT_ReceptionStart
3103  00fd 200b          	jra	L3202
3104  00ff               L1002:
3105                     ; 192 	else if(++HT_TimeCounter>HT_BIT_MAX) HT_ReceptionStart(); // HT_StateRegister=3;
3107  00ff 3c01          	inc	_HT_TimeCounter
3108  0101 b601          	ld	a,_HT_TimeCounter
3109  0103 a11a          	cp	a,#26
3110  0105 2503          	jrult	L3202
3113  0107 cd003b        	call	_HT_ReceptionStart
3115  010a               L3202:
3116                     ; 193 }
3119  010a 81            	ret
3298                     	xdef	_HCS_RC_Code_Ready_Overwrite
3299                     	switch	.ubsct
3300  0000               _RF_HTBitSave:
3301  0000 00            	ds.b	1
3302                     	xdef	_RF_HTBitSave
3303  0001               _RF_SampleBit:
3304  0001 00            	ds.b	1
3305                     	xdef	_RF_SampleBit
3306                     	xdef	_RF_Blocker
3307  0002               _HT_BitTime:
3308  0002 00            	ds.b	1
3309                     	xdef	_HT_BitTime
3310  0003               _HT_BitCounter:
3311  0003 00            	ds.b	1
3312                     	xdef	_HT_BitCounter
3313  0004               _HT_Pointer:
3314  0004 00            	ds.b	1
3315                     	xdef	_HT_Pointer
3316                     	xdef	_HT_TimeCounter
3317                     	xdef	_HT_StateRegister
3318                     	xdef	_HT_RisingEdge
3319                     	xdef	_HT_FallingEdge
3320                     	xdef	_HT_SearchPilot
3321                     	xdef	_HT_ReceptionStart
3322                     	xdef	_Read_RF_6P20
3323                     	xdef	_Code_Ready
3324                     	xdef	_HT_RC_Code_Ready_Overwrite
3325                     	xdef	_HT_RC_Code_Ready
3326  0005               _HT_Buffer:
3327  0005 00000000      	ds.b	4
3328                     	xdef	_HT_Buffer
3329  0009               _RF_OldBuffer:
3330  0009 00000000      	ds.b	4
3331                     	xdef	_RF_OldBuffer
3332  000d               _RF_CopyBuffer:
3333  000d 00000000      	ds.b	4
3334                     	xdef	_RF_CopyBuffer
3335                     	xref	_GPIO_ReadInputPin
3355                     	end
