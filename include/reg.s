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

@ from udemy project
.equ FLASH_BASEADDR          0x08000000U
.equ RAM_BASEADDR            0x20000000U
.equ SRAM1_OFFSET            0x00020000U
.equ SRAM2_OFFSET            0x0007C000U
.equ SRAM                    (RAM_BASEADDR + SRAM1_OFFSET)

@ BUS interface base addresses

.equ AHB1_BASEADDR           0x40020000U
.equ AHB2_BASEADDR           0x50000000U
.equ AHB3_BASEADDR           0xA0000000U
.equ APB2_BASEADDR           0x40010000U
.equ APB1_BASEADDR           0x40000000U
.equ CORTEX_M_PERIPH_BASEADDR            0xE000E100U

@ AHB1 peripherals

.equ GPIOA_BASEADDR          (AHB1_BASEADDR + 0x0000)                @ General purpose registers
.equ GPIOB_BASEADDR          (AHB1_BASEADDR + 0x0400)
.equ GPIOC_BASEADDR          (AHB1_BASEADDR + 0x0800)
.equ GPIOD_BASEADDR          (AHB1_BASEADDR + 0x0C00)
.equ GPIOE_BASEADDR          (AHB1_BASEADDR + 0x1000)
.equ GPIOF_BASEADDR          (AHB1_BASEADDR + 0x1400)
.equ GPIOG_BASEADDR          (AHB1_BASEADDR + 0x1800)
.equ GPIOH_BASEADDR          (AHB1_BASEADDR + 0x1C00)
.equ GPIOI_BASEADDR          (AHB1_BASEADDR + 0x2000)
.equ GPIOJ_BASEADDR          (AHB1_BASEADDR + 0x2400)
.equ GPIOK_BASEADDR          (AHB1_BASEADDR + 0x2800)
.equ CRC_BASEADDR            (AHB1_BASEADDR + 0x3000)                @ cyclic redundancy check registers
.equ RCC_BASEADDR            (AHB1_BASEADDR + 0x3800)                @ Reset and clock control registers
.equ FLASH_ITFC_BASEADDR     (AHB1_BASEADDR + 0x3C00)                @ flash interface register
.equ BKPSRAM_BASEADDR        (AHB1_BASEADDR + 0x4000)                @ TODO: get the meaning of BKPSRAM
.equ DMA1_BASEADDR           (AHB1_BASEADDR + 0x6000)                @ direct memory access controller register
.equ DMA2_BASEADDR           (AHB1_BASEADDR + 0x6400)
.equ ETH_MAC_BASEADDR        (AHB1_BASEADDR + 0x8000)                @ ethernet mac address configuration register
.equ DMA2D_BASEADDR          (AHB1_BASEADDR + 0xB000)                @ chrom-ART Accelerator controller register
.equ OTG_HS_BASEADDR         (AHB1_BASEADDR + 0x40000)               @ USB on-the-go high-speed(HS) registers

@ AHB2 peripherals
.equ OTG_FS_BASEADDR         (AHB2_BASEADDR + 0x0000)                @ USB on-the-go full-speed registers
.equ DCMI_BASEADDR           (AHB2_BASEADDR + 0x50000)               @ Digital camera interface
.equ JPEG_BASEADDR           (AHB2_BASEADDR + 0x51000)               @ jpeg codec registers
.equ CPYP_BASEADDR           (AHB2_BASEADDR + 0x60000)               @ Cryptographic processor
.equ HASH_BASEADDR           (AHB2_BASEADDR + 0x60400)               @ Hash processor
.equ RNG_BASEADDR            (AHB2_BASEADDR + 0x60800)               @  True random number generator

@ APB1 peripherals

.equ TIM2_BASEADDR           (APB1_BASEADDR + 0x0000)                @ timers
.equ TIM3_BASEADDR           (APB1_BASEADDR + 0x0400)
.equ TIM4_BASEADDR           (APB1_BASEADDR + 0x0800)
.equ TIM5_BASEADDR           (APB1_BASEADDR + 0x0C00)
.equ TIM6_BASEADDR           (APB1_BASEADDR + 0x1000)
.equ TIM7_BASEADDR           (APB1_BASEADDR + 0x1400)
.equ TIM12_BASEADDR          (APB1_BASEADDR + 0x1800)
.equ TIM13_BASEADDR          (APB1_BASEADDR + 0x1C00)
.equ TIM14_BASEADDR          (APB1_BASEADDR + 0x2000)
.equ LPTIM1_BASEADDR         (APB1_BASEADDR + 0x2400)

