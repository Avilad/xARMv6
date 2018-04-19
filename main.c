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

static void mpmain(void)  __attribute__((noreturn));

void kmain(void) {
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);

	consoleinit();   // console hardware

	//---UART initialization
	uartinit();

	//---Initialize MMU
	vm_init();

	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, vectors, vectors_end);

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

	// enable_interrupts();

  // idtinit();       // load idt register
	// @multithreading XV6 uses xchg() for below
  mycpu()->started = 1; // tell startothers() we're up
  scheduler();     // start running processes
}
