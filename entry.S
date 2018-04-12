/* The xv6 kernel starts executing in this file. This file is linked with
   the kernel C code, so it can refer to kernel symbols such as main().
   On ARM the GPU bootloader loads our image file including this file into memory.
   The reset vector jumps to _start, so this is the first instruction to run. */
#include "arm.h"
	
.section ".text"

.global _start
.global kernel_end
.global loop_forever
_start:
	//Stop all CPU cores if they aren't 1
	mrc p15, 0, r0, c0, c0, 5 //r0 <- multiprocessor affinity register
	ands r0, r0, #3           //r0 <- cpu id, set condition flags
	bne loop_forever          //if r0 != 0 then loop_forever
	
	//Setup stacks for all modes
	msr cpsr_cxsf, #(PSR_FIQ_MODE|PSR_DISABLE_INTERRUPTS)
	ldr r0, =linker_psr_mode_stacks_start
	ldr r1, =4096
	mov sp, r0
	
	msr cpsr_cxsf, #(PSR_IRQ_MODE|PSR_DISABLE_INTERRUPTS)
	add r0, r0, r1
	mov sp, r0
	
	msr cpsr_cxsf, #(PSR_ABORT_MODE|PSR_DISABLE_INTERRUPTS)
	add r0, r0, r1
	mov sp, r0
	
	msr cpsr_cxsf, #(PSR_UNDEFINED_INSTRUCTION_MODE|PSR_DISABLE_INTERRUPTS)
	add r0, r0, r1
	mov sp, r0
	
	msr cpsr_cxsf, #(PSR_SUPERVISOR_MODE|PSR_DISABLE_INTERRUPTS)
	ldr r0, =_start
	mov sp, r0
	
	bl kmain //Jump into C, does not return, using bl is just a safety
loop_forever:
	wfe
	b loop_forever
