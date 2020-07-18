.thumb
/*
green led   :   PB0
blue led    :   PB7
red led     :   PB17
*/

@ variables definition
.equ rcc, 0x40023800    @ reset and clock control register base address
.equ gpioB, 0x40020400  @ port B base address
@ variables definition end


@ vector table 
.word   0x2007ffff      @ stack address
.word   _start
@ vector end


_delay:
    sub r0, r0, #0x1    @ assumed that r0 will have counter value
    bne _delay 
    mov pc, LR          @ bl will push return address to LR reg. while returning LR is moved to pc

_start:
    @ Enable clock for gpio port B
    ldr r1, =rcc
    ldr r2, =(1<<1)         
    str r2, [r1, #0x30]     @ peripheral clock register RCC_AHB1ENR is at offset 0x30
    
    @ Configure port pins as output
    ldr r1, =gpioB
    ldr r2, =(0x01 | 1<<14 | 1 << 28)   @ used() so that assembler will pre calculate reg value
    str r2, [r1]
    
_loop:
    ldr r2, =(1 | 1<<7 | 1<<14)     @ Turn on all 3 led's
    str r2, [r1, #0x14]
    ldr r0, =0x800000
    bl _delay 
    mov r2, #0x0                    @ Turn off all
    str r2, [r1, #0x14]
    ldr r0, =0x800000
    bl _delay
    b _loop
