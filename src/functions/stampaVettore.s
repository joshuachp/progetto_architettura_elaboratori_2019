/*
    File: stampaVettore.s
    Descrizione: Stampa a video i valori del vettore inserito precedentemente.
*/
    .file "stampaVettore.s"

    .data 

STRINGA_VALORI_INSERIRTI:
    .string "Valori inseriti: \n"

STRINGA_ELENCO_VALORI:
    .string "Valore %i:"

STRINGA_A_CAPO:
    .string "\n"

STRINGA_VALORI_INSERIRTI_INVERSO:
    .string "Valori inseriti (ordine di inserimento invertito): \n"

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
    cmp     $0, %rdi
    // Condizione se 0 salta ad inverso altrienti rimani
    je      stampaVettore_stringa_inizio_inversa
    
    mov     STRINGA_VALORI_INSERIRTI(%rip), %rdi
    xor     %rax, %rax
    call    printf@plt
    // Condizione for 
    jmp     stampaVettore_condzione

stampaVettore_stringa_inizio_inversa:    
    mov     STRINGA_VALORI_INSERIRTI_INVERSO(%rip), %rdi
    xor     %rax, %rax
    call    printf@plt
    // Condizione for inverso
    jmp     stampaVettore_condzione_inverso

stampaVettore_ciclo: 
    lea     STRINGA_ELENCO_VALORI(%rip), %rdi
    mov     %rcx, %rsi
    call    printf@plt 
    lea    VETTORE(%rip), %rbx
    mov     (%rbx, %rcx, 4), %rdi
    call    puts@plt
    inc     %ecx
    jmp     stampaVettore_condzione
stampaVettore_ciclo_inverso:
    lea     STRINGA_ELENCO_VALORI(%rip), %rdi
    mov     %rcx, %rsi
    call    printf@plt 
    lea     VETTORE(%rip), %rbx
    mov     %rcx, %rax  
    sub     LUNGHEZZA_VETTORE(%rip), %rcx
    mov     (%rbx, %rcx, 4), %rdi
    call    puts@plt
    mov     %rax, %rcx
    inc     %ecx
    jmp     stampaVettore_condzione_inverso
stampaVettore_condzione:
    cmp     LUNGHEZZA_VETTORE(%rip), %ecx
    jl      stampaVettore_ciclo
    jmp     stampaVettore_return
stampaVettore_condzione_inverso:
    cmp     LUNGHEZZA_VETTORE(%rip), %ecx
    jl      stampaVettore_ciclo_inverso
stampaVettore_return:
    mov     %rbp, %rsp
    pop     %rbp
    ret