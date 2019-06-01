cmake_minimum_required(VERSION 2.8)  # CMake version check
project(assembly C)

set(ASSEMBLY_SRC src/GestioneVettore.s)

add_executable(main ${ASSEMBLY_SRC})

set_property(SOURCE ${ASSEMBLY_SRC} PROPERTY LANGUAGE C)
