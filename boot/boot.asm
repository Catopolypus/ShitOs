;;; Basic Boot sector that will jump continuously and is able to print strings and hex-numbers
;;;

org	0x7c00		; Make sure that we have the right memory address; just in case

;; Set video mode
mov ah, 0x00                ; int 0x10/ ah 0x00 = set video mode
mov al, 0x03                ; 40x25 text mode
int 0x10

;; Change color/Palette
mov ah, 0x0B
mov bh, 0x00
mov bl, 0x01
int 0x10

mov bx, testString	; Load the testString into bx
call print_string		; Jump to the label print_string

mov bx, string2
call print_string

;;; Testing the hex_printing
mov dx, 0x12AB			; Exsample hex value
call print_hex

;;; End the program
jmp $

;;; Include section (here are external functions)
%include "boot/print.asm"
%include "boot/hex_print.asm"


testString:		db 'TEST', 0xA, 0xD,  0		; 0 To null-terminite the string
string2:		db 'Test with here', 0

    times 510-($-$$) db 0   ; pads out 0s until we reach 510th byte

    dw 0xaa55               ; BIOS magic number; BOOT magic
