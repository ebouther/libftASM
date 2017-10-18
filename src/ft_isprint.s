section .text
	global _ft_isprint

_ft_isprint:
	cmp		rdi, 40o
	jge		printable
	jmp		bad

printable:
	cmp		rdi, 176o 
	jle		ok
	jmp		bad

bad:
	mov		rax, 0
	ret

ok:
	mov		rax, 1 
	ret	
