include "SystemDefines.inc"

ext	resetSound
ext	clearRam
ext	enableExpandedRAM
ext	expandedRAMEnabled
ext	setupJoysticks
ext	startupDelay
ext	setupLibrary
ext setMode2
ext	clearVRAM
ext main_

cseg

startup: public startup
	ld		sp, StackStart			; Setup stack

	call	resetSound				; Reset sound to stop noise at startup
	call	startupDelay			; Delay before starting
	call	clearRam				; Clear ram
	call	setupLibrary			; Setup library
	
	call	enableExpandedRAM		; Enable expanded RAM

	; Use expanded RAM, if available
	ld		a, (expandedRAMEnabled)
	cp		1
	jr		nz, skipMoveStack

	ld		sp, ExpandedStackStart	; Move stack

skipMoveStack:
	call	setupJoysticks			; Setup joysticks
	call	setMode2				; Set mode 2
	call	clearVRAM				; Clear VRAM
	
	jp		main_
