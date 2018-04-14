// After some basic setup in assembly
#include "vm.h"
#include "arm.h"
#include "timer.h"
#include "utils.h"
#include "types.h"
#include "mem_mapped_io.h"

extern char kernel_end[];

#define WBWA_CACHEABLE 0x4 | 0x8 | 0x5000
#define USE_SECTIONS 0x2
#define USE_SMALL_PAGES 0x2
#define AP_DONT_CHECK_PERMS 0xC00

//---Linker script variables
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];

struct run {
  struct run *next;
};

void kmain(void) {
	//---Initialize MMU
	vm_init();

	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);

	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);

	//---UART initialization
	uart0_init();
	uart0_put_str("Hello, world!\n");

	// Identity map 
	uint32 offset = 0;
	char* test = "dogs";
	uint32* page_table_base = (uint32*)((uint32)(kernel_end + 0x4000) & ~0x3FFF); // 16k aligned
	uint64 phystop = 2*GB;
	for(uint32 vaddr = 0; vaddr <= 2*GB; vaddr += MB) {
		uint32* pt_entry = page_table_base + offset;
		*pt_entry = 0; 
		*pt_entry = vaddr | AP_DONT_CHECK_PERMS | USE_SECTIONS;
		offset++;
	}

	page_table_base[1] = 0 | AP_DONT_CHECK_PERMS | USE_SECTIONS;
	

	// Enable the MMU
	set_operating_mode(PSR_SYSTEM_MODE);
	asm volatile("mov r0, $4;"
				 "mvn r0, r0;"
                 "mrc p15, 0, r1, c1, c0, 0;"  // Get current control register
                 "and r1, r0, r1;"             // Disable cacheing
                 "mcr p15, 0, r1, c1, c0, 0;"  // Reset it

	//---Generic timer interrupts initialization
	timer_init();

	// char buf[256];
	// char* test_string = sprintf(buf, 256, "Hello %d worlds!\n", -10);
	// uart0_put_str(test_string);

	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
