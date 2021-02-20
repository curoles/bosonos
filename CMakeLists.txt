cmake_minimum_required (VERSION 3.10)

# @brief     Top level CMake script to build BosonOS.
# @authors   Igor Lesik 2020-2021
# @copyright Igor Lesik 2021

project(BOSONOS CXX C ASM)
# CMakeLists files in this project can refer to the root source directory
# of the project as ${BOSONOS_SOURCE_DIR} and to the root binary directory
# of the project as ${BOSONOS_BINARY_DIR}.

option(BOSONOS_ARCH "Target architecture" x86_64)
#option(USE_XXX "Use XXX to XXX" ON)#OFF

set(CMAKE_C_FLAGS "-ffreestanding -static -Werror -Wall -Wextra -O3")
set(CMAKE_CXX_FLAGS "-ffreestanding -static -Werror -Wall -Wextra -std=c++17 -O3")
set(CMAKE_EXE_LINKER_FLAGS "-nodefaultlibs -nostartfiles")
#set(CMAKE_LINKER ld)

set(CMAKE_VERBOSE_MAKEFILE OFF)

include_directories(${BOSONOS_SOURCE_DIR}/src)

# Install inside the build directory.
set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install)

add_subdirectory(src)
#add_subdirectory(docs)
#add_subdirectory(test)

# Log CMake variables.
MESSAGE( STATUS "CMAKE_C_COMPILER    : " ${CMAKE_C_COMPILER} )
MESSAGE( STATUS "CMAKE_CXX_COMPILER  : " ${CMAKE_CXX_COMPILER} )
#MESSAGE( STATUS "CMAKE_CXX_FLAGS     : " ${CMAKE_CXX_FLAGS} )
MESSAGE( STATUS "CMAKE_INSTALL_PREFIX: " ${CMAKE_INSTALL_PREFIX} )
MESSAGE( STATUS "ARCH                : " ${BOSONOS_ARCH} )
