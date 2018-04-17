//Handles traps
#include "arm.h"
#include "utils.h"
#include "arm_asm_intrinsics.h"
#include "console.h"
#include "syscall.h"

static void dump_trapframe(trapframe* tf) {
	cprintf("sp = 0x%x\n"
	        "lr = 0x%x\n"
	        "r0 = 0x%x\n"
	        "r1 = 0x%x\n"
	        "r2 = 0x%x\n"
	        "r3 = 0x%x\n"
	        "r4 = 0x%x\n"
	        "r5 = 0x%x\n"
	        "r6 = 0x%x\n"
	        "r7 = 0x%x\n"
	        "r8 = 0x%x\n"
	        "r9 = 0x%x\n"
	        "r10 = 0x%x\n"
	        "r11 = 0x%x\n"
	        "r12 = 0x%x\n"
	        "lr_svc = 0x%x\n"
	        "cpsr = 0x%x\n"
	        "pc = 0x%x\n",
	        tf->sp,
	        tf->lr,
	        tf->r[0],
	        tf->r[1],
	        tf->r[2],
	        tf->r[3],
	        tf->r[4],
	        tf->r[5],
	        tf->r[6],
	        tf->r[7],
	        tf->r[8],
	        tf->r[9],
	        tf->r[10],
	        tf->r[11],
	        tf->r[12],
	        tf->lr_svc,
	        tf->cpsr,
	        tf->pc);
}

static char* mode_names[] = {
	[0] "user",
	[1] "FIQ",
	[2] "IRQ",
	[3] "supervisor",
	[7] "abort",
	[11] "undefined",
	[15] "system"
};

static void print_cpsr() {
	uint cpsr = get_cpsr();
	cprintf("cpsr = 0x%x\nflags = %s%s%s%s\nmode = %s\n\n", cpsr,
	        cpsr & PSR_ASNYC_ABORT_MASK ? "A" : "a",
	        cpsr & PSR_IRQ_MASK 				? "I" : "i",
	        cpsr & PSR_FIQ_MASK 				? "F" : "f",
	        cpsr & PSR_THUMB_STATE 			? "T" : "t",
	        mode_names[(cpsr & PSR_MODE_MASK) - 0x10]);
}

void undefined_instruction_handler(trapframe* tf) {
	char buf[1024];
	dump_trapframe(tf);
	panic(sprintf(buf, 1024, "Undefined instruction executed at 0x%x", tf->pc));
}

void software_interrupt_handler(trapframe* tf) {
	uint syscall_id = ((uint *)tf->pc)[-1] & 0xFFFFFF;
	syscall(syscall_id);
}

void prefetch_abort_handler(trapframe* tf) {
	char buf[1024];
	panic(sprintf(buf, 1024, "Prefetch abort at 0x%x", tf->pc));
}

void data_abort_handler(trapframe* tf) {
	char buf[1024];
	uint faulting_addr = get_data_fault_addr();
	//uint fault_info = get_data_fault_status(); @todo use this to print a better error message
	panic(sprintf(buf, 1024,
	              "Page fault at address 0x%x"
	              " executing instruction at 0x%x",
	              faulting_addr,
	              tf->pc));
}

void reserved_exception_handler() {
	panic("ARM reserved interrupt vector called.\n"
	      "This should never happen, might be a hardware error.\n");
}

void irq_handler(trapframe *tf) {
	set_cntp_tval(100000000);

	cprintf("TIMER INTERRUPT CALLED\n");
	print_cpsr();

  enable_interrupts();
}

void fiq_handler() {
	panic("FIQ handler called.\n"
	      "This should never happen because we don't enable FIQ interrupts.\n");
}
