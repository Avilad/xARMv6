#ifndef PIPE_H
#define PIPE_H

#define PIPESIZE 512

#include "file.h"

typedef struct pipe {
  spinlock lock;
  char data[PIPESIZE];
  uint nread;     // number of bytes read
  uint nwrite;    // number of bytes written
  int readopen;   // read fd is still open
  int writeopen;  // write fd is still open
} pipe;

// Functions

int  pipealloc(file**, file**);
void pipeclose(pipe*, int);
int  piperead(pipe*, char*, int);
int  pipewrite(pipe*, char*, int);

#endif
