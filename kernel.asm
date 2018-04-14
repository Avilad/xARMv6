
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
   1004c:	eb000075 	bl	10228 <kmain>

00010050 <loop_forever>:
   10050:	e320f002 	wfe
   10054:	eafffffd 	b	10050 <loop_forever>
   10058:	00012000 	.word	0x00012000
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
   10090:	eb0001cd 	bl	107cc <fiq_handler>
   10094:	ea00002e 	b	10154 <trap_return>

00010098 <undefined_instruction_handler_asm>:
   10098:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1009c:	e14f2000 	mrs	r2, SPSR
   100a0:	e92d0004 	stmfd	sp!, {r2}
   100a4:	e94d6000 	stmdb	sp, {sp, lr}^
   100a8:	e24dd008 	sub	sp, sp, #8
   100ac:	e1a0000d 	mov	r0, sp
   100b0:	eb00019b 	bl	10724 <undefined_instruction_handler>
   100b4:	ea000026 	b	10154 <trap_return>

000100b8 <software_interrupt_handler_asm>:
   100b8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100bc:	e14f2000 	mrs	r2, SPSR
   100c0:	e92d0004 	stmfd	sp!, {r2}
   100c4:	e94d6000 	stmdb	sp, {sp, lr}^
   100c8:	e24dd008 	sub	sp, sp, #8
   100cc:	e1a0000d 	mov	r0, sp
   100d0:	eb00019a 	bl	10740 <software_interrupt_handler>
   100d4:	ea00001e 	b	10154 <trap_return>

000100d8 <prefetch_abort_handler_asm>:
   100d8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100dc:	e14f2000 	mrs	r2, SPSR
   100e0:	e92d0004 	stmfd	sp!, {r2}
   100e4:	e94d6000 	stmdb	sp, {sp, lr}^
   100e8:	e24dd008 	sub	sp, sp, #8
   100ec:	e1a0000d 	mov	r0, sp
   100f0:	eb000199 	bl	1075c <prefetch_abort_handler>
   100f4:	ea000016 	b	10154 <trap_return>

000100f8 <data_abort_handler_asm>:
   100f8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100fc:	e14f2000 	mrs	r2, SPSR
   10100:	e92d0004 	stmfd	sp!, {r2}
   10104:	e94d6000 	stmdb	sp, {sp, lr}^
   10108:	e24dd008 	sub	sp, sp, #8
   1010c:	e1a0000d 	mov	r0, sp
   10110:	eb000198 	bl	10778 <data_abort_handler>
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
   10150:	eb000196 	bl	107b0 <irq_handler>

00010154 <trap_return>:
   10154:	e8dd6000 	ldm	sp, {sp, lr}^
   10158:	e28dd008 	add	sp, sp, #8
   1015c:	e8bd0004 	ldmfd	sp!, {r2}
   10160:	e16ff002 	msr	SPSR_fsxc, r2
   10164:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

00010168 <get_cpsr>:
//Helpful arm assembly intrinsics
#ifndef ARM_ASM_INTRINSICS_H
#define ARM_ASM_INTRINSICS_H

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
   101e4:	e8bd8810 	pop	{r4, fp, pc}

000101e8 <enable_irq_interrupts>:

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void enable_irq_interrupts() {
   101e8:	e92d4818 	push	{r3, r4, fp, lr}
   101ec:	e28db00c 	add	fp, sp, #12
	register uint32 cur_cpsr = get_cpsr();
   101f0:	ebffffdc 	bl	10168 <get_cpsr>
   101f4:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr & ~PSR_IRQ_INTERRUPT_DISABLE;
   101f8:	e3c44080 	bic	r4, r4, #128	; 0x80
	set_cpsr(cur_cpsr);
   101fc:	e1a00004 	mov	r0, r4
   10200:	ebffffe1 	bl	1018c <set_cpsr>
}
   10204:	e8bd8818 	pop	{r3, r4, fp, pc}

00010208 <disable_irq_interrupts>:

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void disable_irq_interrupts() {
   10208:	e92d4818 	push	{r3, r4, fp, lr}
   1020c:	e28db00c 	add	fp, sp, #12
	register uint32 cur_cpsr = get_cpsr();
   10210:	ebffffd4 	bl	10168 <get_cpsr>
   10214:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr | PSR_IRQ_INTERRUPT_DISABLE;
   10218:	e3844080 	orr	r4, r4, #128	; 0x80
	set_cpsr(cur_cpsr);
   1021c:	e1a00004 	mov	r0, r4
   10220:	ebffffd9 	bl	1018c <set_cpsr>
}
   10224:	e8bd8818 	pop	{r3, r4, fp, pc}

00010228 <kmain>:

struct run {
  struct run *next;
};

