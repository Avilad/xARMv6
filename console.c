#include "mem_mapped_io.h"
#include "utils.h"
#include "uart.h"

//Formated printf-like print to the console
//Understands everything that sprintf does
void cprintf(const char *fmt, ...) {
	if (fmt) {
		char buf[1024];
		uart0_put_str(sprintf_no_var_args(buf, 1024, &fmt));
	} else {
		panic("null fmt passed to cprintf");
	}
}
