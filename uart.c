// Initialization for the UART devices in ARM
#include "MemoryMappedIO.h"
#include "types.h"

void uart_init() {
    // UART initialization
    *AUX_ENABLE |= 1;      // enable UART1, AUX mini uart (console)
    *AUX_MU_IER = 0;
    *AUX_MU_CNTL = 0;
    *AUX_MU_LCR = 3;       // 8 bits
    *AUX_MU_MCR = 0;
    *AUX_MU_IER = 0;
    *AUX_MU_IIR = 0xc6;    // disable interrupts
    *AUX_MU_BAUD = 270;    // 115200 baud

	// Map UART1 to GPIO 14/15 (UART transmit/receive data)
    uint32 func_sel_reg;
    func_sel_reg = *GPFSEL1;
    func_sel_reg &= ~(GPIO14 | GPIO15); 
    func_sel_reg |= (2<<12)|(2<<15);    // alt5
    *GPFSEL1 = func_sel_reg;

	// Set up GPPUD for GPIO 14/15
	// Reference: https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 101
    *GPPUD = 0;            
    uint32 counter;
    counter = 150; while(counter--) { asm volatile("nop"); }
    *GPPUDCLK0 = (1<<14)|(1<<15);
    counter = 150; while(counter--) { asm volatile("nop"); }
    *GPPUDCLK0 = 0;        // flush GPIO setup
    *AUX_MU_CNTL = 3;      // enable Tx, Rx
}

// Pushes a byte through the UART port
void uart_send_char(char data) {
	// Wait until status register says we can accept data
    do {
		asm volatile("nop");
	} while (!(*AUX_MU_LSR & LSR_CAN_ACCEPT));
    *AUX_MU_IO = data;
}

char uart_get_char() {
	// Wait until status register says there's something in the buffer
    do {
		asm volatile("nop");
	} while (!(*AUX_MU_LSR & LSR_DATA_READY));
	
	// Read it
    char data = (char)(*AUX_MU_IO & IO_REG_DATA_MASK);

	// Carraige return to newline
    return data == '\r' ? '\n' : data;
}

// Send a null-terminated string
void uart_put_str(char* s) {
	while (*s) {
        /* convert newline to carrige return + newline */
        if(*s == '\n') { uart_send_char('\r'); }
        uart_send_char(*s++);
    }
}
