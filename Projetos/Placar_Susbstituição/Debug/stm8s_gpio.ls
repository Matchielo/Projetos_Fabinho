   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.4 - 15 Jan 2025
   4                     ; Optimizer V4.6.4 - 15 Jan 2025
 114                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 114                     ; 54 {
 116                     .text:	section	.text,new
 117  0000               _GPIO_DeInit:
 121                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0000 7f            	clr	(x)
 124                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0001 6f02          	clr	(2,x)
 127                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0003 6f03          	clr	(3,x)
 130                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 132  0005 6f04          	clr	(4,x)
 133                     ; 59 }
 136  0007 81            	ret	
 376                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 376                     ; 72 {
 377                     .text:	section	.text,new
 378  0000               _GPIO_Init:
 380  0000 89            	pushw	x
 381       00000000      OFST:	set	0
 384                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 386                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 388                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 390  0001 7b05          	ld	a,(OFST+5,sp)
 391  0003 43            	cpl	a
 392  0004 e404          	and	a,(4,x)
 393  0006 e704          	ld	(4,x),a
 394                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 396  0008 7b06          	ld	a,(OFST+6,sp)
 397  000a 2a16          	jrpl	L771
 398                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 400  000c a510          	bcp	a,#16
 401  000e 2705          	jreq	L102
 402                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 404  0010 f6            	ld	a,(x)
 405  0011 1a05          	or	a,(OFST+5,sp)
 407  0013 2004          	jra	L302
 408  0015               L102:
 409                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 411  0015 7b05          	ld	a,(OFST+5,sp)
 412  0017 43            	cpl	a
 413  0018 f4            	and	a,(x)
 414  0019               L302:
 415  0019 f7            	ld	(x),a
 416                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 418  001a 1e01          	ldw	x,(OFST+1,sp)
 419  001c e602          	ld	a,(2,x)
 420  001e 1a05          	or	a,(OFST+5,sp)
 422  0020 2005          	jra	L502
 423  0022               L771:
 424                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 426  0022 7b05          	ld	a,(OFST+5,sp)
 427  0024 43            	cpl	a
 428  0025 e402          	and	a,(2,x)
 429  0027               L502:
 430  0027 e702          	ld	(2,x),a
 431                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 433  0029 7b06          	ld	a,(OFST+6,sp)
 434  002b a540          	bcp	a,#64
 435  002d 2706          	jreq	L702
 436                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 438  002f e603          	ld	a,(3,x)
 439  0031 1a05          	or	a,(OFST+5,sp)
 441  0033 2005          	jra	L112
 442  0035               L702:
 443                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 445  0035 7b05          	ld	a,(OFST+5,sp)
 446  0037 43            	cpl	a
 447  0038 e403          	and	a,(3,x)
 448  003a               L112:
 449  003a e703          	ld	(3,x),a
 450                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 452  003c 7b06          	ld	a,(OFST+6,sp)
 453  003e a520          	bcp	a,#32
 454  0040 2706          	jreq	L312
 455                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 457  0042 e604          	ld	a,(4,x)
 458  0044 1a05          	or	a,(OFST+5,sp)
 460  0046 2005          	jra	L512
 461  0048               L312:
 462                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 464  0048 7b05          	ld	a,(OFST+5,sp)
 465  004a 43            	cpl	a
 466  004b e404          	and	a,(4,x)
 467  004d               L512:
 468  004d e704          	ld	(4,x),a
 469                     ; 131 }
 472  004f 85            	popw	x
 473  0050 81            	ret	
 519                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 519                     ; 142 {
 520                     .text:	section	.text,new
 521  0000               _GPIO_Write:
 523       fffffffe      OFST: set -2
 526                     ; 143   GPIOx->ODR = PortVal;
 528  0000 7b03          	ld	a,(OFST+5,sp)
 529  0002 f7            	ld	(x),a
 530                     ; 144 }
 533  0003 81            	ret	
 580                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 580                     ; 155 {
 581                     .text:	section	.text,new
 582  0000               _GPIO_WriteHigh:
 584       fffffffe      OFST: set -2
 587                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 589  0000 f6            	ld	a,(x)
 590  0001 1a03          	or	a,(OFST+5,sp)
 591  0003 f7            	ld	(x),a
 592                     ; 157 }
 595  0004 81            	ret	
 642                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 642                     ; 168 {
 643                     .text:	section	.text,new
 644  0000               _GPIO_WriteLow:
 646       fffffffe      OFST: set -2
 649                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 651  0000 7b03          	ld	a,(OFST+5,sp)
 652  0002 43            	cpl	a
 653  0003 f4            	and	a,(x)
 654  0004 f7            	ld	(x),a
 655                     ; 170 }
 658  0005 81            	ret	
 705                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 705                     ; 181 {
 706                     .text:	section	.text,new
 707  0000               _GPIO_WriteReverse:
 709       fffffffe      OFST: set -2
 712                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 714  0000 f6            	ld	a,(x)
 715  0001 1803          	xor	a,(OFST+5,sp)
 716  0003 f7            	ld	(x),a
 717                     ; 183 }
 720  0004 81            	ret	
 758                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 758                     ; 192 {
 759                     .text:	section	.text,new
 760  0000               _GPIO_ReadOutputData:
 764                     ; 193   return ((uint8_t)GPIOx->ODR);
 766  0000 f6            	ld	a,(x)
 769  0001 81            	ret	
 806                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 806                     ; 203 {
 807                     .text:	section	.text,new
 808  0000               _GPIO_ReadInputData:
 812                     ; 204   return ((uint8_t)GPIOx->IDR);
 814  0000 e601          	ld	a,(1,x)
 817  0002 81            	ret	
 885                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 885                     ; 214 {
 886                     .text:	section	.text,new
 887  0000               _GPIO_ReadInputPin:
 889       fffffffe      OFST: set -2
 892                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 894  0000 e601          	ld	a,(1,x)
 895  0002 1403          	and	a,(OFST+5,sp)
 898  0004 81            	ret	
 976                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 976                     ; 226 {
 977                     .text:	section	.text,new
 978  0000               _GPIO_ExternalPullUpConfig:
 980       fffffffe      OFST: set -2
 983                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 985                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 987                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 989  0000 7b04          	ld	a,(OFST+6,sp)
 990  0002 2706          	jreq	L374
 991                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 993  0004 e603          	ld	a,(3,x)
 994  0006 1a03          	or	a,(OFST+5,sp)
 996  0008 2005          	jra	L574
 997  000a               L374:
 998                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1000  000a 7b03          	ld	a,(OFST+5,sp)
1001  000c 43            	cpl	a
1002  000d e403          	and	a,(3,x)
1003  000f               L574:
1004  000f e703          	ld	(3,x),a
1005                     ; 238 }
1008  0011 81            	ret	
1021                     	xdef	_GPIO_ExternalPullUpConfig
1022                     	xdef	_GPIO_ReadInputPin
1023                     	xdef	_GPIO_ReadOutputData
1024                     	xdef	_GPIO_ReadInputData
1025                     	xdef	_GPIO_WriteReverse
1026                     	xdef	_GPIO_WriteLow
1027                     	xdef	_GPIO_WriteHigh
1028                     	xdef	_GPIO_Write
1029                     	xdef	_GPIO_Init
1030                     	xdef	_GPIO_DeInit
1049                     	end
