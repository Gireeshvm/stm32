.thumb
.align 4
.global _start

@ variables definition
.equ rcc, 0x40023800    @ reset and clock control register base address
.equ gpioB, 0x40020400  @ port B base address
.equ gpioC, 0x40020800  @ port C base address
@ variables definition end


@ vector table 
.word   0x2007ffff      @ stack address
.word   _start+1 
@ vector end



_start:
    @ Cloc enable
    ldr r1, =rcc
    ldr r2, =(1<<1 | 1 << 2)    @ enable clock for both port c and port b
    str r2, [r1, #0x30]     @ peripheral clock register RCC_AHB1ENR is at offset 0x30
    
    @ Configure port pins as input or output 
    ldr r4, =gpioB
    ldr r2, =(1<<14 | 1<<28 )   @ use only blue and red led
    str r2, [r4]

    @ In port c all pins are input by default
    ldr r1, =gpioC
    ldr r2, =( 1<<27 )       @ need to set GPIOC_PUPDR 13 as 10 to make it as pull down 
    str r2, [r1, #0xc]      @ GPIOC_PUPDR
    ldr r3, =(1<<13)        @ position of u_button in port c
    ldr r4, =(gpioB)
_read:
    ldr r0, [r1, #0x10]     @ GPIOC_IDR input data register
    and r0, r0, r3
    beq _reset
    ldr r2, =(1<<7)         @ use blue led
    str r2, [r4, #0x14]
    b _read 
_reset:
    ldr r2, =(1<<14)        @ use red led 
    str r2, [r4, #0x14]
    b _read
