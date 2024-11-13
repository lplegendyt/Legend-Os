; bootloader.asm
; This file contains the bootloader code for Legend OS.
; It switches the system from real mode to long mode (64-bit).

[BITS 16]
[ORG 0x7C00]

start:
    cli                     ; Disable interrupts
    xor ax, ax              ; Clear AX register
    mov ds, ax              ; Set data segment to 0
    mov es, ax              ; Set extra segment to 0
    mov ss, ax              ; Set stack segment to 0
    mov sp, 0x7C00          ; Set stack pointer

    ; Enable long mode (64-bit mode)
    mov eax, cr0            ; Load CR0 register
    or eax, 1               ; Set bit 0 to enable protected mode
    mov cr0, eax            ; Store modified CR0

    ; Load the Global Descriptor Table (GDT)
    lgdt [gdt_descriptor]    ; Load GDT

    ; Enable long mode by setting bits in CR4 and MSR
    mov eax, cr4            ; Load CR4 register
    or eax, 0x200           ; Set LME bit to enable long mode
    mov cr4, eax            ; Store modified CR4

    ; Switch to 64-bit mode (Long Mode)
    mov eax, 0xC0000080      ; MSR to enable long mode
    mov edx, 0x00000001      ; Set LME bit to enable 64-bit mode
    wrmsr                    ; Write to MSR to enable long mode

    ; Jump to 64-bit mode
    jmp 0x08:long_mode       ; Jump to long mode code

[BITS 64]
long_mode:
    ; Now in 64-bit mode
    mov ax, 0x10            ; Load code segment selector
    mov ds, ax              ; Set data segment
    mov es, ax              ; Set extra segment

    ; Infinite loop to prevent the system from shutting down
    jmp $
