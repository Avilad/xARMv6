#include "uart0.h"

void c_main(void)
{
	uart0_init();
	uart0_put_str("Hello, world!");
	while (1) {
		uart0_send_char(uart0_get_char());
	}
}
