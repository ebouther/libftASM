section .text
	global _ft_isdigit

_ft_isdigit:
	cmp		rdi, '0'
	jge		digit
	jmp		bad

digit:
	cmp		rdi, '9'
	jle		ok
	jmp		bad


bad:
	mov		rax, 0
	ret

ok:
	mov		rax, 1 
	ret
