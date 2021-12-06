KRN_mv_addr_dt_end:

.L_L0_S:	push	bp
		mov	bp, sp

.L_L0_D:	mov	si, [bp+4]
		mov	dx, [bp+6]
		mov	bx, [bp+8]

.L_L0_0:	cmp	bx, dx
		je	.L_L0_E

.L_L0_1:	lodsb
		push	si
		mov	si, bx
		mov	[si], dx
		pop	si
	
.L_L0_2:	inc	bx
		jmp .L_L0_0

.L_L0_E:	pop	bp
		ret
