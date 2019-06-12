/*
    File: valoreFrequente.s
    Descrizione: Calcola il vettore che è uscito più spesso.
*/
    .file "valoreFrequente.s"

// Data section.
    .data

// Code section.
    .text

    .global valoreFrequente
    .type valoreFrequente, @function


valoreFrequente:
    push    %rbp
    mov     %rsp, %rbp
    sub     $0x8, %rsp
    // Max frequenza.
    movl    $-1, -4(%rbp)
    // Contatore frequenza.
    movl    $0, -8(%rbp)
    // Contatore 1° ciclo.
    xor     %ebx, %ebx
ciclo1:
    // Scelta del vettore.
    lea     VETTORE(%rip), %rdx 
    mov     (%rdx, %rcx, 4), %eax 
    mov     LUNGHEZZA_VETTORE(%rip), %eax
    cmp     %eax, %ebx
    jl      fine
ciclo2:
    // Confronto tra vettori.
    lea     VETTORE(%rip), %rdx 
    mov     (%rdx, %rcx, 4), %eax 
    mov     LUNGHEZZA_VETTORE(%rip), %eax
    cmp     %ecx, %eax
    je      ciclo1
valoreFrequente_confronto:
    // Confronto vettori.
    cmp     reg, reg
    je      incrementoFrequenza
incrementoFrequenza:
    incl    -8(%rbp)
    cmp     -4(%rbp), -8(%rbp)
    jl      massimoFrequenza
massimoFrequenza:
    movl    -8(%rbp), -4(%rbp)
    // Valore frequenza.
    movl    $0, -8(%rbp)
    xor     %rdx, %rdx
    mov     regVett, %rdx
    inc     %ecx
    cmp     %ecx, %eax
    jl      ciclo2
fine:
    mov     %rbp, %rsp
    pop     %rbp
    ret