/*
    File: eseguiOpzione.s
    Descrizione: Esegue sull array VETTORE l'operazione che gli viene passata
*/

// Funzioni esterne

    .type puts, @function
    .type printf, @function

// Data section

    .data
/*
    STRINGA_OPT_NON_SUPPORTATA:
        Stringa opzione non suportatas
    @type (string)
*/
STRINGA_OPT_NON_SUPPORTATA:
    .string "Opzione non supportata dall'applicazione!\n"

/*
    STRINGA_USCITA:
        Stringa uscita dal programma
    @type (string)
*/
STRINGA_USCITA:
    .string "Uscita dall'applicazione...\n"

/*
    STRINGA_NUMERI_PARI:
        Stringa format per i numeri pari
    @type (string)
*/
STRINGA_NUMERI_PARI:
    .string "Numero di valori pari inseriti: %i\n"

/*
    STRINGA_NUMERI_DISPARI:
        Stringa format per i numeri dispari
    @type (string)
*/
STRINGA_NUMERI_DISPARI:
    .string "Numero di valori dispari inseriti: %i\n"

// Code section

    .text

/*
    eseguiOpzione:
        Riceve l'opzione come parametro e utilizza uno switch per
        selezzionare l'operazione sull'array

    @param (int) opzione
    @return (void)
*/
    .global eseguiOpzione
    .type eseguiOpzione, @function

eseguiOpzione:
    push    %rbp
    mov     %rsp, %rbp
    sub     $0x10, %rsp
    movb    $1, -0x9(%rbp)
    cmp     $0, %edi
    // Case uscita dall'operazione
    je      eseguiOpzione_switch_0
    cmp     $1, %edi
    // Case stampa VETTORE
    je      eseguiOpzione_switch_1
    cmp     $2, %edi
    // Case stampa VETTORE iverso
    je      eseguiOpzione_switch_2
    cmp     $3, %edi
    // Case stampa numeri pari e dispari
    je      eseguiOpzione_switch_3
    cmp     $4, %edi
    je      eseguiOpzione_switch_4
    cmp     $5, %edi
    je      eseguiOpzione_switch_5
    cmp     $6, %edi
    je      eseguiOpzione_switch_6
    cmp     $7, %edi
    je      eseguiOpzione_switch_7
    cmp     $8, %edi
    je      eseguiOpzione_switch_8
    cmp     $9, %edi
    je      eseguiOpzione_switch_9
    cmp     $10, %edi
    je      eseguiOpzione_switch_10
    cmp     $-1, %edi
    je      eseguiOpzione_switch_m1
    // Default case opzione non supportata
    jmp     eseguiOpzione_switch_default
eseguiOpzione_switch_0:
    lea     STRINGA_USCITA(%rip), %rdi
    xor     %rax, %rax
    call    puts
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_1:
    // Imposta stampaOrdineInverso a false e continua al case stampa vettore
    movb     $0, -0x9(%rbp)
eseguiOpzione_switch_2:
    // Stampa il vettore in ordine inverso se stampaOrdineInverso è true se no stampa il vettore
    xor     %rax, %rax
    movb    -0x9(%rbp), %al
    mov     %rax, %rdi
    // call stampaVettore
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_3:
    // Conta il numero di pari e lo sottrae al numero totale per i dispari
    call    numeroPari
    movl     %eax, -0xd(%rbx)
    mov     %rax, %rsi
    lea     STRINGA_NUMERI_PARI(%rip), %rdi
    xor     %rax, %rax
    call    printf
    xor     %rax, %rax
    mov     LUNGHEZZA_VETTORE(%rip), %eax
    mov     -0xd(%rbp), %ebx
    sub     %ebx, %eax
    mov     %rax, %rsi
    lea     STRINGA_NUMERI_DISPARI(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_4:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_5:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_6:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_7:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_8:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_9:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_10:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_m1:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_default:
    lea     STRINGA_OPT_NON_SUPPORTATA(%rip), %rdi
    xor     %rax, %rax
    call    puts
eseguiOpzione_exit:
    mov     %rbp, %rsp
    pop     %rbp
    ret

