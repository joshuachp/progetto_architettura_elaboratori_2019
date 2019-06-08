
    .global numeroPari 
    .type numeroPari @function 

    .data

    .text

numeroPari:
    push    %rbp
    mov     %rsp, %rbp
    sub     $0x10, %rsp
    mov     $0, %rcx  # contatore cicli (i)
    movq    $0, -8(%rbp) # contatore valori pari 
    mov     $2, %ebx
    jmp     numeroPari_condizione
numeroPari_for:
    lea     VETTORE(%rip), %rdx # Importazione vettore
    mov     (%rdx, %rcx, 4), %eax # VETTORE[i]
    xor     %rdx, %rdx
    div     %ebx
    inc     %rcx 
    cmp     $1, %rdx
    je      numeroPari_condizione
    incq    -8(%rbp)
numeroPari_condizione:
    xor     %rax, %rax
    mov     LUNGHEZZA_VETTORE(%rip), %eax
    cmp     %rax, %rcx
    jl      numeroPari_for
    mov     -8(%rbp), %rax
    mov     %rbp, %rsp
    pop     %rbp
    ret
 