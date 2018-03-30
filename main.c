#include "uart.h"

void c_main(void)
{
	uart_init();
	uart_put_str("Hello, world!");
	while (1);
}
