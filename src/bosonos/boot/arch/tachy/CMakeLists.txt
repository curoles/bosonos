#set(BOOT_ASM_FILES
#    #start.S
#    xxx.S
#)

set(BOOT_CPP_FILES
    init.cpp
)

add_library(boot_tachy STATIC
    #${BOOT_ASM_FILES}
    ${BOOT_CPP_FILES}
)

add_library(start_boot_tachy STATIC
    start.S
)