   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  14                     	bsct
  15  0000               _last_state:
  16  0000 00            	dc.b	0
  17  0001               _seg_valor:
  18  0001 0005          	dc.w	5
  19  0003               _seg_unidades:
  20  0003 00            	dc.b	0
  21  0004               _seg_dezenas:
  22  0004 00            	dc.b	0
  23  0005               _min_unidades:
  24  0005 00            	dc.b	0
  25  0006               _min_dezenas:
  26  0006 00            	dc.b	0
  27  0007               _RF_IN_ON:
  28  0007 00            	dc.b	0
  29  0008               _debounceCh1:
  30  0008 0000          	dc.w	0
  31  000a               _debounceCh2:
  32  000a 0000          	dc.w	0
  33  000c               _rf_cooldown:
  34  000c 0000          	dc.w	0
  35  000e               _flag_run:
  36  000e 00            	dc.b	0
  37  000f               _flag_start:
  38  000f 00            	dc.b	0
  39  0010               _fim_contagem_estado:
  40  0010 00            	dc.b	0
  41  0011               _tempo_restante:
  42  0011 00            	dc.b	0
  43  0012               _unidade:
  44  0012 00            	dc.b	0
  45  0013               _dezena:
  46  0013 00            	dc.b	0
  47  0014               _rele_time:
  48  0014 00            	dc.b	0
  85                     ; 144 void main(void)
  85                     ; 145 {
  87                     	switch	.text
  88  0000               _main:
  92                     ; 147 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  94  0000 4f            	clr	a
  95  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  97                     ; 150 	I2C_Init_DS1307();
  99  0004 cd00d6        	call	_I2C_Init_DS1307
 101                     ; 151 	DS1307_StartOscillator();
 103  0007 cd01ab        	call	_DS1307_StartOscillator
 105                     ; 152 	DS1307_EnableSQW_1Hz();
 107  000a cd01c2        	call	_DS1307_EnableSQW_1Hz
 109                     ; 155 	InitGPIO();
 111  000d cd032d        	call	_InitGPIO
 113                     ; 156 	setup_tim6();
 115  0010 cd03bd        	call	_setup_tim6
 117                     ; 162 	Contagem_Placar();		
 119  0013 cd0232        	call	_Contagem_Placar
 121  0016               L12:
 122                     ; 166 		contador_placar();
 124  0016 ad02          	call	_contador_placar
 127  0018 20fc          	jra	L12
 155                     ; 171 void contador_placar(void)
 155                     ; 172 {
 156                     	switch	.text
 157  001a               _contador_placar:
 161                     ; 174     if (GPIO_ReadInputPin(SQW_PIN_PORT, SQW_PIN) == RESET && last_state == 0)
 163  001a 4b40          	push	#64
 164  001c ae5005        	ldw	x,#20485
 165  001f cd0000        	call	_GPIO_ReadInputPin
 167  0022 5b01          	addw	sp,#1
 168  0024 4d            	tnz	a
 169  0025 262b          	jrne	L53
 171  0027 3d00          	tnz	_last_state
 172  0029 2627          	jrne	L53
 173                     ; 176         last_state = 1;
 175  002b 35010000      	mov	_last_state,#1
 176                     ; 178         if (seg_valor > 0)
 178  002f be01          	ldw	x,_seg_valor
 179  0031 2717          	jreq	L73
 180                     ; 180             seg_valor--;
 182  0033 be01          	ldw	x,_seg_valor
 183  0035 1d0001        	subw	x,#1
 184  0038 bf01          	ldw	_seg_valor,x
 185                     ; 182             if (seg_valor == 0)
 187  003a be01          	ldw	x,_seg_valor
 188  003c 2607          	jrne	L14
 189                     ; 184                 Contagem_Placar();
 191  003e cd0232        	call	_Contagem_Placar
 193                     ; 185                 Piscar_Display();   // <--- Pisca 3 vezes ao chegar em zero
 195  0041 ad75          	call	_Piscar_Display
 198  0043 2022          	jra	L74
 199  0045               L14:
 200                     ; 192                 Contagem_Placar();
 202  0045 cd0232        	call	_Contagem_Placar
 204  0048 201d          	jra	L74
 205  004a               L73:
 206                     ; 197             seg_valor = 0;
 208  004a 5f            	clrw	x
 209  004b bf01          	ldw	_seg_valor,x
 210                     ; 198             Contagem_Placar();
 212  004d cd0232        	call	_Contagem_Placar
 214  0050 2015          	jra	L74
 215  0052               L53:
 216                     ; 201     else if (GPIO_ReadInputPin(SQW_PIN_PORT, SQW_PIN) != RESET && last_state == 1)
 218  0052 4b40          	push	#64
 219  0054 ae5005        	ldw	x,#20485
 220  0057 cd0000        	call	_GPIO_ReadInputPin
 222  005a 5b01          	addw	sp,#1
 223  005c 4d            	tnz	a
 224  005d 2708          	jreq	L74
 226  005f b600          	ld	a,_last_state
 227  0061 a101          	cp	a,#1
 228  0063 2602          	jrne	L74
 229                     ; 203         last_state = 0;
 231  0065 3f00          	clr	_last_state
 232  0067               L74:
 233                     ; 205 }
 236  0067 81            	ret
 262                     ; 207 void Display_Off(void)
 262                     ; 208 {
 263                     	switch	.text
 264  0068               _Display_Off:
 268                     ; 210 	WriteBCD(15);
 270  0068 a60f          	ld	a,#15
 271  006a cd01c9        	call	_WriteBCD
 273                     ; 213 	GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN);
 275  006d 4b20          	push	#32
 276  006f ae5014        	ldw	x,#20500
 277  0072 cd0000        	call	_GPIO_WriteHigh
 279  0075 84            	pop	a
 280                     ; 214 	GPIO_WriteHigh(LATCH_02_PORT, LATCH_02_PIN);
 282  0076 4b02          	push	#2
 283  0078 ae500a        	ldw	x,#20490
 284  007b cd0000        	call	_GPIO_WriteHigh
 286  007e 84            	pop	a
 287                     ; 215 	GPIO_WriteHigh(LATCH_03_PORT, LATCH_03_PIN);
 289  007f 4b04          	push	#4
 290  0081 ae500a        	ldw	x,#20490
 291  0084 cd0000        	call	_GPIO_WriteHigh
 293  0087 84            	pop	a
 294                     ; 216 	GPIO_WriteHigh(LATCH_04_PORT, LATCH_04_PIN);
 296  0088 4b08          	push	#8
 297  008a ae500a        	ldw	x,#20490
 298  008d cd0000        	call	_GPIO_WriteHigh
 300  0090 84            	pop	a
 301                     ; 220 	NOP(); NOP(); // Pequena pausa
 304  0091 9d            nop
 309  0092 9d            nop
 311                     ; 222 	GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
 313  0093 4b20          	push	#32
 314  0095 ae5014        	ldw	x,#20500
 315  0098 cd0000        	call	_GPIO_WriteLow
 317  009b 84            	pop	a
 318                     ; 223 	GPIO_WriteLow(LATCH_02_PORT, LATCH_02_PIN);
 320  009c 4b02          	push	#2
 321  009e ae500a        	ldw	x,#20490
 322  00a1 cd0000        	call	_GPIO_WriteLow
 324  00a4 84            	pop	a
 325                     ; 224 	GPIO_WriteLow(LATCH_03_PORT, LATCH_03_PIN);
 327  00a5 4b04          	push	#4
 328  00a7 ae500a        	ldw	x,#20490
 329  00aa cd0000        	call	_GPIO_WriteLow
 331  00ad 84            	pop	a
 332                     ; 225 	GPIO_WriteLow(LATCH_04_PORT, LATCH_04_PIN);
 334  00ae 4b08          	push	#8
 335  00b0 ae500a        	ldw	x,#20490
 336  00b3 cd0000        	call	_GPIO_WriteLow
 338  00b6 84            	pop	a
 339                     ; 228 }
 342  00b7 81            	ret
 379                     ; 230 void Piscar_Display(void)
 379                     ; 231 {
 380                     	switch	.text
 381  00b8               _Piscar_Display:
 383  00b8 88            	push	a
 384       00000001      OFST:	set	1
 387                     ; 233 	for (i = 0; i < 3; i++)
 389  00b9 0f01          	clr	(OFST+0,sp)
 391  00bb               L101:
 392                     ; 236 		Display_Off();
 394  00bb adab          	call	_Display_Off
 396                     ; 237 		Delay_ms_Timer(500);  // Espera 300ms
 398  00bd ae01f4        	ldw	x,#500
 399  00c0 cd03de        	call	_Delay_ms_Timer
 401                     ; 240 		Contagem_Placar();
 403  00c3 cd0232        	call	_Contagem_Placar
 405                     ; 241 		Delay_ms_Timer(500);  // Espera 300ms
 407  00c6 ae01f4        	ldw	x,#500
 408  00c9 cd03de        	call	_Delay_ms_Timer
 410                     ; 233 	for (i = 0; i < 3; i++)
 412  00cc 0c01          	inc	(OFST+0,sp)
 416  00ce 7b01          	ld	a,(OFST+0,sp)
 417  00d0 a103          	cp	a,#3
 418  00d2 25e7          	jrult	L101
 419                     ; 243 }
 422  00d4 84            	pop	a
 423  00d5 81            	ret
 450                     ; 249 void I2C_Init_DS1307(void)
 450                     ; 250 {
 451                     	switch	.text
 452  00d6               _I2C_Init_DS1307:
 456                     ; 251 	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
 458  00d6 4bb0          	push	#176
 459  00d8 4b10          	push	#16
 460  00da ae5005        	ldw	x,#20485
 461  00dd cd0000        	call	_GPIO_Init
 463  00e0 85            	popw	x
 464                     ; 252 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);
 466  00e1 4bb0          	push	#176
 467  00e3 4b20          	push	#32
 468  00e5 ae5005        	ldw	x,#20485
 469  00e8 cd0000        	call	_GPIO_Init
 471  00eb 85            	popw	x
 472                     ; 254 	I2C_DeInit();
 474  00ec cd0000        	call	_I2C_DeInit
 476                     ; 255 	I2C_Init(100000, DS1307_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
 478  00ef 4b10          	push	#16
 479  00f1 4b00          	push	#0
 480  00f3 4b01          	push	#1
 481  00f5 4b00          	push	#0
 482  00f7 ae00d0        	ldw	x,#208
 483  00fa 89            	pushw	x
 484  00fb ae86a0        	ldw	x,#34464
 485  00fe 89            	pushw	x
 486  00ff ae0001        	ldw	x,#1
 487  0102 89            	pushw	x
 488  0103 cd0000        	call	_I2C_Init
 490  0106 5b0a          	addw	sp,#10
 491                     ; 256 	I2C_Cmd(ENABLE);
 493  0108 a601          	ld	a,#1
 494  010a cd0000        	call	_I2C_Cmd
 496                     ; 257 }
 499  010d 81            	ret
 547                     ; 262 void DS1307_Write(uint8_t reg, uint8_t data)
 547                     ; 263 {
 548                     	switch	.text
 549  010e               _DS1307_Write:
 551  010e 89            	pushw	x
 552       00000000      OFST:	set	0
 555                     ; 264 	I2C_GenerateSTART(ENABLE);
 557  010f a601          	ld	a,#1
 558  0111 cd0000        	call	_I2C_GenerateSTART
 561  0114               L341:
 562                     ; 265 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 564  0114 ae0301        	ldw	x,#769
 565  0117 cd0000        	call	_I2C_CheckEvent
 567  011a 4d            	tnz	a
 568  011b 27f7          	jreq	L341
 569                     ; 267 	I2C_Send7bitAddress(DS1307_ADDRESS, I2C_DIRECTION_TX);
 571  011d aed000        	ldw	x,#53248
 572  0120 cd0000        	call	_I2C_Send7bitAddress
 575  0123               L151:
 576                     ; 268 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 578  0123 ae0782        	ldw	x,#1922
 579  0126 cd0000        	call	_I2C_CheckEvent
 581  0129 4d            	tnz	a
 582  012a 27f7          	jreq	L151
 583                     ; 270 	I2C_SendData(reg);
 585  012c 7b01          	ld	a,(OFST+1,sp)
 586  012e cd0000        	call	_I2C_SendData
 589  0131               L751:
 590                     ; 271 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 592  0131 ae0784        	ldw	x,#1924
 593  0134 cd0000        	call	_I2C_CheckEvent
 595  0137 4d            	tnz	a
 596  0138 27f7          	jreq	L751
 597                     ; 273 	I2C_SendData(data);
 599  013a 7b02          	ld	a,(OFST+2,sp)
 600  013c cd0000        	call	_I2C_SendData
 603  013f               L561:
 604                     ; 274 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 606  013f ae0784        	ldw	x,#1924
 607  0142 cd0000        	call	_I2C_CheckEvent
 609  0145 4d            	tnz	a
 610  0146 27f7          	jreq	L561
 611                     ; 276 	I2C_GenerateSTOP(ENABLE);
 613  0148 a601          	ld	a,#1
 614  014a cd0000        	call	_I2C_GenerateSTOP
 616                     ; 277 }
 619  014d 85            	popw	x
 620  014e 81            	ret
 670                     ; 279 uint8_t DS1307_Read(uint8_t reg)
 670                     ; 280 {
 671                     	switch	.text
 672  014f               _DS1307_Read:
 674  014f 88            	push	a
 675  0150 88            	push	a
 676       00000001      OFST:	set	1
 679                     ; 283 	I2C_GenerateSTART(ENABLE);
 681  0151 a601          	ld	a,#1
 682  0153 cd0000        	call	_I2C_GenerateSTART
 685  0156               L512:
 686                     ; 284 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 688  0156 ae0301        	ldw	x,#769
 689  0159 cd0000        	call	_I2C_CheckEvent
 691  015c 4d            	tnz	a
 692  015d 27f7          	jreq	L512
 693                     ; 286 	I2C_Send7bitAddress(DS1307_ADDRESS, I2C_DIRECTION_TX);
 695  015f aed000        	ldw	x,#53248
 696  0162 cd0000        	call	_I2C_Send7bitAddress
 699  0165               L322:
 700                     ; 287 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));
 702  0165 ae0782        	ldw	x,#1922
 703  0168 cd0000        	call	_I2C_CheckEvent
 705  016b 4d            	tnz	a
 706  016c 27f7          	jreq	L322
 707                     ; 289 	I2C_SendData(reg);
 709  016e 7b02          	ld	a,(OFST+1,sp)
 710  0170 cd0000        	call	_I2C_SendData
 713  0173               L132:
 714                     ; 290 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 716  0173 ae0784        	ldw	x,#1924
 717  0176 cd0000        	call	_I2C_CheckEvent
 719  0179 4d            	tnz	a
 720  017a 27f7          	jreq	L132
 721                     ; 292 	I2C_GenerateSTART(ENABLE);
 723  017c a601          	ld	a,#1
 724  017e cd0000        	call	_I2C_GenerateSTART
 727  0181               L732:
 728                     ; 293 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));
 730  0181 ae0301        	ldw	x,#769
 731  0184 cd0000        	call	_I2C_CheckEvent
 733  0187 4d            	tnz	a
 734  0188 27f7          	jreq	L732
 735                     ; 295 	I2C_Send7bitAddress(DS1307_ADDRESS, I2C_DIRECTION_RX);
 737  018a aed001        	ldw	x,#53249
 738  018d cd0000        	call	_I2C_Send7bitAddress
 741  0190               L542:
 742                     ; 296 	while (!I2C_CheckEvent(I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED));
 744  0190 ae0302        	ldw	x,#770
 745  0193 cd0000        	call	_I2C_CheckEvent
 747  0196 4d            	tnz	a
 748  0197 27f7          	jreq	L542
 749                     ; 298 	value = I2C_ReceiveData();
 751  0199 cd0000        	call	_I2C_ReceiveData
 753  019c 6b01          	ld	(OFST+0,sp),a
 755                     ; 299 	I2C_AcknowledgeConfig(I2C_ACK_NONE);
 757  019e 4f            	clr	a
 758  019f cd0000        	call	_I2C_AcknowledgeConfig
 760                     ; 300 	I2C_GenerateSTOP(ENABLE);
 762  01a2 a601          	ld	a,#1
 763  01a4 cd0000        	call	_I2C_GenerateSTOP
 765                     ; 302 	return value;
 767  01a7 7b01          	ld	a,(OFST+0,sp)
 770  01a9 85            	popw	x
 771  01aa 81            	ret
 808                     ; 305 void DS1307_StartOscillator(void) 
 808                     ; 306 {
 809                     	switch	.text
 810  01ab               _DS1307_StartOscillator:
 812  01ab 88            	push	a
 813       00000001      OFST:	set	1
 816                     ; 307 	uint8_t segundos = DS1307_Read(DS1307_SECONDS_REG);
 818  01ac 4f            	clr	a
 819  01ad ada0          	call	_DS1307_Read
 821  01af 6b01          	ld	(OFST+0,sp),a
 823                     ; 308 	if (segundos & 0x80) 
 825  01b1 7b01          	ld	a,(OFST+0,sp)
 826  01b3 a580          	bcp	a,#128
 827  01b5 2709          	jreq	L762
 828                     ; 310 		DS1307_Write(DS1307_SECONDS_REG, segundos & 0x7F); // Zera o bit CH
 830  01b7 7b01          	ld	a,(OFST+0,sp)
 831  01b9 a47f          	and	a,#127
 832  01bb 5f            	clrw	x
 833  01bc 97            	ld	xl,a
 834  01bd cd010e        	call	_DS1307_Write
 836  01c0               L762:
 837                     ; 312 }
 840  01c0 84            	pop	a
 841  01c1 81            	ret
 866                     ; 314 void DS1307_EnableSQW_1Hz(void)
 866                     ; 315 {
 867                     	switch	.text
 868  01c2               _DS1307_EnableSQW_1Hz:
 872                     ; 316 	DS1307_Write(DS1307_CTRL_REG, 0x10);  // SQWE=1, RS1=0, RS0=0 ? 1Hz
 874  01c2 ae0710        	ldw	x,#1808
 875  01c5 cd010e        	call	_DS1307_Write
 877                     ; 317 }
 880  01c8 81            	ret
 916                     ; 322 void WriteBCD(uint8_t valor)
 916                     ; 323 {
 917                     	switch	.text
 918  01c9               _WriteBCD:
 920  01c9 88            	push	a
 921       00000000      OFST:	set	0
 924                     ; 324 	if (valor & 0x01) GPIO_WriteHigh(LD_A_PORT, LD_A_PIN); else GPIO_WriteLow(LD_A_PORT, LD_A_PIN);
 926  01ca a501          	bcp	a,#1
 927  01cc 270b          	jreq	L713
 930  01ce 4b01          	push	#1
 931  01d0 ae5005        	ldw	x,#20485
 932  01d3 cd0000        	call	_GPIO_WriteHigh
 934  01d6 84            	pop	a
 936  01d7 2009          	jra	L123
 937  01d9               L713:
 940  01d9 4b01          	push	#1
 941  01db ae5005        	ldw	x,#20485
 942  01de cd0000        	call	_GPIO_WriteLow
 944  01e1 84            	pop	a
 945  01e2               L123:
 946                     ; 325 	if (valor & 0x02) GPIO_WriteHigh(LD_B_PORT, LD_B_PIN); else GPIO_WriteLow(LD_B_PORT, LD_B_PIN);
 948  01e2 7b01          	ld	a,(OFST+1,sp)
 949  01e4 a502          	bcp	a,#2
 950  01e6 270b          	jreq	L323
 953  01e8 4b02          	push	#2
 954  01ea ae5005        	ldw	x,#20485
 955  01ed cd0000        	call	_GPIO_WriteHigh
 957  01f0 84            	pop	a
 959  01f1 2009          	jra	L523
 960  01f3               L323:
 963  01f3 4b02          	push	#2
 964  01f5 ae5005        	ldw	x,#20485
 965  01f8 cd0000        	call	_GPIO_WriteLow
 967  01fb 84            	pop	a
 968  01fc               L523:
 969                     ; 326 	if (valor & 0x04) GPIO_WriteHigh(LD_C_PORT, LD_C_PIN); else GPIO_WriteLow(LD_C_PORT, LD_C_PIN);
 971  01fc 7b01          	ld	a,(OFST+1,sp)
 972  01fe a504          	bcp	a,#4
 973  0200 270b          	jreq	L723
 976  0202 4b04          	push	#4
 977  0204 ae5005        	ldw	x,#20485
 978  0207 cd0000        	call	_GPIO_WriteHigh
 980  020a 84            	pop	a
 982  020b 2009          	jra	L133
 983  020d               L723:
 986  020d 4b04          	push	#4
 987  020f ae5005        	ldw	x,#20485
 988  0212 cd0000        	call	_GPIO_WriteLow
 990  0215 84            	pop	a
 991  0216               L133:
 992                     ; 327 	if (valor & 0x08) GPIO_WriteHigh(LD_D_PORT, LD_D_PIN); else GPIO_WriteLow(LD_D_PORT, LD_D_PIN);
 994  0216 7b01          	ld	a,(OFST+1,sp)
 995  0218 a508          	bcp	a,#8
 996  021a 270b          	jreq	L333
 999  021c 4b08          	push	#8
1000  021e ae5005        	ldw	x,#20485
1001  0221 cd0000        	call	_GPIO_WriteHigh
1003  0224 84            	pop	a
1005  0225 2009          	jra	L533
1006  0227               L333:
1009  0227 4b08          	push	#8
1010  0229 ae5005        	ldw	x,#20485
1011  022c cd0000        	call	_GPIO_WriteLow
1013  022f 84            	pop	a
1014  0230               L533:
1015                     ; 328 }
1018  0230 84            	pop	a
1019  0231 81            	ret
1074                     ; 330 void Contagem_Placar(void)
1074                     ; 331 {
1075                     	switch	.text
1076  0232               _Contagem_Placar:
1078  0232 89            	pushw	x
1079       00000002      OFST:	set	2
1082                     ; 337 	uint8_t minutos = seg_valor / 60;
1084  0233 be01          	ldw	x,_seg_valor
1085  0235 a63c          	ld	a,#60
1086  0237 62            	div	x,a
1087  0238 01            	rrwa	x,a
1088  0239 6b01          	ld	(OFST-1,sp),a
1089  023b 02            	rlwa	x,a
1091                     ; 338 	uint8_t segundos = seg_valor % 60;
1093  023c be01          	ldw	x,_seg_valor
1094  023e a63c          	ld	a,#60
1095  0240 62            	div	x,a
1096  0241 5f            	clrw	x
1097  0242 97            	ld	xl,a
1098  0243 01            	rrwa	x,a
1099  0244 6b02          	ld	(OFST+0,sp),a
1100  0246 02            	rlwa	x,a
1102                     ; 340 	seg_unidades  = segundos % 10;
1104  0247 7b02          	ld	a,(OFST+0,sp)
1105  0249 5f            	clrw	x
1106  024a 97            	ld	xl,a
1107  024b a60a          	ld	a,#10
1108  024d 62            	div	x,a
1109  024e 5f            	clrw	x
1110  024f 97            	ld	xl,a
1111  0250 9f            	ld	a,xl
1112  0251 b703          	ld	_seg_unidades,a
1113                     ; 341 	seg_dezenas   = segundos / 10;
1115  0253 7b02          	ld	a,(OFST+0,sp)
1116  0255 5f            	clrw	x
1117  0256 97            	ld	xl,a
1118  0257 a60a          	ld	a,#10
1119  0259 62            	div	x,a
1120  025a 9f            	ld	a,xl
1121  025b b704          	ld	_seg_dezenas,a
1122                     ; 342 	min_unidades  = minutos % 10;
1124  025d 7b01          	ld	a,(OFST-1,sp)
1125  025f 5f            	clrw	x
1126  0260 97            	ld	xl,a
1127  0261 a60a          	ld	a,#10
1128  0263 62            	div	x,a
1129  0264 5f            	clrw	x
1130  0265 97            	ld	xl,a
1131  0266 9f            	ld	a,xl
1132  0267 b705          	ld	_min_unidades,a
1133                     ; 343 	min_dezenas   = minutos / 10;
1135  0269 7b01          	ld	a,(OFST-1,sp)
1136  026b 5f            	clrw	x
1137  026c 97            	ld	xl,a
1138  026d a60a          	ld	a,#10
1139  026f 62            	div	x,a
1140  0270 9f            	ld	a,xl
1141  0271 b706          	ld	_min_dezenas,a
1142                     ; 346 	WriteBCD(seg_unidades);
1144  0273 b603          	ld	a,_seg_unidades
1145  0275 cd01c9        	call	_WriteBCD
1147                     ; 347 	GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN);
1149  0278 4b20          	push	#32
1150  027a ae5014        	ldw	x,#20500
1151  027d cd0000        	call	_GPIO_WriteHigh
1153  0280 84            	pop	a
1154                     ; 348 	NOP(); NOP(); NOP(); NOP();
1157  0281 9d            nop
1162  0282 9d            nop
1167  0283 9d            nop
1172  0284 9d            nop
1174                     ; 349 	GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
1176  0285 4b20          	push	#32
1177  0287 ae5014        	ldw	x,#20500
1178  028a cd0000        	call	_GPIO_WriteLow
1180  028d 84            	pop	a
1181                     ; 352 	WriteBCD(seg_dezenas);
1183  028e b604          	ld	a,_seg_dezenas
1184  0290 cd01c9        	call	_WriteBCD
1186                     ; 353 	GPIO_WriteHigh(LATCH_02_PORT, LATCH_02_PIN);
1188  0293 4b02          	push	#2
1189  0295 ae500a        	ldw	x,#20490
1190  0298 cd0000        	call	_GPIO_WriteHigh
1192  029b 84            	pop	a
1193                     ; 354 	NOP(); NOP(); NOP(); NOP();
1196  029c 9d            nop
1201  029d 9d            nop
1206  029e 9d            nop
1211  029f 9d            nop
1213                     ; 355 	GPIO_WriteLow(LATCH_02_PORT, LATCH_02_PIN);
1215  02a0 4b02          	push	#2
1216  02a2 ae500a        	ldw	x,#20490
1217  02a5 cd0000        	call	_GPIO_WriteLow
1219  02a8 84            	pop	a
1220                     ; 358 	WriteBCD(min_unidades);
1222  02a9 b605          	ld	a,_min_unidades
1223  02ab cd01c9        	call	_WriteBCD
1225                     ; 359 	GPIO_WriteHigh(LATCH_03_PORT, LATCH_03_PIN);
1227  02ae 4b04          	push	#4
1228  02b0 ae500a        	ldw	x,#20490
1229  02b3 cd0000        	call	_GPIO_WriteHigh
1231  02b6 84            	pop	a
1232                     ; 360 	NOP(); NOP(); NOP(); NOP();
1235  02b7 9d            nop
1240  02b8 9d            nop
1245  02b9 9d            nop
1250  02ba 9d            nop
1252                     ; 361 	GPIO_WriteLow(LATCH_03_PORT, LATCH_03_PIN);
1254  02bb 4b04          	push	#4
1255  02bd ae500a        	ldw	x,#20490
1256  02c0 cd0000        	call	_GPIO_WriteLow
1258  02c3 84            	pop	a
1259                     ; 364 	WriteBCD(min_dezenas);
1261  02c4 b606          	ld	a,_min_dezenas
1262  02c6 cd01c9        	call	_WriteBCD
1264                     ; 365 	GPIO_WriteHigh(LATCH_04_PORT, LATCH_04_PIN);
1266  02c9 4b08          	push	#8
1267  02cb ae500a        	ldw	x,#20490
1268  02ce cd0000        	call	_GPIO_WriteHigh
1270  02d1 84            	pop	a
1271                     ; 366 	NOP(); NOP(); NOP(); NOP();
1274  02d2 9d            nop
1279  02d3 9d            nop
1284  02d4 9d            nop
1289  02d5 9d            nop
1291                     ; 367 	GPIO_WriteLow(LATCH_04_PORT, LATCH_04_PIN);
1293  02d6 4b08          	push	#8
1294  02d8 ae500a        	ldw	x,#20490
1295  02db cd0000        	call	_GPIO_WriteLow
1297  02de 84            	pop	a
1298                     ; 371 	unidade = tempo_restante % 10;
1300  02df b611          	ld	a,_tempo_restante
1301  02e1 5f            	clrw	x
1302  02e2 97            	ld	xl,a
1303  02e3 a60a          	ld	a,#10
1304  02e5 62            	div	x,a
1305  02e6 5f            	clrw	x
1306  02e7 97            	ld	xl,a
1307  02e8 9f            	ld	a,xl
1308  02e9 b712          	ld	_unidade,a
1309                     ; 372 	dezena = tempo_restante / 10;
1311  02eb b611          	ld	a,_tempo_restante
1312  02ed 5f            	clrw	x
1313  02ee 97            	ld	xl,a
1314  02ef a60a          	ld	a,#10
1315  02f1 62            	div	x,a
1316  02f2 9f            	ld	a,xl
1317  02f3 b713          	ld	_dezena,a
1318                     ; 374 	WriteBCD(unidade);
1320  02f5 b612          	ld	a,_unidade
1321  02f7 cd01c9        	call	_WriteBCD
1323                     ; 375 	GPIO_WriteHigh(LATCH_05_PORT, LATCH_05_PIN);
1325  02fa 4b10          	push	#16
1326  02fc ae500a        	ldw	x,#20490
1327  02ff cd0000        	call	_GPIO_WriteHigh
1329  0302 84            	pop	a
1330                     ; 376 	NOP(); NOP(); NOP(); NOP();
1333  0303 9d            nop
1338  0304 9d            nop
1343  0305 9d            nop
1348  0306 9d            nop
1350                     ; 377 	GPIO_WriteLow(LATCH_05_PORT, LATCH_05_PIN);	
1352  0307 4b10          	push	#16
1353  0309 ae500a        	ldw	x,#20490
1354  030c cd0000        	call	_GPIO_WriteLow
1356  030f 84            	pop	a
1357                     ; 379 	WriteBCD(dezena);
1359  0310 b613          	ld	a,_dezena
1360  0312 cd01c9        	call	_WriteBCD
1362                     ; 380 	GPIO_WriteHigh(LATCH_06_PORT, LATCH_06_PIN);
1364  0315 4b20          	push	#32
1365  0317 ae500a        	ldw	x,#20490
1366  031a cd0000        	call	_GPIO_WriteHigh
1368  031d 84            	pop	a
1369                     ; 381 	NOP(); NOP(); NOP(); NOP();
1372  031e 9d            nop
1377  031f 9d            nop
1382  0320 9d            nop
1387  0321 9d            nop
1389                     ; 382 	GPIO_WriteLow(LATCH_06_PORT, LATCH_06_PIN);	
1391  0322 4b20          	push	#32
1392  0324 ae500a        	ldw	x,#20490
1393  0327 cd0000        	call	_GPIO_WriteLow
1395  032a 84            	pop	a
1396                     ; 384 }
1399  032b 85            	popw	x
1400  032c 81            	ret
1424                     ; 386 void InitGPIO(void)
1424                     ; 387 {
1425                     	switch	.text
1426  032d               _InitGPIO:
1430                     ; 389 	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1432  032d 4be0          	push	#224
1433  032f 4b01          	push	#1
1434  0331 ae5005        	ldw	x,#20485
1435  0334 cd0000        	call	_GPIO_Init
1437  0337 85            	popw	x
1438                     ; 390 	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1440  0338 4be0          	push	#224
1441  033a 4b02          	push	#2
1442  033c ae5005        	ldw	x,#20485
1443  033f cd0000        	call	_GPIO_Init
1445  0342 85            	popw	x
1446                     ; 391 	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1448  0343 4be0          	push	#224
1449  0345 4b04          	push	#4
1450  0347 ae5005        	ldw	x,#20485
1451  034a cd0000        	call	_GPIO_Init
1453  034d 85            	popw	x
1454                     ; 392 	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1456  034e 4be0          	push	#224
1457  0350 4b08          	push	#8
1458  0352 ae5005        	ldw	x,#20485
1459  0355 cd0000        	call	_GPIO_Init
1461  0358 85            	popw	x
1462                     ; 394 	GPIO_Init(RELE_PORT, RELE_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1464  0359 4be0          	push	#224
1465  035b 4b40          	push	#64
1466  035d ae500a        	ldw	x,#20490
1467  0360 cd0000        	call	_GPIO_Init
1469  0363 85            	popw	x
1470                     ; 396 	GPIO_Init(Cadastro_PORT, Cadastro_PIN, GPIO_MODE_IN_PU_NO_IT);
1472  0364 4b40          	push	#64
1473  0366 4b20          	push	#32
1474  0368 ae500f        	ldw	x,#20495
1475  036b cd0000        	call	_GPIO_Init
1477  036e 85            	popw	x
1478                     ; 399 	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1480  036f 4be0          	push	#224
1481  0371 4b20          	push	#32
1482  0373 ae5014        	ldw	x,#20500
1483  0376 cd0000        	call	_GPIO_Init
1485  0379 85            	popw	x
1486                     ; 400 	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1488  037a 4be0          	push	#224
1489  037c 4b02          	push	#2
1490  037e ae500a        	ldw	x,#20490
1491  0381 cd0000        	call	_GPIO_Init
1493  0384 85            	popw	x
1494                     ; 401 	GPIO_Init(LATCH_03_PORT, LATCH_03_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1496  0385 4be0          	push	#224
1497  0387 4b04          	push	#4
1498  0389 ae500a        	ldw	x,#20490
1499  038c cd0000        	call	_GPIO_Init
1501  038f 85            	popw	x
1502                     ; 402 	GPIO_Init(LATCH_04_PORT, LATCH_04_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1504  0390 4be0          	push	#224
1505  0392 4b08          	push	#8
1506  0394 ae500a        	ldw	x,#20490
1507  0397 cd0000        	call	_GPIO_Init
1509  039a 85            	popw	x
1510                     ; 404 	GPIO_Init(LATCH_05_PORT, LATCH_05_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1512  039b 4be0          	push	#224
1513  039d 4b10          	push	#16
1514  039f ae500a        	ldw	x,#20490
1515  03a2 cd0000        	call	_GPIO_Init
1517  03a5 85            	popw	x
1518                     ; 405 	GPIO_Init(LATCH_06_PORT, LATCH_06_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
1520  03a6 4be0          	push	#224
1521  03a8 4b20          	push	#32
1522  03aa ae500a        	ldw	x,#20490
1523  03ad cd0000        	call	_GPIO_Init
1525  03b0 85            	popw	x
1526                     ; 408 	GPIO_Init(SQW_PIN_PORT, SQW_PIN, GPIO_MODE_IN_FL_IT);
1528  03b1 4b20          	push	#32
1529  03b3 4b40          	push	#64
1530  03b5 ae5005        	ldw	x,#20485
1531  03b8 cd0000        	call	_GPIO_Init
1533  03bb 85            	popw	x
1534                     ; 409 }
1537  03bc 81            	ret
1566                     ; 411 void setup_tim6(void)
1566                     ; 412 {
1567                     	switch	.text
1568  03bd               _setup_tim6:
1572                     ; 414 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER6, ENABLE);
1574  03bd ae0401        	ldw	x,#1025
1575  03c0 cd0000        	call	_CLK_PeripheralClockConfig
1577                     ; 417 	TIM6_PrescalerConfig(TIM6_PRESCALER_64, TIM6_PSCRELOADMODE_IMMEDIATE);
1579  03c3 ae0601        	ldw	x,#1537
1580  03c6 cd0000        	call	_TIM6_PrescalerConfig
1582                     ; 421 	TIM6_SetCounter(0); // Zera o contador
1584  03c9 4f            	clr	a
1585  03ca cd0000        	call	_TIM6_SetCounter
1587                     ; 422 	TIM6_SetAutoreload(249);
1589  03cd a6f9          	ld	a,#249
1590  03cf cd0000        	call	_TIM6_SetAutoreload
1592                     ; 425 	TIM6_ITConfig(TIM6_IT_UPDATE, ENABLE);
1594  03d2 ae0101        	ldw	x,#257
1595  03d5 cd0000        	call	_TIM6_ITConfig
1597                     ; 428 	TIM6_Cmd(ENABLE);
1599  03d8 a601          	ld	a,#1
1600  03da cd0000        	call	_TIM6_Cmd
1602                     ; 432 }
1605  03dd 81            	ret
1642                     ; 434 void Delay_ms_Timer(uint16_t ms)
1642                     ; 435 {
1643                     	switch	.text
1644  03de               _Delay_ms_Timer:
1646  03de 89            	pushw	x
1647       00000000      OFST:	set	0
1650  03df 2011          	jra	L124
1651  03e1               L714:
1652                     ; 438 		TIM6_SetCounter(0);
1654  03e1 4f            	clr	a
1655  03e2 cd0000        	call	_TIM6_SetCounter
1657                     ; 439 		TIM6_ClearFlag(TIM6_FLAG_UPDATE);
1659  03e5 a601          	ld	a,#1
1660  03e7 cd0000        	call	_TIM6_ClearFlag
1663  03ea               L724:
1664                     ; 440 		while(TIM6_GetFlagStatus(TIM6_FLAG_UPDATE) == RESET);
1666  03ea a601          	ld	a,#1
1667  03ec cd0000        	call	_TIM6_GetFlagStatus
1669  03ef 4d            	tnz	a
1670  03f0 27f8          	jreq	L724
1671  03f2               L124:
1672                     ; 436 	while(ms--)
1674  03f2 1e01          	ldw	x,(OFST+1,sp)
1675  03f4 1d0001        	subw	x,#1
1676  03f7 1f01          	ldw	(OFST+1,sp),x
1677  03f9 1c0001        	addw	x,#1
1678  03fc a30000        	cpw	x,#0
1679  03ff 26e0          	jrne	L714
1680                     ; 442 }
1683  0401 85            	popw	x
1684  0402 81            	ret
1884                     	xdef	_main
1885                     	xdef	_Piscar_Display
1886                     	xdef	_Display_Off
1887                     	xdef	_contador_placar
1888                     	xdef	_Delay_ms_Timer
1889                     	xdef	_setup_tim6
1890                     	xdef	_InitGPIO
1891                     	xdef	_Contagem_Placar
1892                     	xdef	_WriteBCD
1893                     	xdef	_DS1307_EnableSQW_1Hz
1894                     	xdef	_DS1307_StartOscillator
1895                     	xdef	_DS1307_Read
1896                     	xdef	_DS1307_Write
1897                     	xdef	_I2C_Init_DS1307
1898                     	xdef	_rele_time
1899                     	xdef	_dezena
1900                     	xdef	_unidade
1901                     	xdef	_tempo_restante
1902                     	xdef	_fim_contagem_estado
1903                     	xdef	_flag_start
1904                     	xdef	_flag_run
1905                     .eeprom:	section	.data
1906  0000               _CodControler:
1907  0000 00000000      	ds.b	4
1908                     	xdef	_CodControler
1909                     	xdef	_rf_cooldown
1910                     	xdef	_debounceCh2
1911                     	xdef	_debounceCh1
1912                     	xdef	_RF_IN_ON
1913                     	xdef	_min_dezenas
1914                     	xdef	_min_unidades
1915                     	xdef	_seg_dezenas
1916                     	xdef	_seg_unidades
1917                     	xdef	_seg_valor
1918                     	xdef	_last_state
1919                     	xref	_TIM6_GetFlagStatus
1920                     	xref	_TIM6_ClearFlag
1921                     	xref	_TIM6_ITConfig
1922                     	xref	_TIM6_SetAutoreload
1923                     	xref	_TIM6_SetCounter
1924                     	xref	_TIM6_PrescalerConfig
1925                     	xref	_TIM6_Cmd
1926                     	xref	_I2C_CheckEvent
1927                     	xref	_I2C_SendData
1928                     	xref	_I2C_Send7bitAddress
1929                     	xref	_I2C_ReceiveData
1930                     	xref	_I2C_AcknowledgeConfig
1931                     	xref	_I2C_GenerateSTOP
1932                     	xref	_I2C_GenerateSTART
1933                     	xref	_I2C_Cmd
1934                     	xref	_I2C_Init
1935                     	xref	_I2C_DeInit
1936                     	xref	_GPIO_ReadInputPin
1937                     	xref	_GPIO_WriteLow
1938                     	xref	_GPIO_WriteHigh
1939                     	xref	_GPIO_Init
1940                     	xref	_CLK_HSIPrescalerConfig
1941                     	xref	_CLK_PeripheralClockConfig
1961                     	end
