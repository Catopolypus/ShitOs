# Compiler settings
ASMC = nasm
ASM_FLAGS = -f bin
ASM_FILES = boot/boot.asm


# Other stuff
BINFILE = bin/Os-cool.bin


OS:
	# Compile the assembly files
	$(ASMC) $(ASM_FLAGS) $(ASM_FILES) -o $(BINFILE)

$(info ----------------------------------Build process starting------------------------------------------)

run: OS
	$(info -----------------------------------Build process ending--------------------------------------------)
	qemu-system-i386 -display gtk -fda $(BINFILE)

clean:
	rm -rf bin/*.bin
	rm -rf **/*.obj *.obj
