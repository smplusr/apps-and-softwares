[org 0x7c00]
[bits 16]

MBR_cd_seg:

.L_L0_S:	push 0x7e00
		call KRN_jmp_bt_sec_addr

MBR_dt_seg:

.L_L0_D:	nop
		%include "src/mod/jmp/bt_sec_addr.asm"

MBR_ex_seg:

.L_L0_E:	times	510 - ($-$$)	db 0
		dw	0xaa55
