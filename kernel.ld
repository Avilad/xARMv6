ENTRY(_start)

svc_stack_size = 0x1000;

SECTIONS
{
	/* Setup the vector table here */
	. = 0x0;
	.vector : {
		build/trap_asm.o(.vector)
	}
	/* Setup page aligned svc stack */
	. = ALIGN(0x1000);
	. += svc_stack_size;
	linker_svc_stack_top = .;
	
	/* the entry point, before enabling paging. The code to enable paing
   	needs to have the same virtual/physical address. entry.S and start.c
	run in this initial setting.*/
	. = 0x10000;
	.text : {
		build/entry.o(.text)
		*(.text .text.*)
	}
	.rodata : {
		*(.rodata .rodata.* .gnu.linkonce.r*)
	}
	.data : {
		*(.data .data.* .gnu.linkonce.d*)
	}
	. = ALIGN(16); /*Align BSS to 16 bytes*/
	.bss (NOLOAD) : {
		linker_bss_start = .;
		*(.bss .bss.*)
		*(COMMON) /*All uninitialized file data*/
		linker_bss_end = .;
	}
}
