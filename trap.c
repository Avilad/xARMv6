//Handles traps
#include "arm.h"
#include "mailbox.h"
#include "utils.h"
#include "arm_asm_intrinsics.h"

static void dump_tramp_frame(struct trap_frame* tf) {
	char buf[1024];
	sprintf(buf, 1024,
	        "user LR = 0x%x\n"
	        "user SP = 0x%x\n"
	        "user SPSR = 0x%x\n"
	        "return address = 0x%x\n"
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
	        "r12 = 0x%x\n",
	        tf->user_link_register,
	        tf->user_stack_register,
	        tf->user_saved_status_register,
	        tf->user_return_address,
	        tf->general_registers[0],
	        tf->general_registers[1],
	        tf->general_registers[2],
	        tf->general_registers[3],
	        tf->general_registers[4],
	        tf->general_registers[5],
	        tf->general_registers[6],
	        tf->general_registers[7],
	        tf->general_registers[8],
	        tf->general_registers[9],
	        tf->general_registers[10],
	        tf->general_registers[11],
	        tf->general_registers[12]);
	uart0_put_str(buf);
}

void undefined_instruction_handler(struct trap_frame* tf) {
	char buf[1024];
	//-4 because return address is after faulting instruction
	panic(sprintf(buf, 1024, "Undefined instruction executed at 0x%x",
	              tf->user_return_address - 4));
}

void software_interrupt_handler(struct trap_frame* tf) {
	//@todo
	panic("swi handler unimplemented");
}

void prefetch_abort_handler(struct trap_frame* tf) {
	char buf[1024];
	panic(sprintf(buf, 1024, "Prefetch abort at 0x%x",
	              tf->user_return_address - 4));
}

void data_abort_handler(struct trap_frame* tf) {
	char buf[1024];
	uint32 faulting_addr = get_data_fault_addr();
	//uint32 fault_info = get_data_fault_status(); @todo use this to print a better error message
	panic(sprintf(buf, 1024,
	              "Page fault at address 0x%x"
	              " executing instruction at 0x%x",
	              faulting_addr,
	              tf->user_return_address));
}

void unused_exception_handler(struct trap_frame* tf) {
	dump_tramp_frame(tf);
	panic("ARM reserved interrupt vector called.\n"
	      "This should never happen, might be a hardware error.");
}

void irq_handler(struct trap_frame* tf) {
	//@todo
	panic("irq handler unimplemented");
}

void fiq_handler(struct trap_frame* tf) {
	dump_tramp_frame(tf);
	panic("FIQ handler called.\n"
	      "This should never happen because we don't enable FIQ interrupts.\n");
}
