;evenodd.asm

; if age <18:
;	print("You can not vote yet")
	
extern printf
extern scanf
extern exit

global main

section .text

main:

	;printf(prompt);
	mov rdi, prompt
	mov rax, 0
	push rax
	call printf
	pop rax
	
	;scanf("%d", &number)
	mov rdi, inputFormat
	mov rsi, number
	mov rax, 0
	push rax
	call scanf
	pop rax
	
	;divide the number& by 2
	; number /=2;
	mov rdx, 0
	mov rax, [number]
	mov rcx, 2
	idiv rcx
	
	; (number % 2) == 0
	cmp rdx, 0
	jne oddNumber
	
	; print("evenMessage")
	mov rdi, evenMessage
	mov rsi, [number]
	mov rax, 0
	push rax
	call printf
	pop rax
	
	jmp endOfProgram
	
oddNumber:
	; print("oddMessage")
	mov rdi, evenMessage
	mov rsi, [number]
	mov rax, 0
	push rax
	call printf
	pop rax

endOfProgram:
	;exit(0)
	mov rax,0
	call exit

section .data
	prompt db "Enter a number: ", 0
	inputFormat db "%d", 0
	number dq 0
	
	evenMessage db "%d is an even number.", 0ah, 0dh, 0
	oddMessage db "%d is a odd number.", 0ah, 0dh, 0