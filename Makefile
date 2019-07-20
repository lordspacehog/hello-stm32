TARGET = main
# Define the linker script location and chip architecture.
LD_SCRIPT = ./link/STM32F767ZI.ld
MCU_SPEC  = cortex-m7
STLIB_DIR = /Users/spacehog/STM32Cube/Repository/STM32Cube_FW_F7_V1.15.0/Drivers/**

# Toolchain definitions (ARM bare metal defaults)
TOOLCHAIN = /usr/local
CC = $(TOOLCHAIN)/bin/arm-none-eabi-gcc
AS = $(TOOLCHAIN)/bin/arm-none-eabi-as
LD = $(TOOLCHAIN)/bin/arm-none-eabi-ld
OC = $(TOOLCHAIN)/bin/arm-none-eabi-objcopy
OD = $(TOOLCHAIN)/bin/arm-none-eabi-objdump
OS = $(TOOLCHAIN)/bin/arm-none-eabi-size

CDEFS = -DUSE_HAL_DRIVER
CDEFS += -DSTM32F767xx

# Assembly directives.
ASFLAGS += -c
#ASFLAGS += -O0
ASFLAGS += -mcpu=$(MCU_SPEC)
ASFLAGS += -mthumb
ASFLAGS += -Wall

# (Set error messages to appear on a single line.)
#ASFLAGS += -fmessage-length=0

# C compilation directives
CFLAGS = $(CDEFS)
CFLAGS += -mcpu=$(MCU_SPEC)
CFLAGS += -mthumb
CFLAGS += -Wall
CFLAGS += -g

# (Set error messages to appear on a single line.)
CFLAGS += -fmessage-length=0

# (Set system to ignore semihosted junk)
CFLAGS += --specs=nosys.specs



# Linker directives.
LSCRIPT = ./$(LD_SCRIPT)
LFLAGS += -mcpu=$(MCU_SPEC)
LFLAGS += -mthumb
LFLAGS += -Wall
LFLAGS += --specs=nosys.specs
#LFLAGS += -nostdlib
LFLAGS += -lgcc
LFLAGS += -T$(LSCRIPT)

VECT_TBL = ./src/STM32F767ZI.s
AS_SRC   = ./src/core.s
C_SRC    = ./src/main.c
C_SRC    += ./src/init.c
C_SRC    += ./src/nvic.c

OBJS =  $(VECT_TBL:.s=.o)
OBJS += $(AS_SRC:.s=.o)
OBJS += $(C_SRC:.c=.o)

INCLUDE = -I./inc/
INCLUDE += -I./inc/drivers/STM32F7xx_HAL_Driver/Inc
INCLUDE += -I./inc/drivers/STM32F7xx_HAL_Driver/Inc/Legacy
INCLUDE += -I./inc/drivers/CMSIS/Device/ST/STM32F7xx/Include
INCLUDE += -I./inc/drivers/CMSIS/Include

.PHONY: all
all: $(TARGET).bin

%.o: %.S
	$(CC) -x assembler-with-cpp $(ASFLAGS) $< -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDE) $< -o $@

$(TARGET).elf: $(OBJS)
	$(CC) $^ $(LFLAGS) -o $@

$(TARGET).bin: $(TARGET).elf
	$(OC) -S -O binary $< $@
	$(OS) $<

.PHONY: clean
clean:
	rm -f $(OBJS)
	rm -f $(TARGET).elf
