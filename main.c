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
extern char vectors[];
extern char vectors_end[];

static char* mode_names[] = {
	[0] "user",
	[1] "FIQ",
	[2] "IRQ",
	[3] "supervisor",
	[7] "abort",
	[11] "undefined",
	[15] "system"
};

static void print_cpsr() {
	uint cpsr = get_cpsr();
	cprintf("cpsr = 0x%x\nflags = %s%s%s%s\nmode = %s\n\n", cpsr,
	        cpsr & PSR_ASNYC_ABORT_MASK ? "A" : "a",
	        cpsr & PSR_IRQ_MASK 				? "I" : "i",
	        cpsr & PSR_FIQ_MASK 				? "F" : "f",
	        cpsr & PSR_THUMB_STATE 			? "T" : "t",
	        mode_names[(cpsr & PSR_MODE_MASK) - 0x10]);
}

void kmain(void) {
	print_cpsr();

	//---Initialize MMU
	vm_init();

	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, vectors, vectors_end);

	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);

	//---UART initialization
	uart0_init();
	uart0_put_str("Hello, world!\n");

	//---Generic timer interrupts initialization
	timer_init();

  // Enable IRQ interrupts so we can see the timer interrupt occur
  enable_interrupts();

	// char buf[256];
	// char* test_string = sprintf(buf, 256, "Hello %d worlds!\n", -10);
	// uart0_put_str(test_string);

	asm volatile("svc 0x1");

	while (1) {
		delay(50000000);
		print_cpsr();
		// uart0_send_char(uart0_get_char());
	}
}
