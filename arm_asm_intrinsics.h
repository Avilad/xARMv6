//Helpful arm assembly intrinsics
#ifndef ARM_ASM_INTRINSICS_H
#define ARM_ASM_INTRINSICS_H

#include "arm.h"
#include "types.h"

static inline uint get_cpsr() {
	register uint cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
	              : [cpsr_out] "=r" (cur_cpsr));
	return cur_cpsr;
}

static inline void set_cpsr(uint new_cpsr) {
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
	              : //No output
	              : [cpsr_in] "r" (new_cpsr));
}

//Set the current processor operating mode,
//mode_bit should be one of the PSR mode defines in arm.h
static inline void set_operating_mode(uint mode_bit) {
	register uint cur_cpsr = get_cpsr();
	cur_cpsr = cur_cpsr & (~PSR_MODE_MASK | mode_bit);
	set_cpsr(cur_cpsr);
}

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
static inline void enable_irq_interrupts() {
	register uint cur_cpsr = get_cpsr();
	cur_cpsr = cur_cpsr & ~PSR_IRQ_INTERRUPT_DISABLE;
	set_cpsr(cur_cpsr);
}

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
static inline void disable_irq_interrupts() {
	register uint cur_cpsr = get_cpsr();
	cur_cpsr = cur_cpsr | PSR_IRQ_INTERRUPT_DISABLE;
	set_cpsr(cur_cpsr);
}

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
static inline int irq_interrupts_enabled() {
	register uint cur_cpsr = get_cpsr();
	return !(cur_cpsr & PSR_IRQ_INTERRUPT_DISABLE);
}

static inline uint get_data_fault_addr() {
	//@todo
	#if 0
	register uint dfar;
	asm volatile ("mrc p15, 0, %[dfar_out] c6, c0, 0"
	              : [dfar_out] "=r" (dfar));
	return dfar;
	#endif
	return 0;
}

static inline uint get_data_fault_status() {
	//@todo
	#if 0
	register uint dfsr;
	asm volatile ("mrc p15, 0, %[dfsr_out], c5, c0, 0"
	              : [dfsr_out] "=r" (dfsr));
	return dfsr;
	#endif
	return 0;
}

static inline void atomic_store(uint* mem, uint val) {
	//Initialize to zero to make GCC happy
	register uint val_reg = 0;
	register uint success;
	asm volatile (//Atomic store loop top
	              "1: "
	              //Atomic load value
	              "ldrex %[val_reg_inout], [%[val_in]];"
	              //Atomic store value
	              "strex %[success_out], %[val_reg_inout], [%[mem_in]];"
	              //If success_out is 0 i.e. load/store unsuccessful, loop
	              "ands %[success_out], %[success_out];"
	              //Branch to loop top
	              "beq 1b;"
	              : [val_reg_inout] "+r" (val_reg),
	                [success_out] "=&r" (success)
	              : [mem_in] "r" (mem),
	                [val_in] "r" (&val));
}


#endif
