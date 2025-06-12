/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "STM8S.H"
#include "STM8S903.H"

// Define os Pinos LD de comunicação on/off
#define LD_01_PORT			GPIOC
#define LD_01_PIN				GPIO_PIN_7

// MPinos comuns compartilhados
#define PINO_A_PORT			GPIOB
#define PINO_A_PIN			GPIO_PIN_0

#define PINO_B_PORT			GPIOB
#define PINO_B_PIN			GPIO_PIN_1

#define PINO_C_PORT			GPIOB
#define PINO_C_PIN			GPIO_PIN_2

#define PINO_D_PORT			GPIOB
#define PINO_D_PIN			GPIO_PIN_3



main()
{
	while (1);
}