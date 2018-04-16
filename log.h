#ifndef LOG_H
#define LOG_H

#include "buf.h"

void initlog(int dev);
void log_write(buf*);
void begin_op();
void end_op();

#endif // LOG_H
