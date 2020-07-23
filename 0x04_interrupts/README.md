we are going to control turning on and off of led using externel interrupt button

##### Steps

- map user button B1 (port c pin 13) to EXTI13 using SFSCFG_EXTICR4 register

* enable clock for port b(led) port c (user button) and syscfg
* unmask exti 13k
* interrupt trigger mode to rising
* enable interrupt. refer datasheet for interrupt number and register

#### handling interrupt

- push r3 and lr reg to stack in beginning
- clear interrupt
- interrupt stuff
- pop r3 and pc
