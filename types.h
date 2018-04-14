#ifndef TYPES_H
#define TYPES_H

typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;
typedef uint pde_t;

#define fox_for(iter, until) for(uint32 iter = 0; iter < (until); iter++)
#define KB 1024
#define MB 1024 * KB
#define GB (long)(1024 * MB)
#endif
