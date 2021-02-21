add_library(kernel_x86_64 STATIC
    init.cpp #TODO move to boot
)

configure_file(run_qemu.sh.in run_qemu.sh)

install(FILES ${CMAKE_CURRENT_BINARY_DIR}/run_qemu.sh DESTINATION bin)