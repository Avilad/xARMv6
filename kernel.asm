
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
   1004c:	eb000117 	bl	104b0 <kmain>

00010050 <loop_forever>:
   10050:	e320f002 	wfe
   10054:	eafffffd 	b	10050 <loop_forever>
   10058:	00011000 	.word	0x00011000
   1005c:	00010000 	.word	0x00010000

00010060 <linker_vector_table_start>:
   10060:	eaffffe6 	b	10000 <_start>
   10064:	f7f0a000 	.word	0xf7f0a000
   10068:	e59ff048 	ldr	pc, [pc, #72]	; 100b8 <software_interrupt_handler_asm>
   1006c:	e59ff064 	ldr	pc, [pc, #100]	; 100d8 <prefetch_abort_handler_asm>
   10070:	e59ff080 	ldr	pc, [pc, #128]	; 100f8 <data_abort_handler_asm>
   10074:	e59ff09c 	ldr	pc, [pc, #156]	; 10118 <unused_exception_handler_asm>
   10078:	f7f0a000 	.word	0xf7f0a000

0001007c <fiq_handler_asm>:
   1007c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10080:	e14f2000 	mrs	r2, SPSR
   10084:	e92d0004 	stmfd	sp!, {r2}
   10088:	e94d6000 	stmdb	sp, {sp, lr}^
   1008c:	e24dd008 	sub	sp, sp, #8
   10090:	eb00023a 	bl	10980 <fiq_handler>
   10094:	ea00002e 	b	10154 <trap_return>

00010098 <undefined_instruction_handler_asm>:
   10098:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1009c:	e14f2000 	mrs	r2, SPSR
   100a0:	e92d0004 	stmfd	sp!, {r2}
   100a4:	e94d6000 	stmdb	sp, {sp, lr}^
   100a8:	e24dd008 	sub	sp, sp, #8
   100ac:	e1a0000d 	mov	r0, sp
   100b0:	eb000208 	bl	108d8 <undefined_instruction_handler>
   100b4:	ea000026 	b	10154 <trap_return>

000100b8 <software_interrupt_handler_asm>:
   100b8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100bc:	e14f2000 	mrs	r2, SPSR
   100c0:	e92d0004 	stmfd	sp!, {r2}
   100c4:	e94d6000 	stmdb	sp, {sp, lr}^
   100c8:	e24dd008 	sub	sp, sp, #8
   100cc:	e1a0000d 	mov	r0, sp
   100d0:	eb000207 	bl	108f4 <software_interrupt_handler>
   100d4:	ea00001e 	b	10154 <trap_return>

000100d8 <prefetch_abort_handler_asm>:
   100d8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100dc:	e14f2000 	mrs	r2, SPSR
   100e0:	e92d0004 	stmfd	sp!, {r2}
   100e4:	e94d6000 	stmdb	sp, {sp, lr}^
   100e8:	e24dd008 	sub	sp, sp, #8
   100ec:	e1a0000d 	mov	r0, sp
   100f0:	eb000206 	bl	10910 <prefetch_abort_handler>
   100f4:	ea000016 	b	10154 <trap_return>

000100f8 <data_abort_handler_asm>:
   100f8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100fc:	e14f2000 	mrs	r2, SPSR
   10100:	e92d0004 	stmfd	sp!, {r2}
   10104:	e94d6000 	stmdb	sp, {sp, lr}^
   10108:	e24dd008 	sub	sp, sp, #8
   1010c:	e1a0000d 	mov	r0, sp
   10110:	eb000205 	bl	1092c <data_abort_handler>
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
   10150:	eb000203 	bl	10964 <irq_handler>

00010154 <trap_return>:
   10154:	e8dd6000 	ldm	sp, {sp, lr}^
   10158:	e28dd008 	add	sp, sp, #8
   1015c:	e8bd0004 	ldmfd	sp!, {r2}
   10160:	e16ff002 	msr	SPSR_fsxc, r2
   10164:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

00010168 <get_cpsr>:
#ifndef ARM_ASM_INTRINSICS_H
#define ARM_ASM_INTRINSICS_H
//Helpful arm assembly intrinsics

uint32 get_cpsr() {
   10168:	e92d0810 	push	{r4, fp}
   1016c:	e28db004 	add	fp, sp, #4
	register uint32 cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
   10170:	e10f3000 	mrs	r3, CPSR
   10174:	e1a04003 	mov	r4, r3
	              : [cpsr_out] "=r" (cur_cpsr));
	return cur_cpsr;
   10178:	e1a03004 	mov	r3, r4
}
   1017c:	e1a00003 	mov	r0, r3
   10180:	e24bd004 	sub	sp, fp, #4
   10184:	e8bd0810 	pop	{r4, fp}
   10188:	e12fff1e 	bx	lr

0001018c <set_cpsr>:

void set_cpsr(uint32 new_cpsr) {
   1018c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10190:	e28db000 	add	fp, sp, #0
   10194:	e24dd00c 	sub	sp, sp, #12
   10198:	e50b0008 	str	r0, [fp, #-8]
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
   1019c:	e51b3008 	ldr	r3, [fp, #-8]
   101a0:	e12ff003 	msr	CPSR_fsxc, r3
	              : //No output
	              : [cpsr_in] "r" (new_cpsr));
}
   101a4:	e24bd000 	sub	sp, fp, #0
   101a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   101ac:	e12fff1e 	bx	lr

000101b0 <set_operating_mode>:

//Set the current processor operating mode,
//mode_bit should be one of the PSR mode defines in arm.h
void set_operating_mode(uint32 mode_bit) {
   101b0:	e92d4810 	push	{r4, fp, lr}
   101b4:	e28db008 	add	fp, sp, #8
   101b8:	e24dd00c 	sub	sp, sp, #12
   101bc:	e50b0010 	str	r0, [fp, #-16]
	register uint32 cur_cpsr = get_cpsr();
   101c0:	ebffffe8 	bl	10168 <get_cpsr>
   101c4:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr & (~PSR_MODE_MASK | mode_bit);
   101c8:	e51b3010 	ldr	r3, [fp, #-16]
   101cc:	e1e03d83 	mvn	r3, r3, lsl #27
   101d0:	e1e03da3 	mvn	r3, r3, lsr #27
   101d4:	e0044003 	and	r4, r4, r3
	set_cpsr(cur_cpsr);
   101d8:	e1a00004 	mov	r0, r4
   101dc:	ebffffea 	bl	1018c <set_cpsr>
}
   101e0:	e24bd008 	sub	sp, fp, #8
   101e4:	e8bd4810 	pop	{r4, fp, lr}
   101e8:	e12fff1e 	bx	lr

000101ec <enable_irq_interrupts>:

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void enable_irq_interrupts() {
   101ec:	e92d4818 	push	{r3, r4, fp, lr}
   101f0:	e28db00c 	add	fp, sp, #12
	register uint32 cur_cpsr = get_cpsr();
   101f4:	ebffffdb 	bl	10168 <get_cpsr>
   101f8:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr & ~PSR_IRQ_INTERRUPT_DISABLE;
   101fc:	e3c44080 	bic	r4, r4, #128	; 0x80
	set_cpsr(cur_cpsr);
   10200:	e1a00004 	mov	r0, r4
   10204:	ebffffe0 	bl	1018c <set_cpsr>
}
   10208:	e24bd00c 	sub	sp, fp, #12
   1020c:	e8bd4818 	pop	{r3, r4, fp, lr}
   10210:	e12fff1e 	bx	lr

00010214 <disable_irq_interrupts>:

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void disable_irq_interrupts() {
   10214:	e92d4818 	push	{r3, r4, fp, lr}
   10218:	e28db00c 	add	fp, sp, #12
	register uint32 cur_cpsr = get_cpsr();
   1021c:	ebffffd1 	bl	10168 <get_cpsr>
   10220:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr | PSR_IRQ_INTERRUPT_DISABLE;
   10224:	e3844080 	orr	r4, r4, #128	; 0x80
	set_cpsr(cur_cpsr);
   10228:	e1a00004 	mov	r0, r4
   1022c:	ebffffd6 	bl	1018c <set_cpsr>
}
   10230:	e24bd00c 	sub	sp, fp, #12
   10234:	e8bd4818 	pop	{r3, r4, fp, lr}
   10238:	e12fff1e 	bx	lr

0001023c <memcpy>:
#define MEM_UTILS_H
//Useful memory functions like memcpy

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, void* source, uint32 size) {
   1023c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10240:	e28db000 	add	fp, sp, #0
   10244:	e24dd024 	sub	sp, sp, #36	; 0x24
   10248:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   1024c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10250:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10254:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10258:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   1025c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10260:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   10264:	e51b200c 	ldr	r2, [fp, #-12]
   10268:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   1026c:	e0823003 	add	r3, r2, r3
   10270:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10274:	ea000007 	b	10298 <memcpy+0x5c>
		*dest++ = *src++;
   10278:	e51b3008 	ldr	r3, [fp, #-8]
   1027c:	e2832001 	add	r2, r3, #1
   10280:	e50b2008 	str	r2, [fp, #-8]
   10284:	e51b200c 	ldr	r2, [fp, #-12]
   10288:	e2821001 	add	r1, r2, #1
   1028c:	e50b100c 	str	r1, [fp, #-12]
   10290:	e5d22000 	ldrb	r2, [r2]
   10294:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, void* source, uint32 size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   10298:	e51b200c 	ldr	r2, [fp, #-12]
   1029c:	e51b3010 	ldr	r3, [fp, #-16]
   102a0:	e1520003 	cmp	r2, r3
   102a4:	1afffff3 	bne	10278 <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   102a8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   102ac:	e1a00003 	mov	r0, r3
   102b0:	e24bd000 	sub	sp, fp, #0
   102b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   102b8:	e12fff1e 	bx	lr

000102bc <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, void* source, uint32 size) {
   102bc:	e92d4800 	push	{fp, lr}
   102c0:	e28db004 	add	fp, sp, #4
   102c4:	e24dd020 	sub	sp, sp, #32
   102c8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   102cc:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   102d0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   102d4:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   102d8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   102dc:	e1520003 	cmp	r2, r3
   102e0:	1a000001 	bne	102ec <memmove+0x30>
		return destination;
   102e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   102e8:	ea000024 	b	10380 <memmove+0xc4>
	}
	if (destination < source) {
   102ec:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   102f0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   102f4:	e1520003 	cmp	r2, r3
   102f8:	2a000005 	bcs	10314 <memmove+0x58>
		return memcpy(source, destination, size);
   102fc:	e51b001c 	ldr	r0, [fp, #-28]	; 0xffffffe4
   10300:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10304:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10308:	ebffffcb 	bl	1023c <memcpy>
   1030c:	e1a03000 	mov	r3, r0
   10310:	ea00001a 	b	10380 <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   10314:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10318:	e2433001 	sub	r3, r3, #1
   1031c:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   10320:	e0823003 	add	r3, r2, r3
   10324:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   10328:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   1032c:	e2433001 	sub	r3, r3, #1
   10330:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10334:	e0823003 	add	r3, r2, r3
   10338:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   1033c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10340:	e2433001 	sub	r3, r3, #1
   10344:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10348:	ea000007 	b	1036c <memmove+0xb0>
		*dest-- = *src--;
   1034c:	e51b3008 	ldr	r3, [fp, #-8]
   10350:	e2432001 	sub	r2, r3, #1
   10354:	e50b2008 	str	r2, [fp, #-8]
   10358:	e51b200c 	ldr	r2, [fp, #-12]
   1035c:	e2421001 	sub	r1, r2, #1
   10360:	e50b100c 	str	r1, [fp, #-12]
   10364:	e5d22000 	ldrb	r2, [r2]
   10368:	e5c32000 	strb	r2, [r3]
		return memcpy(source, destination, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   1036c:	e51b200c 	ldr	r2, [fp, #-12]
   10370:	e51b3010 	ldr	r3, [fp, #-16]
   10374:	e1520003 	cmp	r2, r3
   10378:	1afffff3 	bne	1034c <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   1037c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10380:	e1a00003 	mov	r0, r3
   10384:	e24bd004 	sub	sp, fp, #4
   10388:	e8bd4800 	pop	{fp, lr}
   1038c:	e12fff1e 	bx	lr

00010390 <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, void* source_start, void* source_end) {
   10390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10394:	e28db000 	add	fp, sp, #0
   10398:	e24dd024 	sub	sp, sp, #36	; 0x24
   1039c:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   103a0:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   103a4:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   103a8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   103ac:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   103b0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   103b4:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   103b8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   103bc:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   103c0:	ea000007 	b	103e4 <memcpy_region+0x54>
		*dest++ = *src++;
   103c4:	e51b3008 	ldr	r3, [fp, #-8]
   103c8:	e2832001 	add	r2, r3, #1
   103cc:	e50b2008 	str	r2, [fp, #-8]
   103d0:	e51b200c 	ldr	r2, [fp, #-12]
   103d4:	e2821001 	add	r1, r2, #1
   103d8:	e50b100c 	str	r1, [fp, #-12]
   103dc:	e5d22000 	ldrb	r2, [r2]
   103e0:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, void* source_start, void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   103e4:	e51b200c 	ldr	r2, [fp, #-12]
   103e8:	e51b3010 	ldr	r3, [fp, #-16]
   103ec:	e1520003 	cmp	r2, r3
   103f0:	1afffff3 	bne	103c4 <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   103f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   103f8:	e1a00003 	mov	r0, r3
   103fc:	e24bd000 	sub	sp, fp, #0
   10400:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10404:	e12fff1e 	bx	lr

00010408 <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* source_start, void* source_end, void* destination) {
   10408:	e92d4800 	push	{fp, lr}
   1040c:	e28db004 	add	fp, sp, #4
   10410:	e24dd010 	sub	sp, sp, #16
   10414:	e50b0008 	str	r0, [fp, #-8]
   10418:	e50b100c 	str	r1, [fp, #-12]
   1041c:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   10420:	e51b200c 	ldr	r2, [fp, #-12]
   10424:	e51b3008 	ldr	r3, [fp, #-8]
   10428:	e0633002 	rsb	r3, r3, r2
   1042c:	e51b0010 	ldr	r0, [fp, #-16]
   10430:	e51b1008 	ldr	r1, [fp, #-8]
   10434:	e1a02003 	mov	r2, r3
   10438:	ebffff9f 	bl	102bc <memmove>
   1043c:	e1a03000 	mov	r3, r0
}
   10440:	e1a00003 	mov	r0, r3
   10444:	e24bd004 	sub	sp, fp, #4
   10448:	e8bd4800 	pop	{fp, lr}
   1044c:	e12fff1e 	bx	lr

00010450 <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   10450:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10454:	e28db000 	add	fp, sp, #0
   10458:	e24dd014 	sub	sp, sp, #20
   1045c:	e50b0010 	str	r0, [fp, #-16]
   10460:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   10464:	e51b3010 	ldr	r3, [fp, #-16]
   10468:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   1046c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10470:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   10474:	ea000004 	b	1048c <zero_region+0x3c>
		*start++ = 0;
   10478:	e51b3008 	ldr	r3, [fp, #-8]
   1047c:	e2832001 	add	r2, r3, #1
   10480:	e50b2008 	str	r2, [fp, #-8]
   10484:	e3a02000 	mov	r2, #0
   10488:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   1048c:	e51b2008 	ldr	r2, [fp, #-8]
   10490:	e51b300c 	ldr	r3, [fp, #-12]
   10494:	e1520003 	cmp	r2, r3
   10498:	1afffff6 	bne	10478 <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   1049c:	e51b3010 	ldr	r3, [fp, #-16]
}
   104a0:	e1a00003 	mov	r0, r3
   104a4:	e24bd000 	sub	sp, fp, #0
   104a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   104ac:	e12fff1e 	bx	lr

000104b0 <kmain>:
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];

void kmain(void) {
   104b0:	e92d4800 	push	{fp, lr}
   104b4:	e28db004 	add	fp, sp, #4
	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
   104b8:	e3a00000 	mov	r0, #0
   104bc:	e59f104c 	ldr	r1, [pc, #76]	; 10510 <kmain+0x60>
   104c0:	e59f204c 	ldr	r2, [pc, #76]	; 10514 <kmain+0x64>
   104c4:	ebffffb1 	bl	10390 <memcpy_region>
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   104c8:	e59f0048 	ldr	r0, [pc, #72]	; 10518 <kmain+0x68>
   104cc:	e59f1048 	ldr	r1, [pc, #72]	; 1051c <kmain+0x6c>
   104d0:	ebffffde 	bl	10450 <zero_region>

	//---Timer test code
	enable_irq_interrupts();
   104d4:	ebffff44 	bl	101ec <enable_irq_interrupts>
	//Enable timer to generate interrupts every 10 ms (1 Mhz timer generates interrupts on counting 10000)
	mmio_write(LOCAL_TIMER_INTERRUPT_ROUTE_REGISTER,
   104d8:	e3a00191 	mov	r0, #1073741860	; 0x40000024
   104dc:	e3a01000 	mov	r1, #0
   104e0:	eb000010 	bl	10528 <mmio_write>
	           LOCAL_TIMER_INTERRUPT_ROUTE_CORE0_IRQ);
	mmio_write(LOCAL_TIMER_CONTROL_REGISTER,
   104e4:	e3a001d1 	mov	r0, #1073741876	; 0x40000034
   104e8:	e59f1030 	ldr	r1, [pc, #48]	; 10520 <kmain+0x70>
   104ec:	eb00000d 	bl	10528 <mmio_write>
	           LOCAL_TIMER_INTERRUPT_ENABLE | LOCAL_TIMER_ENABLE | 10000);

	//---UART initialization
	uart0_init();
   104f0:	eb000021 	bl	1057c <uart0_init>
	uart0_put_str("Hello, world!\0");
   104f4:	e59f0028 	ldr	r0, [pc, #40]	; 10524 <kmain+0x74>
   104f8:	eb0000a2 	bl	10788 <uart0_put_str>
	while (1) {
		uart0_send_char(uart0_get_char());
   104fc:	eb000087 	bl	10720 <uart0_get_char>
   10500:	e1a03000 	mov	r3, r0
   10504:	e1a00003 	mov	r0, r3
   10508:	eb000062 	bl	10698 <uart0_send_char>
	}
   1050c:	eafffffa 	b	104fc <kmain+0x4c>
   10510:	00010060 	.word	0x00010060
   10514:	00010168 	.word	0x00010168
   10518:	00015000 	.word	0x00015000
   1051c:	000150a0 	.word	0x000150a0
   10520:	30002710 	.word	0x30002710
   10524:	0001099c 	.word	0x0001099c

00010528 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   10528:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1052c:	e28db000 	add	fp, sp, #0
   10530:	e24dd00c 	sub	sp, sp, #12
   10534:	e50b0008 	str	r0, [fp, #-8]
   10538:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   1053c:	e51b3008 	ldr	r3, [fp, #-8]
   10540:	e51b200c 	ldr	r2, [fp, #-12]
   10544:	e5832000 	str	r2, [r3]
}
   10548:	e24bd000 	sub	sp, fp, #0
   1054c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10550:	e12fff1e 	bx	lr

00010554 <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   10554:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10558:	e28db000 	add	fp, sp, #0
   1055c:	e24dd00c 	sub	sp, sp, #12
   10560:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   10564:	e51b3008 	ldr	r3, [fp, #-8]
   10568:	e5933000 	ldr	r3, [r3]
}
   1056c:	e1a00003 	mov	r0, r3
   10570:	e24bd000 	sub	sp, fp, #0
   10574:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10578:	e12fff1e 	bx	lr

0001057c <uart0_init>:

void uart0_init() {
   1057c:	e92d4800 	push	{fp, lr}
   10580:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   10584:	e59f00dc 	ldr	r0, [pc, #220]	; 10668 <uart0_init+0xec>
   10588:	e3a01000 	mov	r1, #0
   1058c:	ebffffe5 	bl	10528 <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   10590:	e59f00d4 	ldr	r0, [pc, #212]	; 1066c <uart0_init+0xf0>
   10594:	e3a01000 	mov	r1, #0
   10598:	ebffffe2 	bl	10528 <mmio_write>
	delay(150);
   1059c:	e59f30cc 	ldr	r3, [pc, #204]	; 10670 <uart0_init+0xf4>
   105a0:	e3a02096 	mov	r2, #150	; 0x96
   105a4:	e5832000 	str	r2, [r3]
   105a8:	ea000000 	b	105b0 <uart0_init+0x34>
   105ac:	e1a00000 	nop			; (mov r0, r0)
   105b0:	e59f30b8 	ldr	r3, [pc, #184]	; 10670 <uart0_init+0xf4>
   105b4:	e5933000 	ldr	r3, [r3]
   105b8:	e2432001 	sub	r2, r3, #1
   105bc:	e59f10ac 	ldr	r1, [pc, #172]	; 10670 <uart0_init+0xf4>
   105c0:	e5812000 	str	r2, [r1]
   105c4:	e3530000 	cmp	r3, #0
   105c8:	1afffff7 	bne	105ac <uart0_init+0x30>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   105cc:	e59f00a0 	ldr	r0, [pc, #160]	; 10674 <uart0_init+0xf8>
   105d0:	e3a01903 	mov	r1, #49152	; 0xc000
   105d4:	ebffffd3 	bl	10528 <mmio_write>
	delay(150);
   105d8:	e59f3090 	ldr	r3, [pc, #144]	; 10670 <uart0_init+0xf4>
   105dc:	e3a02096 	mov	r2, #150	; 0x96
   105e0:	e5832000 	str	r2, [r3]
   105e4:	ea000000 	b	105ec <uart0_init+0x70>
   105e8:	e1a00000 	nop			; (mov r0, r0)
   105ec:	e59f307c 	ldr	r3, [pc, #124]	; 10670 <uart0_init+0xf4>
   105f0:	e5933000 	ldr	r3, [r3]
   105f4:	e2432001 	sub	r2, r3, #1
   105f8:	e59f1070 	ldr	r1, [pc, #112]	; 10670 <uart0_init+0xf4>
   105fc:	e5812000 	str	r2, [r1]
   10600:	e3530000 	cmp	r3, #0
   10604:	1afffff7 	bne	105e8 <uart0_init+0x6c>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   10608:	e59f0064 	ldr	r0, [pc, #100]	; 10674 <uart0_init+0xf8>
   1060c:	e3a01000 	mov	r1, #0
   10610:	ebffffc4 	bl	10528 <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10614:	e59f005c 	ldr	r0, [pc, #92]	; 10678 <uart0_init+0xfc>
   10618:	e59f105c 	ldr	r1, [pc, #92]	; 1067c <uart0_init+0x100>
   1061c:	ebffffc1 	bl	10528 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   10620:	e59f0058 	ldr	r0, [pc, #88]	; 10680 <uart0_init+0x104>
   10624:	e3a01001 	mov	r1, #1
   10628:	ebffffbe 	bl	10528 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   1062c:	e59f0050 	ldr	r0, [pc, #80]	; 10684 <uart0_init+0x108>
   10630:	e3a01028 	mov	r1, #40	; 0x28
   10634:	ebffffbb 	bl	10528 <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   10638:	e59f0048 	ldr	r0, [pc, #72]	; 10688 <uart0_init+0x10c>
   1063c:	e3a01070 	mov	r1, #112	; 0x70
   10640:	ebffffb8 	bl	10528 <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   10644:	e59f0040 	ldr	r0, [pc, #64]	; 1068c <uart0_init+0x110>
   10648:	e59f1040 	ldr	r1, [pc, #64]	; 10690 <uart0_init+0x114>
   1064c:	ebffffb5 	bl	10528 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   10650:	e59f0010 	ldr	r0, [pc, #16]	; 10668 <uart0_init+0xec>
   10654:	e59f1038 	ldr	r1, [pc, #56]	; 10694 <uart0_init+0x118>
   10658:	ebffffb2 	bl	10528 <mmio_write>
#endif
}
   1065c:	e24bd004 	sub	sp, fp, #4
   10660:	e8bd4800 	pop	{fp, lr}
   10664:	e12fff1e 	bx	lr
   10668:	3f201030 	.word	0x3f201030
   1066c:	3f200094 	.word	0x3f200094
   10670:	00015000 	.word	0x00015000
   10674:	3f200098 	.word	0x3f200098
   10678:	3f201044 	.word	0x3f201044
   1067c:	000007ff 	.word	0x000007ff
   10680:	3f201024 	.word	0x3f201024
   10684:	3f201028 	.word	0x3f201028
   10688:	3f20102c 	.word	0x3f20102c
   1068c:	3f201038 	.word	0x3f201038
   10690:	000007f2 	.word	0x000007f2
   10694:	00000301 	.word	0x00000301

00010698 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   10698:	e92d4800 	push	{fp, lr}
   1069c:	e28db004 	add	fp, sp, #4
   106a0:	e24dd008 	sub	sp, sp, #8
   106a4:	e1a03000 	mov	r3, r0
   106a8:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   106ac:	e1a00000 	nop			; (mov r0, r0)
   106b0:	e59f005c 	ldr	r0, [pc, #92]	; 10714 <uart0_send_char+0x7c>
   106b4:	ebffffa6 	bl	10554 <mmio_read>
   106b8:	e1a03000 	mov	r3, r0
   106bc:	e2033020 	and	r3, r3, #32
   106c0:	e3530000 	cmp	r3, #0
   106c4:	1afffff9 	bne	106b0 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   106c8:	e55b3005 	ldrb	r3, [fp, #-5]
   106cc:	e59f0044 	ldr	r0, [pc, #68]	; 10718 <uart0_send_char+0x80>
   106d0:	e1a01003 	mov	r1, r3
   106d4:	ebffff93 	bl	10528 <mmio_write>
	delay(150);
   106d8:	e59f303c 	ldr	r3, [pc, #60]	; 1071c <uart0_send_char+0x84>
   106dc:	e3a02096 	mov	r2, #150	; 0x96
   106e0:	e5832000 	str	r2, [r3]
   106e4:	ea000000 	b	106ec <uart0_send_char+0x54>
   106e8:	e1a00000 	nop			; (mov r0, r0)
   106ec:	e59f3028 	ldr	r3, [pc, #40]	; 1071c <uart0_send_char+0x84>
   106f0:	e5933000 	ldr	r3, [r3]
   106f4:	e2432001 	sub	r2, r3, #1
   106f8:	e59f101c 	ldr	r1, [pc, #28]	; 1071c <uart0_send_char+0x84>
   106fc:	e5812000 	str	r2, [r1]
   10700:	e3530000 	cmp	r3, #0
   10704:	1afffff7 	bne	106e8 <uart0_send_char+0x50>
}
   10708:	e24bd004 	sub	sp, fp, #4
   1070c:	e8bd4800 	pop	{fp, lr}
   10710:	e12fff1e 	bx	lr
   10714:	3f201018 	.word	0x3f201018
   10718:	3f201000 	.word	0x3f201000
   1071c:	00015000 	.word	0x00015000

00010720 <uart0_get_char>:

char uart0_get_char() {
   10720:	e92d4800 	push	{fp, lr}
   10724:	e28db004 	add	fp, sp, #4
   10728:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   1072c:	e1a00000 	nop			; (mov r0, r0)
   10730:	e59f0048 	ldr	r0, [pc, #72]	; 10780 <uart0_get_char+0x60>
   10734:	ebffff86 	bl	10554 <mmio_read>
   10738:	e1a03000 	mov	r3, r0
   1073c:	e2033010 	and	r3, r3, #16
   10740:	e3530000 	cmp	r3, #0
   10744:	1afffff9 	bne	10730 <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   10748:	e59f0034 	ldr	r0, [pc, #52]	; 10784 <uart0_get_char+0x64>
   1074c:	ebffff80 	bl	10554 <mmio_read>
   10750:	e1a03000 	mov	r3, r0
   10754:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   10758:	e55b3005 	ldrb	r3, [fp, #-5]
   1075c:	e353000d 	cmp	r3, #13
   10760:	0a000001 	beq	1076c <uart0_get_char+0x4c>
   10764:	e55b3005 	ldrb	r3, [fp, #-5]
   10768:	ea000000 	b	10770 <uart0_get_char+0x50>
   1076c:	e3a0300a 	mov	r3, #10
}
   10770:	e1a00003 	mov	r0, r3
   10774:	e24bd004 	sub	sp, fp, #4
   10778:	e8bd4800 	pop	{fp, lr}
   1077c:	e12fff1e 	bx	lr
   10780:	3f201018 	.word	0x3f201018
   10784:	3f201000 	.word	0x3f201000

00010788 <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   10788:	e92d4800 	push	{fp, lr}
   1078c:	e28db004 	add	fp, sp, #4
   10790:	e24dd008 	sub	sp, sp, #8
   10794:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   10798:	ea00000b 	b	107cc <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   1079c:	e51b3008 	ldr	r3, [fp, #-8]
   107a0:	e5d33000 	ldrb	r3, [r3]
   107a4:	e353000a 	cmp	r3, #10
   107a8:	1a000001 	bne	107b4 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   107ac:	e3a0000d 	mov	r0, #13
   107b0:	ebffffb8 	bl	10698 <uart0_send_char>
		}
		uart0_send_char(*s++);
   107b4:	e51b3008 	ldr	r3, [fp, #-8]
   107b8:	e2832001 	add	r2, r3, #1
   107bc:	e50b2008 	str	r2, [fp, #-8]
   107c0:	e5d33000 	ldrb	r3, [r3]
   107c4:	e1a00003 	mov	r0, r3
   107c8:	ebffffb2 	bl	10698 <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   107cc:	e51b3008 	ldr	r3, [fp, #-8]
   107d0:	e5d33000 	ldrb	r3, [r3]
   107d4:	e3530000 	cmp	r3, #0
   107d8:	1affffef 	bne	1079c <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   107dc:	e24bd004 	sub	sp, fp, #4
   107e0:	e8bd4800 	pop	{fp, lr}
   107e4:	e12fff1e 	bx	lr

000107e8 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   107e8:	e92d0810 	push	{r4, fp}
   107ec:	e28db004 	add	fp, sp, #4
   107f0:	e24dd018 	sub	sp, sp, #24
   107f4:	e1a03000 	mov	r3, r0
   107f8:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   107fc:	e1a00000 	nop			; (mov r0, r0)
    } while (*MBOX_STATUS & MBOX_FULL);
   10800:	e59f30c0 	ldr	r3, [pc, #192]	; 108c8 <mailbox_send_message+0xe0>
   10804:	e5933000 	ldr	r3, [r3]
   10808:	e3530000 	cmp	r3, #0
   1080c:	bafffffa 	blt	107fc <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   10810:	e55b1015 	ldrb	r1, [fp, #-21]	; 0xffffffeb
   10814:	e3a02000 	mov	r2, #0
   10818:	e59f30ac 	ldr	r3, [pc, #172]	; 108cc <mailbox_send_message+0xe4>
   1081c:	e3a04000 	mov	r4, #0
   10820:	e1833001 	orr	r3, r3, r1
   10824:	e1844002 	orr	r4, r4, r2
   10828:	e50b300c 	str	r3, [fp, #-12]
   1082c:	e50b4008 	str	r4, [fp, #-8]
    *MBOX_WRITE = mailbox_addr_or_channel;
   10830:	e59f2098 	ldr	r2, [pc, #152]	; 108d0 <mailbox_send_message+0xe8>
   10834:	e51b300c 	ldr	r3, [fp, #-12]
   10838:	e5823000 	str	r3, [r2]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   1083c:	e1a00000 	nop			; (mov r0, r0)
        } while(*MBOX_STATUS & MBOX_EMPTY);
   10840:	e59f3080 	ldr	r3, [pc, #128]	; 108c8 <mailbox_send_message+0xe0>
   10844:	e5933000 	ldr	r3, [r3]
   10848:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   1084c:	e3530000 	cmp	r3, #0
   10850:	1afffff9 	bne	1083c <mailbox_send_message+0x54>
        
        uint32 response = *MBOX_READ;
   10854:	e59f3078 	ldr	r3, [pc, #120]	; 108d4 <mailbox_send_message+0xec>
   10858:	e5933000 	ldr	r3, [r3]
   1085c:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   10860:	e51b3010 	ldr	r3, [fp, #-16]
   10864:	e20330ff 	and	r3, r3, #255	; 0xff
   10868:	e203200f 	and	r2, r3, #15
   1086c:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   10870:	e1520003 	cmp	r2, r3
   10874:	1a00000d 	bne	108b0 <mailbox_send_message+0xc8>
   10878:	e51b3010 	ldr	r3, [fp, #-16]
   1087c:	e3c3300f 	bic	r3, r3, #15
   10880:	e59f2044 	ldr	r2, [pc, #68]	; 108cc <mailbox_send_message+0xe4>
   10884:	e1530002 	cmp	r3, r2
   10888:	1a000008 	bne	108b0 <mailbox_send_message+0xc8>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   1088c:	e59f3038 	ldr	r3, [pc, #56]	; 108cc <mailbox_send_message+0xe4>
   10890:	e5933004 	ldr	r3, [r3, #4]
   10894:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   10898:	03a03001 	moveq	r3, #1
   1089c:	13a03000 	movne	r3, #0
   108a0:	e20330ff 	and	r3, r3, #255	; 0xff
   108a4:	e20330ff 	and	r3, r3, #255	; 0xff
   108a8:	e3a04000 	mov	r4, #0
   108ac:	ea000000 	b	108b4 <mailbox_send_message+0xcc>
        }
    }
   108b0:	eaffffe1 	b	1083c <mailbox_send_message+0x54>
    return 0;
}
   108b4:	e1a00003 	mov	r0, r3
   108b8:	e1a01004 	mov	r1, r4
   108bc:	e24bd004 	sub	sp, fp, #4
   108c0:	e8bd0810 	pop	{r4, fp}
   108c4:	e12fff1e 	bx	lr
   108c8:	3f00b898 	.word	0x3f00b898
   108cc:	00015010 	.word	0x00015010
   108d0:	3f00b8a0 	.word	0x3f00b8a0
   108d4:	3f00b880 	.word	0x3f00b880

000108d8 <undefined_instruction_handler>:
//Handles traps
#include "arm.h"

void undefined_instruction_handler(struct trap_frame* tf) {
   108d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   108dc:	e28db000 	add	fp, sp, #0
   108e0:	e24dd00c 	sub	sp, sp, #12
   108e4:	e50b0008 	str	r0, [fp, #-8]
	
}
   108e8:	e24bd000 	sub	sp, fp, #0
   108ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   108f0:	e12fff1e 	bx	lr

000108f4 <software_interrupt_handler>:
void software_interrupt_handler(struct trap_frame* tf) {
   108f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   108f8:	e28db000 	add	fp, sp, #0
   108fc:	e24dd00c 	sub	sp, sp, #12
   10900:	e50b0008 	str	r0, [fp, #-8]
	
}
   10904:	e24bd000 	sub	sp, fp, #0
   10908:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1090c:	e12fff1e 	bx	lr

00010910 <prefetch_abort_handler>:
void prefetch_abort_handler(struct trap_frame* tf) {
   10910:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10914:	e28db000 	add	fp, sp, #0
   10918:	e24dd00c 	sub	sp, sp, #12
   1091c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10920:	e24bd000 	sub	sp, fp, #0
   10924:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10928:	e12fff1e 	bx	lr

0001092c <data_abort_handler>:
void data_abort_handler(struct trap_frame* tf) {
   1092c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10930:	e28db000 	add	fp, sp, #0
   10934:	e24dd00c 	sub	sp, sp, #12
   10938:	e50b0008 	str	r0, [fp, #-8]
	
}
   1093c:	e24bd000 	sub	sp, fp, #0
   10940:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10944:	e12fff1e 	bx	lr

00010948 <unused_exception_handler>:
void unused_exception_handler(struct trap_frame* tf) {
   10948:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1094c:	e28db000 	add	fp, sp, #0
   10950:	e24dd00c 	sub	sp, sp, #12
   10954:	e50b0008 	str	r0, [fp, #-8]
	
}
   10958:	e24bd000 	sub	sp, fp, #0
   1095c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10960:	e12fff1e 	bx	lr

00010964 <irq_handler>:
void irq_handler(struct trap_frame* tf) {
   10964:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10968:	e28db000 	add	fp, sp, #0
   1096c:	e24dd00c 	sub	sp, sp, #12
   10970:	e50b0008 	str	r0, [fp, #-8]
	
}
   10974:	e24bd000 	sub	sp, fp, #0
   10978:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1097c:	e12fff1e 	bx	lr

00010980 <fiq_handler>:
void fiq_handler(struct trap_frame* tf) {
   10980:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10984:	e28db000 	add	fp, sp, #0
   10988:	e24dd00c 	sub	sp, sp, #12
   1098c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10990:	e24bd000 	sub	sp, fp, #0
   10994:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10998:	e12fff1e 	bx	lr
