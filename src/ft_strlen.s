section .text
	global	_ft_strlen

_ft_strlen:
	push rdi

	xor		rcx, rcx 
	not		rcx		; reverse bits (set to -1)

	xor		al, al
	cld			; clear direction flag (auto incrementing)
	repne scasb ; scan for NULL (al), dec ecx each iter

	; ecx = -strlen - 2
	not		rcx ; rcx = strlen + 1
	dec		rcx ; rcx = strlen

	mov rax, rcx

	pop rdi
	ret
