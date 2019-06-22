/*
    File: valoreFrequente.s
    Descrizione: Calcola il vettore che è uscito più spesso.
*/
    .file "valoreFrequente.s"

// Code section.
    .text

/*
    valoreFrequente:
        Calcola il numero più frequente nel VETTORE.

    @param (void)
    @return (int) moda
*/
    .global valoreFrequente
    .type valoreFrequente, @function


valoreFrequente:
    push    %ebp
    mov     %esp, %ebp
    sub     $0x10, %esp
    // Max frequenza.
    movl    $-1, -4(%ebp)
    // Frequenza.
    movl    $0, -8(%ebp)
    // Valore frequente.
    movl    $0, -12(%ebp)
    // Contatore 1° ciclo.
    xor     %ecx, %ecx
    jmp     valoreFrequente_condizione1
valoreFrequente_ciclo1:
    // Scelta del vettore.
    lea     VETTORE(), %ebx 
    mov     (%ebx, %ecx, 4), %eax 
    // Contatore 2° ciclo.
    xor     %edx, %edx
    jmp     valoreFrequente_condizione2
valoreFrequente_ciclo2:
    // Confronto tra vettori.
    cmp     (%ebx, %edx, 4), %eax
    // Se i due elementi sono uguali incremento frequenza.
    jne     valoreFrequente_end_if1
    incl    -8(%ebp)
valoreFrequente_end_if1:
    // Incremento contatore 2.
    inc     %edx
valoreFrequente_condizione2:
    cmp     LUNGHEZZA_VETTORE(), %edx
    jl      valoreFrequente_ciclo2
    mov     -8(%ebp), %eax
    cmp     -4(%ebp), %eax
    // Se la frequenza è maggiore.
    jl      valoreFrequente_end_if2
    mov     %eax, -4(%ebp)
    mov     (%ebx, %ecx, 4), %eax
    mov     %eax, -12(%ebp)
valoreFrequente_end_if2:
    movl    $0, -8(%ebp)
    inc     %ecx
valoreFrequente_condizione1:
    cmp     LUNGHEZZA_VETTORE(), %ecx
    jl      valoreFrequente_ciclo1
    // Ritorno valore più frequente.
    mov     -12(%ebp), %eax
    mov     %ebp, %esp
    pop     %ebp
    ret
