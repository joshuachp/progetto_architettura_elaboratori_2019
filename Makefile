CC=/usr/bin/gcc
MAIN=src/GestioneVettore.s
DEPS=src/data/data.s src/functions/calcolaMax.s src/functions/calcolaMediaIntera.s src/functions/calcolaMin.s src/functions/cercaValore.s src/functions/eseguiOpzione.s src/functions/numeroPari.s src/functions/posizioneMax.s src/functions/posizioneMin.s src/functions/stampaOpzioni.s src/functions/stampaVettore.s src/functions/valoreFrequente.s
OUT=build/main
MAIN_32=src_32/GestioneVettore.s
DEPS_32=src_32/data/data.s src_32/functions/calcolaMax.s src_32/functions/calcolaMediaIntera.s src_32/functions/calcolaMin.s src_32/functions/cercaValore.s src_32/functions/eseguiOpzione.s src_32/functions/numeroPari.s src_32/functions/posizioneMax.s src_32/functions/posizioneMin.s src_32/functions/stampaOpzioni.s src_32/functions/stampaVettore.s src_32/functions/valoreFrequente.s
OUT=build/MAIN_32
CFLAGS=-g -Wall

build: mkdir $(MAIN) $(DEPS)
	$(CC) $(CFLAGS) -o $(OUT) $(MAIN) $(DEPS)

build_32:  mkdir $(MAIN_32) $(DEPS_32)
	$(CC) $(CFLAGS) -m32 -o $(OUT_32) $(MAIN_32) $(DEPS_32)

mkdir:
	mkdir -p build