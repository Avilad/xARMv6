#ifndef SPINLOCK_H
#define SPINLOCK_H

#include "types.h"

typedef struct cpu cpu;

// Mutual exclusion lock.
typedef struct {
  uint locked; // Is the lock held?

  // For debugging:
  char *name;  // Name of lock.
  cpu *cpu;    // The cpu holding the lock.
} spinlock;

void acquire(spinlock*);
void getcallerpcs(void*, uint*);
int  holding(spinlock*);
void initlock(spinlock*, char*);
void release(spinlock*);
void pushcli(void);
void popcli(void);

#endif // SPINLOCK_H
