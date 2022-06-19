# About
This piece of garbage is a little side project from my side.
It is not good in any case, but you can, if you wnat help to make this OS better.
At the current point of work, there is not even a kernel, it is just the boot loader.
This means, there is a lot to do, and I will work on that, so we will be able to have a 
better operating system in the future.
(SIDENOTE: This OS was never tested  on real hardware, I cant promise, that it will work on a real PC)

## Building and requirements
* You need the qemu emulator installed. Alternative you can use any emulator you want,
but i wont make an own 'running mode' for other ones. If you want to have one, please implement
it by yourself
* You need nasm(Netwide assembler), a linker and a C-Crosscompiler installed on your system.
* You have to install '''make''' to build the program, if you havn't done so.
* Clone the repo with something like git clone url or download the zip file.
* cd into the downloaded repo
* type make OS, make or make run to build the project
* type make run to run the operating system in the qemu-emulator.
