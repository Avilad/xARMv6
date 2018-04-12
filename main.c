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

	//---Timer test code
	enable_irq_interrupts();
	//Enable timer to generate interrupts every 10 ms (1 Mhz timer generates interrupts on counting 10000)
	mmio_write(LOCAL_TIMER_INTERRUPT_ROUTE_REGISTER,
	           LOCAL_TIMER_INTERRUPT_ROUTE_CORE0_IRQ);
	mmio_write(LOCAL_TIMER_CONTROL_REGISTER,
	           LOCAL_TIMER_INTERRUPT_ENABLE | LOCAL_TIMER_ENABLE | 10000);

	//---UART initialization
	uart0_init();
	uart0_put_str("Hello, world!\0");
	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
