cmake_minimum_required(VERSION 2.8)  # CMake version check
project(assembly C CXX)

set(
    ASSEMBLY_SRC 
    src/GestioneVettore.s
    src/data/data.s
    src/functions/calcolaMax.s 
    src/functions/calcolaMediaIntera.s
    src/functions/cercaValore.s
    src/functions/eseguiOpzione.s
    src/functions/numeroPari.s
    src/functions/stampaOpzioni.s
    src/functions/valoreFrequente.s
)

add_executable(main ${ASSEMBLY_SRC})

set_property(SOURCE ${ASSEMBLY_SRC} PROPERTY LANGUAGE C)

add_executable(test_main test/test.cpp ${ASSEMBLY_SRC})

add_test(test_main test_main)