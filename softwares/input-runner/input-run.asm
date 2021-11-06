section .data
bufsiz: dw 1024

section .bss
buf: resb 1024

section .text
global _start
_start:
	nop

.read:
	mov eax, 3
	mov ebx, 1
	mov ecx, buf
	mov edx, bufsiz
	int 80h

.run:
	call buf

.end:
	mov eax, 1
	mov ebx, 1
	int 80h
