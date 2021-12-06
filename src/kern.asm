[org 0x7e00]


KRN_cd_seg:
.L_L0_S:	mov 	al, '9'
		mov 	ah, 0xe
		int 	0x10

.L_L0_0:	push	msg
		call	KRN_str_pr_addr_eos

.L_L0_E:	jmp	$


KRN_dt_seg:
.L_L0_0:	nop
		msg:	db "Howdy!", 0

.L_L0_D:	nop
		%include	"src/mod/str/pr_dt_addr.asm"
