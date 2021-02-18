include(../boot/arch/${BOSONOS_ARCH}/boot.cmake)

add_executable(bosonos
    ${BOOT_ASM_FILES}
)

set_target_properties(bosonos PROPERTIES LINKER_LANGUAGE CXX)

MESSAGE( STATUS "BOOT_ASM_FILES      : " ${BOOT_ASM_FILES} )