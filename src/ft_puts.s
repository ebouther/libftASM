%define MACH_SYSCALL(nb) 0x2000000 | nb

%define EOF -1

%define SYS_WRITE 4
%define STDOUT 1

section .data
lf:		db	0x0A
null:
	.str: db	"(null)", 0x0A
	.len: equ	$ - null.str

section .text
	global _ft_puts
	extern _ft_strlen

_ft_puts:
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

	;--------- WRITE \n --------;
	mov		rdi, STDOUT		
	lea		rsi, [rel lf]
	mov		rdx, 1 
	mov		rax, MACH_SYSCALL(SYS_WRITE) 
	syscall
	jc	err

	mov rax, 10
	ret	

null_case:
	;--------- WRITE (null) --------;
	mov		rdi, STDOUT	
	lea     rsi, [rel null.str]
	mov     rdx, null.len
	mov		rax, MACH_SYSCALL(SYS_WRITE) 
	syscall

	mov rax, 10 
	ret

err:
	mov rax, -1 
	ret
