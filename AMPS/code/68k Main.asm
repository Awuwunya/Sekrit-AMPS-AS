; ===========================================================================
; ---------------------------------------------------------------------------
; Normal fade out data
; ---------------------------------------------------------------------------

dFadeOutDataLog:
	dc.b $00, $00, $00,  $00, $00, $01,  $01, $00, $03,  $01, $00, $05
	dc.b $02, $03, $06,  $03, $03, $08,  $04, $03, $0A,  $04, $03, $0C
	dc.b $05, $06, $0D,  $06, $06, $0F,  $06, $06, $11,  $07, $06, $12
	dc.b $08, $09, $14,  $09, $09, $15,  $09, $09, $17,  $0A, $09, $19
	dc.b $0B, $0C, $1A,  $0C, $0C, $1C,  $0C, $0C, $1D,  $0D, $0C, $1F
	dc.b $0E, $0F, $20,  $0F, $0F, $22,  $0F, $0F, $23,  $10, $0F, $25
	dc.b $11, $12, $26,  $12, $12, $27,  $13, $12, $29,  $13, $12, $2A
	dc.b $14, $15, $2C,  $15, $15, $2D,  $16, $15, $2E,  $17, $15, $30
	dc.b $18, $19, $31,  $19, $19, $32,  $19, $19, $34,  $1A, $19, $35
	dc.b $1B, $1C, $36,  $1C, $1C, $38,  $1D, $1C, $39,  $1E, $1C, $3A
	dc.b $1F, $20, $3C,  $20, $20, $3D,  $21, $20, $3E,  $22, $20, $3F
	dc.b $23, $24, $40,  $24, $24, $42,  $25, $24, $43,  $26, $24, $44
	dc.b $27, $28, $45,  $28, $28, $46,  $29, $28, $48,  $2A, $28, $49
	dc.b $2B, $2C, $4A,  $2C, $2C, $4B,  $2D, $2C, $4C,  $2E, $2C, $4D
	dc.b $2F, $30, $4E,  $30, $30, $4F,  $31, $30, $50,  $32, $30, $51
	dc.b $33, $34, $52,  $34, $34, $54,  $35, $34, $55,  $37, $34, $56
	dc.b $38, $39, $57,  $39, $39, $58,  $3A, $39, $59,  $3B, $39, $5A
	dc.b $3C, $3E, $5B,  $3E, $3E, $5C,  $3F, $3E, $5D,  $40, $3E, $5E
	dc.b $40, $44, $5E,  $43, $44, $60,  $46, $44, $62,  $48, $44, $64
	dc.b $4B, $4F, $66,  $4E, $4F, $67,  $51, $4F, $69,  $54, $4F, $6B
	dc.b $57, $5C, $6D,  $5A, $5C, $6F,  $5E, $5C, $70,  $61, $5C, $72
	dc.b $64, $69, $74,  $67, $69, $75,  $6B, $69, $77,  $6E, $69, $79
	dc.b $72, $77, $7A,  $76, $77, $7C,  $79, $77, $7D,  $7D, $77, $7F
	dc.b $7F, $7F, $7F, fReset

	if FEATURE_BACKUP		; this data is only needed when backup feature is enabled also.
