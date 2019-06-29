#include <stdbool.h>
#include <stdio.h>
#include <time.h>

#include "gestione_vettore.h"
#include "gestione_vettore_c.h"

int main(void) {
    int i;
    for (i = 0; i < LUNGHEZZA_VETTORE; i++) {
        VETTORE[i] = i;
    }
    for (i = 0; i < C_LUNGHEZZA_VETTORE; i++) {
        C_VETTORE[i] = i;
    }

    clock_t c_begin = clock();
    c_stampaOpzioni();
    c_stampaVettore(true);
    c_stampaVettore(false);
    c_numeroPari();
    c_cercaValore(5);
    c_calcolaMax();
    c_posizioneMax();
    c_calcolaMin();
    c_posizioneMin();
    c_valoreFrequente();
    c_calcolaMediaIntera();
    clock_t c_end = clock();
    double c_time_spent = (double)(c_end - c_begin);

    clock_t begin = clock();
    stampaOpzioni();
    stampaVettore(true);
    stampaVettore(false);
    numeroPari();
    cercaValore(5);
    calcolaMax();
    posizioneMax();
    calcolaMin();
    posizioneMin();
    valoreFrequente();
    calcolaMediaIntera();
    clock_t end = clock();
    double time_spent = (double)(end - begin);

    printf("\n\n\nASSEMBLY\n Clock cycles = %lf\nTime = %lf\n\n", time_spent,
           time_spent / CLOCKS_PER_SEC);
    printf("C CODE\n Clock cycles = %lf\nTime = %lf\n\n", c_time_spent,
           c_time_spent / CLOCKS_PER_SEC);
    return 0;
}