#include "types.h"
#include "arm.h"
#include "arm_asm_intrinsics.h"
#include "utils.h"
#include "mem_mapped_io.h"
#include "memlayout.h"
#include "vm.h"
#include "swtch.h"
#include "console.h"

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

pde_t* kpgdir;

// #define KERNEND (3*GB + 4*MB)
#define NUM_KERN_SECTIONS 4


// Get the address of the PTE in pgdir that corresponds to vaddr
pde_t* walkpgdir(pde_t* pgdir, const void* vaddr) {
	return &pgdir[PAGE_DIR_INDEX_OF(vaddr)];
}

// Set basic identity mappings, enable MMU, free pages
void vm_init() {
	// Create the kernel's page table
	uint* kpgdir = SECTION_ROUND_UP(kernel_end);
  // (uint*)((uint)(kernel_end + 0x4000) & ~0x3FFF);
  // (uint*)(PHYSTOP - MB);
	// Identity map physical memory
	mmap(kpgdir, (void*)0, (void*)0, PHYSTOP / MB);
	// Identity map peripherals
	mmap(kpgdir, SECTION_ROUND_DOWN(PERI_BASE), SECTION_ROUND_DOWN(PERI_BASE), 32);;

	// Flush caches and enable MMU
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
				 : "r"(&kpgdir)
				 : "memory", "r0", "r1");

	uint progress = 0;
	uint i = 0;
	cprintf("Initializing memory: [");

	// Put every section after kpgdir up to PHYSTOP on the free list
	for(uint paddr = KERNTOP; paddr < PHYSTOP; paddr += MB) {
		for(i = 0; i < (progress / 10); i++) {
			cprintf("#");
		}
		for(i = progress / 10; i < 25; i++) {
			cprintf(" ");
		}
		cprintf("]");
		for(i = 0; i < 26; i++) {
			cprintf("\b");
		}
		progress++;
		kfree((char*)paddr);
	}
	cprintf("\n");
}

// Set the page dir to new_pgdir in hardware
void change_pgdir(pde_t* new_pgdir) {
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

void switchuvm(proc *p) {
  change_pgdir(p->pgdir);
}
void switchkvm() {
  change_pgdir(kpgdir);
}

// Map vstart to vstart + num_sections *MB to contiguous sections
void mmap(pde_t* pgdir, void* vstart, void* pstart, uint num_sections) {
	if (!IS_SECTION_ALIGNED(pstart)) { panic("Tried to map on non-section aligned boundary"); }

	uint section = (uint)pstart;
	void* vaddr = vstart;
	fox_for(isection, num_sections) {
		pde_t* descriptor = walkpgdir(pgdir, vaddr);
		*descriptor = section | AP_DONT_CHECK_PERMS | USE_SECTIONS;
		vaddr += MB;
		section += MB;
	}
}

// Returns a page directory with kernel mappings
pde_t* setupkvm(void) {
	pde_t* pgdir = kalloc();
	zero_section(pgdir);
  // Identity map physical memory
	mmap(pgdir, (void*)0, (void*)0, PHYSTOP / MB);
	// Identity map peripherals
	mmap(pgdir, SECTION_ROUND_DOWN(PERI_BASE), SECTION_ROUND_DOWN(PERI_BASE), 32);
	return pgdir;
}

// Adds a 1MB section to the freelist
void kfree(char* section) {
	// Sanity checks
	if (!IS_SECTION_ALIGNED(section)) { panic("Tried to free non-section aligned address"); }
	if ((uint)section >= PHYSTOP) { panic("Tried to free above top of physical memory"); }
	if ((uint)section < KERNTOP) { panic("Tried to free where the kernel lives"); }

	// Clear out the page
	zero_region(section, section + MB);

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

void
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= MB)
    panic("inituvm: more than a page");
  mem = kalloc();
  mmap(pgdir, USERSPACE(0), mem, 1);

  memmove(mem, init, sz);
}

// Load a program segment into pgdir. addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
  uint i, n;
  void *pa;
  pde_t descriptor;

  if((uint)addr % MB != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += MB){
    if((descriptor = *walkpgdir(pgdir, addr+i)) == 0)
      panic("loaduvm: address should exist");
    pa = PHYS_SECTION_FROM_DESC(descriptor);
    if(sz - i < MB)
      n = sz - i;
    else
      n = MB;
    if(readi(ip, pa, offset+i, n) != n)
      return -1;
  }
  return 0;
}

// Increases the size of process by mapping pages until its address space reaches new_vtop
int allocuvm(pde_t *pgdir, uint old_vtop, uint new_vtop) {
	// If we already have enough memory, just return
	if (new_vtop <= old_vtop) { return old_vtop; }
	// if (new_vtop - MB > old_vtop) { return new_vtop; }

	// Map sections until the top of our memory is at least at new_vtop
	void* virt_section = SECTION_ROUND_UP(old_vtop - 1);
	while(1) {
		char* phys_section = kalloc();
		mmap(pgdir, virt_section, phys_section, 1);
		virt_section += MB;
		if (virt_section > (void*)new_vtop) { break; }
	}
	return new_vtop;
}

// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint old_vtop, uint new_vtop)
{
  if(new_vtop >= old_vtop)
    return old_vtop;

  for(char *a = SECTION_ROUND_UP(new_vtop - 1); a - 1 < (char *)old_vtop; a += MB){
    pde_t *pde = walkpgdir(pgdir, a);
    if (*pde & INVALID_SECTION_MASK) {
      kfree(PHYS_SECTION_FROM_DESC(*pde));
    }
  }
  return new_vtop;
}

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, 0xFFFFFFFF, USERBASE);
  kfree((char*)pgdir);
}


// Copy len bytes from psrc to wherever vdst actually points in pgdir
// 1 on success, 0 on failure
int copyout(pde_t *pgdir, void* vdst, void* psrc, uint len) {
	pde_t descriptor = *walkpgdir(pgdir, vdst);
	void* section_base = PHYS_SECTION_FROM_DESC(descriptor);
	uint section_offset = SEC_OFFSET_FROM_VADDR(vdst);
	char* pdst = (char*)(section_base + section_offset);
	memcpy(pdst, psrc, len);
	return 1;
}

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
  pde_t *d, *pde;
  uint i;
  char *mem, *pa;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += MB){
    if((pde = walkpgdir(pgdir, (void *) i)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pde & INVALID_SECTION_MASK))
      panic("copyuvm: page not present");
    pa = PHYS_SECTION_FROM_DESC(*pde);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)pa, MB);
    mmap(d, (void*)i, pa, 1);
  }
  return d;

bad:
  freevm(d);
  return 0;
}