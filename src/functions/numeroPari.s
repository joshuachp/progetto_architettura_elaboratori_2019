
    .global numeroPari 
    .type numeroPari @function 

    .data

    .text

numeroPari:
    push    %rbp
    mov     %rsp, %rbp
    mov     $0, %rcx  //contatore cicli (i)
    mov     $0, %rbx // contatore valori pari 
    jmp     numeroPari_condizione
numeroPari_for:
    lea     VETTORE(%rip), %rdx // Importazione vettore
    lea     (%rdx, %rcx, 4), %rax // VETTORE[i]
    xor     %rdx, %rdx
    div     $2
    inc     %rcx
    cmp     %rdx, $1
    je      numeroPari_condizione
    inc     %rbx
numeroPari_condizione:
    mov     VETTORE(length), %rax
    cmp     %rax, %rcx
    jl      numeroPari_for
    mov     %rbp, %rsp
    pop     %rbp
    mov     %rbx, %rax
    ret
 