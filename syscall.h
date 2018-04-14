typedef int (*syscall_t)(void);

void syscall(uint syscall_no);

#define SYS_test 1
