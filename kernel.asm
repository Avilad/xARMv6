
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00010000 <_start>:
   10000:	ee100fb0 	mrc	15, 0, r0, cr0, cr0, {5}
   10004:	e2100003 	ands	r0, r0, #3
   10008:	1a000010 	bne	10050 <loop_forever>
   1000c:	e32ff0d1 	msr	CPSR_fsxc, #209	; 0xd1
   10010:	e59f0040 	ldr	r0, [pc, #64]	; 10058 <loop_forever+0x8>
   10014:	e3a01a01 	mov	r1, #4096	; 0x1000
   10018:	e1a0d000 	mov	sp, r0
   1001c:	e32ff0d2 	msr	CPSR_fsxc, #210	; 0xd2
   10020:	e0800001 	add	r0, r0, r1
   10024:	e1a0d000 	mov	sp, r0
   10028:	e32ff0d7 	msr	CPSR_fsxc, #215	; 0xd7
   1002c:	e0800001 	add	r0, r0, r1
   10030:	e1a0d000 	mov	sp, r0
   10034:	e32ff0db 	msr	CPSR_fsxc, #219	; 0xdb
   10038:	e0800001 	add	r0, r0, r1
   1003c:	e1a0d000 	mov	sp, r0
   10040:	e32ff0d3 	msr	CPSR_fsxc, #211	; 0xd3
   10044:	e59f0010 	ldr	r0, [pc, #16]	; 1005c <loop_forever+0xc>
   10048:	e1a0d000 	mov	sp, r0
   1004c:	eb0000f0 	bl	10414 <kmain>

00010050 <loop_forever>:
   10050:	e320f002 	wfe
   10054:	eafffffd 	b	10050 <loop_forever>
   10058:	00011000 	.word	0x00011000
   1005c:	00010000 	.word	0x00010000

00010060 <linker_vector_table_start>:
   10060:	eaffffe6 	b	10000 <_start>
   10064:	e59ff02c 	ldr	pc, [pc, #44]	; 10098 <undefined_instruction_handler_asm>
   10068:	e59ff048 	ldr	pc, [pc, #72]	; 100b8 <software_interrupt_handler_asm>
   1006c:	e59ff064 	ldr	pc, [pc, #100]	; 100d8 <prefetch_abort_handler_asm>
   10070:	e59ff080 	ldr	pc, [pc, #128]	; 100f8 <data_abort_handler_asm>
   10074:	e59ff09c 	ldr	pc, [pc, #156]	; 10118 <unused_exception_handler_asm>
   10078:	e59ff0b8 	ldr	pc, [pc, #184]	; 10138 <irq_handler_asm>

0001007c <fiq_handler_asm>:
   1007c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10080:	e14f2000 	mrs	r2, SPSR
   10084:	e92d0004 	stmfd	sp!, {r2}
   10088:	e94d6000 	stmdb	sp, {sp, lr}^
   1008c:	e24dd008 	sub	sp, sp, #8
   10090:	eb00020b 	bl	108c4 <fiq_handler>
   10094:	ea00002e 	b	10154 <trap_return>

00010098 <undefined_instruction_handler_asm>:
   10098:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1009c:	e14f2000 	mrs	r2, SPSR
   100a0:	e92d0004 	stmfd	sp!, {r2}
   100a4:	e94d6000 	stmdb	sp, {sp, lr}^
   100a8:	e24dd008 	sub	sp, sp, #8
   100ac:	e1a0000d 	mov	r0, sp
   100b0:	eb0001d9 	bl	1081c <undefined_instruction_handler>
   100b4:	ea000026 	b	10154 <trap_return>

000100b8 <software_interrupt_handler_asm>:
   100b8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100bc:	e14f2000 	mrs	r2, SPSR
   100c0:	e92d0004 	stmfd	sp!, {r2}
   100c4:	e94d6000 	stmdb	sp, {sp, lr}^
   100c8:	e24dd008 	sub	sp, sp, #8
   100cc:	e1a0000d 	mov	r0, sp
   100d0:	eb0001d8 	bl	10838 <software_interrupt_handler>
   100d4:	ea00001e 	b	10154 <trap_return>

000100d8 <prefetch_abort_handler_asm>:
   100d8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100dc:	e14f2000 	mrs	r2, SPSR
   100e0:	e92d0004 	stmfd	sp!, {r2}
   100e4:	e94d6000 	stmdb	sp, {sp, lr}^
   100e8:	e24dd008 	sub	sp, sp, #8
   100ec:	e1a0000d 	mov	r0, sp
   100f0:	eb0001d7 	bl	10854 <prefetch_abort_handler>
   100f4:	ea000016 	b	10154 <trap_return>

000100f8 <data_abort_handler_asm>:
   100f8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100fc:	e14f2000 	mrs	r2, SPSR
   10100:	e92d0004 	stmfd	sp!, {r2}
   10104:	e94d6000 	stmdb	sp, {sp, lr}^
   10108:	e24dd008 	sub	sp, sp, #8
   1010c:	e1a0000d 	mov	r0, sp
   10110:	eb0001d6 	bl	10870 <data_abort_handler>
   10114:	ea00000e 	b	10154 <trap_return>

00010118 <unused_exception_handler_asm>:
   10118:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1011c:	e14f2000 	mrs	r2, SPSR
   10120:	e92d0004 	stmfd	sp!, {r2}
   10124:	e94d6000 	stmdb	sp, {sp, lr}^
   10128:	e24dd008 	sub	sp, sp, #8
   1012c:	e1a0000d 	mov	r0, sp
   10130:	ebfffff8 	bl	10118 <unused_exception_handler_asm>
   10134:	ea000006 	b	10154 <trap_return>

00010138 <irq_handler_asm>:
   10138:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1013c:	e14f2000 	mrs	r2, SPSR
   10140:	e92d0004 	stmfd	sp!, {r2}
   10144:	e94d6000 	stmdb	sp, {sp, lr}^
   10148:	e24dd008 	sub	sp, sp, #8
   1014c:	e1a0000d 	mov	r0, sp
   10150:	eb0001d4 	bl	108a8 <irq_handler>

00010154 <trap_return>:
   10154:	e8dd6000 	ldm	sp, {sp, lr}^
   10158:	e28dd008 	add	sp, sp, #8
   1015c:	e8bd0004 	ldmfd	sp!, {r2}
   10160:	e16ff002 	msr	SPSR_fsxc, r2
   10164:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

00010168 <set_operating_mode>:
#define ARM_ASM_INTRINSICS_H
//Helpful arm assembly intrinsics

//Set the current processor operating mode,
//mode_bit should be one of the PSR mode defines in arm.h
void set_operating_mode(uint32 mode_bit) {
   10168:	e92d0810 	push	{r4, fp}
   1016c:	e28db004 	add	fp, sp, #4
   10170:	e24dd008 	sub	sp, sp, #8
   10174:	e50b0008 	str	r0, [fp, #-8]
	register uint32 cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
   10178:	e10f3000 	mrs	r3, CPSR
   1017c:	e1a04003 	mov	r4, r3
	              : [cpsr_out] "=r" (cur_cpsr));
	cur_cpsr = cur_cpsr & (~PSR_MODE_MASK | mode_bit);
   10180:	e51b3008 	ldr	r3, [fp, #-8]
   10184:	e1e03d83 	mvn	r3, r3, lsl #27
   10188:	e1e03da3 	mvn	r3, r3, lsr #27
   1018c:	e0044003 	and	r4, r4, r3
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
   10190:	e12ff004 	msr	CPSR_fsxc, r4
	              : //No output
	              : [cpsr_in] "r" (cur_cpsr));
}
   10194:	e24bd004 	sub	sp, fp, #4
   10198:	e8bd0810 	pop	{r4, fp}
   1019c:	e12fff1e 	bx	lr

000101a0 <memcpy>:
#define MEM_UTILS_H
//Useful memory functions like memcpy

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, void* source, uint32 size) {
   101a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   101a4:	e28db000 	add	fp, sp, #0
   101a8:	e24dd024 	sub	sp, sp, #36	; 0x24
   101ac:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   101b0:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   101b4:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   101b8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   101bc:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   101c0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   101c4:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   101c8:	e51b200c 	ldr	r2, [fp, #-12]
   101cc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   101d0:	e0823003 	add	r3, r2, r3
   101d4:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   101d8:	ea000007 	b	101fc <memcpy+0x5c>
		*dest++ = *src++;
   101dc:	e51b3008 	ldr	r3, [fp, #-8]
   101e0:	e2832001 	add	r2, r3, #1
   101e4:	e50b2008 	str	r2, [fp, #-8]
   101e8:	e51b200c 	ldr	r2, [fp, #-12]
   101ec:	e2821001 	add	r1, r2, #1
   101f0:	e50b100c 	str	r1, [fp, #-12]
   101f4:	e5d22000 	ldrb	r2, [r2]
   101f8:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, void* source, uint32 size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   101fc:	e51b200c 	ldr	r2, [fp, #-12]
   10200:	e51b3010 	ldr	r3, [fp, #-16]
   10204:	e1520003 	cmp	r2, r3
   10208:	1afffff3 	bne	101dc <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   1020c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10210:	e1a00003 	mov	r0, r3
   10214:	e24bd000 	sub	sp, fp, #0
   10218:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1021c:	e12fff1e 	bx	lr

00010220 <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, void* source, uint32 size) {
   10220:	e92d4800 	push	{fp, lr}
   10224:	e28db004 	add	fp, sp, #4
   10228:	e24dd020 	sub	sp, sp, #32
   1022c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10230:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10234:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   10238:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   1023c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10240:	e1520003 	cmp	r2, r3
   10244:	1a000001 	bne	10250 <memmove+0x30>
		return destination;
   10248:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   1024c:	ea000024 	b	102e4 <memmove+0xc4>
	}
	if (destination < source) {
   10250:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   10254:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10258:	e1520003 	cmp	r2, r3
   1025c:	2a000005 	bcs	10278 <memmove+0x58>
		return memcpy(source, destination, size);
   10260:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
   10264:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10268:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   1026c:	ebffffcb 	bl	101a0 <memcpy>
   10270:	e1a03000 	mov	r3, r0
   10274:	ea00001a 	b	102e4 <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   10278:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   1027c:	e2433001 	sub	r3, r3, #1
   10280:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   10284:	e0823003 	add	r3, r2, r3
   10288:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   1028c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10290:	e2433001 	sub	r3, r3, #1
   10294:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10298:	e0823003 	add	r3, r2, r3
   1029c:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   102a0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   102a4:	e2433001 	sub	r3, r3, #1
   102a8:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   102ac:	ea000007 	b	102d0 <memmove+0xb0>
		*dest-- = *src--;
   102b0:	e51b3008 	ldr	r3, [fp, #-8]
   102b4:	e2432001 	sub	r2, r3, #1
   102b8:	e50b2008 	str	r2, [fp, #-8]
   102bc:	e51b200c 	ldr	r2, [fp, #-12]
   102c0:	e2421001 	sub	r1, r2, #1
   102c4:	e50b100c 	str	r1, [fp, #-12]
   102c8:	e5d22000 	ldrb	r2, [r2]
   102cc:	e5c32000 	strb	r2, [r3]
		return memcpy(source, destination, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   102d0:	e51b200c 	ldr	r2, [fp, #-12]
   102d4:	e51b3010 	ldr	r3, [fp, #-16]
   102d8:	e1520003 	cmp	r2, r3
   102dc:	1afffff3 	bne	102b0 <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   102e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   102e4:	e1a00003 	mov	r0, r3
   102e8:	e24bd004 	sub	sp, fp, #4
   102ec:	e8bd4800 	pop	{fp, lr}
   102f0:	e12fff1e 	bx	lr

000102f4 <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, void* source_start, void* source_end) {
   102f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   102f8:	e28db000 	add	fp, sp, #0
   102fc:	e24dd024 	sub	sp, sp, #36	; 0x24
   10300:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10304:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10308:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   1030c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10310:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   10314:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10318:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   1031c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10320:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10324:	ea000007 	b	10348 <memcpy_region+0x54>
		*dest++ = *src++;
   10328:	e51b3008 	ldr	r3, [fp, #-8]
   1032c:	e2832001 	add	r2, r3, #1
   10330:	e50b2008 	str	r2, [fp, #-8]
   10334:	e51b200c 	ldr	r2, [fp, #-12]
   10338:	e2821001 	add	r1, r2, #1
   1033c:	e50b100c 	str	r1, [fp, #-12]
   10340:	e5d22000 	ldrb	r2, [r2]
   10344:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, void* source_start, void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   10348:	e51b200c 	ldr	r2, [fp, #-12]
   1034c:	e51b3010 	ldr	r3, [fp, #-16]
   10350:	e1520003 	cmp	r2, r3
   10354:	1afffff3 	bne	10328 <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   10358:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   1035c:	e1a00003 	mov	r0, r3
   10360:	e24bd000 	sub	sp, fp, #0
   10364:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10368:	e12fff1e 	bx	lr

0001036c <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* source_start, void* source_end, void* destination) {
   1036c:	e92d4800 	push	{fp, lr}
   10370:	e28db004 	add	fp, sp, #4
   10374:	e24dd010 	sub	sp, sp, #16
   10378:	e50b0008 	str	r0, [fp, #-8]
   1037c:	e50b100c 	str	r1, [fp, #-12]
   10380:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   10384:	e51b200c 	ldr	r2, [fp, #-12]
   10388:	e51b3008 	ldr	r3, [fp, #-8]
   1038c:	e0633002 	rsb	r3, r3, r2
   10390:	e51b0010 	ldr	r0, [fp, #-16]
   10394:	e51b1008 	ldr	r1, [fp, #-8]
   10398:	e1a02003 	mov	r2, r3
   1039c:	ebffff9f 	bl	10220 <memmove>
   103a0:	e1a03000 	mov	r3, r0
}
   103a4:	e1a00003 	mov	r0, r3
   103a8:	e24bd004 	sub	sp, fp, #4
   103ac:	e8bd4800 	pop	{fp, lr}
   103b0:	e12fff1e 	bx	lr

000103b4 <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   103b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   103b8:	e28db000 	add	fp, sp, #0
   103bc:	e24dd014 	sub	sp, sp, #20
   103c0:	e50b0010 	str	r0, [fp, #-16]
   103c4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   103c8:	e51b3010 	ldr	r3, [fp, #-16]
   103cc:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   103d0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   103d4:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   103d8:	ea000004 	b	103f0 <zero_region+0x3c>
		*start++ = 0;
   103dc:	e51b3008 	ldr	r3, [fp, #-8]
   103e0:	e2832001 	add	r2, r3, #1
   103e4:	e50b2008 	str	r2, [fp, #-8]
   103e8:	e3a02000 	mov	r2, #0
   103ec:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   103f0:	e51b2008 	ldr	r2, [fp, #-8]
   103f4:	e51b300c 	ldr	r3, [fp, #-12]
   103f8:	e1520003 	cmp	r2, r3
   103fc:	1afffff6 	bne	103dc <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   10400:	e51b3010 	ldr	r3, [fp, #-16]
}
   10404:	e1a00003 	mov	r0, r3
   10408:	e24bd000 	sub	sp, fp, #0
   1040c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10410:	e12fff1e 	bx	lr

00010414 <kmain>:
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];

void kmain(void) {
   10414:	e92d4800 	push	{fp, lr}
   10418:	e28db004 	add	fp, sp, #4
	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
   1041c:	e3a00000 	mov	r0, #0
   10420:	e59f1030 	ldr	r1, [pc, #48]	; 10458 <kmain+0x44>
   10424:	e59f2030 	ldr	r2, [pc, #48]	; 1045c <kmain+0x48>
   10428:	ebffffb1 	bl	102f4 <memcpy_region>
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   1042c:	e59f002c 	ldr	r0, [pc, #44]	; 10460 <kmain+0x4c>
   10430:	e59f102c 	ldr	r1, [pc, #44]	; 10464 <kmain+0x50>
   10434:	ebffffde 	bl	103b4 <zero_region>

	//---UART initialization
	uart0_init();
   10438:	eb000020 	bl	104c0 <uart0_init>
	uart0_put_str("Hello, world!\0");
   1043c:	e59f0024 	ldr	r0, [pc, #36]	; 10468 <kmain+0x54>
   10440:	eb0000a1 	bl	106cc <uart0_put_str>
	while (1) {
		uart0_send_char(uart0_get_char());
   10444:	eb000086 	bl	10664 <uart0_get_char>
   10448:	e1a03000 	mov	r3, r0
   1044c:	e1a00003 	mov	r0, r3
   10450:	eb000061 	bl	105dc <uart0_send_char>
	}
   10454:	eafffffa 	b	10444 <kmain+0x30>
   10458:	00010060 	.word	0x00010060
   1045c:	00010168 	.word	0x00010168
   10460:	00015000 	.word	0x00015000
   10464:	000150a0 	.word	0x000150a0
   10468:	000108e0 	.word	0x000108e0

0001046c <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   1046c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10470:	e28db000 	add	fp, sp, #0
   10474:	e24dd00c 	sub	sp, sp, #12
   10478:	e50b0008 	str	r0, [fp, #-8]
   1047c:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   10480:	e51b3008 	ldr	r3, [fp, #-8]
   10484:	e51b200c 	ldr	r2, [fp, #-12]
   10488:	e5832000 	str	r2, [r3]
}
   1048c:	e24bd000 	sub	sp, fp, #0
   10490:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10494:	e12fff1e 	bx	lr

00010498 <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   10498:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1049c:	e28db000 	add	fp, sp, #0
   104a0:	e24dd00c 	sub	sp, sp, #12
   104a4:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   104a8:	e51b3008 	ldr	r3, [fp, #-8]
   104ac:	e5933000 	ldr	r3, [r3]
}
   104b0:	e1a00003 	mov	r0, r3
   104b4:	e24bd000 	sub	sp, fp, #0
   104b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   104bc:	e12fff1e 	bx	lr

000104c0 <uart0_init>:

void uart0_init() {
   104c0:	e92d4800 	push	{fp, lr}
   104c4:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   104c8:	e59f00dc 	ldr	r0, [pc, #220]	; 105ac <uart0_init+0xec>
   104cc:	e3a01000 	mov	r1, #0
   104d0:	ebffffe5 	bl	1046c <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   104d4:	e59f00d4 	ldr	r0, [pc, #212]	; 105b0 <uart0_init+0xf0>
   104d8:	e3a01000 	mov	r1, #0
   104dc:	ebffffe2 	bl	1046c <mmio_write>
	delay(150);
   104e0:	e59f30cc 	ldr	r3, [pc, #204]	; 105b4 <uart0_init+0xf4>
   104e4:	e3a02096 	mov	r2, #150	; 0x96
   104e8:	e5832000 	str	r2, [r3]
   104ec:	ea000000 	b	104f4 <uart0_init+0x34>
   104f0:	e1a00000 	nop			; (mov r0, r0)
   104f4:	e59f30b8 	ldr	r3, [pc, #184]	; 105b4 <uart0_init+0xf4>
   104f8:	e5933000 	ldr	r3, [r3]
   104fc:	e2432001 	sub	r2, r3, #1
   10500:	e59f10ac 	ldr	r1, [pc, #172]	; 105b4 <uart0_init+0xf4>
   10504:	e5812000 	str	r2, [r1]
   10508:	e3530000 	cmp	r3, #0
   1050c:	1afffff7 	bne	104f0 <uart0_init+0x30>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   10510:	e59f00a0 	ldr	r0, [pc, #160]	; 105b8 <uart0_init+0xf8>
   10514:	e3a01903 	mov	r1, #49152	; 0xc000
   10518:	ebffffd3 	bl	1046c <mmio_write>
	delay(150);
   1051c:	e59f3090 	ldr	r3, [pc, #144]	; 105b4 <uart0_init+0xf4>
   10520:	e3a02096 	mov	r2, #150	; 0x96
   10524:	e5832000 	str	r2, [r3]
   10528:	ea000000 	b	10530 <uart0_init+0x70>
   1052c:	e1a00000 	nop			; (mov r0, r0)
   10530:	e59f307c 	ldr	r3, [pc, #124]	; 105b4 <uart0_init+0xf4>
   10534:	e5933000 	ldr	r3, [r3]
   10538:	e2432001 	sub	r2, r3, #1
   1053c:	e59f1070 	ldr	r1, [pc, #112]	; 105b4 <uart0_init+0xf4>
   10540:	e5812000 	str	r2, [r1]
   10544:	e3530000 	cmp	r3, #0
   10548:	1afffff7 	bne	1052c <uart0_init+0x6c>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   1054c:	e59f0064 	ldr	r0, [pc, #100]	; 105b8 <uart0_init+0xf8>
   10550:	e3a01000 	mov	r1, #0
   10554:	ebffffc4 	bl	1046c <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10558:	e59f005c 	ldr	r0, [pc, #92]	; 105bc <uart0_init+0xfc>
   1055c:	e59f105c 	ldr	r1, [pc, #92]	; 105c0 <uart0_init+0x100>
   10560:	ebffffc1 	bl	1046c <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   10564:	e59f0058 	ldr	r0, [pc, #88]	; 105c4 <uart0_init+0x104>
   10568:	e3a01001 	mov	r1, #1
   1056c:	ebffffbe 	bl	1046c <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   10570:	e59f0050 	ldr	r0, [pc, #80]	; 105c8 <uart0_init+0x108>
   10574:	e3a01028 	mov	r1, #40	; 0x28
   10578:	ebffffbb 	bl	1046c <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   1057c:	e59f0048 	ldr	r0, [pc, #72]	; 105cc <uart0_init+0x10c>
   10580:	e3a01070 	mov	r1, #112	; 0x70
   10584:	ebffffb8 	bl	1046c <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   10588:	e59f0040 	ldr	r0, [pc, #64]	; 105d0 <uart0_init+0x110>
   1058c:	e59f1040 	ldr	r1, [pc, #64]	; 105d4 <uart0_init+0x114>
   10590:	ebffffb5 	bl	1046c <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   10594:	e59f0010 	ldr	r0, [pc, #16]	; 105ac <uart0_init+0xec>
   10598:	e59f1038 	ldr	r1, [pc, #56]	; 105d8 <uart0_init+0x118>
   1059c:	ebffffb2 	bl	1046c <mmio_write>
#endif
}
   105a0:	e24bd004 	sub	sp, fp, #4
   105a4:	e8bd4800 	pop	{fp, lr}
   105a8:	e12fff1e 	bx	lr
   105ac:	3f201030 	.word	0x3f201030
   105b0:	3f200094 	.word	0x3f200094
   105b4:	00015000 	.word	0x00015000
   105b8:	3f200098 	.word	0x3f200098
   105bc:	3f201044 	.word	0x3f201044
   105c0:	000007ff 	.word	0x000007ff
   105c4:	3f201024 	.word	0x3f201024
   105c8:	3f201028 	.word	0x3f201028
   105cc:	3f20102c 	.word	0x3f20102c
   105d0:	3f201038 	.word	0x3f201038
   105d4:	000007f2 	.word	0x000007f2
   105d8:	00000301 	.word	0x00000301

000105dc <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   105dc:	e92d4800 	push	{fp, lr}
   105e0:	e28db004 	add	fp, sp, #4
   105e4:	e24dd008 	sub	sp, sp, #8
   105e8:	e1a03000 	mov	r3, r0
   105ec:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   105f0:	e1a00000 	nop			; (mov r0, r0)
   105f4:	e59f005c 	ldr	r0, [pc, #92]	; 10658 <uart0_send_char+0x7c>
   105f8:	ebffffa6 	bl	10498 <mmio_read>
   105fc:	e1a03000 	mov	r3, r0
   10600:	e2033020 	and	r3, r3, #32
   10604:	e3530000 	cmp	r3, #0
   10608:	1afffff9 	bne	105f4 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   1060c:	e55b3005 	ldrb	r3, [fp, #-5]
   10610:	e59f0044 	ldr	r0, [pc, #68]	; 1065c <uart0_send_char+0x80>
   10614:	e1a01003 	mov	r1, r3
   10618:	ebffff93 	bl	1046c <mmio_write>
	delay(150);
   1061c:	e59f303c 	ldr	r3, [pc, #60]	; 10660 <uart0_send_char+0x84>
   10620:	e3a02096 	mov	r2, #150	; 0x96
   10624:	e5832000 	str	r2, [r3]
   10628:	ea000000 	b	10630 <uart0_send_char+0x54>
   1062c:	e1a00000 	nop			; (mov r0, r0)
   10630:	e59f3028 	ldr	r3, [pc, #40]	; 10660 <uart0_send_char+0x84>
   10634:	e5933000 	ldr	r3, [r3]
   10638:	e2432001 	sub	r2, r3, #1
   1063c:	e59f101c 	ldr	r1, [pc, #28]	; 10660 <uart0_send_char+0x84>
   10640:	e5812000 	str	r2, [r1]
   10644:	e3530000 	cmp	r3, #0
   10648:	1afffff7 	bne	1062c <uart0_send_char+0x50>
}
   1064c:	e24bd004 	sub	sp, fp, #4
   10650:	e8bd4800 	pop	{fp, lr}
   10654:	e12fff1e 	bx	lr
   10658:	3f201018 	.word	0x3f201018
   1065c:	3f201000 	.word	0x3f201000
   10660:	00015000 	.word	0x00015000

00010664 <uart0_get_char>:

char uart0_get_char() {
   10664:	e92d4800 	push	{fp, lr}
   10668:	e28db004 	add	fp, sp, #4
   1066c:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   10670:	e1a00000 	nop			; (mov r0, r0)
   10674:	e59f0048 	ldr	r0, [pc, #72]	; 106c4 <uart0_get_char+0x60>
   10678:	ebffff86 	bl	10498 <mmio_read>
   1067c:	e1a03000 	mov	r3, r0
   10680:	e2033010 	and	r3, r3, #16
   10684:	e3530000 	cmp	r3, #0
   10688:	1afffff9 	bne	10674 <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   1068c:	e59f0034 	ldr	r0, [pc, #52]	; 106c8 <uart0_get_char+0x64>
   10690:	ebffff80 	bl	10498 <mmio_read>
   10694:	e1a03000 	mov	r3, r0
   10698:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   1069c:	e55b3005 	ldrb	r3, [fp, #-5]
   106a0:	e353000d 	cmp	r3, #13
   106a4:	0a000001 	beq	106b0 <uart0_get_char+0x4c>
   106a8:	e55b3005 	ldrb	r3, [fp, #-5]
   106ac:	ea000000 	b	106b4 <uart0_get_char+0x50>
   106b0:	e3a0300a 	mov	r3, #10
}
   106b4:	e1a00003 	mov	r0, r3
   106b8:	e24bd004 	sub	sp, fp, #4
   106bc:	e8bd4800 	pop	{fp, lr}
   106c0:	e12fff1e 	bx	lr
   106c4:	3f201018 	.word	0x3f201018
   106c8:	3f201000 	.word	0x3f201000

000106cc <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   106cc:	e92d4800 	push	{fp, lr}
   106d0:	e28db004 	add	fp, sp, #4
   106d4:	e24dd008 	sub	sp, sp, #8
   106d8:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   106dc:	ea00000b 	b	10710 <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   106e0:	e51b3008 	ldr	r3, [fp, #-8]
   106e4:	e5d33000 	ldrb	r3, [r3]
   106e8:	e353000a 	cmp	r3, #10
   106ec:	1a000001 	bne	106f8 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   106f0:	e3a0000d 	mov	r0, #13
   106f4:	ebffffb8 	bl	105dc <uart0_send_char>
		}
		uart0_send_char(*s++);
   106f8:	e51b3008 	ldr	r3, [fp, #-8]
   106fc:	e2832001 	add	r2, r3, #1
   10700:	e50b2008 	str	r2, [fp, #-8]
   10704:	e5d33000 	ldrb	r3, [r3]
   10708:	e1a00003 	mov	r0, r3
   1070c:	ebffffb2 	bl	105dc <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   10710:	e51b3008 	ldr	r3, [fp, #-8]
   10714:	e5d33000 	ldrb	r3, [r3]
   10718:	e3530000 	cmp	r3, #0
   1071c:	1affffef 	bne	106e0 <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   10720:	e24bd004 	sub	sp, fp, #4
   10724:	e8bd4800 	pop	{fp, lr}
   10728:	e12fff1e 	bx	lr

0001072c <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   1072c:	e92d0810 	push	{r4, fp}
   10730:	e28db004 	add	fp, sp, #4
   10734:	e24dd018 	sub	sp, sp, #24
   10738:	e1a03000 	mov	r3, r0
   1073c:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   10740:	e1a00000 	nop			; (mov r0, r0)
    } while (*MBOX_STATUS & MBOX_FULL);
   10744:	e59f30c0 	ldr	r3, [pc, #192]	; 1080c <mailbox_send_message+0xe0>
   10748:	e5933000 	ldr	r3, [r3]
   1074c:	e3530000 	cmp	r3, #0
   10750:	bafffffa 	blt	10740 <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   10754:	e55b1015 	ldrb	r1, [fp, #-21]	; 0xffffffeb
   10758:	e3a02000 	mov	r2, #0
   1075c:	e59f30ac 	ldr	r3, [pc, #172]	; 10810 <mailbox_send_message+0xe4>
   10760:	e3a04000 	mov	r4, #0
   10764:	e1833001 	orr	r3, r3, r1
   10768:	e1844002 	orr	r4, r4, r2
   1076c:	e50b300c 	str	r3, [fp, #-12]
   10770:	e50b4008 	str	r4, [fp, #-8]
    *MBOX_WRITE = mailbox_addr_or_channel;
   10774:	e59f2098 	ldr	r2, [pc, #152]	; 10814 <mailbox_send_message+0xe8>
   10778:	e51b300c 	ldr	r3, [fp, #-12]
   1077c:	e5823000 	str	r3, [r2]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   10780:	e1a00000 	nop			; (mov r0, r0)
        } while(*MBOX_STATUS & MBOX_EMPTY);
   10784:	e59f3080 	ldr	r3, [pc, #128]	; 1080c <mailbox_send_message+0xe0>
   10788:	e5933000 	ldr	r3, [r3]
   1078c:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   10790:	e3530000 	cmp	r3, #0
   10794:	1afffff9 	bne	10780 <mailbox_send_message+0x54>
        
        uint32 response = *MBOX_READ;
   10798:	e59f3078 	ldr	r3, [pc, #120]	; 10818 <mailbox_send_message+0xec>
   1079c:	e5933000 	ldr	r3, [r3]
   107a0:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   107a4:	e51b3010 	ldr	r3, [fp, #-16]
   107a8:	e20330ff 	and	r3, r3, #255	; 0xff
   107ac:	e203200f 	and	r2, r3, #15
   107b0:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   107b4:	e1520003 	cmp	r2, r3
   107b8:	1a00000d 	bne	107f4 <mailbox_send_message+0xc8>
   107bc:	e51b3010 	ldr	r3, [fp, #-16]
   107c0:	e3c3300f 	bic	r3, r3, #15
   107c4:	e59f2044 	ldr	r2, [pc, #68]	; 10810 <mailbox_send_message+0xe4>
   107c8:	e1530002 	cmp	r3, r2
   107cc:	1a000008 	bne	107f4 <mailbox_send_message+0xc8>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   107d0:	e59f3038 	ldr	r3, [pc, #56]	; 10810 <mailbox_send_message+0xe4>
   107d4:	e5933004 	ldr	r3, [r3, #4]
   107d8:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   107dc:	03a03001 	moveq	r3, #1
   107e0:	13a03000 	movne	r3, #0
   107e4:	e20330ff 	and	r3, r3, #255	; 0xff
   107e8:	e20330ff 	and	r3, r3, #255	; 0xff
   107ec:	e3a04000 	mov	r4, #0
   107f0:	ea000000 	b	107f8 <mailbox_send_message+0xcc>
        }
    }
   107f4:	eaffffe1 	b	10780 <mailbox_send_message+0x54>
    return 0;
}
   107f8:	e1a00003 	mov	r0, r3
   107fc:	e1a01004 	mov	r1, r4
   10800:	e24bd004 	sub	sp, fp, #4
   10804:	e8bd0810 	pop	{r4, fp}
   10808:	e12fff1e 	bx	lr
   1080c:	3f00b898 	.word	0x3f00b898
   10810:	00015010 	.word	0x00015010
   10814:	3f00b8a0 	.word	0x3f00b8a0
   10818:	3f00b880 	.word	0x3f00b880

0001081c <undefined_instruction_handler>:
//Handles traps
#include "arm.h"

void undefined_instruction_handler(struct trap_frame* tf) {
   1081c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10820:	e28db000 	add	fp, sp, #0
   10824:	e24dd00c 	sub	sp, sp, #12
   10828:	e50b0008 	str	r0, [fp, #-8]
	
}
   1082c:	e24bd000 	sub	sp, fp, #0
   10830:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10834:	e12fff1e 	bx	lr

00010838 <software_interrupt_handler>:
void software_interrupt_handler(struct trap_frame* tf) {
   10838:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1083c:	e28db000 	add	fp, sp, #0
   10840:	e24dd00c 	sub	sp, sp, #12
   10844:	e50b0008 	str	r0, [fp, #-8]
	
}
   10848:	e24bd000 	sub	sp, fp, #0
   1084c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10850:	e12fff1e 	bx	lr

00010854 <prefetch_abort_handler>:
void prefetch_abort_handler(struct trap_frame* tf) {
   10854:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10858:	e28db000 	add	fp, sp, #0
   1085c:	e24dd00c 	sub	sp, sp, #12
   10860:	e50b0008 	str	r0, [fp, #-8]
	
}
   10864:	e24bd000 	sub	sp, fp, #0
   10868:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1086c:	e12fff1e 	bx	lr

00010870 <data_abort_handler>:
void data_abort_handler(struct trap_frame* tf) {
   10870:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10874:	e28db000 	add	fp, sp, #0
   10878:	e24dd00c 	sub	sp, sp, #12
   1087c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10880:	e24bd000 	sub	sp, fp, #0
   10884:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10888:	e12fff1e 	bx	lr

0001088c <unused_exception_handler>:
void unused_exception_handler(struct trap_frame* tf) {
   1088c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10890:	e28db000 	add	fp, sp, #0
   10894:	e24dd00c 	sub	sp, sp, #12
   10898:	e50b0008 	str	r0, [fp, #-8]
	
}
   1089c:	e24bd000 	sub	sp, fp, #0
   108a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   108a4:	e12fff1e 	bx	lr

000108a8 <irq_handler>:
void irq_handler(struct trap_frame* tf) {
   108a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   108ac:	e28db000 	add	fp, sp, #0
   108b0:	e24dd00c 	sub	sp, sp, #12
   108b4:	e50b0008 	str	r0, [fp, #-8]
	
}
   108b8:	e24bd000 	sub	sp, fp, #0
   108bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   108c0:	e12fff1e 	bx	lr

000108c4 <fiq_handler>:
void fiq_handler(struct trap_frame* tf) {
   108c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   108c8:	e28db000 	add	fp, sp, #0
   108cc:	e24dd00c 	sub	sp, sp, #12
   108d0:	e50b0008 	str	r0, [fp, #-8]
	
}
   108d4:	e24bd000 	sub	sp, fp, #0
   108d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   108dc:	e12fff1e 	bx	lr
