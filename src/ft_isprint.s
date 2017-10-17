section .text
	global _ft_isprint

_ft_isprint:
	cmp		rdi, 0x40
	jge		printable
	jmp		bad

printable:
	cmp		rdi, 0x176 
	jle		ok
	jmp		bad
	call	_ft_isalpha	
	mov		rdx, rax

bad:
	mov		rax, 0
	ret

ok:
	mov		rax, 1 
	ret	
