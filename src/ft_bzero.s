section .text
	global _ft_bzero

_ft_bzero:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 20 
	mov		rax, rdi
	;mov		rax, rsi

	mov rsp, rbp
	pop rbp
	pop	rbx
	jmp rbx
