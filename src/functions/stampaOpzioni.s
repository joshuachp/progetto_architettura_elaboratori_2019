
    .type puts, @function
    
    .global stampaOpzioni
    .type stampaOpzioni, @function

    .data

STRINGA_OPZIONI: 
    .string "\nOPERAZIONI DISPONIBILI\n----------------------\n1) stampa a video del vettore inserito\n2) stampa a video del vettore inserito in ordine inverso\n3) stampa il numero di valori pari e dispari inseriti\n4) stampa la posizione di un valore inserito dall'utente\n5) stampa il massimo valore inserito\n6) stampa la posizione del massimo valore inserito\n7) stampa il minimo valore inserito\n8) stampa la posizione del minimo valore inserito\n9) stampa il valore inserito con maggior frequenza\n10) stampa la media intera dei valori inseriti\n"

    .text

stampaOpzioni:
    push    %rbp
    movq    %rsp, %rbp
    leaq    STRINGA_OPZIONI(%rip), %rdi
    xorq    %rax, %rax
    call    puts  
    movq    %rbp, %rsp
    pop     %rbp
    ret
