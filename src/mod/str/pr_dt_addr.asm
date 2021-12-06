KRN_str_pr_addr_ctn:
.L_L0_S:	push	bp
		mov	bp, sp

.L_L0_D:	mov	si, [bp+4]
		mov	cl, [bp+6]

.L_L0_0:	mov	ah, 0xe

.L_L0_1:	lodsb
		int	0x10

.L_L0_2:	dec	cl
		jz	.L_L0_E
		jmp	.L_L0_1

.L_L0_E:	pop	bp
		ret

KRN_str_pr_addr_eos:
.L_L0_S:	push	bp
		mov	bp, sp

.L_L0_D:	mov	si, [bp+4]

.L_L0_0:	mov	ah, 0xe

.L_L0_1:	lodsb
		cmp	al, 0
		jz	.L_L0_E
.L_L0_2:
		int	0x10
		jmp	.L_L0_1

.L_L0_E:	pop	bp
		ret
