/* The xv6 kernel starts executing in this file. This file is linked with
   the kernel C code, so it can refer to kernel symbols such as main().
   On ARM the GPU bootloader loads our image file including this file into memory.
   The reset vector jumps to _start, so this is the first instruction to run. */
#include "arm.h"
	
.section ".text"

.global _start
.global loop_forever

_start:
	//Stop all CPU cores if they aren't 1
	MRC p15, 0, r1, c0, c0, 5 //r1 <- multiprocessor affinity register
	ands r1, r1, #3           //r1 <- cpu id, set condition flags
	bne loop_forever          //if r1 != 0 then loop_forever

	//Setup stack
	ldr r1, =_start
	mov sp, r1

	//Clear bss section of our loaded elf
	ldr r1, =linker_bss_start //r1 <- bss_cur = bss_start
	ldr r2, =linker_bss_end
	ldr r3, =0
clear_bss_top:
	cmp r1, r2
	beq clear_bss_done
	str r3, [r1]              //bss_cur = 0
	add r1, r1, #8
	cmp r1, r2                //If bss_cur < bss_end loop
	b clear_bss_top
clear_bss_done:
	//Initialize traps
	//Set mode to SVC_MODE, Disable interrupts
    MSR CPSR_cxsf, #(SVC_MODE|NO_INT)
	//Now we have SVC_MODE sp
	ldr sp, =linker_svc_stack_top
	bl c_main                 //Jump into C, does not return, using bl is just a safety
	//@todo we need to set the mode back to USER_MODE at some point
loop_forever:
	wfe
	b loop_forever            
