.equ RCC,           0x40023800          @ reset and clock control register base address
.equ RCC_AHB1ENR,    RCC +0x30
.equ RCC_APB2ENR,    RCC+0x44
.equ GPIOB,         0x40020400          @ port B base address
.equ GPIOC,         0x40020800          @ port C base address
.equ SYSCFG_EXTI4,  0x40013814          @ syscfg interrupt control reg
.equ EXTI,          0x40013c00          @ exti base addr
.equ EXTI1_ENABLE,    0xe000e104          @ interrupt enable register
.equ EXTI_PENDING,  0x40013c14          @ interrupt pending reg
.equ GPIOB_ODR,     GPIOB + 0x14        
.equ SYST_CSR,      0xe000e010
.equ SYST_RVR,      0xe000e014
.equ SYST_CVR,      0xe000e018
.equ SYST_CALIB,    0xe000e01c
