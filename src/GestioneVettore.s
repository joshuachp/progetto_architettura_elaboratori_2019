/*
    File: GestioneVettore.s
    Descrizione: Punto di entrata dell'appicazione
*/

    .file "GestioneVettore.s"

// Funzioni esterne

    .type printf, @function
    .type puts, @function
    .type scanf, @function

// Data section

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
    push    %rbp
    mov     %rsp, %rbp
    // Crea 4 byte di spazio per il contatore del ciclo
    sub     $0x10, %rsp
    // Carica e printa la stringa di inserimento
    mov     LUNGHEZZA_VETTORE(%rip), %rsi
    lea     STRINGA_INSERIMENTO(%rip), %rdi
    xor     %rax, %rax
    call    printf
    // Inizializza un ciclo for per l'inserimento
    movl    $0, -0xc(%rbp)
    jmp     main_insert_loop_condition
main_insert_loop:
    // Carica e stampa la stringa di inserimento dell'elemento
    mov    -0xc(%rbp), %esi
    add     $1, %esi
    lea     STRINGA_INSERIMENTO_ELEMENTO(%rip), %rdi
    xor     %rax, %rax
    call    printf
    // Inserisce l'elemento nel vettore
    lea     VETTORE(%rip), %rax
    xor     %rbx, %rbx
    mov     -0xc(%rbp), %ebx
    lea     (%rax, %rbx, 4), %rsi
    lea     STRINGA_FORMAT_I(%rip), %rdi
    xor     %rax, %rax
    call    scanf
    // Controllo il successo dello scanf
    cmp     $1, %eax
    je     main_insert_success1
    mov     $1, %rdi
    call    exit
main_insert_success1:
    addl    $1, -0xc(%rbp)
main_insert_loop_condition:
    mov     LUNGHEZZA_VETTORE(%rip), %eax
    cmp     %eax, -0xc(%rbp)
    jl      main_insert_loop
    // Stammpa il meno delle opzioni
    call    stampaOpzioni
    // Ciclo per l'inserimento delle opzioni
main_options_loop:
    lea     STRINGA_OPZIONI(%rip), %rdi
    xor    %rax, %rax
    call    puts
    lea     -0xc(%rbp), %rsi
    lea     STRINGA_FORMAT_I(%rip), %rdi
    xor     %rax, %rax
    call    scanf
    // Controllo il successo dello scanf
    cmp     $1, %eax
    je     main_insert_success2
    mov     $1, %rdi
    call    exit
main_insert_success2:
    // Esegue l'opzione selezzionata
    /* code */
    // Se opzione è zero esce dal ciclo
    cmpl    $0, -0xc(%rbp)
    jne     main_options_loop
    mov     %rbp, %rsp
    pop     %rbp
    xor     %rax, %rax
    ret
