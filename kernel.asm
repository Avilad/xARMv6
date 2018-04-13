
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
   10090:	eb0001d4 	bl	107e8 <fiq_handler>
   10094:	ea00002e 	b	10154 <trap_return>

00010098 <undefined_instruction_handler_asm>:
   10098:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1009c:	e14f2000 	mrs	r2, SPSR
   100a0:	e92d0004 	stmfd	sp!, {r2}
   100a4:	e94d6000 	stmdb	sp, {sp, lr}^
   100a8:	e24dd008 	sub	sp, sp, #8
   100ac:	e1a0000d 	mov	r0, sp
   100b0:	eb0001a2 	bl	10740 <undefined_instruction_handler>
   100b4:	ea000026 	b	10154 <trap_return>

000100b8 <software_interrupt_handler_asm>:
   100b8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100bc:	e14f2000 	mrs	r2, SPSR
   100c0:	e92d0004 	stmfd	sp!, {r2}
   100c4:	e94d6000 	stmdb	sp, {sp, lr}^
   100c8:	e24dd008 	sub	sp, sp, #8
   100cc:	e1a0000d 	mov	r0, sp
   100d0:	eb0001a1 	bl	1075c <software_interrupt_handler>
   100d4:	ea00001e 	b	10154 <trap_return>

000100d8 <prefetch_abort_handler_asm>:
   100d8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100dc:	e14f2000 	mrs	r2, SPSR
   100e0:	e92d0004 	stmfd	sp!, {r2}
   100e4:	e94d6000 	stmdb	sp, {sp, lr}^
   100e8:	e24dd008 	sub	sp, sp, #8
   100ec:	e1a0000d 	mov	r0, sp
   100f0:	eb0001a0 	bl	10778 <prefetch_abort_handler>
   100f4:	ea000016 	b	10154 <trap_return>

