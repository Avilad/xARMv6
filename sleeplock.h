#ifndef SLEEPLOCK_H
#define SLEEPLOCK_H

#include "spinlock.h"

// Long-term locks for processes
typedef struct {
  uint locked;       // Is the lock held?
  spinlock lk; // spinlock protecting this sleep lock

  // For debugging:
  char *name;        // Name of lock.
  int pid;           // Process holding lock
} sleeplock;

void            acquiresleep(sleeplock*);
void            releasesleep(sleeplock*);
int             holdingsleep(sleeplock*);
void            initsleeplock(sleeplock*, char*);

#endif // SLEEPLOCK_H
