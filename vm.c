#include "types.h"
#include "arm.h"
#include "arm_asm_intrinsics.h"

#define WBWA_CACHEABLE 0x4 | 0x8 | 0x5000
#define USE_SECTIONS 0x2
#define AP_DONT_CHECK_PERMS 0xC00

extern char kernel_end[];

struct run {
  struct run *next;
};

void vm_init() {
  // Identity map from 1MB up to PERI_BASE
	uint offset = 0;
	uint* page_table_base = (uint*)((uint)(kernel_end + 0x4000) & ~0x3FFF);
	for(uint vaddr = 0; vaddr < (1 << 31); vaddr += MB) {
		uint* pt_entry = page_table_base + offset;
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
}
