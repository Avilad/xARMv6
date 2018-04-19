#ifndef CONSOLE_C
#define CONSOLE_C

void consoleinit(void);
void cprintf(char*, ...);
void consoleintr(int(*)(void));
void panic(char*) __attribute__((noreturn));

#endif
