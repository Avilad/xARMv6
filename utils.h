#ifndef UTILS_H
#define UTILS_H

#include "types.h"

//---Macro utilities
#define assert(bool_expr) if (!(bool_expr)) { trigger_assert(#bool_expr, __FILE__, __LINE__, __func__); }
#define true 1
#define false 0
#define nullptr 0
#define array_len(a) (sizeof(a) / sizeof((a)[0]))
#define min(a, b) ((a) < (b) ? (a) : (b))

void  trigger_assert(const char* expr_str, const char* file_name, uint line_number, const char* func_name);
void  panic(char* s) __attribute__((noreturn));
char* sprintf(char* buf, uint buf_size, const char* fmt, ...);
char* sprintf_no_var_args(char* buf, uint buf_size, const char** fmt_addr);
void* memset(void* destination, int val, uint count);
void* memcpy(void* destination, const void* source, uint size);
void* memmove(void* destination, const void* source, uint size);
void* memcpy_region(void* destination, const void* source_start, const void* source_end);
void* memmove_region(void* destination, const void* source_start, const void* source_end);
char* strncpy(char* destination, const char* source, uint size);
int strncmp(const char *p, const char *q, uint size);
void* zero_region(void* mem_start, void* mem_end);
void* zero(void* mem, uint size);

#define zero_section(section) zero_region((section), (section) + MB)

#endif
