/*ENTRY(_start)
SECTIONS
{
 . = 0x10000;
 .startup . : { arch/x86_64/start.o(.text) }
 .text : { *(.text) }
 .data : { *(.data) }
 .bss : { *(.bss COMMON) }
 . = ALIGN(8);
 . = . + 0x1000;*/ /* 4kB of stack memory */
 /*stack_top = .;
}*/

ENTRY(_start)
SECTIONS
{
  . = 0x7c00;
  .text : {
    ../boot/arch/x86_64/CMakeFiles/start_boot_x86_64.dir/start.S.o(.text)
    *(.text)
    *(.data)
    *(.rodata)
    __bss_start = .;
    /* COMMON vs BSS: https://stackoverflow.com/questions/16835716/bss-vs-common-what-goes-where */
    *(.bss)
    *(COMMON)
    __bss_end = .;
  }
  /* https://stackoverflow.com/questions/53584666/why-does-gnu-ld-include-a-section-that-does-not-appear-in-the-linker-script */
  .sig : AT(ADDR(.text) + 512 - 2)
  {
      SHORT(0xaa55);
  }
  /DISCARD/ : {
    *(.eh_frame)
  }
  __stack_bottom = .;
  . = . + 0x1000;
  __stack_top = .;
}
