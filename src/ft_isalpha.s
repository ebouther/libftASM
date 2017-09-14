%define MACH_SYSCALL(nb) 0x2000000 | nb
%define STDOUT 1

%define EXIT 1
%define WRITE 4

section .data
hello:
	.string:    db      "Hello, world!", 10
	.len:   equ     $ - hello.string 

section .text
	global _ft_isalpha
	;global _main
	;global _start
	;extern _printf

_ft_isalpha:
	push	rbp
	mov		rbp, rsp
	sub		rsp, 16

	mov		rax, 20 ; default return value (valid) 

	cmp		rdi, 'a'
	jge		is_min

	mov		rsp, rbp
	pop		rbp	
	ret

is_min:
	cmp		rdi, 'z'
	jle		ok
	


bad:
	mov		rax, 24
	mov		rax, 1 ; default return value (valid) 

ok:
	mov		rax, 42 
	mov		rsp, rbp
	pop		rbp	
	ret


;_main:
;	mov		rdi, 0x42
;	push	22	 
;	push	33	 
;	push	44	 
;	push	55	 
;	call	_ft_is_alpha
;	ret

;_main:
;	push	rbp
;	mov		rbp, rsp
;	sub		rsp, 16
;
;	mov		rdi, STDOUT		
;	lea		rsi, [rel hello.string]
;	mov		rdx, hello.len 
;	mov		rax, MACH_SYSCALL(WRITE) 
;	syscall
;
;	;lea		rdi, [rel hello.string]
;	;call	_printf
;
;	leave
;	ret
