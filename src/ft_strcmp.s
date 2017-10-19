section .text
	global _ft_strcmp

_ft_strcmp:
	mov	rcx, -1

	loop:
	inc	rcx
	
	cmp byte[rdi + rcx], 0x0 ; s1
	je return;

	mov	r11b, byte[rdi + rcx] ; s1
	cmp r11b, byte[rsi + rcx] ; s1, s2
	je	loop

return:
	mov r11b, byte[rdi + rcx]
	mov rax,  qword r11b		; s1

	mov r11b, byte[rsi + rcx]
	sub rax, qword r11b	; s2
	ret
