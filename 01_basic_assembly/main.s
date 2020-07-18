.thumb                          @ stm32f7xx supports only thumbv1/v2

@ vector table
.word   0x2007ffff              @ stack address
.word   _start                   @ starting address
@ vector table end

_loop:
    add r1, r1, #1
    b _loop

_start:
    ldr r0, =0xdeadbeef
    mov r1, #00
    b _loop
