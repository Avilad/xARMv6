//Handles traps
#include "arm.h"
#include "utils.h"
#include "arm_asm_intrinsics.h"
#include "mem_mapped_io.h"
#include "console.h"
#include "syscall.h"
#include "proc.h"
#include "uart.h"
#include "spinlock.h"
#include "timer.h"

#define CORE0_IRQ_SOURCE  MEM_REG(CONTROL_BASE + 0x60)

spinlock tickslock;
uint ticks;

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

void trap_common(trapframe *tf, int is_tick);

void undefined_instruction_handler(trapframe* tf) {
	char buf[1024];
	dump_trapframe(tf);
	panic(sprintf(buf, 1024, "Undefined instruction executed at 0x%x", tf->pc));
}

void software_interrupt_handler(trapframe* tf) {
	uint syscall_id = ((uint *)tf->pc)[-1] & 0xFFFFFF;

	myproc()->tf = tf;
	syscall(syscall_id);
	trap_common(tf, 0);
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
	int is_tick = 0;

	if (mmio_read(CORE0_IRQ_SOURCE) & (1 << 8)) {
		uartintr();
	} else {
		// TIMER INTERRUPT

		// Schedule the next timer interrupt
		timer_schedule();

		// Interrupt is due to a timer tick
		is_tick = 1;

		// Increment ticks
		if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
    }
	}

	trap_common(tf, is_tick);
}

void trap_common(trapframe *tf, int is_tick) {
	proc *curproc = myproc();

	if(curproc && curproc->killed && (tf->cpsr & PSR_MODE_MASK) == PSR_USER_MODE) {
		exit();
	}

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(curproc && curproc->state == RUNNING && is_tick) {
		yield();

	  // Check if the process has been killed since we yielded
	  if(curproc && curproc->killed && (tf->cpsr & PSR_MODE_MASK) == PSR_USER_MODE) {
			exit();
		}
	}
}

void fiq_handler() {
	panic("FIQ handler called.\n"
	      "This should never happen because we don't enable FIQ interrupts.\n");
}
