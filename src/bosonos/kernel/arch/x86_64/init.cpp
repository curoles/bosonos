

#if 0
// TODO build with -m16; https://github.com/cirosantilli/x86-bare-metal-examples/blob/b4e4c124a3c3c329dcf09a5697237ed3b216a318/c_hello_world/run
extern "C"
void x86_init16()
{
    char s[] = {'I', 'n', 'i', 't', '1', '6', ' ', 'x', '8', '6', '.', '.', '.', '\r', '\n'};
    ///*static*/ const char s[21] = "Initializing x86...\n";
    for (unsigned int i = 0; i < sizeof(s); ++i) {
        __asm__ (
            "int $0x10" : : "a" ((0x0e << 8) | s[i])
        );
    }

}
#endif

/*
 * https://stackoverflow.com/questions/40381594/printing-characters-to-screen-asm-in-protected-mode
 * In 32-bit protected mode, we are not able to use BIOS because it's written in 16-bit real mode's code.
 * https://wiki.osdev.org/Babystep4
 */
extern "C"
void x86_init32()
{
    unsigned short int* video_mem = (unsigned short int*)0xb800;
    char s[] = {'I', 'n', 'i', 't', '3', '2', ' ', 'x', '8', '6', '.', '.', '.', '\r', '\n'};
    ///*static*/ const char s[21] = "Initializing x86...\n";
    for (unsigned int i = 0; i < sizeof(s); ++i) {
        /*__asm__ (
            "mov ebx,0xb8000"    // The video address
            "mov al" : : "a" ((0x0e << 8) | s[i])         // The character to be print
            "mov ah,0x0F"        // The color: white(F) on black(0)
            "mov [ebx],ax"       // Put the character into the video memory
        );*/
        *video_mem = (0x0F << 8) | s[i];
    }

}
