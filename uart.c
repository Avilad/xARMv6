// Initialization for the UART devices in ARM
#include "mem_mapped_io.h"
#include "types.h"
#include "utils.h"
#include "console.h"

void uartputc(int);

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

//bcm2835 interrupt controller
#define UART_INT 57
#define IRQ_ENABLE_2 MEM_REG(PERI_BASE + 0xB214)
//bcm2836 interrupt controller
#define GPU_INTERRUPT_ROUTE MEM_REG(CONTROL_BASE + 0x0C)

void uartinit() {
#if 0
	// Temporarily disable UART0
	mmio_write(UART0_CR, 0);

	//Setup UART clock
	/*
	mailbox_message_buffer[0] = 8*4;
	mailbox_message_buffer[1] = MBOX_REQUEST;
	mailbox_message_buffer[2] = MBOX_TAG_SETCLKRATE; // set clock rate
	mailbox_message_buffer[3] = 12;                  // response buffer size
	mailbox_message_buffer[4] = 8;                   // request buffer size
	mailbox_message_buffer[5] = 2;                   // UART clock
	mailbox_message_buffer[6] = 4000000;             // 4Mhz
	mailbox_message_buffer[7] = MBOX_TAG_LAST;
	mailbox_send_message(MBOX_CH_PROP);
	*/

	// Set up GPPUD for GPIO 14/15
	// Reference: https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 101
	mmio_write(GPPUD, 0); // Disable pull
	delay(150);
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15)); // Pull down
	delay(150);
	mmio_write(GPPUDCLK0, 0); // Flush
	delay(150);

#if 0
	//Set pins 14 and 15 to value 100 (4) to enable alternate function 0
	//UART transmit/receive data
	uint func_sel_reg;
	func_sel_reg = *GPFSEL1;
	func_sel_reg &= ~(GPIO14 | GPIO15);
	func_sel_reg |= (4 << 12) | (4 << 15);
	mmio_write(GPFSEL1, func_sel_reg);
	delay(150);
#endif

	mmio_write(UART0_ICR, UART0_CLEAR_INTERRUPTS);
	mmio_write(UART0_IBRD, 1);
	mmio_write(UART0_FBRD, 40); // Fractional baud rate divisor
	mmio_write(UART0_LCRH, (UART0_LCRH_FIFO_EN | UART0_LCRH_8_BIT_WORD));

	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
	// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
	// Setup the GPIO pin 14 && 15.

	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
	delay(150);

	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
	delay(150);

	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);

	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);

	// Set integer & fractional part of baud rate.
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.

	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);

	// Enable z8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 5) | (1 << 6));

	// Mask all interrupts.
	// mmio_write(UART0_IMSC, 0);
	mmio_write(UART0_IMSC, (1 << 4));

	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));

	// Enable bcm2835 interrupt routing
	mmio_write(IRQ_ENABLE_2, 1 << (UART_INT - 32));

	// Enable bcm2836 interrupt routing
	mmio_write(GPU_INTERRUPT_ROUTE, 0);

	// Announce that we're here.
	char *p;
	for(p="xv6...\n"; *p; p++)
	  uartputc(*p);
#endif
}

// Pushes a byte through the UART port
void uartputc(int data) {
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
	mmio_write(UART0_DR, data);
	delay(150);
}

// Send a null-terminated string
void uartputs(int* s) {
	while (*s) {
		//\n -> \r\n
		if (*s == '\n') {
			uartputc('\r');
		}
		uartputc(*s++ & 0xFF);
	}
}

int uartgetc() {
    if (mmio_read(UART0_FR) & UART0_FR_EMPTY) {
			return -1;
		};
    return mmio_read(UART0_DR) & 0xFF;
}

void
uartintr(void)
{
  consoleintr(uartgetc);
}
