#ifndef IDE_H
#define IDE_H

#include "buf.h"

void ideinit(void);
void ideintr(void);
void iderw(buf*);

#endif
