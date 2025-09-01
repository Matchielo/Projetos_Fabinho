   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
   4                     ; Optimizer V4.6.4 - 15 Jan 2025
  20                     	bsct
  21  0000               _flagDebounce_01:
  22  0000 00            	dc.b	0
  23  0001               _flagDebounce_02:
  24  0001 00            	dc.b	0
  25  0002               _flagDebounce_03:
  26  0002 00            	dc.b	0
  27  0003               _flagDebounce_04:
  28  0003 00            	dc.b	0
  29  0004               _unidades_1:
  30  0004 00            	dc.b	0
  31  0005               _dezenas_1:
  32  0005 00            	dc.b	0
  33  0006               _unidades_2:
  34  0006 00            	dc.b	0
  35  0007               _dezenas_2:
  36  0007 00            	dc.b	0
  87                     ; 104 main()
  87                     ; 105 {
  89                     .text:	section	.text,new
  90  0000               _main:
  94                     ; 106 	InitGPIO();
  96  0000 cd0000        	call	_InitGPIO
  98                     ; 107 	setup_tim5();
 100  0003 cd0000        	call	_setup_tim5
 102                     ; 108 	setup_tim6();
 104  0006 cd0000        	call	_setup_tim6
 106                     ; 110 	Contagem_Placar();
 108  0009 cd0000        	call	_Contagem_Placar
 110                     ; 112 	rim();
 113  000c 9a            	rim	
 115  000d               L12:
 116                     ; 120 		if(GPIO_ReadInputPin(BOTAO_1_PORT, BOTAO_1_PIN) == 0)		
 118  000d cd013e        	call	LC001
 119  0010 262b          	jrne	L52
 120                     ; 122 			countDebounceUp_01 = 0;
 122  0012 5f            	clrw	x
 123  0013 bf0e          	ldw	_countDebounceUp_01,x
 124                     ; 123 			countDebounceDw_01++;
 126  0015 be0c          	ldw	x,_countDebounceDw_01
 127  0017 5c            	incw	x
 128  0018 bf0c          	ldw	_countDebounceDw_01,x
 129                     ; 124 			if(countDebounceDw_01 >= 500 && flagDebounce_01 == FALSE)
 131  001a be0c          	ldw	x,_countDebounceDw_01
 132  001c a301f4        	cpw	x,#500
 133  001f 2537          	jrult	L33
 135  0021 3d00          	tnz	_flagDebounce_01
 136  0023 2633          	jrne	L33
 137                     ; 126 				countDebounceDw_01--;
 139  0025 be0c          	ldw	x,_countDebounceDw_01
 140  0027 5a            	decw	x
 141  0028 bf0c          	ldw	_countDebounceDw_01,x
 142                     ; 127 				flagDebounce_01 = TRUE;
 144  002a 35010000      	mov	_flagDebounce_01,#1
 145                     ; 128 				dezenas_1++;
 147  002e 3c05          	inc	_dezenas_1
 148                     ; 129 				if (dezenas_1 > 9)
 150  0030 b605          	ld	a,_dezenas_1
 151  0032 a10a          	cp	a,#10
 152  0034 2502          	jrult	L13
 153                     ; 131 					dezenas_1 = 0;
 155  0036 3f05          	clr	_dezenas_1
 156  0038               L13:
 157                     ; 133 				Contagem_Placar();
 159  0038 cd0000        	call	_Contagem_Placar
 161  003b 201b          	jra	L33
 162  003d               L52:
 163                     ; 136 		else if (GPIO_ReadInputPin(BOTAO_1_PORT, BOTAO_1_PIN) != 0)
 165  003d cd013e        	call	LC001
 166  0040 2716          	jreq	L33
 167                     ; 138 			countDebounceDw_01 = 0;
 169  0042 5f            	clrw	x
 170  0043 bf0c          	ldw	_countDebounceDw_01,x
 171                     ; 139 			countDebounceUp_01++;
 173  0045 be0e          	ldw	x,_countDebounceUp_01
 174  0047 5c            	incw	x
 175  0048 bf0e          	ldw	_countDebounceUp_01,x
 176                     ; 140 			if(countDebounceUp_01 >= 500)
 178  004a be0e          	ldw	x,_countDebounceUp_01
 179  004c a301f4        	cpw	x,#500
 180  004f 2507          	jrult	L33
 181                     ; 142 				countDebounceUp_01--;
 183  0051 be0e          	ldw	x,_countDebounceUp_01
 184  0053 5a            	decw	x
 185  0054 bf0e          	ldw	_countDebounceUp_01,x
 186                     ; 143 				flagDebounce_01 = FALSE;
 188  0056 3f00          	clr	_flagDebounce_01
 189  0058               L33:
 190                     ; 150 		if(GPIO_ReadInputPin(BOTAO_2_PORT, BOTAO_2_PIN) == RESET )
 192  0058 cd014a        	call	LC002
 193  005b 262b          	jrne	L14
 194                     ; 152 			countDebounceUp_02 = 0;
 196  005d 5f            	clrw	x
 197  005e bf0a          	ldw	_countDebounceUp_02,x
 198                     ; 153 			countDebounceDw_02++;
 200  0060 be08          	ldw	x,_countDebounceDw_02
 201  0062 5c            	incw	x
 202  0063 bf08          	ldw	_countDebounceDw_02,x
 203                     ; 154 			if(countDebounceDw_02 >= 500 && flagDebounce_02 == FALSE)
 205  0065 be08          	ldw	x,_countDebounceDw_02
 206  0067 a301f4        	cpw	x,#500
 207  006a 2537          	jrult	L74
 209  006c 3d01          	tnz	_flagDebounce_02
 210  006e 2633          	jrne	L74
 211                     ; 156 				countDebounceDw_02--;
 213  0070 be08          	ldw	x,_countDebounceDw_02
 214  0072 5a            	decw	x
 215  0073 bf08          	ldw	_countDebounceDw_02,x
 216                     ; 157 				flagDebounce_02 = TRUE;
 218  0075 35010001      	mov	_flagDebounce_02,#1
 219                     ; 159 				unidades_1++;
 221  0079 3c04          	inc	_unidades_1
 222                     ; 160 				if (unidades_1 > 9)
 224  007b b604          	ld	a,_unidades_1
 225  007d a10a          	cp	a,#10
 226  007f 2502          	jrult	L54
 227                     ; 162 					unidades_1 = 0;
 229  0081 3f04          	clr	_unidades_1
 230  0083               L54:
 231                     ; 164 				Contagem_Placar();
 233  0083 cd0000        	call	_Contagem_Placar
 235  0086 201b          	jra	L74
 236  0088               L14:
 237                     ; 167 		else if(GPIO_ReadInputPin(BOTAO_2_PORT, BOTAO_2_PIN) != RESET )
 239  0088 cd014a        	call	LC002
 240  008b 2716          	jreq	L74
 241                     ; 169 			countDebounceDw_02 = 0;
 243  008d 5f            	clrw	x
 244  008e bf08          	ldw	_countDebounceDw_02,x
 245                     ; 170 			countDebounceUp_02++;
 247  0090 be0a          	ldw	x,_countDebounceUp_02
 248  0092 5c            	incw	x
 249  0093 bf0a          	ldw	_countDebounceUp_02,x
 250                     ; 171 			if(countDebounceUp_02 >= 500)
 252  0095 be0a          	ldw	x,_countDebounceUp_02
 253  0097 a301f4        	cpw	x,#500
 254  009a 2507          	jrult	L74
 255                     ; 173 				countDebounceUp_02--;
 257  009c be0a          	ldw	x,_countDebounceUp_02
 258  009e 5a            	decw	x
 259  009f bf0a          	ldw	_countDebounceUp_02,x
 260                     ; 174 				flagDebounce_02 = FALSE;
 262  00a1 3f01          	clr	_flagDebounce_02
 263  00a3               L74:
 264                     ; 181 		if(GPIO_ReadInputPin(BOTAO_3_PORT, BOTAO_3_PIN) == RESET )
 266  00a3 cd0156        	call	LC003
 267  00a6 262b          	jrne	L55
 268                     ; 183 			countDebounceUp_03 = 0;
 270  00a8 5f            	clrw	x
 271  00a9 bf06          	ldw	_countDebounceUp_03,x
 272                     ; 184 			countDebounceDw_03++;
 274  00ab be04          	ldw	x,_countDebounceDw_03
 275  00ad 5c            	incw	x
 276  00ae bf04          	ldw	_countDebounceDw_03,x
 277                     ; 185 			if(countDebounceDw_03 >= 500 && flagDebounce_03 == FALSE)
 279  00b0 be04          	ldw	x,_countDebounceDw_03
 280  00b2 a301f4        	cpw	x,#500
 281  00b5 2537          	jrult	L36
 283  00b7 3d02          	tnz	_flagDebounce_03
 284  00b9 2633          	jrne	L36
 285                     ; 187 				countDebounceDw_03--;
 287  00bb be04          	ldw	x,_countDebounceDw_03
 288  00bd 5a            	decw	x
 289  00be bf04          	ldw	_countDebounceDw_03,x
 290                     ; 188 				flagDebounce_03 = TRUE;
 292  00c0 35010002      	mov	_flagDebounce_03,#1
 293                     ; 190 				dezenas_2++;
 295  00c4 3c07          	inc	_dezenas_2
 296                     ; 191 				if (dezenas_2 > 9)
 298  00c6 b607          	ld	a,_dezenas_2
 299  00c8 a10a          	cp	a,#10
 300  00ca 2502          	jrult	L16
 301                     ; 193 					dezenas_2 = 0;
 303  00cc 3f07          	clr	_dezenas_2
 304  00ce               L16:
 305                     ; 195 				Contagem_Placar();
 307  00ce cd0000        	call	_Contagem_Placar
 309  00d1 201b          	jra	L36
 310  00d3               L55:
 311                     ; 198 		else if(GPIO_ReadInputPin(BOTAO_3_PORT, BOTAO_3_PIN) != RESET )
 313  00d3 cd0156        	call	LC003
 314  00d6 2716          	jreq	L36
 315                     ; 200 			countDebounceDw_03 = 0;
 317  00d8 5f            	clrw	x
 318  00d9 bf04          	ldw	_countDebounceDw_03,x
 319                     ; 201 			countDebounceUp_03++;
 321  00db be06          	ldw	x,_countDebounceUp_03
 322  00dd 5c            	incw	x
 323  00de bf06          	ldw	_countDebounceUp_03,x
 324                     ; 202 			if(countDebounceUp_03 >= 500)
 326  00e0 be06          	ldw	x,_countDebounceUp_03
 327  00e2 a301f4        	cpw	x,#500
 328  00e5 2507          	jrult	L36
 329                     ; 204 				countDebounceUp_03--;
 331  00e7 be06          	ldw	x,_countDebounceUp_03
 332  00e9 5a            	decw	x
 333  00ea bf06          	ldw	_countDebounceUp_03,x
 334                     ; 205 				flagDebounce_03 = FALSE;
 336  00ec 3f02          	clr	_flagDebounce_03
 337  00ee               L36:
 338                     ; 212 		if(GPIO_ReadInputPin(BOTAO_4_PORT, BOTAO_4_PIN) == RESET )
 340  00ee ad72          	call	LC004
 341  00f0 262f          	jrne	L17
 342                     ; 214 			countDebounceUp_04 = 0;
 344  00f2 5f            	clrw	x
 345  00f3 bf02          	ldw	_countDebounceUp_04,x
 346                     ; 215 			countDebounceDw_04++;
 348  00f5 be00          	ldw	x,_countDebounceDw_04
 349  00f7 5c            	incw	x
 350  00f8 bf00          	ldw	_countDebounceDw_04,x
 351                     ; 216 			if(countDebounceDw_04 >= 500 && flagDebounce_04 == FALSE)
 353  00fa be00          	ldw	x,_countDebounceDw_04
 354  00fc a301f4        	cpw	x,#500
 355  00ff 2403cc000d    	jrult	L12
 357  0104 3d03          	tnz	_flagDebounce_04
 358  0106 26f9          	jrne	L12
 359                     ; 218 				countDebounceDw_04--;
 361  0108 be00          	ldw	x,_countDebounceDw_04
 362  010a 5a            	decw	x
 363  010b bf00          	ldw	_countDebounceDw_04,x
 364                     ; 219 				flagDebounce_04 = TRUE;
 366  010d 35010003      	mov	_flagDebounce_04,#1
 367                     ; 221 				unidades_2++;
 369  0111 3c06          	inc	_unidades_2
 370                     ; 222 				if (unidades_2 > 9)
 372  0113 b606          	ld	a,_unidades_2
 373  0115 a10a          	cp	a,#10
 374  0117 2502          	jrult	L57
 375                     ; 224 					unidades_2 = 0;
 377  0119 3f06          	clr	_unidades_2
 378  011b               L57:
 379                     ; 226 				Contagem_Placar();
 381  011b cd0000        	call	_Contagem_Placar
 383  011e cc000d        	jra	L12
 384  0121               L17:
 385                     ; 229 		else if(GPIO_ReadInputPin(BOTAO_4_PORT, BOTAO_4_PIN) != RESET )
 387  0121 ad3f          	call	LC004
 388  0123 27f9          	jreq	L12
 389                     ; 231 			countDebounceDw_04 = 0;
 391  0125 5f            	clrw	x
 392  0126 bf00          	ldw	_countDebounceDw_04,x
 393                     ; 232 			countDebounceUp_04++;
 395  0128 be02          	ldw	x,_countDebounceUp_04
 396  012a 5c            	incw	x
 397  012b bf02          	ldw	_countDebounceUp_04,x
 398                     ; 233 			if(countDebounceUp_04 >= 500)
 400  012d be02          	ldw	x,_countDebounceUp_04
 401  012f a301f4        	cpw	x,#500
 402  0132 25ea          	jrult	L12
 403                     ; 235 				countDebounceUp_04--;
 405  0134 be02          	ldw	x,_countDebounceUp_04
 406  0136 5a            	decw	x
 407  0137 bf02          	ldw	_countDebounceUp_04,x
 408                     ; 236 				flagDebounce_04 = FALSE;
 410  0139 3f03          	clr	_flagDebounce_04
 411  013b cc000d        	jra	L12
 412  013e               LC001:
 413  013e 4b04          	push	#4
 414  0140 ae500f        	ldw	x,#20495
 415  0143 cd0000        	call	_GPIO_ReadInputPin
 417  0146 5b01          	addw	sp,#1
 418  0148 4d            	tnz	a
 419  0149 81            	ret	
 420  014a               LC002:
 421  014a 4b08          	push	#8
 422  014c ae500f        	ldw	x,#20495
 423  014f cd0000        	call	_GPIO_ReadInputPin
 425  0152 5b01          	addw	sp,#1
 426  0154 4d            	tnz	a
 427  0155 81            	ret	
 428  0156               LC003:
 429  0156 4b10          	push	#16
 430  0158 ae500f        	ldw	x,#20495
 431  015b cd0000        	call	_GPIO_ReadInputPin
 433  015e 5b01          	addw	sp,#1
 434  0160 4d            	tnz	a
 435  0161 81            	ret	
 436  0162               LC004:
 437  0162 4b20          	push	#32
 438  0164 ae500f        	ldw	x,#20495
 439  0167 cd0000        	call	_GPIO_ReadInputPin
 441  016a 5b01          	addw	sp,#1
 442  016c 4d            	tnz	a
 443  016d 81            	ret	
 467                     ; 243 void InitGPIO(void)
 467                     ; 244 {
 468                     .text:	section	.text,new
 469  0000               _InitGPIO:
 473                     ; 245 	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 475  0000 4be0          	push	#224
 476  0002 4b01          	push	#1
 477  0004 ae5005        	ldw	x,#20485
 478  0007 cd0000        	call	_GPIO_Init
 480  000a 85            	popw	x
 481                     ; 246 	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 483  000b 4be0          	push	#224
 484  000d 4b02          	push	#2
 485  000f ae5005        	ldw	x,#20485
 486  0012 cd0000        	call	_GPIO_Init
 488  0015 85            	popw	x
 489                     ; 247 	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 491  0016 4be0          	push	#224
 492  0018 4b04          	push	#4
 493  001a ae5005        	ldw	x,#20485
 494  001d cd0000        	call	_GPIO_Init
 496  0020 85            	popw	x
 497                     ; 248 	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 499  0021 4be0          	push	#224
 500  0023 4b08          	push	#8
 501  0025 ae5005        	ldw	x,#20485
 502  0028 cd0000        	call	_GPIO_Init
 504  002b 85            	popw	x
 505                     ; 250 	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 507  002c 4be0          	push	#224
 508  002e 4b02          	push	#2
 509  0030 ae500a        	ldw	x,#20490
 510  0033 cd0000        	call	_GPIO_Init
 512  0036 85            	popw	x
 513                     ; 251 	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 515  0037 4be0          	push	#224
 516  0039 4b04          	push	#4
 517  003b ae500a        	ldw	x,#20490
 518  003e cd0000        	call	_GPIO_Init
 520  0041 85            	popw	x
 521                     ; 252 	GPIO_Init(LATCH_03_PORT, LATCH_03_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 523  0042 4be0          	push	#224
 524  0044 4b08          	push	#8
 525  0046 ae500a        	ldw	x,#20490
 526  0049 cd0000        	call	_GPIO_Init
 528  004c 85            	popw	x
 529                     ; 253 	GPIO_Init(LATCH_04_PORT, LATCH_04_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 531  004d 4be0          	push	#224
 532  004f 4b10          	push	#16
 533  0051 ae500a        	ldw	x,#20490
 534  0054 cd0000        	call	_GPIO_Init
 536  0057 85            	popw	x
 537                     ; 255 	GPIO_Init(BOTAO_1_PORT, BOTAO_1_PIN, GPIO_MODE_IN_PU_NO_IT);
 539  0058 4b40          	push	#64
 540  005a 4b04          	push	#4
 541  005c ae500f        	ldw	x,#20495
 542  005f cd0000        	call	_GPIO_Init
 544  0062 85            	popw	x
 545                     ; 256 	GPIO_Init(BOTAO_2_PORT, BOTAO_2_PIN, GPIO_MODE_IN_PU_NO_IT);
 547  0063 4b40          	push	#64
 548  0065 4b08          	push	#8
 549  0067 ae500f        	ldw	x,#20495
 550  006a cd0000        	call	_GPIO_Init
 552  006d 85            	popw	x
 553                     ; 257 	GPIO_Init(BOTAO_3_PORT, BOTAO_3_PIN, GPIO_MODE_IN_PU_NO_IT);
 555  006e 4b40          	push	#64
 556  0070 4b10          	push	#16
 557  0072 ae500f        	ldw	x,#20495
 558  0075 cd0000        	call	_GPIO_Init
 560  0078 85            	popw	x
 561                     ; 258 	GPIO_Init(BOTAO_4_PORT, BOTAO_4_PIN, GPIO_MODE_IN_PU_NO_IT);
 563  0079 4b40          	push	#64
 564  007b 4b20          	push	#32
 565  007d ae500f        	ldw	x,#20495
 566  0080 cd0000        	call	_GPIO_Init
 568  0083 85            	popw	x
 569                     ; 260 }
 572  0084 81            	ret	
 603                     ; 262 void Contagem_Placar(void)
 603                     ; 263 {
 604                     .text:	section	.text,new
 605  0000               _Contagem_Placar:
 609                     ; 265 	WriteBCD(unidades_1);         // Envia o dígito das dezenas para os pinos BCD
 611  0000 b604          	ld	a,_unidades_1
 612  0002 cd0000        	call	_WriteBCD
 614                     ; 266 	GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades
 616  0005 4b02          	push	#2
 617  0007 ae500a        	ldw	x,#20490
 618  000a cd0000        	call	_GPIO_WriteHigh
 620  000d ad56          	call	LC005
 621  000f 84            	pop	a
 622                     ; 267 	NOP(); NOP(); NOP(); NOP();
 638                     ; 268 	GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
 640  0010 4b02          	push	#2
 641  0012 ae500a        	ldw	x,#20490
 642  0015 cd0000        	call	_GPIO_WriteLow
 644  0018 84            	pop	a
 645                     ; 271 	WriteBCD(dezenas_1);          // Envia o dígito das unidades para os pinos BCD
 647  0019 b605          	ld	a,_dezenas_1
 648  001b cd0000        	call	_WriteBCD
 650                     ; 272 	GPIO_WriteHigh(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das unidades
 652  001e 4b04          	push	#4
 653  0020 ae500a        	ldw	x,#20490
 654  0023 cd0000        	call	_GPIO_WriteHigh
 656  0026 ad3d          	call	LC005
 657  0028 84            	pop	a
 658                     ; 273 	NOP(); NOP(); NOP(); NOP();
 674                     ; 274 	GPIO_WriteLow(LATCH_02_PORT, LATCH_02_PIN);
 676  0029 4b04          	push	#4
 677  002b ae500a        	ldw	x,#20490
 678  002e cd0000        	call	_GPIO_WriteLow
 680  0031 84            	pop	a
 681                     ; 277 	WriteBCD(unidades_2);         // Envia o dígito das dezenas para os pinos BCD
 683  0032 b606          	ld	a,_unidades_2
 684  0034 cd0000        	call	_WriteBCD
 686                     ; 278 	GPIO_WriteHigh(LATCH_03_PORT, LATCH_03_PIN); // Trava o valor no display das unidades
 688  0037 4b08          	push	#8
 689  0039 ae500a        	ldw	x,#20490
 690  003c cd0000        	call	_GPIO_WriteHigh
 692  003f ad24          	call	LC005
 693  0041 84            	pop	a
 694                     ; 279 	NOP(); NOP(); NOP(); NOP();
 710                     ; 280 	GPIO_WriteLow(LATCH_03_PORT, LATCH_03_PIN);
 712  0042 4b08          	push	#8
 713  0044 ae500a        	ldw	x,#20490
 714  0047 cd0000        	call	_GPIO_WriteLow
 716  004a 84            	pop	a
 717                     ; 283 	WriteBCD(dezenas_2);          // Envia o dígito das unidades para os pinos BCD
 719  004b b607          	ld	a,_dezenas_2
 720  004d cd0000        	call	_WriteBCD
 722                     ; 284 	GPIO_WriteHigh(LATCH_04_PORT, LATCH_04_PIN); // Trava o valor no display das unidades
 724  0050 4b10          	push	#16
 725  0052 ae500a        	ldw	x,#20490
 726  0055 cd0000        	call	_GPIO_WriteHigh
 728  0058 ad0b          	call	LC005
 729  005a 84            	pop	a
 730                     ; 285 	NOP(); NOP(); NOP(); NOP();
 746                     ; 286 	GPIO_WriteLow(LATCH_04_PORT, LATCH_04_PIN);
 748  005b 4b10          	push	#16
 749  005d ae500a        	ldw	x,#20490
 750  0060 cd0000        	call	_GPIO_WriteLow
 752  0063 84            	pop	a
 753                     ; 288 }
 756  0064 81            	ret	
 757  0065               LC005:
 758  0065 9d            	nop	
 759  0066 9d            	nop	
 760  0067 9d            	nop	
 761  0068 9d            	nop	
 762  0069 81            	ret	
 798                     ; 292 void WriteBCD(uint8_t valor)
 798                     ; 293 {
 799                     .text:	section	.text,new
 800  0000               _WriteBCD:
 802  0000 88            	push	a
 803       00000000      OFST:	set	0
 806                     ; 296 	if(valor & 0x01) GPIO_WriteHigh(LD_A_PORT, LD_A_PIN); else GPIO_WriteLow(LD_A_PORT, LD_A_PIN); // Bit 0 (1)
 808  0001 a501          	bcp	a,#1
 809  0003 270a          	jreq	L341
 812  0005 4b01          	push	#1
 813  0007 ae5005        	ldw	x,#20485
 814  000a cd0000        	call	_GPIO_WriteHigh
 817  000d 2008          	jra	L541
 818  000f               L341:
 821  000f 4b01          	push	#1
 822  0011 ae5005        	ldw	x,#20485
 823  0014 cd0000        	call	_GPIO_WriteLow
 825  0017               L541:
 826  0017 84            	pop	a
 827                     ; 297 	if(valor & 0x02) GPIO_WriteHigh(LD_B_PORT, LD_B_PIN); else GPIO_WriteLow(LD_B_PORT, LD_B_PIN); // Bit 1 (2)
 829  0018 7b01          	ld	a,(OFST+1,sp)
 830  001a a502          	bcp	a,#2
 831  001c 270a          	jreq	L741
 834  001e 4b02          	push	#2
 835  0020 ae5005        	ldw	x,#20485
 836  0023 cd0000        	call	_GPIO_WriteHigh
 839  0026 2008          	jra	L151
 840  0028               L741:
 843  0028 4b02          	push	#2
 844  002a ae5005        	ldw	x,#20485
 845  002d cd0000        	call	_GPIO_WriteLow
 847  0030               L151:
 848  0030 84            	pop	a
 849                     ; 298 	if(valor & 0x04) GPIO_WriteHigh(LD_C_PORT, LD_C_PIN); else GPIO_WriteLow(LD_C_PORT, LD_C_PIN); // Bit 2 (4)
 851  0031 7b01          	ld	a,(OFST+1,sp)
 852  0033 a504          	bcp	a,#4
 853  0035 270a          	jreq	L351
 856  0037 4b04          	push	#4
 857  0039 ae5005        	ldw	x,#20485
 858  003c cd0000        	call	_GPIO_WriteHigh
 861  003f 2008          	jra	L551
 862  0041               L351:
 865  0041 4b04          	push	#4
 866  0043 ae5005        	ldw	x,#20485
 867  0046 cd0000        	call	_GPIO_WriteLow
 869  0049               L551:
 870  0049 84            	pop	a
 871                     ; 299 	if(valor & 0x08) GPIO_WriteHigh(LD_D_PORT, LD_D_PIN); else GPIO_WriteLow(LD_D_PORT, LD_D_PIN); // Bit 3 (8)
 873  004a 7b01          	ld	a,(OFST+1,sp)
 874  004c a508          	bcp	a,#8
 875  004e 270a          	jreq	L751
 878  0050 4b08          	push	#8
 879  0052 ae5005        	ldw	x,#20485
 880  0055 cd0000        	call	_GPIO_WriteHigh
 883  0058 2008          	jra	L161
 884  005a               L751:
 887  005a 4b08          	push	#8
 888  005c ae5005        	ldw	x,#20485
 889  005f cd0000        	call	_GPIO_WriteLow
 891  0062               L161:
 892                     ; 300 }
 895  0062 5b02          	addw	sp,#2
 896  0064 81            	ret	
 925                     ; 302 void setup_tim6(void)
 925                     ; 303 {
 926                     .text:	section	.text,new
 927  0000               _setup_tim6:
 931                     ; 305 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, ENABLE);
 933  0000 ae0401        	ldw	x,#1025
 934  0003 cd0000        	call	_CLK_PeripheralClockConfig
 936                     ; 308 	TIM6_PrescalerConfig(TIM6_PRESCALER_64, TIM6_PSCRELOADMODE_IMMEDIATE);
 938  0006 ae0601        	ldw	x,#1537
 939  0009 cd0000        	call	_TIM6_PrescalerConfig
 941                     ; 312 	TIM6_SetCounter(0); // Zera o contador
 943  000c 4f            	clr	a
 944  000d cd0000        	call	_TIM6_SetCounter
 946                     ; 313 	TIM6_SetAutoreload(249);
 948  0010 a6f9          	ld	a,#249
 949  0012 cd0000        	call	_TIM6_SetAutoreload
 951                     ; 316 	TIM6_ITConfig(TIM6_IT_UPDATE, ENABLE);
 953  0015 ae0101        	ldw	x,#257
 954  0018 cd0000        	call	_TIM6_ITConfig
 956                     ; 319 	TIM6_Cmd(ENABLE);
 958  001b a601          	ld	a,#1
 960                     ; 323 }
 963  001d cc0000        	jp	_TIM6_Cmd
 992                     ; 325 void setup_tim5(void)
 992                     ; 326 {
 993                     .text:	section	.text,new
 994  0000               _setup_tim5:
 998                     ; 328 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER5, ENABLE);
1000  0000 ae0501        	ldw	x,#1281
1001  0003 cd0000        	call	_CLK_PeripheralClockConfig
1003                     ; 332 	TIM5_PrescalerConfig(TIM5_PRESCALER_128, TIM5_PSCRELOADMODE_IMMEDIATE);
1005  0006 ae0701        	ldw	x,#1793
1006  0009 cd0000        	call	_TIM5_PrescalerConfig
1008                     ; 336 	TIM5_SetCounter(0); // Zera o contador
1010  000c 5f            	clrw	x
1011  000d cd0000        	call	_TIM5_SetCounter
1013                     ; 337 	TIM5_SetAutoreload(31249);
1015  0010 ae7a11        	ldw	x,#31249
1016  0013 cd0000        	call	_TIM5_SetAutoreload
1018                     ; 340 	TIM5_ITConfig(TIM5_IT_UPDATE, ENABLE);
1020  0016 ae0101        	ldw	x,#257
1021  0019 cd0000        	call	_TIM5_ITConfig
1023                     ; 343 	TIM5_Cmd(ENABLE);
1025  001c a601          	ld	a,#1
1027                     ; 344 }
1030  001e cc0000        	jp	_TIM5_Cmd
1213                     	xdef	_main
1214                     	xdef	_WriteBCD
1215                     	xdef	_Contagem_Placar
1216                     	xdef	_InitGPIO
1217                     	xdef	_setup_tim5
1218                     	xdef	_setup_tim6
1219                     	xdef	_dezenas_2
1220                     	xdef	_unidades_2
1221                     	xdef	_dezenas_1
1222                     	xdef	_unidades_1
1223                     	xdef	_flagDebounce_04
1224                     	switch	.ubsct
1225  0000               _countDebounceDw_04:
1226  0000 0000          	ds.b	2
1227                     	xdef	_countDebounceDw_04
1228  0002               _countDebounceUp_04:
1229  0002 0000          	ds.b	2
1230                     	xdef	_countDebounceUp_04
1231                     	xdef	_flagDebounce_03
1232  0004               _countDebounceDw_03:
1233  0004 0000          	ds.b	2
1234                     	xdef	_countDebounceDw_03
1235  0006               _countDebounceUp_03:
1236  0006 0000          	ds.b	2
1237                     	xdef	_countDebounceUp_03
1238                     	xdef	_flagDebounce_02
1239  0008               _countDebounceDw_02:
1240  0008 0000          	ds.b	2
1241                     	xdef	_countDebounceDw_02
1242  000a               _countDebounceUp_02:
1243  000a 0000          	ds.b	2
1244                     	xdef	_countDebounceUp_02
1245                     	xdef	_flagDebounce_01
1246  000c               _countDebounceDw_01:
1247  000c 0000          	ds.b	2
1248                     	xdef	_countDebounceDw_01
1249  000e               _countDebounceUp_01:
1250  000e 0000          	ds.b	2
1251                     	xdef	_countDebounceUp_01
1252                     	xref	_TIM5_SetAutoreload
1253                     	xref	_TIM5_SetCounter
1254                     	xref	_TIM5_PrescalerConfig
1255                     	xref	_TIM5_ITConfig
1256                     	xref	_TIM5_Cmd
1257                     	xref	_TIM6_ITConfig
1258                     	xref	_TIM6_SetAutoreload
1259                     	xref	_TIM6_SetCounter
1260                     	xref	_TIM6_PrescalerConfig
1261                     	xref	_TIM6_Cmd
1262                     	xref	_GPIO_ReadInputPin
1263                     	xref	_GPIO_WriteLow
1264                     	xref	_GPIO_WriteHigh
1265                     	xref	_GPIO_Init
1266                     	xref	_CLK_PeripheralClockConfig
1286                     	end
