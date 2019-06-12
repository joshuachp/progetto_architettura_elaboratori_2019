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
    push    %rbp
    mov     %rsp, %rbp
    sub     $0x10, %rsp
    // Max frequenza.
    movl    $-1, -4(%rbp)
    // Frequenza.
    movl    $0, -8(%rbp)
    // Valore frequente.
    movl    $0, -12(%rbp)
    // Contatore 1° ciclo.
    xor     %rcx, %rcx
    jmp     valoreFrequente_condizione1
valoreFrequente_ciclo1:
    // Scelta del vettore.
    lea     VETTORE(%rip), %rbx 
    mov     (%rbx, %rcx, 4), %eax 
    // Contatore 2° ciclo.
    xor     %rdx, %rdx
    jmp     valoreFrequente_condizione2
valoreFrequente_ciclo2:
    // Confronto tra vettori.
    cmp     (%rbx, %rdx, 4), %eax
    // Se i due elementi sono uguali incremento frequenza.
    jne     valoreFrequente_end_if1
    incl    -8(%rbp)
valoreFrequente_end_if1:
    // Incremento contatore 2.
    inc     %edx
valoreFrequente_condizione2:
    cmp     LUNGHEZZA_VETTORE(%rip), %edx
    jl      valoreFrequente_ciclo2
    mov     -8(%rbp), %eax
    cmp     -4(%rbp), %eax
    // Se la frequenza è maggiore.
    jl      valoreFrequente_end_if2
    mov     %eax, -4(%rbp)
    mov     (%rbx, %rcx, 4), %eax
    mov     %eax, -12(%rbp)
valoreFrequente_end_if2:
    movl    $0, -8(%rbp)
    inc     %ecx
valoreFrequente_condizione1:
    cmp     LUNGHEZZA_VETTORE(%rip), %ecx
    jl      valoreFrequente_ciclo1
    xor     %rax, %rax
    // Ritorno valore più frequente.
    mov     -12(%rbp), %rax
    mov     %rbp, %rsp
    pop     %rbp
    ret
