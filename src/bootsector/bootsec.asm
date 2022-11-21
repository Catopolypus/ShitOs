;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Bootloader: Manages the booting process of the computer;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x7c00]

mov bp, 0x8000                                                          ; Move the stack savely away from us
mov sp, bp                                                              ; Move the basepointer into the stack-pointer

mov bx, 0x9000                                                          ; es:bx = 0x0000 + 0x9000 = 0x9000
mov dh, 2                                                               ; read 2 sectors
; BIOS sets dl to the boot disk number
call disk_load

mov dx, [0x9000]                                                        ; retrieve the first word
call print_hex

call print_nl

mov dx, [0x9000 + 512]                                                  ; second sector
call print_hex

jmp $                                                                   ; Always jump to this adress

;;;;; INCLUDES ;;;;;
%include "src/bootsector/print_string.asm"
%include "src/bootsector/print_hex.asm"
%include "src/bootsector/read_disk.asm"

; zero padding and magic bios number
times 510-($-$$) db 0
dw 0xaa55

; padding sectors with data
times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes
