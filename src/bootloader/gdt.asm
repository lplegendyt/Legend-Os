; gdt.asm
; This file sets up the Global Descriptor Table (GDT) for Legend OS in 64-bit mode.

[BITS 32]

gdt_start:
    ; Null descriptor (required by the GDT setup)
    dq 0x0, 0x0, 0x0, 0x0

    ; 64-bit code segment (privileged, 64-bit)
    dq 0x0, 0x9A00000000000000, 0xFFFFFFFFFFFFFFFF, 0x0

    ; 64-bit data segment (privileged, 64-bit)
    dq 0x0, 0x9200000000000000, 0xFFFFFFFFFFFFFFFF, 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1   ; Size of the GDT in bytes
    dd gdt_start                  ; Address of the GDT

; Function to load GDT
load_gdt:
    lgdt [gdt_descriptor]         ; Load the GDT
