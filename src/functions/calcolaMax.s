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
    push    %rbp
    mov     %rsp, %rbp
    // Contatore ciclo.
    xor     %rdx, %rdx 
    xor     %rax, %rax
    // Settaggio massimo uguale vettore[0].
    mov     VETTORE(%rip), %eax
    lea     VETTORE(%rip), %rbx
    jmp     calcoloMax_condizione
calcolaMax_ciclo:
    cmp     (%rbx, %rdx, 4), %eax
    // Se massimo è maggiore del vettore, salto.
    jg      calcolaMax_end_if
    mov     (%rbx, %rdx, 4), %eax
calcolaMax_end_if:
    incl    %edx
calcoloMax_condizione:
    // Confronto contatore e lunghezza vettore.
    cmp     LUNGHEZZA_VETTORE(%rip), %edx
    jl      calcolaMax_ciclo
    mov     %rbp, %rsp
    pop     %rbp
    ret
 