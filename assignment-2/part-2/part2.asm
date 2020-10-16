;part2.asm created by Moksh Shaunak Bhavsar and Jushwin Jagdev

extern printf
extern scanf
extern exit

global main

section .text

main:
;printf(prompt1)

    mov rdi, prompt1
    mov rax, 0
    push rax
    call printf
    pop rax

; printf(prompt2)

    mov rdi, prompt2
    mov rax, 0
    push rax
    call printf
    pop rax

; printf(promptName): Asks for Name

    mov rdi, promptName
    mov rax, 0
    push rax
    call printf
    pop rax

;scanf("%s", &name): Gets Name

    mov rdi, stringInput
    mov rsi, name
    mov rax, 0
    push rax
    call scanf
    pop rax

;printf(promptAge): Asks for Age
    mov rdi, promptAge
    mov rax, 0
    push rax
    call printf
    pop rax

;scanf("%d", &age): Gets Age

    mov rdi, numberInput
    mov rsi, age
    mov rax, 0
    push rax
    call scanf
    pop rax

;printf(promptBorn): Asks for Place of Birth
    mov rdi, promptBorn
    mov rax, 0
    push rax
    call printf
    pop rax

;scanf("%s", &placeBorn): Gets Place of Birth

    mov rdi, stringInput
    mov rsi, placeBorn
    mov rax, 0
    push rax
    call scanf
    pop rax

;printf(promptEmployement): Asks for Employement Status
    mov rdi, promptEmployment
    mov rax, 0
    push rax
    call printf
    pop rax

;scanf("%s", &employmentStatus): Gets Employment Status
    mov rdi, stringInput
    mov rsi, employmentStatus
    mov rax, 0
    push rax
    call scanf
    pop rax


;printf(string): Outputs Name

    mov rdi, nameOutput
    mov rsi, name
    mov rax, 0
    push rax
    call printf
    pop rax

;printf(%d, age): Outputs Age

    mov rdi, ageOutput
    mov rsi, [age]
    mov rax, 0
    push rax
    call printf
    pop rax
    
;printf(placeBorn): Outputs Place of Birth

    mov rdi, bornOutput
    mov rsi, placeBorn
    mov rax, 0
    push rax
    call printf
    pop rax

;subtracts the current year from the age of the person to get year of birth
;printf(birthYearOutput): Outputs year of birth of the individual
    mov rsi, 2020
    sub rsi, [age]
    mov rdi, birthYearOutput
    mov rax, 0
    push rax
    call printf
    pop rax
    
;printf(employmentStatus): Outputs Employement Status

    mov rdi, employmentOutput
    mov rsi, employmentStatus
    mov rax, 0
    push rax
    call printf
    pop rax


; printf(promptFinal): Final Prompt

    mov rdi, promptFinal
    mov rax, 0
    push rax
    call printf
    pop rax
    

; exit(0)
    mov rax, 0
    call exit
    


section .data
    prompt1 db "This program is designed to collect data on a specific individual", 0ah, 0dh, 0
    prompt2 db "This program will be asking you questions about your demographic.", 0ah, 0dh, 0

    promptName db "Input your name (without spaces) -> ", 0
    stringInput db "%s", 0
    nameOutput db "Hello %s.", 0ah, 0dh, 0

    promptAge db "Input the age you will be this year -> ", 0
    numberInput db "%d", 0
    ageOutput db "Your will be turning %d this year.", 0ah, 0dh, 0

    promptBorn db "Where were you born -> ", 0
    bornOutput db "You were born in %s", 0

    promptEmployment db "What is your current employment status -> ", 0
    employmentOutput db "Your current employement status is %s.", 0ah, 0dh, 0

    birthYearOutput db " in the year, %d.", 0ah, 0dh, 0
    age dq 0

    promptFinal db "Thank you for completing this survey.", 0ah, 0dh, 0
    
    

section .bss 
    name resb 100    
    placeBorn resb 100
    employmentStatus resb 100
    