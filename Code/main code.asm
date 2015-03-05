;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Dec 11 2012) (MSVC)
; This file was generated Thu Mar 05 10:41:29 2015
;--------------------------------------------------------
$name main_code
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _motor_control
	public _display_LCD
	public _Timer0ISR
	public _InitTimer0
	public _InitADC
	public _InitSerialPort
	public _Wait1S
	public _LCDport_print
	public _LCDprint
	public _LCD_8BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _waitms
	public _Wait50us
	public _InitPorts
	public _LCDprint_PARM_3
	public _time_update_flag
	public _LCDprint_PARM_2
	public _pwm_right
	public _pwm_left
	public _pwmcount
	public _mins
	public _secs
	public _msCount
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADCON0         DATA 0x8e
_ADCON1         DATA 0x97
_ADINS          DATA 0xa3
_ADMODA         DATA 0xc0
_ADMODB         DATA 0xa1
_AD0BH          DATA 0xbb
_AD0BL          DATA 0xa6
_AD0DAT0        DATA 0xc5
_AD0DAT1        DATA 0xc6
_AD0DAT2        DATA 0xc7
_AD0DAT3        DATA 0xf4
_AD1BH          DATA 0xc4
_AD1BL          DATA 0xbc
_AD1DAT0        DATA 0xd5
_AD1DAT1        DATA 0xd6
_AD1DAT2        DATA 0xd7
_AD1DAT3        DATA 0xf5
_AUXR1          DATA 0xa2
_B              DATA 0xf0
_BRGR0          DATA 0xbe
_BRGR1          DATA 0xbf
_BRGCON         DATA 0xbd
_CCCRA          DATA 0xea
_CCCRB          DATA 0xeb
_CCCRC          DATA 0xec
_CCCRD          DATA 0xed
_CMP1           DATA 0xac
_CMP2           DATA 0xad
_DEECON         DATA 0xf1
_DEEDAT         DATA 0xf2
_DEEADR         DATA 0xf3
_DIVM           DATA 0x95
_DPH            DATA 0x83
_DPL            DATA 0x82
_FMADRH         DATA 0xe7
_FMADRL         DATA 0xe6
_FMCON          DATA 0xe4
_FMDATA         DATA 0xe5
_I2ADR          DATA 0xdb
_I2CON          DATA 0xd8
_I2DAT          DATA 0xda
_I2SCLH         DATA 0xdd
_I2SCLL         DATA 0xdc
_I2STAT         DATA 0xd9
_ICRAH          DATA 0xab
_ICRAL          DATA 0xaa
_ICRBH          DATA 0xaf
_ICRBL          DATA 0xae
_IEN0           DATA 0xa8
_IEN1           DATA 0xe8
_IP0            DATA 0xb8
_IP0H           DATA 0xb7
_IP1            DATA 0xf8
_IP1H           DATA 0xf7
_KBCON          DATA 0x94
_KBMASK         DATA 0x86
_KBPATN         DATA 0x93
_OCRAH          DATA 0xef
_OCRAL          DATA 0xee
_OCRBH          DATA 0xfb
_OCRBL          DATA 0xfa
_OCRCH          DATA 0xfd
_OCRCL          DATA 0xfc
_OCRDH          DATA 0xff
_OCRDL          DATA 0xfe
_P0             DATA 0x80
_P1             DATA 0x90
_P2             DATA 0xa0
_P3             DATA 0xb0
_P0M1           DATA 0x84
_P0M2           DATA 0x85
_P1M1           DATA 0x91
_P1M2           DATA 0x92
_P2M1           DATA 0xa4
_P2M2           DATA 0xa5
_P3M1           DATA 0xb1
_P3M2           DATA 0xb2
_PCON           DATA 0x87
_PCONA          DATA 0xb5
_PSW            DATA 0xd0
_PT0AD          DATA 0xf6
_RSTSRC         DATA 0xdf
_RTCCON         DATA 0xd1
_RTCH           DATA 0xd2
_RTCL           DATA 0xd3
_SADDR          DATA 0xa9
_SADEN          DATA 0xb9
_SBUF           DATA 0x99
_SCON           DATA 0x98
_SSTAT          DATA 0xba
_SP             DATA 0x81
_SPCTL          DATA 0xe2
_SPSTAT         DATA 0xe1
_SPDAT          DATA 0xe3
_TAMOD          DATA 0x8f
_TCON           DATA 0x88
_TCR20          DATA 0xc8
_TCR21          DATA 0xf9
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TH2            DATA 0xcd
_TICR2          DATA 0xc9
_TIFR2          DATA 0xe9
_TISE2          DATA 0xde
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TL2            DATA 0xcc
_TMOD           DATA 0x89
_TOR2H          DATA 0xcf
_TOR2L          DATA 0xce
_TPCR2H         DATA 0xcb
_TPCR2L         DATA 0xca
_TRIM           DATA 0x96
_WDCON          DATA 0xa7
_WDL            DATA 0xc1
_WFEED1         DATA 0xc2
_WFEED2         DATA 0xc3
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_ADMODA_7       BIT 0xc7
_ADMODA_6       BIT 0xc6
_ADMODA_5       BIT 0xc5
_ADMODA_4       BIT 0xc4
_ADMODA_3       BIT 0xc3
_ADMODA_2       BIT 0xc2
_ADMODA_1       BIT 0xc1
_ADMODA_0       BIT 0xc0
_BNDI1          BIT 0xc7
_BURST1         BIT 0xc6
_SCC1           BIT 0xc5
_SCAN1          BIT 0xc4
_BNDI0          BIT 0xc3
_BURST0         BIT 0xc2
_SCC0           BIT 0xc1
_SCAN0          BIT 0xc0
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_I2CON_7        BIT 0xdf
_I2CON_6        BIT 0xde
_I2CON_5        BIT 0xdd
_I2CON_4        BIT 0xdc
_I2CON_3        BIT 0xdb
_I2CON_2        BIT 0xda
_I2CON_1        BIT 0xd9
_I2CON_0        BIT 0xd8
_I2EN           BIT 0xde
_STA            BIT 0xdd
_STO            BIT 0xdc
_SI             BIT 0xdb
_AA             BIT 0xda
_CRSEL          BIT 0xd8
_IEN0_7         BIT 0xaf
_IEN0_6         BIT 0xae
_IEN0_5         BIT 0xad
_IEN0_4         BIT 0xac
_IEN0_3         BIT 0xab
_IEN0_2         BIT 0xaa
_IEN0_1         BIT 0xa9
_IEN0_0         BIT 0xa8
_EA             BIT 0xaf
_EWDRT          BIT 0xae
_EBO            BIT 0xad
_ES             BIT 0xac
_ESR            BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_IEN1_7         BIT 0xef
_IEN1_6         BIT 0xee
_IEN1_5         BIT 0xed
_IEN1_4         BIT 0xec
_IEN1_3         BIT 0xeb
_IEN1_2         BIT 0xea
_IEN1_1         BIT 0xe9
_IEN1_0         BIT 0xe8
_EADEE          BIT 0xef
_EST            BIT 0xee
_ECCU           BIT 0xec
_ESPI           BIT 0xeb
_EC             BIT 0xea
_EKBI           BIT 0xe9
_EI2C           BIT 0xe8
_IP0_7          BIT 0xbf
_IP0_6          BIT 0xbe
_IP0_5          BIT 0xbd
_IP0_4          BIT 0xbc
_IP0_3          BIT 0xbb
_IP0_2          BIT 0xba
_IP0_1          BIT 0xb9
_IP0_0          BIT 0xb8
_PWDRT          BIT 0xbe
_PBO            BIT 0xbd
_PS             BIT 0xbc
_PSR            BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_IP1_7          BIT 0xff
_IP1_6          BIT 0xfe
_IP1_5          BIT 0xfd
_IP1_4          BIT 0xfc
_IP1_3          BIT 0xfb
_IP1_2          BIT 0xfa
_IP1_1          BIT 0xf9
_IP1_0          BIT 0xf8
_PADEE          BIT 0xff
_PST            BIT 0xfe
_PCCU           BIT 0xfc
_PSPI           BIT 0xfb
_PC             BIT 0xfa
_PKBI           BIT 0xf9
_PI2C           BIT 0xf8
_P0_7           BIT 0x87
_P0_6           BIT 0x86
_P0_5           BIT 0x85
_P0_4           BIT 0x84
_P0_3           BIT 0x83
_P0_2           BIT 0x82
_P0_1           BIT 0x81
_P0_0           BIT 0x80
_T1             BIT 0x87
_KB7            BIT 0x87
_CMP_1          BIT 0x86
_KB6            BIT 0x86
_CMPREF         BIT 0x85
_KB5            BIT 0x85
_CIN1A          BIT 0x84
_KB4            BIT 0x84
_CIN1B          BIT 0x83
_KB3            BIT 0x83
_CIN2A          BIT 0x82
_KB2            BIT 0x82
_CIN2B          BIT 0x81
_KB1            BIT 0x81
_CMP_2          BIT 0x80
_KB0            BIT 0x80
_P1_7           BIT 0x97
_P1_6           BIT 0x96
_P1_5           BIT 0x95
_P1_4           BIT 0x94
_P1_3           BIT 0x93
_P1_2           BIT 0x92
_P1_1           BIT 0x91
_P1_0           BIT 0x90
_OCC            BIT 0x97
_OCB            BIT 0x96
_RST            BIT 0x95
_INT1           BIT 0x94
_INT0           BIT 0x93
_SDA            BIT 0x93
_T0             BIT 0x92
_SCL            BIT 0x92
_RXD            BIT 0x91
_TXD            BIT 0x90
_P2_7           BIT 0xa7
_P2_6           BIT 0xa6
_P2_5           BIT 0xa5
_P2_4           BIT 0xa4
_P2_3           BIT 0xa3
_P2_2           BIT 0xa2
_P2_1           BIT 0xa1
_P2_0           BIT 0xa0
_ICA            BIT 0xa7
_OCA            BIT 0xa6
_SPICLK         BIT 0xa5
_SS             BIT 0xa4
_MISO           BIT 0xa3
_MOSI           BIT 0xa2
_OCD            BIT 0xa1
_ICB            BIT 0xa0
_P3_7           BIT 0xb7
_P3_6           BIT 0xb6
_P3_5           BIT 0xb5
_P3_4           BIT 0xb4
_P3_3           BIT 0xb3
_P3_2           BIT 0xb2
_P3_1           BIT 0xb1
_P3_0           BIT 0xb0
_XTAL1          BIT 0xb1
_XTAL2          BIT 0xb0
_PSW_7          BIT 0xd7
_PSW_6          BIT 0xd6
_PSW_5          BIT 0xd5
_PSW_4          BIT 0xd4
_PSW_3          BIT 0xd3
_PSW_2          BIT 0xd2
_PSW_1          BIT 0xd1
_PSW_0          BIT 0xd0
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_F1             BIT 0xd1
_P              BIT 0xd0
_SCON_7         BIT 0x9f
_SCON_6         BIT 0x9e
_SCON_5         BIT 0x9d
_SCON_4         BIT 0x9c
_SCON_3         BIT 0x9b
_SCON_2         BIT 0x9a
_SCON_1         BIT 0x99
_SCON_0         BIT 0x98
_SM0            BIT 0x9f
_FE             BIT 0x9f
_SM1            BIT 0x9e
_SM2            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_TCON_7         BIT 0x8f
_TCON_6         BIT 0x8e
_TCON_5         BIT 0x8d
_TCON_4         BIT 0x8c
_TCON_3         BIT 0x8b
_TCON_2         BIT 0x8a
_TCON_1         BIT 0x89
_TCON_0         BIT 0x88
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_TCR20_7        BIT 0xcf
_TCR20_6        BIT 0xce
_TCR20_5        BIT 0xcd
_TCR20_4        BIT 0xcc
_TCR20_3        BIT 0xcb
_TCR20_2        BIT 0xca
_TCR20_1        BIT 0xc9
_TCR20_0        BIT 0xc8
_PLEEN          BIT 0xcf
_HLTRN          BIT 0xce
_HLTEN          BIT 0xcd
_ALTCD          BIT 0xcc
_ALTAB          BIT 0xcb
_TDIR2          BIT 0xca
_TMOD21         BIT 0xc9
_TMOD20         BIT 0xc8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_msCount:
	ds 2
