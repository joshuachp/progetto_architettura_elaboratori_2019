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
    push    %ebp
    mov     %esp, %ebp
    // Contatore ciclo
    xor     %ecx, %ecx
    // Somma numeri
    xor     %ebx, %ebx
    // Somma tutti i valori
    jmp     calcolaMediaIntera_condition
calcolaMediaIntera_loop:
    lea     VETTORE, %eax
    add     (%eax, %ecx, 4), %ebx
    add     $1, %ecx
calcolaMediaIntera_condition:
    mov     LUNGHEZZA_VETTORE, %eax
    cmp     %eax, %ecx
    jl      calcolaMediaIntera_loop
    mov     %ebx, %eax
    xor     %edx, %edx
    // Divide la somma per il numero di valori
    div     %ecx
    mov     %ebp, %esp
    pop     %ebp
    ret
