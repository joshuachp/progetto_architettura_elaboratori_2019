/*
    File: posizioneMin.s
    Descrizione: Trovare la posizione del valore massimo in VETTORE.
*/

    .file "posizioneMin.s"

// Code section
    .text

/*
    posizioneMin:
        Calcola la posizione del numero maggiore presente nell'array.

    @param (void)
    @return (int)
        La funzuione ritorna la posizione del numero Min.
*/
    .global posizioneMin
    .type posizioneMin, @function

posizioneMin:
    push    %rbp
    mov     %rsp, %rbp
    call    calcolaMin
    mov     %rax, %rdi
    call    cercaValore
    mov     %rbp, %rsp
    pop     %rbp
    ret
