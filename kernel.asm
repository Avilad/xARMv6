
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
   10090:	eb0001d1 	bl	107dc <fiq_handler>
   10094:	ea00002e 	b	10154 <trap_return>

00010098 <undefined_instruction_handler_asm>:
   10098:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1009c:	e14f2000 	mrs	r2, SPSR
   100a0:	e92d0004 	stmfd	sp!, {r2}
   100a4:	e94d6000 	stmdb	sp, {sp, lr}^
   100a8:	e24dd008 	sub	sp, sp, #8
   100ac:	e1a0000d 	mov	r0, sp
   100b0:	eb00019f 	bl	10734 <undefined_instruction_handler>
   100b4:	ea000026 	b	10154 <trap_return>

000100b8 <software_interrupt_handler_asm>:
   100b8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100bc:	e14f2000 	mrs	r2, SPSR
   100c0:	e92d0004 	stmfd	sp!, {r2}
   100c4:	e94d6000 	stmdb	sp, {sp, lr}^
   100c8:	e24dd008 	sub	sp, sp, #8
   100cc:	e1a0000d 	mov	r0, sp
   100d0:	eb00019e 	bl	10750 <software_interrupt_handler>
   100d4:	ea00001e 	b	10154 <trap_return>

000100d8 <prefetch_abort_handler_asm>:
   100d8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100dc:	e14f2000 	mrs	r2, SPSR
   100e0:	e92d0004 	stmfd	sp!, {r2}
   100e4:	e94d6000 	stmdb	sp, {sp, lr}^
   100e8:	e24dd008 	sub	sp, sp, #8
   100ec:	e1a0000d 	mov	r0, sp
   100f0:	eb00019d 	bl	1076c <prefetch_abort_handler>
   100f4:	ea000016 	b	10154 <trap_return>

000100f8 <data_abort_handler_asm>:
   100f8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100fc:	e14f2000 	mrs	r2, SPSR
   10100:	e92d0004 	stmfd	sp!, {r2}
   10104:	e94d6000 	stmdb	sp, {sp, lr}^
   10108:	e24dd008 	sub	sp, sp, #8
   1010c:	e1a0000d 	mov	r0, sp
   10110:	eb00019c 	bl	10788 <data_abort_handler>
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
   10150:	eb00019a 	bl	107c0 <irq_handler>

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
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];

