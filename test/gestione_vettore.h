#if !defined(GESTIONE_VETTORE)
#define GESTIONE_VETTORE

extern const int LUNGHEZZA_VETTORE;
extern int VETTORE[];

void stampaOpzioni(void);
void eseguiOpzione(int opzione);
void stampaVettore(bool ordineInv);
int numeroPari(void);
int cercaValore(int val);
int calcolaMax(void);
int posizioneMax(void);
int calcolaMin(void);
int posizioneMin(void);
int valoreFrequente(void);
int calcolaMediaIntera(void);

#endif  // GESTIONE_VETTORE
