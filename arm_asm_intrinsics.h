#include "types.h"

//Helpful arm assembly intrinsics
#ifndef ARM_ASM_INTRINSICS_H
#define ARM_ASM_INTRINSICS_H
uint get_cpsr();
void set_cpsr(uint new_cpsr);
void set_operating_mode(uint mode_bit);
void enable_irq_interrupts();
void disable_irq_interrupts();
uint get_data_fault_addr();
uint get_data_fault_status();
#endif
