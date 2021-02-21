add_subdirectory(arch)

set(bosonos_arch bosonos_${BOSONOS_ARCH})

add_executable(${bosonos_arch}
    kernel.cpp
)

target_link_libraries(${bosonos_arch}
    boot_${BOSONOS_ARCH}
    kernel_${BOSONOS_ARCH}
)

set_target_properties(${bosonos_arch} PROPERTIES LINKER_LANGUAGE CXX)

set(LINKER_SCRIPT_KERNEL ${CMAKE_CURRENT_LIST_DIR}/arch/${BOSONOS_ARCH}/link_kernel.ld)

set_target_properties(${bosonos_arch} PROPERTIES LINK_DEPENDS ${LINKER_SCRIPT_KERNEL})
add_dependencies(${bosonos_arch} start_boot_${BOSONOS_ARCH})
set_target_properties(${bosonos_arch} PROPERTIES LINK_FLAGS "-T ${LINKER_SCRIPT_KERNEL} -Wl,--whole-archive,--build-id=none,-nostdlib")

if (TOOLCHAIN_PREFIX)
    set(OBJCOPY ${TOOLCHAIN_PREFIX}objcopy)
else()
    set(OBJCOPY objcopy)
endif()

add_custom_command(TARGET ${bosonos_arch} POST_BUILD
    COMMAND ${OBJCOPY} -O binary ${bosonos_arch} ${bosonos_arch}.img
    DEPENDS ${bosonos_arch}
    COMMENT "Build Kernel binary image"
)

install(TARGETS ${bosonos_arch} DESTINATION bin)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${bosonos_arch}.img DESTINATION bin)
