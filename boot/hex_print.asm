;;;Print hexadecimal values using register dx and print_string
;;;
;;; Ascii '0'-'9' = hex 0x30-0x39
;;; Ascii 'A'-'F' = hex 0x41-0x46
;;; Ascii 'a'-'f' = hex 0x61-0x66
;;;
print_hex:
	pusha
	mov cx, 0		; Loopcounter for hex convertion

hexloop:
	cmp cx, 4		; Look if cx is 4, then the digit is ready
	je end_loop_hex

	; Convert dx hex value to ascii string
	mov ax, dx
	and ax, 0x000F	; Clear out the 1st 3 digits of ax to work with the last
	add al, 0x30
	cmp al, 0x39	; is al 0-9 or A-F in ascii?
	jle move_into_bx
	add al, 0x7

move_into_bx:
	mov bx, hexstring + 5		; Offsetting with the length of the string(+ null terminator)
	sub bx, cx					; Substract teh loop counter of the value
	mov [bx], al
	ror dx, 4					; "Rotate" right by 4 bytes

	add cx, 1					; increment the counter by 1
	jmp hexloop					; Go through the loop again

end_loop_hex:
	mov bx, hexstring
	call print_string
	popa
	ret

;;; Data section
hexstring:		db '0x0000', 0			; Define a teststring for the hexprinting
