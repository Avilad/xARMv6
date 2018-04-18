#ifndef VM_H
#define VM_H

#include "types.h"
#include "proc.h"
#include "file.h"

void vm_init();
void switchuvm(proc*);
void switchkvm(void);
void mmap(pde_t*, void*, void*, uint);
pde_t* setupkvm(void);
void kfree(char*);
void* kalloc(void);
void inituvm(pde_t*, char*, uint);
int loaduvm(pde_t*, char*, inode*, uint, uint);
int allocuvm(pde_t*, uint, uint);

#endif // VM_H