_secs:
	ds 1
_mins:
	ds 1
_pwmcount:
	ds 1
_pwm_left:
	ds 1
_pwm_right:
	ds 1
_LCDprint_PARM_2:
	ds 1
_LCDport_print_string_2_81:
	ds 20
_display_LCD_buff_1_96:
	ds 17
_main_str_1_100:
	ds 17
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_time_update_flag:
	DBIT	1
_LCDprint_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
	XSEG at 0xffc8
_BODCFG: ds 1
	public _BODCFG
	rseg R_XSEG
	XSEG at 0xffde
_CLKCON: ds 1
	public _CLKCON
	rseg R_XSEG
	XSEG at 0xffe1
_PGACON1: ds 1
	public _PGACON1
	rseg R_XSEG
	XSEG at 0xffe4
_PGACON1B: ds 1
	public _PGACON1B
	rseg R_XSEG
	XSEG at 0xffe3
_PGA1TRIM8X16X: ds 1
	public _PGA1TRIM8X16X
	rseg R_XSEG
	XSEG at 0xffe2
_PGA1TRIM2X4X: ds 1
	public _PGA1TRIM2X4X
	rseg R_XSEG
	XSEG at 0xffca
_PGACON0: ds 1
	public _PGACON0
	rseg R_XSEG
	XSEG at 0xffce
