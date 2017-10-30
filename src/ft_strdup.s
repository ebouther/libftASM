section .text
	global	_ft_strdup
	extern	_ft_strlen
	extern	_ft_memcpy
	extern	_malloc

_ft_strdup:
	push 	rbp
	mov		rbp, rsp
	push	rdi

	call	_ft_strlen
	inc		rax
	mov		rdi, rax ; len for malloc
	push	rax

	
	call	_malloc
	cmp		rax, 0x0
	je		err

	pop		rdx ; len
	pop		rdi ; restore src 

	push	rax ; new str
	mov		rsi, rdi ; src
	mov		rdi, rax ; dst
	call	_ft_memcpy

	pop	rax
	leave
	ret

err:
	mov	rax, 0x0
	leave
	ret
