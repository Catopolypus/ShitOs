;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Will print any string, that is loaded into si(register for string operations);;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

print:
    pusha                               ; Load all registers into the stack

start_print:
    mov al, [bx]                        ; Save the fist character into al(register used for printing)
    cmp al, 0                           ; Is al == 0 => string is ready
    je done_print

    mov ah, 0x0e
    int 0x10                            ; Call the bios interrupt

    add bx, 1                           ; Increment the pointer bx by one => Use the next char in the string
    jmp start_print                     ; Next loop cycle

done_print:
    popa
    ret

print_nl:
    pusha
    mov ah, 0x0e
    mov al, 0x0a
    int 0x10
    
    mov al, 0x0d                        ; Carriage return = 0x0d
    int 0x10
    popa
    ret
