#include "gtest/gtest.h"

extern "C" {
#include "gestione_vettore.h"
}

void inizializa_VETTORE() {
    for (int i = 0; i < LUNGHEZZA_VETTORE; i++) {
        VETTORE[i] = i;
    }
}

TEST(stampa_opzioni_success, stampa_opzioni) {
    ASSERT_NO_FATAL_FAILURE(stampaOpzioni());
}

TEST(stampa_vettore_success, stampa_vettore) {
    inizializa_VETTORE();
    ASSERT_NO_FATAL_FAILURE(stampaVettore(false));
}

TEST(stampa_vettore_inverso_success, stampa_vettore) {
    inizializa_VETTORE();
    ASSERT_NO_FATAL_FAILURE(stampaVettore(true));
}

TEST(numero_pari_incrementale, numero_pari) {
    inizializa_VETTORE();
    ASSERT_EQ(numeroPari(), LUNGHEZZA_VETTORE / 2);
}
