#include "vm.h"
#include "arm.h"
#include "timer.h"
#include "utils.h"
#include "types.h"
#include "arm_asm_intrinsics.h"
#include "uart.h"
#include "console.h"

//---Linker script variables
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];

void kmain(void) {
	// cprintf("cpsr = 0x%x\n", get_cpsr());

	//---Initialize MMU
	vm_init();

	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);

	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);

	//---UART initialization
	uart0_init();
	uart0_put_str("Hello, world!\n");

	//---Generic timer interrupts initialization
	timer_init();

  // Enable IRQ interrupts so we can see the timer interrupt occur
  enable_irq_interrupts();

	// char buf[256];
	// char* test_string = sprintf(buf, 256, "Hello %d worlds!\n", -10);
	// uart0_put_str(test_string);

	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
