//Helpful arm assembly intrinsics
#include "arm.h"

uint32 get_cpsr() {
	register uint32 cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
	              : [cpsr_out] "=r" (cur_cpsr));
	return cur_cpsr;
}

void set_cpsr(uint32 new_cpsr) {
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
	              : //No output
	              : [cpsr_in] "r" (new_cpsr));
}

//Set the current processor operating mode,
//mode_bit should be one of the PSR mode defines in arm.h
void set_operating_mode(uint32 mode_bit) {
	register uint32 cur_cpsr = get_cpsr();
	cur_cpsr = cur_cpsr & (~PSR_MODE_MASK | mode_bit);
	set_cpsr(cur_cpsr);
}

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void enable_irq_interrupts() {
	register uint32 cur_cpsr = get_cpsr();
	cur_cpsr = cur_cpsr & ~PSR_IRQ_INTERRUPT_DISABLE;
	set_cpsr(cur_cpsr);
}

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void disable_irq_interrupts() {
	register uint32 cur_cpsr = get_cpsr();
	cur_cpsr = cur_cpsr | PSR_IRQ_INTERRUPT_DISABLE;
	set_cpsr(cur_cpsr);
}

uint32 get_data_fault_addr() {
	//@todo
	#if 0
	register uint32 dfar;
	asm volatile ("mrc p15, 0, %[dfar_out] c6, c0, 0"
	              : [dfar_out] "=r" (dfar));
	return dfar;
	#endif
	return 0;
}

uint32 get_data_fault_status() {
	//@todo
	#if 0
	register uint32 dfsr;
	asm volatile ("mrc p15, 0, %[dfsr_out], c5, c0, 0"
	              : [dfsr_out] "=r" (dfsr));
	return dfsr;
	#endif
	return 0;
}
