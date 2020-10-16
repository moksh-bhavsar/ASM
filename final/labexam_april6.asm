; labexam_april6.asm

extern printf
extern exit

global main

section .text

nextNum:
	
	cmp r8, [numEvenNums]
	je endOfProgram
	
	mov rdx, 0 
    mov rax, [elements]
    mov rcx, 2
    idiv rcx

    ; (number % 2) == 0
    cmp rdx, 0
    je evenNum


	inc rdi
	inc r10
	jmp nextNum
	
evenNum:
	inc rdi
	inc r9
	inc r10
	cmp rdi, [numNums]
	ja change
	
	jmp nextNum
	
change:
	mov r11, [rdi]
	jmp nextNum

main:
	
	mov rdi,0
	mov rdi, [elements]
	mov r8,0
	mov r8, [howMany]
	mov r9,0
	mov r9, [numEvenNums]
	mov r10,0
	mov r10, [numNums]
	mov r11,0
	mov r11, [largestNum]

	jmp nextNum

endOfProgram:
	
	;printf(outputMessage1, numEvenNums, howMany)
	mov rdi, outputMessage1
	mov rsi, numEvenNums
	mov rdx, howMany
	mov rax, 0
	push rax
	call printf
	pop rax
	
	; printf(outputMessage2, largestNum)
	mov rdi, outputMessage2
	mov rsi, largestNum
	mov rax, 0
	push rax
	call printf
	pop rax
	
	; exit(0)
	mov rax, 0
	call exit


section .data
	elements: dq 4, 5
	howMany: dq 2
	numEvenNums: dq 0
	numNums: dq 0
	largestNum: dq 0
	outputMessage1 db "Searched %d even numbers, in %d numbers in total." ,0ah, 0dh, 0
	outputMessage2 db "The largest even number is %d.", 0ah, 0dh, 0