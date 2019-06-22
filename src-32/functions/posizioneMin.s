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
    push    %ebp
    mov     %esp, %ebp
    call    calcolaMin
    mov     %eax, %edi
    call    cercaValore
    mov     %ebp, %esp
    pop     %ebp
    ret
