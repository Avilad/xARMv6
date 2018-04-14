//Panic function along with the function called when an assert is triggered
#include "utils.h"
#include "mem_mapped_io.h" //For UART

void panic(char* msg) {
	static const char panic_msg_start[] = "panic: ";
	cprintf("Panic'd: %s", msg);
	while (true) {}
}

void trigger_assert(const char* expr_str, const char* file_name, uint line_number, const char* func_name) {
	char msg[4096];
	sprintf(msg,
	        4096,
	        "Assertion triggered\nExpression %s\nFile %s\nLine %u\nFunction %s\n",
	        expr_str,
	        file_name,
	        line_number,
	        func_name);
	panic(msg);
}
