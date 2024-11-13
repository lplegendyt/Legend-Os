; idt.asm
; This file sets up the Interrupt Descriptor Table (IDT) for Legend OS in 64-bit mode.

[BITS 64]

idt_start:
    ; Define interrupt handlers (example for interrupt 0)
    dq isr0, 0x08, 0, 0      ; ISR 0 entry (Interrupt 0 handler)

idt_end:

idt_descriptor:
    dw idt_end - idt_start - 1   ; IDT size in bytes
    dd idt_start                  ; Address of the IDT

; Function to load IDT
load_idt:
    lidt [idt_descriptor]         ; Load the IDT
