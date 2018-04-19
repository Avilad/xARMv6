#include "../types.h"
#include "../stat.h"
#include "../fcntl.h"
#include "user.h"

char*
strcpy(char *s, char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

void*
memset(void* destination, int val, uint count)
{
  if (count % 4) {
    count /= 4;
    val = val & 0xFF;
    val = val | val << 8 | val << 16 | val << 24;
    int* dest = (int*)destination;
  	while (count-- != 0) {
  		*dest++ = val;
  	}
  } else if (count % 2) {
    count /= 2;
    val = val & 0xFF;
    val = val | val << 8;
    ushort* dest = (ushort*)destination;
  	while (count-- != 0) {
  		*dest++ = (ushort)val;
  	}
  } else {
		uchar* dest = (uchar*)destination;
		while (count-- != 0) {
			*dest++ = (uchar)val;
		}
	}
  return destination;
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
}

char*
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}

int
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
  return vdst;
}

static char* write_uint(char* buf, char* buf_end, uint base, uint num) {
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
		uint idigit = 11;
		while (num) {
			uint digit = num % base;
			idigit--;
			num_buffer[idigit] = digits[digit];
			num /= base;
		}
		first_digit = &num_buffer[idigit];
	} else {
		num_buffer[10] = '0';
		first_digit = &num_buffer[10];
	}
	while (first_digit != &num_buffer[11]) {
		*buf++ = *first_digit++;
		if (buf == buf_end) {
			return buf;
		}
	}
	return buf;
}

//C standard library function sprintf with buffer size specified
//This version can be called from within a var args function without pushing the arguments again
char* sprintf_no_var_args(char* buf, uint buf_size, const char** fmt_addr) {
	const char* fmt = *fmt_addr;
	if (!buf || !fmt || buf_size < 1) {
		return 0; //Need at least space for null terminator
	}
	char* buf_start = buf;
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
	uint* var_args = (uint*)fmt_addr + 1;

	while (buf != buf_end
	       && *fmt) {
		if (*fmt != '%') {
			*buf++ = *fmt++;
		} else {
			fmt++;
			switch (*fmt) {
			case 0:
				return buf_start;
			case 'd':
			case 'D':
				{
					int num = *(int*)var_args;
					var_args++;
					if (num < 0) {
						*buf++ = '-';
						if (buf == buf_end) {
							return buf_start;
						}
						num = -num;
					}
					buf = write_uint(buf, buf_end, 10, (uint)num);
					break;
				}
			case 'x':
			case 'X':
				{
					uint num = *var_args++;
					buf = write_uint(buf, buf_end, 16, num);
					break;
				}
			case 'u':
			case 'U':
				{
					uint num = *var_args++;
					buf = write_uint(buf, buf_end, 10, num);
					break;
				}
			case 'c':
			case 'C':
				{
					char c = *var_args++;
					*buf++ = c;
					break;
				}
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
					var_args++;
					while (*insert
					       && buf != buf_end) {
						*buf++ = *insert++;
					}
					break;
				}
			default:
				*buf++ = '%';
				if (buf == buf_end) {
					return buf_start;
				}
				*buf++ = *fmt;
				break;
			}
			fmt++;
		}
	}
	*buf = 0; //Null terminate
	return buf_start;
}

//C standard library function sprintf with buffer size specified
char* snprintf(char* buf, uint buf_size, const char* fmt, ...) {
	return sprintf_no_var_args(buf, buf_size, &fmt);
}
