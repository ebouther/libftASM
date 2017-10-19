section .text
	global	ft_memset

ft_memset:
	mov	rcx, 0

	loop:

	mov	[rdi + rcx], rsi 

	inc	rcx
	cmp rcx, rdx
	jl	loop
	
	mov rax, rdi
	ret
