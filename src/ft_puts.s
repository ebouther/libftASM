%define MACH_SYSCALL(nb) 0x2000000 | nb

%define EOF -1

%define SYS_WRITE 4
%define STDOUT 1

section .data
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
	push 0x0A 
	mov		rdi, STDOUT		
	mov		rsi, rsp 
	mov		rdx, 1 
	mov		rax, MACH_SYSCALL(SYS_WRITE) 
	syscall
	jc	err
	add rsp, 8 ; remove \n from stack

	mov rax, 10
	ret	

null_case:
	;--------- WRITE (null) --------;
	mov		rdi, STDOUT	
	mov		rsi, null.str 
	mov		rdx, null.len
	mov		rax, MACH_SYSCALL(SYS_WRITE) 
	syscall

	mov rax, 10 
	ret

err:
	mov rax, -1 
	ret
