#ifndef FS_H
#define FS_H

#include "fs_types.h"

// Functions

void   readsb(int dev, struct superblock *sb);
int    dirlink(inode*, char*, uint);
inode* dirlookup(inode*, char*, uint*);
inode* ialloc(uint, short);
inode* idup(inode*);
void   iinit(int dev);
void   ilock(inode*);
void   iput(inode*);
void   iunlock(inode*);
void   iunlockput(inode*);
void   iupdate(inode*);
int    namecmp(const char*, const char*);
inode* namei(char*);
inode* nameiparent(char*, char*);
int    readi(inode*, char*, uint, uint);
void   stati(inode*, struct stat*);
int    writei(inode*, char*, uint, uint);

#endif // FS_H
