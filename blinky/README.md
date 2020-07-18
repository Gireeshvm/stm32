##### Steps

- enable clock for port which consist of builtin led's (register RCC_AHB1ENR)
- configure port B pins 0, 7, 14 as general purpose output pins (register GPIOB_MODER)
- pin type (GPIOB_OTYPER) and clock speed (GPIOB_OSPEEDR) need to be set but we used default value for both these
- write state of these pins (GPIOB_ODR)
