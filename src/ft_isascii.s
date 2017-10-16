section .text
	global _ft_isascii

_ft_isascii:
	cmp		rdi, 127 
	jle		ok

;bad
	mov		rax, 0
	ret

ok:
	mov		rax, 1 
	ret
