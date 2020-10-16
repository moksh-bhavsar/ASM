; decrypt.asm created by Moksh Shaunak Bhavsar and Jushwin Jagdev

extern printf
extern scanf
extern exit

global main

section .text

decryption:
	; to make debugging clear
	mov rax, 0
	mov rbx, 0
	
	; ah <- 'Z'
	; al <- 'A'
	mov al, [capA]
	mov ah, [capZ]
	
	; rsi <- address of key
	; rdi <- address of encrypted text
	
nextChar:
	mov dl, [rdi]
	mov dh, [rsi]
		
	; check for null terminator for encrypted text
	cmp dl, 0
	je endOfdecryption
	
afterRestart:
	; checking if the key reaches "\0" and reset the loop for the key
	cmp dh, 0
	je restart
	
	; the character in encrypted text is a uppercase letter
	; change it using key
	cmp dh, dl
	ja wrapAround

	sub dl, dh
	add dl, al
	mov [rdi], dl
	
	; checking if the character in the plain text does not go beyond 'Z'
	
skipChar:
	; don't process this character anymore
	inc rdi	;rdi++
	inc rsi
	jmp nextChar

restart:
	; starting the loop for the key from beginning
	mov rsi, okey
	mov dh, [rsi]
	jmp afterRestart

wrapAround:
	; reset the character back to 'A' and start if it goes beyond 'Z'
	sub dl, dh
	add dl, 91
	; add al, 1
	; mov dl, al
	mov [rdi], dl
	
	mov al, 'A'
	mov ah, 'Z'
	jmp skipChar
	
endOfdecryption:
	; return the address
	ret

main:
	
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

	; encrypt the message with key
	mov rdi, ptext
	mov rsi, okey
	push rbx
	call decryption		; push the return address onto the stack and jumps to decryption
	pop rbx
	
decryptionReturn:	
	; printf("Ciphertext: %s.\n", string)
	mov rdi, outputFormat
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
	prompt1 db "Enter the key: ", 0
	prompt2 db "Enter the encrypted messsage: ", 0
	inputFormat db "%s", 0
	outputFormat db "Decrypted message: %s", 0ah, 0dh, 0
	
section .bss
	okey resb 100
	ptext resb 100