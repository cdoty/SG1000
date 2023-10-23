RAMStart			equ	$C000		; Ram start address
RAMSize				equ	$3F0		; Ram size, excluding space reserved for stack
StackStart			equ	$C400		; Stack start address
ExpandedStackStart	equ	$A000		; Expanded stack start address
ExtraRAMStart		equ	$8000		; Extra ram start address
ExtraRAMSize		equ	$2000		; Extra ram size
VDPBase				equ	$BE			; VDP data base port 
VDPReadBase			equ	VDPBase		; VDP control base port
WriteOffset			equ	1			; Difference between read and write ports for each base port
PPIPortA			equ	$DC			; PPI port A
PPIPortB			equ	$DD			; PPI port B
PPIPortC			equ	$DE			; PPI port C
PPIPortControl		equ	$92			; PPI control
SoundPort			equ	$7F			; Sound port
SystemSprites		equ	32			; Maximum system sprites
