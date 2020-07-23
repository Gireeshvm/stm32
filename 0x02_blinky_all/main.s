.thumb
.align 4
.global _start
/*
green led   :   PB0
blue led    :   PB7
red led     :   PB14
*/

@ variables definition
.equ rcc, 0x40023800    @ reset and clock control register base address
.equ gpioB, 0x40020400  @ port B base address
@ variables definition end


@ vector table 
.word   0x2007ffff      @ stack address
.word   _start+1 
.word   _start
.word   _start
@ vector end


_delay:
    sub r0, r0, #0x1    @ assumed that r0 will have counter value
    bne _delay 
    b _loop

_start:
    @ Enable clock for gpio port B
    ldr r1, =rcc
    ldr r2, =(1<<1)         
    str r2, [r1, #0x30]     @ peripheral clock register RCC_AHB1ENR is at offset 0x30
    
    @ Configure port pins as output
    ldr r1, =gpioB
    ldr r2, =( 1 | 1<<14 | 1<<28 )   @ used() so that assembler will pre calculate reg value
    str r2, [r1]
    mov r2, #0x1        
    mov r3, #0x1
    lsl r3, r3, #0x14
    
_loop:
    lsl r2, r2, #0x7                @ each time it shifts register is changed to another led value
    cmp r2, r3                      @ if r2 has value greater than 1 << 0x14 then set it to 1
    ble _skip
    mov r2, #0x1
_skip:
    str r2, [r1, #0x14]
    ldr r0, =0x400000
    b _delay 
