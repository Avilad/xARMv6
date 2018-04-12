#ifndef MEM_UTILS_H
#define MEM_UTILS_H
//Useful memory functions like memcpy

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, void* source, uint32 size) {
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
void* memmove(void* destination, void* source, uint32 size) {
	if (source == destination) {
		return destination;
	}
	if (destination < source) {
		return memcpy(source, destination, size);
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
void* memcpy_region(void* destination, void* source_start, void* source_end) {
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
void* memmove_region(void* source_start, void* source_end, void* destination) {
	return memmove(destination, source_start, source_end - source_start);
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
#endif