dFadeInDataLog:				; you may enable this regardless for personal uses
	dc.b $7F, $7F, $7F,  $7D, $77, $7F,  $79, $77, $7D,  $76, $77, $7C
	dc.b $72, $77, $7A,  $6E, $69, $79,  $6B, $69, $77,  $67, $69, $75
	dc.b $64, $69, $74,  $61, $5C, $72,  $5E, $5C, $70,  $5A, $5C, $6F
	dc.b $57, $5C, $6D,  $54, $4F, $6B,  $51, $4F, $69,  $4E, $4F, $67
	dc.b $4B, $4F, $66,  $48, $44, $64,  $46, $44, $62,  $43, $44, $60
	dc.b $40, $44, $5E,  $40, $3E, $5E,  $3F, $3E, $5D,  $3E, $3E, $5C
	dc.b $3C, $3E, $5B,  $3B, $39, $5A,  $3A, $39, $59,  $39, $39, $58
	dc.b $38, $39, $57,  $37, $34, $56,  $35, $34, $55,  $34, $34, $54
	dc.b $33, $34, $52,  $32, $30, $51,  $31, $30, $50,  $30, $30, $4F
	dc.b $2F, $30, $4E,  $2E, $2C, $4D,  $2D, $2C, $4C,  $2C, $2C, $4B
	dc.b $2B, $2C, $4A,  $2A, $28, $49,  $29, $28, $48,  $28, $28, $46
	dc.b $27, $28, $45,  $26, $24, $44,  $25, $24, $43,  $24, $24, $42
	dc.b $23, $24, $40,  $22, $20, $3F,  $21, $20, $3E,  $20, $20, $3D
	dc.b $1F, $20, $3C,  $1E, $1C, $3A,  $1D, $1C, $39,  $1C, $1C, $38
	dc.b $1B, $1C, $36,  $1A, $19, $35,  $19, $19, $34,  $19, $19, $32
	dc.b $18, $19, $31,  $17, $15, $30,  $16, $15, $2E,  $15, $15, $2D
	dc.b $14, $15, $2C,  $13, $12, $2A,  $13, $12, $29,  $12, $12, $27
	dc.b $11, $12, $26,  $10, $0F, $25,  $0F, $0F, $23,  $0F, $0F, $22
	dc.b $0E, $0F, $20,  $0D, $0C, $1F,  $0C, $0C, $1D,  $0C, $0C, $1C
	dc.b $0B, $0C, $1A,  $0A, $09, $19,  $09, $09, $17,  $09, $09, $15
	dc.b $08, $09, $14,  $07, $06, $12,  $06, $06, $11,  $06, $06, $0F
	dc.b $05, $06, $0D,  $04, $03, $0C,  $04, $03, $0A,  $03, $03, $08
	dc.b $02, $03, $06,  $01, $00, $05,  $01, $00, $03,  $00, $00, $01
	dc.b $00, $00, $00,  fEnd
	endif
	even
; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine for initializing a fade effect.
; Since the driver allows for such an extensive and customizable
; fading code, we may hit a snag if we use fades too fast. It is
; possible, for example, to fade out, then in the middle of that,
; start fading in. This would normally cause a quick jump in the
; volume level from maybe half to completely mute. This routine
; aims to combat this by actually searching for the closest FM
; volume level in the fade program, and to start the new fade from
; where that byte appears. This can alter how long a volume fade
; lasts however, and if PSG and DAC volume are not correct faded,
; it may still cause a jump in their volume (especially if only,
; say, DAC fades volume). In the future, there might be a fix for
; that.
;
; input:
;   a4 - Fade out data
; thrash:
;   a4 - Best fade out data position
;   a5 - Current fade out data position
;   d3 - FM volume copy
;   d4 - Difference of target FM volume from actual FM volume
;   d5 - Copy of smallest difference recorded
; ---------------------------------------------------------------------------

dPlaySnd_FadeOut:
		lea	dFadeOutDataLog(pc),a4	; prepare stock fade out program to a4

dLoadFade:
		move.b	mMasterVolFM.w,d3	; load FM master volume to d3
		tst.b	mFadeAddr+1.w		; check if a fade program is already executing
		beq.s	.nofade			; if not, load fade as is

		move.l	a4,a5			; copy fade program address to a5
		moveq	#-1,d5			; prepare max byter difference

.find
		move.b	(a5),d4			; load the next FM volume from fade program
		bpl.s	.search			; branch if this is not a command

.nofade
		move.l	a4,mFadeAddr.w		; save new fade program address to memory
		move.b	d3,mMasterVolFM.w	; put vol back
		rts

.search
		addq.l	#3,a5			; skip over the current volume group
		sub.b	d3,d4			; sub current FM volume from read volume
		bpl.s	.abs			; if positive, do not negate
		neg.b	d4			; negative to positive

.abs
		cmp.b	d5,d4			; check if volume difference was smaller than before
		bhs.s	.find			; if not, read next group

		move.b	d4,d5			; else save the new difference
		move.l	a5,a4			; also save the fade program address where we found it
		bra.s	.find			; loop through each group in the program
; ===========================================================================
; ---------------------------------------------------------------------------
; Routine for loading a volume filter into Dual PCM ROM.
; This routine will actually write the bank number the volume filter
; is in. This requires volume filters are aligned to Z80 banks.
;
; input:
;   d4 - Bank ID of filter
; thrash:
;   a4 - Target address in Z80 RAM
;   d4 - Lowest byte gets cleared.
;   d5 - Base Z80 instruction used for calculation
;   d6 - The final instruction written to Z80 RAM
; ---------------------------------------------------------------------------

