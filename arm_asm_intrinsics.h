//Helpful arm assembly intrinsics
#ifndef ARM_ASM_INTRINSICS_H
#define ARM_ASM_INTRINSICS_H
uint32 get_cpsr();
void set_cpsr(uint32 new_cpsr);
void set_operating_mode(uint32 mode_bit);
void enable_irq_interrupts();
void disable_irq_interrupts();
uint32 get_data_fault_addr();
uint32 get_data_fault_status();
#endif
