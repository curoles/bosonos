#include <cstdint>

#include "hw/board/tachy/qemu_virt/defines.h"

__attribute__ ((noinline))
void putc(uint8_t c)
{
    volatile uint8_t* uart = reinterpret_cast<uint8_t*>(UART_ADDR);

    *(uart) = c;
}

extern "C"
void tachy_init()
{
    char s[] = {'I', 'n', 'i', 't', ' ', 't', 'a', 'c', 'h', 'y', '.', '.', '.', '\r', '\n'};
    ///*static*/ const char s[21] = "Initializing tachy...\n";
    for (unsigned int i = 0; i < sizeof(s); ++i) {
        putc(s[i]);
    }

}
