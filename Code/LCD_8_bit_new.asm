;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Dec 11 2012) (MSVC)
; This file was generated Thu Feb 05 12:00:38 2015
;--------------------------------------------------------
$name LCD_8_bit_new
$optc51 --model-small
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
	public _delay
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
	public _LCDprint_PARM_2
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
_LCDprint_PARM_2:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
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
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPorts'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:25: void InitPorts(void)
;	-----------------------------------------
;	 function InitPorts
;	-----------------------------------------
_InitPorts:
	using	0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:27: P0M1=0;
	mov	_P0M1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:28: P0M2=0;
	mov	_P0M2,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:29: P1M1=0;
	mov	_P1M1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:30: P1M2=0;
	mov	_P1M2,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:31: P2M1=0;
	mov	_P2M1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:32: P2M2=0;
	mov	_P2M2,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:33: P3M1=0;
	mov	_P3M1,#0x00
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:34: P3M2=0;
	mov	_P3M2,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Wait50us'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:37: void Wait50us (void)
;	-----------------------------------------
;	 function Wait50us
;	-----------------------------------------
_Wait50us:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:42: _endasm;
	
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:45: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:51: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L004004?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L004008?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:52: for (k=0; k<20; k++) Wait50us();
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:51: for(j=0; j<ms; j++)
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:55: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:57: LCD_E=1;
	setb	_P2_5
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:58: Wait50us();
	lcall	_Wait50us
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:59: LCD_E=0;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:62: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	_ACC,dpl
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:66: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_4,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:67: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_6,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:68: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_7,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:69: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_0,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:70: LCD_D3=ACC_3;
	mov	c,_ACC_3
	mov	_P2_1,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:71: LCD_D2=ACC_2;
	mov	c,_ACC_2
	mov	_P2_2,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:72: LCD_D1=ACC_1;
	mov	c,_ACC_1
	mov	_P2_3,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:73: LCD_D0=ACC_0;
	mov	c,_ACC_0
	mov	_P2_4,c
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:74: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:77: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:79: LCD_RS=1;
	setb	_P2_7
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:80: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:81: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:84: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:86: LCD_RS=0;
	clr	_P2_7
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:87: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:88: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_8BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:91: void LCD_8BIT (void)
;	-----------------------------------------
;	 function LCD_8BIT
;	-----------------------------------------
_LCD_8BIT:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:93: LCD_E=0;  // Resting state of LCD's enable is zero
	clr	_P2_5
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:94: LCD_RW=0; // We are only writing to the LCD in this program
	clr	_P2_6
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:95: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:97: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:98: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:99: WriteCommand(0x33); // Stay in 8-bit mode
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:102: WriteCommand(0x38);
	mov	dpl,#0x38
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:103: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:104: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:105: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:108: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:112: WriteCommand(line==2?0xc0:0x80);
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:113: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:114: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
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
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:115: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
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
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;j                         Allocated to registers r2 r3 
;k                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:119: void delay(void)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:122: for(j=0; j<100; j++)
	mov	r2,#0x00
	mov	r3,#0x00
L011004?:
	clr	c
	mov	a,r2
	subb	a,#0x64
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L011008?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:124: for(k=0; k<1000; k++);
	mov	r4,#0xE8
	mov	r5,#0x03
L011003?:
	dec	r4
	cjne	r4,#0xff,L011017?
	dec	r5
L011017?:
	mov	a,r4
	orl	a,r5
	jnz	L011003?
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:122: for(j=0; j<100; j++)
	inc	r2
	cjne	r2,#0x00,L011004?
	inc	r3
	sjmp	L011004?
L011008?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:129: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:132: InitPorts();
	lcall	_InitPorts
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:133: LCD_8BIT(); 
	lcall	_LCD_8BIT
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:136: LCDprint("PORT TEST", 1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_0
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:138: while(1)
L012002?:
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:140: P0_0=0;
	clr	_P0_0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:141: P0_1=0;
	clr	_P0_1
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:142: P0_2=0;
	clr	_P0_2
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:143: P0_3=0;
	clr	_P0_3
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:144: P0_4=0;
	clr	_P0_4
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:145: P0_5=0;
	clr	_P0_5
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:146: P0_6=0;
	clr	_P0_6
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:147: P3_0=0;
	clr	_P3_0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:148: P3_1=0;
	clr	_P3_1
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:149: P1_2=0;
	clr	_P1_2
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:150: P1_3=0;
	clr	_P1_3
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:152: delay();
	lcall	_delay
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:154: P0_0=1;
	setb	_P0_0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:155: P0_1=1;
	setb	_P0_1
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:156: P0_2=1;
	setb	_P0_2
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:157: P0_3=1;
	setb	_P0_3
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:158: P0_4=1;
	setb	_P0_4
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:159: P0_5=1;
	setb	_P0_5
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:160: P0_6=1;
	setb	_P0_6
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:161: P3_0=1;
	setb	_P3_0
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:162: P3_1=1;
	setb	_P3_1
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:163: P1_2=1;
	setb	_P1_2
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:164: P1_3=1;
	setb	_P1_3
;	C:\Users\Saman\Documents\GitHub\eece_284\Code\LCD_8_bit_new.c:166: delay();
	lcall	_delay
	sjmp	L012002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'PORT TEST'
	db 0x00

	CSEG

end
