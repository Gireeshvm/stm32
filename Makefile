CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OC = arm-none-eabi-objcopy
CFLAGS = 
AFLAGS = -mcpu=cortex-m7 
LFLAGS = -Ttext 0x8000000
OFlAGS = -S -O binary
TARGET = stm32f767zi
# TARGET = stm32f103c

all: main.bin


main.bin: main.elf
	$(OC) $(OFlAGS) main.elf main.bin

main.elf: main.o linker.ld
	$(LD) $(LFLAGS) -o main.elf main.o

main.o: main.s
	$(AS) $(AFLAGS)  -o main.o main.s

clean:
	rm -f *.o *.bin *.elf

flash: main.bin
	pyocd flash --target=$(TARGET) main.bin

debug: flash
	pyocd gdb -S