000100f8 <data_abort_handler_asm>:
   100f8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100fc:	e14f2000 	mrs	r2, SPSR
   10100:	e92d0004 	stmfd	sp!, {r2}
   10104:	e94d6000 	stmdb	sp, {sp, lr}^
   10108:	e24dd008 	sub	sp, sp, #8
   1010c:	e1a0000d 	mov	r0, sp
   10110:	eb00019f 	bl	10794 <data_abort_handler>
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
   10150:	eb00019d 	bl	107cc <irq_handler>

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
   10248:	eb0001c1 	bl	10954 <memcpy_region>
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   1024c:	e3060000 	movw	r0, #24576	; 0x6000
   10250:	e3400001 	movt	r0, #1
   10254:	e30610a0 	movw	r1, #24736	; 0x60a0
   10258:	e3401001 	movt	r1, #1
   1025c:	eb000214 	bl	10ab4 <zero_region>

	//---UART initialization
	char buf[256];
	char* test_string = sprintf(buf, 256, "Hello %d worlds!", -10);
   10260:	e24b3f46 	sub	r3, fp, #280	; 0x118
   10264:	e1a00003 	mov	r0, r3
   10268:	e3a01c01 	mov	r1, #256	; 0x100
   1026c:	e3012048 	movw	r2, #4168	; 0x1048
   10270:	e3402001 	movt	r2, #1
   10274:	e3e03009 	mvn	r3, #9
   10278:	eb000270 	bl	10c40 <sprintf>
   1027c:	e50b000c 	str	r0, [fp, #-12]
	uart0_init();
   10280:	eb000053 	bl	103d4 <uart0_init>
	uart0_put_str(test_string);
   10284:	e51b000c 	ldr	r0, [fp, #-12]
   10288:	eb0000d6 	bl	105e8 <uart0_put_str>

	// Identity map from 1MB up to MMIO_BASE
	uint32* page_table_base = (uint32*)((uint32)(kernel_end + 0x4000) & ~0x3FFF);
   1028c:	e59f30e8 	ldr	r3, [pc, #232]	; 1037c <kmain+0x154>
   10290:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
   10294:	e3c3303f 	bic	r3, r3, #63	; 0x3f
   10298:	e50b311c 	str	r3, [fp, #-284]	; 0xfffffee4
	for(uint32 vaddr = 0; vaddr < 1*MB; vaddr += MB) {
   1029c:	e3a03000 	mov	r3, #0
   102a0:	e50b3008 	str	r3, [fp, #-8]
   102a4:	ea000017 	b	10308 <kmain+0xe0>
		uint32 offset = (vaddr >> 20); // Upper 12 bits are the offset
   102a8:	e51b3008 	ldr	r3, [fp, #-8]
   102ac:	e1a03a23 	lsr	r3, r3, #20
   102b0:	e50b3010 	str	r3, [fp, #-16]
		uint32* pt_entry = page_table_base + offset;
   102b4:	e51b211c 	ldr	r2, [fp, #-284]	; 0xfffffee4
   102b8:	e51b3010 	ldr	r3, [fp, #-16]
   102bc:	e1a03103 	lsl	r3, r3, #2
   102c0:	e0823003 	add	r3, r2, r3
   102c4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
		*pt_entry = 0; 
   102c8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   102cc:	e3a02000 	mov	r2, #0
   102d0:	e5832000 	str	r2, [r3]
		*pt_entry = vaddr | AP_DONT_CHECK_PERMS | USE_SECTIONS;
   102d4:	e51b3008 	ldr	r3, [fp, #-8]
   102d8:	e3833b03 	orr	r3, r3, #3072	; 0xc00
   102dc:	e3833002 	orr	r3, r3, #2
   102e0:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   102e4:	e5823000 	str	r3, [r2]
		int x = 0;
   102e8:	e3a03000 	mov	r3, #0
   102ec:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
		x++;
   102f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   102f4:	e2833001 	add	r3, r3, #1
   102f8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
	uart0_init();
	uart0_put_str(test_string);

	// Identity map from 1MB up to MMIO_BASE
	uint32* page_table_base = (uint32*)((uint32)(kernel_end + 0x4000) & ~0x3FFF);
	for(uint32 vaddr = 0; vaddr < 1*MB; vaddr += MB) {
   102fc:	e51b3008 	ldr	r3, [fp, #-8]
   10300:	e2833601 	add	r3, r3, #1048576	; 0x100000
   10304:	e50b3008 	str	r3, [fp, #-8]
   10308:	e51b3008 	ldr	r3, [fp, #-8]
   1030c:	e3530601 	cmp	r3, #1048576	; 0x100000
   10310:	3affffe4 	bcc	102a8 <kmain+0x80>
	/*
	   https://github.com/dwelch67/raspberrypi/tree/master/mmu
	   https://stackoverflow.com/questions/20138294/getting-a-prefetch-abort-after-enabling-mmu-on-armv7
	   https://witekio.com/blog/turning-arm-mmu-living-tell-tale-code/
	*/
	set_operating_mode(PSR_SYSTEM_MODE);
   10314:	e3a0001f 	mov	r0, #31
   10318:	ebffffa4 	bl	101b0 <set_operating_mode>
	asm volatile("mov r0, $4;"
   1031c:	e24b3f47 	sub	r3, fp, #284	; 0x11c
   10320:	e3a00004 	mov	r0, #4
   10324:	e1e00000 	mvn	r0, r0
   10328:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   1032c:	e0001001 	and	r1, r0, r1
   10330:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
   10334:	e3a01000 	mov	r1, #0
   10338:	ee021f50 	mcr	15, 0, r1, cr2, cr0, {2}
   1033c:	ee071f17 	mcr	15, 0, r1, cr7, cr7, {0}
   10340:	ee071f95 	mcr	15, 0, r1, cr7, cr5, {4}
   10344:	ee081f17 	mcr	15, 0, r1, cr8, cr7, {0}
   10348:	e5930000 	ldr	r0, [r3]
   1034c:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
   10350:	f57ff04f 	dsb	sy
   10354:	e3e00000 	mvn	r0, #0
   10358:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
   1035c:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   10360:	e3811001 	orr	r1, r1, #1
   10364:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
				 :
				 : "r"(&page_table_base)
				 : "memory", "r0", "r1");

	while (1) {
		uart0_send_char(uart0_get_char());
   10368:	eb000085 	bl	10584 <uart0_get_char>
   1036c:	e1a03000 	mov	r3, r0
   10370:	e1a00003 	mov	r0, r3
   10374:	eb00005f 	bl	104f8 <uart0_send_char>
	}
   10378:	eafffffa 	b	10368 <kmain+0x140>
   1037c:	0001a0a0 	.word	0x0001a0a0

00010380 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   10380:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10384:	e28db000 	add	fp, sp, #0
   10388:	e24dd00c 	sub	sp, sp, #12
   1038c:	e50b0008 	str	r0, [fp, #-8]
   10390:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   10394:	e51b3008 	ldr	r3, [fp, #-8]
   10398:	e51b200c 	ldr	r2, [fp, #-12]
   1039c:	e5832000 	str	r2, [r3]
}
   103a0:	e24bd000 	sub	sp, fp, #0
   103a4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   103a8:	e12fff1e 	bx	lr

000103ac <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   103ac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   103b0:	e28db000 	add	fp, sp, #0
   103b4:	e24dd00c 	sub	sp, sp, #12
   103b8:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   103bc:	e51b3008 	ldr	r3, [fp, #-8]
   103c0:	e5933000 	ldr	r3, [r3]
}
   103c4:	e1a00003 	mov	r0, r3
   103c8:	e24bd000 	sub	sp, fp, #0
   103cc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   103d0:	e12fff1e 	bx	lr

000103d4 <uart0_init>:

void uart0_init() {
   103d4:	e92d4800 	push	{fp, lr}
   103d8:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   103dc:	e3010030 	movw	r0, #4144	; 0x1030
   103e0:	e3430f20 	movt	r0, #16160	; 0x3f20
   103e4:	e3a01000 	mov	r1, #0
   103e8:	ebffffe4 	bl	10380 <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   103ec:	e3a00094 	mov	r0, #148	; 0x94
   103f0:	e3430f20 	movt	r0, #16160	; 0x3f20
   103f4:	e3a01000 	mov	r1, #0
   103f8:	ebffffe0 	bl	10380 <mmio_write>
	delay(150);
   103fc:	e3063000 	movw	r3, #24576	; 0x6000
   10400:	e3403001 	movt	r3, #1
   10404:	e3a02096 	mov	r2, #150	; 0x96
   10408:	e5832000 	str	r2, [r3]
   1040c:	ea000000 	b	10414 <uart0_init+0x40>
   10410:	e320f000 	nop	{0}
   10414:	e3063000 	movw	r3, #24576	; 0x6000
   10418:	e3403001 	movt	r3, #1
   1041c:	e5932000 	ldr	r2, [r3]
   10420:	e2421001 	sub	r1, r2, #1
   10424:	e3063000 	movw	r3, #24576	; 0x6000
   10428:	e3403001 	movt	r3, #1
   1042c:	e5831000 	str	r1, [r3]
   10430:	e3520000 	cmp	r2, #0
   10434:	1afffff5 	bne	10410 <uart0_init+0x3c>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   10438:	e3a00098 	mov	r0, #152	; 0x98
   1043c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10440:	e3a01903 	mov	r1, #49152	; 0xc000
   10444:	ebffffcd 	bl	10380 <mmio_write>
	delay(150);
   10448:	e3063000 	movw	r3, #24576	; 0x6000
   1044c:	e3403001 	movt	r3, #1
   10450:	e3a02096 	mov	r2, #150	; 0x96
   10454:	e5832000 	str	r2, [r3]
   10458:	ea000000 	b	10460 <uart0_init+0x8c>
   1045c:	e320f000 	nop	{0}
   10460:	e3063000 	movw	r3, #24576	; 0x6000
   10464:	e3403001 	movt	r3, #1
   10468:	e5932000 	ldr	r2, [r3]
   1046c:	e2421001 	sub	r1, r2, #1
   10470:	e3063000 	movw	r3, #24576	; 0x6000
   10474:	e3403001 	movt	r3, #1
   10478:	e5831000 	str	r1, [r3]
   1047c:	e3520000 	cmp	r2, #0
   10480:	1afffff5 	bne	1045c <uart0_init+0x88>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   10484:	e3a00098 	mov	r0, #152	; 0x98
   10488:	e3430f20 	movt	r0, #16160	; 0x3f20
   1048c:	e3a01000 	mov	r1, #0
   10490:	ebffffba 	bl	10380 <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10494:	e3010044 	movw	r0, #4164	; 0x1044
   10498:	e3430f20 	movt	r0, #16160	; 0x3f20
   1049c:	e30017ff 	movw	r1, #2047	; 0x7ff
   104a0:	ebffffb6 	bl	10380 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   104a4:	e3010024 	movw	r0, #4132	; 0x1024
   104a8:	e3430f20 	movt	r0, #16160	; 0x3f20
   104ac:	e3a01001 	mov	r1, #1
   104b0:	ebffffb2 	bl	10380 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   104b4:	e3010028 	movw	r0, #4136	; 0x1028
   104b8:	e3430f20 	movt	r0, #16160	; 0x3f20
   104bc:	e3a01028 	mov	r1, #40	; 0x28
   104c0:	ebffffae 	bl	10380 <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   104c4:	e301002c 	movw	r0, #4140	; 0x102c
   104c8:	e3430f20 	movt	r0, #16160	; 0x3f20
   104cc:	e3a01070 	mov	r1, #112	; 0x70
   104d0:	ebffffaa 	bl	10380 <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   104d4:	e3010038 	movw	r0, #4152	; 0x1038
   104d8:	e3430f20 	movt	r0, #16160	; 0x3f20
   104dc:	e30017f2 	movw	r1, #2034	; 0x7f2
   104e0:	ebffffa6 	bl	10380 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   104e4:	e3010030 	movw	r0, #4144	; 0x1030
   104e8:	e3430f20 	movt	r0, #16160	; 0x3f20
   104ec:	e3001301 	movw	r1, #769	; 0x301
   104f0:	ebffffa2 	bl	10380 <mmio_write>
#endif
}
   104f4:	e8bd8800 	pop	{fp, pc}

000104f8 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   104f8:	e92d4800 	push	{fp, lr}
   104fc:	e28db004 	add	fp, sp, #4
   10500:	e24dd008 	sub	sp, sp, #8
   10504:	e1a03000 	mov	r3, r0
   10508:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   1050c:	e1a00000 	nop			; (mov r0, r0)
   10510:	e3010018 	movw	r0, #4120	; 0x1018
   10514:	e3430f20 	movt	r0, #16160	; 0x3f20
   10518:	ebffffa3 	bl	103ac <mmio_read>
   1051c:	e1a03000 	mov	r3, r0
   10520:	e2033020 	and	r3, r3, #32
   10524:	e3530000 	cmp	r3, #0
   10528:	1afffff8 	bne	10510 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   1052c:	e55b3005 	ldrb	r3, [fp, #-5]
   10530:	e3a00a01 	mov	r0, #4096	; 0x1000
   10534:	e3430f20 	movt	r0, #16160	; 0x3f20
   10538:	e1a01003 	mov	r1, r3
   1053c:	ebffff8f 	bl	10380 <mmio_write>
	delay(150);
   10540:	e3063000 	movw	r3, #24576	; 0x6000
   10544:	e3403001 	movt	r3, #1
   10548:	e3a02096 	mov	r2, #150	; 0x96
   1054c:	e5832000 	str	r2, [r3]
   10550:	ea000000 	b	10558 <uart0_send_char+0x60>
   10554:	e320f000 	nop	{0}
   10558:	e3063000 	movw	r3, #24576	; 0x6000
   1055c:	e3403001 	movt	r3, #1
   10560:	e5932000 	ldr	r2, [r3]
   10564:	e2421001 	sub	r1, r2, #1
   10568:	e3063000 	movw	r3, #24576	; 0x6000
   1056c:	e3403001 	movt	r3, #1
   10570:	e5831000 	str	r1, [r3]
   10574:	e3520000 	cmp	r2, #0
   10578:	1afffff5 	bne	10554 <uart0_send_char+0x5c>
}
   1057c:	e24bd004 	sub	sp, fp, #4
   10580:	e8bd8800 	pop	{fp, pc}

00010584 <uart0_get_char>:

char uart0_get_char() {
   10584:	e92d4800 	push	{fp, lr}
   10588:	e28db004 	add	fp, sp, #4
   1058c:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   10590:	e1a00000 	nop			; (mov r0, r0)
   10594:	e3010018 	movw	r0, #4120	; 0x1018
   10598:	e3430f20 	movt	r0, #16160	; 0x3f20
   1059c:	ebffff82 	bl	103ac <mmio_read>
   105a0:	e1a03000 	mov	r3, r0
   105a4:	e2033010 	and	r3, r3, #16
   105a8:	e3530000 	cmp	r3, #0
   105ac:	1afffff8 	bne	10594 <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   105b0:	e3a00a01 	mov	r0, #4096	; 0x1000
   105b4:	e3430f20 	movt	r0, #16160	; 0x3f20
   105b8:	ebffff7b 	bl	103ac <mmio_read>
   105bc:	e1a03000 	mov	r3, r0
   105c0:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   105c4:	e55b3005 	ldrb	r3, [fp, #-5]
   105c8:	e353000d 	cmp	r3, #13
   105cc:	0a000001 	beq	105d8 <uart0_get_char+0x54>
   105d0:	e55b3005 	ldrb	r3, [fp, #-5]
   105d4:	ea000000 	b	105dc <uart0_get_char+0x58>
   105d8:	e3a0300a 	mov	r3, #10
}
   105dc:	e1a00003 	mov	r0, r3
   105e0:	e24bd004 	sub	sp, fp, #4
   105e4:	e8bd8800 	pop	{fp, pc}

000105e8 <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   105e8:	e92d4800 	push	{fp, lr}
   105ec:	e28db004 	add	fp, sp, #4
   105f0:	e24dd008 	sub	sp, sp, #8
   105f4:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   105f8:	ea00000b 	b	1062c <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   105fc:	e51b3008 	ldr	r3, [fp, #-8]
   10600:	e5d33000 	ldrb	r3, [r3]
   10604:	e353000a 	cmp	r3, #10
   10608:	1a000001 	bne	10614 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   1060c:	e3a0000d 	mov	r0, #13
   10610:	ebffffb8 	bl	104f8 <uart0_send_char>
		}
		uart0_send_char(*s++);
   10614:	e51b3008 	ldr	r3, [fp, #-8]
   10618:	e2832001 	add	r2, r3, #1
   1061c:	e50b2008 	str	r2, [fp, #-8]
   10620:	e5d33000 	ldrb	r3, [r3]
   10624:	e1a00003 	mov	r0, r3
   10628:	ebffffb2 	bl	104f8 <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   1062c:	e51b3008 	ldr	r3, [fp, #-8]
   10630:	e5d33000 	ldrb	r3, [r3]
   10634:	e3530000 	cmp	r3, #0
   10638:	1affffef 	bne	105fc <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   1063c:	e24bd004 	sub	sp, fp, #4
   10640:	e8bd8800 	pop	{fp, pc}

00010644 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   10644:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10648:	e28db000 	add	fp, sp, #0
   1064c:	e24dd01c 	sub	sp, sp, #28
   10650:	e1a03000 	mov	r3, r0
   10654:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   10658:	e320f000 	nop	{0}
    } while (*MBOX_STATUS & MBOX_FULL);
   1065c:	e30b3898 	movw	r3, #47256	; 0xb898
   10660:	e3433f00 	movt	r3, #16128	; 0x3f00
   10664:	e5933000 	ldr	r3, [r3]
   10668:	e3530000 	cmp	r3, #0
   1066c:	bafffff9 	blt	10658 <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   10670:	e55b0015 	ldrb	r0, [fp, #-21]	; 0xffffffeb
   10674:	e3a01000 	mov	r1, #0
   10678:	e3063010 	movw	r3, #24592	; 0x6010
   1067c:	e3403001 	movt	r3, #1
   10680:	e1a02003 	mov	r2, r3
   10684:	e3a03000 	mov	r3, #0
   10688:	e1822000 	orr	r2, r2, r0
   1068c:	e1833001 	orr	r3, r3, r1
   10690:	e14b20fc 	strd	r2, [fp, #-12]
    *MBOX_WRITE = mailbox_addr_or_channel;
   10694:	e30b38a0 	movw	r3, #47264	; 0xb8a0
   10698:	e3433f00 	movt	r3, #16128	; 0x3f00
   1069c:	e51b200c 	ldr	r2, [fp, #-12]
   106a0:	e5832000 	str	r2, [r3]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   106a4:	e320f000 	nop	{0}
        } while(*MBOX_STATUS & MBOX_EMPTY);
   106a8:	e30b3898 	movw	r3, #47256	; 0xb898
   106ac:	e3433f00 	movt	r3, #16128	; 0x3f00
   106b0:	e5933000 	ldr	r3, [r3]
   106b4:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   106b8:	e3530000 	cmp	r3, #0
   106bc:	1afffff8 	bne	106a4 <mailbox_send_message+0x60>
        
        uint32 response = *MBOX_READ;
   106c0:	e30b3880 	movw	r3, #47232	; 0xb880
   106c4:	e3433f00 	movt	r3, #16128	; 0x3f00
   106c8:	e5933000 	ldr	r3, [r3]
   106cc:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   106d0:	e51b3010 	ldr	r3, [fp, #-16]
   106d4:	e6ef3073 	uxtb	r3, r3
   106d8:	e203200f 	and	r2, r3, #15
   106dc:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   106e0:	e1520003 	cmp	r2, r3
   106e4:	1a00000f 	bne	10728 <mailbox_send_message+0xe4>
   106e8:	e51b3010 	ldr	r3, [fp, #-16]
   106ec:	e3c3200f 	bic	r2, r3, #15
   106f0:	e3063010 	movw	r3, #24592	; 0x6010
   106f4:	e3403001 	movt	r3, #1
   106f8:	e1520003 	cmp	r2, r3
   106fc:	1a000009 	bne	10728 <mailbox_send_message+0xe4>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   10700:	e3063010 	movw	r3, #24592	; 0x6010
   10704:	e3403001 	movt	r3, #1
   10708:	e5933004 	ldr	r3, [r3, #4]
   1070c:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   10710:	03a03001 	moveq	r3, #1
   10714:	13a03000 	movne	r3, #0
   10718:	e6ef3073 	uxtb	r3, r3
   1071c:	e6ef2073 	uxtb	r2, r3
   10720:	e3a03000 	mov	r3, #0
   10724:	ea000000 	b	1072c <mailbox_send_message+0xe8>
        }
    }
   10728:	eaffffdd 	b	106a4 <mailbox_send_message+0x60>
    return 0;
}
   1072c:	e1a00002 	mov	r0, r2
   10730:	e1a01003 	mov	r1, r3
   10734:	e24bd000 	sub	sp, fp, #0
   10738:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1073c:	e12fff1e 	bx	lr

00010740 <undefined_instruction_handler>:
//Handles traps
#include "arm.h"

void undefined_instruction_handler(struct trap_frame* tf) {
   10740:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10744:	e28db000 	add	fp, sp, #0
   10748:	e24dd00c 	sub	sp, sp, #12
   1074c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10750:	e24bd000 	sub	sp, fp, #0
   10754:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10758:	e12fff1e 	bx	lr

0001075c <software_interrupt_handler>:
void software_interrupt_handler(struct trap_frame* tf) {
   1075c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10760:	e28db000 	add	fp, sp, #0
   10764:	e24dd00c 	sub	sp, sp, #12
   10768:	e50b0008 	str	r0, [fp, #-8]
	
}
   1076c:	e24bd000 	sub	sp, fp, #0
   10770:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10774:	e12fff1e 	bx	lr

00010778 <prefetch_abort_handler>:
void prefetch_abort_handler(struct trap_frame* tf) {
   10778:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1077c:	e28db000 	add	fp, sp, #0
   10780:	e24dd00c 	sub	sp, sp, #12
   10784:	e50b0008 	str	r0, [fp, #-8]
	
}
   10788:	e24bd000 	sub	sp, fp, #0
   1078c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10790:	e12fff1e 	bx	lr

00010794 <data_abort_handler>:
void data_abort_handler(struct trap_frame* tf) {
   10794:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10798:	e28db000 	add	fp, sp, #0
   1079c:	e24dd00c 	sub	sp, sp, #12
   107a0:	e50b0008 	str	r0, [fp, #-8]
	
}
   107a4:	e24bd000 	sub	sp, fp, #0
   107a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107ac:	e12fff1e 	bx	lr

000107b0 <unused_exception_handler>:
void unused_exception_handler(struct trap_frame* tf) {
   107b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107b4:	e28db000 	add	fp, sp, #0
   107b8:	e24dd00c 	sub	sp, sp, #12
   107bc:	e50b0008 	str	r0, [fp, #-8]
	
}
   107c0:	e24bd000 	sub	sp, fp, #0
   107c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107c8:	e12fff1e 	bx	lr

000107cc <irq_handler>:
void irq_handler(struct trap_frame* tf) {
   107cc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107d0:	e28db000 	add	fp, sp, #0
   107d4:	e24dd00c 	sub	sp, sp, #12
   107d8:	e50b0008 	str	r0, [fp, #-8]
	
}
   107dc:	e24bd000 	sub	sp, fp, #0
   107e0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107e4:	e12fff1e 	bx	lr

000107e8 <fiq_handler>:
void fiq_handler(struct trap_frame* tf) {
   107e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   107ec:	e28db000 	add	fp, sp, #0
   107f0:	e24dd00c 	sub	sp, sp, #12
   107f4:	e50b0008 	str	r0, [fp, #-8]
	
}
   107f8:	e24bd000 	sub	sp, fp, #0
   107fc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10800:	e12fff1e 	bx	lr

00010804 <memcpy>:
//Useful memory functions like memcpy
#include "utils.h"

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint32 size) {
   10804:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10808:	e28db000 	add	fp, sp, #0
   1080c:	e24dd024 	sub	sp, sp, #36	; 0x24
   10810:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10814:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10818:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   1081c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10820:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   10824:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10828:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   1082c:	e51b200c 	ldr	r2, [fp, #-12]
   10830:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10834:	e0823003 	add	r3, r2, r3
   10838:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   1083c:	ea000007 	b	10860 <memcpy+0x5c>
		*dest++ = *src++;
   10840:	e51b3008 	ldr	r3, [fp, #-8]
   10844:	e2832001 	add	r2, r3, #1
   10848:	e50b2008 	str	r2, [fp, #-8]
   1084c:	e51b200c 	ldr	r2, [fp, #-12]
   10850:	e2821001 	add	r1, r2, #1
   10854:	e50b100c 	str	r1, [fp, #-12]
   10858:	e5d22000 	ldrb	r2, [r2]
   1085c:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint32 size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   10860:	e51b200c 	ldr	r2, [fp, #-12]
   10864:	e51b3010 	ldr	r3, [fp, #-16]
   10868:	e1520003 	cmp	r2, r3
   1086c:	1afffff3 	bne	10840 <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   10870:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10874:	e1a00003 	mov	r0, r3
   10878:	e24bd000 	sub	sp, fp, #0
   1087c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10880:	e12fff1e 	bx	lr

00010884 <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, const void* source, uint32 size) {
   10884:	e92d4800 	push	{fp, lr}
   10888:	e28db004 	add	fp, sp, #4
   1088c:	e24dd020 	sub	sp, sp, #32
   10890:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10894:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10898:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   1089c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   108a0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   108a4:	e1520003 	cmp	r2, r3
   108a8:	1a000001 	bne	108b4 <memmove+0x30>
		return destination;
   108ac:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   108b0:	ea000024 	b	10948 <memmove+0xc4>
	}
	if (destination < source) {
   108b4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   108b8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   108bc:	e1520003 	cmp	r2, r3
   108c0:	2a000005 	bcs	108dc <memmove+0x58>
		return memcpy(destination, source, size);
   108c4:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
   108c8:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   108cc:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   108d0:	ebffffcb 	bl	10804 <memcpy>
   108d4:	e1a03000 	mov	r3, r0
   108d8:	ea00001a 	b	10948 <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   108dc:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   108e0:	e2433001 	sub	r3, r3, #1
   108e4:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   108e8:	e0823003 	add	r3, r2, r3
   108ec:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   108f0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   108f4:	e2433001 	sub	r3, r3, #1
   108f8:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   108fc:	e0823003 	add	r3, r2, r3
   10900:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   10904:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10908:	e2433001 	sub	r3, r3, #1
   1090c:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10910:	ea000007 	b	10934 <memmove+0xb0>
		*dest-- = *src--;
   10914:	e51b3008 	ldr	r3, [fp, #-8]
   10918:	e2432001 	sub	r2, r3, #1
   1091c:	e50b2008 	str	r2, [fp, #-8]
   10920:	e51b200c 	ldr	r2, [fp, #-12]
   10924:	e2421001 	sub	r1, r2, #1
   10928:	e50b100c 	str	r1, [fp, #-12]
   1092c:	e5d22000 	ldrb	r2, [r2]
   10930:	e5c32000 	strb	r2, [r3]
		return memcpy(destination, source, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   10934:	e51b200c 	ldr	r2, [fp, #-12]
   10938:	e51b3010 	ldr	r3, [fp, #-16]
   1093c:	e1520003 	cmp	r2, r3
   10940:	1afffff3 	bne	10914 <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   10944:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10948:	e1a00003 	mov	r0, r3
   1094c:	e24bd004 	sub	sp, fp, #4
   10950:	e8bd8800 	pop	{fp, pc}

00010954 <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
   10954:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10958:	e28db000 	add	fp, sp, #0
   1095c:	e24dd024 	sub	sp, sp, #36	; 0x24
   10960:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10964:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10968:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   1096c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10970:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   10974:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10978:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   1097c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10980:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10984:	ea000007 	b	109a8 <memcpy_region+0x54>
		*dest++ = *src++;
   10988:	e51b3008 	ldr	r3, [fp, #-8]
   1098c:	e2832001 	add	r2, r3, #1
   10990:	e50b2008 	str	r2, [fp, #-8]
   10994:	e51b200c 	ldr	r2, [fp, #-12]
   10998:	e2821001 	add	r1, r2, #1
   1099c:	e50b100c 	str	r1, [fp, #-12]
   109a0:	e5d22000 	ldrb	r2, [r2]
   109a4:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   109a8:	e51b200c 	ldr	r2, [fp, #-12]
   109ac:	e51b3010 	ldr	r3, [fp, #-16]
   109b0:	e1520003 	cmp	r2, r3
   109b4:	1afffff3 	bne	10988 <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   109b8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   109bc:	e1a00003 	mov	r0, r3
   109c0:	e24bd000 	sub	sp, fp, #0
   109c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   109c8:	e12fff1e 	bx	lr

000109cc <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* destination, const void* source_start, const void* source_end) {
   109cc:	e92d4800 	push	{fp, lr}
   109d0:	e28db004 	add	fp, sp, #4
   109d4:	e24dd010 	sub	sp, sp, #16
   109d8:	e50b0008 	str	r0, [fp, #-8]
   109dc:	e50b100c 	str	r1, [fp, #-12]
   109e0:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   109e4:	e51b2010 	ldr	r2, [fp, #-16]
   109e8:	e51b300c 	ldr	r3, [fp, #-12]
   109ec:	e0633002 	rsb	r3, r3, r2
   109f0:	e51b0008 	ldr	r0, [fp, #-8]
   109f4:	e51b100c 	ldr	r1, [fp, #-12]
   109f8:	e1a02003 	mov	r2, r3
   109fc:	ebffffa0 	bl	10884 <memmove>
   10a00:	e1a03000 	mov	r3, r0
}
   10a04:	e1a00003 	mov	r0, r3
   10a08:	e24bd004 	sub	sp, fp, #4
   10a0c:	e8bd8800 	pop	{fp, pc}

00010a10 <strcpy>:

//Copy null terminated source into destination which is at least dest_size in length
//dest_size includes the space for the null terminator
char* strcpy(char* destination, const char* source, uint32 dest_size) {
   10a10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10a14:	e28db000 	add	fp, sp, #0
   10a18:	e24dd01c 	sub	sp, sp, #28
   10a1c:	e50b0010 	str	r0, [fp, #-16]
   10a20:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10a24:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
	if (dest_size < 1) {
   10a28:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10a2c:	e3530000 	cmp	r3, #0
   10a30:	1a000001 	bne	10a3c <strcpy+0x2c>
		return nullptr;
   10a34:	e3a03000 	mov	r3, #0
   10a38:	ea000019 	b	10aa4 <strcpy+0x94>
	}
	char* dest_end = destination + dest_size - 1;
   10a3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10a40:	e2433001 	sub	r3, r3, #1
   10a44:	e51b2010 	ldr	r2, [fp, #-16]
   10a48:	e0823003 	add	r3, r2, r3
   10a4c:	e50b3008 	str	r3, [fp, #-8]
	while (*source
   10a50:	ea000007 	b	10a74 <strcpy+0x64>
	       && destination != dest_end) {
		*destination++ = *source++;
   10a54:	e51b3010 	ldr	r3, [fp, #-16]
   10a58:	e2832001 	add	r2, r3, #1
   10a5c:	e50b2010 	str	r2, [fp, #-16]
   10a60:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   10a64:	e2821001 	add	r1, r2, #1
   10a68:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10a6c:	e5d22000 	ldrb	r2, [r2]
   10a70:	e5c32000 	strb	r2, [r3]
char* strcpy(char* destination, const char* source, uint32 dest_size) {
	if (dest_size < 1) {
		return nullptr;
	}
	char* dest_end = destination + dest_size - 1;
	while (*source
   10a74:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10a78:	e5d33000 	ldrb	r3, [r3]
   10a7c:	e3530000 	cmp	r3, #0
   10a80:	0a000003 	beq	10a94 <strcpy+0x84>
	       && destination != dest_end) {
   10a84:	e51b2010 	ldr	r2, [fp, #-16]
   10a88:	e51b3008 	ldr	r3, [fp, #-8]
   10a8c:	e1520003 	cmp	r2, r3
   10a90:	1affffef 	bne	10a54 <strcpy+0x44>
		*destination++ = *source++;
	}
	*destination = 0;
   10a94:	e51b3010 	ldr	r3, [fp, #-16]
   10a98:	e3a02000 	mov	r2, #0
   10a9c:	e5c32000 	strb	r2, [r3]
	return destination;
   10aa0:	e51b3010 	ldr	r3, [fp, #-16]
}
   10aa4:	e1a00003 	mov	r0, r3
   10aa8:	e24bd000 	sub	sp, fp, #0
   10aac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10ab0:	e12fff1e 	bx	lr

00010ab4 <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   10ab4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10ab8:	e28db000 	add	fp, sp, #0
   10abc:	e24dd014 	sub	sp, sp, #20
   10ac0:	e50b0010 	str	r0, [fp, #-16]
   10ac4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   10ac8:	e51b3010 	ldr	r3, [fp, #-16]
   10acc:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   10ad0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10ad4:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   10ad8:	ea000004 	b	10af0 <zero_region+0x3c>
		*start++ = 0;
   10adc:	e51b3008 	ldr	r3, [fp, #-8]
   10ae0:	e2832001 	add	r2, r3, #1
   10ae4:	e50b2008 	str	r2, [fp, #-8]
   10ae8:	e3a02000 	mov	r2, #0
   10aec:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   10af0:	e51b2008 	ldr	r2, [fp, #-8]
   10af4:	e51b300c 	ldr	r3, [fp, #-12]
   10af8:	e1520003 	cmp	r2, r3
   10afc:	1afffff6 	bne	10adc <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   10b00:	e51b3010 	ldr	r3, [fp, #-16]
}
   10b04:	e1a00003 	mov	r0, r3
   10b08:	e24bd000 	sub	sp, fp, #0
   10b0c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10b10:	e12fff1e 	bx	lr

00010b14 <write_uint32>:

//sprintf helper for writing unsigned ints
//returns false if buf is full
static char* write_uint32(char* buf, char* buf_end, uint32 base, uint32 num) {
   10b14:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10b18:	e28db000 	add	fp, sp, #0
   10b1c:	e24dd02c 	sub	sp, sp, #44	; 0x2c
   10b20:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
   10b24:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
   10b28:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10b2c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
   10b30:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10b34:	e3530000 	cmp	r3, #0
   10b38:	0a000022 	beq	10bc8 <write_uint32+0xb4>
		uint32 idigit = 11;
   10b3c:	e3a0300b 	mov	r3, #11
   10b40:	e50b300c 	str	r3, [fp, #-12]
		while (num) {
   10b44:	ea000017 	b	10ba8 <write_uint32+0x94>
			uint32 digit = num % base;
   10b48:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10b4c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10b50:	e732f213 	udiv	r2, r3, r2
   10b54:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
   10b58:	e0020291 	mul	r2, r1, r2
   10b5c:	e0623003 	rsb	r3, r2, r3
   10b60:	e50b3010 	str	r3, [fp, #-16]
			idigit--;
   10b64:	e51b300c 	ldr	r3, [fp, #-12]
   10b68:	e2433001 	sub	r3, r3, #1
   10b6c:	e50b300c 	str	r3, [fp, #-12]
			num_buffer[idigit] = digits[digit];
   10b70:	e301305c 	movw	r3, #4188	; 0x105c
   10b74:	e3403001 	movt	r3, #1
   10b78:	e51b2010 	ldr	r2, [fp, #-16]
   10b7c:	e0833002 	add	r3, r3, r2
   10b80:	e5d31000 	ldrb	r1, [r3]
   10b84:	e24b201c 	sub	r2, fp, #28
   10b88:	e51b300c 	ldr	r3, [fp, #-12]
   10b8c:	e0823003 	add	r3, r2, r3
   10b90:	e1a02001 	mov	r2, r1
   10b94:	e5c32000 	strb	r2, [r3]
			num /= base;
   10b98:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
   10b9c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10ba0:	e733f312 	udiv	r3, r2, r3
   10ba4:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
		uint32 idigit = 11;
		while (num) {
   10ba8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10bac:	e3530000 	cmp	r3, #0
   10bb0:	1affffe4 	bne	10b48 <write_uint32+0x34>
			uint32 digit = num % base;
			idigit--;
			num_buffer[idigit] = digits[digit];
			num /= base;
		}
		first_digit = &num_buffer[idigit];
   10bb4:	e24b201c 	sub	r2, fp, #28
   10bb8:	e51b300c 	ldr	r3, [fp, #-12]
   10bbc:	e0823003 	add	r3, r2, r3
   10bc0:	e50b3008 	str	r3, [fp, #-8]
   10bc4:	ea000004 	b	10bdc <write_uint32+0xc8>
	} else {
		num_buffer[10] = '0';
   10bc8:	e3a03030 	mov	r3, #48	; 0x30
   10bcc:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
		first_digit = &num_buffer[10];
   10bd0:	e24b301c 	sub	r3, fp, #28
   10bd4:	e283300a 	add	r3, r3, #10
   10bd8:	e50b3008 	str	r3, [fp, #-8]
	}
	while (first_digit != &num_buffer[11]) {
   10bdc:	ea00000d 	b	10c18 <write_uint32+0x104>
		*buf++ = *first_digit++;
   10be0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10be4:	e2832001 	add	r2, r3, #1
   10be8:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
   10bec:	e51b2008 	ldr	r2, [fp, #-8]
   10bf0:	e2821001 	add	r1, r2, #1
   10bf4:	e50b1008 	str	r1, [fp, #-8]
   10bf8:	e5d22000 	ldrb	r2, [r2]
   10bfc:	e5c32000 	strb	r2, [r3]
		if (buf == buf_end) {
   10c00:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10c04:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
   10c08:	e1520003 	cmp	r2, r3
   10c0c:	1a000001 	bne	10c18 <write_uint32+0x104>
			return buf;
   10c10:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10c14:	ea000005 	b	10c30 <write_uint32+0x11c>
		first_digit = &num_buffer[idigit];
	} else {
		num_buffer[10] = '0';
		first_digit = &num_buffer[10];
	}
	while (first_digit != &num_buffer[11]) {
   10c18:	e24b301c 	sub	r3, fp, #28
   10c1c:	e283300b 	add	r3, r3, #11
   10c20:	e51b2008 	ldr	r2, [fp, #-8]
   10c24:	e1520003 	cmp	r2, r3
   10c28:	1affffec 	bne	10be0 <write_uint32+0xcc>
		*buf++ = *first_digit++;
		if (buf == buf_end) {
			return buf;
		}
	}
	return buf;
   10c2c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
   10c30:	e1a00003 	mov	r0, r3
   10c34:	e24bd000 	sub	sp, fp, #0
   10c38:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10c3c:	e12fff1e 	bx	lr

00010c40 <sprintf>:

//C standard library function sprintf with buffer size specified
char* sprintf(char* buf, uint32 buf_size, const char* fmt, ...) {
   10c40:	e92d000c 	push	{r2, r3}
   10c44:	e92d4800 	push	{fp, lr}
   10c48:	e28db004 	add	fp, sp, #4
   10c4c:	e24dd028 	sub	sp, sp, #40	; 0x28
   10c50:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
   10c54:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
	if (buf_size < 1) {
   10c58:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10c5c:	e3530000 	cmp	r3, #0
   10c60:	1a000001 	bne	10c6c <sprintf+0x2c>
		return nullptr; //Need at least space for null terminator
   10c64:	e3a03000 	mov	r3, #0
   10c68:	ea0000a8 	b	10f10 <sprintf+0x2d0>
	}
	char* buf_start = buf;
   10c6c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10c70:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
   10c74:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10c78:	e2433001 	sub	r3, r3, #1
   10c7c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10c80:	e0823003 	add	r3, r2, r3
   10c84:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
	uint32* var_args = (uint32*)&fmt + 1;
   10c88:	e28b3008 	add	r3, fp, #8
   10c8c:	e50b3008 	str	r3, [fp, #-8]
	
	while (buf != buf_end
   10c90:	ea000092 	b	10ee0 <sprintf+0x2a0>
	       && *fmt) {
		if (*fmt != '%') {
   10c94:	e59b3004 	ldr	r3, [fp, #4]
   10c98:	e5d33000 	ldrb	r3, [r3]
   10c9c:	e3530025 	cmp	r3, #37	; 0x25
   10ca0:	0a000008 	beq	10cc8 <sprintf+0x88>
			*buf++ = *fmt++;
   10ca4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10ca8:	e2832001 	add	r2, r3, #1
   10cac:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10cb0:	e59b2004 	ldr	r2, [fp, #4]
   10cb4:	e2821001 	add	r1, r2, #1
   10cb8:	e58b1004 	str	r1, [fp, #4]
   10cbc:	e5d22000 	ldrb	r2, [r2]
   10cc0:	e5c32000 	strb	r2, [r3]
   10cc4:	ea000085 	b	10ee0 <sprintf+0x2a0>
		} else {
			fmt++;
   10cc8:	e59b3004 	ldr	r3, [fp, #4]
   10ccc:	e2833001 	add	r3, r3, #1
   10cd0:	e58b3004 	str	r3, [fp, #4]
			switch (*fmt) {
   10cd4:	e59b3004 	ldr	r3, [fp, #4]
   10cd8:	e5d33000 	ldrb	r3, [r3]
   10cdc:	e3530058 	cmp	r3, #88	; 0x58
   10ce0:	0a000039 	beq	10dcc <sprintf+0x18c>
   10ce4:	e3530058 	cmp	r3, #88	; 0x58
   10ce8:	ca00000b 	bgt	10d1c <sprintf+0xdc>
   10cec:	e3530044 	cmp	r3, #68	; 0x44
   10cf0:	0a000017 	beq	10d54 <sprintf+0x114>
   10cf4:	e3530044 	cmp	r3, #68	; 0x44
   10cf8:	ca000002 	bgt	10d08 <sprintf+0xc8>
   10cfc:	e3530000 	cmp	r3, #0
   10d00:	0a000011 	beq	10d4c <sprintf+0x10c>
   10d04:	ea000060 	b	10e8c <sprintf+0x24c>
   10d08:	e3530053 	cmp	r3, #83	; 0x53
   10d0c:	0a000046 	beq	10e2c <sprintf+0x1ec>
   10d10:	e3530055 	cmp	r3, #85	; 0x55
   10d14:	0a000038 	beq	10dfc <sprintf+0x1bc>
   10d18:	ea00005b 	b	10e8c <sprintf+0x24c>
   10d1c:	e3530073 	cmp	r3, #115	; 0x73
   10d20:	0a000041 	beq	10e2c <sprintf+0x1ec>
   10d24:	e3530073 	cmp	r3, #115	; 0x73
   10d28:	ca000002 	bgt	10d38 <sprintf+0xf8>
   10d2c:	e3530064 	cmp	r3, #100	; 0x64
   10d30:	0a000007 	beq	10d54 <sprintf+0x114>
   10d34:	ea000054 	b	10e8c <sprintf+0x24c>
   10d38:	e3530075 	cmp	r3, #117	; 0x75
   10d3c:	0a00002e 	beq	10dfc <sprintf+0x1bc>
   10d40:	e3530078 	cmp	r3, #120	; 0x78
   10d44:	0a000020 	beq	10dcc <sprintf+0x18c>
   10d48:	ea00004f 	b	10e8c <sprintf+0x24c>
			case 0:
				return buf_start;
   10d4c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10d50:	ea00006e 	b	10f10 <sprintf+0x2d0>
			case 'd':
			case 'D':
				{
					int32 num = *(int32*)var_args;
   10d54:	e51b3008 	ldr	r3, [fp, #-8]
   10d58:	e5933000 	ldr	r3, [r3]
   10d5c:	e50b300c 	str	r3, [fp, #-12]
					var_args++;
   10d60:	e51b3008 	ldr	r3, [fp, #-8]
   10d64:	e2833004 	add	r3, r3, #4
   10d68:	e50b3008 	str	r3, [fp, #-8]
					if (num < 0) {
   10d6c:	e51b300c 	ldr	r3, [fp, #-12]
   10d70:	e3530000 	cmp	r3, #0
   10d74:	aa00000d 	bge	10db0 <sprintf+0x170>
						*buf++ = '-';
   10d78:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10d7c:	e2832001 	add	r2, r3, #1
   10d80:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10d84:	e3a0202d 	mov	r2, #45	; 0x2d
   10d88:	e5c32000 	strb	r2, [r3]
						if (buf == buf_end) {
   10d8c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10d90:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10d94:	e1520003 	cmp	r2, r3
   10d98:	1a000001 	bne	10da4 <sprintf+0x164>
							return buf_start;
   10d9c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10da0:	ea00005a 	b	10f10 <sprintf+0x2d0>
						}
						num = -num;
   10da4:	e51b300c 	ldr	r3, [fp, #-12]
   10da8:	e2633000 	rsb	r3, r3, #0
   10dac:	e50b300c 	str	r3, [fp, #-12]
					}
					buf = write_uint32(buf, buf_end, 10, (uint32)num);
   10db0:	e51b300c 	ldr	r3, [fp, #-12]
   10db4:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10db8:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10dbc:	e3a0200a 	mov	r2, #10
   10dc0:	ebffff53 	bl	10b14 <write_uint32>
   10dc4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10dc8:	ea000041 	b	10ed4 <sprintf+0x294>
				}
			case 'x':
			case 'X':
				{
					uint32 num = *var_args++;
   10dcc:	e51b3008 	ldr	r3, [fp, #-8]
   10dd0:	e2832004 	add	r2, r3, #4
   10dd4:	e50b2008 	str	r2, [fp, #-8]
   10dd8:	e5933000 	ldr	r3, [r3]
   10ddc:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
					buf = write_uint32(buf, buf_end, 16, num);
   10de0:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10de4:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10de8:	e3a02010 	mov	r2, #16
   10dec:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10df0:	ebffff47 	bl	10b14 <write_uint32>
   10df4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10df8:	ea000035 	b	10ed4 <sprintf+0x294>
				}
			case 'u':
			case 'U':
				{
					uint32 num = *var_args++;
   10dfc:	e51b3008 	ldr	r3, [fp, #-8]
   10e00:	e2832004 	add	r2, r3, #4
   10e04:	e50b2008 	str	r2, [fp, #-8]
   10e08:	e5933000 	ldr	r3, [r3]
   10e0c:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
					buf = write_uint32(buf, buf_end, 10, num);
   10e10:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10e14:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10e18:	e3a0200a 	mov	r2, #10
   10e1c:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10e20:	ebffff3b 	bl	10b14 <write_uint32>
   10e24:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10e28:	ea000029 	b	10ed4 <sprintf+0x294>
				}
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
   10e2c:	e51b3008 	ldr	r3, [fp, #-8]
   10e30:	e5933000 	ldr	r3, [r3]
   10e34:	e50b3010 	str	r3, [fp, #-16]
					var_args++;
   10e38:	e51b3008 	ldr	r3, [fp, #-8]
   10e3c:	e2833004 	add	r3, r3, #4
   10e40:	e50b3008 	str	r3, [fp, #-8]
					while (*insert
   10e44:	ea000007 	b	10e68 <sprintf+0x228>
					       && buf != buf_end) {
						*buf++ = *insert++;
   10e48:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e4c:	e2832001 	add	r2, r3, #1
   10e50:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e54:	e51b2010 	ldr	r2, [fp, #-16]
   10e58:	e2821001 	add	r1, r2, #1
   10e5c:	e50b1010 	str	r1, [fp, #-16]
   10e60:	e5d22000 	ldrb	r2, [r2]
   10e64:	e5c32000 	strb	r2, [r3]
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
					var_args++;
					while (*insert
   10e68:	e51b3010 	ldr	r3, [fp, #-16]
   10e6c:	e5d33000 	ldrb	r3, [r3]
   10e70:	e3530000 	cmp	r3, #0
   10e74:	0a000003 	beq	10e88 <sprintf+0x248>
					       && buf != buf_end) {
   10e78:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10e7c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10e80:	e1520003 	cmp	r2, r3
   10e84:	1affffef 	bne	10e48 <sprintf+0x208>
						*buf++ = *insert++;
					}
					break;
   10e88:	ea000011 	b	10ed4 <sprintf+0x294>
				}
			default:
				*buf++ = '%';
   10e8c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e90:	e2832001 	add	r2, r3, #1
   10e94:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e98:	e3a02025 	mov	r2, #37	; 0x25
   10e9c:	e5c32000 	strb	r2, [r3]
				if (buf == buf_end) {
   10ea0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10ea4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10ea8:	e1520003 	cmp	r2, r3
   10eac:	1a000001 	bne	10eb8 <sprintf+0x278>
					return buf_start;
   10eb0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10eb4:	ea000015 	b	10f10 <sprintf+0x2d0>
				}
				*buf++ = *fmt;
   10eb8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10ebc:	e2832001 	add	r2, r3, #1
   10ec0:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10ec4:	e59b2004 	ldr	r2, [fp, #4]
   10ec8:	e5d22000 	ldrb	r2, [r2]
   10ecc:	e5c32000 	strb	r2, [r3]
				break;
   10ed0:	e1a00000 	nop			; (mov r0, r0)
			}
			fmt++;
   10ed4:	e59b3004 	ldr	r3, [fp, #4]
   10ed8:	e2833001 	add	r3, r3, #1
   10edc:	e58b3004 	str	r3, [fp, #4]
	}
	char* buf_start = buf;
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
	uint32* var_args = (uint32*)&fmt + 1;
	
	while (buf != buf_end
   10ee0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10ee4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10ee8:	e1520003 	cmp	r2, r3
   10eec:	0a000003 	beq	10f00 <sprintf+0x2c0>
	       && *fmt) {
   10ef0:	e59b3004 	ldr	r3, [fp, #4]
   10ef4:	e5d33000 	ldrb	r3, [r3]
   10ef8:	e3530000 	cmp	r3, #0
   10efc:	1affff64 	bne	10c94 <sprintf+0x54>
				break;
			}
			fmt++;
		}
	}
	*buf = 0; //Null terminate
   10f00:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10f04:	e3a02000 	mov	r2, #0
   10f08:	e5c32000 	strb	r2, [r3]
	return buf_start;
   10f0c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
}
   10f10:	e1a00003 	mov	r0, r3
   10f14:	e24bd004 	sub	sp, fp, #4
   10f18:	e8bd4800 	pop	{fp, lr}
   10f1c:	e28dd008 	add	sp, sp, #8
   10f20:	e12fff1e 	bx	lr

00010f24 <panic>:
//Panic function along with the function called when an assert is triggered
#include "utils.h"
#include "mem_mapped_io.h" //For UART

void panic(char* msg) {
   10f24:	e92d4800 	push	{fp, lr}
   10f28:	e28db004 	add	fp, sp, #4
   10f2c:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   10f30:	e24dd008 	sub	sp, sp, #8
   10f34:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f38:	e2433004 	sub	r3, r3, #4
   10f3c:	e5030004 	str	r0, [r3, #-4]
	static const char panic_msg_start[] = "Panic'd: ";
	char buf[4096];
	//The -1/+1 is to account for the null terminator
	memcpy(buf, panic_msg_start, sizeof(panic_msg_start) - 1);
   10f40:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f44:	e2433004 	sub	r3, r3, #4
   10f48:	e1a00003 	mov	r0, r3
   10f4c:	e30110b0 	movw	r1, #4272	; 0x10b0
   10f50:	e3401001 	movt	r1, #1
   10f54:	e3a02009 	mov	r2, #9
   10f58:	ebfffe29 	bl	10804 <memcpy>
	strcpy(buf + sizeof(panic_msg_start) - 1, msg, 4096 - sizeof(panic_msg_start) + 1);
   10f5c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f60:	e2433004 	sub	r3, r3, #4
   10f64:	e2832009 	add	r2, r3, #9
   10f68:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f6c:	e2433004 	sub	r3, r3, #4
   10f70:	e1a00002 	mov	r0, r2
   10f74:	e5131004 	ldr	r1, [r3, #-4]
   10f78:	e3002ff7 	movw	r2, #4087	; 0xff7
   10f7c:	ebfffea3 	bl	10a10 <strcpy>
	uart0_put_str(buf);
   10f80:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f84:	e2433004 	sub	r3, r3, #4
   10f88:	e1a00003 	mov	r0, r3
   10f8c:	ebfffd95 	bl	105e8 <uart0_put_str>
	while (true) {}
   10f90:	eafffffe 	b	10f90 <panic+0x6c>

00010f94 <trigger_assert>:
}

void trigger_assert(const char* expr_str, const char* file_name, uint32 line_number, const char* func_name) {
   10f94:	e92d4800 	push	{fp, lr}
   10f98:	e28db004 	add	fp, sp, #4
   10f9c:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   10fa0:	e24dd020 	sub	sp, sp, #32
   10fa4:	e24bca01 	sub	ip, fp, #4096	; 0x1000
   10fa8:	e24cc004 	sub	ip, ip, #4
   10fac:	e50c0004 	str	r0, [ip, #-4]
   10fb0:	e24b0a01 	sub	r0, fp, #4096	; 0x1000
   10fb4:	e2400004 	sub	r0, r0, #4
   10fb8:	e5001008 	str	r1, [r0, #-8]
   10fbc:	e24b1a01 	sub	r1, fp, #4096	; 0x1000
   10fc0:	e2411004 	sub	r1, r1, #4
   10fc4:	e501200c 	str	r2, [r1, #-12]
   10fc8:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   10fcc:	e2422004 	sub	r2, r2, #4
   10fd0:	e5023010 	str	r3, [r2, #-16]
	char msg[4096];
	sprintf(msg,
   10fd4:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   10fd8:	e2422004 	sub	r2, r2, #4
   10fdc:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10fe0:	e2433004 	sub	r3, r3, #4
   10fe4:	e1a0c003 	mov	ip, r3
   10fe8:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10fec:	e2433004 	sub	r3, r3, #4
   10ff0:	e5133008 	ldr	r3, [r3, #-8]
   10ff4:	e58d3000 	str	r3, [sp]
   10ff8:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10ffc:	e2433004 	sub	r3, r3, #4
   11000:	e513300c 	ldr	r3, [r3, #-12]
   11004:	e58d3004 	str	r3, [sp, #4]
   11008:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   1100c:	e2433004 	sub	r3, r3, #4
   11010:	e5133010 	ldr	r3, [r3, #-16]
   11014:	e58d3008 	str	r3, [sp, #8]
   11018:	e1a00002 	mov	r0, r2
   1101c:	e3a01a01 	mov	r1, #4096	; 0x1000
   11020:	e3012070 	movw	r2, #4208	; 0x1070
   11024:	e3402001 	movt	r2, #1
   11028:	e51c3004 	ldr	r3, [ip, #-4]
   1102c:	ebffff03 	bl	10c40 <sprintf>
	        "Assertion triggered\nExpression %s\nFile %s\nLine %u\nFunction %s\n",
	        expr_str,
	        file_name,
	        line_number,
	        func_name);
	panic(msg);
   11030:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11034:	e2433004 	sub	r3, r3, #4
   11038:	e1a00003 	mov	r0, r3
   1103c:	ebffffb8 	bl	10f24 <panic>
}
   11040:	e24bd004 	sub	sp, fp, #4
   11044:	e8bd8800 	pop	{fp, pc}
