section .text
	global _ft_isalpha

_ft_isalpha:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 16

	cmp		rdi, 'A'
	jge		is_maj

	jmp		bad

is_maj:
	cmp		rdi, 'Z'
	jle		ok
	cmp		rdi, 'a'
	jge		is_min
	jmp		bad

is_min:
	cmp		rdi, 'z'
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
