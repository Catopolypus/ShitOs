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
- To build the OS, open a terminal, and go to the directory of the OS: `cd <path of the directory e.g. /home/user/ShitOs>`
- Inside the directory, run the command `make` to build the OS. You have to specify, if you want to build it only or if you also want
to run it. Use `make build` to only build the OS, use `make run` to build the OS and run it in qemu. To use this option, qemu has to be installed
- For further tutorials, read the section "Working with the OS"

### TODO
- Need a real kernel
- Need a 32bit print
- honestly, we really are just doing the beare bones

### Resources and helping websites
- https://github.com/cfenollosa/os-tutorial
- Osdev wiki
