#include "types.h"
#include "console.h"
#include "syscall.h"
#include "utils.h"

int sys_test() {
	cprintf("Called sys test\n");
	return 0;
}

static syscall_t syscalls[] = {
[SYS_test] sys_test
};

void syscall(uint syscall_id) {
	if (syscall_id < array_len(syscalls)) {
		cprintf("Calling %u syscall.\n", syscall_id);
		syscalls[syscall_id]();
	} else {
		cprintf("Unknown syscall %u.\n", syscall_id);
	}
}
