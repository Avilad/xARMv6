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

int sys_test() {
	cprintf("Called test syscall\n");
	return 0;
}

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
	[0]           sys_test,
  [SYS_fork]    sys_fork,
  [SYS_exit]    sys_exit,
  [SYS_wait]    sys_wait,
  //[SYS_pipe]    sys_pipe,
  [SYS_read]    sys_read,
  [SYS_kill]    sys_kill,
  [SYS_exec]    sys_exec,
  [SYS_fstat]   sys_fstat,
  //[SYS_chdir]   sys_chdir,
  [SYS_dup]     sys_dup,
  [SYS_getpid]  sys_getpid,
  [SYS_sbrk]    sys_sbrk,
  [SYS_sleep]   sys_sleep,
  [SYS_uptime]  sys_uptime,
  [SYS_open]    sys_open,
  [SYS_write]   sys_write,
  [SYS_mknod]   sys_mknod,
  //[SYS_unlink]  sys_unlink,
  //[SYS_link]    sys_link,
  //[SYS_mkdir]   sys_mkdir,
  [SYS_close]   sys_close,
};

void syscall(uint syscall_id) {
	if (syscall_id < array_len(syscalls)) {
    syscall_t handler = syscalls[syscall_id];
    if (handler) {
      myproc()->tf->r[0] = handler();
    } else {
      cprintf("Unimplemented syscall #%d\n", syscall_id);
    }
	} else {
		cprintf("Unknown syscall %d.\n", syscall_id);
	}
}
