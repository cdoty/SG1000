# Set the name of the output ROM.
name		= Test

# Set the output file extension. Some emulators look for specific extension.
extension	= sg

# Set the console type, based on the directories in tms9918lib.
console		= SG1000

# Set the ROM and RAM start addresses
cseg		= 0000-7FFF
dseg	 	= C000

# Set the tools path.
TOOLS_PATH	= ../../Tools

# Set the CATE compiler path. Bin and lib are expected to exist inside the directory.
CATE_PATH	= $(TOOLS_PATH)/Cate
BIN_PATH	= $(CATE_PATH)/bin
LIB_PATH	= $(CATE_PATH)/lib

# CATE/ASM8/Lib compile ID. (ie CATEXX.exe)
compileType	= 80

# Customize the processor type and the TMS-9918 interface type, if needed.
Shared_S	= $(wildcard SystemLib/Z80/Decompression/IO/BitBusterDepackIRQ.s)
Shared_S	+= $(wildcard SystemLib/Z80/Graphics/IO/*.s)
Shared_S	+= $(wildcard SystemLib/Z80/Graphics/Sprite/*.s)
Shared_S	+= $(wildcard SystemLib/Z80/Shared/*.s)
Shared_S	+= $(wildcard SystemLib/Z80/Sound/IO/SN76489/*.s)

System_S	= $(wildcard SystemLib/$(console)/crt0/Cart.s)
System_S	+= $(wildcard SystemLib/$(console)/*.s)
System_S	+= $(wildcard System/*.s)
Game_C		= $(wildcard Game/*.c)
Graphics_S	= $(wildcard Graphics/*.s)

system 		= $(System_S:.s=.obj)

objects 	= $(Shared_S:.s=.obj)
objects 	+= $(Game_C:.c=.obj)

graphics 	= $(Graphics_S:.s=.obj)

libs 		= $(LIB_PATH)/cate$(compileType).lib

lists 		= $(System_S:.s=.lst)
lists 		+= $(Shared_S:.s=.lst)
lists 		+= $(Game_C:.c=.lst)
lists 		+= $(Graphics_S:.s=.lst)

all: $(name).$(extension)

clean:
	rm -f $(system)
	rm -f $(objects)
	rm -f $(graphics)
	rm -f $(lists)
	rm -f $(name).$(extension)
	rm -f $(name).symbols.txt

%.asm: %.c
	$(BIN_PATH)/Cate$(compileType) $<

%.obj: %.asm
	$(BIN_PATH)/Asm$(compileType) $<
	
%.obj: %.s
	$(BIN_PATH)/Asm$(compileType) $<
	
$(name).$(extension): $(system) $(objects) $(graphics)
	$(BIN_PATH)/LinkLE $(name).$(extension) $(cseg) $(dseg) $(system) $(objects) $(graphics) $(libs)
