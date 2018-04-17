// Mutual exclusion spin locks.

#include "arm_asm_intrinsics.h"
#include "proc.h"
#include "spinlock.h"
#include "utils.h"

void initlock(spinlock *lk, char *name) {
	lk->name = name;
	lk->locked = 0;
	lk->cpu = 0;
}

// Acquire the lock.
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void acquire(spinlock *lk) {
	pushcli(); // disable interrupts to avoid deadlock.
	if(holding(lk)) {
		panic("acquire");
	}

	//Atomically lock
	atomic_store(&lk->locked, 1);

	// Tell the C compiler and the processor to not move loads or stores
	// past this point, to ensure that the critical section's memory
	// references happen after the lock is acquired.
	__sync_synchronize();

	// Record info about lock acquisition for debugging.
	lk->cpu = mycpu();
}

// Release the lock.
void release(spinlock *lk) {
	if(!holding(lk)) {
		panic("release");
	}

	lk->cpu = 0;

	// Tell the C compiler and the processor to not move loads or stores
	// past this point, to ensure that all the stores in the critical
	// section are visible to other cores before the lock is released.
	// Both the C compiler and the hardware may re-order loads and
	// stores; __sync_synchronize() tells them both not to.
	__sync_synchronize();

	// Release the lock, equivalent to lk->locked = 0.
	// This code can't use a C assignment, since it might
	// not be atomic. A real OS would use C atomics here.
	atomic_store(&lk->locked, 0);

	popcli();
}

// Check whether this cpu is holding the lock.
int holding(spinlock *lock) {
	return lock->locked && lock->cpu == mycpu();
}

// Pushcli/popcli are like cli/sti except that they are matched:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
  int intena = interrupts_enabled();
  disable_interrupts();
	cpu *cpu = mycpu();
  if(cpu->ncli == 0)
    cpu->intena = intena;
  cpu->ncli += 1;
}

void
popcli(void)
{
  if(interrupts_enabled())
    panic("popcli - interruptible");
	cpu *cpu = mycpu();
  if(--cpu->ncli < 0)
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
    enable_interrupts();
}
