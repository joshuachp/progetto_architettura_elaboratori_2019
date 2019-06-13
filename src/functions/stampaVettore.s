/*
    File: stampaVettore.s
    Descrizione: Stampa a video i valori del vettore inserito precedentemente.
*/
    .file "stampaVettore.s"

    .data 

STRINGA_VALORI_INSERIRTI:
    .string "Valori inseriti: \n"

STRINGA_ELENCO_VALORI:
    .string "Valore %i: %i"

// Code section
.text

/*
    stampaVettore:
        Riceve il vettore e lo stampa a video

    @param (int) opzione
    @return (void)
*/

.global stampaVettore
.type stampaVettore, @function

stampaVettore:
    push    %rbp
    mov     %rsp, %rbp
    // Contatore ciclo
    xor     %rcx, %rcx
    //Condizione for
    jmp     stampaVettore_condzione
stampaVettore_ciclo: 
    lea     VETTORE(%rip), %rbx
    mov     (%rax, %rcx, 4), %rdi
    call    puts@plt
    inc     %ecx
stampaVettore_condzione:
    cmp     LUNGHEZZA_VETTORE(%rip), %ecx
    jl      stampaVettore_ciclo
    
    mov     %rbp, %rsp
    pop     %rbp
    ret