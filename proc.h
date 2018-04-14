#include "param.h"

enum procstate { UNUSED, EMBRYO, SLEEPING, RUNNABLE, RUNNING, ZOMBIE };

// Per-process state
struct proc {
	uint sz;                    // Size of process memory (bytes)
	pde_t* pgdir;               // Page table
	char *kstack;               // Bottom of kernel stack for this process
	enum procstate state;       // Process state
	int pid;                    // Process ID
	struct proc *parent;        // Parent process
	struct trap_frame *tf;      // Trap frame for current syscall
	struct trap_frame *context; // swtch() here to run process
                                // @todo void *chan; // If non-zero, sleeping on chan
	int killed;                 // If non-zero, have been killed
                                // @todo struct file *ofile[NOFILE]; // Open files
                                // @todo struct inode *cwd; // Current directory
	char name[16];              // Process name (debugging)
};

extern struct proc* cur_proc;
