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
    push    %ebp
    mov     %esp, %ebp
    sub     $4, %esp
    mov     8(%ebp), %edx
    cmp     $1, %dl
    // Condizione se 1 salta ad inverso altrienti rimani
    je      stampaVettore_inverso
    // Stampa vettore
    push    $STRINGA_VALORI_INSERIRTI
    call    puts
    add     $4, %esp
    // Contatore ciclo
    movl     $0, -4(%ebp)
    // Condizione for
    jmp stampaVettore_condizione
stampaVettore_ciclo:
    // Stampo indice e valore del VETTORE
    mov     -4(%ebp), %ecx
    lea     VETTORE, %eax
    mov     (%eax, %ecx, 4), %edx
    inc     %ecx
    push    %edx
    push    %ecx
    push    $STRINGA_ELENCO_VALORI
    call    printf
    add     $12, %esp
    // Incremento contatore
    incl    -4(%ebp)
stampaVettore_condizione:
    mov     -4(%ebp), %ecx
    cmp     LUNGHEZZA_VETTORE, %ecx
    // Se è minore della lunghezza continuo il ciclo
    jl      stampaVettore_ciclo
    // Ritorno
    jmp     stampaVettore_return
stampaVettore_inverso:
    // Stampa vettore inverso
    push    $STRINGA_VALORI_INSERIRTI_INVERSO
    call    puts
    add     $4, %esp
    // Contatore ciclo
    mov     LUNGHEZZA_VETTORE, %ecx
    dec     %ecx
    mov     %ecx, -4(%ebp)
    // Condizione for inverso
    jmp stampaVettore_inverso_condizione
stampaVettore_inverso_ciclo:
    // Stampo indice e valore del VETTORE inverso
    mov     -4(%ebp), %ecx
    lea     VETTORE, %eax
    mov     (%eax, %ecx, 4), %edx
    inc     %ecx
    push    %edx
    push    %ecx
    push    $STRINGA_ELENCO_VALORI
    call    printf
    add     $12, %esp
    // Decremento contatore
    decl    -4(%ebp)
stampaVettore_inverso_condizione:
    cmpl    $0, -4(%ebp)
    // Se è maggiore o uguale a 0 continuo il ciclo
    jge     stampaVettore_inverso_ciclo
stampaVettore_return:
    mov     %ebp, %esp
    pop     %ebp
    ret
