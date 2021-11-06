.text
.globl _start
_start:
	nop

.call:
	call *0x08(%esp)

.end:
	mov $1, %al
	mov $0, %bl
	int $0x80