dSetFilter:
		lea	dZ80+SV_VolumeBank.l,a4	; load volume bank instructions address to a1
		moveq	#$74,d5			; prepare the "ld  (hl),h" instruction to d1
	StopZ80					; wait for Z80 to stop
; ---------------------------------------------------------------------------
; addx in Motorola 68000 is much like adc in Z80. It allows us to add
; a register AND the carry to another register. What this means, is if
; we push 1 into carry (so, carry set), we will be loading $75 instead
; of $74 into the carry, making us able to switch between the Z80
; instructions  "ld  (hl),h" and "ld  (hl),l", which in turn allows
; Dual PCM to bank switch into the appropriate bank.
; ---------------------------------------------------------------------------

	rept 8
		moveq	#0,d6			; prepare 0 into d3 (because of addx)
		lsr.b	#1,d4			; shift lsb into carry
		addx.b	d5,d6			; add instruction and carry into d3
		move.b	d6,(a4)+		; save instruction into Z80 memory
	endm

	StartZ80				; enable Z80 execution

locret_SetFilter:
		rts
; ===========================================================================
; ---------------------------------------------------------------------------
; Handle Dual PCM YM Cue correctly
; ---------------------------------------------------------------------------

UpdateAMPS:
		bset	#mfbExec,mFlags.w	; check if AMPS is already running, and set flag
		bne.s	.rts			; if is, DO NOT run it again
		moveq	#4-1,d1			; check Dual PCM status max 4 times

