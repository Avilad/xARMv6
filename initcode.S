// Initial process execs /init.
// This code runs in user space.

#include "syscall.h"

.globl start
start:
  @ ldr r0, =init
  @ ldr r1, =argv
  @ svc #SYS_exec

// for(;;) exit();
exit:
  svc #SYS_exit
  b exit

// char init[] = "/init\0";
init:
  .string "/init\0"

// char *argv[] = { init, 0 };
argv:
  .word init
  .word 0
