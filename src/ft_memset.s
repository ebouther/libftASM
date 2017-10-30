section .text
	global _ft_memset

_ft_memset:
	push rdi

	mov		rax, rsi

	mov		rcx, rdx
	rep	stosb	;dec rcx stop when rcx = 0

	; ecx = -strlen - 2
	not		rcx ; rcx = strlen + 1
	dec		rcx ; rcx = strlen

	pop rax
	ret
