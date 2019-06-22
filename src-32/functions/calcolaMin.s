/*
    File: calcolaMin.s
    Descrizione: Calcolo del massimo.
*/

    .file "calcolaMin.s"

// Code section.
    .text

/*
    calcolaMin:
        Calcola il numero maggiore presente nell'array.

    @param (void)
    @return (int)
        La funzuione ritorna il numero Min.
*/
    .global calcolaMin
    .type calcolaMin @function

calcolaMin:
    push    %ebp
    mov     %esp, %ebp
    // Contatore ciclo.
    xor     %edx, %edx 
    xor     %eax, %eax
    // Settaggio massimo uguale vettore[0].
    mov     VETTORE(%eip), %eax
    lea     VETTORE(%eip), %ebx
    jmp     calcoloMin_condizione
calcolaMin_ciclo:
    cmp     (%ebx, %edx, 4), %eax
    // Se massimo è maggiore del vettore, salto.
    jl      calcolaMin_end_if
    mov     (%ebx, %edx, 4), %eax
calcolaMin_end_if:
    incl    %edx
calcoloMin_condizione:
    // Confronto contatore e lunghezza vettore.
    cmp     LUNGHEZZA_VETTORE(%eip), %edx
    jl      calcolaMin_ciclo
    mov     %ebp, %esp
    pop     %ebp
    ret
 