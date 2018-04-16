#ifndef PROC_H
#define PROC_H

#include "param.h"
#include "types.h"
#include "arm.h"
#include "spinlock.h"
#include "file.h"

typedef trapframe context;
// context {
// 	trapframe tf;
// };

enum procstate { UNUSED, EMBRYO, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };

// Per-process state
typedef struct proc proc;
struct proc {
	uint sz;                     // Size of process memory (bytes)
	pde_t* pgdir;                // Page table
	char *kstack;                // Bottom of kernel stack for this process
	enum procstate state;        // Process state
	int pid;                     // Process ID
	proc *parent;         // Parent process
	trapframe *tf;        // Trap frame for current syscall
	context *context;     // swtch() here to run process
	void *chan;                  // If non-zero, sleeping on chan
	int killed;                  // If non-zero, have been killed
	file *ofile[NOFILE];  // Open files
	inode *cwd;           // Current directory
	char name[16];               // Process name (debugging)
};

// Per-CPU state
typedef struct cpu {
	// uchar apicid;                // Local APIC ID
	context *scheduler;   // swtch() here to enter scheduler
	// May need to replace these with ARM specific stuff?
	// struct taskstate ts;         // Used by x86 to find stack for interrupt
	// struct segdesc gdt[NSEGS];   // x86 global descriptor table
	volatile uint started;       // Has the CPU started?
	int ncli;                    // Depth of pushcli nesting.
	int intena;                  // Were interrupts enabled before pushcli?
	proc *proc;           // The process running on this cpu or null
} cpu;

extern cpu cpus[NCPU];
extern int ncpu;

// Process memory is laid out contiguously, low addresses first:
//   text
//   original data and bss
//   fixed-size stack
//   expandable heap

// Functions

int   cpuid(void);
void  exit(void);
int   fork(void);
int   growproc(int);
int   kill(int);
cpu*  mycpu(void);
proc* myproc();
void  pinit(void);
void  procdump(void);
void  scheduler(void) __attribute__((noreturn));
void  sched(void);
void  setproc(proc*);
void  sleep(void*, spinlock*);
void  userinit(void);
int   wait(void);
void  wakeup(void*);
void  yield(void);

#endif
