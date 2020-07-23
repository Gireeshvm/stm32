.thumb
.align 4
.global _start

.include "reg.s"

@ vector table 
.word   0x2007ffff      @ stack address
.word   _start+1 
.fill 0xd8
.word   _int_handler_13 +1
@ vector end


_int_handler_13:
    push {r3,lr}
    ldr r1, =(1<<13)
    ldr r2, =EXTI_PENDING
    str r1, [r2]
    ldr r4, =GPIOB_ODR
    ldr r2, [r4]
    ldr r1, =(1<<7)
    eor r2, r1
    str r2, [r4]
    pop {r3, pc}


_start:

        @ Clock enable
    ldr r1, =RCC
    ldr r2, =(1<<1 | 1 << 2)    @ enable clock for both port c and port b
    str r2, [r1, #0x30]     @ peripheral clock register RCC_AHB1ENR is at offset 0x30

    ldr r2, =(1<<14)        @ clock enable for syscfg
    str r2, [r1, #0x44]

    @ set up interrupt
    ldr r2, =(1<<13)        @ unmask exti13
    ldr r1, =EXTI
    str r2, [r1, #0x0]

    ldr r2, =(1<<5)         @ set ext13 to port c
    ldr r1, =SYSCFG_EXTI4
    str r2, [r1, #0x14]

    ldr r1, =EXTI
    ldr r2, =(1<<13)        @ rising trigger set
    str r2, [r1, #0x8]

    ldr r2, =(1<<8)          @ interrupt enable
    ldr r1, =EXTI1_ENABLE
    str r2, [r1]

    
    @ Configure port pins as input or output 
    ldr r4, =GPIOB
    ldr r2, =(1<<14 | 1<<28 )   @ use only blue and red led
    str r2, [r4]

    ldr r4, =GPIOC
    ldr r2, =(1<<27)   
    str r2, [r4, #0x0c]


    mov r0, #0
    mov r1, #1
    mov r2, #2
    mov r3, #3
    mov r4, #4
    mov r5, #5
    mov r6, #6
    mov r7, #7
_loop:
    nop
    b _loop
