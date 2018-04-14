// Initialization for the UART devices in ARM
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint* reg, uint data) {
	*reg = data;
}
uint mmio_read(volatile uint* reg) {
	return *reg;
}

void uart0_init() {
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

	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));

	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));

	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
#endif
}

// Pushes a byte through the UART port
void uart0_send_char(char data) {
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
	mmio_write(UART0_DR, data);
	delay(150);
}

char uart0_get_char() {
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
    char response = (char)mmio_read(UART0_DR);
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
		//\n -> \r\n
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
