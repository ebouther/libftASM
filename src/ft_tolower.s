section .text
	global _ft_tolower

_ft_tolower:
	cmp	rdi, 'A'
	jge	is_min	jmp return

is_maj:
	cmp rdi, 'Z'
	jle	ret_min	
	sub rdi, 32 

return:
	mov	rax, rdi
	ret
