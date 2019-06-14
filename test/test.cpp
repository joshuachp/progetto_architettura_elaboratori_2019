#include <gtest/gtest.h>

#include "main.h"

namespace {
class MainTest : public ::testing::Test {}
}  // namespace

int* VETTORE;
int LUNGHEZZA_VETTORE;

int* inizilize_vettore(int length) {
    LUNGHEZZA_VETTORE = 10;
    int* vettore = (int*)calloc(sizeof(int), length);
    for (int i = 0; i < length; i++) {
        vettore[i] = i + 1;
    }
    return vettore;
}

TEST_F(stampa_opzioni_success, stampa_opzioni) {
    ASSERT_NO_FATAL_FAILURE(stampaOpzioni());
}

int main(int arc, char** argv) {
    ::testing::InitGoogleTest(&arc, argv);
    return RUN_ALL_TESTS();
}