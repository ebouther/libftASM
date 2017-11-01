%define MACH_SYSCALL(nb) 0x2000000 | nb

%define EOF -1

%define SYS_WRITE 4
%define STDOUT 1

section .text
	global _ft_putchar

_ft_putchar:

	;--------- WRITE STR --------;
	push	rdi	

	mov		rsi, rsp 	; char 
	mov		rdi, STDOUT
	mov 	rdx, 1 		; len
	mov 	rax, MACH_SYSCALL(SYS_WRITE)
	syscall
	jc	err

	pop rdi

	mov rax, rdi 
	ret	

err:
	pop rdi
	mov rax, EOF 
	ret
