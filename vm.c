#include "types.h"
#include "arm.h"
#include "arm_asm_intrinsics.h"
#include "utils.h"
#include "mem_mapped_io.h"
#include "memlayout.h"

#define WBWA_CACHEABLE 0x4 | 0x8 | 0x5000
#define USE_SECTIONS 0x2
#define AP_DONT_CHECK_PERMS 0xC00
#define INVALID_SECTION_MASK 0x3

extern char kernel_end[];

struct run {
  struct run *next;
};

struct {
  struct run* freelist;
} kmem;

char* kpgdir;
#define KERNBASE (3*GB)
#define KERNEND (3*GB + 4*MB)
#define NUM_KERN_SECTIONS 4


// Set the page dir to new_pgdir in hardware
void use_pgdir(pte_t* new_pgdir) {
	asm volatile("mov r1, $0;"
				 "mcr p15, 0, r1, c7, c5, 0;"  // Invalidate caches

				 "mcr p15, 0, r1, c7, c5, 4;"  // Flush prefetch buffer
				 "mcr p15, 0, r1, c8, c7, 0;"  // Invalidate tlb

				 "ldr r0, [%0];"
				 "mcr p15, 0, r0, c2, c0, 0;"  // Set the TLB base
				 :
				 : "r"(&new_pgdir)
				 : "memory", "r0", "r1");
}

// Adds a 1MB section to the page table
void kfree(char* section) {
	// Sanity checks
	if (!IS_SECTION_ALIGNED(section)) { panic("Tried to free non-section aligned address"); }
	if ((uint)section >= PHYSTOP) { panic("Tried to free above top of physical memory"); }
	if ((uint)section < KERNTOP) { panic("Tried to free where the kernel lives"); }

	// Clear out the page
	zero_section(section);

	// Add it to the freelist
	struct run* run =  (struct run*)section;
	run->next = kmem.freelist;
	kmem.freelist = run;
}

// Return a 1MB section as a pointer, or 0 if there are none
void* kalloc(void) {
	struct run* section = kmem.freelist;
	if (section) {
		kmem.freelist = section->next;
	}
	return (char*)section;
}

// Get the addres in pgdir that corresponds to vaddr
pte_t* walkpgdir(pte_t* pgdir, const void* vaddr) {
	pte_t* descriptor = &pgdir[PAGE_DIR_INDEX_OF(vaddr)];
	return descriptor;
}

// Map vstart to vstart + num_sections *MB to contiguous sections
void map(pde_t* pgdir, void* vstart, void* pstart, uint num_sections) {
	if (!IS_SECTION_ALIGNED(pstart)) { panic("Tried to map on non-section aligned boundary"); }

	uint section = (uint)pstart;
	void* vaddr = vstart;
	fox_for(isection, num_sections) {
		pte_t* descriptor = walkpgdir(pgdir, vaddr);
		*descriptor = section | AP_DONT_CHECK_PERMS | USE_SECTIONS;
		vaddr += MB;
		section += MB;
	}
}

// Set basic identity mappings, enable MMU, free pages
void vm_init() {
	// Create the kernel's page table
	uint* page_table_base = (uint*)((uint)(kernel_end + 0x4000) & ~0x3FFF);
	// Identity map RAM
	map(page_table_base, 0, 0, 256);
	// Identity map peripherals
	map(page_table_base, SECTION_ROUND_DOWN(PERI_BASE), SECTION_ROUND_DOWN(PERI_BASE), 32);

	// Flush caches and enable MMU
	set_operating_mode(PSR_SYSTEM_MODE);
	uart0_put_str("ye2");
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
	uart0_put_str("ye3");

	// Put every section from 4MB to 256MB on the free list
	for(uint paddr = 4*MB; paddr < 256*MB; paddr += MB) {
		kfree((char*)paddr);
	}
}

// Returns a clean page dir, except bottom four MB are identity mapped
pte_t* setupkvm(void) {
	pde_t* pgdir = kalloc();
	zero_section(pgdir);
	map(pgdir, (void*)0, (void*)0, NUM_KERN_SECTIONS);
	return pgdir;
}

// Increases the size of process by mapping pages until it has new_vtop memory
int allocuvm(pde_t *pgdir, uint old_vtop, uint new_vtop) {
	// If we already have enough memory, just return
	if (old_vtop > new_vtop) { return old_vtop; }
	if (new_vtop - MB > old_vtop) { return new_vtop; }

	// Map sections until we have at least new_vtop bytes
	void* virt_section = SECTION_ROUND_UP(old_vtop);
	while(1) {
		char* phys_section = kalloc();
		map(pgdir, virt_section, phys_section, 1);
		virt_section += MB;
		if (virt_section > (void*)new_vtop) { break; }
	}
	return new_vtop;
}

#if 0
// @todo finish when the file system works
int loaduvm(pde_t *pgdir, char *addr, inode *ip, uint offset, uint sz) {
	return 0;
}
#endif

// Copy len bytes from psrc to wherever vdst actually points in pgdir
// 1 on success, 0 on failure
int copyout(pde_t *pgdir, void* vdst, void* psrc, uint len) {
	pde_t* descriptor = walkpgdir(pgdir, vdst);
	void* section_base = PHYS_SECTION_FROM_DESC(descriptor);
	uint section_offset = SEC_OFFSET_FROM_VADDR(vdst);
	char* pdst = (char*)(section_base + section_offset);
	memcpy(pdst, psrc, len);
	return 1;
}

void freevm(pde_t *pgdir) {

}
