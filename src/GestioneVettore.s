/*
    Punto di entrata dell'appicazione
*/

// Funzioni esterne

    .type printf, @function
    .type puts, @function
    .type scanf, @function

// Funzioni interne

	.global main
	.type main, @function

// Data Section
    .data

    .global VETTORE
VETTORE:
    .int 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

    .global LUNGHEZZA_VETTORE
LUNGHEZZA_VETTORE:
    .int 10

STRINGA_INSERIMENTO:
    .string "Inserimento dei %i interi che compongono il vettore...\n"

STRINGA_INSERIMENTO_ELEMENTO:
    .string "Inserire l'intero in posizione %i: "

STRINGA_FORMAT_I:
    .string "%i"

STRINGA_OPZIONI:
    .string "\nInserire valore operazione (0 uscita, -1 ristampa menu'): "
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
    movl    $0, -0xc(%rbp)
    jmp     main_insert_loop_condition
main_insert_loop:
    mov    -0xc(%rbp), %esi
    add     $1, %esi
    lea     STRINGA_INSERIMENTO_ELEMENTO(%rip), %rdi
    xor     %rax, %rax
    call    printf
    lea     VETTORE(%rip), %rax
    xor     %rbx, %rbx
    mov     -0xc(%rbp), %ebx
    lea     (%rax, %rbx, 4), %rsi
    lea     STRINGA_FORMAT_I(%rip), %rdi
    xor     %rax, %rax
    call    scanf
    cmp     $1, %eax
    je     main_insert_success
    mov     $1, %rdi
    call    exit
main_insert_success:
    addl    $1, -0xc(%rbp)
main_insert_loop_condition:
    mov     LUNGHEZZA_VETTORE(%rip), %eax
    cmp     %eax, -0xc(%rbp)
    jl      main_insert_loop
    call    stampaOpzioni
main_options_loop:
    lea     STRINGA_OPZIONI(%rip), %rdi
    xor    %rax, %rax
    call    puts
    lea     -0xc(%rbp), %rsi
    lea     STRINGA_FORMAT_I(%rip), %rdi
    xor     %rax, %rax
    call    scanf
    cmp     $1, %eax
    je     main_insert_success
    mov     $1, %rdi
    call    exit
main_insert_success:
    /*
        esegui
    */
    cmpl    $0, -0xc(%rbp)
    jne     main_options_loop
    mov     %rbp, %rsp
    pop     %rbp
    xor     %rax, %rax
    ret
