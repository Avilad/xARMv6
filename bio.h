#ifndef BIO_H
#define BIO_H

#include "buf.h"

void binit(void);
buf* bread(uint, uint);
void brelse(buf*);
void bwrite(buf*);

#endif // BIO_H
