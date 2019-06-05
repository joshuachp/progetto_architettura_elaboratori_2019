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

VETTORE:
    .int 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

STRINGA_INSERIMENTO:
    .string "Inserimento dei 10 interi che compongono il vettore..."

STRINGA_INSERIMENTO_ELEMENTO:
    .string "Inserire l'intero in posizione %i: "

STRINGS_FORMAT_I:
    .string "%i"

// Code Section
	.text

main:
    push    %rbp
    movq    %rsp, %rbp
    subq    $8, %rsp
    leaq    STRINGA_INSERIMENTO(%rip), %rdi
    xorl    %eax, %eax
    call    puts
    movq    $0, -4(%ebp)
    incq    -4(%ebp)
    cmpq    $10, -4(%rbp)
    jl      main
    leaq    STRINGS_FORMAT_I(%rip), %rdi
    leaq    VETTORE(%rip), %rax
    movq    $3, %rbx
    leaq    (%rax, %rbx, 4), %rsi
    xorq    %rax, %rax
    call    scanf
    movq    %rbp, %rsp
    pop     %rbp
    xorq    %rax, %rax
    ret
