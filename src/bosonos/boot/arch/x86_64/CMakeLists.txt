set(BOOT_ASM_FILES
    #start.S
    bios_screen.S
    protected_mode.S
    start32.S
)

add_library(boot_x86_64 STATIC
    ${BOOT_ASM_FILES}
)

add_library(start_boot_x86_64 STATIC
    start.S
)
