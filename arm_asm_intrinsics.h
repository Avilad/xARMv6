#ifndef ARM_ASM_INTRINSICS_H
#define ARM_ASM_INTRINSICS_H
//Helpful arm assembly intrinsics

//Set the current privelege mode,
//mode_bit should be one of the privelege mode #defines in arm.h
void set_privilege_mode(uint32 mode_bit) {
	register uint32 cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
	              : [cpsr_out] "=r" (cur_cpsr));
	cur_cpsr = cur_cpsr & (~MODE_MASK | mode_bit);
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
	              : //No output
	              : [cpsr_in] "r" (cur_cpsr));
}

void set_stack_pointer(void* sp) {
	register uint32 sp_reg_val = (uint32)sp;
	asm volatile ("mov sp, %[sp_in]"
	              : //No output
	              : [sp_in] "r" (sp_reg_val));
}

#endif
