#include "types.h"
#include "console.h"
#include "syscall.h"
#include "utils.h"
#include "proc.h"
#include "memlayout.h"

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  proc *curproc = myproc();

  if(addr < USERBASE || addr >= curproc->sz + USERBASE || addr+4 > curproc->sz + USERBASE)
    return -1;
  *ip = *(int*)(addr);
  return 0;
}

// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;
  proc *curproc = myproc();

  if(addr < USERBASE || addr >= curproc->sz + USERBASE)
    return -1;
  *pp = (char*)addr;
  ep = (char*)(curproc->sz + USERBASE);
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
	if (n <= 3) {
		*ip = myproc()->tf->r[n];
		return 0;
	}
  return fetchint((myproc()->tf->sp) + 4*(n-4), ip);
}

// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
  int i;
  proc *curproc = myproc();

  if(argint(n, &i) < 0)
    return -1;

  if(size < 0 || (uint)i < USERBASE || (uint)i >= USERBASE + curproc->sz || (uint)i+size > USERBASE + curproc->sz)
    return -1;
  *pp = (char*)i;
  return 0;
}

// Fetch the nth word-sized system call argument as a string pointer.
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}

// int sys_test() {
// 	cprintf("Called test syscall\n");
// 	return 0;
// }

extern int sys_chdir(void);
extern int sys_close(void);
extern int sys_dup(void);
extern int sys_exec(void);
extern int sys_exit(void);
extern int sys_fork(void);
extern int sys_fstat(void);
extern int sys_getpid(void);
extern int sys_kill(void);
extern int sys_link(void);
extern int sys_mkdir(void);
extern int sys_mknod(void);
extern int sys_open(void);
extern int sys_pipe(void);
extern int sys_read(void);
extern int sys_sbrk(void);
extern int sys_sleep(void);
extern int sys_unlink(void);
extern int sys_wait(void);
extern int sys_write(void);
extern int sys_uptime(void);

static syscall_t syscalls[] = {
	// [SYS_test]    sys_test,
	[SYS_exit]    sys_exit,
	// [SYS_exec]    sys_exec,
};

void syscall(uint syscall_id) {
	if (syscall_id < array_len(syscalls)) {
		syscalls[syscall_id]();
	} else {
		cprintf("Unknown syscall %u.\n", syscall_id);
	}
}