.equ RTC_BASEADDR            (APB1_BASEADDR + 0x2800)            @ real time clock registers
.equ WWDG_BASEADDR           (APB1_BASEADDR + 0x2C00)            @ system window watchdog timers
.equ IWDG_BASEADDR           (APB1_BASEADDR + 0x3000)            @ independent watchdog timer
.equ CAN3_BASEADDR           (APB1_BASEADDR + 0x3400)            @ control area network register
.equ SPI2_BASEADDR           (APB1_BASEADDR + 0x3800)            @ serial pheriperal interface, It also includes I2S inter ic sound registers
.equ SPI3_BASEADDR           (APB1_BASEADDR + 0x3C00)
.equ SPDIFRX_BASEADDR        (APB1_BASEADDR + 0x4000)            @ SPDIF reciever interface
.equ USART2_BASEADDR         (APB1_BASEADDR + 0x4400)            @ universal synchronous asynchronous reciever transmitter registers
.equ USART3_BASEADDR         (APB1_BASEADDR + 0x4800)
.equ UART4_BASEADDR          (APB1_BASEADDR + 0x4C00)
.equ UART5_BASEADDR          (APB1_BASEADDR + 0x5000)
.equ I2C1_BASEADDR           (APB1_BASEADDR + 0x5400)            @ inter integrated-circuit registers
.equ I2C2_BASEADDR           (APB1_BASEADDR + 0x5800)
.equ I2C3_BASEADDR           (APB1_BASEADDR + 0x5C00)
.equ I2C4_BASEADDR           (APB1_BASEADDR + 0x6000)
.equ CAN1_BASEADDR           (APB1_BASEADDR + 0x6400)
.equ CAN2_BASEADDR           (APB1_BASEADDR + 0x6800)
.equ HDMI_CEC_BASEADDR       (APB1_BASEADDR + 0x6C00)            @ HDMI-CEC controller registers
.equ PWR_BASEADDR            (APB1_BASEADDR + 0x7000)            @ power controller register
.equ DAC_BASEADDR            (APB1_BASEADDR + 0x7400)            @ digital to analog converter register
.equ UART7_BASEADDR          (APB1_BASEADDR + 0x7800)
.equ UART8_BASEADDR          (APB1_BASEADDR + 0x7C00)


@ APB2 peripherals

.equ TIM1_BASEADDR           (APB2_BASEADDR + 0x0000)
.equ TIM8_BASEADDR           (APB2_BASEADDR + 0x0400)
.equ USART1_BASEADDR         (APB2_BASEADDR + 0x1000)
.equ USART6_BASEADDR         (APB2_BASEADDR + 0x1400)
.equ SDMMC2_BASEADDR         (APB2_BASEADDR + 0x1C00)            @ SD/SDIO/MMC card host interface registers
.equ ADC_BASEADDR            (APB2_BASEADDR + 0x2000)            @ Analog to digital converter registers, contains for all 3 ADC
.equ SDMMC1_BASEADDR         (APB2_BASEADDR + 0x2C00)            @ SD/SDIO/MMC card host interface registers
.equ SPI1_BASEADDR           (APB2_BASEADDR + 0x3000)
.equ SPI4_BASEADDR           (APB2_BASEADDR + 0x3400)
.equ SYSCFG_BASEADDR         (APB2_BASEADDR + 0x3800)            @ system configuration registers
.equ EXTI_BASEADDR           (APB2_BASEADDR + 0x3C00)            @ externel interrupt configuration registers
.equ TIM9_BASEADDR           (APB2_BASEADDR + 0x4000)
.equ TIM10_BASEADDR          (APB2_BASEADDR + 0x4400)
.equ TIM11_BASEADDR          (APB2_BASEADDR + 0x4800)
.equ SPI5_BASEADDR           (APB2_BASEADDR + 0x5000)
.equ SPI6_BASEADDR           (APB2_BASEADDR + 0x5400)
.equ SAI1_BASEADDR           (APB2_BASEADDR + 0x5800)            @ serial audio interface registers
.equ SAI2_BASEADDR           (APB2_BASEADDR + 0x5C00)
.equ LTDC_BASEADDR           (APB2_BASEADDR + 0x6800)            @ LCD-TFT display control register
.equ DSI_HOST_BASEADDR       (APB2_BASEADDR + 0x6C00)            @ display serial interface host register
.equ DFSDM1_BASEADDR         (APB2_BASEADDR + 0x7400)            @ digital filter for sigma delta modulator registers
.equ MDIOS_BASEADDR          (APB2_BASEADDR + 0x7800)            @ management data input/output registers

.equ SYST_CALIB,    0xe000e01c
