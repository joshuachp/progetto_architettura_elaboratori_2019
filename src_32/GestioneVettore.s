/*
    File: GestioneVettore.s
    Descrizione: Punto di entrata dell'appicazione
*/

    .file "GestioneVettore.s"

// Data section
    .data

/*
    STRINGA_INSERIMENTO:
        Stringa stampata prima dell'inserimeto dei valorin nell'array

    @type (string)
*/
STRINGA_INSERIMENTO:
    .string "Inserimento dei %i interi che compongono il vettore...\n"

/*
    STRINGA_INSERIMENTO_ELEMENTO:
        Stringa stampata prima dell'inserimeto di un elemento nell'array

    @type (string)
*/
STRINGA_INSERIMENTO_ELEMENTO:
    .string "Inserire l'intero in posizione %i: "

/*
    STRINGA_FORMAT_I:
        Stringa per format per l'inserimento di un intero tramite scanf

    @type (string)
*/
STRINGA_FORMAT_I:
    .string "%i"

/*
    STRINGA_FORMAT_I:
        Stringa stampata prima dell'inserimeto dell'operazione da eseguire
        sull'array

    @type (string)
*/
STRINGA_OPZIONI:
    .string "\nInserire valore operazione (0 uscita, -1 ristampa menu'): "


// Code section
	.text

/*
    main:
        Richiede in input gli elemeti dell'array e le operazioni
        da compiere su di esso.

    @param (void)
    @return (int)
        La funzuione ritorna 0 se il programma esce correttamente
        oppure 1 se sono stati inseriti valori errati in input 
*/
	.global main
	.type main, @function

main:
    push    %ebp
    mov     %esp, %ebp
    // Crea 16 byte di spazio per il contatore del ciclo e scanf
    sub     $0x10, %esp
    // Carica e printa la stringa di inserimento
    mov     LUNGHEZZA_VETTORE, %esi
    lea     STRINGA_INSERIMENTO, %edi
    xor     %eax, %eax
    call    printf@PLT
    // Inizializza un ciclo for per l'inserimento
    movl    $0, -0x4(%ebp)
    jmp     main_insert_loop_condition
main_insert_loop:
    // Carica e stampa la stringa di inserimento dell'elemento
    mov     -0x4(%ebp), %esi
    add     $1, %esi
    lea     STRINGA_INSERIMENTO_ELEMENTO, %edi
    xor     %eax, %eax
    call    printf@PLT
    // Inserisce l'elemento nel vettore
    lea     VETTORE, %eax
    xor     %ebx, %ebx
    mov     -0x4(%ebp), %ebx
    lea     (%eax, %ebx, 4), %esi
    lea     STRINGA_FORMAT_I, %edi
    xor     %eax, %eax
    call    scanf@PLT
    // Controllo il successo dello scanf
    cmp     $1, %eax
    // Se scanf ha ricevuto un numero di inputs@PLT diverso da 1 esce dal programma
    je     main_insert_success1
    mov     $1, %edi
    call    exit@PLT
main_insert_success1:
    addl    $1, -0x4(%ebp)
main_insert_loop_condition:
    mov     LUNGHEZZA_VETTORE, %eax
    cmp     %eax, -0x4(%ebp)
    // Continua il ciclo finche il contatore è minore di LUNGHEZZA_VETTORE
    jl      main_insert_loop
    // Stammpa il meno delle opzioni
    call    stampaOpzioni
    // Ciclo per l'inserimento delle opzioni
main_options_loop:
    lea     STRINGA_OPZIONI, %edi
    xor     %eax, %eax
    call    puts@PLT
    lea     -0x8(%ebp), %esi
    lea     STRINGA_FORMAT_I, %edi
    xor     %eax, %eax
    call    scanf@PLT
    // Controllo il successo dello scanf
    cmp     $1, %eax
    // Se scanf ha ricevuto un numero di inputs@PLT diverso da 1 esce dal programma
    je      main_insert_success2
    mov     $1, %edi
    call    exit@PLT
main_insert_success2:
    // Esegue l'opzione selezzionata
    mov     -0x8(%ebp), %edi
    call    eseguiOpzione
    cmpl    $0, -0x8(%ebp)
    // Continua a richidere opzioni fino a che non riceve 0
    jne     main_options_loop
    mov     %ebp, %esp
    pop     %ebp
    xor     %eax, %eax
    ret
