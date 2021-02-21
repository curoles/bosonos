/*
 * qemu-system-tachy -machine virt -nographic -serial mon:stdio -kernel prg.elf
 */

.text
.align  4
.global _start


_start:
    la  sp, :xpcrel36:stack_top
    nop;nop;
    jsr uart_print_banner
    li  r1, `0x80001000 //`stack_top
    ann sp, r1, 15
    jsr tachy_init
    nop;nop;nop;
    jsr _start_OS
    nop;nop;nop;
	jmp .

#include "hw/board/tachy/qemu_virt/defines.h"

#define ASCII_b 0x62
#define ASCII_a 0x61
#define ASCII_c 0x63
#define ASCII_O 0x4f
#define ASCII_o 0x6f
#define ASCII_n 0x6e
#define ASCII_z 0x7a
#define ASCII_S 0x53
#define ASCII_LF 0xa

.align 4
uart_print_banner:
	li r1, `UART_ADDR
	li  r2, ASCII_b
	stl [r1], r2
	li  r2, ASCII_o
	stl [r1], r2
	li  r2, ASCII_z
	stl [r1], r2
	li  r2, ASCII_o
	stl [r1], r2
	li  r2, ASCII_n
	stl [r1], r2
	li  r2, ASCII_O
	stl [r1], r2
	li  r2, ASCII_S
	stl [r1], r2
    li  r2, ASCII_LF
	stl [r1], r2
    ret

