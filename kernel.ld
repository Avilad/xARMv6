ENTRY(_start)

/*Stacks for each privelege mode that needs one
  We don't have one for user mode because it has its own stack
  allocated by the kernel*/
privilege_mode_count = 6;
privilege_mode_stacks_size = 0x1000 * privilege_mode_count;

SECTIONS
{
	/* the entry point, before enabling paging. The code to enable paing
   	needs to have the same virtual/physical address. entry.S and start.c
	run in this initial setting.*/
	. = 0x10000;
	.text : {
		build/entry.o(.text)
		linker_vector_table_start = .;
		build/trap_asm.o(.text)
		linker_vector_table_end = .;
		*(.text .text.*)
	}
	.rodata : {
		*(.rodata .rodata.* .gnu.linkonce.r*)
	}
	.data : {
		*(.data .data.* .gnu.linkonce.d*)
		/* Setup page aligned svc stack */
		. = ALIGN(0x1000);
		linker_privilege_mode_stacks_start = .;
		. += privilege_mode_stacks_size;
		linker_privilege_mode_stacks_end = .;
	}
	. = ALIGN(16); /*Align BSS to 16 bytes*/
	.bss (NOLOAD) : {
		linker_bss_start = .;
		*(.bss .bss.*)
		*(COMMON) /*All uninitialized file data*/
		linker_bss_end = .;
	}
}