.recheck
	StopZ80					; wait for Z80 to stop
		move.b	dZ80+YM_Buffer.l,d0	; load current cue buffer in use
	StartZ80				; enable Z80 execution

		cmp.b	mLastCue.w,d0		; check if last queue was the same
		bne.s	.bufferok		; if it is same, Dual PCM is delayed and its baaad =(

		moveq	#$20-1,d0		; loop for $20 times
		dbf	d0,*			; in place, to wait for Dual PCM maybe! =I
		dbf	d1,.recheck		; if we still have cycles to check, do it
		bclr	#mfbExec,mFlags.w	; set AMPS as not running

.rts
		rts				; fuck it, Dual PCM does not want to cooperate

.bufferok
		move.b	d0,mLastCue.w		; update the last queue
		move.l	#dZ80+YM_Buffer1,a0	; set the cue address to buffer 1
		tst.b	d0			; check buffer to use
		bne.s	.gotbuffer		; if Z80 is reading buffer 2, branch
		add.w	#YM_Buffer2-YM_Buffer1,a0; set the cue address to buffer 2

.gotbuffer
		bsr.w	dUpdateAllAMPS		; process the driver
	if safe=1				; this must always happen at the end
		AMPS_Debug_CuePtr 3		; check if the cue is still valid
	endif

	StopZ80					; wait for Z80 to stop
		st	(a0)			; make sure cue is marked as completed
	StartZ80				; enable Z80 execution
		bclr	#mfbExec,mFlags.w	; set AMPS as not running

dPaused:
		rts
; ===========================================================================
; ---------------------------------------------------------------------------
; Main routine for updating the AMPS driver
; ---------------------------------------------------------------------------

dUpdateAllAMPS:
		jsr	dPlaySnd(pc)		; check if any music needs playing
		tst.b	mFlags.w		; is music paused?
		bmi.s	dPaused			; if yes, branch
; ---------------------------------------------------------------------------
; This is the new fading feature I created, to make custom fading
; types easier to program. You can define series of 3 bytes, each
; representing FM, PSG and DAC volumes. Each group of 3 is executed
; once per frame. If the first value in a frame is a command flag,
; instead its code is executed. Additionally, no fade program may
; appear before ROM offset $10000, or else it will never be executed.
; ---------------------------------------------------------------------------

.notempo
		tst.b	mFadeAddr+1.w		; check if a fade program is already executing
	if safe=1
		beq.w	.chkregion		; branch if not
	else
		beq.s	.chkregion		; branch if not
	endif

		move.l	mFadeAddr.w,a4		; get the fade porogram address to a4
		addq.l	#3,mFadeAddr.w		; set the fade address to next group

		moveq	#1<<cfbVol,d0		; prepare volume update to d1
		moveq	#0,d2
		move.b	(a4)+,d2		; get FM/command byte from fade data
		bpl.s	.nofadeend		; branch if this is not a command

	if safe=1
		AMPS_Debug_FadeCmd		; check if this command is valid
	endif
		lea	dFadeCommands(pc),a3	; load fade commands pointer table to a3
		jsr	-$80(a3,d2.w)		; run the fade command code
		clr.b	mFadeAddr+1.w		; mark the fade program as completed
		bra.s	.chkregion		; go check the region

.nofadeend
		cmp.b	mMasterVolFM.w,d2	; check if volume did not change
		beq.s	.fadedac		; if did not, branch
		move.b	d2,mMasterVolFM.w	; save the new volume

	if FEATURE_SFX_MASTERVOL
		jsr	dReqVolUpFM(pc)		; go request volume update for FM
	else
		jsr	dReqVolUpMusicFM(pc)	; only request music channels to update
	endif

.fadedac
		move.b	(a4)+,d2		; get DAC volume byte from fade data
		cmp.b	mMasterVolDAC.w,d2	; check if volume did not change
		beq.s	.fadepsg		; if did not, branch
		move.b	d2,mMasterVolDAC.w	; save new volume

.ch :=	mDAC1					; start at DAC1
	rept Mus_DAC				; do for all music DAC channels
		or.b	d0,.ch.w		; tell the channel to update its volume
.ch :=		.ch+cSize			; go to next channel
	endm

	if FEATURE_SFX_MASTERVOL
		or.b	d0,mSFXDAC1.w		; tell SFX DAC1 to update its volume
	endif

.fadepsg
		move.b	(a4)+,d2		; get PSG volume byte from fade data
		cmp.b	mMasterVolPSG.w,d2	; check if volume did not change
		beq.s	.chkregion		; if did not, branch
		move.b	d2,mMasterVolPSG.w	; save new volume

.ch :=	mPSG1					; start at PSG1
	rept Mus_PSG				; do for all music PSG channels
		or.b	d0,.ch.w		; tell the channel to update its volume
.ch :=		.ch+cSize			; go to next channel
	endm

	if FEATURE_SFX_MASTERVOL
.ch :=		mSFXPSG1			; start at SFX PSG1
		rept SFX_PSG			; do for all SFX PSG channels
			or.b	d0,.ch.w	; tell the channel to update its volume
.ch :=			.ch+cSizeSFX		; go to next channel
		endm
	endif
; ---------------------------------------------------------------------------
; Since PAL Mega Drive's run slower than NTSC, if we want the music to
; sound consistent, we need to run the sound driver 1.2 times as fast
; on PAL systems. This will cause issues with some songs that rely on
; game engine to seem "in sync". Because of that, I added a flag to
; disable the PAL fix (much like in Sonic 2's driver). Unlike the fix
; in SMPS drivers (and Sonic 3 and above), this fix will make the music
; play at the exact right speed, instead of slightly too slow.
; ---------------------------------------------------------------------------

.chkregion
		btst	#6,ConsoleRegion.w	; is this PAL system?
		beq.s	.driver			; if not, branch
		subq.b	#1,mCtrPal.w		; decrease PAL frame counter
		bgt.s	.driver			; if hasn't become 0 (or lower!), branch

		btst	#mfbNoPAL,mFlags.w	; check if we have disabled the PAL fix
		bne.s	.nofix			; if yes, run music and SFX
		bsr.s	.driver			; run the sound driver

.nofix
		move.b	#6-1,mCtrPal.w		; reset counter

.driver
	; continue to run sound driver again
; ---------------------------------------------------------------------------
; This is a custom tempo algorithm. It allows for the tempo to run the
; driver multiple times. However, because of the way the driver works,
; the channels must be ran at least once. This code will delay the
; channels if this needs to happen, before the execution occurs.
; ---------------------------------------------------------------------------

		move.w	mTempo.w,d3		; load tempo to d3
		add.w	d3,mTempoAcc.w		; add to tempo accumulator

		tst.b	mTempoAcc.w		; check if there is a full frame of delay yet
		bne.s	dAMPSdoDAC		; if so, skip
		addq.b	#1,mTempoAcc.w		; this later gets substracted from, fix it

.ch :=	mDAC1+cDuration				; start at DAC1 duration
	rept Mus_Ch				; loop through all music channels
		addq.b	#1,.ch.w		; add 1 to duration
.ch :=		.ch+cSize			; go to next channel
	endm
