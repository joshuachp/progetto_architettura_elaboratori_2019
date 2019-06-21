#include "gtest/gtest.h"

extern "C" {
#include "gestione_vettore.h"
}

TEST(stampa_opzioni_success, stampa_opzioni) {
    ASSERT_NO_FATAL_FAILURE(stampaOpzioni());
}

/* TEST(stampa_vettore_success, stampa_vettore) {
    ASSERT_NO_FATAL_FAILURE(stampaVettore(false));
} */

TEST(numero_pari_incrementale, numero_pari) {
    for (int i = 0; i < LUNGHEZZA_VETTORE; i++) {
        VETTORE[i] = i;
    }
    ASSERT_EQ(numeroPari(), LUNGHEZZA_VETTORE / 2);
}
