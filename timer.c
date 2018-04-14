//Timing/IRQ/FIQ control registers and values
//FIQ is a "fast" interrupt that is currently unused
//It banks a different register set for certain ISRs that need to save those cycles
#include "mem_mapped_io.h"
#include "utils.h"

// Timers interrupt control registers
#define CORE0_TIMER_IRQCNTL MEM_REG(CONTROL_BASE + 0x40)
#define CORE1_TIMER_IRQCNTL MEM_REG(CONTROL_BASE + 0x44)
#define CORE2_TIMER_IRQCNTL MEM_REG(CONTROL_BASE + 0x48)
#define CORE3_TIMER_IRQCNTL MEM_REG(CONTROL_BASE + 0x4C)
// Enable IRQ interrupts from CNTPS (timer 0)
#define CNTPS_IRQ 0x01

void cprintf(char *fmt, ...);

void timer_init() {
  char buf[256];
  char* test_string;
  uint lowword;
  uint highword;

  asm ("mrrc p15, 0, %0, %1, c14"
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
 	uart0_put_str(test_string);

  asm ("mrrc p15, 0, %0, %1, c14"
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
 	uart0_put_str(test_string);

  asm ("mrrc p15, 0, %0, %1, c14"
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
 	uart0_put_str(test_string);

  asm ("mrrc p15, 0, %0, %1, c14"
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
 	uart0_put_str(test_string);

  asm ("mrrc p15, 0, %0, %1, c14"
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
 	uart0_put_str(test_string);

  asm ("mrrc p15, 0, %0, %1, c14"
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
 	uart0_put_str(test_string);

  asm ("mrrc p15, 0, %0, %1, c14"
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
 	uart0_put_str(test_string);

  mmio_write(CORE0_TIMER_IRQCNTL, CNTPS_IRQ);
}
