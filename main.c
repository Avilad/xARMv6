#include "types.h"
#include "vm.h"
#include "proc.h"
#include "arm.h"
#include "timer.h"
#include "utils.h"
#include "arm_asm_intrinsics.h"
#include "uart.h"
#include "bio.h"
#include "ide.h"
#include "console.h"

//---Linker script variables
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char vectors[];
extern char vectors_end[];

// static char* mode_names[] = {
// 	[0] "user",
// 	[1] "FIQ",
// 	[2] "IRQ",
// 	[3] "supervisor",
// 	[7] "abort",
// 	[11] "undefined",
// 	[15] "system"
// };
//
// static void print_cpsr() {
// 	uint cpsr = get_cpsr();
// 	cprintf("cpsr = 0x%x\nflags = %s%s%s%s\nmode = %s\n\n", cpsr,
// 	        cpsr & PSR_ASNYC_ABORT_MASK ? "A" : "a",
// 	        cpsr & PSR_IRQ_MASK 				? "I" : "i",
// 	        cpsr & PSR_FIQ_MASK 				? "F" : "f",
// 	        cpsr & PSR_THUMB_STATE 			? "T" : "t",
// 	        mode_names[(cpsr & PSR_MODE_MASK) - 0x10]);
// }

static void mpmain(void)  __attribute__((noreturn));

void kmain(void) {
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);

	//---Initialize MMU
	vm_init();

	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, vectors, vectors_end);

	//---UART initialization
	uart0_init();

	//---Initialize process table
  pinit();

	binit();    // buffer cache
  fileinit(); // file table
  ideinit();  // disk

	//--Initialize first user process
	userinit();

	mpmain();
}

// Common CPU setup code.
static void
mpmain(void)
{
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());

	//---Generic timer interrupts initialization
	timer_init();

  // idtinit();       // load idt register
	// @multithreading XV6 uses xchg() for below
  mycpu()->started = 1; // tell startothers() we're up
  scheduler();     // start running processes
}
