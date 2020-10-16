; encrypt.asm created by Moksh Shaunak Bhavsar and Jushwin Jagdev

extern printf
extern scanf
extern exit

global main

section .text

encryption:
	; to make debugging clear
	mov rax, 0
	mov rbx, 0
	
	; ah <- 'A'
	; al <- 'Z'
	mov ah, [capA]
	mov al, [capZ]
	
	; rsi <- address of original key
	; rdi <- address of plain text
	
nextChar:
	mov dl, [rdi]
	mov dh, [rsi]
		
	; check for null terminator for plain text
	cmp dl, 0
	je endOfEncryption
	
afterRestart:
	; checking if the key reaches "\0" and reset the loop for the key
	cmp dh, 0
	je restart
	
	; the character in plain text is a uppercase letter
	; change it using key
	sub dh, ah
	add dl, dh
	mov [rdi], dl
	
	; checking if the character in the plain text does not go beyond 'Z'
	cmp dl, al
	ja wrapAround

skipChar:
	; don't process this character anymore
	inc rdi	;rdi++
	inc rsi
	jmp nextChar

restart:
	; starting the loop from beginning
	mov rsi, okey
	mov dh, [rsi]
	jmp afterRestart

wrapAround:
	; reset the character back to 'A' and start if it goes beyond 'Z'
	sub dl, 26
	mov [rdi], dl
	jmp skipChar
	
endOfEncryption:
	; return the address 
	ret

main:
	; printf("Enter Key: ");
	mov rdi, prompt1
	mov rax,0
	push rbx
	call printf
	pop rbx
	
	; scanf("%s", key)
	mov rdi, inputFormat
	mov rsi, okey
	mov rax, 0
	push rbx
	call scanf
	pop rbx

	; printf("Enter Message: ");
	mov rdi, prompt2
	mov rax,0
	push rbx
	call printf
	pop rbx
	
	; scanf("%s", ptext)
	mov rdi, inputFormat
	mov rsi, ptext
	mov rax, 0
	push rbx
	call scanf
	pop rbx
	
	; printf("Key: %s.\n", string)
	mov rdi, outputFormat1
	mov rsi, okey
	mov rax, 0
	push rbx
	call printf
	pop rbx
	
	; printf("Plaintext: %s.\n", string)
	mov rdi, outputFormat2
	mov rsi, ptext
	mov rax, 0
	push rbx
	call printf
	pop rbx
	
	; encrypt the message with key
	mov rdi, ptext
	mov rsi, okey
	push rbx
	call encryption		; push the return address onto the stack and jumps to encryption
	pop rbx
	
encryptionReturn:	
	; printf("Ciphertext: %s.\n", string)
	mov rdi, outputFormat3
	mov rsi, ptext
	mov rax, 0
	push rbx
	call printf
	pop rbx
	
	; exit(0)
	mov rax,0
	call exit
	
section .data
	capA db 'A', 0
	capZ db 'Z', 0
	prompt1 db "Enter Key: ", 0
	prompt2 db "Enter the Messsage: ", 0
	inputFormat db "%s", 0
	outputFormat1 db "Key: %s", 0ah, 0dh, 0
	outputFormat2 db "Plaintext: %s", 0ah, 0dh, 0
	outputFormat3 db "Cipher Text: %s", 0ah, 0dh, 0
	
section .bss
	okey resb 100
	ptext resb 100