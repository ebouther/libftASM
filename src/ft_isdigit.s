section .text
	global _ft_isdigit

_ft_isdigit:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 16

	cmp		rdi, '0'
	jge		digit
	jmp		bad

digit:
	cmp		rdi, '9'
	jle		ok
	jmp		bad


bad:
	mov		rax, 0
	mov		rsp, rbp
	pop		rbp	
	ret

ok:
	mov		rax, 1 
	mov		rsp, rbp
	pop		rbp	
	ret
