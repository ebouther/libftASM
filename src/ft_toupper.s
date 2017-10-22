section .text
	global _ft_toupper

_ft_toupper:
	cmp	rdi, 'a'
	jge	is_min	
	jmp return

is_min:
	cmp rdi, 'z'
	jle	ret_maj	
	add rdi, 32 

return:
	mov	rax, rdi
	ret
