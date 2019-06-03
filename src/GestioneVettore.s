/*
    Punto di entrata dell'appicazione
*/

    .type puts, @function
    .type printf, @function
    .type scanf, @function

	.global main
	.type main, @function

// Data Section
    .data

    .global VETTORE
VETTORE:
    .int 0
    .int 0
    .int 0
    .int 0
    .int 0
    .int 0
    .int 0
    .int 0
    .int 0
    .int 0

STRINGA_INSERIMENTO:
    .string "Inserimento dei 10 interi che compongono il vettore...\n"

STRINGA_INSERIMENTO_ELEMENTO:
    .string "Inserire l'intero in posizione %i: "

STRINGS_FORMAT_I:
    .string "%i"

// Code Section
	.text

main:
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $4, %rsp
    leaq    STRINGA_INSERIMENTO(%rip), %rdi
    callq   puts
    movq    $3, -4(%rbp)
main_insert:
    movq    -4(%rbp), %rsi
    incq    %rsi
    leaq    STRINGA_INSERIMENTO_ELEMENTO(%rip), %rdi
    xorq    %rax, %rax
    callq   printf
    leaq    VETTORE(%rip), %rax
    movq    (%rbp), %rbx
    leaq    (%rax, %rbx,4), %rsi
    leaq    STRINGS_FORMAT_I(%rip), %rdi
    xorq    %rax, %rax
    callq   scanf
    incq    (%rbp)
    cmpq    $10, (%rbp)
    jl      main_insert
    movq    %rbp, %rsp
    popq    %rbp
    xorq    %rax, %rax
    retq
