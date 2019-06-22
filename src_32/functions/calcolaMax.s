/*
    File: calcolaMax.s
    Descrizione: Calcolo del massimo.
*/

    .file "calcolaMax.s"

// Code section.
    .text

/*
    calcolaMax:
        Calcola il numero maggiore presente nell'array.

    @param (void)
    @return (int)
        La funzuione ritorna il numero Max.
*/
    .global calcolaMax
    .type calcolaMax @function

calcolaMax:
    push    %ebp
    mov     %esp, %ebp
    // Contatore ciclo.
    xor     %edx, %edx 
    xor     %eax, %eax
    // Settaggio massimo uguale vettore[0].
    mov     VETTORE(%eip), %eax
    lea     VETTORE(%eip), %ebx
    jmp     calcoloMax_condizione
calcolaMax_ciclo:
    cmp     (%ebx, %edx, 4), %eax
    // Se massimo è maggiore del vettore, salto.
    jg      calcolaMax_end_if
    mov     (%ebx, %edx, 4), %eax
calcolaMax_end_if:
    incl    %edx
calcoloMax_condizione:
    // Confronto contatore e lunghezza vettore.
    cmp     LUNGHEZZA_VETTORE(%eip), %edx
    jl      calcolaMax_ciclo
    mov     %ebp, %esp
    pop     %ebp
    ret
 