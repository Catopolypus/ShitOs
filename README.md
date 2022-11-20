# ShitOs
## Description

### Build processes, cleaning up, running in a VM and compiling
This is a complete guide to install this Operating System on your computer. But you should be familiar with installing
programs on your OS and how to use the command line.
- Requirements:
    - `make`: a building tool for applications
    - `gcc`: or any other crosscompiler should work, but its tested with gcc. 
    If you use anything else, change `C_CMP=gcc` to `C_CMP=YourCompiler` in the Makefile.
    - `nasm`: A compiler for Assembly files.
    - `qemu`: An emulator for the OS. If you want to use something else, you can use that, but there will not be a tutorial how
    to set things up in e.g. VMWare or something else. You have to work it out by yourself then.

### Resources and helping websites
- https://github.com/cfenollosa/os-tutorial
- Osdev wiki