void kmain(void) {
   10228:	e92d4800 	push	{fp, lr}
   1022c:	e28db004 	add	fp, sp, #4
   10230:	e24ddf46 	sub	sp, sp, #280	; 0x118
	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
   10234:	e3a00000 	mov	r0, #0
   10238:	e3001060 	movw	r1, #96	; 0x60
   1023c:	e3401001 	movt	r1, #1
   10240:	e3002168 	movw	r2, #360	; 0x168
   10244:	e3402001 	movt	r2, #1
   10248:	eb0001be 	bl	10948 <memcpy_region>
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   1024c:	e3060000 	movw	r0, #24576	; 0x6000
   10250:	e3400001 	movt	r0, #1
   10254:	e30610a0 	movw	r1, #24736	; 0x60a0
   10258:	e3401001 	movt	r1, #1
   1025c:	eb000211 	bl	10aa8 <zero_region>

	//---UART initialization
	char buf[256];
	char* test_string = sprintf(buf, 256, "Hello %d worlds!", -10);
   10260:	e24b3f45 	sub	r3, fp, #276	; 0x114
   10264:	e1a00003 	mov	r0, r3
   10268:	e3a01c01 	mov	r1, #256	; 0x100
   1026c:	e301203c 	movw	r2, #4156	; 0x103c
   10270:	e3402001 	movt	r2, #1
   10274:	e3e03009 	mvn	r3, #9
   10278:	eb00026d 	bl	10c34 <sprintf>
   1027c:	e50b0010 	str	r0, [fp, #-16]
	uart0_init();
   10280:	eb000050 	bl	103c8 <uart0_init>
	uart0_put_str(test_string);
   10284:	e51b0010 	ldr	r0, [fp, #-16]
   10288:	eb0000d3 	bl	105dc <uart0_put_str>

	// Identity map from 1MB up to MMIO_BASE
	uint32 offset = 0;
   1028c:	e3a03000 	mov	r3, #0
   10290:	e50b3008 	str	r3, [fp, #-8]
	uint32* page_table_base = (uint32*)((uint32)(kernel_end + 0x4000) & ~0x3FFF);
   10294:	e59f30d4 	ldr	r3, [pc, #212]	; 10370 <kmain+0x148>
   10298:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
   1029c:	e3c3303f 	bic	r3, r3, #63	; 0x3f
   102a0:	e50b3118 	str	r3, [fp, #-280]	; 0xfffffee8
	for(uint32 vaddr = 0; vaddr < (1 << 31); vaddr += MB) {
   102a4:	e3a03000 	mov	r3, #0
   102a8:	e50b300c 	str	r3, [fp, #-12]
   102ac:	ea000012 	b	102fc <kmain+0xd4>
		uint32* pt_entry = page_table_base + offset;
   102b0:	e51b2118 	ldr	r2, [fp, #-280]	; 0xfffffee8
   102b4:	e51b3008 	ldr	r3, [fp, #-8]
   102b8:	e1a03103 	lsl	r3, r3, #2
   102bc:	e0823003 	add	r3, r2, r3
   102c0:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
		*pt_entry = 0; 
   102c4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   102c8:	e3a02000 	mov	r2, #0
   102cc:	e5832000 	str	r2, [r3]
		*pt_entry = vaddr | AP_DONT_CHECK_PERMS | USE_SECTIONS;
   102d0:	e51b300c 	ldr	r3, [fp, #-12]
   102d4:	e3833b03 	orr	r3, r3, #3072	; 0xc00
   102d8:	e3833002 	orr	r3, r3, #2
   102dc:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   102e0:	e5823000 	str	r3, [r2]
		offset++;
   102e4:	e51b3008 	ldr	r3, [fp, #-8]
   102e8:	e2833001 	add	r3, r3, #1
   102ec:	e50b3008 	str	r3, [fp, #-8]
	uart0_put_str(test_string);

	// Identity map from 1MB up to MMIO_BASE
	uint32 offset = 0;
	uint32* page_table_base = (uint32*)((uint32)(kernel_end + 0x4000) & ~0x3FFF);
	for(uint32 vaddr = 0; vaddr < (1 << 31); vaddr += MB) {
   102f0:	e51b300c 	ldr	r3, [fp, #-12]
   102f4:	e2833601 	add	r3, r3, #1048576	; 0x100000
   102f8:	e50b300c 	str	r3, [fp, #-12]
   102fc:	e51b300c 	ldr	r3, [fp, #-12]
   10300:	e3530000 	cmp	r3, #0
   10304:	aaffffe9 	bge	102b0 <kmain+0x88>
	/*
	   https://github.com/dwelch67/raspberrypi/tree/master/mmu
	   https://stackoverflow.com/questions/20138294/getting-a-prefetch-abort-after-enabling-mmu-on-armv7
	   https://witekio.com/blog/turning-arm-mmu-living-tell-tale-code/
	*/
	set_operating_mode(PSR_SYSTEM_MODE);
   10308:	e3a0001f 	mov	r0, #31
   1030c:	ebffffa7 	bl	101b0 <set_operating_mode>

	asm volatile("mov r0, $4;"
   10310:	e24b3f46 	sub	r3, fp, #280	; 0x118
   10314:	e3a00004 	mov	r0, #4
   10318:	e1e00000 	mvn	r0, r0
   1031c:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   10320:	e0001001 	and	r1, r0, r1
   10324:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
   10328:	e3a01000 	mov	r1, #0
   1032c:	ee021f50 	mcr	15, 0, r1, cr2, cr0, {2}
   10330:	ee071f15 	mcr	15, 0, r1, cr7, cr5, {0}
   10334:	ee071f95 	mcr	15, 0, r1, cr7, cr5, {4}
   10338:	ee081f17 	mcr	15, 0, r1, cr8, cr7, {0}
   1033c:	e5930000 	ldr	r0, [r3]
   10340:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
   10344:	f57ff04f 	dsb	sy
   10348:	e3e00000 	mvn	r0, #0
   1034c:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
   10350:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   10354:	e3811001 	orr	r1, r1, #1
   10358:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
				 :
				 : "r"(&page_table_base)
				 : "memory", "r0", "r1");

	while (1) {
		uart0_send_char(uart0_get_char());
   1035c:	eb000085 	bl	10578 <uart0_get_char>
   10360:	e1a03000 	mov	r3, r0
   10364:	e1a00003 	mov	r0, r3
   10368:	eb00005f 	bl	104ec <uart0_send_char>
	}
   1036c:	eafffffa 	b	1035c <kmain+0x134>
   10370:	0001a0a0 	.word	0x0001a0a0

00010374 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   10374:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10378:	e28db000 	add	fp, sp, #0
   1037c:	e24dd00c 	sub	sp, sp, #12
   10380:	e50b0008 	str	r0, [fp, #-8]
   10384:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   10388:	e51b3008 	ldr	r3, [fp, #-8]
   1038c:	e51b200c 	ldr	r2, [fp, #-12]
   10390:	e5832000 	str	r2, [r3]
}
   10394:	e24bd000 	sub	sp, fp, #0
   10398:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1039c:	e12fff1e 	bx	lr

000103a0 <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   103a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   103a4:	e28db000 	add	fp, sp, #0
   103a8:	e24dd00c 	sub	sp, sp, #12
   103ac:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   103b0:	e51b3008 	ldr	r3, [fp, #-8]
   103b4:	e5933000 	ldr	r3, [r3]
}
   103b8:	e1a00003 	mov	r0, r3
   103bc:	e24bd000 	sub	sp, fp, #0
   103c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   103c4:	e12fff1e 	bx	lr

000103c8 <uart0_init>:

void uart0_init() {
   103c8:	e92d4800 	push	{fp, lr}
   103cc:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   103d0:	e3010030 	movw	r0, #4144	; 0x1030
   103d4:	e3430f20 	movt	r0, #16160	; 0x3f20
   103d8:	e3a01000 	mov	r1, #0
   103dc:	ebffffe4 	bl	10374 <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   103e0:	e3a00094 	mov	r0, #148	; 0x94
   103e4:	e3430f20 	movt	r0, #16160	; 0x3f20
   103e8:	e3a01000 	mov	r1, #0
   103ec:	ebffffe0 	bl	10374 <mmio_write>
	delay(150);
   103f0:	e3063000 	movw	r3, #24576	; 0x6000
   103f4:	e3403001 	movt	r3, #1
   103f8:	e3a02096 	mov	r2, #150	; 0x96
   103fc:	e5832000 	str	r2, [r3]
   10400:	ea000000 	b	10408 <uart0_init+0x40>
   10404:	e320f000 	nop	{0}
   10408:	e3063000 	movw	r3, #24576	; 0x6000
   1040c:	e3403001 	movt	r3, #1
   10410:	e5932000 	ldr	r2, [r3]
   10414:	e2421001 	sub	r1, r2, #1
   10418:	e3063000 	movw	r3, #24576	; 0x6000
   1041c:	e3403001 	movt	r3, #1
   10420:	e5831000 	str	r1, [r3]
   10424:	e3520000 	cmp	r2, #0
   10428:	1afffff5 	bne	10404 <uart0_init+0x3c>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   1042c:	e3a00098 	mov	r0, #152	; 0x98
   10430:	e3430f20 	movt	r0, #16160	; 0x3f20
   10434:	e3a01903 	mov	r1, #49152	; 0xc000
   10438:	ebffffcd 	bl	10374 <mmio_write>
	delay(150);
   1043c:	e3063000 	movw	r3, #24576	; 0x6000
   10440:	e3403001 	movt	r3, #1
   10444:	e3a02096 	mov	r2, #150	; 0x96
   10448:	e5832000 	str	r2, [r3]
   1044c:	ea000000 	b	10454 <uart0_init+0x8c>
   10450:	e320f000 	nop	{0}
   10454:	e3063000 	movw	r3, #24576	; 0x6000
   10458:	e3403001 	movt	r3, #1
   1045c:	e5932000 	ldr	r2, [r3]
   10460:	e2421001 	sub	r1, r2, #1
   10464:	e3063000 	movw	r3, #24576	; 0x6000
   10468:	e3403001 	movt	r3, #1
   1046c:	e5831000 	str	r1, [r3]
   10470:	e3520000 	cmp	r2, #0
   10474:	1afffff5 	bne	10450 <uart0_init+0x88>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   10478:	e3a00098 	mov	r0, #152	; 0x98
   1047c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10480:	e3a01000 	mov	r1, #0
   10484:	ebffffba 	bl	10374 <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10488:	e3010044 	movw	r0, #4164	; 0x1044
   1048c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10490:	e30017ff 	movw	r1, #2047	; 0x7ff
   10494:	ebffffb6 	bl	10374 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   10498:	e3010024 	movw	r0, #4132	; 0x1024
   1049c:	e3430f20 	movt	r0, #16160	; 0x3f20
   104a0:	e3a01001 	mov	r1, #1
   104a4:	ebffffb2 	bl	10374 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   104a8:	e3010028 	movw	r0, #4136	; 0x1028
   104ac:	e3430f20 	movt	r0, #16160	; 0x3f20
   104b0:	e3a01028 	mov	r1, #40	; 0x28
   104b4:	ebffffae 	bl	10374 <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   104b8:	e301002c 	movw	r0, #4140	; 0x102c
   104bc:	e3430f20 	movt	r0, #16160	; 0x3f20
   104c0:	e3a01070 	mov	r1, #112	; 0x70
   104c4:	ebffffaa 	bl	10374 <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   104c8:	e3010038 	movw	r0, #4152	; 0x1038
   104cc:	e3430f20 	movt	r0, #16160	; 0x3f20
   104d0:	e30017f2 	movw	r1, #2034	; 0x7f2
   104d4:	ebffffa6 	bl	10374 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   104d8:	e3010030 	movw	r0, #4144	; 0x1030
   104dc:	e3430f20 	movt	r0, #16160	; 0x3f20
   104e0:	e3001301 	movw	r1, #769	; 0x301
   104e4:	ebffffa2 	bl	10374 <mmio_write>
#endif
}
   104e8:	e8bd8800 	pop	{fp, pc}

000104ec <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   104ec:	e92d4800 	push	{fp, lr}
   104f0:	e28db004 	add	fp, sp, #4
   104f4:	e24dd008 	sub	sp, sp, #8
   104f8:	e1a03000 	mov	r3, r0
   104fc:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   10500:	e1a00000 	nop			; (mov r0, r0)
   10504:	e3010018 	movw	r0, #4120	; 0x1018
   10508:	e3430f20 	movt	r0, #16160	; 0x3f20
   1050c:	ebffffa3 	bl	103a0 <mmio_read>
   10510:	e1a03000 	mov	r3, r0
   10514:	e2033020 	and	r3, r3, #32
   10518:	e3530000 	cmp	r3, #0
   1051c:	1afffff8 	bne	10504 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   10520:	e55b3005 	ldrb	r3, [fp, #-5]
   10524:	e3a00a01 	mov	r0, #4096	; 0x1000
   10528:	e3430f20 	movt	r0, #16160	; 0x3f20
   1052c:	e1a01003 	mov	r1, r3
   10530:	ebffff8f 	bl	10374 <mmio_write>
	delay(150);
   10534:	e3063000 	movw	r3, #24576	; 0x6000
   10538:	e3403001 	movt	r3, #1
   1053c:	e3a02096 	mov	r2, #150	; 0x96
   10540:	e5832000 	str	r2, [r3]
   10544:	ea000000 	b	1054c <uart0_send_char+0x60>
   10548:	e320f000 	nop	{0}
   1054c:	e3063000 	movw	r3, #24576	; 0x6000
   10550:	e3403001 	movt	r3, #1
   10554:	e5932000 	ldr	r2, [r3]
   10558:	e2421001 	sub	r1, r2, #1
   1055c:	e3063000 	movw	r3, #24576	; 0x6000
   10560:	e3403001 	movt	r3, #1
   10564:	e5831000 	str	r1, [r3]
   10568:	e3520000 	cmp	r2, #0
   1056c:	1afffff5 	bne	10548 <uart0_send_char+0x5c>
}
   10570:	e24bd004 	sub	sp, fp, #4
   10574:	e8bd8800 	pop	{fp, pc}

00010578 <uart0_get_char>:

char uart0_get_char() {
   10578:	e92d4800 	push	{fp, lr}
   1057c:	e28db004 	add	fp, sp, #4
   10580:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   10584:	e1a00000 	nop			; (mov r0, r0)
   10588:	e3010018 	movw	r0, #4120	; 0x1018
   1058c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10590:	ebffff82 	bl	103a0 <mmio_read>
   10594:	e1a03000 	mov	r3, r0
   10598:	e2033010 	and	r3, r3, #16
   1059c:	e3530000 	cmp	r3, #0
   105a0:	1afffff8 	bne	10588 <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   105a4:	e3a00a01 	mov	r0, #4096	; 0x1000
   105a8:	e3430f20 	movt	r0, #16160	; 0x3f20
   105ac:	ebffff7b 	bl	103a0 <mmio_read>
   105b0:	e1a03000 	mov	r3, r0
   105b4:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   105b8:	e55b3005 	ldrb	r3, [fp, #-5]
   105bc:	e353000d 	cmp	r3, #13
   105c0:	0a000001 	beq	105cc <uart0_get_char+0x54>
   105c4:	e55b3005 	ldrb	r3, [fp, #-5]
   105c8:	ea000000 	b	105d0 <uart0_get_char+0x58>
   105cc:	e3a0300a 	mov	r3, #10
}
   105d0:	e1a00003 	mov	r0, r3
   105d4:	e24bd004 	sub	sp, fp, #4
   105d8:	e8bd8800 	pop	{fp, pc}

000105dc <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   105dc:	e92d4800 	push	{fp, lr}
   105e0:	e28db004 	add	fp, sp, #4
   105e4:	e24dd008 	sub	sp, sp, #8
   105e8:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   105ec:	ea00000b 	b	10620 <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   105f0:	e51b3008 	ldr	r3, [fp, #-8]
   105f4:	e5d33000 	ldrb	r3, [r3]
   105f8:	e353000a 	cmp	r3, #10
   105fc:	1a000001 	bne	10608 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   10600:	e3a0000d 	mov	r0, #13
   10604:	ebffffb8 	bl	104ec <uart0_send_char>
		}
		uart0_send_char(*s++);
   10608:	e51b3008 	ldr	r3, [fp, #-8]
   1060c:	e2832001 	add	r2, r3, #1
   10610:	e50b2008 	str	r2, [fp, #-8]
   10614:	e5d33000 	ldrb	r3, [r3]
   10618:	e1a00003 	mov	r0, r3
   1061c:	ebffffb2 	bl	104ec <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   10620:	e51b3008 	ldr	r3, [fp, #-8]
   10624:	e5d33000 	ldrb	r3, [r3]
   10628:	e3530000 	cmp	r3, #0
   1062c:	1affffef 	bne	105f0 <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   10630:	e24bd004 	sub	sp, fp, #4
   10634:	e8bd8800 	pop	{fp, pc}

00010638 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   10638:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1063c:	e28db000 	add	fp, sp, #0
   10640:	e24dd01c 	sub	sp, sp, #28
   10644:	e1a03000 	mov	r3, r0
   10648:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   1064c:	e320f000 	nop	{0}
    } while (*MBOX_STATUS & MBOX_FULL);
   10650:	e30b3898 	movw	r3, #47256	; 0xb898
   10654:	e3433f00 	movt	r3, #16128	; 0x3f00
   10658:	e5933000 	ldr	r3, [r3]
   1065c:	e3530000 	cmp	r3, #0
   10660:	bafffff9 	blt	1064c <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   10664:	e55b0015 	ldrb	r0, [fp, #-21]	; 0xffffffeb
   10668:	e3a01000 	mov	r1, #0
   1066c:	e3063010 	movw	r3, #24592	; 0x6010
   10670:	e3403001 	movt	r3, #1
   10674:	e1a02003 	mov	r2, r3
   10678:	e3a03000 	mov	r3, #0
   1067c:	e1822000 	orr	r2, r2, r0
   10680:	e1833001 	orr	r3, r3, r1
   10684:	e14b20fc 	strd	r2, [fp, #-12]
    *MBOX_WRITE = mailbox_addr_or_channel;
   10688:	e30b38a0 	movw	r3, #47264	; 0xb8a0
   1068c:	e3433f00 	movt	r3, #16128	; 0x3f00
   10690:	e51b200c 	ldr	r2, [fp, #-12]
   10694:	e5832000 	str	r2, [r3]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   10698:	e320f000 	nop	{0}
        } while(*MBOX_STATUS & MBOX_EMPTY);
   1069c:	e30b3898 	movw	r3, #47256	; 0xb898
   106a0:	e3433f00 	movt	r3, #16128	; 0x3f00
   106a4:	e5933000 	ldr	r3, [r3]
   106a8:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   106ac:	e3530000 	cmp	r3, #0
   106b0:	1afffff8 	bne	10698 <mailbox_send_message+0x60>
        
        uint32 response = *MBOX_READ;
   106b4:	e30b3880 	movw	r3, #47232	; 0xb880
   106b8:	e3433f00 	movt	r3, #16128	; 0x3f00
   106bc:	e5933000 	ldr	r3, [r3]
   106c0:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   106c4:	e51b3010 	ldr	r3, [fp, #-16]
   106c8:	e6ef3073 	uxtb	r3, r3
   106cc:	e203200f 	and	r2, r3, #15
   106d0:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   106d4:	e1520003 	cmp	r2, r3
   106d8:	1a00000f 	bne	1071c <mailbox_send_message+0xe4>
   106dc:	e51b3010 	ldr	r3, [fp, #-16]
   106e0:	e3c3200f 	bic	r2, r3, #15
   106e4:	e3063010 	movw	r3, #24592	; 0x6010
   106e8:	e3403001 	movt	r3, #1
   106ec:	e1520003 	cmp	r2, r3
   106f0:	1a000009 	bne	1071c <mailbox_send_message+0xe4>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   106f4:	e3063010 	movw	r3, #24592	; 0x6010
   106f8:	e3403001 	movt	r3, #1
   106fc:	e5933004 	ldr	r3, [r3, #4]
   10700:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   10704:	03a03001 	moveq	r3, #1
   10708:	13a03000 	movne	r3, #0
   1070c:	e6ef3073 	uxtb	r3, r3
   10710:	e6ef2073 	uxtb	r2, r3
   10714:	e3a03000 	mov	r3, #0
   10718:	ea000000 	b	10720 <mailbox_send_message+0xe8>
        }
    }
   1071c:	eaffffdd 	b	10698 <mailbox_send_message+0x60>
    return 0;
}
   10720:	e1a00002 	mov	r0, r2
   10724:	e1a01003 	mov	r1, r3
   10728:	e24bd000 	sub	sp, fp, #0
   1072c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10730:	e12fff1e 	bx	lr

00010734 <undefined_instruction_handler>:
//Handles traps
#include "arm.h"

void undefined_instruction_handler(struct trap_frame* tf) {
   10734:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10738:	e28db000 	add	fp, sp, #0
   1073c:	e24dd00c 	sub	sp, sp, #12
   10740:	e50b0008 	str	r0, [fp, #-8]
	
}
   10744:	e24bd000 	sub	sp, fp, #0
   10748:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1074c:	e12fff1e 	bx	lr

00010750 <software_interrupt_handler>:
void software_interrupt_handler(struct trap_frame* tf) {
   10750:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10754:	e28db000 	add	fp, sp, #0
   10758:	e24dd00c 	sub	sp, sp, #12
   1075c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10760:	e24bd000 	sub	sp, fp, #0
   10764:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10768:	e12fff1e 	bx	lr

0001076c <prefetch_abort_handler>:
void prefetch_abort_handler(struct trap_frame* tf) {
   1076c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10770:	e28db000 	add	fp, sp, #0
   10774:	e24dd00c 	sub	sp, sp, #12
   10778:	e50b0008 	str	r0, [fp, #-8]
	
}
   1077c:	e24bd000 	sub	sp, fp, #0
   10780:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10784:	e12fff1e 	bx	lr

00010788 <data_abort_handler>:
void data_abort_handler(struct trap_frame* tf) {
   10788:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1078c:	e28db000 	add	fp, sp, #0
   10790:	e24dd00c 	sub	sp, sp, #12
   10794:	e50b0008 	str	r0, [fp, #-8]
	
}
   10798:	e24bd000 	sub	sp, fp, #0
   1079c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107a0:	e12fff1e 	bx	lr

000107a4 <unused_exception_handler>:
void unused_exception_handler(struct trap_frame* tf) {
   107a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107a8:	e28db000 	add	fp, sp, #0
   107ac:	e24dd00c 	sub	sp, sp, #12
   107b0:	e50b0008 	str	r0, [fp, #-8]
	
}
   107b4:	e24bd000 	sub	sp, fp, #0
   107b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107bc:	e12fff1e 	bx	lr

000107c0 <irq_handler>:
void irq_handler(struct trap_frame* tf) {
   107c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107c4:	e28db000 	add	fp, sp, #0
   107c8:	e24dd00c 	sub	sp, sp, #12
   107cc:	e50b0008 	str	r0, [fp, #-8]
	
}
   107d0:	e24bd000 	sub	sp, fp, #0
   107d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107d8:	e12fff1e 	bx	lr

000107dc <fiq_handler>:
void fiq_handler(struct trap_frame* tf) {
   107dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107e0:	e28db000 	add	fp, sp, #0
   107e4:	e24dd00c 	sub	sp, sp, #12
   107e8:	e50b0008 	str	r0, [fp, #-8]
	
}
   107ec:	e24bd000 	sub	sp, fp, #0
   107f0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107f4:	e12fff1e 	bx	lr

000107f8 <memcpy>:
//Useful memory functions like memcpy
#include "utils.h"

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint32 size) {
   107f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107fc:	e28db000 	add	fp, sp, #0
   10800:	e24dd024 	sub	sp, sp, #36	; 0x24
   10804:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10808:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   1080c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10810:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10814:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   10818:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1081c:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   10820:	e51b200c 	ldr	r2, [fp, #-12]
   10824:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10828:	e0823003 	add	r3, r2, r3
   1082c:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10830:	ea000007 	b	10854 <memcpy+0x5c>
		*dest++ = *src++;
   10834:	e51b3008 	ldr	r3, [fp, #-8]
   10838:	e2832001 	add	r2, r3, #1
   1083c:	e50b2008 	str	r2, [fp, #-8]
   10840:	e51b200c 	ldr	r2, [fp, #-12]
   10844:	e2821001 	add	r1, r2, #1
   10848:	e50b100c 	str	r1, [fp, #-12]
   1084c:	e5d22000 	ldrb	r2, [r2]
   10850:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint32 size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   10854:	e51b200c 	ldr	r2, [fp, #-12]
   10858:	e51b3010 	ldr	r3, [fp, #-16]
   1085c:	e1520003 	cmp	r2, r3
   10860:	1afffff3 	bne	10834 <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   10864:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10868:	e1a00003 	mov	r0, r3
   1086c:	e24bd000 	sub	sp, fp, #0
   10870:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10874:	e12fff1e 	bx	lr

00010878 <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, const void* source, uint32 size) {
   10878:	e92d4800 	push	{fp, lr}
   1087c:	e28db004 	add	fp, sp, #4
   10880:	e24dd020 	sub	sp, sp, #32
   10884:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10888:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   1088c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   10890:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10894:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10898:	e1520003 	cmp	r2, r3
   1089c:	1a000001 	bne	108a8 <memmove+0x30>
		return destination;
   108a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   108a4:	ea000024 	b	1093c <memmove+0xc4>
	}
	if (destination < source) {
   108a8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   108ac:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   108b0:	e1520003 	cmp	r2, r3
   108b4:	2a000005 	bcs	108d0 <memmove+0x58>
		return memcpy(destination, source, size);
   108b8:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
   108bc:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   108c0:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   108c4:	ebffffcb 	bl	107f8 <memcpy>
   108c8:	e1a03000 	mov	r3, r0
   108cc:	ea00001a 	b	1093c <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   108d0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   108d4:	e2433001 	sub	r3, r3, #1
   108d8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   108dc:	e0823003 	add	r3, r2, r3
   108e0:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   108e4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   108e8:	e2433001 	sub	r3, r3, #1
   108ec:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   108f0:	e0823003 	add	r3, r2, r3
   108f4:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   108f8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   108fc:	e2433001 	sub	r3, r3, #1
   10900:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10904:	ea000007 	b	10928 <memmove+0xb0>
		*dest-- = *src--;
   10908:	e51b3008 	ldr	r3, [fp, #-8]
   1090c:	e2432001 	sub	r2, r3, #1
   10910:	e50b2008 	str	r2, [fp, #-8]
   10914:	e51b200c 	ldr	r2, [fp, #-12]
   10918:	e2421001 	sub	r1, r2, #1
   1091c:	e50b100c 	str	r1, [fp, #-12]
   10920:	e5d22000 	ldrb	r2, [r2]
   10924:	e5c32000 	strb	r2, [r3]
		return memcpy(destination, source, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   10928:	e51b200c 	ldr	r2, [fp, #-12]
   1092c:	e51b3010 	ldr	r3, [fp, #-16]
   10930:	e1520003 	cmp	r2, r3
   10934:	1afffff3 	bne	10908 <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   10938:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   1093c:	e1a00003 	mov	r0, r3
   10940:	e24bd004 	sub	sp, fp, #4
   10944:	e8bd8800 	pop	{fp, pc}

00010948 <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
   10948:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1094c:	e28db000 	add	fp, sp, #0
   10950:	e24dd024 	sub	sp, sp, #36	; 0x24
   10954:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10958:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   1095c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10960:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10964:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   10968:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1096c:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   10970:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10974:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10978:	ea000007 	b	1099c <memcpy_region+0x54>
		*dest++ = *src++;
   1097c:	e51b3008 	ldr	r3, [fp, #-8]
   10980:	e2832001 	add	r2, r3, #1
   10984:	e50b2008 	str	r2, [fp, #-8]
   10988:	e51b200c 	ldr	r2, [fp, #-12]
   1098c:	e2821001 	add	r1, r2, #1
   10990:	e50b100c 	str	r1, [fp, #-12]
   10994:	e5d22000 	ldrb	r2, [r2]
   10998:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   1099c:	e51b200c 	ldr	r2, [fp, #-12]
   109a0:	e51b3010 	ldr	r3, [fp, #-16]
   109a4:	e1520003 	cmp	r2, r3
   109a8:	1afffff3 	bne	1097c <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   109ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   109b0:	e1a00003 	mov	r0, r3
   109b4:	e24bd000 	sub	sp, fp, #0
   109b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   109bc:	e12fff1e 	bx	lr

000109c0 <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* destination, const void* source_start, const void* source_end) {
   109c0:	e92d4800 	push	{fp, lr}
   109c4:	e28db004 	add	fp, sp, #4
   109c8:	e24dd010 	sub	sp, sp, #16
   109cc:	e50b0008 	str	r0, [fp, #-8]
   109d0:	e50b100c 	str	r1, [fp, #-12]
   109d4:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   109d8:	e51b2010 	ldr	r2, [fp, #-16]
   109dc:	e51b300c 	ldr	r3, [fp, #-12]
   109e0:	e0633002 	rsb	r3, r3, r2
   109e4:	e51b0008 	ldr	r0, [fp, #-8]
   109e8:	e51b100c 	ldr	r1, [fp, #-12]
   109ec:	e1a02003 	mov	r2, r3
   109f0:	ebffffa0 	bl	10878 <memmove>
   109f4:	e1a03000 	mov	r3, r0
}
   109f8:	e1a00003 	mov	r0, r3
   109fc:	e24bd004 	sub	sp, fp, #4
   10a00:	e8bd8800 	pop	{fp, pc}

00010a04 <strcpy>:

//Copy null terminated source into destination which is at least dest_size in length
//dest_size includes the space for the null terminator
char* strcpy(char* destination, const char* source, uint32 dest_size) {
   10a04:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10a08:	e28db000 	add	fp, sp, #0
   10a0c:	e24dd01c 	sub	sp, sp, #28
   10a10:	e50b0010 	str	r0, [fp, #-16]
   10a14:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10a18:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
	if (dest_size < 1) {
   10a1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10a20:	e3530000 	cmp	r3, #0
   10a24:	1a000001 	bne	10a30 <strcpy+0x2c>
		return nullptr;
   10a28:	e3a03000 	mov	r3, #0
   10a2c:	ea000019 	b	10a98 <strcpy+0x94>
	}
	char* dest_end = destination + dest_size - 1;
   10a30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10a34:	e2433001 	sub	r3, r3, #1
   10a38:	e51b2010 	ldr	r2, [fp, #-16]
   10a3c:	e0823003 	add	r3, r2, r3
   10a40:	e50b3008 	str	r3, [fp, #-8]
	while (*source
   10a44:	ea000007 	b	10a68 <strcpy+0x64>
	       && destination != dest_end) {
		*destination++ = *source++;
   10a48:	e51b3010 	ldr	r3, [fp, #-16]
   10a4c:	e2832001 	add	r2, r3, #1
   10a50:	e50b2010 	str	r2, [fp, #-16]
   10a54:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   10a58:	e2821001 	add	r1, r2, #1
   10a5c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10a60:	e5d22000 	ldrb	r2, [r2]
   10a64:	e5c32000 	strb	r2, [r3]
char* strcpy(char* destination, const char* source, uint32 dest_size) {
	if (dest_size < 1) {
		return nullptr;
	}
	char* dest_end = destination + dest_size - 1;
	while (*source
   10a68:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10a6c:	e5d33000 	ldrb	r3, [r3]
   10a70:	e3530000 	cmp	r3, #0
   10a74:	0a000003 	beq	10a88 <strcpy+0x84>
	       && destination != dest_end) {
   10a78:	e51b2010 	ldr	r2, [fp, #-16]
   10a7c:	e51b3008 	ldr	r3, [fp, #-8]
   10a80:	e1520003 	cmp	r2, r3
   10a84:	1affffef 	bne	10a48 <strcpy+0x44>
		*destination++ = *source++;
	}
	*destination = 0;
   10a88:	e51b3010 	ldr	r3, [fp, #-16]
   10a8c:	e3a02000 	mov	r2, #0
   10a90:	e5c32000 	strb	r2, [r3]
	return destination;
   10a94:	e51b3010 	ldr	r3, [fp, #-16]
}
   10a98:	e1a00003 	mov	r0, r3
   10a9c:	e24bd000 	sub	sp, fp, #0
   10aa0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10aa4:	e12fff1e 	bx	lr

00010aa8 <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   10aa8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10aac:	e28db000 	add	fp, sp, #0
   10ab0:	e24dd014 	sub	sp, sp, #20
   10ab4:	e50b0010 	str	r0, [fp, #-16]
   10ab8:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   10abc:	e51b3010 	ldr	r3, [fp, #-16]
   10ac0:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   10ac4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10ac8:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   10acc:	ea000004 	b	10ae4 <zero_region+0x3c>
		*start++ = 0;
   10ad0:	e51b3008 	ldr	r3, [fp, #-8]
   10ad4:	e2832001 	add	r2, r3, #1
   10ad8:	e50b2008 	str	r2, [fp, #-8]
   10adc:	e3a02000 	mov	r2, #0
   10ae0:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   10ae4:	e51b2008 	ldr	r2, [fp, #-8]
   10ae8:	e51b300c 	ldr	r3, [fp, #-12]
   10aec:	e1520003 	cmp	r2, r3
   10af0:	1afffff6 	bne	10ad0 <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   10af4:	e51b3010 	ldr	r3, [fp, #-16]
}
   10af8:	e1a00003 	mov	r0, r3
   10afc:	e24bd000 	sub	sp, fp, #0
   10b00:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10b04:	e12fff1e 	bx	lr

00010b08 <write_uint32>:

//sprintf helper for writing unsigned ints
//returns false if buf is full
static char* write_uint32(char* buf, char* buf_end, uint32 base, uint32 num) {
   10b08:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10b0c:	e28db000 	add	fp, sp, #0
   10b10:	e24dd02c 	sub	sp, sp, #44	; 0x2c
   10b14:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
   10b18:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
   10b1c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10b20:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
   10b24:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10b28:	e3530000 	cmp	r3, #0
   10b2c:	0a000022 	beq	10bbc <write_uint32+0xb4>
		uint32 idigit = 11;
   10b30:	e3a0300b 	mov	r3, #11
   10b34:	e50b300c 	str	r3, [fp, #-12]
		while (num) {
   10b38:	ea000017 	b	10b9c <write_uint32+0x94>
			uint32 digit = num % base;
   10b3c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10b40:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10b44:	e732f213 	udiv	r2, r3, r2
   10b48:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
   10b4c:	e0020291 	mul	r2, r1, r2
   10b50:	e0623003 	rsb	r3, r2, r3
   10b54:	e50b3010 	str	r3, [fp, #-16]
			idigit--;
   10b58:	e51b300c 	ldr	r3, [fp, #-12]
   10b5c:	e2433001 	sub	r3, r3, #1
   10b60:	e50b300c 	str	r3, [fp, #-12]
			num_buffer[idigit] = digits[digit];
   10b64:	e3013050 	movw	r3, #4176	; 0x1050
   10b68:	e3403001 	movt	r3, #1
   10b6c:	e51b2010 	ldr	r2, [fp, #-16]
   10b70:	e0833002 	add	r3, r3, r2
   10b74:	e5d31000 	ldrb	r1, [r3]
   10b78:	e24b201c 	sub	r2, fp, #28
   10b7c:	e51b300c 	ldr	r3, [fp, #-12]
   10b80:	e0823003 	add	r3, r2, r3
   10b84:	e1a02001 	mov	r2, r1
   10b88:	e5c32000 	strb	r2, [r3]
			num /= base;
   10b8c:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
   10b90:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10b94:	e733f312 	udiv	r3, r2, r3
   10b98:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
		uint32 idigit = 11;
		while (num) {
   10b9c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10ba0:	e3530000 	cmp	r3, #0
   10ba4:	1affffe4 	bne	10b3c <write_uint32+0x34>
			uint32 digit = num % base;
			idigit--;
			num_buffer[idigit] = digits[digit];
			num /= base;
		}
		first_digit = &num_buffer[idigit];
   10ba8:	e24b201c 	sub	r2, fp, #28
   10bac:	e51b300c 	ldr	r3, [fp, #-12]
   10bb0:	e0823003 	add	r3, r2, r3
   10bb4:	e50b3008 	str	r3, [fp, #-8]
   10bb8:	ea000004 	b	10bd0 <write_uint32+0xc8>
	} else {
		num_buffer[10] = '0';
   10bbc:	e3a03030 	mov	r3, #48	; 0x30
   10bc0:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
		first_digit = &num_buffer[10];
   10bc4:	e24b301c 	sub	r3, fp, #28
   10bc8:	e283300a 	add	r3, r3, #10
   10bcc:	e50b3008 	str	r3, [fp, #-8]
	}
	while (first_digit != &num_buffer[11]) {
   10bd0:	ea00000d 	b	10c0c <write_uint32+0x104>
		*buf++ = *first_digit++;
   10bd4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10bd8:	e2832001 	add	r2, r3, #1
   10bdc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
   10be0:	e51b2008 	ldr	r2, [fp, #-8]
   10be4:	e2821001 	add	r1, r2, #1
   10be8:	e50b1008 	str	r1, [fp, #-8]
   10bec:	e5d22000 	ldrb	r2, [r2]
   10bf0:	e5c32000 	strb	r2, [r3]
		if (buf == buf_end) {
   10bf4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10bf8:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
   10bfc:	e1520003 	cmp	r2, r3
   10c00:	1a000001 	bne	10c0c <write_uint32+0x104>
			return buf;
   10c04:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10c08:	ea000005 	b	10c24 <write_uint32+0x11c>
		first_digit = &num_buffer[idigit];
	} else {
		num_buffer[10] = '0';
		first_digit = &num_buffer[10];
	}
	while (first_digit != &num_buffer[11]) {
   10c0c:	e24b301c 	sub	r3, fp, #28
   10c10:	e283300b 	add	r3, r3, #11
   10c14:	e51b2008 	ldr	r2, [fp, #-8]
   10c18:	e1520003 	cmp	r2, r3
   10c1c:	1affffec 	bne	10bd4 <write_uint32+0xcc>
		*buf++ = *first_digit++;
		if (buf == buf_end) {
			return buf;
		}
	}
	return buf;
   10c20:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
   10c24:	e1a00003 	mov	r0, r3
   10c28:	e24bd000 	sub	sp, fp, #0
   10c2c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10c30:	e12fff1e 	bx	lr

00010c34 <sprintf>:

//C standard library function sprintf with buffer size specified
char* sprintf(char* buf, uint32 buf_size, const char* fmt, ...) {
   10c34:	e92d000c 	push	{r2, r3}
   10c38:	e92d4800 	push	{fp, lr}
   10c3c:	e28db004 	add	fp, sp, #4
   10c40:	e24dd028 	sub	sp, sp, #40	; 0x28
   10c44:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
   10c48:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
	if (buf_size < 1) {
   10c4c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10c50:	e3530000 	cmp	r3, #0
   10c54:	1a000001 	bne	10c60 <sprintf+0x2c>
		return nullptr; //Need at least space for null terminator
   10c58:	e3a03000 	mov	r3, #0
   10c5c:	ea0000a8 	b	10f04 <sprintf+0x2d0>
	}
	char* buf_start = buf;
   10c60:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10c64:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
   10c68:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10c6c:	e2433001 	sub	r3, r3, #1
   10c70:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10c74:	e0823003 	add	r3, r2, r3
   10c78:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
	uint32* var_args = (uint32*)&fmt + 1;
   10c7c:	e28b3008 	add	r3, fp, #8
   10c80:	e50b3008 	str	r3, [fp, #-8]
	
	while (buf != buf_end
   10c84:	ea000092 	b	10ed4 <sprintf+0x2a0>
	       && *fmt) {
		if (*fmt != '%') {
   10c88:	e59b3004 	ldr	r3, [fp, #4]
   10c8c:	e5d33000 	ldrb	r3, [r3]
   10c90:	e3530025 	cmp	r3, #37	; 0x25
   10c94:	0a000008 	beq	10cbc <sprintf+0x88>
			*buf++ = *fmt++;
   10c98:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10c9c:	e2832001 	add	r2, r3, #1
   10ca0:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10ca4:	e59b2004 	ldr	r2, [fp, #4]
   10ca8:	e2821001 	add	r1, r2, #1
   10cac:	e58b1004 	str	r1, [fp, #4]
   10cb0:	e5d22000 	ldrb	r2, [r2]
   10cb4:	e5c32000 	strb	r2, [r3]
   10cb8:	ea000085 	b	10ed4 <sprintf+0x2a0>
		} else {
			fmt++;
   10cbc:	e59b3004 	ldr	r3, [fp, #4]
   10cc0:	e2833001 	add	r3, r3, #1
   10cc4:	e58b3004 	str	r3, [fp, #4]
			switch (*fmt) {
   10cc8:	e59b3004 	ldr	r3, [fp, #4]
   10ccc:	e5d33000 	ldrb	r3, [r3]
   10cd0:	e3530058 	cmp	r3, #88	; 0x58
   10cd4:	0a000039 	beq	10dc0 <sprintf+0x18c>
   10cd8:	e3530058 	cmp	r3, #88	; 0x58
   10cdc:	ca00000b 	bgt	10d10 <sprintf+0xdc>
   10ce0:	e3530044 	cmp	r3, #68	; 0x44
   10ce4:	0a000017 	beq	10d48 <sprintf+0x114>
   10ce8:	e3530044 	cmp	r3, #68	; 0x44
   10cec:	ca000002 	bgt	10cfc <sprintf+0xc8>
   10cf0:	e3530000 	cmp	r3, #0
   10cf4:	0a000011 	beq	10d40 <sprintf+0x10c>
   10cf8:	ea000060 	b	10e80 <sprintf+0x24c>
   10cfc:	e3530053 	cmp	r3, #83	; 0x53
   10d00:	0a000046 	beq	10e20 <sprintf+0x1ec>
   10d04:	e3530055 	cmp	r3, #85	; 0x55
   10d08:	0a000038 	beq	10df0 <sprintf+0x1bc>
   10d0c:	ea00005b 	b	10e80 <sprintf+0x24c>
   10d10:	e3530073 	cmp	r3, #115	; 0x73
   10d14:	0a000041 	beq	10e20 <sprintf+0x1ec>
   10d18:	e3530073 	cmp	r3, #115	; 0x73
   10d1c:	ca000002 	bgt	10d2c <sprintf+0xf8>
   10d20:	e3530064 	cmp	r3, #100	; 0x64
   10d24:	0a000007 	beq	10d48 <sprintf+0x114>
   10d28:	ea000054 	b	10e80 <sprintf+0x24c>
   10d2c:	e3530075 	cmp	r3, #117	; 0x75
   10d30:	0a00002e 	beq	10df0 <sprintf+0x1bc>
   10d34:	e3530078 	cmp	r3, #120	; 0x78
   10d38:	0a000020 	beq	10dc0 <sprintf+0x18c>
   10d3c:	ea00004f 	b	10e80 <sprintf+0x24c>
			case 0:
				return buf_start;
   10d40:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10d44:	ea00006e 	b	10f04 <sprintf+0x2d0>
			case 'd':
			case 'D':
				{
					int32 num = *(int32*)var_args;
   10d48:	e51b3008 	ldr	r3, [fp, #-8]
   10d4c:	e5933000 	ldr	r3, [r3]
   10d50:	e50b300c 	str	r3, [fp, #-12]
					var_args++;
   10d54:	e51b3008 	ldr	r3, [fp, #-8]
   10d58:	e2833004 	add	r3, r3, #4
   10d5c:	e50b3008 	str	r3, [fp, #-8]
					if (num < 0) {
   10d60:	e51b300c 	ldr	r3, [fp, #-12]
   10d64:	e3530000 	cmp	r3, #0
   10d68:	aa00000d 	bge	10da4 <sprintf+0x170>
						*buf++ = '-';
   10d6c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10d70:	e2832001 	add	r2, r3, #1
   10d74:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10d78:	e3a0202d 	mov	r2, #45	; 0x2d
   10d7c:	e5c32000 	strb	r2, [r3]
						if (buf == buf_end) {
   10d80:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10d84:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10d88:	e1520003 	cmp	r2, r3
   10d8c:	1a000001 	bne	10d98 <sprintf+0x164>
							return buf_start;
   10d90:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10d94:	ea00005a 	b	10f04 <sprintf+0x2d0>
						}
						num = -num;
   10d98:	e51b300c 	ldr	r3, [fp, #-12]
   10d9c:	e2633000 	rsb	r3, r3, #0
   10da0:	e50b300c 	str	r3, [fp, #-12]
					}
					buf = write_uint32(buf, buf_end, 10, (uint32)num);
   10da4:	e51b300c 	ldr	r3, [fp, #-12]
   10da8:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10dac:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10db0:	e3a0200a 	mov	r2, #10
   10db4:	ebffff53 	bl	10b08 <write_uint32>
   10db8:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10dbc:	ea000041 	b	10ec8 <sprintf+0x294>
				}
			case 'x':
			case 'X':
				{
					uint32 num = *var_args++;
   10dc0:	e51b3008 	ldr	r3, [fp, #-8]
   10dc4:	e2832004 	add	r2, r3, #4
   10dc8:	e50b2008 	str	r2, [fp, #-8]
   10dcc:	e5933000 	ldr	r3, [r3]
   10dd0:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
					buf = write_uint32(buf, buf_end, 16, num);
   10dd4:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10dd8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10ddc:	e3a02010 	mov	r2, #16
   10de0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10de4:	ebffff47 	bl	10b08 <write_uint32>
   10de8:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10dec:	ea000035 	b	10ec8 <sprintf+0x294>
				}
			case 'u':
			case 'U':
				{
					uint32 num = *var_args++;
   10df0:	e51b3008 	ldr	r3, [fp, #-8]
   10df4:	e2832004 	add	r2, r3, #4
   10df8:	e50b2008 	str	r2, [fp, #-8]
   10dfc:	e5933000 	ldr	r3, [r3]
   10e00:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
					buf = write_uint32(buf, buf_end, 10, num);
   10e04:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10e08:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10e0c:	e3a0200a 	mov	r2, #10
   10e10:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10e14:	ebffff3b 	bl	10b08 <write_uint32>
   10e18:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10e1c:	ea000029 	b	10ec8 <sprintf+0x294>
				}
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
   10e20:	e51b3008 	ldr	r3, [fp, #-8]
   10e24:	e5933000 	ldr	r3, [r3]
   10e28:	e50b3010 	str	r3, [fp, #-16]
					var_args++;
   10e2c:	e51b3008 	ldr	r3, [fp, #-8]
   10e30:	e2833004 	add	r3, r3, #4
   10e34:	e50b3008 	str	r3, [fp, #-8]
					while (*insert
   10e38:	ea000007 	b	10e5c <sprintf+0x228>
					       && buf != buf_end) {
						*buf++ = *insert++;
   10e3c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e40:	e2832001 	add	r2, r3, #1
   10e44:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e48:	e51b2010 	ldr	r2, [fp, #-16]
   10e4c:	e2821001 	add	r1, r2, #1
   10e50:	e50b1010 	str	r1, [fp, #-16]
   10e54:	e5d22000 	ldrb	r2, [r2]
   10e58:	e5c32000 	strb	r2, [r3]
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
					var_args++;
					while (*insert
   10e5c:	e51b3010 	ldr	r3, [fp, #-16]
   10e60:	e5d33000 	ldrb	r3, [r3]
   10e64:	e3530000 	cmp	r3, #0
   10e68:	0a000003 	beq	10e7c <sprintf+0x248>
					       && buf != buf_end) {
   10e6c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10e70:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10e74:	e1520003 	cmp	r2, r3
   10e78:	1affffef 	bne	10e3c <sprintf+0x208>
						*buf++ = *insert++;
					}
					break;
   10e7c:	ea000011 	b	10ec8 <sprintf+0x294>
				}
			default:
				*buf++ = '%';
   10e80:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e84:	e2832001 	add	r2, r3, #1
   10e88:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e8c:	e3a02025 	mov	r2, #37	; 0x25
   10e90:	e5c32000 	strb	r2, [r3]
				if (buf == buf_end) {
   10e94:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10e98:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10e9c:	e1520003 	cmp	r2, r3
   10ea0:	1a000001 	bne	10eac <sprintf+0x278>
					return buf_start;
   10ea4:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10ea8:	ea000015 	b	10f04 <sprintf+0x2d0>
				}
				*buf++ = *fmt;
   10eac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10eb0:	e2832001 	add	r2, r3, #1
   10eb4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10eb8:	e59b2004 	ldr	r2, [fp, #4]
   10ebc:	e5d22000 	ldrb	r2, [r2]
   10ec0:	e5c32000 	strb	r2, [r3]
				break;
   10ec4:	e1a00000 	nop			; (mov r0, r0)
			}
			fmt++;
   10ec8:	e59b3004 	ldr	r3, [fp, #4]
   10ecc:	e2833001 	add	r3, r3, #1
   10ed0:	e58b3004 	str	r3, [fp, #4]
	}
	char* buf_start = buf;
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
	uint32* var_args = (uint32*)&fmt + 1;
	
	while (buf != buf_end
   10ed4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10ed8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10edc:	e1520003 	cmp	r2, r3
   10ee0:	0a000003 	beq	10ef4 <sprintf+0x2c0>
	       && *fmt) {
   10ee4:	e59b3004 	ldr	r3, [fp, #4]
   10ee8:	e5d33000 	ldrb	r3, [r3]
   10eec:	e3530000 	cmp	r3, #0
   10ef0:	1affff64 	bne	10c88 <sprintf+0x54>
				break;
			}
			fmt++;
		}
	}
	*buf = 0; //Null terminate
   10ef4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10ef8:	e3a02000 	mov	r2, #0
   10efc:	e5c32000 	strb	r2, [r3]
	return buf_start;
   10f00:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
}
   10f04:	e1a00003 	mov	r0, r3
   10f08:	e24bd004 	sub	sp, fp, #4
   10f0c:	e8bd4800 	pop	{fp, lr}
   10f10:	e28dd008 	add	sp, sp, #8
   10f14:	e12fff1e 	bx	lr

00010f18 <panic>:
//Panic function along with the function called when an assert is triggered
#include "utils.h"
#include "mem_mapped_io.h" //For UART

void panic(char* msg) {
   10f18:	e92d4800 	push	{fp, lr}
   10f1c:	e28db004 	add	fp, sp, #4
   10f20:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   10f24:	e24dd008 	sub	sp, sp, #8
   10f28:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f2c:	e2433004 	sub	r3, r3, #4
   10f30:	e5030004 	str	r0, [r3, #-4]
	static const char panic_msg_start[] = "Panic'd: ";
	char buf[4096];
	//The -1/+1 is to account for the null terminator
	memcpy(buf, panic_msg_start, sizeof(panic_msg_start) - 1);
   10f34:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f38:	e2433004 	sub	r3, r3, #4
   10f3c:	e1a00003 	mov	r0, r3
   10f40:	e30110a4 	movw	r1, #4260	; 0x10a4
   10f44:	e3401001 	movt	r1, #1
   10f48:	e3a02009 	mov	r2, #9
   10f4c:	ebfffe29 	bl	107f8 <memcpy>
	strcpy(buf + sizeof(panic_msg_start) - 1, msg, 4096 - sizeof(panic_msg_start) + 1);
   10f50:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f54:	e2433004 	sub	r3, r3, #4
   10f58:	e2832009 	add	r2, r3, #9
   10f5c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f60:	e2433004 	sub	r3, r3, #4
   10f64:	e1a00002 	mov	r0, r2
   10f68:	e5131004 	ldr	r1, [r3, #-4]
   10f6c:	e3002ff7 	movw	r2, #4087	; 0xff7
   10f70:	ebfffea3 	bl	10a04 <strcpy>
	uart0_put_str(buf);
   10f74:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f78:	e2433004 	sub	r3, r3, #4
   10f7c:	e1a00003 	mov	r0, r3
   10f80:	ebfffd95 	bl	105dc <uart0_put_str>
	while (true) {}
   10f84:	eafffffe 	b	10f84 <panic+0x6c>

00010f88 <trigger_assert>:
}

void trigger_assert(const char* expr_str, const char* file_name, uint32 line_number, const char* func_name) {
   10f88:	e92d4800 	push	{fp, lr}
   10f8c:	e28db004 	add	fp, sp, #4
   10f90:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   10f94:	e24dd020 	sub	sp, sp, #32
   10f98:	e24bca01 	sub	ip, fp, #4096	; 0x1000
   10f9c:	e24cc004 	sub	ip, ip, #4
   10fa0:	e50c0004 	str	r0, [ip, #-4]
   10fa4:	e24b0a01 	sub	r0, fp, #4096	; 0x1000
   10fa8:	e2400004 	sub	r0, r0, #4
   10fac:	e5001008 	str	r1, [r0, #-8]
   10fb0:	e24b1a01 	sub	r1, fp, #4096	; 0x1000
   10fb4:	e2411004 	sub	r1, r1, #4
   10fb8:	e501200c 	str	r2, [r1, #-12]
   10fbc:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   10fc0:	e2422004 	sub	r2, r2, #4
   10fc4:	e5023010 	str	r3, [r2, #-16]
	char msg[4096];
	sprintf(msg,
   10fc8:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   10fcc:	e2422004 	sub	r2, r2, #4
   10fd0:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10fd4:	e2433004 	sub	r3, r3, #4
   10fd8:	e1a0c003 	mov	ip, r3
   10fdc:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10fe0:	e2433004 	sub	r3, r3, #4
   10fe4:	e5133008 	ldr	r3, [r3, #-8]
   10fe8:	e58d3000 	str	r3, [sp]
   10fec:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10ff0:	e2433004 	sub	r3, r3, #4
   10ff4:	e513300c 	ldr	r3, [r3, #-12]
   10ff8:	e58d3004 	str	r3, [sp, #4]
   10ffc:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11000:	e2433004 	sub	r3, r3, #4
   11004:	e5133010 	ldr	r3, [r3, #-16]
   11008:	e58d3008 	str	r3, [sp, #8]
   1100c:	e1a00002 	mov	r0, r2
   11010:	e3a01a01 	mov	r1, #4096	; 0x1000
   11014:	e3012064 	movw	r2, #4196	; 0x1064
   11018:	e3402001 	movt	r2, #1
   1101c:	e51c3004 	ldr	r3, [ip, #-4]
   11020:	ebffff03 	bl	10c34 <sprintf>
	        "Assertion triggered\nExpression %s\nFile %s\nLine %u\nFunction %s\n",
	        expr_str,
	        file_name,
	        line_number,
	        func_name);
	panic(msg);
   11024:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11028:	e2433004 	sub	r3, r3, #4
   1102c:	e1a00003 	mov	r0, r3
   11030:	ebffffb8 	bl	10f18 <panic>
}
   11034:	e24bd004 	sub	sp, fp, #4
   11038:	e8bd8800 	pop	{fp, pc}
