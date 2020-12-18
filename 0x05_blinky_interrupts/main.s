.thumb
.align 4
.global _start

.include "../include/reg.s"

@ vector table 
.word   0x2007ffff      @ stack address
.word   _start+1 
.fill   0x34
.word   _systick_handler+1
.fill   0xa0
.word   _int_handler_13 + 1
@ vector end

.equ toggle_led, 0x20000004


_systick_handler:
    push    {lr}
    ldr r1, =GPIOB_ODR
    ldr r2, [r1]
    mov r3, r5                  @ r5 will have which led to toggle it will in same reg through out program so dont use it
    EOR r2, r3                  @ by xor with led value it toggles
    ldr r1, =GPIOB_ODR
    str r2, [r1]
    pop     {pc}


_int_handler_13:
    push {r3, lr}
    ldr r1, =(1<<13)
    ldr r2, =EXTI_PENDING           @ clear pending 
    str r1, [r2]

    ldr r1, =GPIOB_ODR
    ldr r2, =(1 | 1<<7 | 1<< 14)    @ turn all led's
    str r2, [r1]

    mov r2, r5
    lsl r2,r2, #7
    ldr r3, =(1<<14)
    cmp r2, r3 
    ble _int_led_less               @ modify which led to blink by left shifting 1 by 7 each time if it is shifted more than 14 then reset to 1
    mov r2, #1
_int_led_less:
    mov r5, r2
    pop {r3, pc}


_start:
    ldr r1, =RCC_AHB1ENR
    ldr r2, =(1<<1 | 1 << 2)    @ enable clock for both port c and port b
    str r2, [r1]                @ peripheral clock register RCC_AHB1ENR is at offset 0x30

    ldr r1, =RCC_APB2ENR
    ldr r2, =(1<<14)            @ clock enable for syscfg
    str r2, [r1]

    @ set up interrupt
    ldr r2, =(1<<13)        @ unmask exti13
    ldr r1, =EXTI
    str r2, [r1]

    ldr r2, =(1<<5)         @ set ext13 to port c
    ldr r1, =SYSCFG_EXTI4
    str r2, [r1]

    ldr r1, =EXTI
    ldr r2, =(1<<13)        @ rising trigger set
    str r2, [r1, #0x8]

    ldr r2, =(1<<8)          @ interrupt enable
    ldr r1, =EXTI1_ENABLE
    str r2, [r1]

    
    @ Configure port pins as input or output 
    ldr r4, =GPIOB
    ldr r2, =(1 | 1<<14 | 1<<28 )   @ turning all led's as output
    str r2, [r4]

    ldr r4, =GPIOC
    ldr r2, =(1<<27)        @ gpio_c is already in input we are just pulling down
    str r2, [r4, #0x0c]

    ldr r1, =SYST_RVR
    ldr r2, =(0x500000)
    str r2, [r1]
    str r2, [r1, #4]        @ sets systick csr and rvr reg
    ldr r1, =SYST_CSR
    mov r2, #7              @ this enables systick, enables systick exception and uses cpu clock
    str r2, [r1]

    b _main


_main:
    mov r5, #1
    ldr r1, =GPIOB_ODR
    ldr r2, =(1| 1<<7 | 1<<14)
    str r2, [r1]
_loop:
    nop
    b _loop
    
