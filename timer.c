#include "mem_mapped_io.h"
#include "console.h"
#include "utils.h"

// Timers interrupt control registers
#define CORE0_TIMER_IRQCNTL  MEM_REG(CONTROL_BASE + 0x40)
#define CORE1_TIMER_IRQCNTL  MEM_REG(CONTROL_BASE + 0x44)
#define CORE2_TIMER_IRQCNTL  MEM_REG(CONTROL_BASE + 0x48)
#define CORE3_TIMER_IRQCNTL  MEM_REG(CONTROL_BASE + 0x4C)

// Enable IRQ interrupts from CNTPS (timer 0)
#define CNTPS_IRQ 0x1

static inline void set_tval(uint tval) {
  asm volatile("mcr p15, 0, %0, c14, c2, 0;" : : "r" (tval));
}

void timer_init() {
	// Enable the timer
  asm volatile("mcr p15, 0, %0, c14, c2, 1;" : : "r" (1));

  // Enable interrupts from the timer
  mmio_write(CORE0_TIMER_IRQCNTL, CNTPS_IRQ);
  // mmio_write(CORE1_TIMER_IRQCNTL, CNTPS_IRQ);
  // mmio_write(CORE2_TIMER_IRQCNTL, CNTPS_IRQ);
  // mmio_write(CORE3_TIMER_IRQCNTL, CNTPS_IRQ);

  // Interrupt in 100000000 timer ticks
  set_tval(100000000);
}
