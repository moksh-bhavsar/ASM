; stack.asm

extern printf
extern exit

global main

section .text

add4:
	
	mov rax, [rsp + 8]
	add rax, [rsp + 16]
	add rax, [rsp + 24]
	add rax, [rsp + 32]
	
	ret 32
	
main:

	; rax = add4(a, b, c, d);
	; in asm arguments are pushed in reverse order
	mov rbx, 0
	push rbx	; for stack alignment purposes only
	
	mov rax, 6
	push rax
	mov rax, 5
	push rax
	mov rax, 3
	push rax
	mov rax, 4
	push rax
	
	call add4
	pop rbx
	
	; printf(outputFormat, rax)
	mov rdi, outputFormat
	mov rsi, rax
	mov rax, 0
	push rbx
	call printf
	pop rbx
	
	; exit(0)
	mov rax, 0
	call exit
	
section .data

	outputFormat db "The sum is %d ", 0ah, 0dh, 0