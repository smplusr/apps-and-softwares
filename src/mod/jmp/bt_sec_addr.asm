KRN_jmp_bt_sec_addr:

.L_L0_S:	push	bp
		mov	bp, sp

.L_L0_D:	mov	si, [bp+4]

.L_L0_0:	mov	es, si
		
		mov	ah, 0x02
		mov	al, 0x01
		mov	ch, 0x00
		mov	cl, 0x02
		mov	dh, 0x00
		int	0x13

		jc	.L_L0_0

.L_L0_1:	push	si
		push	0x0000
		retf

.L_L0_E:	pop	bp
		ret
