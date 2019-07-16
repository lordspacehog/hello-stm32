/* STM32F767ZI basic config */
_estack = 0x20080000;

_min_heap_size = 0x200;
_min_stack_size = 0x400;

MEMORY {
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 2048K
    SRAM  (rwx) : ORIGIN = 0x20000000, LENGTH = 512K
}

SECTIONS {
    .isr_vector : {
        . = ALIGN(4);
        KEEP(*(.isr_vector))
        . = ALIGN(4);
    } >FLASH

    .text : {
        . = ALIGN(4);
        *(.text)
        *(.text*)
        . = ALIGN(4);
    } >FLASH

    .rodata : {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata*)
        . = ALIGN(4);
    } >FLASH

    . = ALIGN(4);
    _sidata = .;
    .data : AT(_sidata) {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } >SRAM

    .bss : {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } >SRAM

    .dynamic_allocations : {
        . = ALIGN(8);
        _ssystem_ram = .;
        . = . + _min_heap_size;
        . = . + _min_stack_size;
        . = ALIGN(8);
        _esystem_ram = .;
    } >SRAM

}
