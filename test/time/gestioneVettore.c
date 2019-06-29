#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "gestione_vettore_c.h"

void c_stampaOpzioni(void) {
    // funzione che stampa le varie opzioni del programma sotto forma di un
    // menu' testuale

    printf("\nOPERAZIONI DISPONIBILI\n");
    printf("----------------------\n");
    printf("1) stampa a video del vettore inserito\n");
    printf("2) stampa a video del vettore inserito in ordine inverso\n");
    printf("3) stampa il numero di valori pari e dispari inseriti\n");
    printf("4) stampa la posizione di un valore inserito dall'utente\n");
    printf("5) stampa il massimo valore inserito\n");
    printf("6) stampa la posizione del massimo valore inserito\n");
    printf("7) stampa il minimo valore inserito\n");
    printf("8) stampa la posizione del minimo valore inserito\n");
    printf("9) stampa il valore inserito con maggior frequenza\n");
    printf("10) stampa la media intera dei valori inseriti\n");
}

void c_eseguiOpzione(int opzione) {
    // funzione che esegue le varie opzioni del programma a seconda del valore
    // contenuto in opzione

    bool stampaInOrdineInverso = true;
    int nPari, nDispari, valore, posizione, max, posMax, min, posMin, valFreq,
        valMedia, posValMedia;
    int media;

    printf("\n");  // per separare con una riga l'esecuzione di ogni comando
    switch (opzione) {
        case 0:
            printf("Uscita dall'applicazione...\n");
            break;  // causa l'uscita dallo switch...
        case 1:
            stampaInOrdineInverso = false;
        case 2:
            c_stampaVettore(stampaInOrdineInverso);
            break;
        case 3:
            nPari = c_numeroPari();
            nDispari = C_LUNGHEZZA_VETTORE -
                       nPari;  // NB: non serve implementare una funzione per
                               // avere il numero dei dispari!
            printf("Numero di valori pari inseriti: %i\n", nPari);
            printf("Numero di valori dispari inseriti: %i\n", nDispari);
            break;
        case 4:
            printf("Inserire l'intero da cercare: ");
            scanf("%i", &valore);
            posizione = c_cercaValore(valore);
            if (posizione >= 0)
                printf("Posizione del valore %i: %i\n", valore,
                       (posizione + 1));
            else
                printf("Valore %i non trovato\n", valore);
            break;
        case 5:
            max = c_calcolaMax();
            printf("Massimo valore inserito: %i\n", max);
            break;
        case 6:
            posMax = c_posizioneMax() + 1;
            printf("Posizione del massimo valore inserito: %i\n", posMax);
            break;
        case 7:
            min = c_calcolaMin();
            printf("Minimo valore inserito: %i\n", min);
            break;
        case 8:
            posMin = c_posizioneMin() + 1;
            printf("Posizione del minimo valore inserito: %i\n", posMin);
            break;
        case 9:
            valFreq = c_valoreFrequente();
            printf("Valore inserito con maggior frequenza: %i\n", valFreq);
            break;
        case 10:
            media = c_calcolaMediaIntera();
            printf("Media valori: %i\n", media);
            break;
        default:
            // situazione di errore che si verifica quando l'utente inserisce un
            // numero di opzione non supportato...
            printf("Opzione non supportata dall'applicazione!\n");
        case -1:
            c_stampaOpzioni();
            break;
    }
}

void c_stampaVettore(bool ordineInv) {
    /* Questa funzione stampa gli elementi del vettore.
       Quando ordineInv == true, gli elementi sono stampati in ordine inverso.*/
    int i;

    if (!ordineInv) {
        printf("Valori inseriti:\n");
        for (i = 0; i < C_LUNGHEZZA_VETTORE; i++)
            printf("Valore %i: %i\n", (i + 1), C_VETTORE[i]);
    } else {
        printf("Valori inseriti (ordine di inserimento invertito):\n");
        for (i = C_LUNGHEZZA_VETTORE - 1; i >= 0; i--)
            printf("Valore %i: %i\n", (i + 1), C_VETTORE[i]);
    }
}

int c_numeroPari(void) {
    // Questa funzione restituisce il numero di elementi pari del vettore.

    int i, nPari = 0;
    for (i = 0; i < C_LUNGHEZZA_VETTORE; i++) {
        if (C_VETTORE[i] % 2 == 0) nPari++;
    }

    return nPari;
}

int c_cercaValore(int val) {
    /* Questa funzione restituisce la posizione dell'intero val nel vettore.
       Se l'intero non viene trovato, la posizione restituita è pari a -1.*/

    int i, pos = -1;

    for (i = 0; i < C_LUNGHEZZA_VETTORE; i++) {
        if (C_VETTORE[i] == val) {
            pos = i;
            break;
        }
    }

    return pos;
}

int c_calcolaMax(void) {
    // Questa funzione restituisce il valore massimo contenuto nel vettore.

    int i, max = C_VETTORE[0];

    for (i = 1; i < C_LUNGHEZZA_VETTORE; i++) {
        if (max < C_VETTORE[i]) max = C_VETTORE[i];
    }

    return max;
}

int c_posizioneMax(void) {
    // Questa funzione restituisce la posizione del valore massimo contenuto nel
    // vettore.

    return c_cercaValore(c_calcolaMax());
}

int c_calcolaMin(void) {
    // Questa funzione restituisce il valore minimo contenuto nel vettore.

    int i, min = C_VETTORE[0];

    for (i = 1; i < C_LUNGHEZZA_VETTORE; i++) {
        if (min > C_VETTORE[i]) min = C_VETTORE[i];
    }

    return min;
}

int c_posizioneMin(void) {
    // Questa funzione restituisce la posizione del valore minimo contenuto nel
    // vettore.

    return c_cercaValore(c_calcolaMin());
}

int c_valoreFrequente(void) {
    /* Questa funzione restituisce il valore inserito con maggior frequenza nel
       vettore.
       In caso di piu' valori che compaiono con la stessa frequenza, il
       programma ne ritorna uno soltanto.*/

    int i1, i2;
    int maxFreq = -1, freq = 0;
    int valFreq = 0;

    for (i1 = 0; i1 < C_LUNGHEZZA_VETTORE; i1++) {
        for (i2 = 0; i2 < C_LUNGHEZZA_VETTORE; i2++) {
            if (C_VETTORE[i1] == C_VETTORE[i2]) freq++;
        }
        if (freq > maxFreq) {
            maxFreq = freq;
            valFreq = C_VETTORE[i1];
        }
        freq = 0;
    }

    return valFreq;
}

int c_calcolaMediaIntera(void) {
    // Questa funzione restituisce la media intera degli elementi del vettore.

    int somma = 0;
    int media;
    int i;

    for (i = 0; i < C_LUNGHEZZA_VETTORE; i++) somma += C_VETTORE[i];

    media = somma / C_LUNGHEZZA_VETTORE;

    return media;
}
