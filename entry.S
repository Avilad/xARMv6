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
	
	bl c_main                 //Jump into C, does not return, using bl is just a safety
loop_forever:
	wfe
	b loop_forever
