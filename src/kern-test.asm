[org 0x7e00]


xor	ax, ax
mov	ds, ax
mov	ah, 0xe
mov	si, msg

loop:	lodsb
	or	al, al
	jz	$
	int	0x10
	jmp	loop

jmp	$

msg:	db "Howdy!", 0
