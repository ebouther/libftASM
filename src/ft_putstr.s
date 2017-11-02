%define MACH_SYSCALL(nb) 0x2000000 | nb

%define EOF -1

%define SYS_WRITE 4
%define STDOUT 1

section .data
null:
	.str: db	"(null)"
	.len: equ	$ - null.str

section .text
	global _ft_putstr
	extern _ft_strlen

_ft_putstr:
	cmp rdi, 0x0
	je null_case	

	;--------- WRITE STR --------;
	call _ft_strlen
	mov rdx, rax 	; len

	mov	rsi, rdi 	; str
	mov	rdi, STDOUT
	mov rax, MACH_SYSCALL(SYS_WRITE)
	syscall
	jc	err

	mov rax, 1 
	ret	

null_case:
	;--------- WRITE (null) --------;
	mov		rdi, STDOUT	
	lea		rsi, [rel null.str]
	lea		rdx, [rel null.len]
	mov		rax, MACH_SYSCALL(SYS_WRITE) 
	syscall

	mov rax, 1 
	ret

err:
	mov rax, -1 
	ret
