#include "mem_mapped_io.h"
#include "arm.h"
#include "arm_asm_intrinsics.h"
#include "mem_utils.h"

//@todo move this
#define array_len(a) (sizeof(a) / sizeof((a)[0]))

//---Linker script variables
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];
extern char linker_privilege_mode_stacks_start[];
extern char linker_privilege_mode_stacks_end[];

void c_main(void) {
	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);

	//setup each priviledge mode stack
	uint32 mode_bits[] = {
		FIQ_MODE,
		IRQ_MODE,
		SVC_MODE,
		ABT_MODE,
		UND_MODE,
		SYS_MODE,
	};
	char* cur_stack = linker_privilege_mode_stacks_start;
	#if 0
	for (uint32 imode = 0; imode < array_len(mode_bits); imode++) {
		set_privilege_mode(mode_bits[imode]);
		set_stack_pointer(cur_stack);
		cur_stack += 0x1000;
	}
	set_privilege_mode(SVC_MODE);
	#endif
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);

	//---UART initialization
	uart0_init();
	uart0_put_str("Hello, world!\0");
	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