_PGACON0B: ds 1
	public _PGACON0B
	rseg R_XSEG
	XSEG at 0xffcd
_PGA0TRIM8X16X: ds 1
	public _PGA0TRIM8X16X
	rseg R_XSEG
	XSEG at 0xffcc
_PGA0TRIM2X4X: ds 1
	public _PGA0TRIM2X4X
	rseg R_XSEG
	XSEG at 0xffbf
_RTCDATH: ds 1
	public _RTCDATH
	rseg R_XSEG
	XSEG at 0xffbe
_RTCDATL: ds 1
	public _RTCDATL
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x000b
	ljmp	_Timer0ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:34: volatile int msCount=0; // Volatiles can be changed by stuff outside our program, like memory registers
	clr	a
	mov	_msCount,a
	mov	(_msCount + 1),a
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:35: volatile unsigned char secs=0, mins=0; // They are like global variables, kinda 
	mov	_secs,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:35: volatile bit time_update_flag=0;
	mov	_mins,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:36: volatile unsigned char pwmcount;
	clr	_time_update_flag
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPorts'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:41: void InitPorts(void)
;	-----------------------------------------
;	 function InitPorts
;	-----------------------------------------
_InitPorts:
	using	0
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:43: P0M1=0x1E;
	mov	_P0M1,#0x1E
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:44: P0M2=0x00;
	mov	_P0M2,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:45: P1M1=0;
	mov	_P1M1,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:46: P1M2=0;
	mov	_P1M2,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:47: P2M1=0;
	mov	_P2M1,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:48: P2M2=0;
	mov	_P2M2,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:49: P3M1=0;
	mov	_P3M1,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:50: P3M2=0;
	mov	_P3M2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Wait50us'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:53: void Wait50us (void)
