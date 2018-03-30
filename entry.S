/* The xv6 kernel starts executing in this file. This file is linked with
 the kernel C code, so it can refer to kernel symbols such as main().
 The boot block (bootasm.S and bootmain.c) jumps to entry below.*/

.section ".text.boot"

.global _start

_start:
// 	// Stop all cores that aren't our main core
// 	mrs r1, mpidr_el1 //x1 <- cpu id
// 	and x1, x1, #3    //x1 <- x1 & cpu number bit
// 	cbz x1, continue
// loop_forever:
// 	wfe
// 	b loop_forever
// continue:
// 	//On main core
	//Setup stack
	ldr r1, =_start
	mov sp, r1

	//Clear bss section of our loaded elf
	ldr r1, =__bss_start
	ldr r2, =__bss_size
clear_bss_top:
	ldr r3, =0
	str r3, [r1], #8 //Zero eight bytes
	sub r2, r2, #1
	cmp r2, r2
	beq clear_bss_top
clear_bss_done:

	bl c_main        //Jump into C, does not return
	b loop_forever //Just in case main returns
