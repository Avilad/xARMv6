.section ".text"
.global undefined_instruction_handler_asm
.global software_interrupt_handler_asm
.global prefetch_abort_handler_asm
.global data_abort_handler_asm
.global unused_exception_handler_asm
.global irq_handler_asm

 //Vector table starts at memory address 0
 //But we must manually load it there
vector_table_start:	
	b _start                             //reset_handler, branches to our OS entrypoint
	ldr pc, undefined_instruction_handler_asm
	ldr pc, software_interrupt_handler_asm
	ldr pc, prefetch_abort_handler_asm
	ldr pc, data_abort_handler_asm
	ldr pc, unused_exception_handler_asm //Reserved for future use by ARM
	ldr pc, irq_handler_asm
	//This handler begins directly in the vector table
	//instead of branching to it like the others
	//To make it faster (hence why its at the end in ARM)
fiq_handler_asm:
	/*Save general purpose registers and our LR*/
	stmfd   sp!, {r0-r12, lr}
    mrs     r2, spsr
    stmfd   sp!, {r2}
	
	/*Cant use writeback because hardware doesn't like it when using ^ suffix*/
    stmfd   sp, {sp, lr}^
    sub     sp, sp, #8
	bl      fiq_handler
	b       trap_return

//The rest of these are instructions branched to from the vector table
//All of them setup for C handlers then call into them
//Then return to the user code that was interrupted
undefined_instruction_handler_asm:
	/*Save general purpose registers and our LR*/
	stmfd   sp!, {r0-r12, lr}
    mrs     r2, spsr
    stmfd   sp!, {r2}
	
	/*Cant use writeback because hardware doesn't like it when using ^ suffix*/
    stmfd   sp, {sp, lr}^
    sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument
	bl      undefined_instruction_handler
	b       trap_return
	
software_interrupt_handler_asm:
	/*Save general purpose registers and our LR*/
	stmfd   sp!, {r0-r12, lr}
    mrs     r2, spsr
    stmfd   sp!, {r2}
	
	/*Cant use writeback because hardware doesn't like it when using ^ suffix*/
    stmfd   sp, {sp, lr}^
    sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument
	bl      software_interrupt_handler
	b       trap_return

prefetch_abort_handler_asm:
	/*Save general purpose registers and our LR*/
	stmfd   sp!, {r0-r12, lr}
    mrs     r2, spsr
    stmfd   sp!, {r2}
	
	/*Cant use writeback because hardware doesn't like it when using ^ suffix*/
    stmfd   sp, {sp, lr}^
    sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument
	bl      prefetch_abort_handler
	b       trap_return

data_abort_handler_asm:
	/*Save general purpose registers and our LR*/
	stmfd   sp!, {r0-r12, lr}
    mrs     r2, spsr
    stmfd   sp!, {r2}
	
	/*Cant use writeback because hardware doesn't like it when using ^ suffix*/
    stmfd   sp, {sp, lr}^
    sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument
	bl      data_abort_handler
	b       trap_return
	
unused_exception_handler_asm:
	/*Save general purpose registers and our LR*/
	stmfd   sp!, {r0-r12, lr}
    mrs     r2, spsr
    stmfd   sp!, {r2}
	
	/*Cant use writeback because hardware doesn't like it when using ^ suffix*/
    stmfd   sp, {sp, lr}^
    sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument
	bl      unused_exception_handler_asm
	b       trap_return
	
irq_handler_asm:
	/*Save general purpose registers and our LR*/
	stmfd   sp!, {r0-r12, lr}
    mrs     r2, spsr
    stmfd   sp!, {r2}

	//@todo might need to switch to svc_mode for this
	
	/*Cant use writeback because hardware doesn't like it when using ^ suffix*/
    stmfd   sp, {sp, lr}^
    sub     sp, sp, #8
	mov     r0, sp //Pass address of trap frame as a function argument
	bl      irq_handler
	//b trap_return
trap_return:
	//Undo all of the saving we did before
    ldmfd   sp, {sp, lr}^
    add     sp, sp, #8
    ldmfd   sp!, {r2}
    msr     spsr_cxsf, r2
	//Trap return instruction
	//The ^ suffix indicates that the context should be switched back into user mode
    ldmfd   r13!, {r0-r12, pc}^
