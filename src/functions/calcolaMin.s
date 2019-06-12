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
    push    %rbp
    mov     %rsp, %rbp
    // Contatore ciclo.
    xor     %rdx, %rdx 
    xor     %rax, %rax
    // Settaggio massimo uguale vettore[0].
    mov     VETTORE(%rip), %eax
    lea     VETTORE(%rip), %rbx
    jmp     calcoloMin_condizione
calcolaMin_ciclo:
    cmp     (%rbx, %rdx, 4), %eax
    // Se massimo è maggiore del vettore, salto.
    jl      calcolaMin_end_if
    mov     (%rbx, %rdx, 4), %eax
calcolaMin_end_if:
    incl    %edx
calcoloMin_condizione:
    // Confronto contatore e lunghezza vettore.
    cmp     LUNGHEZZA_VETTORE(%rip), %edx
    jl      calcolaMin_ciclo
    mov     %rbp, %rsp
    pop     %rbp
    ret
 