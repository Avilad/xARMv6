#ifndef BUF_H
#define BUF_H

#include "fs.h"
#include "sleeplock.h"

typedef struct buf buf;
struct buf {
  int flags;
  uint dev;
  uint blockno;
  sleeplock lock;
  uint refcnt;
  buf *prev; // LRU cache list
  buf *next;
  buf *qnext; // disk queue
  uchar data[BSIZE];
};
#define B_VALID 0x2  // buffer has been read from disk
#define B_DIRTY 0x4  // buffer needs to be written to disk

#endif // BUF_H
