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

void kmain(void) {
	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);

	//---UART initialization
	uart0_init();
	uart0_put_str("Hello, world!\0");
	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
