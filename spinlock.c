// Mutual exclusion spin locks.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "spinlock.h"

void initlock(struct spinlock *lk, char *name) {
	lk->name = name;
	lk->locked = 0;
	lk->cpu = 0;
}

// Acquire the lock.
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void acquire(struct spinlock *lk) {
	disable_irq_interrupts(); // disable interrupts to avoid deadlock.
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
void release(struct spinlock *lk) {
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

	enable_irq_interrupts();
}

// Check whether this cpu is holding the lock.
int holding(struct spinlock *lock) {
	return lock->locked && lock->cpu == mycpu();
}
