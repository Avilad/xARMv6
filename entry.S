	/* The xv6 kernel starts executing in this file. This file is linked with
 the kernel C code, so it can refer to kernel symbols such as main().
 The boot block (bootasm.S and bootmain.c) jumps to entry below.*/

.section ".text"

.global _start

_start:
	//Setup stack
	ldr x1, =_start
	mov sp, x1

	//Clear bss section of our loaded elf
	ldr x1, =linker_bss_start //r1 <- bss_cur = bss_start
	ldr x2, =linker_bss_end
	ldr x3, =0
clear_bss_top:
	cmp x1, x2
	beq clear_bss_done
	str x3, [x1]              //bss_cur = 0
	add x1, x1, #8
	cmp x1, x2                //If bss_cur < bss_end loop
	b clear_bss_top
clear_bss_done:
	bl c_main                 //Jump into C, does not return
loop_forever:	
	b loop_forever            //Just in case main returns
