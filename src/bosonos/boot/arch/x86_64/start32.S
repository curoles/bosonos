.file "start32.S"

.code32
.text
.global _start_in_protected_mode

_start_in_protected_mode:
    movl $0xb800, %ebx      // The video address
    movb '!', %al           // The character to be print
    movb $0x0F, %ah         // The color: white(F) on black(0)
    movw %ax, (%ebx)        // Put the character into the video memory

    //call x86_init32
    jmp .
    hlt
