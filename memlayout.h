#define SECTION_ROUND_DOWN(section) (void*)(((uint)section) & 0xFFF00000)
#define SECTION_ROUND_UP(section) (void*)((((uint)section) + MB) & 0xFFF00000)
#define IS_SECTION_ALIGNED(addr) (!(((uint)addr) % MB))
#define PAGE_DIR_INDEX_OF(vaddr) (((uint)vaddr) / MB)

#define PHYS_SECTION_FROM_DESC(desc) (void*)(((uint)desc) & 0xFFF00000)
#define SEC_OFFSET_FROM_VADDR(vaddr) (((uint)vaddr) & 0x00000FFF)

#define PHYSTOP (256*MB)
#define KERNTOP (4*MB)
