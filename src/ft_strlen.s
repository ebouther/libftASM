section .text
	global	ft_strlen

ft_strlen:
		
	mov	rcx, 0

	loop:

	inc	rcx
	cmp byte[rdi + rcx], 0
	jne	loop

	mov rax, rcx
	ret
