/*
    File: numeroPari.s
    Descrizione: Calcolo quantità dei numeri pari. 
*/  
    .file "numeroPari.s"

// Code section
    .text

/*
    numeroPari:
        Calcola la quantità di numeri pari presenti nell'array.

    @param (void)
    @return (int)
        La funzuione ritorna il numero dei pari.
*/
    .global numeroPari 
    .type numeroPari @function 

numeroPari:
    push    %rbp
    mov     %rsp, %rbp
    sub     $0x8, %rsp
    // Contatore ciclo.
    mov     $0, %rcx
    // Contatore numeri pari.
    movq    $0, -8(%rbp)
    // Divisore. 
    mov     $2, %ebx
    // Condizione del for.
    jmp     numeroPari_condizione
numeroPari_for:
    lea     VETTORE(%rip), %rdx 
    mov     (%rdx, %rcx, 4), %eax 
    xor     %rdx, %rdx
    div     %ebx
    inc     %rcx 
    cmp     $1, %rdx
    // Se presente il resto non incremento il contatore pari.
    je      numeroPari_condizione
    incq    -8(%rbp)
numeroPari_condizione:
    xor     %rax, %rax
    mov     LUNGHEZZA_VETTORE(%rip), %eax
    cmp     %rax, %rcx
    // Cicla gli elementi dell'array.
    jl      numeroPari_for
    // Ritorno il numero di pari in %rax.
    mov     -8(%rbp), %rax
    mov     %rbp, %rsp
    pop     %rbp
    ret
 