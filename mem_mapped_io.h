//Memory mapped IO addresses and functions
#ifndef MEM_MAPPED_IO_H
#define MEM_MAPPED_IO_H

#include "types.h"

#define MEM_REG(a) ((volatile uint*)(a))

//ARM memory mapped IO addresses
#define PERI_BASE       0x3F000000
#define CONTROL_BASE    0x40000000

static inline void mmio_write(volatile uint* reg, uint data) {
	*reg = data;
}
static inline uint mmio_read(volatile uint* reg) {
	return *reg;
}

#endif // MEM_MAPPED_IO_H
