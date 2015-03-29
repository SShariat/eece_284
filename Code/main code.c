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

#define HI_THRESH 0.5
#define LO_THRESH 0.07

//PID Control Parameters
//KP = 40
//KD = 0
#define KP 40
#define KD 3




// The volatile keyword prevents the compiler from optimizing out these variables
// that are shared between an interrupt service routine and the main code.
volatile int msCount=0; // Volatiles can be changed by stuff outside our program, like memory registers
volatile unsigned char secs=0, mins=0; // They are like global variables, kinda 
volatile bit time_update_flag=0;
volatile unsigned char pwmcount;
volatile unsigned char pwm_left;
volatile unsigned char pwm_right;
volatile int turn_timer = 0;
volatile bit turn_time_update=0;
volatile bit start = 1;
volatile bit start_timer = 0;
volatile int action_timer = 0;
volatile int line_counter = 0;

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

	if(turn_time_update == 1){
		turn_timer++;
	}
	
	if(start_timer == 1){
		action_timer++;
		if(action_timer == 5000){
			action_timer = 0;
			start_timer = 0;
		}
		
	}
}

void display_LCD(void){
	unsigned char buff[17]; // Need to have enough space in the string for a null character
	
	time_update_flag=0;
	/*
	sprintf(buff, "V=%5.2f L:%5.2f", (AD1DAT0/255.0)*3.3, (AD1DAT1/255.0)*3.3); // Display the voltage at pin P0.1
	LCDprint(buff, 1, 1);
	sprintf(buff, "%02d:%02d R: %5.2f ", mins, secs, (AD1DAT2/255.0)*3.3); // Display the clock
	LCDprint(buff, 2, 1);
	*/
	sprintf(buff, "L=%5.2f R:%5.2f", (AD1DAT1/255.0)*3.3, (AD1DAT2/255.0)*3.3); //Display Left and Right Sensor
	LCDprint(buff, 1, 1);
	sprintf(buff, "LM=%d RM=%d", pwm_left, pwm_right); // Display Motor Values
	LCDprint(buff, 2, 1);
	
	/*
	sprintf(buff, "LS=%5.2f", (AD1DAT3/255.0)*3.3); //Display Line Sensor
	LCDprint(buff, 1, 1);
	sprintf(buff, "LC=%d ST=%d", line_counter, start_timer); // Display line counter, start_timer
	LCDprint(buff, 2, 1);
	*/
}

void turn_left(void){
	turn_timer = 0;
	turn_time_update = 1;
	while(turn_timer < 7000){
		pwm_left = 0;
		pwm_right = 100;
		printf("turning left!\n");
	}
	turn_time_update = 0;
	turn_timer = 0;
}
void turn_right(void){
	turn_timer = 0;
	turn_time_update = 1;
	while(turn_timer < 7000){
		pwm_left = 100;
		pwm_right = 0;
		printf("turning right!\n");
	}
	turn_time_update = 0;
	turn_timer = 0;
}

void stop(void){
	while(1){
		pwm_left = 0;
		pwm_right = 0;
	}
}

void execute(int command){
	switch(command){
		case 2:
			turn_left();
		break;
		case 3:
			turn_right();
		break;
		case 4:
			if(start == 1){
				start = 0;
			}
		else{
			stop();
		}
		break;
	}
}

void main (void){
	//Variable Declaration
	double cor = 0;
	double cur_error =0;
	double pre_error =0;
	int thresh = 2;

	//Initializing Reading Sensor Value Variables
	double left = (AD1DAT1/255.0)*3.3;
	double right = (AD1DAT2/255.0)*3.3;
	double line_sensor = (AD1DAT3/255.0)*3.3;
	double diff = left - right;

	//Initializing Line Counter Code Variables
	int line_counter = 0;
	int command = 0;
	int state = 1;	
	
	//Microcontroller Init.
	InitPorts();
	LCD_8BIT();
	InitSerialPort();
	InitADC();
	InitTimer0();
	
	//PD Controller
	pre_error = 0;
	while(1)
	{
		//Sensor Values
		/*
			port 0_2: AD1DAT1
			port 0_3: AD1DAT2
			port 0_4: AD1DAT3
		*/

		//Reading Values of for PID
			left = (AD1DAT1/255.0)*3.3;
			right = (AD1DAT2/255.0)*3.3;
			line_sensor = (AD1DAT3/255.0)*3.3;
			diff = left - right;

		//Timer Functionality
		if(time_update_flag==1) // If the clock has been updated, refresh the display
		{
			display_LCD();
		}

		//P-D Controller
		cor = KP*cur_error + KD*(cur_error - pre_error);
		
		if(((1 < left) && (left < 1.2)) && ((1 < right) && (right < 1.2))){
			cur_error = 0;
			pwm_left = 100;
			pwm_right = 100;
		}
		else if(0.2 < diff){	
			cur_error = 1;
			pwm_left = 100 - cor;
			pwm_right = 100;
		}
		else if(diff < -0.2){
			cur_error= -1;
			pwm_left = 100;
			pwm_right = 100 + cor;
		}
		
		else if((left < 0.8) && (right < 0.8)){
			if(pre_error>0){
				cur_error = 5;
				pwm_left = 100 - cor;
				pwm_right = 100;
			}
			if(pre_error<0){
				cur_error = -5;
				pwm_left = 100;
				pwm_right = 100 + cor;
			}
		}
		else{
			stop();
		}	
		pre_error = cur_error;
		//printf("State:%2d Command:%3d Sensor:%5.2f Timer: %2d                 \r\n", state, command, line_sensor, start_timer);

	//State Diagram
		switch(state){
			/*case 0:
				if(line_sensor > HI_THRESH){
					start_timer = 1;
					state = 2;
					printf("headed to 2 from 0 \n");
				}
			break;
			case 1:
				if(line_sensor > HI_THRESH){
					state = 2;h
				}
				if(start_timer == 0){
					command = line_counter;
					line_counter = 0;
					state = 4;
				}
				printf("headed to %2d from 1\n", state);
			break;				
			case 2:
				if(line_sensor < LO_THRESH){
					line_counter++;
					state = 3;
				}
				if(start_timer == 0){
					command = line_counter;
					line_counter = 0;
					state = 4;
				}
				printf("headed to %2d from 2\n", state);
			break;
			case 3:
				if(start_timer == 0){
					command = line_counter;
					line_counter = 0;
					state = 4;
				}
				else{
					state = 1;
				}
				printf("headed to %2d from 3\n", state);
			break;
			case 4:
				if(line_counter > HI_THRESH){
					printf("ERMAGERD: %2d", command);
					execute(command);
					state = 0;
				}
			break;*/
			case 1:
				if(line_sensor > HI_THRESH){
					state = 2;
				}
				//printf("headed to %2d from 1\n", state);
			break;				
			case 2:
				if(line_sensor < LO_THRESH){
					line_counter++;
					start_timer = 1;
					state = 3;
				}
				//printf("headed to %2d from 2\n", state);
			break;
			case 3:
				if(start_timer == 1){
					if(line_sensor > HI_THRESH){
						start_timer = 0;
						action_timer = 0;
						state = 2;
					}
				}
				else{
					if(line_counter > 1){
						command = line_counter;
						line_counter = 0;
						state = 4;
					}
					else{
						state = 1;
						line_counter = 0;
					}
				}
				//printf("headed to %2d from 3\n", state);
			break;
			case 4:
				if(line_sensor > HI_THRESH){
					//printf("ERMAGERD: %2d \n", command);
					execute(command);
					state = 1;
				}
			break;
		}
	}
}