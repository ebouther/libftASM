section .text
	global _ft_bzero

_ft_bzero:
	cmp rdi, 0x0
	je end
	cmp rsi, 0x0
	je end

	mov	rcx, 0 

loop:

	mov	byte[rdi + rcx], 0x0

	inc	rcx
	cmp rcx, rsi
	jl	loop

end:
	ret
