.equ RCC,           0x40023800          @ reset and clock control register base address
.equ GPIOB,         0x40020400          @ port B base address
.equ GPIOC,         0x40020800          @ port C base address
.equ SYSCFG_EXTI4,  0x40013800          @ syscfg interrupt control reg 
.equ EXTI,          0x40013c00          @ exti base addr
.equ EXTI1_ENABLE,    0xe000e104          @ interrupt enable register
.equ EXTI_PENDING,  0x40013c14          @ interrupt pending reg
.equ GPIOB_ODR,     GPIOB + 0x14        
