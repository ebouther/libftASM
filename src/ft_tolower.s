section .text
	global _ft_tolower

_ft_tolower:
	cmp	rdi, 'A'
	jge	is_maj
	jmp return

is_maj:
	cmp rdi, 'Z'
	jg	return	
	add rdi, 32 

return:
	mov	rax, rdi
	ret
