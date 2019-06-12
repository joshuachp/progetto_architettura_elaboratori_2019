cmake_minimum_required(VERSION 2.8)  # CMake version check
project(assembly C)

set(
    ASSEMBLY_SRC 
    src/GestioneVettore.s
    src/data/data.s
    src/functions/calcolaMediaIntera.s
    src/functions/cercaValore.s
    src/functions/eseguiOpzione.s
    src/functions/numeroPari.s
    src/functions/stampaOpzioni.s
    src/functions/valoreFrequente.s
)

add_executable(main ${ASSEMBLY_SRC})

set_property(SOURCE ${ASSEMBLY_SRC} PROPERTY LANGUAGE C)
