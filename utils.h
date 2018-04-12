#ifndef UTILS_H
#define UTILS_H

#include "types.h"

//---Macro utilities
#define assert(bool_expr) if (!(bool_expr)) { trigger_assert(#bool_expr, __FILE__, __LINE__, __func__); }
#define true 1
#define false 0
#define nullptr 0
#define array_len(a) (sizeof(a) / sizeof((a)[0]))

void trigger_assert(const char* expr_str, const char* file_name, uint32 line_number, const char* func_name);
void panic(char* s);
char* sprintf(char* buf, uint32 buf_size, const char* fmt, ...);
void* memcpy(void* destination, const void* source, uint32 size);
void* memmove(void* destination, const void* source, uint32 size);
void* memcpy_region(void* destination, const void* source_start, const void* source_end);
void* memmove_region(void* destination, const void* source_start, const void* source_end);
char* strcpy(char* destination, const char* source, uint32 dest_size);
void* zero_region(void* mem_start, void* mem_end);

#endif
