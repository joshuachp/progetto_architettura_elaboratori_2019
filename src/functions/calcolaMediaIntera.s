/*
    File: calcolaMediaIntera.s
    Descrizione: Calcola la media intera dei valori in VETTORE
*/
    .file "calcolaMediaIntera"

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
    // Contatore ciclo
    xor     %rcx, %rcx
    // Somma numeri
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
    xor     %edx, %edx
    // Inverte il dividendo
    cdq
    // Divide la somma per il numero di valori
    idiv    %ecx
    mov     %rbp, %rsp
    pop     %rbp
    ret
