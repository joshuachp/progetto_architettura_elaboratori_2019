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
    push    %ebp
    mov     %esp, %ebp
    call    calcolaMax
    mov     %eax, %edi
    call    cercaValore
    mov     %ebp, %esp
    pop     %ebp
    ret
