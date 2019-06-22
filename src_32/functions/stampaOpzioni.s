/*
    File: stampaOpzioni.s
    Descrizione: Stampa menu delle opzioni.
*/
    .file "stamapOpzioni.s"
    
// Data section.
    .data

/*
    STRINGA_OPZIONI:
        Stringa del menu delle opzioni

    @type (string)
*/
STRINGA_OPZIONI: 
    .string "\nOPERAZIONI DISPONIBILI\n----------------------\n1) stampa a video del vettore inserito\n2) stampa a video del vettore inserito in ordine inverso\n3) stampa il numero di valori pari e dispari inseriti\n4) stampa la posizione di un valore inserito dall'utente\n5) stampa il massimo valore inserito\n6) stampa la posizione del massimo valore inserito\n7) stampa il minimo valore inserito\n8) stampa la posizione del minimo valore inserito\n9) stampa il valore inserito con maggior frequenza\n10) stampa la media intera dei valori inseriti\n"

    // Code section.
    .text

/*
    stampaOpzioni:
        Stampa a video il manu delle opzioni.

    @param (void)
    @return (void)
*/
    .global stampaOpzioni
    .type stampaOpzioni, @function

stampaOpzioni:
    push    %ebp
    mov     %esp, %ebp
    lea     STRINGA_OPZIONI(%eip), %edi
    xor     %eax, %eax
    call    puts@plt  
    mov     %ebp, %esp
    pop     %ebp
    ret
