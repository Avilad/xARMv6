#include "types.h"

//ARM memory mapped IO addresses
#define MMIO_BASE       0x3F000000

// GPIO
// GPIO base is at 0x3F200000, aka MMIO_BASE + 0x200000
// https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 90
#define GPFSEL0         ((volatile uint32*)(MMIO_BASE+0x00200000))
#define GPFSEL1         ((volatile uint32*)(MMIO_BASE+0x00200004))
#define GPFSEL2         ((volatile uint32*)(MMIO_BASE+0x00200008))
#define GPFSEL3         ((volatile uint32*)(MMIO_BASE+0x0020000C))
#define GPFSEL4         ((volatile uint32*)(MMIO_BASE+0x00200010))
#define GPFSEL5         ((volatile uint32*)(MMIO_BASE+0x00200014))
#define GPSET0          ((volatile uint32*)(MMIO_BASE+0x0020001C))
#define GPSET1          ((volatile uint32*)(MMIO_BASE+0x00200020))
#define GPCLR0          ((volatile uint32*)(MMIO_BASE+0x00200028))
#define GPLEV0          ((volatile uint32*)(MMIO_BASE+0x00200034))
#define GPLEV1          ((volatile uint32*)(MMIO_BASE+0x00200038))
#define GPEDS0          ((volatile uint32*)(MMIO_BASE+0x00200040))
#define GPEDS1          ((volatile uint32*)(MMIO_BASE+0x00200044))
#define GPHEN0          ((volatile uint32*)(MMIO_BASE+0x00200064))
#define GPHEN1          ((volatile uint32*)(MMIO_BASE+0x00200068))
#define GPPUD           ((volatile uint32*)(MMIO_BASE+0x00200094))
#define GPPUDCLK0       ((volatile uint32*)(MMIO_BASE+0x00200098))
#define GPPUDCLK1       ((volatile uint32*)(MMIO_BASE+0x0020009C))

// Auxilary mini UART registers
// UART base is at 0x3F201000, aka MMIO_BASE + 0x201000
// https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 8
#define AUX_ENABLE      ((volatile uint32*)(MMIO_BASE+0x00215004))
#define AUX_MU_IO       ((volatile uint32*)(MMIO_BASE+0x00215040))
#define AUX_MU_IER      ((volatile uint32*)(MMIO_BASE+0x00215044))
#define AUX_MU_IIR      ((volatile uint32*)(MMIO_BASE+0x00215048))
#define AUX_MU_LCR      ((volatile uint32*)(MMIO_BASE+0x0021504C))
#define AUX_MU_MCR      ((volatile uint32*)(MMIO_BASE+0x00215050))
#define AUX_MU_LSR      ((volatile uint32*)(MMIO_BASE+0x00215054))
#define AUX_MU_MSR      ((volatile uint32*)(MMIO_BASE+0x00215058))
#define AUX_MU_SCRATCH  ((volatile uint32*)(MMIO_BASE+0x0021505C))
#define AUX_MU_CNTL     ((volatile uint32*)(MMIO_BASE+0x00215060))
#define AUX_MU_STAT     ((volatile uint32*)(MMIO_BASE+0x00215064))
#define AUX_MU_BAUD     ((volatile uint32*)(MMIO_BASE+0x00215068))

#define IO_REG_DATA_MASK 0xFF

#define LSR_DATA_READY  0x1
#define LSR_CAN_ACCEPT  0x20

#define GPIO14 7<<12
#define GPIO15 7<<15

uint32 DELAY_COUNTER;
#define delay(loops) DELAY_COUNTER = (loops); while(DELAY_COUNTER--) { asm volatile("nop"); }


void mmio_write(volatile uint32* reg, uint32 data);
uint32 mmio_read(volatile uint32* reg);


/* UART */
// https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 178
//Control values
#define UART0_LCRH_FIFO_EN 1 << 4
#define UART0_LCRH_8_BIT_WORD 0x11 << 5
#define UART0_CR_EN 0x1
#define UART0_CR_ENABLE_TX_RX_FIFO 0x301

#define UART0_FR_EMPTY 0x10
#define UART0_FR_FULL 0x20
#define UART0_BAUD_115200 2
#define UART0_CLEAR_INTERRUPTS 0x7FF

//Memory mapped registers
#define UART0_DR        ((volatile uint32*)(MMIO_BASE+0x00201000))
#define UART0_FR        ((volatile uint32*)(MMIO_BASE+0x00201018))
#define UART0_IBRD      ((volatile uint32*)(MMIO_BASE+0x00201024))
#define UART0_FBRD      ((volatile uint32*)(MMIO_BASE+0x00201028))
#define UART0_LCRH      ((volatile uint32*)(MMIO_BASE+0x0020102C))
#define UART0_CR        ((volatile uint32*)(MMIO_BASE+0x00201030))
#define UART0_IMSC      ((volatile uint32*)(MMIO_BASE+0x00201038))
#define UART0_ICR       ((volatile uint32*)(MMIO_BASE+0x00201044))

void uart0_init(void);
void uart0_send_char(char c);
char uart0_get_char(void);
void uart0_put_str(char* s);

/*Timer and IRQ interrupts*/
//http://projects-raspberry.com/wp-content/uploads/2015/08/BCM2836-ARM-local-peripherals-QA7_rev3.4.pdf?x32994
#define LOCAL_TIMER_CONTROL_REGISTER ((volatile uint32*)(0x40000034))
#define LOCAL_TIMER_INTERRUPT_ENABLE (1 << 29)
#define LOCAL_TIMER_ENABLE           (1 << 28)
#define LOCAL_TIMER_RELOAD_MASK       7FFFFFF
#define LOCAL_TIMER_INTERRUPT_ROUTE_REGISTER ((volatile uint32*)(0x40000024))
#define LOCAL_TIMER_INTERRUPT_ROUTE_CORE0_IRQ 0
