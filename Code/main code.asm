;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Dec 11 2012) (MSVC)
; This file was generated Mon Mar 30 08:43:18 2015
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
	public _execute
	public _stop
	public _turn_right
	public _turn_left
	public _display_LCD
	public _Timer0ISR
	public _InitTimer0
	public _InitADC
	public _InitSerialPort
	public _Wait1S
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
	public _start_timer
	public _start
	public _turn_time_update
	public _time_update_flag
	public _LCDprint_PARM_2
	public _line_counter
	public _action_timer
	public _turn_timer
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
_turn_timer:
	ds 2
_action_timer:
	ds 2
_line_counter:
	ds 2
_LCDprint_PARM_2:
	ds 1
_display_LCD_buff_1_96:
	ds 17
_main_cor_1_110:
	ds 4
_main_cur_error_1_110:
	ds 4
_main_pre_error_1_110:
	ds 4
_main_q_1_110:
	ds 2
_main_m_1_110:
	ds 2
_main_left_1_110:
	ds 4
_main_right_1_110:
	ds 4
_main_line_sensor_1_110:
	ds 4
_main_diff_1_110:
	ds 4
_main_command_1_110:
	ds 2
_main_state_1_110:
	ds 2
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
_turn_time_update:
	DBIT	1
_start:
	DBIT	1
