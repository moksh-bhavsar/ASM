; this example will be a simple hello world example, using Linux system calls

global main

section .data
	; this is where your global variables go
	message db "Hello from Linux!", 0ah, 0dh

section .text
	; this is where your instructions go
	
main	
	; out our message
	mov rax, 1 		 ; sys_write()
	mov rdi, 1 		 ; standard output (cout)
	mov rsi, message ; pointer to
	mov rdx, 19 	 ; how many bytes to print
	syscall 		 ; jump to the kernel to execute sys_write()
	
	; exit from the program
	mov rax, 60 	 ; sys_exit()
	mov rdi, 0		 ; return 0 (in C++)