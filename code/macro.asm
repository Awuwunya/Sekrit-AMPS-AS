

; 128 = 80h = z80, 32988 = 80DCh = z80unDoC
notZ80 function cpu,(cpu<>128)&&(cpu<>32988)

; make org safer (impossible to overwrite previously assembled bytes) and count padding
; and also make it work in Z80 code without creating a new segment
org macro address
	if notZ80(MOMCPU)
		if address < *
			error "too much stuff before org $\{address} ($\{(*-address)} bytes)"
		elseif address > *
			!org address
		endif
	else
		if address < $
			error "too much stuff before org 0\{address}h (0\{($-address)}h bytes)"
		else
			while address > $
				db 0
			endm
		endif
	endif
    endm

; define the cnop pseudo-instruction
cnop macro offset,alignment
	if notZ80(MOMCPU)
		org (*-1+(alignment)-((*-1+(-(offset)))#(alignment)))
	else
		org ($-1+(alignment)-(($-1+(-(offset)))#(alignment)))
	endif
    endm

; redefine align in terms of cnop, for the padding counter
align macro alignment
	cnop 0,alignment
    endm

; define the even pseudo-instruction
even macro
	if notZ80(MOMCPU)
		if (*)&1
			dc.b 0 ;ds.b 1
		endif
	else
		if ($)&1
			db 0
		endif
	endif
    endm
; ===========================================================================
vdpComm		macro ins,addr,type,rwd,end,end2
	if "end2"<>""
		ins #(((((type&rwd)&3)<<30)|((addr&$3FFF)<<16)|(((type&rwd)&$FC)<<2)|((addr&$C000)>>14))end, end2

	elseif "end"<>""
		ins #(((type&rwd)&3)<<30)|((addr&$3FFF)<<16)|(((type&rwd)&$FC)<<2)|((addr&$C000)>>14), end

	else
		ins (((type&rwd)&3)<<30)|((addr&$3FFF)<<16)|(((type&rwd)&$FC)<<2)|((addr&$C000)>>14)
	endif
    endm

vdpCoord	macro x,y,rwd
	vdpComm move.l,($C000+(x*2)+(y*$80)),VRAM,rwd,(a6)
    endm

; ===========================================================================
; values for the type argument
VRAM =  %100001
CRAM =  %101011
VSRAM = %100101

; values for the rwd argument
READ =  %001100
WRITE = %000111
DMA =   %100111

; ===========================================================================
; tells the VDP to copy a region of 68k memory to VRAM or CRAM or VSRAM
dma68kToVDP macro source,dest,length,type
		move.l	#(($9400|((((length)>>1)&$FF00)>>8))<<16)|($9300|(((length)>>1)&$FF)),(a6)
		move.l	#(($9600|((((source)>>1)&$FF00)>>8))<<16)|($9500|(((source)>>1)&$FF)),(a6)
		move.w	#$9700|(((((source)>>1)&$FF0000)>>16)&$7F),(a6)
	vdpComm	move.l,dest,type,DMA,(a6)
    endm

; ===========================================================================
; tells the VDP to fill a region of VRAM with a certain byte
dmaFillVRAM macro byte,addr,length,wait
	move.w	#$8F01,(a6)	; VRAM pointer increment: $0001
	move.l	#(($9400|((((length)-1)&$FF00)>>8))<<16)|($9300|(((length)-1)&$FF)),(a6) ; DMA length ...
	move.w	#$9780,(a6)	; VRAM fill
	move.l	#$40000080|(((addr)&$3FFF)<<16)|(((addr)&$C000)>>14),(a6) ; Start at ...
	move.w	#(byte)<<8,(a5) ; Fill with byte

	if "wait"<>"0"
.loop		move.w	(a5),d1
		btst	#1,d1
		bne.s	.loop		; busy loop until the VDP is finished filling...
		move.w	#$8F02,(a5)	; VRAM pointer increment: $0002
	endif
    endm

; ===========================================================================
; allows you to declare string to be converted to character map or mappings
asc2	macro	or, str
	dc.w strlen(str)-1
	asc	or, str
    endm

asc	macro	or, str
.lc := 0
	rept strlen(str)
.cc :=		CHARFROMSTR(str, .lc)

		if .cc=' '
			dc.w 0|or			; whitespace

		elseif (.cc>='0')&(.cc<='9')
			dc.w (.cc-'0'+1)|or		; 0-9

		elseif (.cc>='a')&(.cc<='z')
			dc.w ('\.cc'-'a'+$2B)|or	; a-z

		elseif (.cc>='A')&(.cc<='Z')
			dc.w (.cc-'A'+$B)|or		; A-Z

		elseif .cc='!'
			dc.w $25|or	; !

		elseif .cc='?'
			dc.w $26|or	; ?

		elseif .cc='.'
			dc.w $27|or	; .

		elseif .cc=','
			dc.w $28|or	; ,

		elseif .cc=':'
			dc.w $29|or	; :

		elseif .cc=';'
			dc.w $2A|or	; ;

		elseif .cc='^'
			dc.w $45|or	; ^

		elseif .cc='/'
			dc.w $46|or	; /

		elseif .cc='\\'
			dc.w $47|or	; \

		elseif .cc='*'
			dc.w $48|or	; *

		elseif .cc='-'
			dc.w $49|or	; -

		elseif .cc='|'
			dc.w $4A|or	; _ (wider)

		elseif .cc='$'
			dc.w $4B|or	; $

		elseif .cc='%'
			dc.w $4C|or	; %

		elseif .cc='#'
			dc.w $4D|or	; #

		elseif .cc='+'
			dc.w $4E|or	; +

		elseif .cc='}'
			dc.w $4F|or	; ->

		elseif .cc='{'
			dc.w $50|or	; <-

		elseif .cc='@'
			dc.w $51|or	; @

		elseif .cc='_'
			dc.w $52|or	; _

		elseif .cc='('
			dc.w $53|or	; (

		elseif .cc=')'
			dc.w $54|or	; )

		elseif .cc='['
			dc.w $55|or	; [

		elseif .cc=']'
			dc.w $56|or	; ]

		elseif .cc='>'
			dc.w $57|or	; >

		elseif .cc='<'
			dc.w $58|or	; <

		elseif .cc='&'
			dc.w $59|or	; &

		elseif .cc='~'
			dc.w $5A|or	; ~

		elseif .cc=39
			dc.w $5B|or	; '

		elseif .cc='"'
			dc.w $5C|or	; "

		elseif .cc='='
			dc.w $5D|or	; =

		elseif .cc='`'
			dc.w $5E|or	; `

		else
			warning "ASCII value failure: \{.cc}"
		endif

.lc :=		.lc+1
	endm
    endm

; ===========================================================================
; Z80 addresses
Z80_RAM =			$A00000 ; start of Z80 RAM
Z80_RAM_end =			$A02000 ; end of non-reserved Z80 RAM
Z80_bus_request =		$A11100
Z80_reset =			$A11200

SRAM_access =			$A130F1
Security_addr =			$A14000
; ===========================================================================
; I/O Area
HW_Version =			$A10001
HW_Port_1_Data =		$A10003
HW_Port_2_Data =		$A10005
HW_Expansion_Data =		$A10007
HW_Port_1_Control =		$A10009
HW_Port_2_Control =		$A1000B
HW_Expansion_Control =		$A1000D
HW_Port_1_TxData =		$A1000F
HW_Port_1_RxData =		$A10011
HW_Port_1_SCtrl =		$A10013
HW_Port_2_TxData =		$A10015
HW_Port_2_RxData =		$A10017
HW_Port_2_SCtrl =		$A10019
HW_Expansion_TxData =		$A1001B
HW_Expansion_RxData =		$A1001D
HW_Expansion_SCtrl =		$A1001F

; ===========================================================================
; VDP addresses
VDP_data_port =			$C00000
VDP_control_port =		$C00004
PSG_input =			$C00011

; ===========================================================================
; Mega-EverDrive
MED_USB_IO =	$A130E2
MED_USB_STAT =	$A130E4
MED_MAP_CTRL =	$A130F0

; ===========================================================================
	phase $FFFF0000
Buffer		ds.b $8100	; general purpose buffers
Drvmem		ds.b $D00	; sound driver memroy
		ds.b $100	; stack data
Stack		ds.w 0		; stack start
Palette		ds.w $40	; palette
DMAlen		ds.w 1		; dma length
Frame		ds.w 1		; current frame
Ctrl1Hold	ds.b 1		; controller 1 held buttons
Ctrl1Press	ds.b 1		; controller 1 pressed buttons
Ctrl2Hold	ds.b 1		; controller 2 held buttons
Ctrl2Press	ds.b 1		; controller 2 pressed buttons
MusSel		ds.b 1		; selected music
MusPlay		ds.b 1		; music currently playing
ConsoleRegion	ds.b 1		; system region
; ===========================================================================
	org 0
