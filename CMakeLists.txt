cmake_minimum_required(VERSION 3.0)  # CMake version check
project(assembly VERSION 0.1 LANGUAGES C CXX)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)


set( ASSEMBLY_MAIN src/GestioneVettore.s)

set( ASSEMBLY_LIB
    src/data/data.s
    src/functions/calcolaMax.s 
    src/functions/calcolaMediaIntera.s
    src/functions/calcolaMin.s
    src/functions/cercaValore.s
    src/functions/eseguiOpzione.s
    src/functions/numeroPari.s
    src/functions/posizioneMax.s
    src/functions/posizioneMin.s
    src/functions/stampaOpzioni.s
    src/functions/stampaVettore.s
    src/functions/valoreFrequente.s
)

set_property(SOURCE ${ASSEMBLY_MAIN} PROPERTY LANGUAGE C)
set_property(SOURCE ${ASSEMBLY_LIB} PROPERTY LANGUAGE C)

add_library(gestione_vettore_lib ${ASSEMBLY_LIB})

add_executable(main  ${ASSEMBLY_MAIN})
target_link_libraries(main gestione_vettore_lib)

enable_testing()

# Download and unpack googletest at configure time
configure_file(gtest.conf googletest-download/CMakeLists.txt)
execute_process(COMMAND ${CMAKE_COMMAND} -G "${CMAKE_GENERATOR}" .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "CMake step for googletest failed: ${result}")
endif()
execute_process(COMMAND ${CMAKE_COMMAND} --build .
  RESULT_VARIABLE result
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/googletest-download )
if(result)
  message(FATAL_ERROR "Build step for googletest failed: ${result}")
endif()

# Prevent overriding the parent project's compiler/linker
# settings on Windows
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)

# Add googletest directly to our build. This defines
# the gtest and gtest_main targets.
add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/googletest-src
                 ${CMAKE_CURRENT_BINARY_DIR}/googletest-build
                 EXCLUDE_FROM_ALL)

# The gtest/gtest_main targets carry header search path
# dependencies automatically when using CMake 2.8.11 or
# later. Otherwise we have to add them here ourselves.
if (CMAKE_VERSION VERSION_LESS 2.8.11)
  include_directories("${gtest_SOURCE_DIR}/include")
endif()

# Now simply link against gtest or gtest_main as needed. Eg
add_executable(run_tests test/test.cpp)
target_link_libraries(run_tests gtest gtest_main)
target_link_libraries(run_tests gestione_vettore_lib)
add_test(run_all_tests run_tests)

# 32 bit binary

set( ASSEMBLY_MAIN_32 src_32/GestioneVettore.s)

set( ASSEMBLY_LIB_32
    src_32/data/data.s
    src_32/functions/calcolaMax.s 
    src_32/functions/calcolaMediaIntera.s
    src_32/functions/calcolaMin.s
    src_32/functions/cercaValore.s
    src_32/functions/eseguiOpzione.s
    src_32/functions/numeroPari.s
    src_32/functions/posizioneMax.s
    src_32/functions/posizioneMin.s
    src_32/functions/stampaOpzioni.s
    src_32/functions/stampaVettore.s
    src_32/functions/valoreFrequente.s
)

set_property(SOURCE ${ASSEMBLY_MAIN_32} PROPERTY LANGUAGE C)
set_property(SOURCE ${ASSEMBLY_LIB_32} PROPERTY LANGUAGE C)

add_library(gestione_vettore_lib_32 ${ASSEMBLY_LIB_32})
set_target_properties(gestione_vettore_lib_32 PROPERTIES COMPILE_FLAGS "-m32  -no-pie" LINK_FLAGS "-m32  -no-pie")


add_executable(main_32 ${ASSEMBLY_MAIN_32})
set_target_properties(main_32 PROPERTIES COMPILE_FLAGS "-m32  -no-pie" LINK_FLAGS "-m32  -no-pie")
target_link_libraries(main gestione_vettore_lib_32)

add_executable(run_tests_32 test/test.cpp)
set_target_properties(run_tests_32 PROPERTIES COMPILE_FLAGS "-m32 -no-pie" LINK_FLAGS "-m32  -no-pie")
target_link_libraries(run_tests_32 gtest gtest_main)
target_link_libraries(run_tests_32 gestione_vettore_lib_32)
add_test(run_all_tests_32 run_tests_32)