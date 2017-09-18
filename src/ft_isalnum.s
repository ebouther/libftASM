section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

_ft_isalnum:
	call	_ft_isalpha	
	mov		rdx, rax

	call	_ft_isdigit	
	or		rdx, rax 
	cmp		rdx, 1	
	je		ok	
	jmp		bad

bad:
	mov		rax, 0
	ret

ok:
	mov		rax, 1 
	ret
