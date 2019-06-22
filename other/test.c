#include <stdio.h>

const int length = 10;

int vector[10];

int mult(int a, int b) { return a * b; }

int main(void) {
    vector[3] = 3;
    vector[4] = mult(2, 2);
    printf("%i %i", 5, 6);
    return 0;
}