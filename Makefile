ASMC = nasm
C_CMP = gcc

# Files 
ASMFILES = $(wildcard src/**/*.asm)
BINFILES = $(wildcard src/**/*.bin)
CFILES = $(wildcard src/**/*.c)

# Emaulator specific flags
QEMUFLAGS = -display gtk -fda
EMU = qemu-system-i386

# We are not doing this, its better to compile by having clear targets set 
all:
	$(info Use make clean install_dep or make run or make OS to run the os, compile it or clean the tree)
	$(info For more information please read the README.md under the section "Compiling and working with the makefile")

# First stage of the buildprocess, the bootsector and its dependencies
OS_s1:
	# Here we build the os bin file
	$(ASMC) -f bin -o bin/bootsec.bin
	

run: clean OS_s1
	$(info Starting running and stuff)
	qemu-system-i386 

clean:
	rm -rf bin/*
	rm -rf ./**/*.bin 
	rm -rf ./*.obj
	rm -rf ./**/*.obj
