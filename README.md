programming ARM microcontroller using assembly or without any dependancy libraries

** Requirements **
_ As toolchain I used **arm-none-eabi**.
_ For uploading and debugging **pyocd**. \* **make**

**Compiling and Debug**
`make all` # this will compile everything
`pyocd flash --target=stm32f767zi main.bin` # To flash image to board. To know which board available run `pyocd list --target`
`pyocd gdb` # This will start a gdb server on localhost:3333
`arm-none-eabi-gdb`
`target remote :3333` # Debug program
