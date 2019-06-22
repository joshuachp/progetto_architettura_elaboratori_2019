/*
    File: cercaValore.s
    Descrizione: Ricerca un valore dato dall'utente all'interno dell'array
*/
    .file "cercaValore.s"

// Code section
    .text

/*
    cercaValoren:
       Ricerca un valore ricevuto come parametro della funzione all'interno dell'array 
       e ritorna la posizione.

    @param (int) valore
    @return (int) posizione
        La funzuione ritorna la posizione del valore ricercato o -1 se mancante.
*/

    .global cercaValore
    .type   cercaValore @function
    
cercaValore: 
    push    %ebp
    mov     %esp, %ebp
    // Contatore ciclo
    xor     %ecx, %ecx
    // Condizione for
    jmp     cercaValore_condizione
cercaValore_ciclo:
    lea     VETTORE, %eax
    cmp     (%eax, %ecx, 4), %edi
    je      cercaValore_trovato
    inc     %ecx
cercaValore_condizione:
    cmp     LUNGHEZZA_VETTORE, %ecx
    jl      cercaValore_ciclo
    // vaore non trovato
    mov     $-1, %eax
    jmp     cercaValore_return
cercaValore_trovato:
    // Ritorna il valore trovato
    mov     %ecx, %eax
cercaValore_return: 
    mov     %ebp, %esp
    pop     %ebp
    ret