;	-----------------------------------------
;	 function Wait50us
;	-----------------------------------------
_Wait50us:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:58: _endasm;
	
	    mov R0, #82
	L0:
	djnz R0, L0 ; 2 machine cycles-> 2*0.27126us*92=50us
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:61: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:67: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004004?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004008?
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:68: for (k=0; k<20; k++) Wait50us();
	mov	r6,#0x14
L004003?:
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Wait50us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	djnz	r6,L004003?
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:67: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L004004?
	inc	r5
	sjmp	L004004?
L004008?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:71: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:73: LCD_E=1;
	setb	_P2_5
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:74: Wait50us();
	lcall	_Wait50us
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:75: LCD_E=0;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers 
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:78: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	_ACC,dpl
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:82: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_4,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:83: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_6,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:84: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_7,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:85: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_0,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:86: LCD_D3=ACC_3;
	mov	c,_ACC_3
	mov	_P2_1,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:87: LCD_D2=ACC_2;
	mov	c,_ACC_2
	mov	_P2_2,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:88: LCD_D1=ACC_1;
	mov	c,_ACC_1
	mov	_P2_3,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:89: LCD_D0=ACC_0;
	mov	c,_ACC_0
	mov	_P2_4,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:90: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:93: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:95: LCD_RS=1;
	setb	_P2_7
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:96: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:97: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:100: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:102: LCD_RS=0;
	clr	_P2_7
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:103: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:104: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_8BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:107: void LCD_8BIT (void)
;	-----------------------------------------
;	 function LCD_8BIT
;	-----------------------------------------
_LCD_8BIT:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:109: LCD_E=0;  // Resting state of LCD's enable is zero
	clr	_P2_5
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:110: LCD_RW=0; // We are only writing to the LCD in this program
	clr	_P2_6
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:111: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:113: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:114: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:115: WriteCommand(0x33); // Stay in 8-bit mode
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:118: WriteCommand(0x38);
	mov	dpl,#0x38
	lcall	_WriteCommand
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:119: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:120: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:121: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:124: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:128: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L010013?
	mov	r5,#0xC0
	sjmp	L010014?
