#ifndef FILE_H
#define FILE_H

#define CONSOLE 1

#include "fs.h"
#include "sleeplock.h"

// in-memory copy of an inode
typedef struct inode {
  uint dev;       // Device number
  uint inum;      // Inode number
  int ref;        // Reference count
  sleeplock lock; // protects everything below here
  int valid;      // inode has been read from disk?

  short type;     // copy of disk inode
  short major;
  short minor;
  short nlink;
  uint size;
  uint addrs[NDIRECT+1];
} inode;

typedef struct pipe pipe;
typedef struct {
  enum { FD_NONE, FD_PIPE, FD_INODE } type;
  int ref; // reference count
  char readable;
  char writable;
  pipe *pipe;
  inode *ip;
  uint off;
} file;

// table mapping major device number to
// device functions
struct devsw {
  int (*read)(inode*, char*, int);
  int (*write)(inode*, char*, int);
};

extern struct devsw devsw[];

// Functions

file* filealloc(void);
void  fileclose(file*);
file* filedup(file*);
void  fileinit(void);
int   fileread(file*, char*, int n);
int   filestat(file*, struct stat*);
int   filewrite(file*, char*, int n);

#endif // FILE_H
