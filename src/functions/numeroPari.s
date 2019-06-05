
    .type puts, @function

    .global numeroPari 
    .type numeroPari @function 

    .data


    .text

numeroPari:
    push    %rbp
    mov     %rsp, %rbp
    mov     $0, %rcx  //contatore cicli (i)
    mov     $0, %rbx // contatore valori pari 
    
    pari:
    lea     VETTORE(%rip), %rdx // Importazione vettore
    lea     (%rdx, %rcx, 4), %rax // VETTORE[i]

    inc     %rcx
    cmp     $10, %rcx
    jl      fine_vettore
    jmp     pari

    fine_vettore:
    mov     %rbp, %rsp
    pop     %rbp
    ret
