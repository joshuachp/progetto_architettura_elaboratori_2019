/*
    File: stampaVettore.s
    Descrizione: Stampa a video i valori del vettore inserito precedentemente.
*/

.text

/*
    stampaVettore:
        Riceve il vettore e lo stampa a video

    @param (int) opzione
    @return (void)
*/

.global stampaVettore.s
.type stampaVettore, @function

stampaVettore:
    push    %rbp
    mov     %rsp, %rbp
    // Contatore ciclo
    xor     %rcx, %rcx
    //Condizione for
    jmp     stampaVettore_condzione
stampaVettore_ciclo: 
    lea     VETTORE(%rip), %rax
    mov     (%rax, %rcx, %4), %edi
    call    puts@plt
    inc     %ecx
stampaVettore_condzione:
    cmp     LUNGHEZZA_VETTORE(%rip), %ecx
    jl      stampaVettore_ciclo
    
    mov     %rbp, %rsp
    pop     %rbp
    ret