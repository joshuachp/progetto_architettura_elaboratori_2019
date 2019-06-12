/*
    File: data.s
    Descrizione: Global data section utilizzata dal programma.
*/

    .file "data.s"

.data

/*
    LUNGHEZZA_VETTORE:
        Variabile globale della lunghezza dell'array utilizzato 
        dal programma

    @type (int)
*/
    .global LUNGHEZZA_VETTORE
LUNGHEZZA_VETTORE:
    .int 10

    .bss

/*
    VETTORE:
        Variabile globale dell'array utilizzato dal programma

    @type (int *)
*/
    .global VETTORE
VETTORE:
    .rept 10
    .int 0
    .endr

