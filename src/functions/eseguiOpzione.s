/*
    File: eseguiOpzione.s
    Descrizione: Esegue sull array VETTORE l'operazione che gli viene passata
*/

// Funzioni esterne

    .type puts, @function
    .type printf, @function
    .type scanf, @function

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

/*
    STRINGA_INTERO_DA_CERCARE:
        Stringa stampata prima dell'inserimento dell'intero da cercare
    @type (string)
*/
STRINGA_INTERO_DA_CERCARE:
    .string "Inserire l'intero da cercare: "

/*
    STRINGA_FORMAT_I:
        Stringa per format per l'inserimento di un intero tramite scanf

    @type (string)
*/
STRINGA_FORMAT_I:
    .string "%i"

/*
    STRINGA_POSIZIONE_VALORE:
        Stringa per format per il printf del cercaValote

    @type (string)
*/
STRINGA_POSIZIONE_VALORE:
    .string "Posizione del valore %i: %i\n"

/*
    STRINGA_VALORE_NON_TROVATO:
        Stringa per format per il printf del valore non trovato

    @type (string)
*/
STRINGA_VALORE_NON_TROVATO:
    .string "Valore %i non trovato\n"

/*
    STRINGA_VALORE_MAX:
        Stringa per format per il printf del valore massimo

    @type (string)
*/
STRINGA_VALORE_MAX:
    .string "Massimo valore inserito: %i\n"

/*
    STRINGA_POSIZIONE_MAX:
        Stringa per format per il printf della posizione del valore massimo

    @type (string)
*/
STRINGA_POSIZIONE_MAX:
    .string "Posizione del massimo valore inserito: %i\n"

/*
    STRINGA_VALORE_MIN:
        Stringa per format per il printf del valore minimo

    @type (string)
*/
STRINGA_VALORE_MIN:
    .string "Minimo valore inserito: %i\n"

/*
    STRINGA_POSIZIONE_MIN:
        Stringa per format per il printf della posizione del valore minimo

    @type (string)
*/
STRINGA_POSIZIONE_MIN:
    .string "Posizione del minimo valore inserito: %i\n"

/*
    STRINGA_VALORE_FREQ:
        Stringa per format per il printf del valore più frequente

    @type (string)
*/
STRINGA_VALORE_FREQ:
    .string "Valore inserito con maggior frequenza: %i\n"

/*
    STRINGA_MEDIA:
        Stringa per format per il printf della media intera

    @type (string)
*/
STRINGA_MEDIA:
    .string "Media valori: %i\n"

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
    // Variabile booleana stampareOrdineInverso
    movb    $1, -0x1(%rbp)
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
    // Case cerca valore in VETTORE
    je      eseguiOpzione_switch_4
    cmp     $5, %edi
    // Case valore massimo
    je      eseguiOpzione_switch_5
    cmp     $6, %edi
    // Case posizione massimo
    je      eseguiOpzione_switch_6
    cmp     $7, %edi
    // Case valore minimo
    je      eseguiOpzione_switch_7
    cmp     $8, %edi
    // Case posizione minimo
    je      eseguiOpzione_switch_8
    cmp     $9, %edi
    // Case valore più frequente
    je      eseguiOpzione_switch_9
    cmp     $10, %edi
    // Case media intera
    je      eseguiOpzione_switch_10
    cmp     $-1, %edi
    // Case stampa opzioni
    je      eseguiOpzione_switch_m1
    // Default case opzione non supportata
    jmp     eseguiOpzione_switch_default
eseguiOpzione_switch_0:
    // Stampa la stringa di uscita
    lea     STRINGA_USCITA(%rip), %rdi
    xor     %rax, %rax
    call    puts
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_1:
    // Imposta stampaOrdineInverso a false e continua al case stampa vettore
    movb     $0, -0x1(%rbp)
eseguiOpzione_switch_2:
    // Stampa il vettore in ordine inverso se stampaOrdineInverso è true se no stampa il vettore
    xor     %rax, %rax
    movb    -0x1(%rbp), %al
    mov     %rax, %rdi
    // call stampaVettore
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_3:
    // Conta il numero di pari e lo sottrae al numero totale per i dispari
    call    numeroPari
    mov     %eax, -0x8(%rbp)
    mov     %eax, %esi
    lea     STRINGA_NUMERI_PARI(%rip), %rdi
    xor     %rax, %rax
    call    printf
    mov     LUNGHEZZA_VETTORE(%rip), %esi
    mov     -0x8(%rbp), %ebx
    sub     %ebx, %esi
    lea     STRINGA_NUMERI_DISPARI(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_4:
    // Riceve in input un inrero e stampa laposizione o se non è contenuti in VETTORE
    lea     STRINGA_INTERO_DA_CERCARE(%rip), %rdi
    xor     %rax, %rax
    call    puts
    lea     -0xb(%rbp), %rsi
    lea     STRINGA_FORMAT_I(%rip), %rdi
    xor     %rax, %rax
    call    scanf
    // Se scanf ha ricevuto un numero di inputs diverso da 1 esce dal programma
    cmp     $1, %rax
    je      eseguiOpzione_insert_success1
    mov     $1, %rdi
    call    exit
eseguiOpzione_insert_success1:
    mov     %rbx, %rdi
    // call     cercaValore
    cmp     $0, %eax
    jl      eseguiOpzione_switch_4_if
    add     $1, %eax
    mov     %eax, %edx
    mov     -0xb(%rbp), %esi
    lea     STRINGA_POSIZIONE_VALORE(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_switch_4_endif
eseguiOpzione_switch_4_if:
    mov     -0xb(%rbp), %esi
    lea     STRINGA_VALORE_NON_TROVATO(%rip), %rdi
    call    printf
eseguiOpzione_switch_4_endif:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_5:
    // Calcola il valore massimo e lo stampa a video
    // call    calcolaMax
    mov     %rax, %rsi
    lea     STRINGA_VALORE_MAX(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_6:
    // Stampa a video la posizione del valore massimo inserito
    // call     posizioneMax
    add     $1, %rax
    mov     %rax, %rsi
    lea     STRINGA_POSIZIONE_MAX(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_7:
    // Calcola il valore massimo e lo stampa a video
    // call    calcolaMin
    mov     %rax, %rsi
    lea     STRINGA_VALORE_MIN(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_8:
    // Stampa a video la posizione del valore minimo inserito
    // call     posizioneMin
    add     $1, %rax
    mov     %rax, %rsi
    lea     STRINGA_POSIZIONE_MIN(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_9:
    // Calcola il valore più frequente e lo stampa a video
    // call    valoreFrequente
    mov     %rax, %rsi
    lea     STRINGA_VALORE_FREQ(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_10:
    // Calcola la media e la stampa a video
    call    calcolaMediaIntera
    mov     %rax, %rsi
    lea     STRINGA_MEDIA(%rip), %rdi
    xor     %rax, %rax
    call    printf
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_m1:
    call    stampaOpzioni
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_default:
    lea     STRINGA_OPT_NON_SUPPORTATA(%rip), %rdi
    xor     %rax, %rax
    call    puts
eseguiOpzione_exit:
    mov     %rbp, %rsp
    pop     %rbp
    ret
