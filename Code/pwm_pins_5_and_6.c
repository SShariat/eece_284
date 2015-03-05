#include <stdio.h>
#include <stdlib.h>
#include <p89lpc9351.h>

#define XTAL 7373000L
#define BAUD 115200L

//We want timer 0 to interrupt every 100 microseconds ((1/10000Hz)=100 us)
#define FREQ 10000L
//The reload value formula comes from the datasheet...
#define TIMER0_RELOAD_VALUE (65536L-((XTAL)/(2*FREQ)))

//These variables are used in the ISR
volatile unsigned char pwmcount;
volatile unsigned char pwm1;

void InitSerialPort(void)
{
	BRGCON=0x00; //Make sure the baud rate generator is off
	BRGR1=((XTAL/BAUD)-16)/0x100;
	BRGR0=((XTAL/BAUD)-16)%0x100;
	BRGCON=0x03; //Turn-on the baud rate generator
	SCON=0x52; //Serial port in mode 1, ren, txrdy, rxempty
	P1M1=0x00; //Enable pins RxD and Txd
	P1M2=0x00; //Enable pins RxD and Txd
	P0M1 = 0;
	P0M2 = 0;
}

void InitTimer0 (void)
{
	// Initialize timer 0 for ISR 'pwmcounter' below
	TR0=0; // Stop timer 0
	TMOD=(TMOD&0xf0)|0x01; // 16-bit timer
	TH0=TIMER0_RELOAD_VALUE/0x100;
	TL0=TIMER0_RELOAD_VALUE%0x100;
	TR0=1; // Start timer 0 (bit 4 in TCON)
	ET0=1; // Enable timer 0 interrupt
	EA=1;  // Enable global interrupts
}

//Interrupt 1 is for timer 0.  This function is executed every 100 us.
void pwmcounter (void) interrupt 1
{
	//Reload the timer
	TR0=0; // Stop timer 0
	TH0=TIMER0_RELOAD_VALUE/0x100;
	TL0=TIMER0_RELOAD_VALUE%0x100;
	TR0=1; // Start timer 0
	if(++pwmcount>99) pwmcount=0;
	P0_5=(pwm1>pwmcount)?1:0;
	P0_6=(pwm1>pwmcount)?1:0;
}

void main (void)
{
	InitSerialPort();
	InitTimer0();
	pwm1=50; //50% duty cycle wave at 100Hz
	printf("Hello!\n\rPlease check pin 3 (P1_6) with the oscilloscope!\n\r");
}
