#ifndef __ASSEMBLER__
typedef int (*syscall_t)(void);
void syscall(uint syscall_no);
#endif

#define SYS_test 1
