/* The xv6 kernel starts executing in this file. This file is linked with
 the kernel C code, so it can refer to kernel symbols such as main().
 The boot block (bootasm.S and bootmain.c) jumps to entry below.*/

.section ".text.boot"

.global _start

_start:
	// Stop all cores that aren't our main core
	mrs x1, mpidr_el1 //x1 <- cpu id
	and x1, x1, #3    //x1 <- x1 & cpu number bit
	cbz x1, continue
loop_forever:
	wfe
	b loop_forever
continue:
	//On main core
	//Setup stack
	ldr x1, =_start
	mov sp, x1

	//Clear bss section of our loaded elf
	ldr x1, =__bss_start
	ldr w2, =__bss_size
clear_bss_top:
	cbz w2, clear_bss_done
	str xzr, [x1], #8 //Zero eight bytes
	sub w2, w2, #1
	cbnz w2, clear_bss_top
clear_bss_done:

	bl c_main        //Jump into C, does not return
	b loop_forever //Just in case main returns
