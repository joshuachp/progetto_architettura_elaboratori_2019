/*
    File: eseguiOpzione.s
    Descrizione: Esegue sull array VETTORE l'operazione che gli viene passata
*/

    .file "eseguiOpzione.s"

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
    push    %ebp
    mov     %esp, %ebp
    sub     $8, %esp
    mov     8(%ebp), %edx
    // Variabile booleana stampareOrdineInverso
    movb    $1, -1(%ebp)
    cmp     $0, %edx
    // Case uscita dall'operazione
    je      eseguiOpzione_switch_0
    cmp     $1, %edx
    // Case stampa VETTORE
    je      eseguiOpzione_switch_1
    cmp     $2, %edx
    // Case stampa VETTORE iverso
    je      eseguiOpzione_switch_2
    cmp     $3, %edx
    // Case stampa numeri pari e dispari
    je      eseguiOpzione_switch_3
    cmp     $4, %edx
    // Case cerca valore in VETTORE
    je      eseguiOpzione_switch_4
    cmp     $5, %edx
    // Case valore massimo
    je      eseguiOpzione_switch_5
    cmp     $6, %edx
    // Case posizione massimo
    je      eseguiOpzione_switch_6
    cmp     $7, %edx
    // Case valore minimo
    je      eseguiOpzione_switch_7
    cmp     $8, %edx
    // Case posizione minimo
    je      eseguiOpzione_switch_8
    cmp     $9, %edx
    // Case valore più frequente
    je      eseguiOpzione_switch_9
    cmp     $10, %edx
    // Case media intera
    je      eseguiOpzione_switch_10
    cmp     $-1, %edx
    // Case stampa opzioni
    je      eseguiOpzione_switch_m1
    // Default case opzione non supportata
    jmp     eseguiOpzione_switch_default
eseguiOpzione_switch_0:
    // Stampa la stringa di uscita
    push    $STRINGA_USCITA
    call    puts
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_1:
    // Imposta stampaOrdineInverso a false e continua al case stampa vettore
    movb     $0, -1(%ebp)
eseguiOpzione_switch_2:
    // Stampa il vettore in ordine inverso se stampaOrdineInverso è true se no stampa il vettore
    xor     %eax, %eax
    movb    -1(%ebp), %al
    push    %eax
    call    stampaVettore
    add     $4, %esp
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_3:
    // Conta il numero di pari e lo sottrae al numero totale per i dispari
    call    numeroPari
    mov     %eax, -8(%ebp)
    push    %eax
    push    $STRINGA_NUMERI_PARI
    call    printf
    add     $8, %esp
    mov     LUNGHEZZA_VETTORE, %eax
    sub     -8(%ebp), %eax
    push    %eax
    push    $STRINGA_NUMERI_DISPARI
    call    printf
    add     $8, %esp
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_4:
    // Riceve in input un inrero e stampa laposizione o se non è contenuti in VETTORE
    push    $STRINGA_INTERO_DA_CERCARE
    call    puts
    add     $4, %esp
    lea     -8(%ebp), %eax
    push    %eax
    push    $STRINGA_FORMAT_I
    call    scanf
    add     $8, %esp
    // Se scanf ha ricevuto un numero di inputs diverso da 1 esce dal programma
    cmp     $1, %eax
    je      eseguiOpzione_insert_success1
    push    $1
    call    exit
eseguiOpzione_insert_success1:
    mov     -8(%ebp), %ebx
    push    %ebx
    call    cercaValore
    add     $4, %esp
    cmp     $0, %eax
    jl      eseguiOpzione_switch_4_if
    add     $1, %eax
    push    %eax
    mov     -8(%ebp), %eax
    push    %eax
    push    $STRINGA_POSIZIONE_VALORE
    call    printf
    add     $12, %esp
    jmp     eseguiOpzione_switch_4_endif
eseguiOpzione_switch_4_if:
    mov     -8(%ebp), %eax
    push    %eax
    push    $STRINGA_VALORE_NON_TROVATO
    call    printf
    add     $8, %esp
eseguiOpzione_switch_4_endif:
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_5:
    // Calcola il valore massimo e lo stampa a video
    call    calcolaMax
    push    %eax
    push    $STRINGA_VALORE_MAX
    call    printf
    add     $8, %esp
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_6:
    // Stampa a video la posizione del valore massimo inserito
    call     posizioneMax
    add     $1, %eax
    push    %eax
    push    $STRINGA_POSIZIONE_MAX
    call    printf
    add     $8, %esp
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_7:
    // Calcola il valore massimo e lo stampa a video
    call    calcolaMin
    push    %eax
    push    $STRINGA_VALORE_MIN
    call    printf
    add     $8, %esp
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_8:
    // Stampa a video la posizione del valore minimo inserito
    call    posizioneMin
    add     $1, %eax
    push    %eax
    push    $STRINGA_POSIZIONE_MIN
    call    printf
    add     $8, %esp
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_9:
    // Calcola il valore più frequente e lo stampa a video
    call    valoreFrequente
    push    %eax
    push    $STRINGA_VALORE_FREQ
    call    printf
    add     $8, %esp
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_10:
    // Calcola la media e la stampa a video
    call    calcolaMediaIntera
    push    %eax
    push    $STRINGA_MEDIA
    call    printf
    add     $8, %esp
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_m1:
    call    stampaOpzioni
    jmp     eseguiOpzione_exit
eseguiOpzione_switch_default:
    push    $STRINGA_OPT_NON_SUPPORTATA
    call    puts
eseguiOpzione_exit:
    mov     %ebp, %esp
    pop     %ebp
    ret
