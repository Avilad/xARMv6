.section ".text"
.align 4

//Vector table starts at memory address 0
//But we must manually load it there
vector_table_start:
	//reset_handler, branches to our OS entrypoint
	b reset_handler_asm
	//To trigger this use .word 0xf7f0a000
	b undefined_instruction_handler_asm
	b software_interrupt_handler_asm
	b prefetch_abort_handler_asm
	b data_abort_handler_asm
    //Reserved for future use by ARM
	b unused_exception_handler_asm
	b irq_handler_asm
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

	ldr     r11, =fiq_handler_c
	mov     pc, r11
	b       trap_return

reset_handler_asm:
	ldr r11, reset_handler_c
	mov pc, r11

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
	ldr     r11, =undefined_instruction_handler_c
	mov     pc, r11
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
	ldr     r11, software_interrupt_handler_c
	mov     pc, r11
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
	ldr     r11, prefetch_abort_handler_c
	mov     pc, r11
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
	ldr     r11, data_abort_handler_c
	mov     pc, r11
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
	ldr     r11, unused_exception_handler_c
	mov     pc, r11
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
	ldr     r11, irq_handler_c
	mov     pc, r11
	//b trap_return
trap_return:
	//Undo all of the saving we did before
    ldmfd   sp, {sp, lr}^
    add     sp, sp, #8
    ldmfd   sp!, {r2}
    msr     spsr_cxsf, r2
	//Trap return instruction
	//The ^ suffix indicates that the context should be switched back into user mode
    ldmfd   sp!, {r0-r12, pc}^

//We have these addresses because branch instructions use relative addresses
//but since we must copy this code to 0x0 we must use absolute addresses
reset_handler_c:                  .word _start
undefined_instruction_handler_c : .word undefined_instruction_handler
software_interrupt_handler_c:     .word software_interrupt_handler
prefetch_abort_handler_c:         .word prefetch_abort_handler
data_abort_handler_c:             .word data_abort_handler
unused_exception_handler_c:       .word unused_exception_handler
irq_handler_c:                    .word irq_handler
fiq_handler_c:                    .word fiq_handler
