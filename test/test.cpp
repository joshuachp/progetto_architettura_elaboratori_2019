#include "gtest/gtest.h"

extern "C" {
#include "gestione_vettore.h"
}

void initialize_incremental_VETTORE() {
    for (int i = 0; i < LUNGHEZZA_VETTORE; i++) {
        VETTORE[i] = i;
    }
}

int initialize_equal_VETTORE() {
    srand(time(NULL));

    int num = rand() % 10;

    for (int i = 0; i < LUNGHEZZA_VETTORE; i++) {
        VETTORE[i] = num;
    }

    return num;
}

int initialize_equal_VETTORE(int num) {
    for (int i = 0; i < LUNGHEZZA_VETTORE; i++) {
        VETTORE[i] = num;
    }

    return num;
}

TEST(stampa_opzioni, stampa_opzioni_succes) {
    ASSERT_NO_FATAL_FAILURE(stampaOpzioni());
}

TEST(stampa_vettore, stampa_vettore_success) {
    initialize_incremental_VETTORE();
    ASSERT_NO_FATAL_FAILURE(stampaVettore(false));
}

TEST(stampa_vettore, stampa_vettore_inverted_success) {
    initialize_incremental_VETTORE();
    ASSERT_NO_FATAL_FAILURE(stampaVettore(true));
}

TEST(numero_pari, numero_pari_incremental) {
    initialize_incremental_VETTORE();
    ASSERT_EQ(numeroPari(), LUNGHEZZA_VETTORE / 2);
}

TEST(cerca_valore, cerca_valore_found) {
    initialize_incremental_VETTORE();
    srand(time(NULL));

    int num = rand() % 10;

    ASSERT_EQ(cercaValore(num), num);
}

TEST(cerca_valore, cerca_valore_not_found) {
    initialize_incremental_VETTORE();

    ASSERT_EQ(cercaValore(15), -1);
}

TEST(calcolo_max, calcolo_max_incremental) {
    initialize_incremental_VETTORE();
    ASSERT_EQ(calcolaMax(), LUNGHEZZA_VETTORE - 1);
}

TEST(posizione_max, posizione_max_incremental) {
    initialize_incremental_VETTORE();
    ASSERT_EQ(posizioneMax(), LUNGHEZZA_VETTORE - 1);
}

TEST(calcolo_min, calcolo_min_incremental) {
    initialize_incremental_VETTORE();
    ASSERT_EQ(calcolaMin(), 0);
}

TEST(posizione_min, posizione_min_incremental) {
    initialize_incremental_VETTORE();
    ASSERT_EQ(posizioneMin(), 0);
}

TEST(valore_frequente, valore_frequente_4) {
    int array[LUNGHEZZA_VETTORE];
    initialize_equal_VETTORE(1);

    for (int i = 0; i <= (int)(0.75 * LUNGHEZZA_VETTORE); i++) {
        VETTORE[i] = 4;
    }

    ASSERT_EQ(valoreFrequente(), 4);
}

TEST(calcola_media_intera, calcola_media_intera_equal) {
    int num = initialize_equal_VETTORE();
    ASSERT_EQ(calcolaMediaIntera(), num);
}

TEST(calcola_media_intera, calcola_media_intera_incremental) {
    initialize_incremental_VETTORE();
    int mean = LUNGHEZZA_VETTORE - 1;
    mean = mean * LUNGHEZZA_VETTORE / 2 / LUNGHEZZA_VETTORE;
    ASSERT_EQ(calcolaMediaIntera(), mean);
}
