
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00010000 <_start>:
   10000:	ee101fb0 	mrc	15, 0, r1, cr0, cr0, {5}
   10004:	e2111003 	ands	r1, r1, #3
   10008:	1a000002 	bne	10018 <loop_forever>
   1000c:	e59f100c 	ldr	r1, [pc, #12]	; 10020 <loop_forever+0x8>
   10010:	e1a0d001 	mov	sp, r1
   10014:	eb0000f8 	bl	103fc <c_main>

00010018 <loop_forever>:
   10018:	e320f002 	wfe
   1001c:	eafffffd 	b	10018 <loop_forever>
   10020:	00010000 	.word	0x00010000

00010024 <linker_vector_table_start>:
   10024:	eafffff5 	b	10000 <_start>
   10028:	e59ff02c 	ldr	pc, [pc, #44]	; 1005c <undefined_instruction_handler_asm>
   1002c:	e59ff048 	ldr	pc, [pc, #72]	; 1007c <software_interrupt_handler_asm>
   10030:	e59ff064 	ldr	pc, [pc, #100]	; 1009c <prefetch_abort_handler_asm>
   10034:	e59ff080 	ldr	pc, [pc, #128]	; 100bc <data_abort_handler_asm>
   10038:	e59ff09c 	ldr	pc, [pc, #156]	; 100dc <unused_exception_handler_asm>
   1003c:	e59ff0b8 	ldr	pc, [pc, #184]	; 100fc <irq_handler_asm>

00010040 <fiq_handler_asm>:
   10040:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10044:	e14f2000 	mrs	r2, SPSR
   10048:	e92d0004 	stmfd	sp!, {r2}
   1004c:	e94d6000 	stmdb	sp, {sp, lr}^
   10050:	e24dd008 	sub	sp, sp, #8
   10054:	eb000220 	bl	108dc <fiq_handler>
   10058:	ea00002e 	b	10118 <trap_return>

0001005c <undefined_instruction_handler_asm>:
   1005c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10060:	e14f2000 	mrs	r2, SPSR
   10064:	e92d0004 	stmfd	sp!, {r2}
   10068:	e94d6000 	stmdb	sp, {sp, lr}^
   1006c:	e24dd008 	sub	sp, sp, #8
   10070:	e1a0000d 	mov	r0, sp
   10074:	eb0001ee 	bl	10834 <undefined_instruction_handler>
   10078:	ea000026 	b	10118 <trap_return>

0001007c <software_interrupt_handler_asm>:
   1007c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10080:	e14f2000 	mrs	r2, SPSR
   10084:	e92d0004 	stmfd	sp!, {r2}
   10088:	e94d6000 	stmdb	sp, {sp, lr}^
   1008c:	e24dd008 	sub	sp, sp, #8
   10090:	e1a0000d 	mov	r0, sp
   10094:	eb0001ed 	bl	10850 <software_interrupt_handler>
   10098:	ea00001e 	b	10118 <trap_return>

0001009c <prefetch_abort_handler_asm>:
   1009c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100a0:	e14f2000 	mrs	r2, SPSR
   100a4:	e92d0004 	stmfd	sp!, {r2}
   100a8:	e94d6000 	stmdb	sp, {sp, lr}^
   100ac:	e24dd008 	sub	sp, sp, #8
   100b0:	e1a0000d 	mov	r0, sp
   100b4:	eb0001ec 	bl	1086c <prefetch_abort_handler>
   100b8:	ea000016 	b	10118 <trap_return>

000100bc <data_abort_handler_asm>:
   100bc:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100c0:	e14f2000 	mrs	r2, SPSR
   100c4:	e92d0004 	stmfd	sp!, {r2}
   100c8:	e94d6000 	stmdb	sp, {sp, lr}^
   100cc:	e24dd008 	sub	sp, sp, #8
   100d0:	e1a0000d 	mov	r0, sp
   100d4:	eb0001eb 	bl	10888 <data_abort_handler>
   100d8:	ea00000e 	b	10118 <trap_return>

000100dc <unused_exception_handler_asm>:
   100dc:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100e0:	e14f2000 	mrs	r2, SPSR
   100e4:	e92d0004 	stmfd	sp!, {r2}
   100e8:	e94d6000 	stmdb	sp, {sp, lr}^
   100ec:	e24dd008 	sub	sp, sp, #8
   100f0:	e1a0000d 	mov	r0, sp
   100f4:	ebfffff8 	bl	100dc <unused_exception_handler_asm>
   100f8:	ea000006 	b	10118 <trap_return>

000100fc <irq_handler_asm>:
   100fc:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10100:	e14f2000 	mrs	r2, SPSR
   10104:	e92d0004 	stmfd	sp!, {r2}
   10108:	e94d6000 	stmdb	sp, {sp, lr}^
   1010c:	e24dd008 	sub	sp, sp, #8
   10110:	e1a0000d 	mov	r0, sp
   10114:	eb0001e9 	bl	108c0 <irq_handler>

00010118 <trap_return>:
   10118:	e8dd6000 	ldm	sp, {sp, lr}^
   1011c:	e28dd008 	add	sp, sp, #8
   10120:	e8bd0004 	ldmfd	sp!, {r2}
   10124:	e16ff002 	msr	SPSR_fsxc, r2
   10128:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

0001012c <set_privilege_mode>:
#define ARM_ASM_INTRINSICS_H
//Helpful arm assembly intrinsics

//Set the current privelege mode,
//mode_bit should be one of the privelege mode #defines in arm.h
void set_privilege_mode(uint32 mode_bit) {
   1012c:	e92d0810 	push	{r4, fp}
   10130:	e28db004 	add	fp, sp, #4
   10134:	e24dd008 	sub	sp, sp, #8
   10138:	e50b0008 	str	r0, [fp, #-8]
	register uint32 cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
   1013c:	e10f3000 	mrs	r3, CPSR
   10140:	e1a04003 	mov	r4, r3
	              : [cpsr_out] "=r" (cur_cpsr));
	cur_cpsr = cur_cpsr & (~MODE_MASK | mode_bit);
   10144:	e51b3008 	ldr	r3, [fp, #-8]
   10148:	e1e03d83 	mvn	r3, r3, lsl #27
   1014c:	e1e03da3 	mvn	r3, r3, lsr #27
   10150:	e0044003 	and	r4, r4, r3
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
   10154:	e12ff004 	msr	CPSR_fsxc, r4
	              : //No output
	              : [cpsr_in] "r" (cur_cpsr));
}
   10158:	e24bd004 	sub	sp, fp, #4
   1015c:	e8bd0810 	pop	{r4, fp}
   10160:	e12fff1e 	bx	lr

00010164 <set_stack_pointer>:

void set_stack_pointer(void* sp) {
   10164:	e92d0810 	push	{r4, fp}
   10168:	e28db004 	add	fp, sp, #4
   1016c:	e24dd008 	sub	sp, sp, #8
   10170:	e50b0008 	str	r0, [fp, #-8]
	register uint32 sp_reg_val = (uint32)sp;
   10174:	e51b4008 	ldr	r4, [fp, #-8]
	asm volatile ("mov sp, %[sp_in]"
   10178:	e1a0d004 	mov	sp, r4
	              : //No output
	              : [sp_in] "r" (sp_reg_val));
}
   1017c:	e24bd004 	sub	sp, fp, #4
   10180:	e8bd0810 	pop	{r4, fp}
   10184:	e12fff1e 	bx	lr

00010188 <memcpy>:
#define MEM_UTILS_H
//Useful memory functions like memcpy

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, void* source, uint32 size) {
   10188:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1018c:	e28db000 	add	fp, sp, #0
   10190:	e24dd024 	sub	sp, sp, #36	; 0x24
   10194:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10198:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   1019c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   101a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   101a4:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   101a8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   101ac:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   101b0:	e51b200c 	ldr	r2, [fp, #-12]
   101b4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   101b8:	e0823003 	add	r3, r2, r3
   101bc:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   101c0:	ea000007 	b	101e4 <memcpy+0x5c>
		*dest++ = *src++;
   101c4:	e51b3008 	ldr	r3, [fp, #-8]
   101c8:	e2832001 	add	r2, r3, #1
   101cc:	e50b2008 	str	r2, [fp, #-8]
   101d0:	e51b200c 	ldr	r2, [fp, #-12]
   101d4:	e2821001 	add	r1, r2, #1
   101d8:	e50b100c 	str	r1, [fp, #-12]
   101dc:	e5d22000 	ldrb	r2, [r2]
   101e0:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, void* source, uint32 size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   101e4:	e51b200c 	ldr	r2, [fp, #-12]
   101e8:	e51b3010 	ldr	r3, [fp, #-16]
   101ec:	e1520003 	cmp	r2, r3
   101f0:	1afffff3 	bne	101c4 <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   101f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   101f8:	e1a00003 	mov	r0, r3
   101fc:	e24bd000 	sub	sp, fp, #0
   10200:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10204:	e12fff1e 	bx	lr

00010208 <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, void* source, uint32 size) {
   10208:	e92d4800 	push	{fp, lr}
   1020c:	e28db004 	add	fp, sp, #4
   10210:	e24dd020 	sub	sp, sp, #32
   10214:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10218:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   1021c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   10220:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10224:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10228:	e1520003 	cmp	r2, r3
   1022c:	1a000001 	bne	10238 <memmove+0x30>
		return destination;
   10230:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10234:	ea000024 	b	102cc <memmove+0xc4>
	}
	if (destination < source) {
   10238:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   1023c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10240:	e1520003 	cmp	r2, r3
   10244:	2a000005 	bcs	10260 <memmove+0x58>
		return memcpy(source, destination, size);
   10248:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
   1024c:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10250:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10254:	ebffffcb 	bl	10188 <memcpy>
   10258:	e1a03000 	mov	r3, r0
   1025c:	ea00001a 	b	102cc <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   10260:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10264:	e2433001 	sub	r3, r3, #1
   10268:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   1026c:	e0823003 	add	r3, r2, r3
   10270:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   10274:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10278:	e2433001 	sub	r3, r3, #1
   1027c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10280:	e0823003 	add	r3, r2, r3
   10284:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   10288:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1028c:	e2433001 	sub	r3, r3, #1
   10290:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10294:	ea000007 	b	102b8 <memmove+0xb0>
		*dest-- = *src--;
   10298:	e51b3008 	ldr	r3, [fp, #-8]
   1029c:	e2432001 	sub	r2, r3, #1
   102a0:	e50b2008 	str	r2, [fp, #-8]
   102a4:	e51b200c 	ldr	r2, [fp, #-12]
   102a8:	e2421001 	sub	r1, r2, #1
   102ac:	e50b100c 	str	r1, [fp, #-12]
   102b0:	e5d22000 	ldrb	r2, [r2]
   102b4:	e5c32000 	strb	r2, [r3]
		return memcpy(source, destination, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   102b8:	e51b200c 	ldr	r2, [fp, #-12]
   102bc:	e51b3010 	ldr	r3, [fp, #-16]
   102c0:	e1520003 	cmp	r2, r3
   102c4:	1afffff3 	bne	10298 <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   102c8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   102cc:	e1a00003 	mov	r0, r3
   102d0:	e24bd004 	sub	sp, fp, #4
   102d4:	e8bd4800 	pop	{fp, lr}
   102d8:	e12fff1e 	bx	lr

000102dc <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, void* source_start, void* source_end) {
   102dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   102e0:	e28db000 	add	fp, sp, #0
   102e4:	e24dd024 	sub	sp, sp, #36	; 0x24
   102e8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   102ec:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   102f0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   102f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   102f8:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   102fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10300:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   10304:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10308:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   1030c:	ea000007 	b	10330 <memcpy_region+0x54>
		*dest++ = *src++;
   10310:	e51b3008 	ldr	r3, [fp, #-8]
   10314:	e2832001 	add	r2, r3, #1
   10318:	e50b2008 	str	r2, [fp, #-8]
   1031c:	e51b200c 	ldr	r2, [fp, #-12]
   10320:	e2821001 	add	r1, r2, #1
   10324:	e50b100c 	str	r1, [fp, #-12]
   10328:	e5d22000 	ldrb	r2, [r2]
   1032c:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, void* source_start, void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   10330:	e51b200c 	ldr	r2, [fp, #-12]
   10334:	e51b3010 	ldr	r3, [fp, #-16]
   10338:	e1520003 	cmp	r2, r3
   1033c:	1afffff3 	bne	10310 <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   10340:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10344:	e1a00003 	mov	r0, r3
   10348:	e24bd000 	sub	sp, fp, #0
   1034c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10350:	e12fff1e 	bx	lr

00010354 <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* source_start, void* source_end, void* destination) {
   10354:	e92d4800 	push	{fp, lr}
   10358:	e28db004 	add	fp, sp, #4
   1035c:	e24dd010 	sub	sp, sp, #16
   10360:	e50b0008 	str	r0, [fp, #-8]
   10364:	e50b100c 	str	r1, [fp, #-12]
   10368:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   1036c:	e51b200c 	ldr	r2, [fp, #-12]
   10370:	e51b3008 	ldr	r3, [fp, #-8]
   10374:	e0633002 	rsb	r3, r3, r2
   10378:	e51b0010 	ldr	r0, [fp, #-16]
   1037c:	e51b1008 	ldr	r1, [fp, #-8]
   10380:	e1a02003 	mov	r2, r3
   10384:	ebffff9f 	bl	10208 <memmove>
   10388:	e1a03000 	mov	r3, r0
}
   1038c:	e1a00003 	mov	r0, r3
   10390:	e24bd004 	sub	sp, fp, #4
   10394:	e8bd4800 	pop	{fp, lr}
   10398:	e12fff1e 	bx	lr

0001039c <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   1039c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   103a0:	e28db000 	add	fp, sp, #0
   103a4:	e24dd014 	sub	sp, sp, #20
   103a8:	e50b0010 	str	r0, [fp, #-16]
   103ac:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   103b0:	e51b3010 	ldr	r3, [fp, #-16]
   103b4:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   103b8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   103bc:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   103c0:	ea000004 	b	103d8 <zero_region+0x3c>
		*start++ = 0;
   103c4:	e51b3008 	ldr	r3, [fp, #-8]
   103c8:	e2832001 	add	r2, r3, #1
   103cc:	e50b2008 	str	r2, [fp, #-8]
   103d0:	e3a02000 	mov	r2, #0
   103d4:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   103d8:	e51b2008 	ldr	r2, [fp, #-8]
   103dc:	e51b300c 	ldr	r3, [fp, #-12]
   103e0:	e1520003 	cmp	r2, r3
   103e4:	1afffff6 	bne	103c4 <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   103e8:	e51b3010 	ldr	r3, [fp, #-16]
}
   103ec:	e1a00003 	mov	r0, r3
   103f0:	e24bd000 	sub	sp, fp, #0
   103f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   103f8:	e12fff1e 	bx	lr

000103fc <c_main>:
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];
extern char linker_privilege_mode_stacks_start[];
extern char linker_privilege_mode_stacks_end[];

void c_main(void) {
   103fc:	e92d4800 	push	{fp, lr}
   10400:	e28db004 	add	fp, sp, #4
   10404:	e24dd020 	sub	sp, sp, #32
	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
   10408:	e3a00000 	mov	r0, #0
   1040c:	e59f1054 	ldr	r1, [pc, #84]	; 10468 <c_main+0x6c>
   10410:	e59f2054 	ldr	r2, [pc, #84]	; 1046c <c_main+0x70>
   10414:	ebffffb0 	bl	102dc <memcpy_region>

	//setup each priviledge mode stack
	uint32 mode_bits[] = {
   10418:	e59f3050 	ldr	r3, [pc, #80]	; 10470 <c_main+0x74>
   1041c:	e24bc020 	sub	ip, fp, #32
   10420:	e1a0e003 	mov	lr, r3
   10424:	e8be000f 	ldm	lr!, {r0, r1, r2, r3}
   10428:	e8ac000f 	stmia	ip!, {r0, r1, r2, r3}
   1042c:	e89e0003 	ldm	lr, {r0, r1}
   10430:	e88c0003 	stm	ip, {r0, r1}
		SVC_MODE,
		ABT_MODE,
		UND_MODE,
		SYS_MODE,
	};
	char* cur_stack = linker_privilege_mode_stacks_start;
   10434:	e59f3038 	ldr	r3, [pc, #56]	; 10474 <c_main+0x78>
   10438:	e50b3008 	str	r3, [fp, #-8]
	}
	set_privilege_mode(SVC_MODE);
	#endif
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   1043c:	e59f0034 	ldr	r0, [pc, #52]	; 10478 <c_main+0x7c>
   10440:	e59f1034 	ldr	r1, [pc, #52]	; 1047c <c_main+0x80>
   10444:	ebffffd4 	bl	1039c <zero_region>

	//---UART initialization
	uart0_init();
   10448:	eb000022 	bl	104d8 <uart0_init>
	uart0_put_str("Hello, world!\0");
   1044c:	e59f002c 	ldr	r0, [pc, #44]	; 10480 <c_main+0x84>
   10450:	eb0000a3 	bl	106e4 <uart0_put_str>
	while (1) {
		uart0_send_char(uart0_get_char());
   10454:	eb000088 	bl	1067c <uart0_get_char>
   10458:	e1a03000 	mov	r3, r0
   1045c:	e1a00003 	mov	r0, r3
   10460:	eb000063 	bl	105f4 <uart0_send_char>
	}
   10464:	eafffffa 	b	10454 <c_main+0x58>
   10468:	00010024 	.word	0x00010024
   1046c:	0001012c 	.word	0x0001012c
   10470:	00010908 	.word	0x00010908
   10474:	00011000 	.word	0x00011000
   10478:	00017000 	.word	0x00017000
   1047c:	000170a0 	.word	0x000170a0
   10480:	000108f8 	.word	0x000108f8

00010484 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   10484:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10488:	e28db000 	add	fp, sp, #0
   1048c:	e24dd00c 	sub	sp, sp, #12
   10490:	e50b0008 	str	r0, [fp, #-8]
   10494:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   10498:	e51b3008 	ldr	r3, [fp, #-8]
   1049c:	e51b200c 	ldr	r2, [fp, #-12]
   104a0:	e5832000 	str	r2, [r3]
}
   104a4:	e24bd000 	sub	sp, fp, #0
   104a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   104ac:	e12fff1e 	bx	lr

000104b0 <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   104b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   104b4:	e28db000 	add	fp, sp, #0
   104b8:	e24dd00c 	sub	sp, sp, #12
   104bc:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   104c0:	e51b3008 	ldr	r3, [fp, #-8]
   104c4:	e5933000 	ldr	r3, [r3]
}
   104c8:	e1a00003 	mov	r0, r3
   104cc:	e24bd000 	sub	sp, fp, #0
   104d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   104d4:	e12fff1e 	bx	lr

000104d8 <uart0_init>:

void uart0_init() {
   104d8:	e92d4800 	push	{fp, lr}
   104dc:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   104e0:	e59f00dc 	ldr	r0, [pc, #220]	; 105c4 <uart0_init+0xec>
   104e4:	e3a01000 	mov	r1, #0
   104e8:	ebffffe5 	bl	10484 <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   104ec:	e59f00d4 	ldr	r0, [pc, #212]	; 105c8 <uart0_init+0xf0>
   104f0:	e3a01000 	mov	r1, #0
   104f4:	ebffffe2 	bl	10484 <mmio_write>
	delay(150);
   104f8:	e59f30cc 	ldr	r3, [pc, #204]	; 105cc <uart0_init+0xf4>
   104fc:	e3a02096 	mov	r2, #150	; 0x96
   10500:	e5832000 	str	r2, [r3]
   10504:	ea000000 	b	1050c <uart0_init+0x34>
   10508:	e1a00000 	nop			; (mov r0, r0)
   1050c:	e59f30b8 	ldr	r3, [pc, #184]	; 105cc <uart0_init+0xf4>
   10510:	e5933000 	ldr	r3, [r3]
   10514:	e2432001 	sub	r2, r3, #1
   10518:	e59f10ac 	ldr	r1, [pc, #172]	; 105cc <uart0_init+0xf4>
   1051c:	e5812000 	str	r2, [r1]
   10520:	e3530000 	cmp	r3, #0
   10524:	1afffff7 	bne	10508 <uart0_init+0x30>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   10528:	e59f00a0 	ldr	r0, [pc, #160]	; 105d0 <uart0_init+0xf8>
   1052c:	e3a01903 	mov	r1, #49152	; 0xc000
   10530:	ebffffd3 	bl	10484 <mmio_write>
	delay(150);
   10534:	e59f3090 	ldr	r3, [pc, #144]	; 105cc <uart0_init+0xf4>
   10538:	e3a02096 	mov	r2, #150	; 0x96
   1053c:	e5832000 	str	r2, [r3]
   10540:	ea000000 	b	10548 <uart0_init+0x70>
   10544:	e1a00000 	nop			; (mov r0, r0)
   10548:	e59f307c 	ldr	r3, [pc, #124]	; 105cc <uart0_init+0xf4>
   1054c:	e5933000 	ldr	r3, [r3]
   10550:	e2432001 	sub	r2, r3, #1
   10554:	e59f1070 	ldr	r1, [pc, #112]	; 105cc <uart0_init+0xf4>
   10558:	e5812000 	str	r2, [r1]
   1055c:	e3530000 	cmp	r3, #0
   10560:	1afffff7 	bne	10544 <uart0_init+0x6c>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   10564:	e59f0064 	ldr	r0, [pc, #100]	; 105d0 <uart0_init+0xf8>
   10568:	e3a01000 	mov	r1, #0
   1056c:	ebffffc4 	bl	10484 <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10570:	e59f005c 	ldr	r0, [pc, #92]	; 105d4 <uart0_init+0xfc>
   10574:	e59f105c 	ldr	r1, [pc, #92]	; 105d8 <uart0_init+0x100>
   10578:	ebffffc1 	bl	10484 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   1057c:	e59f0058 	ldr	r0, [pc, #88]	; 105dc <uart0_init+0x104>
   10580:	e3a01001 	mov	r1, #1
   10584:	ebffffbe 	bl	10484 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   10588:	e59f0050 	ldr	r0, [pc, #80]	; 105e0 <uart0_init+0x108>
   1058c:	e3a01028 	mov	r1, #40	; 0x28
   10590:	ebffffbb 	bl	10484 <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   10594:	e59f0048 	ldr	r0, [pc, #72]	; 105e4 <uart0_init+0x10c>
   10598:	e3a01070 	mov	r1, #112	; 0x70
   1059c:	ebffffb8 	bl	10484 <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   105a0:	e59f0040 	ldr	r0, [pc, #64]	; 105e8 <uart0_init+0x110>
   105a4:	e59f1040 	ldr	r1, [pc, #64]	; 105ec <uart0_init+0x114>
   105a8:	ebffffb5 	bl	10484 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   105ac:	e59f0010 	ldr	r0, [pc, #16]	; 105c4 <uart0_init+0xec>
   105b0:	e59f1038 	ldr	r1, [pc, #56]	; 105f0 <uart0_init+0x118>
   105b4:	ebffffb2 	bl	10484 <mmio_write>
#endif
}
   105b8:	e24bd004 	sub	sp, fp, #4
   105bc:	e8bd4800 	pop	{fp, lr}
   105c0:	e12fff1e 	bx	lr
   105c4:	3f201030 	.word	0x3f201030
   105c8:	3f200094 	.word	0x3f200094
   105cc:	00017000 	.word	0x00017000
   105d0:	3f200098 	.word	0x3f200098
   105d4:	3f201044 	.word	0x3f201044
   105d8:	000007ff 	.word	0x000007ff
   105dc:	3f201024 	.word	0x3f201024
   105e0:	3f201028 	.word	0x3f201028
   105e4:	3f20102c 	.word	0x3f20102c
   105e8:	3f201038 	.word	0x3f201038
   105ec:	000007f2 	.word	0x000007f2
   105f0:	00000301 	.word	0x00000301

000105f4 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   105f4:	e92d4800 	push	{fp, lr}
   105f8:	e28db004 	add	fp, sp, #4
   105fc:	e24dd008 	sub	sp, sp, #8
   10600:	e1a03000 	mov	r3, r0
   10604:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   10608:	e1a00000 	nop			; (mov r0, r0)
   1060c:	e59f005c 	ldr	r0, [pc, #92]	; 10670 <uart0_send_char+0x7c>
   10610:	ebffffa6 	bl	104b0 <mmio_read>
   10614:	e1a03000 	mov	r3, r0
   10618:	e2033020 	and	r3, r3, #32
   1061c:	e3530000 	cmp	r3, #0
   10620:	1afffff9 	bne	1060c <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   10624:	e55b3005 	ldrb	r3, [fp, #-5]
   10628:	e59f0044 	ldr	r0, [pc, #68]	; 10674 <uart0_send_char+0x80>
   1062c:	e1a01003 	mov	r1, r3
   10630:	ebffff93 	bl	10484 <mmio_write>
	delay(150);
   10634:	e59f303c 	ldr	r3, [pc, #60]	; 10678 <uart0_send_char+0x84>
   10638:	e3a02096 	mov	r2, #150	; 0x96
   1063c:	e5832000 	str	r2, [r3]
   10640:	ea000000 	b	10648 <uart0_send_char+0x54>
   10644:	e1a00000 	nop			; (mov r0, r0)
   10648:	e59f3028 	ldr	r3, [pc, #40]	; 10678 <uart0_send_char+0x84>
   1064c:	e5933000 	ldr	r3, [r3]
   10650:	e2432001 	sub	r2, r3, #1
   10654:	e59f101c 	ldr	r1, [pc, #28]	; 10678 <uart0_send_char+0x84>
   10658:	e5812000 	str	r2, [r1]
   1065c:	e3530000 	cmp	r3, #0
   10660:	1afffff7 	bne	10644 <uart0_send_char+0x50>
}
   10664:	e24bd004 	sub	sp, fp, #4
   10668:	e8bd4800 	pop	{fp, lr}
   1066c:	e12fff1e 	bx	lr
   10670:	3f201018 	.word	0x3f201018
   10674:	3f201000 	.word	0x3f201000
   10678:	00017000 	.word	0x00017000

0001067c <uart0_get_char>:

char uart0_get_char() {
   1067c:	e92d4800 	push	{fp, lr}
   10680:	e28db004 	add	fp, sp, #4
   10684:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   10688:	e1a00000 	nop			; (mov r0, r0)
   1068c:	e59f0048 	ldr	r0, [pc, #72]	; 106dc <uart0_get_char+0x60>
   10690:	ebffff86 	bl	104b0 <mmio_read>
   10694:	e1a03000 	mov	r3, r0
   10698:	e2033010 	and	r3, r3, #16
   1069c:	e3530000 	cmp	r3, #0
   106a0:	1afffff9 	bne	1068c <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   106a4:	e59f0034 	ldr	r0, [pc, #52]	; 106e0 <uart0_get_char+0x64>
   106a8:	ebffff80 	bl	104b0 <mmio_read>
   106ac:	e1a03000 	mov	r3, r0
   106b0:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   106b4:	e55b3005 	ldrb	r3, [fp, #-5]
   106b8:	e353000d 	cmp	r3, #13
   106bc:	0a000001 	beq	106c8 <uart0_get_char+0x4c>
   106c0:	e55b3005 	ldrb	r3, [fp, #-5]
   106c4:	ea000000 	b	106cc <uart0_get_char+0x50>
   106c8:	e3a0300a 	mov	r3, #10
}
   106cc:	e1a00003 	mov	r0, r3
   106d0:	e24bd004 	sub	sp, fp, #4
   106d4:	e8bd4800 	pop	{fp, lr}
   106d8:	e12fff1e 	bx	lr
   106dc:	3f201018 	.word	0x3f201018
   106e0:	3f201000 	.word	0x3f201000

000106e4 <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   106e4:	e92d4800 	push	{fp, lr}
   106e8:	e28db004 	add	fp, sp, #4
   106ec:	e24dd008 	sub	sp, sp, #8
   106f0:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   106f4:	ea00000b 	b	10728 <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   106f8:	e51b3008 	ldr	r3, [fp, #-8]
   106fc:	e5d33000 	ldrb	r3, [r3]
   10700:	e353000a 	cmp	r3, #10
   10704:	1a000001 	bne	10710 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   10708:	e3a0000d 	mov	r0, #13
   1070c:	ebffffb8 	bl	105f4 <uart0_send_char>
		}
		uart0_send_char(*s++);
   10710:	e51b3008 	ldr	r3, [fp, #-8]
   10714:	e2832001 	add	r2, r3, #1
   10718:	e50b2008 	str	r2, [fp, #-8]
   1071c:	e5d33000 	ldrb	r3, [r3]
   10720:	e1a00003 	mov	r0, r3
   10724:	ebffffb2 	bl	105f4 <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   10728:	e51b3008 	ldr	r3, [fp, #-8]
   1072c:	e5d33000 	ldrb	r3, [r3]
   10730:	e3530000 	cmp	r3, #0
   10734:	1affffef 	bne	106f8 <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   10738:	e24bd004 	sub	sp, fp, #4
   1073c:	e8bd4800 	pop	{fp, lr}
   10740:	e12fff1e 	bx	lr

00010744 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   10744:	e92d0810 	push	{r4, fp}
   10748:	e28db004 	add	fp, sp, #4
   1074c:	e24dd018 	sub	sp, sp, #24
   10750:	e1a03000 	mov	r3, r0
   10754:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   10758:	e1a00000 	nop			; (mov r0, r0)
    } while (*MBOX_STATUS & MBOX_FULL);
   1075c:	e59f30c0 	ldr	r3, [pc, #192]	; 10824 <mailbox_send_message+0xe0>
   10760:	e5933000 	ldr	r3, [r3]
   10764:	e3530000 	cmp	r3, #0
   10768:	bafffffa 	blt	10758 <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   1076c:	e55b1015 	ldrb	r1, [fp, #-21]	; 0xffffffeb
   10770:	e3a02000 	mov	r2, #0
   10774:	e59f30ac 	ldr	r3, [pc, #172]	; 10828 <mailbox_send_message+0xe4>
   10778:	e3a04000 	mov	r4, #0
   1077c:	e1833001 	orr	r3, r3, r1
   10780:	e1844002 	orr	r4, r4, r2
   10784:	e50b300c 	str	r3, [fp, #-12]
   10788:	e50b4008 	str	r4, [fp, #-8]
    *MBOX_WRITE = mailbox_addr_or_channel;
   1078c:	e59f2098 	ldr	r2, [pc, #152]	; 1082c <mailbox_send_message+0xe8>
   10790:	e51b300c 	ldr	r3, [fp, #-12]
   10794:	e5823000 	str	r3, [r2]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   10798:	e1a00000 	nop			; (mov r0, r0)
        } while(*MBOX_STATUS & MBOX_EMPTY);
   1079c:	e59f3080 	ldr	r3, [pc, #128]	; 10824 <mailbox_send_message+0xe0>
   107a0:	e5933000 	ldr	r3, [r3]
   107a4:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   107a8:	e3530000 	cmp	r3, #0
   107ac:	1afffff9 	bne	10798 <mailbox_send_message+0x54>
        
        uint32 response = *MBOX_READ;
   107b0:	e59f3078 	ldr	r3, [pc, #120]	; 10830 <mailbox_send_message+0xec>
   107b4:	e5933000 	ldr	r3, [r3]
   107b8:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   107bc:	e51b3010 	ldr	r3, [fp, #-16]
   107c0:	e20330ff 	and	r3, r3, #255	; 0xff
   107c4:	e203200f 	and	r2, r3, #15
   107c8:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   107cc:	e1520003 	cmp	r2, r3
   107d0:	1a00000d 	bne	1080c <mailbox_send_message+0xc8>
   107d4:	e51b3010 	ldr	r3, [fp, #-16]
   107d8:	e3c3300f 	bic	r3, r3, #15
   107dc:	e59f2044 	ldr	r2, [pc, #68]	; 10828 <mailbox_send_message+0xe4>
   107e0:	e1530002 	cmp	r3, r2
   107e4:	1a000008 	bne	1080c <mailbox_send_message+0xc8>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   107e8:	e59f3038 	ldr	r3, [pc, #56]	; 10828 <mailbox_send_message+0xe4>
   107ec:	e5933004 	ldr	r3, [r3, #4]
   107f0:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   107f4:	03a03001 	moveq	r3, #1
   107f8:	13a03000 	movne	r3, #0
   107fc:	e20330ff 	and	r3, r3, #255	; 0xff
   10800:	e20330ff 	and	r3, r3, #255	; 0xff
   10804:	e3a04000 	mov	r4, #0
   10808:	ea000000 	b	10810 <mailbox_send_message+0xcc>
        }
    }
   1080c:	eaffffe1 	b	10798 <mailbox_send_message+0x54>
    return 0;
}
   10810:	e1a00003 	mov	r0, r3
   10814:	e1a01004 	mov	r1, r4
   10818:	e24bd004 	sub	sp, fp, #4
   1081c:	e8bd0810 	pop	{r4, fp}
   10820:	e12fff1e 	bx	lr
   10824:	3f00b898 	.word	0x3f00b898
   10828:	00017010 	.word	0x00017010
   1082c:	3f00b8a0 	.word	0x3f00b8a0
   10830:	3f00b880 	.word	0x3f00b880

00010834 <undefined_instruction_handler>:
//Handles traps
#include "arm.h"

void undefined_instruction_handler(struct trap_frame* tf) {
   10834:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10838:	e28db000 	add	fp, sp, #0
   1083c:	e24dd00c 	sub	sp, sp, #12
   10840:	e50b0008 	str	r0, [fp, #-8]
	
}
   10844:	e24bd000 	sub	sp, fp, #0
   10848:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1084c:	e12fff1e 	bx	lr

00010850 <software_interrupt_handler>:
void software_interrupt_handler(struct trap_frame* tf) {
   10850:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10854:	e28db000 	add	fp, sp, #0
   10858:	e24dd00c 	sub	sp, sp, #12
   1085c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10860:	e24bd000 	sub	sp, fp, #0
   10864:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10868:	e12fff1e 	bx	lr

0001086c <prefetch_abort_handler>:
void prefetch_abort_handler(struct trap_frame* tf) {
   1086c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10870:	e28db000 	add	fp, sp, #0
   10874:	e24dd00c 	sub	sp, sp, #12
   10878:	e50b0008 	str	r0, [fp, #-8]
	
}
   1087c:	e24bd000 	sub	sp, fp, #0
   10880:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10884:	e12fff1e 	bx	lr

00010888 <data_abort_handler>:
void data_abort_handler(struct trap_frame* tf) {
   10888:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1088c:	e28db000 	add	fp, sp, #0
   10890:	e24dd00c 	sub	sp, sp, #12
   10894:	e50b0008 	str	r0, [fp, #-8]
	
}
   10898:	e24bd000 	sub	sp, fp, #0
   1089c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   108a0:	e12fff1e 	bx	lr

000108a4 <unused_exception_handler>:
void unused_exception_handler(struct trap_frame* tf) {
   108a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   108a8:	e28db000 	add	fp, sp, #0
   108ac:	e24dd00c 	sub	sp, sp, #12
   108b0:	e50b0008 	str	r0, [fp, #-8]
	
}
   108b4:	e24bd000 	sub	sp, fp, #0
   108b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   108bc:	e12fff1e 	bx	lr

000108c0 <irq_handler>:
void irq_handler(struct trap_frame* tf) {
   108c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   108c4:	e28db000 	add	fp, sp, #0
   108c8:	e24dd00c 	sub	sp, sp, #12
   108cc:	e50b0008 	str	r0, [fp, #-8]
	
}
   108d0:	e24bd000 	sub	sp, fp, #0
   108d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   108d8:	e12fff1e 	bx	lr

000108dc <fiq_handler>:
void fiq_handler(struct trap_frame* tf) {
   108dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   108e0:	e28db000 	add	fp, sp, #0
   108e4:	e24dd00c 	sub	sp, sp, #12
   108e8:	e50b0008 	str	r0, [fp, #-8]
	
}
   108ec:	e24bd000 	sub	sp, fp, #0
   108f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   108f4:	e12fff1e 	bx	lr
