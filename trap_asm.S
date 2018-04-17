#include "arm.h"

.globl undefined_instruction_handler_asm
.globl software_interrupt_handler_asm
.globl prefetch_abort_handler_asm
.globl data_abort_handler_asm
.globl reserved_exception_handler_asm
.globl irq_handler_asm
.globl fiq_handler_asm

.globl undefined_instruction_handler
.globl software_interrupt_handler
.globl prefetch_abort_handler
.globl data_abort_handler
.globl reserved_exception_handler
.globl irq_handler
.globl fiq_handler

undefined_instruction_handler_asm:
	sub     lr, lr, #4
	srsfd   sp!, #PSR_SUPERVISOR_MODE
	cps			#PSR_SUPERVISOR_MODE
	stmfd   sp!, {r0-r12, lr}
	stmfd   sp, {sp, lr}^
	sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument

	bl 			undefined_instruction_handler

	b				trap_return

software_interrupt_handler_asm:
	srsfd   sp!, #PSR_SUPERVISOR_MODE
	stmfd   sp!, {r0-r12, lr}
	stmfd   sp, {sp, lr}^
	sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument

	bl 			software_interrupt_handler

	b				trap_return

prefetch_abort_handler_asm:
	sub     lr, lr, #4
	srsfd   sp!, #PSR_SUPERVISOR_MODE
	cps			#PSR_SUPERVISOR_MODE
	stmfd   sp!, {r0-r12, lr}
	stmfd   sp, {sp, lr}^
	sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument

	bl 			prefetch_abort_handler

	b				trap_return

data_abort_handler_asm:
	sub     lr, lr, #8
	srsfd   sp!, #PSR_SUPERVISOR_MODE
	cps			#PSR_SUPERVISOR_MODE
	stmfd   sp!, {r0-r12, lr}
	stmfd   sp, {sp, lr}^
	sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument

	bl 			data_abort_handler

	b				trap_return

reserved_exception_handler_asm:
	cps			#PSR_SUPERVISOR_MODE
	bl 			reserved_exception_handler
	b       trap_return

irq_handler_asm:
	sub     lr, lr, #4
	srsfd   sp!, #PSR_SUPERVISOR_MODE
	cps			#PSR_SUPERVISOR_MODE
	stmfd   sp!, {r0-r12, lr}
	stmfd   sp, {sp, lr}^
	sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument

	bl 			irq_handler

	b				trap_return

fiq_handler_asm:
	cps			#PSR_SUPERVISOR_MODE
	bl 			fiq_handler

trap_return:
	ldmfd   sp, {sp, lr}^      // restore user mode sp and lr
	add     sp, sp, #8
	ldmfd   sp!, {r0-r12, lr}
	rfe			sp!