void kmain(void) {
   10228:	e92d4800 	push	{fp, lr}
   1022c:	e28db004 	add	fp, sp, #4
   10230:	e24dd018 	sub	sp, sp, #24
	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
   10234:	e3a00000 	mov	r0, #0
   10238:	e3001060 	movw	r1, #96	; 0x60
   1023c:	e3401001 	movt	r1, #1
   10240:	e3002168 	movw	r2, #360	; 0x168
   10244:	e3402001 	movt	r2, #1
   10248:	eb0001ba 	bl	10938 <memcpy_region>
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   1024c:	e3060000 	movw	r0, #24576	; 0x6000
   10250:	e3400001 	movt	r0, #1
   10254:	e30610a0 	movw	r1, #24736	; 0x60a0
   10258:	e3401001 	movt	r1, #1
   1025c:	eb00020d 	bl	10a98 <zero_region>

	//---UART initialization
	uart0_init();
   10260:	eb000054 	bl	103b8 <uart0_init>
	uart0_put_str("Hello, world!\n");
   10264:	e301002c 	movw	r0, #4140	; 0x102c
   10268:	e3400001 	movt	r0, #1
   1026c:	eb0000d6 	bl	105cc <uart0_put_str>
	 */


	
	// Identity map 
	uint32 offset = 0;
   10270:	e3a03000 	mov	r3, #0
   10274:	e50b3008 	str	r3, [fp, #-8]
	uint32* page_table_base = (uint32*)((uint32)(kernel_end + 0x4000) & ~0x3FFF);
   10278:	e59f30e0 	ldr	r3, [pc, #224]	; 10360 <kmain+0x138>
   1027c:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
   10280:	e3c3303f 	bic	r3, r3, #63	; 0x3f
   10284:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
	uint64 phystop = 2*GB;
   10288:	e3a02102 	mov	r2, #-2147483648	; 0x80000000
   1028c:	e3e03000 	mvn	r3, #0
   10290:	e14b21f4 	strd	r2, [fp, #-20]	; 0xffffffec
	for(uint32 vaddr = 0; vaddr <= 2*GB; vaddr += MB) {
   10294:	e3a03000 	mov	r3, #0
   10298:	e50b300c 	str	r3, [fp, #-12]
   1029c:	ea000012 	b	102ec <kmain+0xc4>
		uint32* pt_entry = page_table_base + offset;
   102a0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   102a4:	e51b3008 	ldr	r3, [fp, #-8]
   102a8:	e1a03103 	lsl	r3, r3, #2
   102ac:	e0823003 	add	r3, r2, r3
   102b0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
		*pt_entry = 0; 
   102b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   102b8:	e3a02000 	mov	r2, #0
   102bc:	e5832000 	str	r2, [r3]
		*pt_entry = (uint32)vaddr | AP_DONT_CHECK_PERMS | USE_SECTIONS;
   102c0:	e51b300c 	ldr	r3, [fp, #-12]
   102c4:	e3833b03 	orr	r3, r3, #3072	; 0xc00
   102c8:	e3833002 	orr	r3, r3, #2
   102cc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   102d0:	e5823000 	str	r3, [r2]
		offset++;
   102d4:	e51b3008 	ldr	r3, [fp, #-8]
   102d8:	e2833001 	add	r3, r3, #1
   102dc:	e50b3008 	str	r3, [fp, #-8]
	
	// Identity map 
	uint32 offset = 0;
	uint32* page_table_base = (uint32*)((uint32)(kernel_end + 0x4000) & ~0x3FFF);
	uint64 phystop = 2*GB;
	for(uint32 vaddr = 0; vaddr <= 2*GB; vaddr += MB) {
   102e0:	e51b300c 	ldr	r3, [fp, #-12]
   102e4:	e2833601 	add	r3, r3, #1048576	; 0x100000
   102e8:	e50b300c 	str	r3, [fp, #-12]
   102ec:	e51b300c 	ldr	r3, [fp, #-12]
   102f0:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   102f4:	9affffe9 	bls	102a0 <kmain+0x78>
		*pt_entry = (uint32)vaddr | AP_DONT_CHECK_PERMS | USE_SECTIONS;
		offset++;
	}

	// Enable the MMU
	set_operating_mode(PSR_SYSTEM_MODE);
   102f8:	e3a0001f 	mov	r0, #31
   102fc:	ebffffab 	bl	101b0 <set_operating_mode>
	asm volatile("mov r0, $4;"
   10300:	e24b301c 	sub	r3, fp, #28
   10304:	e3a00004 	mov	r0, #4
   10308:	e1e00000 	mvn	r0, r0
   1030c:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   10310:	e0001001 	and	r1, r0, r1
   10314:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
   10318:	e3a01000 	mov	r1, #0
   1031c:	ee021f50 	mcr	15, 0, r1, cr2, cr0, {2}
   10320:	ee071f15 	mcr	15, 0, r1, cr7, cr5, {0}
   10324:	ee071f95 	mcr	15, 0, r1, cr7, cr5, {4}
   10328:	ee081f17 	mcr	15, 0, r1, cr8, cr7, {0}
   1032c:	e5930000 	ldr	r0, [r3]
   10330:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
   10334:	f57ff04f 	dsb	sy
   10338:	e3e00000 	mvn	r0, #0
   1033c:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
   10340:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   10344:	e3811001 	orr	r1, r1, #1
   10348:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
				 :
				 : "r"(&page_table_base)
				 : "memory", "r0", "r1");

	while (1) {
		uart0_send_char(uart0_get_char());
   1034c:	eb000085 	bl	10568 <uart0_get_char>
   10350:	e1a03000 	mov	r3, r0
   10354:	e1a00003 	mov	r0, r3
   10358:	eb00005f 	bl	104dc <uart0_send_char>
	}
   1035c:	eafffffa 	b	1034c <kmain+0x124>
   10360:	0001a0a0 	.word	0x0001a0a0

00010364 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   10364:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10368:	e28db000 	add	fp, sp, #0
   1036c:	e24dd00c 	sub	sp, sp, #12
   10370:	e50b0008 	str	r0, [fp, #-8]
   10374:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   10378:	e51b3008 	ldr	r3, [fp, #-8]
   1037c:	e51b200c 	ldr	r2, [fp, #-12]
   10380:	e5832000 	str	r2, [r3]
}
   10384:	e24bd000 	sub	sp, fp, #0
   10388:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1038c:	e12fff1e 	bx	lr

00010390 <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   10390:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10394:	e28db000 	add	fp, sp, #0
   10398:	e24dd00c 	sub	sp, sp, #12
   1039c:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   103a0:	e51b3008 	ldr	r3, [fp, #-8]
   103a4:	e5933000 	ldr	r3, [r3]
}
   103a8:	e1a00003 	mov	r0, r3
   103ac:	e24bd000 	sub	sp, fp, #0
   103b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   103b4:	e12fff1e 	bx	lr

000103b8 <uart0_init>:

void uart0_init() {
   103b8:	e92d4800 	push	{fp, lr}
   103bc:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
	// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   103c0:	e3010030 	movw	r0, #4144	; 0x1030
   103c4:	e3430f20 	movt	r0, #16160	; 0x3f20
   103c8:	e3a01000 	mov	r1, #0
   103cc:	ebffffe4 	bl	10364 <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   103d0:	e3a00094 	mov	r0, #148	; 0x94
   103d4:	e3430f20 	movt	r0, #16160	; 0x3f20
   103d8:	e3a01000 	mov	r1, #0
   103dc:	ebffffe0 	bl	10364 <mmio_write>
	delay(150);
   103e0:	e3063000 	movw	r3, #24576	; 0x6000
   103e4:	e3403001 	movt	r3, #1
   103e8:	e3a02096 	mov	r2, #150	; 0x96
   103ec:	e5832000 	str	r2, [r3]
   103f0:	ea000000 	b	103f8 <uart0_init+0x40>
   103f4:	e320f000 	nop	{0}
   103f8:	e3063000 	movw	r3, #24576	; 0x6000
   103fc:	e3403001 	movt	r3, #1
   10400:	e5932000 	ldr	r2, [r3]
   10404:	e2421001 	sub	r1, r2, #1
   10408:	e3063000 	movw	r3, #24576	; 0x6000
   1040c:	e3403001 	movt	r3, #1
   10410:	e5831000 	str	r1, [r3]
   10414:	e3520000 	cmp	r2, #0
   10418:	1afffff5 	bne	103f4 <uart0_init+0x3c>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   1041c:	e3a00098 	mov	r0, #152	; 0x98
   10420:	e3430f20 	movt	r0, #16160	; 0x3f20
   10424:	e3a01903 	mov	r1, #49152	; 0xc000
   10428:	ebffffcd 	bl	10364 <mmio_write>
	delay(150);
   1042c:	e3063000 	movw	r3, #24576	; 0x6000
   10430:	e3403001 	movt	r3, #1
   10434:	e3a02096 	mov	r2, #150	; 0x96
   10438:	e5832000 	str	r2, [r3]
   1043c:	ea000000 	b	10444 <uart0_init+0x8c>
   10440:	e320f000 	nop	{0}
   10444:	e3063000 	movw	r3, #24576	; 0x6000
   10448:	e3403001 	movt	r3, #1
   1044c:	e5932000 	ldr	r2, [r3]
   10450:	e2421001 	sub	r1, r2, #1
   10454:	e3063000 	movw	r3, #24576	; 0x6000
   10458:	e3403001 	movt	r3, #1
   1045c:	e5831000 	str	r1, [r3]
   10460:	e3520000 	cmp	r2, #0
   10464:	1afffff5 	bne	10440 <uart0_init+0x88>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   10468:	e3a00098 	mov	r0, #152	; 0x98
   1046c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10470:	e3a01000 	mov	r1, #0
   10474:	ebffffba 	bl	10364 <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10478:	e3010044 	movw	r0, #4164	; 0x1044
   1047c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10480:	e30017ff 	movw	r1, #2047	; 0x7ff
   10484:	ebffffb6 	bl	10364 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   10488:	e3010024 	movw	r0, #4132	; 0x1024
   1048c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10490:	e3a01001 	mov	r1, #1
   10494:	ebffffb2 	bl	10364 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   10498:	e3010028 	movw	r0, #4136	; 0x1028
   1049c:	e3430f20 	movt	r0, #16160	; 0x3f20
   104a0:	e3a01028 	mov	r1, #40	; 0x28
   104a4:	ebffffae 	bl	10364 <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   104a8:	e301002c 	movw	r0, #4140	; 0x102c
   104ac:	e3430f20 	movt	r0, #16160	; 0x3f20
   104b0:	e3a01070 	mov	r1, #112	; 0x70
   104b4:	ebffffaa 	bl	10364 <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   104b8:	e3010038 	movw	r0, #4152	; 0x1038
   104bc:	e3430f20 	movt	r0, #16160	; 0x3f20
   104c0:	e30017f2 	movw	r1, #2034	; 0x7f2
   104c4:	ebffffa6 	bl	10364 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   104c8:	e3010030 	movw	r0, #4144	; 0x1030
   104cc:	e3430f20 	movt	r0, #16160	; 0x3f20
   104d0:	e3001301 	movw	r1, #769	; 0x301
   104d4:	ebffffa2 	bl	10364 <mmio_write>
#endif
}
   104d8:	e8bd8800 	pop	{fp, pc}

000104dc <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   104dc:	e92d4800 	push	{fp, lr}
   104e0:	e28db004 	add	fp, sp, #4
   104e4:	e24dd008 	sub	sp, sp, #8
   104e8:	e1a03000 	mov	r3, r0
   104ec:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   104f0:	e1a00000 	nop			; (mov r0, r0)
   104f4:	e3010018 	movw	r0, #4120	; 0x1018
   104f8:	e3430f20 	movt	r0, #16160	; 0x3f20
   104fc:	ebffffa3 	bl	10390 <mmio_read>
   10500:	e1a03000 	mov	r3, r0
   10504:	e2033020 	and	r3, r3, #32
   10508:	e3530000 	cmp	r3, #0
   1050c:	1afffff8 	bne	104f4 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   10510:	e55b3005 	ldrb	r3, [fp, #-5]
   10514:	e3a00a01 	mov	r0, #4096	; 0x1000
   10518:	e3430f20 	movt	r0, #16160	; 0x3f20
   1051c:	e1a01003 	mov	r1, r3
   10520:	ebffff8f 	bl	10364 <mmio_write>
	delay(150);
   10524:	e3063000 	movw	r3, #24576	; 0x6000
   10528:	e3403001 	movt	r3, #1
   1052c:	e3a02096 	mov	r2, #150	; 0x96
   10530:	e5832000 	str	r2, [r3]
   10534:	ea000000 	b	1053c <uart0_send_char+0x60>
   10538:	e320f000 	nop	{0}
   1053c:	e3063000 	movw	r3, #24576	; 0x6000
   10540:	e3403001 	movt	r3, #1
   10544:	e5932000 	ldr	r2, [r3]
   10548:	e2421001 	sub	r1, r2, #1
   1054c:	e3063000 	movw	r3, #24576	; 0x6000
   10550:	e3403001 	movt	r3, #1
   10554:	e5831000 	str	r1, [r3]
   10558:	e3520000 	cmp	r2, #0
   1055c:	1afffff5 	bne	10538 <uart0_send_char+0x5c>
}
   10560:	e24bd004 	sub	sp, fp, #4
   10564:	e8bd8800 	pop	{fp, pc}

00010568 <uart0_get_char>:

char uart0_get_char() {
   10568:	e92d4800 	push	{fp, lr}
   1056c:	e28db004 	add	fp, sp, #4
   10570:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   10574:	e1a00000 	nop			; (mov r0, r0)
   10578:	e3010018 	movw	r0, #4120	; 0x1018
   1057c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10580:	ebffff82 	bl	10390 <mmio_read>
   10584:	e1a03000 	mov	r3, r0
   10588:	e2033010 	and	r3, r3, #16
   1058c:	e3530000 	cmp	r3, #0
   10590:	1afffff8 	bne	10578 <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   10594:	e3a00a01 	mov	r0, #4096	; 0x1000
   10598:	e3430f20 	movt	r0, #16160	; 0x3f20
   1059c:	ebffff7b 	bl	10390 <mmio_read>
   105a0:	e1a03000 	mov	r3, r0
   105a4:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   105a8:	e55b3005 	ldrb	r3, [fp, #-5]
   105ac:	e353000d 	cmp	r3, #13
   105b0:	0a000001 	beq	105bc <uart0_get_char+0x54>
   105b4:	e55b3005 	ldrb	r3, [fp, #-5]
   105b8:	ea000000 	b	105c0 <uart0_get_char+0x58>
   105bc:	e3a0300a 	mov	r3, #10
}
   105c0:	e1a00003 	mov	r0, r3
   105c4:	e24bd004 	sub	sp, fp, #4
   105c8:	e8bd8800 	pop	{fp, pc}

000105cc <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   105cc:	e92d4800 	push	{fp, lr}
   105d0:	e28db004 	add	fp, sp, #4
   105d4:	e24dd008 	sub	sp, sp, #8
   105d8:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   105dc:	ea00000b 	b	10610 <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   105e0:	e51b3008 	ldr	r3, [fp, #-8]
   105e4:	e5d33000 	ldrb	r3, [r3]
   105e8:	e353000a 	cmp	r3, #10
   105ec:	1a000001 	bne	105f8 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   105f0:	e3a0000d 	mov	r0, #13
   105f4:	ebffffb8 	bl	104dc <uart0_send_char>
		}
		uart0_send_char(*s++);
   105f8:	e51b3008 	ldr	r3, [fp, #-8]
   105fc:	e2832001 	add	r2, r3, #1
   10600:	e50b2008 	str	r2, [fp, #-8]
   10604:	e5d33000 	ldrb	r3, [r3]
   10608:	e1a00003 	mov	r0, r3
   1060c:	ebffffb2 	bl	104dc <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   10610:	e51b3008 	ldr	r3, [fp, #-8]
   10614:	e5d33000 	ldrb	r3, [r3]
   10618:	e3530000 	cmp	r3, #0
   1061c:	1affffef 	bne	105e0 <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   10620:	e24bd004 	sub	sp, fp, #4
   10624:	e8bd8800 	pop	{fp, pc}

00010628 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   10628:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1062c:	e28db000 	add	fp, sp, #0
   10630:	e24dd01c 	sub	sp, sp, #28
   10634:	e1a03000 	mov	r3, r0
   10638:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   1063c:	e320f000 	nop	{0}
    } while (*MBOX_STATUS & MBOX_FULL);
   10640:	e30b3898 	movw	r3, #47256	; 0xb898
   10644:	e3433f00 	movt	r3, #16128	; 0x3f00
   10648:	e5933000 	ldr	r3, [r3]
   1064c:	e3530000 	cmp	r3, #0
   10650:	bafffff9 	blt	1063c <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   10654:	e55b0015 	ldrb	r0, [fp, #-21]	; 0xffffffeb
   10658:	e3a01000 	mov	r1, #0
   1065c:	e3063010 	movw	r3, #24592	; 0x6010
   10660:	e3403001 	movt	r3, #1
   10664:	e1a02003 	mov	r2, r3
   10668:	e3a03000 	mov	r3, #0
   1066c:	e1822000 	orr	r2, r2, r0
   10670:	e1833001 	orr	r3, r3, r1
   10674:	e14b20fc 	strd	r2, [fp, #-12]
    *MBOX_WRITE = mailbox_addr_or_channel;
   10678:	e30b38a0 	movw	r3, #47264	; 0xb8a0
   1067c:	e3433f00 	movt	r3, #16128	; 0x3f00
   10680:	e51b200c 	ldr	r2, [fp, #-12]
   10684:	e5832000 	str	r2, [r3]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   10688:	e320f000 	nop	{0}
        } while(*MBOX_STATUS & MBOX_EMPTY);
   1068c:	e30b3898 	movw	r3, #47256	; 0xb898
   10690:	e3433f00 	movt	r3, #16128	; 0x3f00
   10694:	e5933000 	ldr	r3, [r3]
   10698:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   1069c:	e3530000 	cmp	r3, #0
   106a0:	1afffff8 	bne	10688 <mailbox_send_message+0x60>
        
        uint32 response = *MBOX_READ;
   106a4:	e30b3880 	movw	r3, #47232	; 0xb880
   106a8:	e3433f00 	movt	r3, #16128	; 0x3f00
   106ac:	e5933000 	ldr	r3, [r3]
   106b0:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   106b4:	e51b3010 	ldr	r3, [fp, #-16]
   106b8:	e6ef3073 	uxtb	r3, r3
   106bc:	e203200f 	and	r2, r3, #15
   106c0:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   106c4:	e1520003 	cmp	r2, r3
   106c8:	1a00000f 	bne	1070c <mailbox_send_message+0xe4>
   106cc:	e51b3010 	ldr	r3, [fp, #-16]
   106d0:	e3c3200f 	bic	r2, r3, #15
   106d4:	e3063010 	movw	r3, #24592	; 0x6010
   106d8:	e3403001 	movt	r3, #1
   106dc:	e1520003 	cmp	r2, r3
   106e0:	1a000009 	bne	1070c <mailbox_send_message+0xe4>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   106e4:	e3063010 	movw	r3, #24592	; 0x6010
   106e8:	e3403001 	movt	r3, #1
   106ec:	e5933004 	ldr	r3, [r3, #4]
   106f0:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   106f4:	03a03001 	moveq	r3, #1
   106f8:	13a03000 	movne	r3, #0
   106fc:	e6ef3073 	uxtb	r3, r3
   10700:	e6ef2073 	uxtb	r2, r3
   10704:	e3a03000 	mov	r3, #0
   10708:	ea000000 	b	10710 <mailbox_send_message+0xe8>
        }
    }
   1070c:	eaffffdd 	b	10688 <mailbox_send_message+0x60>
    return 0;
}
   10710:	e1a00002 	mov	r0, r2
   10714:	e1a01003 	mov	r1, r3
   10718:	e24bd000 	sub	sp, fp, #0
   1071c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10720:	e12fff1e 	bx	lr

00010724 <undefined_instruction_handler>:
//Handles traps
#include "arm.h"

void undefined_instruction_handler(struct trap_frame* tf) {
   10724:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10728:	e28db000 	add	fp, sp, #0
   1072c:	e24dd00c 	sub	sp, sp, #12
   10730:	e50b0008 	str	r0, [fp, #-8]
	
}
   10734:	e24bd000 	sub	sp, fp, #0
   10738:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1073c:	e12fff1e 	bx	lr

00010740 <software_interrupt_handler>:
void software_interrupt_handler(struct trap_frame* tf) {
   10740:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10744:	e28db000 	add	fp, sp, #0
   10748:	e24dd00c 	sub	sp, sp, #12
   1074c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10750:	e24bd000 	sub	sp, fp, #0
   10754:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10758:	e12fff1e 	bx	lr

0001075c <prefetch_abort_handler>:
void prefetch_abort_handler(struct trap_frame* tf) {
   1075c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10760:	e28db000 	add	fp, sp, #0
   10764:	e24dd00c 	sub	sp, sp, #12
   10768:	e50b0008 	str	r0, [fp, #-8]
	
}
   1076c:	e24bd000 	sub	sp, fp, #0
   10770:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10774:	e12fff1e 	bx	lr

00010778 <data_abort_handler>:
void data_abort_handler(struct trap_frame* tf) {
   10778:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1077c:	e28db000 	add	fp, sp, #0
   10780:	e24dd00c 	sub	sp, sp, #12
   10784:	e50b0008 	str	r0, [fp, #-8]
	
}
   10788:	e24bd000 	sub	sp, fp, #0
   1078c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10790:	e12fff1e 	bx	lr

00010794 <unused_exception_handler>:
void unused_exception_handler(struct trap_frame* tf) {
   10794:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10798:	e28db000 	add	fp, sp, #0
   1079c:	e24dd00c 	sub	sp, sp, #12
   107a0:	e50b0008 	str	r0, [fp, #-8]
	
}
   107a4:	e24bd000 	sub	sp, fp, #0
   107a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107ac:	e12fff1e 	bx	lr

000107b0 <irq_handler>:
void irq_handler(struct trap_frame* tf) {
   107b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107b4:	e28db000 	add	fp, sp, #0
   107b8:	e24dd00c 	sub	sp, sp, #12
   107bc:	e50b0008 	str	r0, [fp, #-8]
	
}
   107c0:	e24bd000 	sub	sp, fp, #0
   107c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107c8:	e12fff1e 	bx	lr

000107cc <fiq_handler>:
void fiq_handler(struct trap_frame* tf) {
   107cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107d0:	e28db000 	add	fp, sp, #0
   107d4:	e24dd00c 	sub	sp, sp, #12
   107d8:	e50b0008 	str	r0, [fp, #-8]
	
}
   107dc:	e24bd000 	sub	sp, fp, #0
   107e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107e4:	e12fff1e 	bx	lr

000107e8 <memcpy>:
//Useful memory functions like memcpy
#include "utils.h"

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint32 size) {
   107e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107ec:	e28db000 	add	fp, sp, #0
   107f0:	e24dd024 	sub	sp, sp, #36	; 0x24
   107f4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   107f8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   107fc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10800:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10804:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   10808:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1080c:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   10810:	e51b200c 	ldr	r2, [fp, #-12]
   10814:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10818:	e0823003 	add	r3, r2, r3
   1081c:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10820:	ea000007 	b	10844 <memcpy+0x5c>
		*dest++ = *src++;
   10824:	e51b3008 	ldr	r3, [fp, #-8]
   10828:	e2832001 	add	r2, r3, #1
   1082c:	e50b2008 	str	r2, [fp, #-8]
   10830:	e51b200c 	ldr	r2, [fp, #-12]
   10834:	e2821001 	add	r1, r2, #1
   10838:	e50b100c 	str	r1, [fp, #-12]
   1083c:	e5d22000 	ldrb	r2, [r2]
   10840:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint32 size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   10844:	e51b200c 	ldr	r2, [fp, #-12]
   10848:	e51b3010 	ldr	r3, [fp, #-16]
   1084c:	e1520003 	cmp	r2, r3
   10850:	1afffff3 	bne	10824 <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   10854:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10858:	e1a00003 	mov	r0, r3
   1085c:	e24bd000 	sub	sp, fp, #0
   10860:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10864:	e12fff1e 	bx	lr

00010868 <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, const void* source, uint32 size) {
   10868:	e92d4800 	push	{fp, lr}
   1086c:	e28db004 	add	fp, sp, #4
   10870:	e24dd020 	sub	sp, sp, #32
   10874:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10878:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   1087c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   10880:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10884:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10888:	e1520003 	cmp	r2, r3
   1088c:	1a000001 	bne	10898 <memmove+0x30>
		return destination;
   10890:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10894:	ea000024 	b	1092c <memmove+0xc4>
	}
	if (destination < source) {
   10898:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   1089c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   108a0:	e1520003 	cmp	r2, r3
   108a4:	2a000005 	bcs	108c0 <memmove+0x58>
		return memcpy(destination, source, size);
   108a8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
   108ac:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   108b0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   108b4:	ebffffcb 	bl	107e8 <memcpy>
   108b8:	e1a03000 	mov	r3, r0
   108bc:	ea00001a 	b	1092c <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   108c0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   108c4:	e2433001 	sub	r3, r3, #1
   108c8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   108cc:	e0823003 	add	r3, r2, r3
   108d0:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   108d4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   108d8:	e2433001 	sub	r3, r3, #1
   108dc:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   108e0:	e0823003 	add	r3, r2, r3
   108e4:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   108e8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   108ec:	e2433001 	sub	r3, r3, #1
   108f0:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   108f4:	ea000007 	b	10918 <memmove+0xb0>
		*dest-- = *src--;
   108f8:	e51b3008 	ldr	r3, [fp, #-8]
   108fc:	e2432001 	sub	r2, r3, #1
   10900:	e50b2008 	str	r2, [fp, #-8]
   10904:	e51b200c 	ldr	r2, [fp, #-12]
   10908:	e2421001 	sub	r1, r2, #1
   1090c:	e50b100c 	str	r1, [fp, #-12]
   10910:	e5d22000 	ldrb	r2, [r2]
   10914:	e5c32000 	strb	r2, [r3]
		return memcpy(destination, source, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   10918:	e51b200c 	ldr	r2, [fp, #-12]
   1091c:	e51b3010 	ldr	r3, [fp, #-16]
   10920:	e1520003 	cmp	r2, r3
   10924:	1afffff3 	bne	108f8 <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   10928:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   1092c:	e1a00003 	mov	r0, r3
   10930:	e24bd004 	sub	sp, fp, #4
   10934:	e8bd8800 	pop	{fp, pc}

00010938 <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
   10938:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1093c:	e28db000 	add	fp, sp, #0
   10940:	e24dd024 	sub	sp, sp, #36	; 0x24
   10944:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10948:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   1094c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10950:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10954:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   10958:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1095c:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   10960:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10964:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10968:	ea000007 	b	1098c <memcpy_region+0x54>
		*dest++ = *src++;
   1096c:	e51b3008 	ldr	r3, [fp, #-8]
   10970:	e2832001 	add	r2, r3, #1
   10974:	e50b2008 	str	r2, [fp, #-8]
   10978:	e51b200c 	ldr	r2, [fp, #-12]
   1097c:	e2821001 	add	r1, r2, #1
   10980:	e50b100c 	str	r1, [fp, #-12]
   10984:	e5d22000 	ldrb	r2, [r2]
   10988:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   1098c:	e51b200c 	ldr	r2, [fp, #-12]
   10990:	e51b3010 	ldr	r3, [fp, #-16]
   10994:	e1520003 	cmp	r2, r3
   10998:	1afffff3 	bne	1096c <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   1099c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   109a0:	e1a00003 	mov	r0, r3
   109a4:	e24bd000 	sub	sp, fp, #0
   109a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   109ac:	e12fff1e 	bx	lr

000109b0 <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* destination, const void* source_start, const void* source_end) {
   109b0:	e92d4800 	push	{fp, lr}
   109b4:	e28db004 	add	fp, sp, #4
   109b8:	e24dd010 	sub	sp, sp, #16
   109bc:	e50b0008 	str	r0, [fp, #-8]
   109c0:	e50b100c 	str	r1, [fp, #-12]
   109c4:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   109c8:	e51b2010 	ldr	r2, [fp, #-16]
   109cc:	e51b300c 	ldr	r3, [fp, #-12]
   109d0:	e0633002 	rsb	r3, r3, r2
   109d4:	e51b0008 	ldr	r0, [fp, #-8]
   109d8:	e51b100c 	ldr	r1, [fp, #-12]
   109dc:	e1a02003 	mov	r2, r3
   109e0:	ebffffa0 	bl	10868 <memmove>
   109e4:	e1a03000 	mov	r3, r0
}
   109e8:	e1a00003 	mov	r0, r3
   109ec:	e24bd004 	sub	sp, fp, #4
   109f0:	e8bd8800 	pop	{fp, pc}

000109f4 <strcpy>:

//Copy null terminated source into destination which is at least dest_size in length
//dest_size includes the space for the null terminator
char* strcpy(char* destination, const char* source, uint32 dest_size) {
   109f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   109f8:	e28db000 	add	fp, sp, #0
   109fc:	e24dd01c 	sub	sp, sp, #28
   10a00:	e50b0010 	str	r0, [fp, #-16]
   10a04:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10a08:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
	if (dest_size < 1) {
   10a0c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10a10:	e3530000 	cmp	r3, #0
   10a14:	1a000001 	bne	10a20 <strcpy+0x2c>
		return nullptr;
   10a18:	e3a03000 	mov	r3, #0
   10a1c:	ea000019 	b	10a88 <strcpy+0x94>
	}
	char* dest_end = destination + dest_size - 1;
   10a20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10a24:	e2433001 	sub	r3, r3, #1
   10a28:	e51b2010 	ldr	r2, [fp, #-16]
   10a2c:	e0823003 	add	r3, r2, r3
   10a30:	e50b3008 	str	r3, [fp, #-8]
	while (*source
   10a34:	ea000007 	b	10a58 <strcpy+0x64>
	       && destination != dest_end) {
		*destination++ = *source++;
   10a38:	e51b3010 	ldr	r3, [fp, #-16]
   10a3c:	e2832001 	add	r2, r3, #1
   10a40:	e50b2010 	str	r2, [fp, #-16]
   10a44:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   10a48:	e2821001 	add	r1, r2, #1
   10a4c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10a50:	e5d22000 	ldrb	r2, [r2]
   10a54:	e5c32000 	strb	r2, [r3]
char* strcpy(char* destination, const char* source, uint32 dest_size) {
	if (dest_size < 1) {
		return nullptr;
	}
	char* dest_end = destination + dest_size - 1;
	while (*source
   10a58:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10a5c:	e5d33000 	ldrb	r3, [r3]
   10a60:	e3530000 	cmp	r3, #0
   10a64:	0a000003 	beq	10a78 <strcpy+0x84>
	       && destination != dest_end) {
   10a68:	e51b2010 	ldr	r2, [fp, #-16]
   10a6c:	e51b3008 	ldr	r3, [fp, #-8]
   10a70:	e1520003 	cmp	r2, r3
   10a74:	1affffef 	bne	10a38 <strcpy+0x44>
		*destination++ = *source++;
	}
	*destination = 0;
   10a78:	e51b3010 	ldr	r3, [fp, #-16]
   10a7c:	e3a02000 	mov	r2, #0
   10a80:	e5c32000 	strb	r2, [r3]
	return destination;
   10a84:	e51b3010 	ldr	r3, [fp, #-16]
}
   10a88:	e1a00003 	mov	r0, r3
   10a8c:	e24bd000 	sub	sp, fp, #0
   10a90:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10a94:	e12fff1e 	bx	lr

00010a98 <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   10a98:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10a9c:	e28db000 	add	fp, sp, #0
   10aa0:	e24dd014 	sub	sp, sp, #20
   10aa4:	e50b0010 	str	r0, [fp, #-16]
   10aa8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   10aac:	e51b3010 	ldr	r3, [fp, #-16]
   10ab0:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   10ab4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10ab8:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   10abc:	ea000004 	b	10ad4 <zero_region+0x3c>
		*start++ = 0;
   10ac0:	e51b3008 	ldr	r3, [fp, #-8]
   10ac4:	e2832001 	add	r2, r3, #1
   10ac8:	e50b2008 	str	r2, [fp, #-8]
   10acc:	e3a02000 	mov	r2, #0
   10ad0:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   10ad4:	e51b2008 	ldr	r2, [fp, #-8]
   10ad8:	e51b300c 	ldr	r3, [fp, #-12]
   10adc:	e1520003 	cmp	r2, r3
   10ae0:	1afffff6 	bne	10ac0 <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   10ae4:	e51b3010 	ldr	r3, [fp, #-16]
}
   10ae8:	e1a00003 	mov	r0, r3
   10aec:	e24bd000 	sub	sp, fp, #0
   10af0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10af4:	e12fff1e 	bx	lr

00010af8 <write_uint32>:

//sprintf helper for writing unsigned ints
//returns false if buf is full
static char* write_uint32(char* buf, char* buf_end, uint32 base, uint32 num) {
   10af8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10afc:	e28db000 	add	fp, sp, #0
   10b00:	e24dd02c 	sub	sp, sp, #44	; 0x2c
   10b04:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
   10b08:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
   10b0c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10b10:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
   10b14:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10b18:	e3530000 	cmp	r3, #0
   10b1c:	0a000022 	beq	10bac <write_uint32+0xb4>
		uint32 idigit = 11;
   10b20:	e3a0300b 	mov	r3, #11
   10b24:	e50b300c 	str	r3, [fp, #-12]
		while (num) {
   10b28:	ea000017 	b	10b8c <write_uint32+0x94>
			uint32 digit = num % base;
   10b2c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10b30:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10b34:	e732f213 	udiv	r2, r3, r2
   10b38:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
   10b3c:	e0020291 	mul	r2, r1, r2
   10b40:	e0623003 	rsb	r3, r2, r3
   10b44:	e50b3010 	str	r3, [fp, #-16]
			idigit--;
   10b48:	e51b300c 	ldr	r3, [fp, #-12]
   10b4c:	e2433001 	sub	r3, r3, #1
   10b50:	e50b300c 	str	r3, [fp, #-12]
			num_buffer[idigit] = digits[digit];
   10b54:	e301303c 	movw	r3, #4156	; 0x103c
   10b58:	e3403001 	movt	r3, #1
   10b5c:	e51b2010 	ldr	r2, [fp, #-16]
   10b60:	e0833002 	add	r3, r3, r2
   10b64:	e5d31000 	ldrb	r1, [r3]
   10b68:	e24b201c 	sub	r2, fp, #28
   10b6c:	e51b300c 	ldr	r3, [fp, #-12]
   10b70:	e0823003 	add	r3, r2, r3
   10b74:	e1a02001 	mov	r2, r1
   10b78:	e5c32000 	strb	r2, [r3]
			num /= base;
   10b7c:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
   10b80:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10b84:	e733f312 	udiv	r3, r2, r3
   10b88:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
		uint32 idigit = 11;
		while (num) {
   10b8c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10b90:	e3530000 	cmp	r3, #0
   10b94:	1affffe4 	bne	10b2c <write_uint32+0x34>
			uint32 digit = num % base;
			idigit--;
			num_buffer[idigit] = digits[digit];
			num /= base;
		}
		first_digit = &num_buffer[idigit];
   10b98:	e24b201c 	sub	r2, fp, #28
   10b9c:	e51b300c 	ldr	r3, [fp, #-12]
   10ba0:	e0823003 	add	r3, r2, r3
   10ba4:	e50b3008 	str	r3, [fp, #-8]
   10ba8:	ea000004 	b	10bc0 <write_uint32+0xc8>
	} else {
		num_buffer[10] = '0';
   10bac:	e3a03030 	mov	r3, #48	; 0x30
   10bb0:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
		first_digit = &num_buffer[10];
   10bb4:	e24b301c 	sub	r3, fp, #28
   10bb8:	e283300a 	add	r3, r3, #10
   10bbc:	e50b3008 	str	r3, [fp, #-8]
	}
	while (first_digit != &num_buffer[11]) {
   10bc0:	ea00000d 	b	10bfc <write_uint32+0x104>
		*buf++ = *first_digit++;
   10bc4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10bc8:	e2832001 	add	r2, r3, #1
   10bcc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
   10bd0:	e51b2008 	ldr	r2, [fp, #-8]
   10bd4:	e2821001 	add	r1, r2, #1
   10bd8:	e50b1008 	str	r1, [fp, #-8]
   10bdc:	e5d22000 	ldrb	r2, [r2]
   10be0:	e5c32000 	strb	r2, [r3]
		if (buf == buf_end) {
   10be4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10be8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
   10bec:	e1520003 	cmp	r2, r3
   10bf0:	1a000001 	bne	10bfc <write_uint32+0x104>
			return buf;
   10bf4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10bf8:	ea000005 	b	10c14 <write_uint32+0x11c>
		first_digit = &num_buffer[idigit];
	} else {
		num_buffer[10] = '0';
		first_digit = &num_buffer[10];
	}
	while (first_digit != &num_buffer[11]) {
   10bfc:	e24b301c 	sub	r3, fp, #28
   10c00:	e283300b 	add	r3, r3, #11
   10c04:	e51b2008 	ldr	r2, [fp, #-8]
   10c08:	e1520003 	cmp	r2, r3
   10c0c:	1affffec 	bne	10bc4 <write_uint32+0xcc>
		*buf++ = *first_digit++;
		if (buf == buf_end) {
			return buf;
		}
	}
	return buf;
   10c10:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
   10c14:	e1a00003 	mov	r0, r3
   10c18:	e24bd000 	sub	sp, fp, #0
   10c1c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10c20:	e12fff1e 	bx	lr

00010c24 <sprintf>:

//C standard library function sprintf with buffer size specified
char* sprintf(char* buf, uint32 buf_size, const char* fmt, ...) {
   10c24:	e92d000c 	push	{r2, r3}
   10c28:	e92d4800 	push	{fp, lr}
   10c2c:	e28db004 	add	fp, sp, #4
   10c30:	e24dd028 	sub	sp, sp, #40	; 0x28
   10c34:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
   10c38:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
	if (buf_size < 1) {
   10c3c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10c40:	e3530000 	cmp	r3, #0
   10c44:	1a000001 	bne	10c50 <sprintf+0x2c>
		return nullptr; //Need at least space for null terminator
   10c48:	e3a03000 	mov	r3, #0
   10c4c:	ea0000a8 	b	10ef4 <sprintf+0x2d0>
	}
	char* buf_start = buf;
   10c50:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10c54:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
   10c58:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10c5c:	e2433001 	sub	r3, r3, #1
   10c60:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10c64:	e0823003 	add	r3, r2, r3
   10c68:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
	uint32* var_args = (uint32*)&fmt + 1;
   10c6c:	e28b3008 	add	r3, fp, #8
   10c70:	e50b3008 	str	r3, [fp, #-8]
	
	while (buf != buf_end
   10c74:	ea000092 	b	10ec4 <sprintf+0x2a0>
	       && *fmt) {
		if (*fmt != '%') {
   10c78:	e59b3004 	ldr	r3, [fp, #4]
   10c7c:	e5d33000 	ldrb	r3, [r3]
   10c80:	e3530025 	cmp	r3, #37	; 0x25
   10c84:	0a000008 	beq	10cac <sprintf+0x88>
			*buf++ = *fmt++;
   10c88:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10c8c:	e2832001 	add	r2, r3, #1
   10c90:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10c94:	e59b2004 	ldr	r2, [fp, #4]
   10c98:	e2821001 	add	r1, r2, #1
   10c9c:	e58b1004 	str	r1, [fp, #4]
   10ca0:	e5d22000 	ldrb	r2, [r2]
   10ca4:	e5c32000 	strb	r2, [r3]
   10ca8:	ea000085 	b	10ec4 <sprintf+0x2a0>
		} else {
			fmt++;
   10cac:	e59b3004 	ldr	r3, [fp, #4]
   10cb0:	e2833001 	add	r3, r3, #1
   10cb4:	e58b3004 	str	r3, [fp, #4]
			switch (*fmt) {
   10cb8:	e59b3004 	ldr	r3, [fp, #4]
   10cbc:	e5d33000 	ldrb	r3, [r3]
   10cc0:	e3530058 	cmp	r3, #88	; 0x58
   10cc4:	0a000039 	beq	10db0 <sprintf+0x18c>
   10cc8:	e3530058 	cmp	r3, #88	; 0x58
   10ccc:	ca00000b 	bgt	10d00 <sprintf+0xdc>
   10cd0:	e3530044 	cmp	r3, #68	; 0x44
   10cd4:	0a000017 	beq	10d38 <sprintf+0x114>
   10cd8:	e3530044 	cmp	r3, #68	; 0x44
   10cdc:	ca000002 	bgt	10cec <sprintf+0xc8>
   10ce0:	e3530000 	cmp	r3, #0
   10ce4:	0a000011 	beq	10d30 <sprintf+0x10c>
   10ce8:	ea000060 	b	10e70 <sprintf+0x24c>
   10cec:	e3530053 	cmp	r3, #83	; 0x53
   10cf0:	0a000046 	beq	10e10 <sprintf+0x1ec>
   10cf4:	e3530055 	cmp	r3, #85	; 0x55
   10cf8:	0a000038 	beq	10de0 <sprintf+0x1bc>
   10cfc:	ea00005b 	b	10e70 <sprintf+0x24c>
   10d00:	e3530073 	cmp	r3, #115	; 0x73
   10d04:	0a000041 	beq	10e10 <sprintf+0x1ec>
   10d08:	e3530073 	cmp	r3, #115	; 0x73
   10d0c:	ca000002 	bgt	10d1c <sprintf+0xf8>
   10d10:	e3530064 	cmp	r3, #100	; 0x64
   10d14:	0a000007 	beq	10d38 <sprintf+0x114>
   10d18:	ea000054 	b	10e70 <sprintf+0x24c>
   10d1c:	e3530075 	cmp	r3, #117	; 0x75
   10d20:	0a00002e 	beq	10de0 <sprintf+0x1bc>
   10d24:	e3530078 	cmp	r3, #120	; 0x78
   10d28:	0a000020 	beq	10db0 <sprintf+0x18c>
   10d2c:	ea00004f 	b	10e70 <sprintf+0x24c>
			case 0:
				return buf_start;
   10d30:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10d34:	ea00006e 	b	10ef4 <sprintf+0x2d0>
			case 'd':
			case 'D':
				{
					int32 num = *(int32*)var_args;
   10d38:	e51b3008 	ldr	r3, [fp, #-8]
   10d3c:	e5933000 	ldr	r3, [r3]
   10d40:	e50b300c 	str	r3, [fp, #-12]
					var_args++;
   10d44:	e51b3008 	ldr	r3, [fp, #-8]
   10d48:	e2833004 	add	r3, r3, #4
   10d4c:	e50b3008 	str	r3, [fp, #-8]
					if (num < 0) {
   10d50:	e51b300c 	ldr	r3, [fp, #-12]
   10d54:	e3530000 	cmp	r3, #0
   10d58:	aa00000d 	bge	10d94 <sprintf+0x170>
						*buf++ = '-';
   10d5c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10d60:	e2832001 	add	r2, r3, #1
   10d64:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10d68:	e3a0202d 	mov	r2, #45	; 0x2d
   10d6c:	e5c32000 	strb	r2, [r3]
						if (buf == buf_end) {
   10d70:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10d74:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10d78:	e1520003 	cmp	r2, r3
   10d7c:	1a000001 	bne	10d88 <sprintf+0x164>
							return buf_start;
   10d80:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10d84:	ea00005a 	b	10ef4 <sprintf+0x2d0>
						}
						num = -num;
   10d88:	e51b300c 	ldr	r3, [fp, #-12]
   10d8c:	e2633000 	rsb	r3, r3, #0
   10d90:	e50b300c 	str	r3, [fp, #-12]
					}
					buf = write_uint32(buf, buf_end, 10, (uint32)num);
   10d94:	e51b300c 	ldr	r3, [fp, #-12]
   10d98:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10d9c:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10da0:	e3a0200a 	mov	r2, #10
   10da4:	ebffff53 	bl	10af8 <write_uint32>
   10da8:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10dac:	ea000041 	b	10eb8 <sprintf+0x294>
				}
			case 'x':
			case 'X':
				{
					uint32 num = *var_args++;
   10db0:	e51b3008 	ldr	r3, [fp, #-8]
   10db4:	e2832004 	add	r2, r3, #4
   10db8:	e50b2008 	str	r2, [fp, #-8]
   10dbc:	e5933000 	ldr	r3, [r3]
   10dc0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
					buf = write_uint32(buf, buf_end, 16, num);
   10dc4:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10dc8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10dcc:	e3a02010 	mov	r2, #16
   10dd0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10dd4:	ebffff47 	bl	10af8 <write_uint32>
   10dd8:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10ddc:	ea000035 	b	10eb8 <sprintf+0x294>
				}
			case 'u':
			case 'U':
				{
					uint32 num = *var_args++;
   10de0:	e51b3008 	ldr	r3, [fp, #-8]
   10de4:	e2832004 	add	r2, r3, #4
   10de8:	e50b2008 	str	r2, [fp, #-8]
   10dec:	e5933000 	ldr	r3, [r3]
   10df0:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
					buf = write_uint32(buf, buf_end, 10, num);
   10df4:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10df8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10dfc:	e3a0200a 	mov	r2, #10
   10e00:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10e04:	ebffff3b 	bl	10af8 <write_uint32>
   10e08:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10e0c:	ea000029 	b	10eb8 <sprintf+0x294>
				}
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
   10e10:	e51b3008 	ldr	r3, [fp, #-8]
   10e14:	e5933000 	ldr	r3, [r3]
   10e18:	e50b3010 	str	r3, [fp, #-16]
					var_args++;
   10e1c:	e51b3008 	ldr	r3, [fp, #-8]
   10e20:	e2833004 	add	r3, r3, #4
   10e24:	e50b3008 	str	r3, [fp, #-8]
					while (*insert
   10e28:	ea000007 	b	10e4c <sprintf+0x228>
					       && buf != buf_end) {
						*buf++ = *insert++;
   10e2c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e30:	e2832001 	add	r2, r3, #1
   10e34:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e38:	e51b2010 	ldr	r2, [fp, #-16]
   10e3c:	e2821001 	add	r1, r2, #1
   10e40:	e50b1010 	str	r1, [fp, #-16]
   10e44:	e5d22000 	ldrb	r2, [r2]
   10e48:	e5c32000 	strb	r2, [r3]
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
					var_args++;
					while (*insert
   10e4c:	e51b3010 	ldr	r3, [fp, #-16]
   10e50:	e5d33000 	ldrb	r3, [r3]
   10e54:	e3530000 	cmp	r3, #0
   10e58:	0a000003 	beq	10e6c <sprintf+0x248>
					       && buf != buf_end) {
   10e5c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10e60:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10e64:	e1520003 	cmp	r2, r3
   10e68:	1affffef 	bne	10e2c <sprintf+0x208>
						*buf++ = *insert++;
					}
					break;
   10e6c:	ea000011 	b	10eb8 <sprintf+0x294>
				}
			default:
				*buf++ = '%';
   10e70:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e74:	e2832001 	add	r2, r3, #1
   10e78:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e7c:	e3a02025 	mov	r2, #37	; 0x25
   10e80:	e5c32000 	strb	r2, [r3]
				if (buf == buf_end) {
   10e84:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10e88:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10e8c:	e1520003 	cmp	r2, r3
   10e90:	1a000001 	bne	10e9c <sprintf+0x278>
					return buf_start;
   10e94:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10e98:	ea000015 	b	10ef4 <sprintf+0x2d0>
				}
				*buf++ = *fmt;
   10e9c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10ea0:	e2832001 	add	r2, r3, #1
   10ea4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10ea8:	e59b2004 	ldr	r2, [fp, #4]
   10eac:	e5d22000 	ldrb	r2, [r2]
   10eb0:	e5c32000 	strb	r2, [r3]
				break;
   10eb4:	e1a00000 	nop			; (mov r0, r0)
			}
			fmt++;
   10eb8:	e59b3004 	ldr	r3, [fp, #4]
   10ebc:	e2833001 	add	r3, r3, #1
   10ec0:	e58b3004 	str	r3, [fp, #4]
	}
	char* buf_start = buf;
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
	uint32* var_args = (uint32*)&fmt + 1;
	
	while (buf != buf_end
   10ec4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10ec8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10ecc:	e1520003 	cmp	r2, r3
   10ed0:	0a000003 	beq	10ee4 <sprintf+0x2c0>
	       && *fmt) {
   10ed4:	e59b3004 	ldr	r3, [fp, #4]
   10ed8:	e5d33000 	ldrb	r3, [r3]
   10edc:	e3530000 	cmp	r3, #0
   10ee0:	1affff64 	bne	10c78 <sprintf+0x54>
				break;
			}
			fmt++;
		}
	}
	*buf = 0; //Null terminate
   10ee4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10ee8:	e3a02000 	mov	r2, #0
   10eec:	e5c32000 	strb	r2, [r3]
	return buf_start;
   10ef0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
}
   10ef4:	e1a00003 	mov	r0, r3
   10ef8:	e24bd004 	sub	sp, fp, #4
   10efc:	e8bd4800 	pop	{fp, lr}
   10f00:	e28dd008 	add	sp, sp, #8
   10f04:	e12fff1e 	bx	lr

00010f08 <panic>:
//Panic function along with the function called when an assert is triggered
#include "utils.h"
#include "mem_mapped_io.h" //For UART

void panic(char* msg) {
   10f08:	e92d4800 	push	{fp, lr}
   10f0c:	e28db004 	add	fp, sp, #4
   10f10:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   10f14:	e24dd008 	sub	sp, sp, #8
   10f18:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f1c:	e2433004 	sub	r3, r3, #4
   10f20:	e5030004 	str	r0, [r3, #-4]
	static const char panic_msg_start[] = "Panic'd: ";
	char buf[4096];
	//The -1/+1 is to account for the null terminator
	memcpy(buf, panic_msg_start, sizeof(panic_msg_start) - 1);
   10f24:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f28:	e2433004 	sub	r3, r3, #4
   10f2c:	e1a00003 	mov	r0, r3
   10f30:	e3011090 	movw	r1, #4240	; 0x1090
   10f34:	e3401001 	movt	r1, #1
   10f38:	e3a02009 	mov	r2, #9
   10f3c:	ebfffe29 	bl	107e8 <memcpy>
	strcpy(buf + sizeof(panic_msg_start) - 1, msg, 4096 - sizeof(panic_msg_start) + 1);
   10f40:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f44:	e2433004 	sub	r3, r3, #4
   10f48:	e2832009 	add	r2, r3, #9
   10f4c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f50:	e2433004 	sub	r3, r3, #4
   10f54:	e1a00002 	mov	r0, r2
   10f58:	e5131004 	ldr	r1, [r3, #-4]
   10f5c:	e3002ff7 	movw	r2, #4087	; 0xff7
   10f60:	ebfffea3 	bl	109f4 <strcpy>
	uart0_put_str(buf);
   10f64:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f68:	e2433004 	sub	r3, r3, #4
   10f6c:	e1a00003 	mov	r0, r3
   10f70:	ebfffd95 	bl	105cc <uart0_put_str>
	while (true) {}
   10f74:	eafffffe 	b	10f74 <panic+0x6c>

00010f78 <trigger_assert>:
}

void trigger_assert(const char* expr_str, const char* file_name, uint32 line_number, const char* func_name) {
   10f78:	e92d4800 	push	{fp, lr}
   10f7c:	e28db004 	add	fp, sp, #4
   10f80:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   10f84:	e24dd020 	sub	sp, sp, #32
   10f88:	e24bca01 	sub	ip, fp, #4096	; 0x1000
   10f8c:	e24cc004 	sub	ip, ip, #4
   10f90:	e50c0004 	str	r0, [ip, #-4]
   10f94:	e24b0a01 	sub	r0, fp, #4096	; 0x1000
   10f98:	e2400004 	sub	r0, r0, #4
   10f9c:	e5001008 	str	r1, [r0, #-8]
   10fa0:	e24b1a01 	sub	r1, fp, #4096	; 0x1000
   10fa4:	e2411004 	sub	r1, r1, #4
   10fa8:	e501200c 	str	r2, [r1, #-12]
   10fac:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   10fb0:	e2422004 	sub	r2, r2, #4
   10fb4:	e5023010 	str	r3, [r2, #-16]
	char msg[4096];
	sprintf(msg,
   10fb8:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   10fbc:	e2422004 	sub	r2, r2, #4
   10fc0:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10fc4:	e2433004 	sub	r3, r3, #4
   10fc8:	e1a0c003 	mov	ip, r3
   10fcc:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10fd0:	e2433004 	sub	r3, r3, #4
   10fd4:	e5133008 	ldr	r3, [r3, #-8]
   10fd8:	e58d3000 	str	r3, [sp]
   10fdc:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10fe0:	e2433004 	sub	r3, r3, #4
   10fe4:	e513300c 	ldr	r3, [r3, #-12]
   10fe8:	e58d3004 	str	r3, [sp, #4]
   10fec:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10ff0:	e2433004 	sub	r3, r3, #4
   10ff4:	e5133010 	ldr	r3, [r3, #-16]
   10ff8:	e58d3008 	str	r3, [sp, #8]
   10ffc:	e1a00002 	mov	r0, r2
   11000:	e3a01a01 	mov	r1, #4096	; 0x1000
   11004:	e3012050 	movw	r2, #4176	; 0x1050
   11008:	e3402001 	movt	r2, #1
   1100c:	e51c3004 	ldr	r3, [ip, #-4]
   11010:	ebffff03 	bl	10c24 <sprintf>
	        "Assertion triggered\nExpression %s\nFile %s\nLine %u\nFunction %s\n",
	        expr_str,
	        file_name,
	        line_number,
	        func_name);
	panic(msg);
   11014:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11018:	e2433004 	sub	r3, r3, #4
   1101c:	e1a00003 	mov	r0, r3
   11020:	ebffffb8 	bl	10f08 <panic>
}
   11024:	e24bd004 	sub	sp, fp, #4
   11028:	e8bd8800 	pop	{fp, pc}
