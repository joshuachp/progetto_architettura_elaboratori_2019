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
    .section .rodata
    .align 4
    .type LUNGHEZZA_VETTORE, @object
    .size LUNGHEZZA_VETTORE, 4
LUNGHEZZA_VETTORE:
    .long 10

    .bss
/*
    VETTORE:
        Variabile globale dell'array utilizzato dal programma

    @type (int *)
*/
    .global VETTORE
    .align 8
    .type VETTORE, @object
    .size VETTORE, 40
VETTORE:
    .zero 40

