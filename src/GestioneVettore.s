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

LUNGHEZZA_VETTORE:
    .int 10

// Code Section
	.text

main:
    pushq   %rbp
    movq    %rsp, %rbp

    movq    %rbp, %rsp
    popq    %rbp
    xorq    %rax, %rax
    ret
