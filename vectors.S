.data
.globl vectors
// Vector table starts at memory address 0
// But we must manually load it there
vectors:
  ldr pc, _reset_handler // Reset handler, branches to OS entrypoint
	ldr pc, _undefined_instruction_handler // To trigger this use .word 0xf7f0a000
	ldr pc, _software_interrupt_handler
	ldr pc, _prefetch_abort_handler
	ldr pc, _data_abort_handler
  ldr pc, _reserved_exception_handler // Reserved for future use by ARM
	ldr pc, _irq_handler
	ldr pc, _fiq_handler

_reset_handler:                 .word _start
_undefined_instruction_handler: .word undefined_instruction_handler_asm
_software_interrupt_handler:    .word software_interrupt_handler_asm
_prefetch_abort_handler:        .word prefetch_abort_handler_asm
_data_abort_handler:            .word data_abort_handler_asm
_reserved_exception_handler:    .word reserved_exception_handler_asm
_irq_handler:                   .word irq_handler_asm
_fiq_handler:                   .word fiq_handler_asm

.globl vectors_end
vectors_end:
