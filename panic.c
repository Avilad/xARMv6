//Panic function along with the function called when an assert is triggered
#include "utils.h"
#include "mem_mapped_io.h" //For UART

void panic(char* msg) {
	static const char panic_msg_start[] = "panic: ";
	char buf[4096];
	//The -1/+1 is to account for the null terminator
	memcpy(buf, panic_msg_start, sizeof(panic_msg_start) - 1);
	strcpy(buf + sizeof(panic_msg_start) - 1, msg, 4096 - sizeof(panic_msg_start) + 1);
	uart0_put_str(buf);
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
