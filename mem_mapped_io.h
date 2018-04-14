//Memory mapped IO addresses and functions
#ifndef MEM_MAPPED_IO_H
#define MEM_MAPPED_IO_H
#include "types.h"

#define MEM_REG(a) ((volatile uint*)(a))

//ARM memory mapped IO addresses
#define PERI_BASE       0x3F000000
#define CONTROL_BASE    0x40000000

// GPIO
// GPIO base is at 0x3F200000, aka PERI_BASE + 0x200000
// https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 90
#define GPFSEL0         MEM_REG(PERI_BASE+0x00200000)
#define GPFSEL1         MEM_REG(PERI_BASE+0x00200004)
#define GPFSEL2         MEM_REG(PERI_BASE+0x00200008)
#define GPFSEL3         MEM_REG(PERI_BASE+0x0020000C)
#define GPFSEL4         MEM_REG(PERI_BASE+0x00200010)
#define GPFSEL5         MEM_REG(PERI_BASE+0x00200014)
#define GPSET0          MEM_REG(PERI_BASE+0x0020001C)
#define GPSET1          MEM_REG(PERI_BASE+0x00200020)
#define GPCLR0          MEM_REG(PERI_BASE+0x00200028)
#define GPLEV0          MEM_REG(PERI_BASE+0x00200034)
#define GPLEV1          MEM_REG(PERI_BASE+0x00200038)
#define GPEDS0          MEM_REG(PERI_BASE+0x00200040)
#define GPEDS1          MEM_REG(PERI_BASE+0x00200044)
#define GPHEN0          MEM_REG(PERI_BASE+0x00200064)
#define GPHEN1          MEM_REG(PERI_BASE+0x00200068)
#define GPPUD           MEM_REG(PERI_BASE+0x00200094)
#define GPPUDCLK0       MEM_REG(PERI_BASE+0x00200098)
#define GPPUDCLK1       MEM_REG(PERI_BASE+0x0020009C)

// Auxilary mini UART registers
// UART base is at 0x3F201000, aka PERI_BASE + 0x201000
// https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 8
#define AUX_ENABLE      MEM_REG(PERI_BASE+0x00215004)
#define AUX_MU_IO       MEM_REG(PERI_BASE+0x00215040)
#define AUX_MU_IER      MEM_REG(PERI_BASE+0x00215044)
#define AUX_MU_IIR      MEM_REG(PERI_BASE+0x00215048)
#define AUX_MU_LCR      MEM_REG(PERI_BASE+0x0021504C)
#define AUX_MU_MCR      MEM_REG(PERI_BASE+0x00215050)
#define AUX_MU_LSR      MEM_REG(PERI_BASE+0x00215054)
#define AUX_MU_MSR      MEM_REG(PERI_BASE+0x00215058)
#define AUX_MU_SCRATCH  MEM_REG(PERI_BASE+0x0021505C)
#define AUX_MU_CNTL     MEM_REG(PERI_BASE+0x00215060)
#define AUX_MU_STAT     MEM_REG(PERI_BASE+0x00215064)
#define AUX_MU_BAUD     MEM_REG(PERI_BASE+0x00215068)

#define IO_REG_DATA_MASK 0xFF

#define LSR_DATA_READY  0x1
#define LSR_CAN_ACCEPT  0x20

#define GPIO14 7<<12
#define GPIO15 7<<15

uint DELAY_COUNTER;
#define delay(loops) DELAY_COUNTER = (loops); while(DELAY_COUNTER--) { asm volatile("nop"); }


void mmio_write(volatile uint* reg, uint data);
uint mmio_read(volatile uint* reg);


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
#define UART0_DR        MEM_REG(PERI_BASE+0x00201000)
#define UART0_FR        MEM_REG(PERI_BASE+0x00201018)
#define UART0_IBRD      MEM_REG(PERI_BASE+0x00201024)
#define UART0_FBRD      MEM_REG(PERI_BASE+0x00201028)
#define UART0_LCRH      MEM_REG(PERI_BASE+0x0020102C)
#define UART0_CR        MEM_REG(PERI_BASE+0x00201030)
#define UART0_IMSC      MEM_REG(PERI_BASE+0x00201038)
#define UART0_ICR       MEM_REG(PERI_BASE+0x00201044)

void uart0_init(void);
void uart0_send_char(char c);
char uart0_get_char(void);
void uart0_put_str(char* s);

#endif
