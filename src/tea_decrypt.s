; void decrypt (uint32_t* v, uint32_t* k) {
;     uint32_t v0=v[0], v1=v[1], sum=0xC6EF3720, i;  /* set up */
;     uint32_t delta=0x9e3779b9;                     /* a key schedule constant */
;     uint32_t k0=k[0], k1=k[1], k2=k[2], k3=k[3];   /* cache key */
;     for (i=0; i<32; i++) {                         /* basic cycle start */
;         v1 -= ((v0<<4) + k2) ^ (v0 + sum) ^ ((v0>>5) + k3);
;         v0 -= ((v1<<4) + k0) ^ (v1 + sum) ^ ((v1>>5) + k1);
;         sum -= delta;
;     }                                              /* end cycle */
;     v[0]=v0; v[1]=v1;
; }

section .text
	global _tea_decrypt				; int tea_decrypt(uint32_t msg[2], const uint32_t key[4]);

_tea_decrypt:
	nop
	nop
	nop

	push	rbp
	mov		rbp, rsp
	sub		rsp, 36 

	push	r12
	push	r13

	mov		r11d, dword [rdi]
	mov		[rbp - 4], r11d 		; v0

	mov		r11d, dword [rdi + 4]
	mov		[rbp - 8], r11d 		; v1

	mov		r11d, dword [rsi]
	mov		[rbp - 12], r11d 		; k0 

	mov		r11d, dword [rsi + 4]
	mov		[rbp - 16], r11d		; k1

	mov		r11d, dword [rsi + 8]
	mov		[rbp - 20], r11d		; k2

	mov		r11d, dword [rsi + 12]
	mov		[rbp - 24], r11d		; k3

	mov		r11d, 0x9e3779b9
	mov		[rbp - 28], r11d		; delta 

	mov		[rbp - 32], dword 0		; i 

	mov		[rbp - 36], dword 0xC6EF3720	; sum 


.tea_loop:	

	;   -------------- v1 -= -------------- ;
	mov		r11d, dword [rbp - 4]
	shl		r11d, 4					; v0 << 4
	add		r11d, [rbp - 20]		; + k2

	mov		r12d, [rbp - 4]
	add		r12d, [rbp - 36]		; v0 + sum 

	mov		r13d, dword [rbp - 4]
	shr		r13d, 5					; v0 >> 5
	add		r13d, [rbp - 24]		; + k3

	xor		r11d, r12d	
	xor		r11d, r13d	
	sub		[rbp - 8], r11d			; SUB TO v0 
	;   ----------------------------------- ;

	;   -------------- v0 -= -------------- ;
	mov		r11d, dword [rbp - 8]
	shl		r11d, 4					; v1 << 4
	add		r11d, [rbp - 12]		; + k0

	mov		r12d, [rbp - 8]
	add		r12d, [rbp - 36]		; v1 + sum 

	mov		r13d, dword [rbp - 8]
	shr		r13d, 5					; v1 >> 5
	add		r13d, [rbp - 16]		; + k1

	xor		r11d, r12d	
	xor		r11d, r13d	
	sub		[rbp - 4], r11d			; SUB TO v0 
	;   ----------------------------------- ;


	mov		r11d, dword [rbp - 28]	;
	sub		[rbp - 36], r11d 		; SUB DELTA TO SUM


	add		[rbp - 32], dword 1
	cmp		[rbp - 32], dword 32
	jl		.tea_loop

	mov		r11d, dword [rbp - 4]
	mov		[rdi], r11d		; sgft here if memory is not writable
	mov		r11d, dword [rbp - 8]
	mov		[rdi + 4], r11d

	pop		r13
	pop		r12

	mov		rsp, rbp
	pop		rbp

	ret

	nop
	nop
	nop

