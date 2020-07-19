programming ARM microcontroller using assembly or without any dependancy libraries. <br/>
Here I used stm32f767zi nucleo board as reference you can use same board or by changing some register values you can make it to work on different board

#### Requirements

- As toolchain I used **arm-none-eabi**.
- For uploading and debugging **pyocd** and **make**

#### Compiling and Debug

```
make all                                    # this will compile everything
pyocd flash --target=stm32f767zi main.bin   # To flash image to board. To know which board available run pyocd list --target
pyocd gdb                                   # This will start a gdb server on localhost:3333
arm-none-eabi-gdb
target remote :3333                         # Debug program
```
