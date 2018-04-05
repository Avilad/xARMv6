// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
	*reg = data;
}
uint32 mmio_read(volatile uint32* reg) {
	return *reg;
}

void uart0_init() {
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
	
	//Set pins 14 and 15 to value 100 (4) to enable alternate function 0
	//UART transmit/receive data
	uint32 func_sel_reg;
	func_sel_reg = *GPFSEL1;
	func_sel_reg &= ~(GPIO14 | GPIO15);
	func_sel_reg |= (4 << 12) | (4 << 15);
	mmio_write(GPFSEL1, func_sel_reg);

	// Set up GPPUD for GPIO 14/15
	// Reference: https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 101
	mmio_write(GPPUD, 0); // Disable pull
	delay(150);
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15)); // Pull down
	delay(150);
	mmio_write(GPPUDCLK0, 0); // Flush

	mmio_write(UART0_ICR, UART0_CLEAR_INTERRUPTS);
	mmio_write(UART0_IBRD, UART0_BAUD_115200); 
	mmio_write(UART0_FBRD, 0xB); // Fractional baud rate divisor
	mmio_write(UART0_LCRH, (UART0_LCRH_FIFO_EN | UART0_LCRH_8_BIT_WORD));
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
}

// Pushes a byte through the UART port
void uart0_send_char(char data) {
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
	mmio_write(UART0_DR, data);
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
