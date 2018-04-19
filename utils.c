#include "utils.h"
#include "arm_asm_intrinsics.h"

static char* mode_names[] = {
	[0] "user",
	[1] "FIQ",
	[2] "IRQ",
	[3] "supervisor",
	[7] "abort",
	[11] "undefined",
	[15] "system"
};

void print_cpsr() {
	uint cpsr = get_cpsr();
	cprintf("cpsr = 0x%x\nflags = %s%s%s%s\nmode = %s\n\n", cpsr,
	        cpsr & PSR_ASNYC_ABORT_MASK ? "A" : "a",
	        cpsr & PSR_IRQ_MASK 				? "I" : "i",
	        cpsr & PSR_FIQ_MASK 				? "F" : "f",
	        cpsr & PSR_THUMB_STATE 			? "T" : "t",
	        mode_names[(cpsr & PSR_MODE_MASK) - 0x10]);
}