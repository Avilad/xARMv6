#ifndef ARM_ASM_INTRINSICS_H
#define ARM_ASM_INTRINSICS_H
//Helpful arm assembly intrinsics

//Set the current processor operating mode,
//mode_bit should be one of the PSR mode defines in arm.h
void set_operating_mode(uint32 mode_bit) {
	register uint32 cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
	              : [cpsr_out] "=r" (cur_cpsr));
	cur_cpsr = cur_cpsr & (~PSR_MODE_MASK | mode_bit);
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
	              : //No output
	              : [cpsr_in] "r" (cur_cpsr));
}

#endif
