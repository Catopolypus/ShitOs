;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Bootloader: Manages the booting process of the computer;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x7c00]

;;; Print the first message to the screen ;;;
mov bx, HELLO                                                            ; Move the string hello into bx for the print function
call print

call print_nl

mov bx, GOODBYE
call print

call print_nl

mov dx, 0x12fe
call print_hex

jmp $                                                                   ; Always jump to this adress

;;;;; INCLUDES ;;;;;
%include "src/bootsector/print_string.asm"
%include "src/bootsector/print_hex.asm"

;;; LABLES ;;;
HELLO: db "Hello World", 0                                           ; 0x20 is a space sign in hexadecimal

GOODBYE: db "GoodBey", 0                                                ; 0 is nothing => nothing at the end of the string

; zero padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55
