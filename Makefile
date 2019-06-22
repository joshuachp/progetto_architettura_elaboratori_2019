CC=/usr/bin/gcc
MAIN=src/GestioneVettore.s
DEPS=src/data/data.s src/functions/calcolaMax.s src/functions/calcolaMediaIntera.s src/functions/calcolaMin.s src/functions/cercaValore.s src/functions/eseguiOpzione.s src/functions/numeroPari.s src/functions/posizioneMax.s src/functions/posizioneMin.s src/functions/stampaOpzioni.s src/functions/stampaVettore.s src/functions/valoreFrequente.s
OUT=build/main
CFLAGS=-g

build: mkdir $(MAIN) $(DEPS)
	$(CC) $(CFLAGS) -o $(OUT) $(MAIN) $(DEPS)

mkdir:
	mkdir -p build