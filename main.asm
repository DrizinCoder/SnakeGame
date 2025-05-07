global _start

section .data
    menu_msg db 10, 'Choose the option:', 10, '1-Start game', 10, '2-Exit', 10
    menu_msg_len equ $ - menu_msg

    wall_horizontal db '           ------------------------------------------------------', 10
    wall_horizontal_len equ $ - wall_horizontal

    wall_vertical db '          |                                                      |', 10
    wall_vertical_len equ $ - wall_vertical

    debug_msg db 10, 'Drawing the board...', 10
    debug_msg_len equ $ - debug_msg

    invalid_input_msg db 10, 'Invalid input', 10
    invalid_input_msg_len equ $ - invalid_input_msg 

section .bss
    input resb 2

section .text
_start:
    ; Menu Print Msg
    call print_menu

    ; Input capture
    mov rax, 0
    mov rdi, 0
    mov rsi, input
    mov rdx, 2
    syscall

    cmp byte [input], '1'
    je draw_map 
    cmp byte [input], '2'
    je exit

    ; Invalid input
    mov rsi, invalid_input_msg
    mov rdx, invalid_input_msg_len
    call print
    jmp _start

draw_map:
    ; Print debug message
    mov rsi, debug_msg
    mov rdx, debug_msg_len
    call print

    ; Draw top border
    mov rsi, wall_horizontal
    mov rdx, wall_horizontal_len
    call print

    ; Draw vertical walls (middle part)
    mov r10, 0         ; counter
draw_vertical:
    mov rsi, wall_vertical
    mov rdx, wall_vertical_len
    call print
    
    add r10, 1
    cmp r10, 20
    jne draw_vertical

    ; Draw bottom border
    mov rsi, wall_horizontal
    mov rdx, wall_horizontal_len
    call print

    jmp _start

exit:
    ; syscall exit
    mov rax, 60         ; sys_exit
    mov rdi, 0          ; status 0
    syscall

; ===== Print Procedure =====
print:
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    syscall
    ret

; ===== Print_menu Procedure =====
print_menu:
    mov rax, 1
    mov rdi, 1
    mov rsi, menu_msg
    mov rdx, menu_msg_len
    syscall
    ret