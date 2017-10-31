section .text
	global	_ft_strcat
	extern	_ft_strlen
	extern	_ft_memcpy

_ft_strcat:

	push	rdi	

	call	_ft_strlen
	add		rdi, rax ; mov rdi to end of s1
	push	rdi	;(end of s1)

	mov		rdi, rsi
	call	_ft_strlen

	pop		rdi ; restore "end of s1" for memcpy 
	mov		rdx, rax
	inc		rdx
	call	_ft_memcpy
	
	pop		rax ; ret s1 (rdi)
	ret

