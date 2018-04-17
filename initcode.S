// Initial process execs /init.
// This code runs in user space.

#include "syscall.h"

.globl start
start:
  ldr r0, =init
  ldr r1, =argv
  svc #SYS_test

// for(;;) exit();
exit:
  @ movl $SYS_exit, %eax
  @ int $T_SYSCALL
  b exit

// char init[] = "/init\0";
init:
  .string "/init\0"

// char *argv[] = { init, 0 };
argv:
  .word init
  .word 0
