#ifndef TYPES_H
#define TYPES_H

typedef unsigned int   uint;
typedef unsigned short ushort;
typedef unsigned char  uchar;
typedef uint pde_t;
typedef uint pte_t;

#define fox_for(iter, until) for(uint iter = 0; iter < (until); iter++)
#define KB (1024U)
#define MB (1024U * KB)
#define GB (1024U * MB)

#endif
