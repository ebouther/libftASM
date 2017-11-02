section .text
	global _ft_islower

_ft_islower:
	cmp	rdi, 'a'
	jge	is_lower
	jmp	not_lower

is_lower:
	cmp rdi, 'z'
	jg	not_lower	
	mov	rax, 1 
	ret

not_lower:
	mov	rax, 0 
	ret
