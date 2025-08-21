   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
  14                     	bsct
  15  0000               _g_led_state:
  16  0000 00            	dc.b	0
  17  0001               _g_system_ticks:
  18  0001 00000000      	dc.l	0
  52                     ; 31 void TIM5_Config(void) {
  54                     	switch	.text
  55  0000               _TIM5_Config:
  59                     ; 33     CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER5, ENABLE);
  61  0000 ae0501        	ldw	x,#1281
  62  0003 cd0000        	call	_CLK_PeripheralClockConfig
  64                     ; 39     TIM5_TimeBaseInit(TIM5_PRESCALER_16, 999); // O valor do período é N-1, então 1000-1 = 999
  66  0006 ae03e7        	ldw	x,#999
  67  0009 89            	pushw	x
  68  000a a604          	ld	a,#4
  69  000c cd0000        	call	_TIM5_TimeBaseInit
  71  000f 85            	popw	x
  72                     ; 41     TIM5_ClearFlag(TIM5_FLAG_UPDATE);
  74  0010 ae0001        	ldw	x,#1
  75  0013 cd0000        	call	_TIM5_ClearFlag
  77                     ; 42     TIM5_ITConfig(TIM5_IT_UPDATE, ENABLE);
  79  0016 ae0101        	ldw	x,#257
  80  0019 cd0000        	call	_TIM5_ITConfig
  82                     ; 43     TIM5_Cmd(ENABLE);
  84  001c a601          	ld	a,#1
  85  001e cd0000        	call	_TIM5_Cmd
  87                     ; 44 }
  90  0021 81            	ret
 116                     ; 47 @far @interrupt void TIM5_UPD_OVF_BRK_IRQHandler(void) {
 118                     	switch	.text
 119  0022               f_TIM5_UPD_OVF_BRK_IRQHandler:
 121  0022 8a            	push	cc
 122  0023 84            	pop	a
 123  0024 a4bf          	and	a,#191
 124  0026 88            	push	a
 125  0027 86            	pop	cc
 126  0028 3b0002        	push	c_x+2
 127  002b be00          	ldw	x,c_x
 128  002d 89            	pushw	x
 129  002e 3b0002        	push	c_y+2
 130  0031 be00          	ldw	x,c_y
 131  0033 89            	pushw	x
 134                     ; 48     g_system_ticks++; // O coração do sistema bate aqui!
 136  0034 ae0001        	ldw	x,#_g_system_ticks
 137  0037 a601          	ld	a,#1
 138  0039 cd0000        	call	c_lgadc
 140                     ; 49     TIM5_ClearITPendingBit(TIM5_IT_UPDATE);
 142  003c a601          	ld	a,#1
 143  003e cd0000        	call	_TIM5_ClearITPendingBit
 145                     ; 50 }
 148  0041 85            	popw	x
 149  0042 bf00          	ldw	c_y,x
 150  0044 320002        	pop	c_y+2
 151  0047 85            	popw	x
 152  0048 bf00          	ldw	c_x,x
 153  004a 320002        	pop	c_x+2
 154  004d 80            	iret
 156                     	bsct
 157  0005               L13_tempo_ultima_troca:
 158  0005 00000000      	dc.l	0
 198                     .const:	section	.text
 199  0000               L21:
 200  0000 000001f4      	dc.l	500
 201                     ; 56 void main(void) {
 202                     	scross	off
 203                     	switch	.text
 204  004e               _main:
 208                     ; 59     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // 16MHz
 210  004e 4f            	clr	a
 211  004f cd0000        	call	_CLK_HSIPrescalerConfig
 213                     ; 60     GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
 215  0052 4be0          	push	#224
 216  0054 4b20          	push	#32
 217  0056 ae5005        	ldw	x,#20485
 218  0059 cd0000        	call	_GPIO_Init
 220  005c 85            	popw	x
 221                     ; 63     TIM5_Config();
 223  005d ada1          	call	_TIM5_Config
 225                     ; 64     enableInterrupts();
 228  005f 9a            rim
 230  0060               L75:
 231                     ; 70         switch (g_led_state) {
 233  0060 b600          	ld	a,_g_led_state
 235                     ; 90                 break;
 236  0062 4d            	tnz	a
 237  0063 2707          	jreq	L33
 238  0065 4a            	dec	a
 239  0066 272f          	jreq	L53
 240  0068               L73:
 241                     ; 88             default:
 241                     ; 89                 g_led_state = STATE_LED_APAGADO;
 243  0068 3f00          	clr	_g_led_state
 244                     ; 90                 break;
 246  006a 20f4          	jra	L75
 247  006c               L33:
 248                     ; 72             case STATE_LED_APAGADO:
 248                     ; 73                 if (g_system_ticks - tempo_ultima_troca >= BLINK_INTERVAL_MS) {
 250  006c ae0001        	ldw	x,#_g_system_ticks
 251  006f cd0000        	call	c_ltor
 253  0072 ae0005        	ldw	x,#L13_tempo_ultima_troca
 254  0075 cd0000        	call	c_lsub
 256  0078 ae0000        	ldw	x,#L21
 257  007b cd0000        	call	c_lcmp
 259  007e 25e0          	jrult	L75
 260                     ; 74                     GPIO_WriteHigh(LED_PORT, LED_PIN);
 262  0080 4b20          	push	#32
 263  0082 ae5005        	ldw	x,#20485
 264  0085 cd0000        	call	_GPIO_WriteHigh
 266  0088 84            	pop	a
 267                     ; 75                     tempo_ultima_troca = g_system_ticks;
 269  0089 be03          	ldw	x,_g_system_ticks+2
 270  008b bf07          	ldw	L13_tempo_ultima_troca+2,x
 271  008d be01          	ldw	x,_g_system_ticks
 272  008f bf05          	ldw	L13_tempo_ultima_troca,x
 273                     ; 76                     g_led_state = STATE_LED_ACESO;
 275  0091 35010000      	mov	_g_led_state,#1
 276  0095 20c9          	jra	L75
 277  0097               L53:
 278                     ; 80             case STATE_LED_ACESO:
 278                     ; 81                 if (g_system_ticks - tempo_ultima_troca >= BLINK_INTERVAL_MS) {
 280  0097 ae0001        	ldw	x,#_g_system_ticks
 281  009a cd0000        	call	c_ltor
 283  009d ae0005        	ldw	x,#L13_tempo_ultima_troca
 284  00a0 cd0000        	call	c_lsub
 286  00a3 ae0000        	ldw	x,#L21
 287  00a6 cd0000        	call	c_lcmp
 289  00a9 25b5          	jrult	L75
 290                     ; 82                     GPIO_WriteLow(LED_PORT, LED_PIN);
 292  00ab 4b20          	push	#32
 293  00ad ae5005        	ldw	x,#20485
 294  00b0 cd0000        	call	_GPIO_WriteLow
 296  00b3 84            	pop	a
 297                     ; 83                     tempo_ultima_troca = g_system_ticks;
 299  00b4 be03          	ldw	x,_g_system_ticks+2
 300  00b6 bf07          	ldw	L13_tempo_ultima_troca+2,x
 301  00b8 be01          	ldw	x,_g_system_ticks
 302  00ba bf05          	ldw	L13_tempo_ultima_troca,x
 303                     ; 84                     g_led_state = STATE_LED_APAGADO;
 305  00bc 3f00          	clr	_g_led_state
 306  00be 20a0          	jra	L75
 307  00c0               L56:
 308                     ; 90                 break;
 309  00c0 209e          	jra	L75
 363                     	xdef	_main
 364                     	xdef	f_TIM5_UPD_OVF_BRK_IRQHandler
 365                     	xdef	_TIM5_Config
 366                     	xdef	_g_system_ticks
 367                     	xdef	_g_led_state
 368                     	xref	_TIM5_ClearITPendingBit
 369                     	xref	_TIM5_ClearFlag
 370                     	xref	_TIM5_ITConfig
 371                     	xref	_TIM5_Cmd
 372                     	xref	_TIM5_TimeBaseInit
 373                     	xref	_GPIO_WriteLow
 374                     	xref	_GPIO_WriteHigh
 375                     	xref	_GPIO_Init
 376                     	xref	_CLK_HSIPrescalerConfig
 377                     	xref	_CLK_PeripheralClockConfig
 378                     	xref.b	c_x
 379                     	xref.b	c_y
 398                     	xref	c_lcmp
 399                     	xref	c_lsub
 400                     	xref	c_ltor
 401                     	xref	c_lgadc
 402                     	end
