# Makefile for building Legend OS

AS = nasm
CC = g++
LD = ld

CFLAGS = -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -ffreestanding -nostdlib -lgcc

# Directories
SRC_DIR = src
BUILD_DIR = build

# Kernel source and object files
KERNEL_SRC = $(SRC_DIR)/kernel/kernel.cpp
KERNEL_OBJ = $(BUILD_DIR)/kernel.o

# Bootloader source and object files
BOOTLOADER_SRC = $(SRC_DIR)/bootloader/bootloader.asm
BOOTLOADER_OBJ = $(BUILD_DIR)/bootloader.o

# Output ISO file
OUTPUT_ISO = $(BUILD_DIR)/legend-os.iso

all: $(OUTPUT_ISO)

# Compile the kernel
$(BUILD_DIR)/kernel.o: $(KERNEL_SRC)
    $(CC) $(CFLAGS) -c $(KERNEL_SRC) -o $(BUILD_DIR)/kernel.o

# Compile the bootloader
$(BUILD_DIR)/bootloader.o: $(BOOTLOADER_SRC)
    $(AS) -f elf64 $(BOOTLOADER_SRC) -o $(BUILD_DIR)/bootloader.o

# Link the bootloader and kernel into a bootable ISO
$(OUTPUT_ISO): $(BOOTLOADER_OBJ) $(KERNEL_OBJ)
    $(LD) -o $(BUILD_DIR)/legend-os.bin -T linker.ld $(BOOTLOADER_OBJ) $(KERNEL_OBJ)
    mkisofs -o $(OUTPUT_ISO) -b bootloader.bin -no-emul-boot -boot-load-size 4 -boot-info-table $(BUILD_DIR)

clean:
    rm -rf $(BUILD_DIR)/*
