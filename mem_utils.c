//Useful memory functions like memcpy
#include "types.h"
#include "utils.h"

//Sets a region of memory
void* memset(void* destination, int val, uint count) {
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

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
		*dest++ = *src++;
	}
	return destination;
}

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, const void* source, uint size) {
	if (source == destination) {
		return destination;
	}
	if (destination < source) {
		return memcpy(destination, source, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
		*dest-- = *src--;
	}
	return destination;
}

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
		*dest++ = *src++;
	}
	return destination;
}

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* destination, const void* source_start, const void* source_end) {
	return memmove(destination, source_start, source_end - source_start);
}

//Copy null terminated source into destination which is at least dest_size in length
//dest_size includes the space for the null terminator
char* strncpy(char* destination, const char* source, uint dest_size) {
	if (dest_size < 1) {
		return nullptr;
	}
	char* dest_end = destination + dest_size - 1;
	while (*source
	       && destination != dest_end) {
		*destination++ = *source++;
	}
	*destination = 0;
	return destination;
}

int strncmp(const char *p, const char *q, uint size) {
  while(size > 0 && *p && *p == *q)
    size--, p++, q++;
  if(size == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}

int strlen(const char *s) {
  int n;
  for(n = 0; s[n]; n++)
    ;
  return n;
}

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
		*start++ = 0;
	}
	return mem_start;
}

//sprintf helper for writing unsigned ints
//returns false if buf is full
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
char* sprintf(char* buf, uint buf_size, const char* fmt, ...) {
	return sprintf_no_var_args(buf, buf_size, &fmt);
}

//C standard library function sprintf with buffer size specified
//This version can be called from within a var args function without pushing the arguments again
char* sprintf_no_var_args(char* buf, uint buf_size, const char** fmt_addr) {
	const char* fmt = *fmt_addr;
	if (!buf || !fmt || buf_size < 1) {
		return nullptr; //Need at least space for null terminator
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
