#include "stm8s.h"

#define DS1307_ADDRESS  0xD0   // Endereço do DS1307 (escrita)
#define DS1307_CTRL_REG 0x07   // Registrador de controle do DS1307

#define SQW_PIN         GPIOB, GPIO_PIN_6   // SQW -> PB6


// ===============================================
// PINOS DE CONTROLE DOS DISPLAYS
// ===============================================

// PINOS LATCH
#define LATCH_01_PORT GPIOE
#define LATCH_01_PIN  GPIO_PIN_5

#define LATCH_02_PORT GPIOC
#define LATCH_02_PIN  GPIO_PIN_1

// PINOS DISPLAY

#define LD_A_PORT	GPIOB
#define LD_A_PIN	GPIO_PIN_0

#define LD_B_PORT	GPIOB
#define LD_B_PIN	GPIO_PIN_1

#define LD_C_PORT	GPIOB
#define LD_C_PIN	GPIO_PIN_2

#define LD_D_PORT	GPIOB
#define LD_D_PIN	GPIO_PIN_3


// Macro para instrução 'No Operation' (atraso mínimo)
#define NOP() _asm("nop")

// ===============================================
// CONTROLE DOS PROTÓTIPOS
// ===============================================

void I2C_Init_DS1307(void);
void DS1307_Write(uint8_t reg, uint8_t data);
void DS1307_EnableSQW_1Hz(void);

void WriteBCD(uint8_t valor);
void Contagem_Placar(void);
void InitGPIO(void);

// ===============================================
// VARIÁVEIS GLOBAIS
// ===============================================

uint8_t last_state = 0;
volatile uint16_t segundos = 0;

volatile uint8_t valor = 0; 

volatile uint8_t unidades_1 = 0; 
volatile uint8_t dezenas_1 = 0; 
	
	
// ===============================================
// FUNÇÃO PRINCIPAL
// ===============================================

int main(void) 
{

	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);

	// Inicializa I2C
	I2C_Init_DS1307();
	DS1307_EnableSQW_1Hz();
	InitGPIO();

	// Configura SQW como entrada (PB6)
	GPIO_Init(GPIOB, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT);
	
	Contagem_Placar();

	while(1) 
	{
		if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_6) == RESET && last_state == 0)
		{
			//segundos++;
			last_state = 1;
				
			unidades_1++;
			if (unidades_1 > 9)
			{
				unidades_1 = 0;
			}
			Contagem_Placar();
		}
		
		else if(GPIO_ReadInputPin(GPIOB, GPIO_PIN_6) != RESET && last_state == 1)
		{
			last_state = 0;
		}
	}
}

void I2C_Init_DS1307(void) {
	// Configura pinos SDA (PB5) e SCL (PB4)
	GPIO_Init(GPIOB, GPIO_PIN_4, GPIO_MODE_OUT_OD_HIZ_FAST);
	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_OD_HIZ_FAST);

	// Inicializa I2C
	I2C_DeInit();
	I2C_Init(100000, DS1307_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
	I2C_Cmd(ENABLE);
}

void DS1307_Write(uint8_t reg, uint8_t data) {
	I2C_GenerateSTART(ENABLE);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_MODE_SELECT));

	I2C_Send7bitAddress(DS1307_ADDRESS, I2C_DIRECTION_TX);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED));

	I2C_SendData(reg);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	I2C_SendData(data);
	while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));

	I2C_GenerateSTOP(ENABLE);
}

void DS1307_EnableSQW_1Hz(void) {
	DS1307_Write(DS1307_CTRL_REG, 0x10); // SQWE=1, RS1=0, RS0=0
}

// ---------------------- Função para Escrever um Valor BCD --------------------------
// Converte um valor decimal (0-9) para sua representação BCD de 4 bits
// e define os estados dos pinos LD_A a LD_D de acordo.
void WriteBCD(uint8_t valor)
{
	// Verifica cada bit do 'valor' e define o pino correspondente como HIGH ou LOW.
	// Ex: se valor é 5 (0101 binário), LD_A e LD_C serão HIGH, LD_B e LD_D serão LOW.
	if(valor & 0x01) GPIO_WriteHigh(LD_A_PORT, LD_A_PIN); else GPIO_WriteLow(LD_A_PORT, LD_A_PIN); // Bit 0 (1)
	if(valor & 0x02) GPIO_WriteHigh(LD_B_PORT, LD_B_PIN); else GPIO_WriteLow(LD_B_PORT, LD_B_PIN); // Bit 1 (2)
	if(valor & 0x04) GPIO_WriteHigh(LD_C_PORT, LD_C_PIN); else GPIO_WriteLow(LD_C_PORT, LD_C_PIN); // Bit 2 (4)
	if(valor & 0x08) GPIO_WriteHigh(LD_D_PORT, LD_D_PIN); else GPIO_WriteLow(LD_D_PORT, LD_D_PIN); // Bit 3 (8)
}

void Contagem_Placar(void)
{
	
	
	WriteBCD(unidades_1);         // Envia o dígito das dezenas para os pinos BCD
	GPIO_WriteHigh(LATCH_01_PORT, LATCH_01_PIN); // Trava o valor no display das unidades
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_01_PORT, LATCH_01_PIN);
	
	WriteBCD(dezenas_1);         // Envia o dígito das dezenas para os pinos BCD
	GPIO_WriteHigh(LATCH_02_PORT, LATCH_02_PIN); // Trava o valor no display das unidades
	NOP(); NOP(); NOP(); NOP();
	GPIO_WriteLow(LATCH_02_PORT, LATCH_02_PIN);
}

void InitGPIO(void)
{
	GPIO_Init(LD_A_PORT, LD_A_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_B_PORT, LD_B_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_C_PORT, LD_C_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LD_D_PORT, LD_D_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

	GPIO_Init(LATCH_01_PORT, LATCH_01_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(LATCH_02_PORT, LATCH_02_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
}
