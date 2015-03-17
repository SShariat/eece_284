#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <p89lpc9351.h>

#define XTAL 7373000L
#define BAUD 115200L


//We want timer 0 to interrupt every millisecond ((1/1000Hz)=1 ms)
#define FREQ 10000L
//The reload value formula comes from the datasheet...//FUCKING WHERE
#define TIMER0_RELOAD_VALUE (65536L-((XTAL)/(2*FREQ)))

// Make sure these definitions match your wiring
#define LCD_RS P2_7 
#define LCD_RW P2_6
#define LCD_E  P2_5
#define LCD_D0 P2_4
#define LCD_D1 P2_3
#define LCD_D2 P2_2
#define LCD_D3 P2_1
#define LCD_D4 P2_0
#define LCD_D5 P1_7
#define LCD_D6 P1_6
#define LCD_D7 P1_4

#define CHARS_PER_LINE 16


// The volatile keyword prevents the compiler from optimizing out these variables
// that are shared between an interrupt service routine and the main code.
volatile int msCount=0; // Volatiles can be changed by stuff outside our program, like memory registers
volatile unsigned char secs=0, mins=0; // They are like global variables, kinda 
volatile bit time_update_flag=0;
volatile bit line_counter_flag=0;
volatile unsigned char pwmcount;
volatile unsigned char pwm_left;
volatile unsigned char pwm_right;
volatile int line_timer = 0;

void InitPorts(void)
{
	P0M1=0x1E;
	P0M2=0x00;
	P1M1=0;
	P1M2=0;
	P2M1=0;
	P2M2=0;
	P3M1=0;
	P3M2=0;
}

void Wait50us (void)
{
	_asm
	mov R0, #82
	L0: djnz R0, L0 ; 2 machine cycles-> 2*0.27126us*92=50us
	_endasm;
}

void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	
	//Waiting for 1 Micro-second
	for(j=0; j<ms; j++)
		for (k=0; k<20; k++) Wait50us();
	}

void LCD_pulse (void)
{
	LCD_E=1;
	Wait50us();
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the C8051Fxxx is bit addressable!
	ACC=x;
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_D3=ACC_3;
	LCD_D2=ACC_2;
	LCD_D1=ACC_1;
	LCD_D0=ACC_0;
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	waitms(2);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	waitms(5);
}

void LCD_8BIT (void)
{
	LCD_E=0;  // Resting state of LCD's enable is zero
	LCD_RW=0; // We are only writing to the LCD in this program
	waitms(20);
	// First make sure the LCD is in 8-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x33); // Stay in 8-bit mode

	// Configure the LCD
	WriteCommand(0x38);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	waitms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	unsigned char j;
	
	WriteCommand(line==2?0xc0:0x80);
	waitms(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}

void Wait1S (void)
{
	_asm
	mov R2, #40
	L3: mov R1, #250
	L2: mov R0, #184
	L1: djnz R0, L1 ; 2 machine cycles-> 2*0.27126us*184=100us
	djnz R1, L2 ; 100us*250=0.025s
	djnz R2, L3 ; 0.025s*40=1s
	_endasm;
}

void InitSerialPort(void)
{
	BRGCON=0x00; //Make sure the baud rate generator is off
	BRGR1=((XTAL/BAUD)-16)/0x100;
	BRGR0=((XTAL/BAUD)-16)%0x100;
	BRGCON=0x03; //Turn-on the baud rate generator
	SCON=0x52; //Serial port in mode 1, ren, txrdy, rxempty
	P1M1=0x00; //Enable pins RxD and Txd
	P1M2=0x00; //Enable pins RxD and Txd
}

void InitADC(void)
{
	// Set adc1 channel pins as input only 

	P0M1 |= (P0M1_4 | P0M1_3 | P0M1_2 | P0M1_1);
	P0M2 &= ~(P0M1_4 | P0M1_3 | P0M1_2 | P0M1_1);


	BURST1=1; //Autoscan continuous conversion mode
	ADMODB = CLK0; //ADC1 clock is 7.3728MHz/2
	ADINS  = (ADI13|ADI12|ADI11|ADI10); // Select the four channels for conversion
	ADCON1 = (ENADC1|ADCS10); //Enable the converter and start immediately
	while((ADCI1&ADCON1)==0); //Wait for first conversion to complete
}

void InitTimer0 (void)
{
	// Initialize timer 0 for ISR 'pwmcounter' below
	// maybe we don't set TAMOD because it is naturally in the 0 state?
	TR0=0; // Stop timer 0
	TMOD=(TMOD&0xf0)|0x01; // 16-bit timer
	TH0=TIMER0_RELOAD_VALUE/0x100; // I think the RHS is 0001 0000 0000, are we dividing?
	TL0=TIMER0_RELOAD_VALUE%0x100; // % means modulo, apparently? ...are we modulo-ing?
	TR0=1; // Start timer 0 (bit 4 in TCON)
	ET0=1; // Enable timer 0 interrupt - the interrupt controller IEN0 is bit-adressable, so we change only the bit we need
	EA=1;  // Enable global interrupts
}

//Interrupt 1 is for timer 0.  This function is executed every 100 us
void Timer0ISR (void) interrupt 1{
	//Reload the timer
	TR0=0; // Stop timer 0
	TH0=TIMER0_RELOAD_VALUE/0x100;
	TL0=TIMER0_RELOAD_VALUE%0x100;
	TR0=1; // Start timer 0
	
	if(++pwmcount>99) pwmcount=0;
	P0_5=(pwm_left>pwmcount)?1:0;
	P0_6=(pwm_right>pwmcount)?1:0;
	
	msCount++;
	if(msCount==10000)
	{
		time_update_flag=1;
		msCount=0;
		secs++;
		if(secs==60)
		{
			secs=0;
			mins++;
			if(mins==60)
			{
				mins=0;
			}
		}
	}
	
	if(line_counter_flag==1){
		line_timer++;
	}	
}

void display_LCD(void){
	unsigned char buff[17]; // Need to have enough space in the string for a null character
	
	time_update_flag=0;
	sprintf(buff, "V=%5.2f", (AD1DAT0/255.0)*3.3); // Display the voltage at pin P0.1
	LCDprint(buff, 1, 1);
	sprintf(buff, "%02d:%02d", mins, secs); // Display the clock
	LCDprint(buff, 2, 1);
}

void main (void){
	//Variable Declaration
	int k_p=1;
	int k_d=1;
	double cor = 0;
	double cur_error =0;
	double pre_error =0;
	double new_speed_low;
	double new_speed_high;
	int counter = 0;
	int thresh = 0;
	int line_counter = 0;
	int exec = 0;
	int state = 0;

	//Microcontroller Init.
	InitPorts();
	LCD_8BIT();
	InitSerialPort();
	InitADC();
	InitTimer0();

	
	while(1){
		double line_sensor = (AD1DAT3/255.0)*3.3;
		double left = (AD1DAT1/255.0)*3.3;
		double right = (AD1DAT2/255.0)*3.3;

		switch(state){
		//Start Case
			case 0:
			/**/
			pwm_right = 100;
			pwm_left = 100;
			state = 1;

			//Line Counter
			case 1:
			if(line_sensor>thresh){
			//If you have not seen a line before
				if(line_counter == 0){
  				//Start Timer
					line_counter++;
					line_counter_flag = 1;
				}
				else{
  				//Counting Lines
					line_counter++;  				
				}

				if(line_timer == 2000){
					switch(line_counter){
						case 2:
							state = 2: 
						case 3:
						case 4:
						}
					line_counter_flag = 0;
					line_timer = 0;				
				}
			}
		}
	}
	pre_error = 0;
}	