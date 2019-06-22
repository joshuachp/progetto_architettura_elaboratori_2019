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
    sub     $8, %esp
    cmp     $1, %edi
    // Condizione se 1 salta ad inverso altrienti rimani
    je      stampaVettore_inverso
    // Stampa vettore
    lea     STRINGA_VALORI_INSERIRTI(%eip), %edi
    xor     %eax, %eax
    call    puts@PLT
    // Contatore ciclo
    movl     $0, -4(%ebp)
    // Condizione for
    jmp stampaVettore_condizione
stampaVettore_ciclo:
    // Stampo indice e valore del VETTORE
    mov     -4(%ebp), %ecx
    lea     VETTORE(%eip), %eax
    mov     (%eax, %ecx, 4), %edx
    mov     %ecx, %esi
    inc     %esi
    lea     STRINGA_ELENCO_VALORI(%eip), %edi
    xor     %eax, %eax
    call    printf@PLT
    // Incremento contatore
    incl    -4(%ebp)
stampaVettore_condizione:
    mov     -4(%ebp), %ecx
    cmp     LUNGHEZZA_VETTORE(%eip), %ecx
    // Se è minore della lunghezza continuo il ciclo
    jl      stampaVettore_ciclo
    // Ritorno
    jmp     stampaVettore_return
stampaVettore_inverso:
    // Stampa vettore inverso
    lea     STRINGA_VALORI_INSERIRTI_INVERSO(%eip), %edi
    xor     %eax, %eax
    call    puts@PLT
    // Contatore ciclo
    mov     LUNGHEZZA_VETTORE(%eip), %ecx
    dec     %ecx
    mov     %ecx, -4(%ebp)
    // Condizione for inverso
    jmp stampaVettore_inverso_condizione
stampaVettore_inverso_ciclo:
    // Stampo indice e valore del VETTORE inverso
    mov     -4(%ebp), %ecx
    lea     VETTORE(%eip), %eax
    mov     (%eax, %ecx, 4), %edx
    mov     %ecx, %esi
    inc     %esi
    lea     STRINGA_ELENCO_VALORI(%eip), %edi
    xor     %eax, %eax
    call    printf@PLT
    // Decremento contatore
    decl    -4(%ebp)
stampaVettore_inverso_condizione:
    cmp     $0, -4(%ebp)
    // Se è maggiore o uguale a 0 continuo il ciclo
    jge     stampaVettore_inverso_ciclo
stampaVettore_return:
    mov     %ebp, %esp
    pop     %ebp
    ret
