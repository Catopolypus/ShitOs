# Compilerstuff
ASMC = nasm
C_CMP = gcc
ASMFLAGS = -f bin -o

# Files> Organized in Stages where they are getting compiled 
STAGE0 = ./src/bootsector/bootsec.asm
OSFILE = ./bin/run/ShitOs.bin
CFILES = $(wildcard src/**/*.c)

# Emaulator specific flags
QEMUFLAGS = -display gtk
EMU = qemu-system-x86_64

# TODO: implement install_dep
# TODO: Detect packet-manager if available, otherwise they have to install it themselfs
# TODO: Add prper build system

# We are not doing this, its better to compile by having clear targets set 
all:
	echo "info Use make clean install_dep or make run or make OS to run the os, compile it or clean the tree"
	echo "For more information please read the README.md under the section < Compiling and working with the makefile >"

build: OS_s1

# First stage of the buildprocess, the bootsector and its dependencies
OS_s1:
	# Here we build the os bin file
	$(ASMC) $(STAGE0) $(ASMFLAGS) $(OSFILE)
	
run: clean OS_s1
	$(info Starting running and stuff)
	$(EMU) $(QEMUFLAGS) $(OSFILE) 

clean:
	rm -rf ./**/*.bin 
	rm -rf ./*.obj
	rm -rf ./**/*.obj
