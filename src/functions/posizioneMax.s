/*
    File: posizioneMax.s
    Descrizione: Trovare la posizione del valore massimo in VETTORE.
*/

    .file "posizioneMax.s"

// Code section
    .text

/*
    posizioneMax:
        Calcola la posizione del numero maggiore presente nell'array.

    @param (void)
    @return (int)
        La funzuione ritorna la posizione del numero Max.
*/
    .global posizioneMax
    .type posizioneMax, @function

posizioneMax:
    push    %rbp
    mov     %rsp, %rbp
    call    calcolaMax
    mov     %rax, %rdi
    call    cercaValore
    mov     %rbp, %rsp
    pop     %rbp
    ret
