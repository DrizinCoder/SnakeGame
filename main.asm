global _start

section .data
    menu_msg db 10, 'Choose the option:', 10, '1-Start game', 10, '2-Exit', 10
    menu_msg_len equ $ - menu_msg

section .text
_start:
    ; Menu Print Msg
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, menu_msg   ; mensagem
    mov rdx, menu_msg_len ; tamanho
    syscall

    ; syscall exit
    mov rax, 60         ; sys_exit
    mov rdi, 0          ; status 0
    syscall