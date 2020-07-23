ENTRY(_start)
MEMORY{
    FLASH   (rx)    : ORIGIN = 0x08000000,  LENGTH = 2M
    RAM     (rw)    : ORIGIN = 0x20000000,  LENGTH = 512K
}