L010013?:
	mov	r5,#0x80
L010014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:129: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:130: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
L010003?:
	mov	a,r5
	add	a,r2
	mov	r6,a
	clr	a
	addc	a,r3
	mov	r7,a
	mov	ar0,r4
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	lcall	__gptrget
	mov	r6,a
	jz	L010006?
	mov	dpl,r6
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_WriteData
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	sjmp	L010003?
L010006?:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:131: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L010011?
	mov	ar2,r5
L010007?:
	cjne	r2,#0x10,L010026?
L010026?:
	jnc	L010011?
	mov	dpl,#0x20
	push	ar2
	lcall	_WriteData
	pop	ar2
	inc	r2
	sjmp	L010007?
L010011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDport_print'
;------------------------------------------------------------
;string                    Allocated with name '_LCDport_print_string_2_81'
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:134: void LCDport_print(void){
;	-----------------------------------------
;	 function LCDport_print
;	-----------------------------------------
_LCDport_print:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:135: while(1){
L011002?:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:137: char string[20]  = "something";
	mov	_LCDport_print_string_2_81,#0x73
	mov	(_LCDport_print_string_2_81 + 0x0001),#0x6F
	mov	(_LCDport_print_string_2_81 + 0x0002),#0x6D
	mov	(_LCDport_print_string_2_81 + 0x0003),#0x65
	mov	(_LCDport_print_string_2_81 + 0x0004),#0x74
	mov	(_LCDport_print_string_2_81 + 0x0005),#0x68
	mov	(_LCDport_print_string_2_81 + 0x0006),#0x69
	mov	(_LCDport_print_string_2_81 + 0x0007),#0x6E
	mov	(_LCDport_print_string_2_81 + 0x0008),#0x67
	mov	(_LCDport_print_string_2_81 + 0x0009),#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:141: LCDprint(string, 2,1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_LCDport_print_string_2_81
	mov	b,#0x40
	lcall	_LCDprint
	sjmp	L011002?
;------------------------------------------------------------
;Allocation info for local variables in function 'Wait1S'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:145: void Wait1S (void)
;	-----------------------------------------
;	 function Wait1S
;	-----------------------------------------
_Wait1S:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:154: _endasm;
	
	 mov R2, #40
	L3:
	mov R1, #250
	L2:
	mov R0, #184
	L1:
	djnz R0, L1 ; 2 machine cycles-> 2*0.27126us*184=100us
	    djnz R1, L2 ; 100us*250=0.025s
	    djnz R2, L3 ; 0.025s*40=1s
	    
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitSerialPort'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:157: void InitSerialPort(void)
;	-----------------------------------------
;	 function InitSerialPort
;	-----------------------------------------
_InitSerialPort:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:159: BRGCON=0x00; //Make sure the baud rate generator is off
	mov	_BRGCON,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:160: BRGR1=((XTAL/BAUD)-16)/0x100;
	mov	_BRGR1,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:161: BRGR0=((XTAL/BAUD)-16)%0x100;
	mov	_BRGR0,#0x30
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:162: BRGCON=0x03; //Turn-on the baud rate generator
	mov	_BRGCON,#0x03
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:163: SCON=0x52; //Serial port in mode 1, ren, txrdy, rxempty
	mov	_SCON,#0x52
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:164: P1M1=0x00; //Enable pins RxD and Txd
	mov	_P1M1,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:165: P1M2=0x00; //Enable pins RxD and Txd
	mov	_P1M2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:168: void InitADC(void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:172: P0M1 |= (P0M1_4 | P0M1_3 | P0M1_2 | P0M1_1);
	orl	_P0M1,#0x1E
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:173: P0M2 &= ~(P0M1_4 | P0M1_3 | P0M1_2 | P0M1_1);
	anl	_P0M2,#0xE1
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:176: BURST1=1; //Autoscan continuous conversion mode
	setb	_BURST1
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:177: ADMODB = CLK0; //ADC1 clock is 7.3728MHz/2
	mov	_ADMODB,#0x20
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:178: ADINS  = (ADI13|ADI12|ADI11|ADI10); // Select the four channels for conversion
	mov	_ADINS,#0xF0
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:179: ADCON1 = (ENADC1|ADCS10); //Enable the converter and start immediately
	mov	_ADCON1,#0x05
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:180: while((ADCI1&ADCON1)==0); //Wait for first conversion to complete
L014001?:
	mov	a,_ADCON1
	jnb	acc.3,L014001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitTimer0'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:183: void InitTimer0 (void)
;	-----------------------------------------
;	 function InitTimer0
;	-----------------------------------------
_InitTimer0:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:187: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:188: TMOD=(TMOD&0xf0)|0x01; // 16-bit timer
	mov	a,#0xF0
	anl	a,_TMOD
	orl	a,#0x01
	mov	_TMOD,a
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:189: TH0=TIMER0_RELOAD_VALUE/0x100; // I think the RHS is 0001 0000 0000, are we dividing?
	mov	_TH0,#0xFE
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:190: TL0=TIMER0_RELOAD_VALUE%0x100; // % means modulo, apparently? ...are we modulo-ing?
	mov	_TL0,#0x90
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:191: TR0=1; // Start timer 0 (bit 4 in TCON)
	setb	_TR0
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:192: ET0=1; // Enable timer 0 interrupt - the interrupt controller IEN0 is bit-adressable, so we change only the bit we need
	setb	_ET0
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:193: EA=1;  // Enable global interrupts
	setb	_EA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer0ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:197: void Timer0ISR (void) interrupt 1
;	-----------------------------------------
;	 function Timer0ISR
;	-----------------------------------------
_Timer0ISR:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:200: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:201: TH0=TIMER0_RELOAD_VALUE/0x100;
	mov	_TH0,#0xFE
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:202: TL0=TIMER0_RELOAD_VALUE%0x100;
	mov	_TL0,#0x90
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:203: TR0=1; // Start timer 0
	setb	_TR0
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:205: if(++pwmcount>99) pwmcount=0;
	inc	_pwmcount
	mov	a,_pwmcount
	add	a,#0xff - 0x63
	jnc	L016002?
	mov	_pwmcount,#0x00
L016002?:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:206: P0_5=(pwm_left>pwmcount)?1:0;
	clr	c
	mov	a,_pwmcount
	subb	a,_pwm_left
	mov	_P0_5,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:207: P0_6=(pwm_right>pwmcount)?1:0;
	clr	c
	mov	a,_pwmcount
	subb	a,_pwm_right
	mov	_P0_6,c
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:209: msCount++;
	mov	a,#0x01
	add	a,_msCount
	mov	_msCount,a
	clr	a
	addc	a,(_msCount + 1)
	mov	(_msCount + 1),a
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:210: if(msCount==10000)
	mov	a,#0x10
	cjne	a,_msCount,L016009?
	mov	a,#0x27
	cjne	a,(_msCount + 1),L016009?
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:212: time_update_flag=1;
	setb	_time_update_flag
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:213: msCount=0;
	clr	a
	mov	_msCount,a
	mov	(_msCount + 1),a
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:214: secs++;
	inc	_secs
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:215: if(secs==60)
	mov	a,#0x3C
	cjne	a,_secs,L016009?
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:217: secs=0;
	mov	_secs,#0x00
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:218: mins++;
	inc	_mins
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:219: if(mins==60)
	mov	a,#0x3C
	cjne	a,_mins,L016009?
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:221: mins=0;
	mov	_mins,#0x00
L016009?:
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'display_LCD'
;------------------------------------------------------------
;buff                      Allocated with name '_display_LCD_buff_1_96'
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:228: void display_LCD(void){
;	-----------------------------------------
;	 function display_LCD
;	-----------------------------------------
_display_LCD:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:231: sprintf (buff, "V0: %4.2fV", (AD1DAT0*3.3)/255.0); // Prints 4 digits with 2 decimals, appended by V
	mov	dpl,_AD1DAT0
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_display_LCD_buff_1_96
	push	acc
	mov	a,#(_display_LCD_buff_1_96 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:232: LCDprint(buff, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#_display_LCD_buff_1_96
	mov	b,#0x40
	lcall	_LCDprint
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:234: sprintf (buff, "V1: %4.2fV", (AD1DAT1*3.3)/255.0);
	mov	dpl,_AD1DAT1
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_display_LCD_buff_1_96
	push	acc
	mov	a,#(_display_LCD_buff_1_96 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:235: LCDprint(buff, 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_display_LCD_buff_1_96
	mov	b,#0x40
	ljmp	_LCDprint
;------------------------------------------------------------
;Allocation info for local variables in function 'motor_control'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:240: void motor_control(void){
;	-----------------------------------------
;	 function motor_control
;	-----------------------------------------
_motor_control:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:241: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;str                       Allocated with name '_main_str_1_100'
;threshold                 Allocated to registers 
;------------------------------------------------------------
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:244: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:249: InitPorts();
	lcall	_InitPorts
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:250: LCD_8BIT();
	lcall	_LCD_8BIT
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:251: InitSerialPort();
	lcall	_InitSerialPort
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:252: InitADC();
	lcall	_InitADC
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:253: InitTimer0();
	lcall	_InitTimer0
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:255: while(1)
L019012?:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:258: if(time_update_flag==1) // If the clock has been updated, refresh the display
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:260: time_update_flag=0;
	jbc	_time_update_flag,L019022?
	ljmp	L019002?
L019022?:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:261: sprintf(str, "V=%5.2f", (AD1DAT0/255.0)*3.3); // Display the voltage at pin P0.1
	mov	dpl,_AD1DAT0
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_str_1_100
	push	acc
	mov	a,#(_main_str_1_100 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:262: LCDprint(str, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_str_1_100
	mov	b,#0x40
	lcall	_LCDprint
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:263: sprintf(str, "%02d:%02d", mins, secs); // Display the clock
	mov	r2,_secs
	mov	r3,#0x00
	mov	r4,_mins
	mov	r5,#0x00
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_str_1_100
	push	acc
	mov	a,#(_main_str_1_100 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:264: LCDprint(str, 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_main_str_1_100
	mov	b,#0x40
	lcall	_LCDprint
L019002?:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:270: if ( ((AD1DAT1/255.0)*3.3)>2 && ((AD1DAT2/255.0)*3.3)<2 )
	mov	dpl,_AD1DAT1
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019023?
	ljmp	L019008?
L019023?:
	mov	dpl,_AD1DAT2
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L019008?
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:272: printf("turn left     \r");
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ljmp	L019012?
L019008?:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:274: else if( ((AD1DAT1/255.0)*3.3)<2 && ((AD1DAT2/255.0)*3.3)>2 )
	mov	dpl,_AD1DAT1
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019025?
	ljmp	L019004?
L019025?:
	mov	dpl,_AD1DAT2
	lcall	___uchar2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x3333
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L019004?
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:276: printf("turn right     \r");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ljmp	L019012?
L019004?:
;	C:\Users\r6z8\Documents\GitHub\eece_284\Code\main code.c:280: printf("go straight    \r");
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	ljmp	L019012?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_1:
	db 'V0: %4.2fV'
	db 0x00
__str_2:
	db 'V1: %4.2fV'
	db 0x00
__str_3:
	db 'V=%5.2f'
	db 0x00
__str_4:
	db '%02d:%02d'
	db 0x00
__str_5:
	db 'turn left     '
	db 0x0D
	db 0x00
__str_6:
	db 'turn right     '
	db 0x0D
	db 0x00
__str_7:
	db 'go straight    '
	db 0x0D
	db 0x00

	CSEG

end
