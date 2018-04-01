// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

//Control values
#define UART0_EMPTY 0x10
#define UART0_FULL 0x20
#define UART0_ENABLE_TX_RX_FIFO 0x301
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

void uart0_init() {
	//Temporarily disable uart 0
	*UART0_CR = 0;

	//Setup UART clock
	mailbox_message_buffer[0] = 8*4;
	mailbox_message_buffer[1] = MBOX_REQUEST;
	mailbox_message_buffer[2] = MBOX_TAG_SETCLKRATE; // set clock rate
	mailbox_message_buffer[3] = 12;                  // response buffer size
	mailbox_message_buffer[4] = 8;                   // request buffer size
	mailbox_message_buffer[5] = 2;                   // UART clock
	mailbox_message_buffer[6] = 4000000;             // 4Mhz
	mailbox_message_buffer[7] = MBOX_TAG_LAST;
	mailbox_send_message(MBOX_CH_PROP);

	//Set pins 14 and 15 to value 100 (4) to enable alternate function 0
	//UART transmit/receive data
	uint32 func_sel_reg;
	func_sel_reg = *GPFSEL1;
	func_sel_reg &= ~(GPIO14 | GPIO15);
	func_sel_reg |= (4 << 12) | (4 << 15);
	*GPFSEL1 = func_sel_reg;

	// Set up GPPUD for GPIO 14/15
	// Reference: https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 101
	*GPPUD = 0;
	uint32 counter;
	counter = 150; while(counter--) { asm volatile("nop"); }
	*GPPUDCLK0 = (1 << 14) | (1 << 15); //pull down
	counter = 150; while(counter--) { asm volatile("nop"); }
	*GPPUDCLK0 = 0;                     //Flush GPIO setup
	
	*UART0_ICR = UART0_CLEAR_INTERRUPTS; // clear interrupts
	*UART0_IBRD = UART0_BAUD_115200;     // set 115200 baud rate
	*UART0_FBRD = 0xB;                   //Fractional baud rate divisor
	*UART0_LCRH = 0b11 << 5;             // 8 bit word length
	*UART0_CR = UART0_ENABLE_TX_RX_FIFO;
}

// Pushes a byte through the UART port
void uart0_send_char(char data) {
    do {
	    asm volatile("nop");
    } while(*UART0_FR & UART0_FULL); //Wait until we can send
    *UART0_DR = data;
}

char uart0_get_char() {
    do {
	    asm volatile("nop");
    } while (*UART0_FR & UART0_EMPTY);
    
    char response = (char)(*UART0_DR);
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
