   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  14                     	bsct
  15  0000               _last_state:
  16  0000 00            	dc.b	0
  17  0001               _segundos:
  18  0001 0000          	dc.w	0
  19  0003               _valor:
  20  0003 00            	dc.b	0
  21  0004               _unidades_1:
  22  0004 00            	dc.b	0
  23  0005               _dezenas_1:
  24  0005 00            	dc.b	0
  62                     ; 67 int main(void) 
  62                     ; 68 {
  64                     	switch	.text
  65  0000               _main:
  69                     ; 70 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  71  0000 4f            	clr	a
  72  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  74                     ; 73 	I2C_Init_DS1307();
  76  0004 ad4f          	call	_I2C_Init_DS1307
  78                     ; 74 	DS1307_EnableSQW_1Hz();
  80  0006 cd00ce        	call	_DS1307_EnableSQW_1Hz
  82                     ; 75 	InitGPIO();
  84  0009 cd0173        	call	_InitGPIO
  86                     ; 78 	GPIO_Init(GPIOB, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
  88  000c 4b40          	push	#64
  89  000e 4b40          	push	#64
  90  0010 ae5005        	ldw	x,#20485
  91  0013 cd0000        	call	_GPIO_Init
  93  0016 85            	popw	x
  94                     ; 80 	Contagem_Placar();
  96  0017 cd013d        	call	_Contagem_Placar
  98  001a               L12:
  99                     ; 84 		if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_6) == RESET && last_state == 0)
 101  001a 4b40          	push	#64
 102  001c ae5005        	ldw	x,#20485
 103  001f cd0000        	call	_GPIO_ReadInputPin
 105  0022 5b01          	addw	sp,#1
 106  0024 4d            	tnz	a
 107  0025 2617          	jrne	L52
 109  0027 3d00          	tnz	_last_state
 110  0029 2613          	jrne	L52
 111                     ; 87 			last_state = 1;
 113  002b 35010000      	mov	_last_state,#1
 114                     ; 89 			unidades_1++;
 116  002f 3c04          	inc	_unidades_1
 117                     ; 90 			if (unidades_1 > 9)
 119  0031 b604          	ld	a,_unidades_1
 120  0033 a10a          	cp	a,#10
 121  0035 2502          	jrult	L72
 122                     ; 92 				unidades_1 = 0;
 124  0037 3f04          	clr	_unidades_1
 125  0039               L72:
 126                     ; 94 			Contagem_Placar();
 128  0039 cd013d        	call	_Contagem_Placar
 131  003c 20dc          	jra	L12
 132  003e               L52:
 133                     ; 97 		else if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_6) != RESET && last_state == 1)
 135  003e 4b40          	push	#64
 136  0040 ae5005        	ldw	x,#20485
 137  0043 cd0000        	call	_GPIO_ReadInputPin
 139  0046 5b01          	addw	sp,#1
 140  0048 4d            	tnz	a
 141  0049 27cf          	jreq	L12
 143  004b b600          	ld	a,_last_state
 144  004d a101          	cp	a,#1
 145  004f 26c9          	jrne	L12
 146                     ; 99 			last_state = 0;
 148  0051 3f00          	clr	_last_state
 149  0053 20c5          	jra	L12
 176                     ; 104 void I2C_Init_DS1307(void) {
 177                     	switch	.text
 178  0055               _I2C_Init_DS1307:
 182                     ; 106 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
 184  0055 4bb0          	push	#176
 185  0057 4b10          	push	#16
 186  0059 ae5005        	ldw	x,#20485
 187  005c cd0000        	call	_GPIO_Init
 189  005f 85            	popw	x
 190                     ; 107 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
 192  0060 4bb0          	push	#176
 193  0062 4b20          	push	#32
 194  0064 ae5005        	ldw	x,#20485
 195  0067 cd0000        	call	_GPIO_Init
 197  006a 85            	popw	x
 198                     ; 110 	I2C_DeInit();
 200  006b cd0000        	call	_I2C_DeInit
 202                     ; 111 	I2C_Init(100000, DS1307_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
 204  006e 4b10          	push	#16
 205  0070 4b00          	push	#0
 206  0072 4b01          	push	#1
 207  0074 4b00          	push	#0
 208  0076 ae00d0        	ldw	x,#208
 209  0079 89            	pushw	x
 210  007a ae86a0        	ldw	x,#34464
 211  007d 89            	pushw	x
 212  007e ae0001        	ldw	x,#1
 213  0081 89            	pushw	x
 214  0082 cd0000        	call	_I2C_Init
 216  0085 5b0a          	addw	sp,#10
 217                     ; 112 	I2C_Cmd(ENABLE);
 219  0087 a601          	ld	a,#1
 220  0089 cd0000        	call	_I2C_Cmd
 222                     ; 113 }
 225  008c 81            	ret
 273                     ; 115 void DS1307_Write(uint8_t reg, uint8_t data) {
 274                     	switch	.text
 275  008d               _DS1307_Write:
 277  008d 89            	pushw	x
 278       00000000      OFST:	set	0
 281                     ; 116 	I2C_GenerateSTART(ENABLE);
 283  008e a601          	ld	a,#1
 284  0090 cd0000        	call	_I2C_GenerateSTART
 287  0093               L17:
 288                     ; 117 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 290  0093 ae0301        	ldw	x,#769
 291  0096 cd0000        	call	_I2C_CheckEvent
 293  0099 4d            	tnz	a
 294  009a 27f7          	jreq	L17
 295                     ; 119 	I2C_Send7bitAddress(DS1307_ADDRESS, I2C_DIRECTION_TX);
 297  009c aed000        	ldw	x,#53248
 298  009f cd0000        	call	_I2C_Send7bitAddress
 301  00a2               L77:
 302                     ; 120 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 304  00a2 ae0782        	ldw	x,#1922
 305  00a5 cd0000        	call	_I2C_CheckEvent
 307  00a8 4d            	tnz	a
 308  00a9 27f7          	jreq	L77
 309                     ; 122 	I2C_SendData(reg);
 311  00ab 7b01          	ld	a,(OFST+1,sp)
 312  00ad cd0000        	call	_I2C_SendData
 315  00b0               L501:
 316                     ; 123 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 318  00b0 ae0784        	ldw	x,#1924
 319  00b3 cd0000        	call	_I2C_CheckEvent
 321  00b6 4d            	tnz	a
 322  00b7 27f7          	jreq	L501
 323                     ; 125 	I2C_SendData(data);
 325  00b9 7b02          	ld	a,(OFST+2,sp)
 326  00bb cd0000        	call	_I2C_SendData
 329  00be               L311:
 330                     ; 126 	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 332  00be ae0784        	ldw	x,#1924
 333  00c1 cd0000        	call	_I2C_CheckEvent
 335  00c4 4d            	tnz	a
 336  00c5 27f7          	jreq	L311
 337                     ; 128 	I2C_GenerateSTOP(ENABLE);
 339  00c7 a601          	ld	a,#1
 340  00c9 cd0000        	call	_I2C_GenerateSTOP
 342                     ; 129 }
 345  00cc 85            	popw	x
 346  00cd 81            	ret
 371                     ; 131 void DS1307_EnableSQW_1Hz(void) {
 372                     	switch	.text
 373  00ce               _DS1307_EnableSQW_1Hz:
 377                     ; 132 	DS1307_Write(DS1307_CTRL_REG, 0x10); // SQWE=1, RS1=0, RS0=0
 379  00ce ae0710        	ldw	x,#1808
 380  00d1 adba          	call	_DS1307_Write
 382                     ; 133 }
 385  00d3 81            	ret
 421                     ; 138 void WriteBCD(uint8_t valor)
 421                     ; 139 {
 422                     	switch	.text
 423  00d4               _WriteBCD:
 425  00d4 88            	push	a
 426       00000000      OFST:	set	0
 429                     ; 142 	if(valor & 0x01) GPIO_WriteHigh(LD_A_PORT, LD_A_PIN); else GPIO_WriteLow(LD_A_PORT, LD_A_PIN); // Bit 0 (1)
 431  00d5 a501          	bcp	a,#1
 432  00d7 270b          	jreq	L541
 435  00d9 4b01          	push	#1
 436  00db ae5005        	ldw	x,#20485
 437  00de cd0000        	call	_GPIO_WriteHigh
 439  00e1 84            	pop	a
 441  00e2 2009          	jra	L741
 442  00e4               L541:
 445  00e4 4b01          	push	#1
 446  00e6 ae5005        	ldw	x,#20485
 447  00e9 cd0000        	call	_GPIO_WriteLow
 449  00ec 84            	pop	a
 450  00ed               L741:
 451                     ; 143 	if(valor & 0x02) GPIO_WriteHigh(LD_B_PORT, LD_B_PIN); else GPIO_WriteLow(LD_B_PORT, LD_B_PIN); // Bit 1 (2)
 453  00ed 7b01          	ld	a,(OFST+1,sp)
 454  00ef a502          	bcp	a,#2
 455  00f1 270b          	jreq	L151
 458  00f3 4b02          	push	#2
 459  00f5 ae5005        	ldw	x,#20485
 460  00f8 cd0000        	call	_GPIO_WriteHigh
 462  00fb 84            	pop	a
 464  00fc 2009          	jra	L351
 465  00fe               L151:
 468  00fe 4b02          	push	#2
 469  0100 ae5005        	ldw	x,#20485
 470  0103 cd0000        	call	_GPIO_WriteLow
 472  0106 84            	pop	a
 473  0107               L351:
 474                     ; 144 	if(valor & 0x04) GPIO_WriteHigh(LD_C_PORT, LD_C_PIN); else GPIO_WriteLow(LD_C_PORT, LD_C_PIN); // Bit 2 (4)
 476  0107 7b01          	ld	a,(OFST+1,sp)
 477  0109 a504          	bcp	a,#4
 478  010b 270b          	jreq	L551
 481  010d 4b04          	push	#4
 482  010f ae5005        	ldw	x,#20485
 483  0112 cd0000        	call	_GPIO_WriteHigh
 485  0115 84            	pop	a
 487  0116 2009          	jra	L751
 488  0118               L551:
 491  0118 4b04          	push	#4
 492  011a ae5005        	ldw	x,#20485
 493  011d cd0000        	call	_GPIO_WriteLow
 495  0120 84            	pop	a
 496  0121               L751:
 497                     ; 145 	if(valor & 0x08) GPIO_WriteHigh(LD_D_PORT, LD_D_PIN); else GPIO_WriteLow(LD_D_PORT, LD_D_PIN); // Bit 3 (8)
 499  0121 7b01          	ld	a,(OFST+1,sp)
 500  0123 a508          	bcp	a,#8
 501  0125 270b          	jreq	L161
 504  0127 4b08          	push	#8
 505  0129 ae5005        	ldw	x,#20485
 506  012c cd0000        	call	_GPIO_WriteHigh
 508  012f 84            	pop	a
 510  0130 2009          	jra	L361
 511  0132               L161:
 514  0132 4b08          	push	#8
 515  0134 ae5005        	ldw	x,#20485
 516  0137 cd0000        	call	_GPIO_WriteLow
 518  013a 84            	pop	a
 519  013b               L361:
 520                     ; 146 }
 523  013b 84            	pop	a
 524  013c 81            	ret
 553                     ; 148 void Contagem_Placar(void)
 553                     ; 149 {
 554                     	switch	.text
 555  013d               _Contagem_Placar:
 559                     ; 152 	WriteBCD(unidades_1);         // Envia o dígito das dezenas para os pinos BCD
 561  013d b604          	ld	a,_unidades_1
 562  013f ad93          	call	_WriteBCD
 564                     ; 153 	GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades
 566  0141 4b20          	push	#32
 567  0143 ae5014        	ldw	x,#20500
 568  0146 cd0000        	call	_GPIO_WriteHigh
 570  0149 84            	pop	a
 571                     ; 154 	NOP(); NOP(); NOP(); NOP();
 574  014a 9d            nop
 579  014b 9d            nop
 584  014c 9d            nop
 589  014d 9d            nop
 591                     ; 155 	GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
 593  014e 4b20          	push	#32
 594  0150 ae5014        	ldw	x,#20500
 595  0153 cd0000        	call	_GPIO_WriteLow
 597  0156 84            	pop	a
 598                     ; 157 	WriteBCD(dezenas_1);         // Envia o dígito das dezenas para os pinos BCD
 600  0157 b605          	ld	a,_dezenas_1
 601  0159 cd00d4        	call	_WriteBCD
 603                     ; 158 	GPIO_WriteHigh(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das unidades
 605  015c 4b02          	push	#2
 606  015e ae500a        	ldw	x,#20490
 607  0161 cd0000        	call	_GPIO_WriteHigh
 609  0164 84            	pop	a
 610                     ; 159 	NOP(); NOP(); NOP(); NOP();
 613  0165 9d            nop
 618  0166 9d            nop
 623  0167 9d            nop
 628  0168 9d            nop
 630                     ; 160 	GPIO_WriteLow(LATCH_02_PORT, LATCH_02_PIN);
 632  0169 4b02          	push	#2
 633  016b ae500a        	ldw	x,#20490
 634  016e cd0000        	call	_GPIO_WriteLow
 636  0171 84            	pop	a
 637                     ; 161 }
 640  0172 81            	ret
 664                     ; 163 void InitGPIO(void)
 664                     ; 164 {
 665                     	switch	.text
 666  0173               _InitGPIO:
 670                     ; 165 	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 672  0173 4be0          	push	#224
 673  0175 4b01          	push	#1
 674  0177 ae5005        	ldw	x,#20485
 675  017a cd0000        	call	_GPIO_Init
 677  017d 85            	popw	x
 678                     ; 166 	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 680  017e 4be0          	push	#224
 681  0180 4b02          	push	#2
 682  0182 ae5005        	ldw	x,#20485
 683  0185 cd0000        	call	_GPIO_Init
 685  0188 85            	popw	x
 686                     ; 167 	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 688  0189 4be0          	push	#224
 689  018b 4b04          	push	#4
 690  018d ae5005        	ldw	x,#20485
 691  0190 cd0000        	call	_GPIO_Init
 693  0193 85            	popw	x
 694                     ; 168 	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 696  0194 4be0          	push	#224
 697  0196 4b08          	push	#8
 698  0198 ae5005        	ldw	x,#20485
 699  019b cd0000        	call	_GPIO_Init
 701  019e 85            	popw	x
 702                     ; 170 	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 704  019f 4be0          	push	#224
 705  01a1 4b20          	push	#32
 706  01a3 ae5014        	ldw	x,#20500
 707  01a6 cd0000        	call	_GPIO_Init
 709  01a9 85            	popw	x
 710                     ; 171 	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 712  01aa 4be0          	push	#224
 713  01ac 4b02          	push	#2
 714  01ae ae500a        	ldw	x,#20490
 715  01b1 cd0000        	call	_GPIO_Init
 717  01b4 85            	popw	x
 718                     ; 172 }
 721  01b5 81            	ret
 781                     	xdef	_main
 782                     	xdef	_dezenas_1
 783                     	xdef	_unidades_1
 784                     	xdef	_valor
 785                     	xdef	_segundos
 786                     	xdef	_last_state
 787                     	xdef	_InitGPIO
 788                     	xdef	_Contagem_Placar
 789                     	xdef	_WriteBCD
 790                     	xdef	_DS1307_EnableSQW_1Hz
 791                     	xdef	_DS1307_Write
 792                     	xdef	_I2C_Init_DS1307
 793                     	xref	_I2C_CheckEvent
 794                     	xref	_I2C_SendData
 795                     	xref	_I2C_Send7bitAddress
 796                     	xref	_I2C_GenerateSTOP
 797                     	xref	_I2C_GenerateSTART
 798                     	xref	_I2C_Cmd
 799                     	xref	_I2C_Init
 800                     	xref	_I2C_DeInit
 801                     	xref	_GPIO_ReadInputPin
 802                     	xref	_GPIO_WriteLow
 803                     	xref	_GPIO_WriteHigh
 804                     	xref	_GPIO_Init
 805                     	xref	_CLK_HSIPrescalerConfig
 824                     	end
