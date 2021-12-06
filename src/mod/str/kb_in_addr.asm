KRN_str_addr_in:
.L_L0_S:	push	bp
		mov	bp, sp

.L_L0_D:	mov 	si, [bp+4]
		mov 	bx, [bp+6] 

.L_L0_0:	xor	ax, ax
		int	0x16
		cmp	al, 0xa
		jz	.L_L0_E
		mov	[si], al
		inc	si

.L_L0_1:	cmp	bl, 0xf
		jz	.L_L0_E
		mov	ah, 0xe
		int	0x10
		jmp	.L_L0_0

.L_L0_E:	pop	bp
		ret
