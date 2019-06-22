/*
    File: stampaVettore.s
    Descrizione: Stampa a video i valori del vettore inserito precedentemente.
*/
    .file "stampaVettore.s"

// Data Section
    .data 

STRINGA_VALORI_INSERIRTI:
    .string "Valori inseriti:\n"

STRINGA_ELENCO_VALORI:
    .string "Valore %i: %i\n"

STRINGA_VALORI_INSERIRTI_INVERSO:
    .string "Valori inseriti (ordine di inserimento invertito): \n"

// Code section
.text

/*
    stampaVettore:
        Riceve il vettore e lo stampa a video

    @param (int) opzione
    @return (void)
*/
.global stampaVettore
.type stampaVettore, @function

stampaVettore:
    push    %rbp
    mov     %rsp, %rbp
    sub     $8, %rsp
    cmp     $1, %rdi
    // Condizione se 1 salta ad inverso altrienti rimani
    je      stampaVettore_inverso
    // Stampa vettore
    lea     STRINGA_VALORI_INSERIRTI(%rip), %rdi
    xor     %rax, %rax
    call    puts@PLT
    // Contatore ciclo
    movl     $0, -4(%rbp)
    // Condizione for
    jmp stampaVettore_condizione
stampaVettore_ciclo:
    // Stampo indice e valore del VETTORE
    xor     %rcx, %rcx
    mov     -4(%rbp), %ecx
    lea     VETTORE(%rip), %rax
    mov     (%rax, %rcx, 4), %edx
    mov     %ecx, %esi
    inc     %esi
    lea     STRINGA_ELENCO_VALORI(%rip), %rdi
    xor     %rax, %rax
    call    printf@PLT
    // Incremento contatore
    incl    -4(%rbp)
stampaVettore_condizione:
    mov     -4(%rbp), %ecx
    cmp     LUNGHEZZA_VETTORE(%rip), %ecx
    // Se è minore della lunghezza continuo il ciclo
    jl      stampaVettore_ciclo
    // Ritorno
    jmp     stampaVettore_return
stampaVettore_inverso:
    // Stampa vettore inverso
    lea     STRINGA_VALORI_INSERIRTI_INVERSO(%rip), %rdi
    xor     %rax, %rax
    call    puts@PLT
    // Contatore ciclo
    mov     LUNGHEZZA_VETTORE(%rip), %ecx
    dec     %ecx
    mov     %ecx, -4(%rbp)
    // Condizione for inverso
    jmp stampaVettore_inverso_condizione
stampaVettore_inverso_ciclo:
    // Stampo indice e valore del VETTORE inverso
    xor     %rcx, %rcx
    mov     -4(%rbp), %ecx
    lea     VETTORE(%rip), %rax
    mov     (%rax, %rcx, 4), %edx
    mov     %ecx, %esi
    inc     %esi
    lea     STRINGA_ELENCO_VALORI(%rip), %rdi
    xor     %rax, %rax
    call    printf@PLT
    // Decremento contatore
    decl    -4(%rbp)
stampaVettore_inverso_condizione:
    cmp     $0, -4(%rbp)
    // Se è maggiore o uguale a 0 continuo il ciclo
    jge     stampaVettore_inverso_ciclo
stampaVettore_return:
    mov     %rbp, %rsp
    pop     %rbp
    ret
