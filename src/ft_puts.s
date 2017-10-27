%define MACH_SYSCALL(nb) 0x2000000 | nb

%define SYS_WRITE 4
%define STDOUT 1

section .data
	hello_world     db      "Hello World!", 0x0a

section .text
	global _ft_puts
	extern _ft_strlen

_ft_puts:
	call _ft_strlen
	mov rdx, rax 	; len

	mov	rsi, rdi 	; str
	mov	rdi, STDOUT
	mov rax, MACH_SYSCALL(SYS_WRITE)
	syscall

	mov rax, 1
	ret	
