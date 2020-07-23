In this system timer is used for handling blinking and external interrupts are used to changing
blinking led

#### steps

- same as prev incase of configuring user button as exti trigger
- configure systick reg to generate exception each time it reach 0
- configure timer for systick
- each time systick timer occur toggle specific led
- each time exti13 occur change led
