#include "mem_mapped_io.h"

void c_main(void)
{
	uart0_init();
	uart0_put_str("Hello, world!\0");
	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
