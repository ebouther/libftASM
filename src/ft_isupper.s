section .text
	global _ft_isupper

_ft_isupper:
	cmp	rdi, 'A'
	jge	is_upper
	jmp	not_upper

is_upper:
	cmp rdi, 'Z'
	jg	not_upper	
	mov	rax, 0 
	ret

not_upper:
	mov	rax, -1
	ret
