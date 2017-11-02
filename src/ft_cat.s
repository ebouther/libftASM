%define MACH_SYSCALL(nb) 0x2000000 | nb

%define SYS_READ 3
%define SYS_WRITE 4
%define STDOUT 1

section .bss
	buf:	resb	4096

section .text
	global _ft_cat

_ft_cat:

	push	rbp
	mov		rbp, rsp
	mov		r12, rdi

loop:

	mov		rax, MACH_SYSCALL(SYS_READ)
	mov		rdi, r12 ;fd 
	lea		rsi, [rel buf] ;rsp
	mov		rdx, 4096
	syscall
	jc		exit

	cmp		rax, 0
	jle		exit

	mov		rdx, rax	; len
	mov		rax, MACH_SYSCALL(SYS_WRITE)
	mov		rdi, STDOUT 
	lea		rsi, [rel buf]	;rsp 
	syscall

	jmp		loop


exit:
	leave
	ret
