//After some basic setup in assembly 
#include "mem_mapped_io.h"
#include "arm.h"
#include "arm_asm_intrinsics.h"
#include "utils.h"

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

	assert(7 < 5);
	//---UART initialization
	char buf[256];
	char* test_string = sprintf(buf, 256, "Hello %d worlds!", -10);
	uart0_init();
	uart0_put_str(test_string);
	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
