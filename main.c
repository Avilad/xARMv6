//After some basic setup in assembly 
#include "mem_mapped_io.h"
#include "arm.h"
#include "arm_asm_intrinsics.h"
#include "utils.h"
#include "types.h"

extern char kernel_end[];

#define fox_for(iter, until) for(uint32 iter = 0; iter < (until); iter++)
#define KB 1024
#define MB 1024 * KB
#define GB (long)(1024 * MB)

#define WBWA_CACHEABLE 0x4 | 0x8 | 0x5000
#define USE_SECTIONS 0x2
#define AP_DONT_CHECK_PERMS 0xC00

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
	char buf[256];
	char* test_string = sprintf(buf, 256, "Hello %d worlds!", -10);
	uart0_init();
	uart0_put_str(test_string);

	// Identity map from 1MB up to MMIO_BASE
	uint32 offset = 0;
	uint32* page_table_base = (uint32*)((uint32)(kernel_end + 0x4000) & ~0x3FFF);
	for(uint32 vaddr = 0; vaddr < (1 << 31); vaddr += MB) {
		uint32* pt_entry = page_table_base + offset;
		*pt_entry = 0; 
		*pt_entry = vaddr | AP_DONT_CHECK_PERMS | USE_SECTIONS;
		offset++;
	}

	// enable mmu
	/*
	   https://github.com/dwelch67/raspberrypi/tree/master/mmu
	   https://stackoverflow.com/questions/20138294/getting-a-prefetch-abort-after-enabling-mmu-on-armv7
	   https://witekio.com/blog/turning-arm-mmu-living-tell-tale-code/
	*/
	set_operating_mode(PSR_SYSTEM_MODE);

	asm volatile("mov r0, $4;"
				 "mvn r0, r0;"
                 "mrc p15, 0, r1, c1, c0, 0;"  // Get current control register
                 "and r1, r0, r1;"             // Disable cacheing
                 "mcr p15, 0, r1, c1, c0, 0;"  // Reset it

				 
				 "mov r1, $0;"
				 "mcr p15, 0, r1, c2, c0, 2;"  // Use TTBR0
				 "mcr p15, 0, r1, c7, c5, 0;"  // Invalidate caches
				 
				 "mcr p15, 0, r1, c7, c5, 4;"  // Flush prefetch buffer
				 "mcr p15, 0, r1, c8, c7, 0;"  // Invalidate tlb
				 
				 "ldr r0, [%0];"
				 "mcr p15, 0, r0, c2, c0, 0;"  // Set the TLB base
				 "dsb;"                        // Wait for all memory accesses to finish
				 
				 "mov r0, $0xFFFFFFFF;"        // Set domain to Manager (no permissions needed?)
                 "mcr p15, 0, r0, c3, c0, 0;"  
				 
                 "mrc p15, 0, r1, c1, c0, 0;"  // Get current control register
                 "orr r1, r1, $1;"             // Enable mmu bit (0x1)
                 "mcr p15, 0, r1, c1, c0, 0;"  // Put that bad boy back in there
				 :
				 : "r"(&page_table_base)
				 : "memory", "r0", "r1");

	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
