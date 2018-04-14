//Fixed length typedefs
#ifndef TYPES_H
#define TYPES_H

#include "stdint.h"

typedef int8_t int8;
typedef int16_t int16;
typedef int32_t int32;
typedef int64_t int64;

typedef uint8_t uint8;
typedef uint16_t uint16;
typedef uint32_t uint32;
typedef uint64_t uint64;

typedef int64 fint;
typedef uint64 fuint;

typedef uint8 bool8;
typedef uint16 bool16;
typedef uint32 bool32;
typedef uint64 bool64;

#define fox_for(iter, until) for(uint32 iter = 0; iter < (until); iter++)
#define KB 1024
#define MB 1024 * KB
#define GB (long)(1024 * MB)
#endif
