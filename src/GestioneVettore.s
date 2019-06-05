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
    mov     %rsp, %rbp
    sub     $0x10, %rsp
    lea     -0xc(%rbp), %rsi
    xor     %rax, %rax
    lea     STRINGS_FORMAT_I(%rip), %rdi
    call    scanf
    mov     %rbp, %rsp
    pop     %rbp
    xor     %rax, %rax
    ret
