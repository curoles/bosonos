add_library(kernel_tachy STATIC
    kernel.cpp
)

configure_file(run_qemu.sh.in run_qemu.sh)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/run_qemu.sh DESTINATION bin)