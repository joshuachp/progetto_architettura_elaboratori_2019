/*
    File: calcolaMediaIntera.s
    Descrizione: Calcola la media intera dei valori in VETTORE
*/

// Code section

    .text

/*
    calcolaMediaIntera:
        Calcola la media intera dei valori in VETTORE

    @param (int) opzione
    @return (int) media
*/
    .global calcolaMediaIntera
    .type calcolaMediaIntera, @function

calcolaMediaIntera:
    push    %rbp
    mov     %rsp, %rbp
    xor     %rcx, %rcx
    xor     %rbx, %rbx
    // Somma tutti i valori
    jmp     calcolaMediaIntera_condition
calcolaMediaIntera_loop:
    lea     VETTORE(%rip), %rax
    add     (%rax, %rcx, 4), %ebx
    add     $1, %ecx
calcolaMediaIntera_condition:
    mov     LUNGHEZZA_VETTORE(%rip), %eax
    cmp     %eax, %ecx
    jl      calcolaMediaIntera_loop
    mov     %rbx, %rax
    xor     %rdx, %rdx
    // Divide la somma per il numero di valori
    div     %ecx
    mov     %rbp, %rsp
    pop     %rbp
    ret