_start_timer:
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:49: volatile int msCount=0; // Volatiles can be changed by stuff outside our program, like memory registers
	clr	a
	mov	_msCount,a
	mov	(_msCount + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:50: volatile unsigned char secs=0, mins=0; // They are like global variables, kinda 
	mov	_secs,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:50: volatile bit time_update_flag=0;
	mov	_mins,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:55: volatile int turn_timer = 0;
	clr	a
	mov	_turn_timer,a
	mov	(_turn_timer + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:59: volatile int action_timer = 0;
	clr	a
	mov	_action_timer,a
	mov	(_action_timer + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:60: volatile int line_counter = 0;
	clr	a
	mov	_line_counter,a
	mov	(_line_counter + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:51: volatile bit time_update_flag=0;
	clr	_time_update_flag
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:56: volatile bit turn_time_update=0;
	clr	_turn_time_update
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:57: volatile bit start = 1;
	setb	_start
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:58: volatile bit start_timer = 0;
	clr	_start_timer
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPorts'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:62: void InitPorts(void){
;	-----------------------------------------
;	 function InitPorts
;	-----------------------------------------
_InitPorts:
	using	0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:63: P0M1=0x1E;
	mov	_P0M1,#0x1E
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:64: P0M2=0x00;
	mov	_P0M2,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:65: P1M1=0;
	mov	_P1M1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:66: P1M2=0;
	mov	_P1M2,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:67: P2M1=0;
	mov	_P2M1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:68: P2M2=0;
	mov	_P2M2,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:69: P3M1=0;
	mov	_P3M1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:70: P3M2=0;
	mov	_P3M2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Wait50us'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:73: void Wait50us (void){
;	-----------------------------------------
;	 function Wait50us
;	-----------------------------------------
_Wait50us:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:77: _endasm;
	
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:80: void waitms (unsigned int ms){
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:85: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004004?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004008?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:86: for (k=0; k<20; k++) Wait50us();
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:85: for(j=0; j<ms; j++)
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:89: void LCD_pulse (void){
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:90: LCD_E=1;
	setb	_P2_5
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:91: Wait50us();
	lcall	_Wait50us
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:92: LCD_E=0;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:95: void LCD_byte (unsigned char x){
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	_ACC,dpl
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:98: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_4,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:99: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_6,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:100: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_7,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:101: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_0,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:102: LCD_D3=ACC_3;
	mov	c,_ACC_3
	mov	_P2_1,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:103: LCD_D2=ACC_2;
	mov	c,_ACC_2
	mov	_P2_2,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:104: LCD_D1=ACC_1;
	mov	c,_ACC_1
	mov	_P2_3,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:105: LCD_D0=ACC_0;
	mov	c,_ACC_0
	mov	_P2_4,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:106: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:109: void WriteData (unsigned char x){
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:110: LCD_RS=1;
	setb	_P2_7
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:111: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:112: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:115: void WriteCommand (unsigned char x){
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:116: LCD_RS=0;
	clr	_P2_7
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:117: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:118: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_8BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:121: void LCD_8BIT (void){
;	-----------------------------------------
;	 function LCD_8BIT
;	-----------------------------------------
_LCD_8BIT:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:122: LCD_E=0;  // Resting state of LCD's enable is zero
	clr	_P2_5
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:123: LCD_RW=0; // We are only writing to the LCD in this program
	clr	_P2_6
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:124: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:126: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:127: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:128: WriteCommand(0x33); // Stay in 8-bit mode
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:131: WriteCommand(0x38);
	mov	dpl,#0x38
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:132: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:133: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:134: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:137: void LCDprint(char * string, unsigned char line, bit clear){
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:140: WriteCommand(line==2?0xc0:0x80);
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:141: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:142: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:143: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
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
;Allocation info for local variables in function 'Wait1S'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:146: void Wait1S (void){
;	-----------------------------------------
;	 function Wait1S
;	-----------------------------------------
_Wait1S:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:154: _endasm;
	
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:157: void InitSerialPort(void){
;	-----------------------------------------
;	 function InitSerialPort
;	-----------------------------------------
_InitSerialPort:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:158: BRGCON=0x00; //Make sure the baud rate generator is off
	mov	_BRGCON,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:159: BRGR1=((XTAL/BAUD)-16)/0x100;
	mov	_BRGR1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:160: BRGR0=((XTAL/BAUD)-16)%0x100;
	mov	_BRGR0,#0x30
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:161: BRGCON=0x03; //Turn-on the baud rate generator
	mov	_BRGCON,#0x03
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:162: SCON=0x52; //Serial port in mode 1, ren, txrdy, rxempty
	mov	_SCON,#0x52
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:163: P1M1=0x00; //Enable pins RxD and Txd
	mov	_P1M1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:164: P1M2=0x00; //Enable pins RxD and Txd
	mov	_P1M2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:167: void InitADC(void){
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:170: P0M1 |= (P0M1_4 | P0M1_3 | P0M1_2 | P0M1_1);
	orl	_P0M1,#0x1E
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:171: P0M2 &= ~(P0M1_4 | P0M1_3 | P0M1_2 | P0M1_1);
	anl	_P0M2,#0xE1
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:174: BURST1=1; //Autoscan continuous conversion mode
	setb	_BURST1
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:175: ADMODB = CLK0; //ADC1 clock is 7.3728MHz/2
	mov	_ADMODB,#0x20
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:176: ADINS  = (ADI13|ADI12|ADI11|ADI10); // Select the four channels for conversion
	mov	_ADINS,#0xF0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:177: ADCON1 = (ENADC1|ADCS10); //Enable the converter and start immediately
	mov	_ADCON1,#0x05
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:178: while((ADCI1&ADCON1)==0); //Wait for first conversion to complete
L013001?:
	mov	a,_ADCON1
	jnb	acc.3,L013001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitTimer0'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:181: void InitTimer0 (void){
;	-----------------------------------------
;	 function InitTimer0
;	-----------------------------------------
_InitTimer0:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:184: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:185: TMOD=(TMOD&0xf0)|0x01; // 16-bit timer
	mov	a,#0xF0
	anl	a,_TMOD
	orl	a,#0x01
	mov	_TMOD,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:186: TH0=TIMER0_RELOAD_VALUE/0x100; // I think the RHS is 0001 0000 0000, are we dividing?
	mov	_TH0,#0xFE
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:187: TL0=TIMER0_RELOAD_VALUE%0x100; // % means modulo, apparently? ...are we modulo-ing?
	mov	_TL0,#0x90
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:188: TR0=1; // Start timer 0 (bit 4 in TCON)
	setb	_TR0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:189: ET0=1; // Enable timer 0 interrupt - the interrupt controller IEN0 is bit-adressable, so we change only the bit we need
	setb	_ET0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:190: EA=1;  // Enable global interrupts
	setb	_EA
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer0ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:194: void Timer0ISR (void) interrupt 1{
;	-----------------------------------------
;	 function Timer0ISR
;	-----------------------------------------
_Timer0ISR:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:196: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:197: TH0=TIMER0_RELOAD_VALUE/0x100;
	mov	_TH0,#0xFE
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:198: TL0=TIMER0_RELOAD_VALUE%0x100;
	mov	_TL0,#0x90
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:199: TR0=1; // Start timer 0
	setb	_TR0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:201: if(++pwmcount>99) pwmcount=0;
	inc	_pwmcount
	mov	a,_pwmcount
	add	a,#0xff - 0x63
	jnc	L015002?
	mov	_pwmcount,#0x00
L015002?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:202: P0_5=(pwm_left>pwmcount)?1:0;
	clr	c
	mov	a,_pwmcount
	subb	a,_pwm_left
	mov	_P0_5,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:203: P0_6=(pwm_right>pwmcount)?1:0;
	clr	c
	mov	a,_pwmcount
	subb	a,_pwm_right
	mov	_P0_6,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:205: msCount++;
	mov	a,#0x01
	add	a,_msCount
	mov	_msCount,a
	clr	a
	addc	a,(_msCount + 1)
	mov	(_msCount + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:206: if(msCount==10000)
	mov	a,#0x10
	cjne	a,_msCount,L015008?
	mov	a,#0x27
	cjne	a,(_msCount + 1),L015008?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:208: time_update_flag=1;
	setb	_time_update_flag
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:209: msCount=0;
	clr	a
	mov	_msCount,a
	mov	(_msCount + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:210: secs++;
	inc	_secs
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:211: if(secs==60)
	mov	a,#0x3C
	cjne	a,_secs,L015008?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:213: secs=0;
	mov	_secs,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:214: mins++;
	inc	_mins
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:215: if(mins==60)
	mov	a,#0x3C
	cjne	a,_mins,L015008?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:217: mins=0;
	mov	_mins,#0x00
L015008?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:222: if(turn_time_update == 1){
	jnb	_turn_time_update,L015010?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:223: turn_timer++;
	mov	a,#0x01
	add	a,_turn_timer
	mov	_turn_timer,a
	clr	a
	addc	a,(_turn_timer + 1)
	mov	(_turn_timer + 1),a
L015010?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:226: if(start_timer == 1){
	jnb	_start_timer,L015015?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:227: action_timer++;
	mov	a,#0x01
	add	a,_action_timer
	mov	_action_timer,a
	clr	a
	addc	a,(_action_timer + 1)
	mov	(_action_timer + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:228: if(action_timer == 5000){
	mov	a,#0x88
	cjne	a,_action_timer,L015015?
	mov	a,#0x13
	cjne	a,(_action_timer + 1),L015015?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:229: action_timer = 0;
	clr	a
	mov	_action_timer,a
	mov	(_action_timer + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:230: start_timer = 0;
	clr	_start_timer
L015015?:
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:236: void display_LCD(void){
;	-----------------------------------------
;	 function display_LCD
;	-----------------------------------------
_display_LCD:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:239: time_update_flag=0;
	clr	_time_update_flag
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:241: sprintf(buff, "V=%5.2f L:%5.2f", (AD1DAT0/255.0)*3.3*9/2.69, (AD1DAT1/255.0)*3.3); // Display the voltage at pin P0.1
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
	mov	dpl,_AD1DAT0
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0x999A
	mov	b,#0xED
	mov	a,#0x41
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xF6
	push	acc
	mov	a,#0x28
	push	acc
	mov	a,#0x2C
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
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
	add	a,#0xf2
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:242: LCDprint(buff, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#_display_LCD_buff_1_96
	mov	b,#0x40
	lcall	_LCDprint
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:243: sprintf(buff, "%02d:%02d R: %5.2f ", mins, secs, (AD1DAT2/255.0)*3.3); // Display the clock
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
	mov	r6,_secs
	mov	r7,#0x00
	mov	r0,_mins
	mov	r1,#0x00
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	push	ar1
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
	add	a,#0xf2
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:244: LCDprint(buff, 2, 1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#_display_LCD_buff_1_96
	mov	b,#0x40
	ljmp	_LCDprint
;------------------------------------------------------------
;Allocation info for local variables in function 'turn_left'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:259: void turn_left(void){
;	-----------------------------------------
;	 function turn_left
;	-----------------------------------------
_turn_left:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:260: turn_timer = 0;
	clr	a
	mov	_turn_timer,a
	mov	(_turn_timer + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:261: turn_time_update = 1;
	setb	_turn_time_update
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:262: while(turn_timer < 7500){
L017001?:
	clr	c
	mov	a,_turn_timer
	subb	a,#0x4C
	mov	a,(_turn_timer + 1)
	xrl	a,#0x80
	subb	a,#0x9d
	jnc	L017003?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:263: pwm_left = 0;
	mov	_pwm_left,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:264: pwm_right = 100;
	mov	_pwm_right,#0x64
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:265: printf("turning left!\n");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	sjmp	L017001?
L017003?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:267: turn_time_update = 0;
	clr	_turn_time_update
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:268: turn_timer = 0;
	clr	a
	mov	_turn_timer,a
	mov	(_turn_timer + 1),a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'turn_right'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:270: void turn_right(void){
;	-----------------------------------------
;	 function turn_right
;	-----------------------------------------
_turn_right:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:271: turn_timer = 0;
	clr	a
	mov	_turn_timer,a
	mov	(_turn_timer + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:272: turn_time_update = 1;
	setb	_turn_time_update
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:273: while(turn_timer < 7500){
L018001?:
	clr	c
	mov	a,_turn_timer
	subb	a,#0x4C
	mov	a,(_turn_timer + 1)
	xrl	a,#0x80
	subb	a,#0x9d
	jnc	L018003?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:274: pwm_left = 100;
	mov	_pwm_left,#0x64
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:275: pwm_right = 0;
	mov	_pwm_right,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:276: printf("turning right!\n");
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	sjmp	L018001?
L018003?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:278: turn_time_update = 0;
	clr	_turn_time_update
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:279: turn_timer = 0;
	clr	a
	mov	_turn_timer,a
	mov	(_turn_timer + 1),a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'stop'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:282: void stop(void){
;	-----------------------------------------
;	 function stop
;	-----------------------------------------
_stop:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:283: while(1){
L019002?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:284: pwm_left = 0;
	mov	_pwm_left,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:285: pwm_right = 0;
	mov	_pwm_right,#0x00
	sjmp	L019002?
;------------------------------------------------------------
;Allocation info for local variables in function 'execute'
;------------------------------------------------------------
;command                   Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:289: void execute(int command){
;	-----------------------------------------
;	 function execute
;	-----------------------------------------
_execute:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:290: switch(command){
	cjne	r2,#0x02,L020008?
	cjne	r3,#0x00,L020008?
	sjmp	L020001?
L020008?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:291: case 2:
	cjne	r2,#0x03,L020004?
	cjne	r3,#0x00,L020004?
	sjmp	L020002?
L020001?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:292: turn_left();
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:293: break;
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:294: case 3:
	ljmp	_turn_left
L020002?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:295: turn_right();
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:297: }
	ljmp	_turn_right
L020004?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;cor                       Allocated with name '_main_cor_1_110'
;cur_error                 Allocated with name '_main_cur_error_1_110'
;pre_error                 Allocated with name '_main_pre_error_1_110'
;thresh                    Allocated to registers 
;q                         Allocated with name '_main_q_1_110'
;m                         Allocated with name '_main_m_1_110'
;left                      Allocated with name '_main_left_1_110'
;right                     Allocated with name '_main_right_1_110'
;line_sensor               Allocated with name '_main_line_sensor_1_110'
;diff                      Allocated with name '_main_diff_1_110'
;command                   Allocated with name '_main_command_1_110'
;state                     Allocated with name '_main_state_1_110'
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:300: void main (void){
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:302: double cor = 0;
	mov	_main_cor_1_110,#0x00
	mov	(_main_cor_1_110 + 1),#0x00
	mov	(_main_cor_1_110 + 2),#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:303: double cur_error =0;
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:306: int q = 0;
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:307: int m = 0;
	clr	a
	mov	(_main_cor_1_110 + 3),a
	mov	_main_cur_error_1_110,a
	mov	(_main_cur_error_1_110 + 1),a
	mov	(_main_cur_error_1_110 + 2),a
	mov	(_main_cur_error_1_110 + 3),a
	mov	_main_q_1_110,a
	mov	(_main_q_1_110 + 1),a
	mov	_main_m_1_110,a
	mov	(_main_m_1_110 + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:310: double left = (AD1DAT1/255.0)*3.3;
	mov	a,_AD1DAT1
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:311: double right = (AD1DAT2/255.0)*3.3;
	mov	a,_AD1DAT2
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:312: double line_sensor = (AD1DAT3/255.0)*3.3;
	mov	a,_AD1DAT3
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:316: int command = 0;
	clr	a
	mov	_main_command_1_110,a
	mov	(_main_command_1_110 + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:317: int state = 1;	
	mov	_main_state_1_110,#0x01
	clr	a
	mov	(_main_state_1_110 + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:320: InitPorts();
	lcall	_InitPorts
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:321: LCD_8BIT();
	lcall	_LCD_8BIT
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:322: InitSerialPort();
	lcall	_InitSerialPort
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:323: InitADC();
	lcall	_InitADC
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:324: InitTimer0();
	lcall	_InitTimer0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:327: pre_error = 0;
	mov	_main_pre_error_1_110,#0x00
	mov	(_main_pre_error_1_110 + 1),#0x00
	mov	(_main_pre_error_1_110 + 2),#0x00
	mov	(_main_pre_error_1_110 + 3),#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:328: while(1)
L021050?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:338: left = (AD1DAT1/255.0)*3.3;
	mov	dpl,_AD1DAT1
	lcall	___uchar2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r2,b
	mov	r3,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r2
	mov	a,r3
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
	mov	_main_left_1_110,dpl
	mov	(_main_left_1_110 + 1),dph
	mov	(_main_left_1_110 + 2),b
	mov	(_main_left_1_110 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:339: right = (AD1DAT2/255.0)*3.3;
	mov	dpl,_AD1DAT2
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
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
	mov	_main_right_1_110,dpl
	mov	(_main_right_1_110 + 1),dph
	mov	(_main_right_1_110 + 2),b
	mov	(_main_right_1_110 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:340: line_sensor = (AD1DAT3/255.0)*3.3;
	mov	dpl,_AD1DAT3
	lcall	___uchar2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	clr	a
	push	acc
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
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
	mov	_main_line_sensor_1_110,dpl
	mov	(_main_line_sensor_1_110 + 1),dph
	mov	(_main_line_sensor_1_110 + 2),b
	mov	(_main_line_sensor_1_110 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:341: diff = left - right;
	push	_main_right_1_110
	push	(_main_right_1_110 + 1)
	push	(_main_right_1_110 + 2)
	push	(_main_right_1_110 + 3)
	mov	dpl,_main_left_1_110
	mov	dph,(_main_left_1_110 + 1)
	mov	b,(_main_left_1_110 + 2)
	mov	a,(_main_left_1_110 + 3)
	lcall	___fssub
	mov	_main_diff_1_110,dpl
	mov	(_main_diff_1_110 + 1),dph
	mov	(_main_diff_1_110 + 2),b
	mov	(_main_diff_1_110 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:344: if(time_update_flag==1) // If the clock has been updated, refresh the display
	jnb	_time_update_flag,L021002?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:346: display_LCD();
	lcall	_display_LCD
L021002?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:350: if(((MID_THRESH_LO< left) && (left < MID_THRESH_HI)) && ((MID_THRESH_LO < right) && (right < MID_THRESH_HI))){
	push	_main_left_1_110
	push	(_main_left_1_110 + 1)
	push	(_main_left_1_110 + 2)
	push	(_main_left_1_110 + 3)
	mov	dptr,#0xCCCD
	mov	b,#0x0C
	mov	a,#0x3F
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jnz	L021080?
	ljmp	L021017?
L021080?:
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	mov	a,#0x59
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_left_1_110
	mov	dph,(_main_left_1_110 + 1)
	mov	b,(_main_left_1_110 + 2)
	mov	a,(_main_left_1_110 + 3)
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L021017?
	push	_main_right_1_110
	push	(_main_right_1_110 + 1)
	push	(_main_right_1_110 + 2)
	push	(_main_right_1_110 + 3)
	mov	dptr,#0xCCCD
	mov	b,#0x0C
	mov	a,#0x3F
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L021017?
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	mov	a,#0x59
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_right_1_110
	mov	dph,(_main_right_1_110 + 1)
	mov	b,(_main_right_1_110 + 2)
	mov	a,(_main_right_1_110 + 3)
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L021017?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:351: cur_error = 0;
	mov	_main_cur_error_1_110,#0x00
	mov	(_main_cur_error_1_110 + 1),#0x00
	mov	(_main_cur_error_1_110 + 2),#0x00
	mov	(_main_cur_error_1_110 + 3),#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:352: pwm_left = 100;
	mov	_pwm_left,#0x64
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:353: pwm_right = 100;
	mov	_pwm_right,#0x64
	ljmp	L021018?
L021017?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:355: else if(0.2 < diff){	
	push	_main_diff_1_110
	push	(_main_diff_1_110 + 1)
	push	(_main_diff_1_110 + 2)
	push	(_main_diff_1_110 + 3)
	mov	dptr,#0xCCCD
	mov	b,#0x4C
	mov	a,#0x3E
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jz	L021014?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:356: cur_error = 3;
	mov	_main_cur_error_1_110,#0x00
	mov	(_main_cur_error_1_110 + 1),#0x00
	mov	(_main_cur_error_1_110 + 2),#0x40
	mov	(_main_cur_error_1_110 + 3),#0x40
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:357: pwm_left = 100 - cor;
	push	_main_cor_1_110
	push	(_main_cor_1_110 + 1)
	push	(_main_cor_1_110 + 2)
	push	(_main_cor_1_110 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fs2uchar
	mov	_pwm_left,dpl
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:358: pwm_right = 100;
	mov	_pwm_right,#0x64
	ljmp	L021018?
L021014?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:360: else if(diff < -0.2){
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	mov	a,#0x4C
	push	acc
	mov	a,#0xBE
	push	acc
	mov	dpl,_main_diff_1_110
	mov	dph,(_main_diff_1_110 + 1)
	mov	b,(_main_diff_1_110 + 2)
	mov	a,(_main_diff_1_110 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L021011?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:361: cur_error= -3;
	mov	_main_cur_error_1_110,#0x00
	mov	(_main_cur_error_1_110 + 1),#0x00
	mov	(_main_cur_error_1_110 + 2),#0x40
	mov	(_main_cur_error_1_110 + 3),#0xC0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:362: pwm_left = 100;
	mov	_pwm_left,#0x64
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:363: pwm_right = 100 + cor;
	clr	a
	push	acc
	push	acc
	mov	a,#0xC8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_main_cor_1_110
	mov	dph,(_main_cor_1_110 + 1)
	mov	b,(_main_cor_1_110 + 2)
	mov	a,(_main_cor_1_110 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2uchar
	mov	_pwm_right,dpl
	ljmp	L021018?
L021011?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:365: else if((left < SIDE_THRESH) && (right < SIDE_THRESH)){
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3E
	push	acc
	mov	dpl,_main_left_1_110
	mov	dph,(_main_left_1_110 + 1)
	mov	b,(_main_left_1_110 + 2)
	mov	a,(_main_left_1_110 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L021086?
	ljmp	L021018?
L021086?:
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	push	acc
	mov	a,#0x3E
	push	acc
	mov	dpl,_main_right_1_110
	mov	dph,(_main_right_1_110 + 1)
	mov	b,(_main_right_1_110 + 2)
	mov	a,(_main_right_1_110 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L021087?
	ljmp	L021018?
L021087?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:366: if(pre_error>0){
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_pre_error_1_110
	mov	dph,(_main_pre_error_1_110 + 1)
	mov	b,(_main_pre_error_1_110 + 2)
	mov	a,(_main_pre_error_1_110 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L021004?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:367: cur_error = 5;
	mov	_main_cur_error_1_110,#0x00
	mov	(_main_cur_error_1_110 + 1),#0x00
	mov	(_main_cur_error_1_110 + 2),#0xA0
	mov	(_main_cur_error_1_110 + 3),#0x40
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:368: pwm_left = 100 - cor;
	push	_main_cor_1_110
	push	(_main_cor_1_110 + 1)
	push	(_main_cor_1_110 + 2)
	push	(_main_cor_1_110 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2uchar
	mov	_pwm_left,dpl
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:369: pwm_right = 100;
	mov	_pwm_right,#0x64
L021004?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:371: if(pre_error<0){
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_pre_error_1_110
	mov	dph,(_main_pre_error_1_110 + 1)
	mov	b,(_main_pre_error_1_110 + 2)
	mov	a,(_main_pre_error_1_110 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L021018?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:372: cur_error = -5;
	mov	_main_cur_error_1_110,#0x00
	mov	(_main_cur_error_1_110 + 1),#0x00
	mov	(_main_cur_error_1_110 + 2),#0xA0
	mov	(_main_cur_error_1_110 + 3),#0xC0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:373: pwm_left = 100;
	mov	_pwm_left,#0x64
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:374: pwm_right = 100 + cor;
	clr	a
	push	acc
	push	acc
	mov	a,#0xC8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_main_cor_1_110
	mov	dph,(_main_cor_1_110 + 1)
	mov	b,(_main_cor_1_110 + 2)
	mov	a,(_main_cor_1_110 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fs2uchar
	mov	_pwm_right,dpl
L021018?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:377: if(!(pre_error==cur_error)){
	push	_main_cur_error_1_110
	push	(_main_cur_error_1_110 + 1)
	push	(_main_cur_error_1_110 + 2)
	push	(_main_cur_error_1_110 + 3)
	mov	dpl,_main_pre_error_1_110
	mov	dph,(_main_pre_error_1_110 + 1)
	mov	b,(_main_pre_error_1_110 + 2)
	mov	a,(_main_pre_error_1_110 + 3)
	lcall	___fseq
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L021023?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:378: q=m;
	mov	_main_q_1_110,_main_m_1_110
	mov	(_main_q_1_110 + 1),(_main_m_1_110 + 1)
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:379: m=1;
	mov	_main_m_1_110,#0x01
	clr	a
	mov	(_main_m_1_110 + 1),a
L021023?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:381: cor = KP*cur_error + KD*(cur_error - pre_error)/(q+m);
	push	_main_cur_error_1_110
	push	(_main_cur_error_1_110 + 1)
	push	(_main_cur_error_1_110 + 2)
	push	(_main_cur_error_1_110 + 3)
	mov	dptr,#0x0000
	mov	b,#0xF8
	mov	a,#0x41
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,_main_m_1_110
	add	a,_main_q_1_110
	mov	dpl,a
	mov	a,(_main_m_1_110 + 1)
	addc	a,(_main_q_1_110 + 1)
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	_main_cor_1_110,dpl
	mov	(_main_cor_1_110 + 1),dph
	mov	(_main_cor_1_110 + 2),b
	mov	(_main_cor_1_110 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:382: m=m+1;
	inc	_main_m_1_110
	clr	a
	cjne	a,_main_m_1_110,L021091?
	inc	(_main_m_1_110 + 1)
L021091?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:383: pre_error = cur_error;
	mov	_main_pre_error_1_110,_main_cur_error_1_110
	mov	(_main_pre_error_1_110 + 1),(_main_cur_error_1_110 + 1)
	mov	(_main_pre_error_1_110 + 2),(_main_cur_error_1_110 + 2)
	mov	(_main_pre_error_1_110 + 3),(_main_cur_error_1_110 + 3)
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:384: printf("State:%d LC:%d Sensor:%5.2f Timer:%d                 \r\n", state, line_counter, line_sensor, start_timer);
	mov	c,_start_timer
	clr	a
	rlc	a
	mov	r2,a
	mov	r3,#0x00
	push	ar2
	push	ar3
	push	_main_line_sensor_1_110
	push	(_main_line_sensor_1_110 + 1)
	push	(_main_line_sensor_1_110 + 2)
	push	(_main_line_sensor_1_110 + 3)
	push	_line_counter
	push	(_line_counter + 1)
	push	_main_state_1_110
	push	(_main_state_1_110 + 1)
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf3
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:387: switch(state){
	mov	a,#0x01
	cjne	a,_main_state_1_110,L021092?
	clr	a
	cjne	a,(_main_state_1_110 + 1),L021092?
	sjmp	L021024?
L021092?:
	mov	a,#0x02
	cjne	a,_main_state_1_110,L021093?
	clr	a
	cjne	a,(_main_state_1_110 + 1),L021093?
	sjmp	L021027?
L021093?:
	mov	a,#0x03
	cjne	a,_main_state_1_110,L021094?
	clr	a
	cjne	a,(_main_state_1_110 + 1),L021094?
	ljmp	L021030?
L021094?:
	mov	a,#0x04
	cjne	a,_main_state_1_110,L021095?
	clr	a
	cjne	a,(_main_state_1_110 + 1),L021095?
	ljmp	L021039?
L021095?:
	ljmp	L021050?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:388: case 1:
L021024?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:389: if(line_sensor > HI_THRESH){
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_line_sensor_1_110
	mov	dph,(_main_line_sensor_1_110 + 1)
	mov	b,(_main_line_sensor_1_110 + 2)
	mov	a,(_main_line_sensor_1_110 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L021026?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:392: state = 2;
	mov	_main_state_1_110,#0x02
	clr	a
	mov	(_main_state_1_110 + 1),a
L021026?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:394: printf("headed to %2d from 1\n", state);
	push	_main_state_1_110
	push	(_main_state_1_110 + 1)
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:395: break;				
	ljmp	L021050?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:396: case 2:
L021027?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:397: if(line_sensor < LO_THRESH){
	mov	a,#0x33
	push	acc
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_line_sensor_1_110
	mov	dph,(_main_line_sensor_1_110 + 1)
	mov	b,(_main_line_sensor_1_110 + 2)
	mov	a,(_main_line_sensor_1_110 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L021029?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:398: line_counter++;
	mov	a,#0x01
	add	a,_line_counter
	mov	_line_counter,a
	clr	a
	addc	a,(_line_counter + 1)
	mov	(_line_counter + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:399: start_timer = 1;
	setb	_start_timer
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:400: state = 3;
	mov	_main_state_1_110,#0x03
	clr	a
	mov	(_main_state_1_110 + 1),a
L021029?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:402: printf("headed to %2d from 2\n", state);
	push	_main_state_1_110
	push	(_main_state_1_110 + 1)
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:403: break;
	ljmp	L021050?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:404: case 3:
L021030?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:405: if(start_timer == 1){
	jnb	_start_timer,L021037?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:406: if(line_sensor > HI_THRESH){
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_line_sensor_1_110
	mov	dph,(_main_line_sensor_1_110 + 1)
	mov	b,(_main_line_sensor_1_110 + 2)
	mov	a,(_main_line_sensor_1_110 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L021038?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:407: start_timer = 0;
	clr	_start_timer
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:408: action_timer = 0;
	clr	a
	mov	_action_timer,a
	mov	(_action_timer + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:409: state = 2;
	mov	_main_state_1_110,#0x02
	clr	a
	mov	(_main_state_1_110 + 1),a
	sjmp	L021038?
L021037?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:413: if(line_counter > 1){
	clr	c
	mov	a,#0x01
	subb	a,_line_counter
	clr	a
	xrl	a,#0x80
	mov	b,(_line_counter + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L021034?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:414: command = line_counter;
	mov	_main_command_1_110,_line_counter
	mov	(_main_command_1_110 + 1),(_line_counter + 1)
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:415: line_counter = 0;
	clr	a
	mov	_line_counter,a
	mov	(_line_counter + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:416: state = 4;
	mov	_main_state_1_110,#0x04
	clr	a
	mov	(_main_state_1_110 + 1),a
	sjmp	L021038?
L021034?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:419: state = 1;
	mov	_main_state_1_110,#0x01
	clr	a
	mov	(_main_state_1_110 + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:420: line_counter = 0;
	clr	a
	mov	_line_counter,a
	mov	(_line_counter + 1),a
L021038?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:423: printf("headed to %2d from 3\n", state);
	push	_main_state_1_110
	push	(_main_state_1_110 + 1)
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:424: break;
	ljmp	L021050?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:425: case 4:
L021039?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:426: if(command == 4){
	mov	a,#0x04
	cjne	a,_main_command_1_110,L021101?
	clr	a
	cjne	a,(_main_command_1_110 + 1),L021101?
	sjmp	L021102?
L021101?:
	sjmp	L021046?
L021102?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:427: if(start == 1){
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:428: start = 0;
	jbc	_start,L021103?
	sjmp	L021041?
L021103?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:429: state = 1;
	mov	_main_state_1_110,#0x01
	clr	a
	mov	(_main_state_1_110 + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:430: secs = 0;
	mov	_secs,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:431: mins = 0;
	mov	_mins,#0x00
	ljmp	L021050?
L021041?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:434: stop();
	lcall	_stop
	ljmp	L021050?
L021046?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:437: else if(line_sensor > HI_THRESH){
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_line_sensor_1_110
	mov	dph,(_main_line_sensor_1_110 + 1)
	mov	b,(_main_line_sensor_1_110 + 2)
	mov	a,(_main_line_sensor_1_110 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L021104?
	ljmp	L021050?
L021104?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:438: printf("ERMAGERD: %2d \n", command);
	push	_main_command_1_110
	push	(_main_command_1_110 + 1)
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:439: execute(command);
	mov	dpl,_main_command_1_110
	mov	dph,(_main_command_1_110 + 1)
	lcall	_execute
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:440: state = 1;
	mov	_main_state_1_110,#0x01
	clr	a
	mov	(_main_state_1_110 + 1),a
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\main code.c:443: }
	ljmp	L021050?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'V=%5.2f L:%5.2f'
	db 0x00
__str_1:
	db '%02d:%02d R: %5.2f '
	db 0x00
__str_2:
	db 'turning left!'
	db 0x0A
	db 0x00
__str_3:
	db 'turning right!'
	db 0x0A
	db 0x00
__str_4:
	db 'State:%d LC:%d Sensor:%5.2f Timer:%d                 '
	db 0x0D
	db 0x0A
	db 0x00
__str_5:
	db 'headed to %2d from 1'
	db 0x0A
	db 0x00
__str_6:
	db 'headed to %2d from 2'
	db 0x0A
	db 0x00
__str_7:
	db 'headed to %2d from 3'
	db 0x0A
	db 0x00
__str_8:
	db 'ERMAGERD: %2d '
	db 0x0A
	db 0x00

	CSEG

end
