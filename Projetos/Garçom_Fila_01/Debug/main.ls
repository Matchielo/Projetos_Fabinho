   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  14                     	bsct
  15  0000               _g_system_ticks:
  16  0000 00000000      	dc.l	0
  17  0004               _g_contador_1:
  18  0004 00            	dc.b	0
  19  0005               _g_contador_2:
  20  0005 00            	dc.b	0
  21  0006               _g_display_1_atualizar:
  22  0006 01            	dc.b	1
  23  0007               _g_display_2_atualizar:
  24  0007 01            	dc.b	1
  59                     ; 103 void main(void)
  59                     ; 104 {
  61                     	switch	.text
  62  0000               _main:
  66                     ; 106     InitCLOCK();		// Configura o clock da CPU para 16MHz (do HSI interno)
  68  0000 ad71          	call	_InitCLOCK
  70                     ; 107     InitGPIO();			// Configura todos os pinos de Entrada (botões) e Saída (BCD, Latches)
  72  0002 ad0b          	call	_InitGPIO
  74                     ; 108 		setup_tim6();		// Configura e liga o TIM6 para gerar uma interrupção a cada 1ms
  76  0004 ad75          	call	_setup_tim6
  78                     ; 111     rim(); // enableInterrupts(); // "Request Interrupt Master"
  81  0006 9a            rim
  83  0007               L12:
  84                     ; 117 			GerenciarBotoes();
  86  0007 cd0105        	call	_GerenciarBotoes
  88                     ; 120 			AtualizarDisplays();
  90  000a cd01e6        	call	_AtualizarDisplays
  93  000d 20f8          	jra	L12
 117                     ; 128 void InitGPIO(void)
 117                     ; 129 {
 118                     	switch	.text
 119  000f               _InitGPIO:
 123                     ; 135 	GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_IN_FL_NO_IT); // RF
 125  000f 4b00          	push	#0
 126  0011 4b02          	push	#2
 127  0013 ae5000        	ldw	x,#20480
 128  0016 cd0000        	call	_GPIO_Init
 130  0019 85            	popw	x
 131                     ; 136 	GPIO_Init(GPIOB, GPIO_PIN_7, GPIO_MODE_IN_PU_NO_IT); // CH1
 133  001a 4b40          	push	#64
 134  001c 4b80          	push	#128
 135  001e ae5005        	ldw	x,#20485
 136  0021 cd0000        	call	_GPIO_Init
 138  0024 85            	popw	x
 139                     ; 137 	GPIO_Init(GPIOF, GPIO_PIN_4, GPIO_MODE_IN_PU_NO_IT); // CH2
 141  0025 4b40          	push	#64
 142  0027 4b10          	push	#16
 143  0029 ae5019        	ldw	x,#20505
 144  002c cd0000        	call	_GPIO_Init
 146  002f 85            	popw	x
 147                     ; 142 	GPIO_Init(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 149  0030 4be0          	push	#224
 150  0032 4b0f          	push	#15
 151  0034 ae5005        	ldw	x,#20485
 152  0037 cd0000        	call	_GPIO_Init
 154  003a 85            	popw	x
 155                     ; 145 	GPIO_Init(GPIOC, GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_HIGH_FAST);
 157  003b 4bf0          	push	#240
 158  003d 4bfe          	push	#254
 159  003f ae500a        	ldw	x,#20490
 160  0042 cd0000        	call	_GPIO_Init
 162  0045 85            	popw	x
 163                     ; 146 	GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST);
 165  0046 4bf0          	push	#240
 166  0048 4b20          	push	#32
 167  004a ae5014        	ldw	x,#20500
 168  004d cd0000        	call	_GPIO_Init
 170  0050 85            	popw	x
 171                     ; 150 	GPIO_Init(GPIOD, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2 | GPIO_PIN_3 | GPIO_PIN_4 | GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_FAST);
 173  0051 4be0          	push	#224
 174  0053 4bff          	push	#255
 175  0055 ae500f        	ldw	x,#20495
 176  0058 cd0000        	call	_GPIO_Init
 178  005b 85            	popw	x
 179                     ; 151 	GPIO_Init(GPIOA, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 181  005c 4be0          	push	#224
 182  005e 4b04          	push	#4
 183  0060 ae5000        	ldw	x,#20480
 184  0063 cd0000        	call	_GPIO_Init
 186  0066 85            	popw	x
 187                     ; 154 	GPIO_Init(GPIOA, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
 189  0067 4be0          	push	#224
 190  0069 4b08          	push	#8
 191  006b ae5000        	ldw	x,#20480
 192  006e cd0000        	call	_GPIO_Init
 194  0071 85            	popw	x
 195                     ; 155 }
 198  0072 81            	ret
 223                     ; 157 void InitCLOCK(void)
 223                     ; 158 {
 224                     	switch	.text
 225  0073               _InitCLOCK:
 229                     ; 160 	CLK_DeInit();
 231  0073 cd0000        	call	_CLK_DeInit
 233                     ; 164 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 235  0076 4f            	clr	a
 236  0077 cd0000        	call	_CLK_HSIPrescalerConfig
 238                     ; 165 }
 241  007a 81            	ret
 270                     ; 167 void setup_tim6(void)
 270                     ; 168 {
 271                     	switch	.text
 272  007b               _setup_tim6:
 276                     ; 170 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, ENABLE);
 278  007b ae0401        	ldw	x,#1025
 279  007e cd0000        	call	_CLK_PeripheralClockConfig
 281                     ; 173 	TIM6_PrescalerConfig(TIM6_PRESCALER_64, TIM6_PSCRELOADMODE_IMMEDIATE);
 283  0081 ae0601        	ldw	x,#1537
 284  0084 cd0000        	call	_TIM6_PrescalerConfig
 286                     ; 177 	TIM6_SetCounter(0); // Zera o contador
 288  0087 4f            	clr	a
 289  0088 cd0000        	call	_TIM6_SetCounter
 291                     ; 178 	TIM6_SetAutoreload(249);
 293  008b a6f9          	ld	a,#249
 294  008d cd0000        	call	_TIM6_SetAutoreload
 296                     ; 181 	TIM6_ITConfig(TIM6_IT_UPDATE, ENABLE);
 298  0090 ae0101        	ldw	x,#257
 299  0093 cd0000        	call	_TIM6_ITConfig
 301                     ; 184 	TIM6_Cmd(ENABLE);
 303  0096 a601          	ld	a,#1
 304  0098 cd0000        	call	_TIM6_Cmd
 306                     ; 188 }
 309  009b 81            	ret
 345                     ; 193 void WriteBCD(uint8_t valor)
 345                     ; 194 {
 346                     	switch	.text
 347  009c               _WriteBCD:
 349  009c 88            	push	a
 350       00000000      OFST:	set	0
 353                     ; 197 	if(valor & 0x01) GPIO_WriteHigh(BCD_PORT, BCD_A_PIN); else GPIO_WriteLow(BCD_PORT, BCD_A_PIN); // Bit 0 (1)
 355  009d a501          	bcp	a,#1
 356  009f 270b          	jreq	L37
 359  00a1 4b01          	push	#1
 360  00a3 ae5005        	ldw	x,#20485
 361  00a6 cd0000        	call	_GPIO_WriteHigh
 363  00a9 84            	pop	a
 365  00aa 2009          	jra	L57
 366  00ac               L37:
 369  00ac 4b01          	push	#1
 370  00ae ae5005        	ldw	x,#20485
 371  00b1 cd0000        	call	_GPIO_WriteLow
 373  00b4 84            	pop	a
 374  00b5               L57:
 375                     ; 198 	if(valor & 0x02) GPIO_WriteHigh(BCD_PORT, BCD_B_PIN); else GPIO_WriteLow(BCD_PORT, BCD_B_PIN); // Bit 1 (2)
 377  00b5 7b01          	ld	a,(OFST+1,sp)
 378  00b7 a502          	bcp	a,#2
 379  00b9 270b          	jreq	L77
 382  00bb 4b02          	push	#2
 383  00bd ae5005        	ldw	x,#20485
 384  00c0 cd0000        	call	_GPIO_WriteHigh
 386  00c3 84            	pop	a
 388  00c4 2009          	jra	L101
 389  00c6               L77:
 392  00c6 4b02          	push	#2
 393  00c8 ae5005        	ldw	x,#20485
 394  00cb cd0000        	call	_GPIO_WriteLow
 396  00ce 84            	pop	a
 397  00cf               L101:
 398                     ; 199 	if(valor & 0x04) GPIO_WriteHigh(BCD_PORT, BCD_C_PIN); else GPIO_WriteLow(BCD_PORT, BCD_C_PIN); // Bit 2 (4)
 400  00cf 7b01          	ld	a,(OFST+1,sp)
 401  00d1 a504          	bcp	a,#4
 402  00d3 270b          	jreq	L301
 405  00d5 4b04          	push	#4
 406  00d7 ae5005        	ldw	x,#20485
 407  00da cd0000        	call	_GPIO_WriteHigh
 409  00dd 84            	pop	a
 411  00de 2009          	jra	L501
 412  00e0               L301:
 415  00e0 4b04          	push	#4
 416  00e2 ae5005        	ldw	x,#20485
 417  00e5 cd0000        	call	_GPIO_WriteLow
 419  00e8 84            	pop	a
 420  00e9               L501:
 421                     ; 200 	if(valor & 0x08) GPIO_WriteHigh(BCD_PORT, BCD_D_PIN); else GPIO_WriteLow(BCD_PORT, BCD_D_PIN); // Bit 3 (8)
 423  00e9 7b01          	ld	a,(OFST+1,sp)
 424  00eb a508          	bcp	a,#8
 425  00ed 270b          	jreq	L701
 428  00ef 4b08          	push	#8
 429  00f1 ae5005        	ldw	x,#20485
 430  00f4 cd0000        	call	_GPIO_WriteHigh
 432  00f7 84            	pop	a
 434  00f8 2009          	jra	L111
 435  00fa               L701:
 438  00fa 4b08          	push	#8
 439  00fc ae5005        	ldw	x,#20485
 440  00ff cd0000        	call	_GPIO_WriteLow
 442  0102 84            	pop	a
 443  0103               L111:
 444                     ; 201 }
 447  0103 84            	pop	a
 448  0104 81            	ret
 451                     	bsct
 452  0008               L311_s_estado_b1:
 453  0008 00            	dc.b	0
 454  0009               L511_s_tempo_b1:
 455  0009 00000000      	dc.l	0
 456  000d               L711_s_estado_b2:
 457  000d 00            	dc.b	0
 458  000e               L121_s_tempo_b2:
 459  000e 00000000      	dc.l	0
 602                     .const:	section	.text
 603  0000               L42:
 604  0000 00000032      	dc.l	50
 605                     ; 207 void GerenciarBotoes(void)
 605                     ; 208 {
 606                     	switch	.text
 607  0105               _GerenciarBotoes:
 609  0105 5205          	subw	sp,#5
 610       00000005      OFST:	set	5
 613                     ; 216 	bool b1_pressionado = FALSE; 
 615                     ; 217 	bool b2_pressionado = FALSE; 
 617                     ; 220 	uint32_t tempo_atual = g_system_ticks;
 619  0107 be02          	ldw	x,_g_system_ticks+2
 620  0109 1f03          	ldw	(OFST-2,sp),x
 621  010b be00          	ldw	x,_g_system_ticks
 622  010d 1f01          	ldw	(OFST-4,sp),x
 624                     ; 223 	b1_pressionado = (GPIO_ReadInputPin(BOTAO_1_PORT, BOTAO_1_PIN) == 0);
 626  010f 4b80          	push	#128
 627  0111 ae5005        	ldw	x,#20485
 628  0114 cd0000        	call	_GPIO_ReadInputPin
 630  0117 5b01          	addw	sp,#1
 631  0119 4d            	tnz	a
 632  011a 2604          	jrne	L02
 633  011c a601          	ld	a,#1
 634  011e 2001          	jra	L22
 635  0120               L02:
 636  0120 4f            	clr	a
 637  0121               L22:
 638  0121 6b05          	ld	(OFST+0,sp),a
 640                     ; 225 	switch (s_estado_b1)
 642  0123 b608          	ld	a,L311_s_estado_b1
 644                     ; 255 			break;
 645  0125 4d            	tnz	a
 646  0126 2708          	jreq	L321
 647  0128 4a            	dec	a
 648  0129 2717          	jreq	L521
 649  012b 4a            	dec	a
 650  012c 2745          	jreq	L721
 651  012e 2049          	jra	L132
 652  0130               L321:
 653                     ; 227 		case ESTADO_SOLTO:
 653                     ; 228 			if (b1_pressionado) {
 655  0130 0d05          	tnz	(OFST+0,sp)
 656  0132 2745          	jreq	L132
 657                     ; 229 				s_estado_b1 = ESTADO_AGUARDANDO;
 659  0134 35010008      	mov	L311_s_estado_b1,#1
 660                     ; 230 				s_tempo_b1 = tempo_atual; // Marca o tempo do aperto
 662  0138 1e03          	ldw	x,(OFST-2,sp)
 663  013a bf0b          	ldw	L511_s_tempo_b1+2,x
 664  013c 1e01          	ldw	x,(OFST-4,sp)
 665  013e bf09          	ldw	L511_s_tempo_b1,x
 666  0140 2037          	jra	L132
 667  0142               L521:
 668                     ; 234 		case ESTADO_AGUARDANDO:
 668                     ; 235 			if (!b1_pressionado) {
 670  0142 0d05          	tnz	(OFST+0,sp)
 671  0144 2604          	jrne	L532
 672                     ; 237 				s_estado_b1 = ESTADO_SOLTO;
 674  0146 3f08          	clr	L311_s_estado_b1
 676  0148 202f          	jra	L132
 677  014a               L532:
 678                     ; 239 			else if (tempo_atual - s_tempo_b1 >= DEBOUNCE_MS) {
 680  014a 96            	ldw	x,sp
 681  014b 1c0001        	addw	x,#OFST-4
 682  014e cd0000        	call	c_ltor
 684  0151 ae0009        	ldw	x,#L511_s_tempo_b1
 685  0154 cd0000        	call	c_lsub
 687  0157 ae0000        	ldw	x,#L42
 688  015a cd0000        	call	c_lcmp
 690  015d 251a          	jrult	L132
 691                     ; 241 				s_estado_b1 = ESTADO_PRESSIONADO;
 693  015f 35020008      	mov	L311_s_estado_b1,#2
 694                     ; 244 				g_contador_1++;
 696  0163 3c04          	inc	_g_contador_1
 697                     ; 245 				if (g_contador_1 > 9) g_contador_1 = 0; // Gira de 0-9
 699  0165 b604          	ld	a,_g_contador_1
 700  0167 a10a          	cp	a,#10
 701  0169 2502          	jrult	L342
 704  016b 3f04          	clr	_g_contador_1
 705  016d               L342:
 706                     ; 246 				g_display_1_atualizar = TRUE; // Avisa o main() para atualizar
 708  016d 35010006      	mov	_g_display_1_atualizar,#1
 709  0171 2006          	jra	L132
 710  0173               L721:
 711                     ; 250 		case ESTADO_PRESSIONADO:
 711                     ; 251 			if (!b1_pressionado) {
 713  0173 0d05          	tnz	(OFST+0,sp)
 714  0175 2602          	jrne	L132
 715                     ; 253 				s_estado_b1 = ESTADO_SOLTO;
 717  0177 3f08          	clr	L311_s_estado_b1
 718  0179               L132:
 719                     ; 259 	b2_pressionado = (GPIO_ReadInputPin(BOTAO_2_PORT, BOTAO_2_PIN) == 0);
 721  0179 4b10          	push	#16
 722  017b ae5019        	ldw	x,#20505
 723  017e cd0000        	call	_GPIO_ReadInputPin
 725  0181 5b01          	addw	sp,#1
 726  0183 4d            	tnz	a
 727  0184 2604          	jrne	L62
 728  0186 a601          	ld	a,#1
 729  0188 2001          	jra	L03
 730  018a               L62:
 731  018a 4f            	clr	a
 732  018b               L03:
 733  018b 6b05          	ld	(OFST+0,sp),a
 735                     ; 261 	switch (s_estado_b2)
 737  018d b60d          	ld	a,L711_s_estado_b2
 739                     ; 292 		break;
 740  018f 4d            	tnz	a
 741  0190 2708          	jreq	L131
 742  0192 4a            	dec	a
 743  0193 2717          	jreq	L331
 744  0195 4a            	dec	a
 745  0196 2745          	jreq	L531
 746  0198 2049          	jra	L152
 747  019a               L131:
 748                     ; 263 		case ESTADO_SOLTO:
 748                     ; 264 			if (b2_pressionado) 
 750  019a 0d05          	tnz	(OFST+0,sp)
 751  019c 2745          	jreq	L152
 752                     ; 266 				s_estado_b2 = ESTADO_AGUARDANDO;
 754  019e 3501000d      	mov	L711_s_estado_b2,#1
 755                     ; 267 				s_tempo_b2 = tempo_atual;
 757  01a2 1e03          	ldw	x,(OFST-2,sp)
 758  01a4 bf10          	ldw	L121_s_tempo_b2+2,x
 759  01a6 1e01          	ldw	x,(OFST-4,sp)
 760  01a8 bf0e          	ldw	L121_s_tempo_b2,x
 761  01aa 2037          	jra	L152
 762  01ac               L331:
 763                     ; 271 		case ESTADO_AGUARDANDO:
 763                     ; 272 			if (!b2_pressionado) 
 765  01ac 0d05          	tnz	(OFST+0,sp)
 766  01ae 2604          	jrne	L552
 767                     ; 274 				s_estado_b2 = ESTADO_SOLTO;
 769  01b0 3f0d          	clr	L711_s_estado_b2
 771  01b2 202f          	jra	L152
 772  01b4               L552:
 773                     ; 276 			else if (tempo_atual - s_tempo_b2 >= DEBOUNCE_MS) 
 775  01b4 96            	ldw	x,sp
 776  01b5 1c0001        	addw	x,#OFST-4
 777  01b8 cd0000        	call	c_ltor
 779  01bb ae000e        	ldw	x,#L121_s_tempo_b2
 780  01be cd0000        	call	c_lsub
 782  01c1 ae0000        	ldw	x,#L42
 783  01c4 cd0000        	call	c_lcmp
 785  01c7 251a          	jrult	L152
 786                     ; 278 				s_estado_b2 = ESTADO_PRESSIONADO;
 788  01c9 3502000d      	mov	L711_s_estado_b2,#2
 789                     ; 281 				g_contador_2++;
 791  01cd 3c05          	inc	_g_contador_2
 792                     ; 282 				if (g_contador_2 > 9) g_contador_2 = 0;
 794  01cf b605          	ld	a,_g_contador_2
 795  01d1 a10a          	cp	a,#10
 796  01d3 2502          	jrult	L362
 799  01d5 3f05          	clr	_g_contador_2
 800  01d7               L362:
 801                     ; 283 				g_display_2_atualizar = TRUE;
 803  01d7 35010007      	mov	_g_display_2_atualizar,#1
 804  01db 2006          	jra	L152
 805  01dd               L531:
 806                     ; 287 		case ESTADO_PRESSIONADO:
 806                     ; 288 			if (!b2_pressionado) 
 808  01dd 0d05          	tnz	(OFST+0,sp)
 809  01df 2602          	jrne	L152
 810                     ; 290 				s_estado_b2 = ESTADO_SOLTO;
 812  01e1 3f0d          	clr	L711_s_estado_b2
 813  01e3               L152:
 814                     ; 294 }
 817  01e3 5b05          	addw	sp,#5
 818  01e5 81            	ret
 850                     ; 296 void AtualizarDisplays(void)
 850                     ; 297 {
 851                     	switch	.text
 852  01e6               _AtualizarDisplays:
 856                     ; 299 	if (g_display_1_atualizar) 
 858  01e6 3d06          	tnz	_g_display_1_atualizar
 859  01e8 271c          	jreq	L772
 860                     ; 301 		g_display_1_atualizar = FALSE; // Baixa a flag
 862  01ea 3f06          	clr	_g_display_1_atualizar
 863                     ; 303 		WriteBCD(g_contador_1); // Coloca o dado BCD nos pinos
 865  01ec b604          	ld	a,_g_contador_1
 866  01ee cd009c        	call	_WriteBCD
 868                     ; 306 		GPIO_WriteHigh(DIGIT_1_PORT, DIGIT_1_PIN);
 870  01f1 4b20          	push	#32
 871  01f3 ae5014        	ldw	x,#20500
 872  01f6 cd0000        	call	_GPIO_WriteHigh
 874  01f9 84            	pop	a
 875                     ; 307 		NOP(); NOP(); NOP(); // Pausa minúscula para o latch (MC14543B)
 878  01fa 9d            nop
 883  01fb 9d            nop
 888  01fc 9d            nop
 890                     ; 308 		GPIO_WriteLow(DIGIT_1_PORT, DIGIT_1_PIN);
 892  01fd 4b20          	push	#32
 893  01ff ae5014        	ldw	x,#20500
 894  0202 cd0000        	call	_GPIO_WriteLow
 896  0205 84            	pop	a
 897  0206               L772:
 898                     ; 312 	if (g_display_2_atualizar) 
 900  0206 3d07          	tnz	_g_display_2_atualizar
 901  0208 271c          	jreq	L103
 902                     ; 314 		g_display_2_atualizar = FALSE;
 904  020a 3f07          	clr	_g_display_2_atualizar
 905                     ; 316 		WriteBCD(g_contador_2);
 907  020c b605          	ld	a,_g_contador_2
 908  020e cd009c        	call	_WriteBCD
 910                     ; 319 		GPIO_WriteHigh(DIGIT_2_PORT, DIGIT_2_PIN);
 912  0211 4b02          	push	#2
 913  0213 ae500a        	ldw	x,#20490
 914  0216 cd0000        	call	_GPIO_WriteHigh
 916  0219 84            	pop	a
 917                     ; 320 		NOP(); NOP(); NOP();
 920  021a 9d            nop
 925  021b 9d            nop
 930  021c 9d            nop
 932                     ; 321 		GPIO_WriteLow(DIGIT_2_PORT, DIGIT_2_PIN);
 934  021d 4b02          	push	#2
 935  021f ae500a        	ldw	x,#20490
 936  0222 cd0000        	call	_GPIO_WriteLow
 938  0225 84            	pop	a
 939  0226               L103:
 940                     ; 323 }
 943  0226 81            	ret
1007                     	xdef	_main
1008                     	xdef	_AtualizarDisplays
1009                     	xdef	_GerenciarBotoes
1010                     	xdef	_WriteBCD
1011                     	xdef	_setup_tim6
1012                     	xdef	_InitCLOCK
1013                     	xdef	_InitGPIO
1014                     	xdef	_g_display_2_atualizar
1015                     	xdef	_g_display_1_atualizar
1016                     	xdef	_g_contador_2
1017                     	xdef	_g_contador_1
1018                     	xdef	_g_system_ticks
1019                     	xref	_TIM6_ITConfig
1020                     	xref	_TIM6_SetAutoreload
1021                     	xref	_TIM6_SetCounter
1022                     	xref	_TIM6_PrescalerConfig
1023                     	xref	_TIM6_Cmd
1024                     	xref	_GPIO_ReadInputPin
1025                     	xref	_GPIO_WriteLow
1026                     	xref	_GPIO_WriteHigh
1027                     	xref	_GPIO_Init
1028                     	xref	_CLK_HSIPrescalerConfig
1029                     	xref	_CLK_PeripheralClockConfig
1030                     	xref	_CLK_DeInit
1049                     	xref	c_lcmp
1050                     	xref	c_lsub
1051                     	xref	c_ltor
1052                     	end
