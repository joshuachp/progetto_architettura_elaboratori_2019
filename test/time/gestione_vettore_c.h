#if !defined(GESTIONE_VETTORE_C)
#define GESTIONE_VETTORE_C

#include <stdbool.h>

#define C_LUNGHEZZA_VETTORE 10
int C_VETTORE[C_LUNGHEZZA_VETTORE];

void c_stampaOpzioni(void);
void c_eseguiOpzione(int opzione);
void c_stampaVettore(bool ordineInv);
int c_numeroPari(void);
int c_cercaValore(int val);
int c_calcolaMax(void);
int c_posizioneMax(void);
int c_calcolaMin(void);
int c_posizioneMin(void);
int c_valoreFrequente(void);
int c_calcolaMediaIntera(void);

#endif  // GESTIONE_VETTORE_C
