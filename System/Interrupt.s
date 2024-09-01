include "SystemDefines.inc"

ext	updateSpriteAttributes
ext	updateSpriteAttributeTable

dseg

nmiCount:	public nmiCount
    ds	1

lastNMICount:	public lastNMICount
	ds	1

cseg

nmiHandler: public nmiHandler
	reti

irqHandler: public irqHandler
	push	af
	push	hl

	ld		hl, nmiCount
	inc		(hl)

	ld		a, (updateSpriteAttributes)
	or		a
	jp		z, exitNMIHandler

	push	bc
	push	de

	call	updateSpriteAttributeTable

	pop		de
	pop		bc

exitNMIHandler:
	in		a, (VDPBase + WriteOffset)	; Acknowledge interrupt

	pop		hl
	pop		af

	ei
	
	retn
	