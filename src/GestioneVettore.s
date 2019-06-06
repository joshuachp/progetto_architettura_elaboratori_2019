/*
    Punto di entrata dell'appicazione
*/

// Funzioni esterne

    .type printf, @function
    .type scanf, @function

// Funzioni interne

	.global main
	.type main, @function

// Data Section
    .data

VETTORE:
    .int 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

LUNGHEZZA_VETTORE:
    .int 10

STRINGA_INSERIMENTO:
    .string "Inserimento dei %i interi che compongono il vettore...\n"

STRINGA_INSERIMENTO_ELEMENTO:
    .string "Inserire l'intero in posizione %i: "

STRINGS_FORMAT_I:
    .string "%i"

// Code Section
	.text

main:
    push    %rbp
    mov     %rsp, %rbp
    sub     $0x10, %rsp
    mov     LUNGHEZZA_VETTORE(%rip), %rsi
    lea     STRINGA_INSERIMENTO(%rip), %rdi
    xor     %rax, %rax
    call    printf
    movq     $0, -0xc(%rbp)
    jmp     main_insert_loop_condition
main_insert_loop:
    mov     -0x8(%rbp), %rsi
    add     $1, %rsi
    lea     STRINGA_INSERIMENTO_ELEMENTO(%rip), %rdi
    xor     %rax, %rax
    call    printf
    add     $1, -0xc(%rbp)
main_insert_loop_condition:
    mov     LUNGHEZZA_VETTORE(%rip), %rax
    cmp     %rax, -0xc(%rbp)
    jl      main_insert_loop
    mov     %rbp, %rsp
    pop     %rbp
    xor     %rax, %rax
    ret
