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
    .string "Inserimento dei 10 interi che compongono il vettore...\n"

STRINGA_INSERIMENTO_ELEMENTO:
    .string "Inserire l'intero in posizione %i: "

STRINGS_FORMAT_I:
    .string "%i"

// Code Section
	.text

main:
    push    %rbp
    movq    %rsp, %rbp
    
    leaq    STRINGS_FORMAT_I(%rip), %rdi
    leaq    VETTORE(%rip), %rax
    movq    $3, %rbx
    leaq    (%rax, %rbx, 4), %rsi
    xorq    %rax, %rax
    call    scanf
    xorq    %rax, %rax
    movq    %rbp, %rsp
    pop     %rbp
    ret
