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
    push    %ebp
    mov     %esp, %ebp
    sub     $0x8, %esp
    // Contatore ciclo.
    xor     %ecx, %ecx 
    // Contatore numeri pari.
    movl    $0, -4(%ebp)
    // Divisore. 
    mov     $2, %ebx
    // Condizione del for.
    jmp     numeroPari_condizione
numeroPari_for:
    lea     VETTORE(), %edx 
    mov     (%edx, %ecx, 4), %eax 
    xor     %edx, %edx
    div     %ebx
    inc     %ecx 
    cmp     $1, %edx
    // Se presente il resto non incremento il contatore pari.
    je      numeroPari_condizione
    incl    -4(%ebp)
numeroPari_condizione:
    mov     LUNGHEZZA_VETTORE(), %eax
    cmp     %eax, %ecx
    // Cicla gli elementi dell'array.
    jl      numeroPari_for
    // Ritorno il numero di pari in %eax.
    mov     -4(%ebp), %eax
    mov     %ebp, %esp
    pop     %ebp
    ret
 