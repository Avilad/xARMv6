
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
   1004c:	eb000058 	bl	101b4 <kmain>

00010050 <loop_forever>:
   10050:	e320f002 	wfe
   10054:	eafffffd 	b	10050 <loop_forever>
   10058:	00012000 	.word	0x00012000
   1005c:	00010000 	.word	0x00010000

00010060 <linker_vector_table_start>:
   10060:	ea00000d 	b	1009c <reset_handler_asm>
   10064:	ea00000e 	b	100a4 <undefined_instruction_handler_asm>
   10068:	ea000016 	b	100c8 <software_interrupt_handler_asm>
   1006c:	ea00001e 	b	100ec <prefetch_abort_handler_asm>
   10070:	ea000026 	b	10110 <data_abort_handler_asm>
   10074:	ea00002e 	b	10134 <unused_exception_handler_asm>
   10078:	ea000036 	b	10158 <irq_handler_asm>

0001007c <fiq_handler_asm>:
   1007c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10080:	e14f2000 	mrs	r2, SPSR
   10084:	e92d0004 	stmfd	sp!, {r2}
   10088:	e94d6000 	stmdb	sp, {sp, lr}^
   1008c:	e24dd008 	sub	sp, sp, #8
   10090:	e59fb114 	ldr	fp, [pc, #276]	; 101ac <fiq_handler_c+0x4>
   10094:	e59bf000 	ldr	pc, [fp]
   10098:	ea000036 	b	10178 <trap_return>

0001009c <reset_handler_asm>:
   1009c:	e59fb0e8 	ldr	fp, [pc, #232]	; 1018c <reset_handler_c>
   100a0:	e59bf000 	ldr	pc, [fp]

000100a4 <undefined_instruction_handler_asm>:
   100a4:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100a8:	e14f2000 	mrs	r2, SPSR
   100ac:	e92d0004 	stmfd	sp!, {r2}
   100b0:	e94d6000 	stmdb	sp, {sp, lr}^
   100b4:	e24dd008 	sub	sp, sp, #8
   100b8:	e1a0000d 	mov	r0, sp
   100bc:	e59fb0ec 	ldr	fp, [pc, #236]	; 101b0 <fiq_handler_c+0x8>
   100c0:	e59bf000 	ldr	pc, [fp]
   100c4:	ea00002b 	b	10178 <trap_return>

000100c8 <software_interrupt_handler_asm>:
   100c8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100cc:	e14f2000 	mrs	r2, SPSR
   100d0:	e92d0004 	stmfd	sp!, {r2}
   100d4:	e94d6000 	stmdb	sp, {sp, lr}^
   100d8:	e24dd008 	sub	sp, sp, #8
   100dc:	e1a0000d 	mov	r0, sp
   100e0:	e59fb0ac 	ldr	fp, [pc, #172]	; 10194 <software_interrupt_handler_c>
   100e4:	e59bf000 	ldr	pc, [fp]
   100e8:	ea000022 	b	10178 <trap_return>

000100ec <prefetch_abort_handler_asm>:
   100ec:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100f0:	e14f2000 	mrs	r2, SPSR
   100f4:	e92d0004 	stmfd	sp!, {r2}
   100f8:	e94d6000 	stmdb	sp, {sp, lr}^
   100fc:	e24dd008 	sub	sp, sp, #8
   10100:	e1a0000d 	mov	r0, sp
   10104:	e59fb08c 	ldr	fp, [pc, #140]	; 10198 <prefetch_abort_handler_c>
   10108:	e59bf000 	ldr	pc, [fp]
   1010c:	ea000019 	b	10178 <trap_return>

00010110 <data_abort_handler_asm>:
   10110:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10114:	e14f2000 	mrs	r2, SPSR
   10118:	e92d0004 	stmfd	sp!, {r2}
   1011c:	e94d6000 	stmdb	sp, {sp, lr}^
   10120:	e24dd008 	sub	sp, sp, #8
   10124:	e1a0000d 	mov	r0, sp
   10128:	e59fb06c 	ldr	fp, [pc, #108]	; 1019c <data_abort_handler_c>
   1012c:	e59bf000 	ldr	pc, [fp]
   10130:	ea000010 	b	10178 <trap_return>

00010134 <unused_exception_handler_asm>:
   10134:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10138:	e14f2000 	mrs	r2, SPSR
   1013c:	e92d0004 	stmfd	sp!, {r2}
   10140:	e94d6000 	stmdb	sp, {sp, lr}^
   10144:	e24dd008 	sub	sp, sp, #8
   10148:	e1a0000d 	mov	r0, sp
   1014c:	e59fb04c 	ldr	fp, [pc, #76]	; 101a0 <unused_exception_handler_c>
   10150:	e59bf000 	ldr	pc, [fp]
   10154:	ea000007 	b	10178 <trap_return>

00010158 <irq_handler_asm>:
   10158:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1015c:	e14f2000 	mrs	r2, SPSR
   10160:	e92d0004 	stmfd	sp!, {r2}
   10164:	e94d6000 	stmdb	sp, {sp, lr}^
   10168:	e24dd008 	sub	sp, sp, #8
   1016c:	e1a0000d 	mov	r0, sp
   10170:	e59fb02c 	ldr	fp, [pc, #44]	; 101a4 <irq_handler_c>
   10174:	e59bf000 	ldr	pc, [fp]

00010178 <trap_return>:
   10178:	e8dd6000 	ldm	sp, {sp, lr}^
   1017c:	e28dd008 	add	sp, sp, #8
   10180:	e8bd0004 	ldmfd	sp!, {r2}
   10184:	e16ff002 	msr	SPSR_fsxc, r2
   10188:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

0001018c <reset_handler_c>:
   1018c:	00010000 	.word	0x00010000

00010190 <undefined_instruction_handler_c>:
   10190:	000107e4 	.word	0x000107e4

00010194 <software_interrupt_handler_c>:
   10194:	00010834 	.word	0x00010834

00010198 <prefetch_abort_handler_c>:
   10198:	00010858 	.word	0x00010858

0001019c <data_abort_handler_c>:
   1019c:	000108a8 	.word	0x000108a8

000101a0 <unused_exception_handler_c>:
   101a0:	00010908 	.word	0x00010908

000101a4 <irq_handler_c>:
   101a4:	00010934 	.word	0x00010934

000101a8 <fiq_handler_c>:
   101a8:	00010958 	.word	0x00010958
   101ac:	000101a8 	.word	0x000101a8
   101b0:	00010190 	.word	0x00010190

000101b4 <kmain>:
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];

void kmain(void) {
   101b4:	e92d4800 	push	{fp, lr}
   101b8:	e28db004 	add	fp, sp, #4
	//---Initialize MMU
	vm_init();
   101bc:	eb000011 	bl	10208 <vm_init>

	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
   101c0:	e3a00000 	mov	r0, #0
   101c4:	e3001060 	movw	r1, #96	; 0x60
   101c8:	e3401001 	movt	r1, #1
   101cc:	e30021b4 	movw	r2, #436	; 0x1b4
   101d0:	e3402001 	movt	r2, #1
   101d4:	eb0002b7 	bl	10cb8 <memcpy_region>

	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   101d8:	e3060000 	movw	r0, #24576	; 0x6000
   101dc:	e3400001 	movt	r0, #1
   101e0:	e30610a0 	movw	r1, #24736	; 0x60a0
   101e4:	e3401001 	movt	r1, #1
   101e8:	eb00030a 	bl	10e18 <zero_region>

	//---UART initialization
	uart0_init();
   101ec:	eb000054 	bl	10344 <uart0_init>

	//---Generic timer interrupts initialization
	timer_init();
   101f0:	eb0001e3 	bl	10984 <timer_init>
	// uart0_put_str(test_string);



	while (1) {
		uart0_send_char(uart0_get_char());
   101f4:	eb0000be 	bl	104f4 <uart0_get_char>
   101f8:	e1a03000 	mov	r3, r0
   101fc:	e1a00003 	mov	r0, r3
   10200:	eb000098 	bl	10468 <uart0_send_char>
	}
   10204:	eafffffa 	b	101f4 <kmain+0x40>

00010208 <vm_init>:
#define USE_SECTIONS 0x2
#define AP_DONT_CHECK_PERMS 0xC00

extern char kernel_end[];

void vm_init() {
   10208:	e92d4800 	push	{fp, lr}
   1020c:	e28db004 	add	fp, sp, #4
   10210:	e24dd010 	sub	sp, sp, #16
  // Identity map from 1MB up to PERI_BASE
	uint offset = 0;
   10214:	e3a03000 	mov	r3, #0
   10218:	e50b3008 	str	r3, [fp, #-8]
	uint* page_table_base = (uint*)((uint)(kernel_end + 0x4000) & ~0x3FFF);
   1021c:	e59f30c8 	ldr	r3, [pc, #200]	; 102ec <vm_init+0xe4>
   10220:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
   10224:	e3c3303f 	bic	r3, r3, #63	; 0x3f
   10228:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
	for(uint vaddr = 0; vaddr < (1 << 31); vaddr += MB) {
   1022c:	e3a03000 	mov	r3, #0
   10230:	e50b300c 	str	r3, [fp, #-12]
   10234:	ea000012 	b	10284 <vm_init+0x7c>
		uint* pt_entry = page_table_base + offset;
   10238:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   1023c:	e51b3008 	ldr	r3, [fp, #-8]
   10240:	e1a03103 	lsl	r3, r3, #2
   10244:	e0823003 	add	r3, r2, r3
   10248:	e50b3010 	str	r3, [fp, #-16]
		*pt_entry = 0;
   1024c:	e51b3010 	ldr	r3, [fp, #-16]
   10250:	e3a02000 	mov	r2, #0
   10254:	e5832000 	str	r2, [r3]
		*pt_entry = vaddr | AP_DONT_CHECK_PERMS | USE_SECTIONS;
   10258:	e51b300c 	ldr	r3, [fp, #-12]
   1025c:	e3833b03 	orr	r3, r3, #3072	; 0xc00
   10260:	e3833002 	orr	r3, r3, #2
   10264:	e51b2010 	ldr	r2, [fp, #-16]
   10268:	e5823000 	str	r3, [r2]
		offset++;
   1026c:	e51b3008 	ldr	r3, [fp, #-8]
   10270:	e2833001 	add	r3, r3, #1
   10274:	e50b3008 	str	r3, [fp, #-8]

void vm_init() {
  // Identity map from 1MB up to PERI_BASE
	uint offset = 0;
	uint* page_table_base = (uint*)((uint)(kernel_end + 0x4000) & ~0x3FFF);
	for(uint vaddr = 0; vaddr < (1 << 31); vaddr += MB) {
   10278:	e51b300c 	ldr	r3, [fp, #-12]
   1027c:	e2833601 	add	r3, r3, #1048576	; 0x100000
   10280:	e50b300c 	str	r3, [fp, #-12]
   10284:	e51b300c 	ldr	r3, [fp, #-12]
   10288:	e3530000 	cmp	r3, #0
   1028c:	aaffffe9 	bge	10238 <vm_init+0x30>
	/*
	   https://github.com/dwelch67/raspberrypi/tree/master/mmu
	   https://stackoverflow.com/questions/20138294/getting-a-prefetch-abort-after-enabling-mmu-on-armv7
	   https://witekio.com/blog/turning-arm-mmu-living-tell-tale-code/
	*/
	set_operating_mode(PSR_SYSTEM_MODE);
   10290:	e3a0001f 	mov	r0, #31
   10294:	eb000456 	bl	113f4 <set_operating_mode>

	asm volatile("mov r0, $4;"
   10298:	e24b3014 	sub	r3, fp, #20
   1029c:	e3a00004 	mov	r0, #4
   102a0:	e1e00000 	mvn	r0, r0
   102a4:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   102a8:	e0001001 	and	r1, r0, r1
   102ac:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
   102b0:	e3a01000 	mov	r1, #0
   102b4:	ee021f50 	mcr	15, 0, r1, cr2, cr0, {2}
   102b8:	ee071f15 	mcr	15, 0, r1, cr7, cr5, {0}
   102bc:	ee071f95 	mcr	15, 0, r1, cr7, cr5, {4}
   102c0:	ee081f17 	mcr	15, 0, r1, cr8, cr7, {0}
   102c4:	e5930000 	ldr	r0, [r3]
   102c8:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
   102cc:	f57ff04f 	dsb	sy
   102d0:	e3e00000 	mvn	r0, #0
   102d4:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
   102d8:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   102dc:	e3811001 	orr	r1, r1, #1
   102e0:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
                 "orr r1, r1, $1;"             // Enable mmu bit (0x1)
                 "mcr p15, 0, r1, c1, c0, 0;"  // Put that bad boy back in there
				 :
				 : "r"(&page_table_base)
				 : "memory", "r0", "r1");
}
   102e4:	e24bd004 	sub	sp, fp, #4
   102e8:	e8bd8800 	pop	{fp, pc}
   102ec:	0001a0a0 	.word	0x0001a0a0

000102f0 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint* reg, uint data) {
   102f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   102f4:	e28db000 	add	fp, sp, #0
   102f8:	e24dd00c 	sub	sp, sp, #12
   102fc:	e50b0008 	str	r0, [fp, #-8]
   10300:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   10304:	e51b3008 	ldr	r3, [fp, #-8]
   10308:	e51b200c 	ldr	r2, [fp, #-12]
   1030c:	e5832000 	str	r2, [r3]
}
   10310:	e24bd000 	sub	sp, fp, #0
   10314:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10318:	e12fff1e 	bx	lr

0001031c <mmio_read>:
uint mmio_read(volatile uint* reg) {
   1031c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10320:	e28db000 	add	fp, sp, #0
   10324:	e24dd00c 	sub	sp, sp, #12
   10328:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   1032c:	e51b3008 	ldr	r3, [fp, #-8]
   10330:	e5933000 	ldr	r3, [r3]
}
   10334:	e1a00003 	mov	r0, r3
   10338:	e24bd000 	sub	sp, fp, #0
   1033c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10340:	e12fff1e 	bx	lr

00010344 <uart0_init>:

void uart0_init() {
   10344:	e92d4800 	push	{fp, lr}
   10348:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   1034c:	e3010030 	movw	r0, #4144	; 0x1030
   10350:	e3430f20 	movt	r0, #16160	; 0x3f20
   10354:	e3a01000 	mov	r1, #0
   10358:	ebffffe4 	bl	102f0 <mmio_write>
	// Setup the GPIO pin 14 && 15.

	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   1035c:	e3a00094 	mov	r0, #148	; 0x94
   10360:	e3430f20 	movt	r0, #16160	; 0x3f20
   10364:	e3a01000 	mov	r1, #0
   10368:	ebffffe0 	bl	102f0 <mmio_write>
	delay(150);
   1036c:	e3063000 	movw	r3, #24576	; 0x6000
   10370:	e3403001 	movt	r3, #1
   10374:	e3a02096 	mov	r2, #150	; 0x96
   10378:	e5832000 	str	r2, [r3]
   1037c:	ea000000 	b	10384 <uart0_init+0x40>
   10380:	e320f000 	nop	{0}
   10384:	e3063000 	movw	r3, #24576	; 0x6000
   10388:	e3403001 	movt	r3, #1
   1038c:	e5932000 	ldr	r2, [r3]
   10390:	e2421001 	sub	r1, r2, #1
   10394:	e3063000 	movw	r3, #24576	; 0x6000
   10398:	e3403001 	movt	r3, #1
   1039c:	e5831000 	str	r1, [r3]
   103a0:	e3520000 	cmp	r2, #0
   103a4:	1afffff5 	bne	10380 <uart0_init+0x3c>

	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   103a8:	e3a00098 	mov	r0, #152	; 0x98
   103ac:	e3430f20 	movt	r0, #16160	; 0x3f20
   103b0:	e3a01903 	mov	r1, #49152	; 0xc000
   103b4:	ebffffcd 	bl	102f0 <mmio_write>
	delay(150);
   103b8:	e3063000 	movw	r3, #24576	; 0x6000
   103bc:	e3403001 	movt	r3, #1
   103c0:	e3a02096 	mov	r2, #150	; 0x96
   103c4:	e5832000 	str	r2, [r3]
   103c8:	ea000000 	b	103d0 <uart0_init+0x8c>
   103cc:	e320f000 	nop	{0}
   103d0:	e3063000 	movw	r3, #24576	; 0x6000
   103d4:	e3403001 	movt	r3, #1
   103d8:	e5932000 	ldr	r2, [r3]
   103dc:	e2421001 	sub	r1, r2, #1
   103e0:	e3063000 	movw	r3, #24576	; 0x6000
   103e4:	e3403001 	movt	r3, #1
   103e8:	e5831000 	str	r1, [r3]
   103ec:	e3520000 	cmp	r2, #0
   103f0:	1afffff5 	bne	103cc <uart0_init+0x88>

	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   103f4:	e3a00098 	mov	r0, #152	; 0x98
   103f8:	e3430f20 	movt	r0, #16160	; 0x3f20
   103fc:	e3a01000 	mov	r1, #0
   10400:	ebffffba 	bl	102f0 <mmio_write>

	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10404:	e3010044 	movw	r0, #4164	; 0x1044
   10408:	e3430f20 	movt	r0, #16160	; 0x3f20
   1040c:	e30017ff 	movw	r1, #2047	; 0x7ff
   10410:	ebffffb6 	bl	102f0 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.

	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   10414:	e3010024 	movw	r0, #4132	; 0x1024
   10418:	e3430f20 	movt	r0, #16160	; 0x3f20
   1041c:	e3a01001 	mov	r1, #1
   10420:	ebffffb2 	bl	102f0 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   10424:	e3010028 	movw	r0, #4136	; 0x1028
   10428:	e3430f20 	movt	r0, #16160	; 0x3f20
   1042c:	e3a01028 	mov	r1, #40	; 0x28
   10430:	ebffffae 	bl	102f0 <mmio_write>

	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   10434:	e301002c 	movw	r0, #4140	; 0x102c
   10438:	e3430f20 	movt	r0, #16160	; 0x3f20
   1043c:	e3a01070 	mov	r1, #112	; 0x70
   10440:	ebffffaa 	bl	102f0 <mmio_write>

	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   10444:	e3010038 	movw	r0, #4152	; 0x1038
   10448:	e3430f20 	movt	r0, #16160	; 0x3f20
   1044c:	e30017f2 	movw	r1, #2034	; 0x7f2
   10450:	ebffffa6 	bl	102f0 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));

	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   10454:	e3010030 	movw	r0, #4144	; 0x1030
   10458:	e3430f20 	movt	r0, #16160	; 0x3f20
   1045c:	e3001301 	movw	r1, #769	; 0x301
   10460:	ebffffa2 	bl	102f0 <mmio_write>
#endif
}
   10464:	e8bd8800 	pop	{fp, pc}

00010468 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   10468:	e92d4800 	push	{fp, lr}
   1046c:	e28db004 	add	fp, sp, #4
   10470:	e24dd008 	sub	sp, sp, #8
   10474:	e1a03000 	mov	r3, r0
   10478:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   1047c:	e1a00000 	nop			; (mov r0, r0)
   10480:	e3010018 	movw	r0, #4120	; 0x1018
   10484:	e3430f20 	movt	r0, #16160	; 0x3f20
   10488:	ebffffa3 	bl	1031c <mmio_read>
   1048c:	e1a03000 	mov	r3, r0
   10490:	e2033020 	and	r3, r3, #32
   10494:	e3530000 	cmp	r3, #0
   10498:	1afffff8 	bne	10480 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   1049c:	e55b3005 	ldrb	r3, [fp, #-5]
   104a0:	e3a00a01 	mov	r0, #4096	; 0x1000
   104a4:	e3430f20 	movt	r0, #16160	; 0x3f20
   104a8:	e1a01003 	mov	r1, r3
   104ac:	ebffff8f 	bl	102f0 <mmio_write>
	delay(150);
   104b0:	e3063000 	movw	r3, #24576	; 0x6000
   104b4:	e3403001 	movt	r3, #1
   104b8:	e3a02096 	mov	r2, #150	; 0x96
   104bc:	e5832000 	str	r2, [r3]
   104c0:	ea000000 	b	104c8 <uart0_send_char+0x60>
   104c4:	e320f000 	nop	{0}
   104c8:	e3063000 	movw	r3, #24576	; 0x6000
   104cc:	e3403001 	movt	r3, #1
   104d0:	e5932000 	ldr	r2, [r3]
   104d4:	e2421001 	sub	r1, r2, #1
   104d8:	e3063000 	movw	r3, #24576	; 0x6000
   104dc:	e3403001 	movt	r3, #1
   104e0:	e5831000 	str	r1, [r3]
   104e4:	e3520000 	cmp	r2, #0
   104e8:	1afffff5 	bne	104c4 <uart0_send_char+0x5c>
}
   104ec:	e24bd004 	sub	sp, fp, #4
   104f0:	e8bd8800 	pop	{fp, pc}

000104f4 <uart0_get_char>:

char uart0_get_char() {
   104f4:	e92d4800 	push	{fp, lr}
   104f8:	e28db004 	add	fp, sp, #4
   104fc:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   10500:	e1a00000 	nop			; (mov r0, r0)
   10504:	e3010018 	movw	r0, #4120	; 0x1018
   10508:	e3430f20 	movt	r0, #16160	; 0x3f20
   1050c:	ebffff82 	bl	1031c <mmio_read>
   10510:	e1a03000 	mov	r3, r0
   10514:	e2033010 	and	r3, r3, #16
   10518:	e3530000 	cmp	r3, #0
   1051c:	1afffff8 	bne	10504 <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   10520:	e3a00a01 	mov	r0, #4096	; 0x1000
   10524:	e3430f20 	movt	r0, #16160	; 0x3f20
   10528:	ebffff7b 	bl	1031c <mmio_read>
   1052c:	e1a03000 	mov	r3, r0
   10530:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   10534:	e55b3005 	ldrb	r3, [fp, #-5]
   10538:	e353000d 	cmp	r3, #13
   1053c:	0a000001 	beq	10548 <uart0_get_char+0x54>
   10540:	e55b3005 	ldrb	r3, [fp, #-5]
   10544:	ea000000 	b	1054c <uart0_get_char+0x58>
   10548:	e3a0300a 	mov	r3, #10
}
   1054c:	e1a00003 	mov	r0, r3
   10550:	e24bd004 	sub	sp, fp, #4
   10554:	e8bd8800 	pop	{fp, pc}

00010558 <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   10558:	e92d4800 	push	{fp, lr}
   1055c:	e28db004 	add	fp, sp, #4
   10560:	e24dd008 	sub	sp, sp, #8
   10564:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   10568:	ea00000b 	b	1059c <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   1056c:	e51b3008 	ldr	r3, [fp, #-8]
   10570:	e5d33000 	ldrb	r3, [r3]
   10574:	e353000a 	cmp	r3, #10
   10578:	1a000001 	bne	10584 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   1057c:	e3a0000d 	mov	r0, #13
   10580:	ebffffb8 	bl	10468 <uart0_send_char>
		}
		uart0_send_char(*s++);
   10584:	e51b3008 	ldr	r3, [fp, #-8]
   10588:	e2832001 	add	r2, r3, #1
   1058c:	e50b2008 	str	r2, [fp, #-8]
   10590:	e5d33000 	ldrb	r3, [r3]
   10594:	e1a00003 	mov	r0, r3
   10598:	ebffffb2 	bl	10468 <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   1059c:	e51b3008 	ldr	r3, [fp, #-8]
   105a0:	e5d33000 	ldrb	r3, [r3]
   105a4:	e3530000 	cmp	r3, #0
   105a8:	1affffef 	bne	1056c <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   105ac:	e24bd004 	sub	sp, fp, #4
   105b0:	e8bd8800 	pop	{fp, pc}

000105b4 <mailbox_send_message>:
   105b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   105b8:	e28db000 	add	fp, sp, #0
   105bc:	e24dd01c 	sub	sp, sp, #28
   105c0:	e1a03000 	mov	r3, r0
   105c4:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
   105c8:	e320f000 	nop	{0}
   105cc:	e30b3898 	movw	r3, #47256	; 0xb898
   105d0:	e3433f00 	movt	r3, #16128	; 0x3f00
   105d4:	e5933000 	ldr	r3, [r3]
   105d8:	e3530000 	cmp	r3, #0
   105dc:	bafffff9 	blt	105c8 <mailbox_send_message+0x14>
   105e0:	e55b0015 	ldrb	r0, [fp, #-21]	; 0xffffffeb
   105e4:	e3a01000 	mov	r1, #0
   105e8:	e3063010 	movw	r3, #24592	; 0x6010
   105ec:	e3403001 	movt	r3, #1
   105f0:	e1a02003 	mov	r2, r3
   105f4:	e3a03000 	mov	r3, #0
   105f8:	e1822000 	orr	r2, r2, r0
   105fc:	e1833001 	orr	r3, r3, r1
   10600:	e14b20fc 	strd	r2, [fp, #-12]
   10604:	e30b38a0 	movw	r3, #47264	; 0xb8a0
   10608:	e3433f00 	movt	r3, #16128	; 0x3f00
   1060c:	e51b200c 	ldr	r2, [fp, #-12]
   10610:	e5832000 	str	r2, [r3]
   10614:	e320f000 	nop	{0}
   10618:	e30b3898 	movw	r3, #47256	; 0xb898
   1061c:	e3433f00 	movt	r3, #16128	; 0x3f00
   10620:	e5933000 	ldr	r3, [r3]
   10624:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   10628:	e3530000 	cmp	r3, #0
   1062c:	1afffff8 	bne	10614 <mailbox_send_message+0x60>
   10630:	e30b3880 	movw	r3, #47232	; 0xb880
   10634:	e3433f00 	movt	r3, #16128	; 0x3f00
   10638:	e5933000 	ldr	r3, [r3]
   1063c:	e50b3010 	str	r3, [fp, #-16]
   10640:	e51b3010 	ldr	r3, [fp, #-16]
   10644:	e6ef3073 	uxtb	r3, r3
   10648:	e203200f 	and	r2, r3, #15
   1064c:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   10650:	e1520003 	cmp	r2, r3
   10654:	1a00000f 	bne	10698 <mailbox_send_message+0xe4>
   10658:	e51b3010 	ldr	r3, [fp, #-16]
   1065c:	e3c3200f 	bic	r2, r3, #15
   10660:	e3063010 	movw	r3, #24592	; 0x6010
   10664:	e3403001 	movt	r3, #1
   10668:	e1520003 	cmp	r2, r3
   1066c:	1a000009 	bne	10698 <mailbox_send_message+0xe4>
   10670:	e3063010 	movw	r3, #24592	; 0x6010
   10674:	e3403001 	movt	r3, #1
   10678:	e5933004 	ldr	r3, [r3, #4]
   1067c:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   10680:	03a03001 	moveq	r3, #1
   10684:	13a03000 	movne	r3, #0
   10688:	e6ef3073 	uxtb	r3, r3
   1068c:	e6ef2073 	uxtb	r2, r3
   10690:	e3a03000 	mov	r3, #0
   10694:	ea000000 	b	1069c <mailbox_send_message+0xe8>
   10698:	eaffffdd 	b	10614 <mailbox_send_message+0x60>
   1069c:	e1a00002 	mov	r0, r2
   106a0:	e1a01003 	mov	r1, r3
   106a4:	e24bd000 	sub	sp, fp, #0
   106a8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   106ac:	e12fff1e 	bx	lr

000106b0 <dump_tramp_frame>:
//Handles traps
#include "arm.h"
#include "utils.h"
#include "arm_asm_intrinsics.h"

static void dump_tramp_frame(struct trap_frame* tf) {
   106b0:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   106b4:	e28db020 	add	fp, sp, #32
   106b8:	e24dde45 	sub	sp, sp, #1104	; 0x450
   106bc:	e24dd00c 	sub	sp, sp, #12
   106c0:	e50b0428 	str	r0, [fp, #-1064]	; 0xfffffbd8
	char buf[1024];
	sprintf(buf, 1024,
   106c4:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   106c8:	e5933000 	ldr	r3, [r3]
   106cc:	e50b342c 	str	r3, [fp, #-1068]	; 0xfffffbd4
   106d0:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   106d4:	e5931004 	ldr	r1, [r3, #4]
   106d8:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   106dc:	e593e008 	ldr	lr, [r3, #8]
   106e0:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   106e4:	e593400c 	ldr	r4, [r3, #12]
   106e8:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   106ec:	e5936010 	ldr	r6, [r3, #16]
   106f0:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   106f4:	e5932014 	ldr	r2, [r3, #20]
   106f8:	e50b2430 	str	r2, [fp, #-1072]	; 0xfffffbd0
   106fc:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   10700:	e5930018 	ldr	r0, [r3, #24]
   10704:	e50b0434 	str	r0, [fp, #-1076]	; 0xfffffbcc
   10708:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   1070c:	e593c01c 	ldr	ip, [r3, #28]
   10710:	e50bc438 	str	ip, [fp, #-1080]	; 0xfffffbc8
   10714:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   10718:	e5935020 	ldr	r5, [r3, #32]
   1071c:	e50b543c 	str	r5, [fp, #-1084]	; 0xfffffbc4
   10720:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   10724:	e593a024 	ldr	sl, [r3, #36]	; 0x24
   10728:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   1072c:	e5939028 	ldr	r9, [r3, #40]	; 0x28
   10730:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   10734:	e593802c 	ldr	r8, [r3, #44]	; 0x2c
   10738:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   1073c:	e5937030 	ldr	r7, [r3, #48]	; 0x30
   10740:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   10744:	e5935034 	ldr	r5, [r3, #52]	; 0x34
   10748:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   1074c:	e593c038 	ldr	ip, [r3, #56]	; 0x38
   10750:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   10754:	e593203c 	ldr	r2, [r3, #60]	; 0x3c
   10758:	e51b3428 	ldr	r3, [fp, #-1064]	; 0xfffffbd8
   1075c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
   10760:	e24b0e42 	sub	r0, fp, #1056	; 0x420
   10764:	e2400004 	sub	r0, r0, #4
   10768:	e58d1000 	str	r1, [sp]
   1076c:	e58de004 	str	lr, [sp, #4]
   10770:	e58d4008 	str	r4, [sp, #8]
   10774:	e58d600c 	str	r6, [sp, #12]
   10778:	e51b1430 	ldr	r1, [fp, #-1072]	; 0xfffffbd0
   1077c:	e58d1010 	str	r1, [sp, #16]
   10780:	e51b1434 	ldr	r1, [fp, #-1076]	; 0xfffffbcc
   10784:	e58d1014 	str	r1, [sp, #20]
   10788:	e51b1438 	ldr	r1, [fp, #-1080]	; 0xfffffbc8
   1078c:	e58d1018 	str	r1, [sp, #24]
   10790:	e51b143c 	ldr	r1, [fp, #-1084]	; 0xfffffbc4
   10794:	e58d101c 	str	r1, [sp, #28]
   10798:	e58da020 	str	sl, [sp, #32]
   1079c:	e58d9024 	str	r9, [sp, #36]	; 0x24
   107a0:	e58d8028 	str	r8, [sp, #40]	; 0x28
   107a4:	e58d702c 	str	r7, [sp, #44]	; 0x2c
   107a8:	e58d5030 	str	r5, [sp, #48]	; 0x30
   107ac:	e58dc034 	str	ip, [sp, #52]	; 0x34
   107b0:	e58d2038 	str	r2, [sp, #56]	; 0x38
   107b4:	e58d303c 	str	r3, [sp, #60]	; 0x3c
   107b8:	e3a01b01 	mov	r1, #1024	; 0x400
   107bc:	e30124a4 	movw	r2, #5284	; 0x14a4
   107c0:	e3402001 	movt	r2, #1
   107c4:	e51b342c 	ldr	r3, [fp, #-1068]	; 0xfffffbd4
   107c8:	eb0001f5 	bl	10fa4 <sprintf>
	        tf->general_registers[8],
	        tf->general_registers[9],
	        tf->general_registers[10],
	        tf->general_registers[11],
	        tf->general_registers[12]);
	uart0_put_str(buf);
   107cc:	e24b3e42 	sub	r3, fp, #1056	; 0x420
   107d0:	e2433004 	sub	r3, r3, #4
   107d4:	e1a00003 	mov	r0, r3
   107d8:	ebffff5e 	bl	10558 <uart0_put_str>
}
   107dc:	e24bd020 	sub	sp, fp, #32
   107e0:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000107e4 <undefined_instruction_handler>:

void undefined_instruction_handler(struct trap_frame* tf) {
   107e4:	e92d4800 	push	{fp, lr}
   107e8:	e28db004 	add	fp, sp, #4
   107ec:	e24ddb01 	sub	sp, sp, #1024	; 0x400
   107f0:	e24dd008 	sub	sp, sp, #8
   107f4:	e50b0408 	str	r0, [fp, #-1032]	; 0xfffffbf8
	char buf[1024];
	//-4 because return address is after faulting instruction
	panic(sprintf(buf, 1024, "Undefined instruction executed at 0x%x",
	              tf->user_return_address - 4));
   107f8:	e51b3408 	ldr	r3, [fp, #-1032]	; 0xfffffbf8
   107fc:	e593300c 	ldr	r3, [r3, #12]
}

void undefined_instruction_handler(struct trap_frame* tf) {
	char buf[1024];
	//-4 because return address is after faulting instruction
	panic(sprintf(buf, 1024, "Undefined instruction executed at 0x%x",
   10800:	e2433004 	sub	r3, r3, #4
   10804:	e24b2b01 	sub	r2, fp, #1024	; 0x400
   10808:	e2422004 	sub	r2, r2, #4
   1080c:	e1a00002 	mov	r0, r2
   10810:	e3a01b01 	mov	r1, #1024	; 0x400
   10814:	e3012570 	movw	r2, #5488	; 0x1570
   10818:	e3402001 	movt	r2, #1
   1081c:	eb0001e0 	bl	10fa4 <sprintf>
   10820:	e1a03000 	mov	r3, r0
   10824:	e1a00003 	mov	r0, r3
   10828:	eb000296 	bl	11288 <panic>
	              tf->user_return_address - 4));
}
   1082c:	e24bd004 	sub	sp, fp, #4
   10830:	e8bd8800 	pop	{fp, pc}

00010834 <software_interrupt_handler>:

void software_interrupt_handler(struct trap_frame* tf) {
   10834:	e92d4800 	push	{fp, lr}
   10838:	e28db004 	add	fp, sp, #4
   1083c:	e24dd008 	sub	sp, sp, #8
   10840:	e50b0008 	str	r0, [fp, #-8]
	//@todo
	panic("swi handler unimplemented");
   10844:	e3010598 	movw	r0, #5528	; 0x1598
   10848:	e3400001 	movt	r0, #1
   1084c:	eb00028d 	bl	11288 <panic>
}
   10850:	e24bd004 	sub	sp, fp, #4
   10854:	e8bd8800 	pop	{fp, pc}

00010858 <prefetch_abort_handler>:

void prefetch_abort_handler(struct trap_frame* tf) {
   10858:	e92d4800 	push	{fp, lr}
   1085c:	e28db004 	add	fp, sp, #4
   10860:	e24ddb01 	sub	sp, sp, #1024	; 0x400
   10864:	e24dd008 	sub	sp, sp, #8
   10868:	e50b0408 	str	r0, [fp, #-1032]	; 0xfffffbf8
	char buf[1024];
	panic(sprintf(buf, 1024, "Prefetch abort at 0x%x",
	              tf->user_return_address - 4));
   1086c:	e51b3408 	ldr	r3, [fp, #-1032]	; 0xfffffbf8
   10870:	e593300c 	ldr	r3, [r3, #12]
	panic("swi handler unimplemented");
}

void prefetch_abort_handler(struct trap_frame* tf) {
	char buf[1024];
	panic(sprintf(buf, 1024, "Prefetch abort at 0x%x",
   10874:	e2433004 	sub	r3, r3, #4
   10878:	e24b2b01 	sub	r2, fp, #1024	; 0x400
   1087c:	e2422004 	sub	r2, r2, #4
   10880:	e1a00002 	mov	r0, r2
   10884:	e3a01b01 	mov	r1, #1024	; 0x400
   10888:	e30125b4 	movw	r2, #5556	; 0x15b4
   1088c:	e3402001 	movt	r2, #1
   10890:	eb0001c3 	bl	10fa4 <sprintf>
   10894:	e1a03000 	mov	r3, r0
   10898:	e1a00003 	mov	r0, r3
   1089c:	eb000279 	bl	11288 <panic>
	              tf->user_return_address - 4));
}
   108a0:	e24bd004 	sub	sp, fp, #4
   108a4:	e8bd8800 	pop	{fp, pc}

000108a8 <data_abort_handler>:

void data_abort_handler(struct trap_frame* tf) {
   108a8:	e92d4800 	push	{fp, lr}
   108ac:	e28db004 	add	fp, sp, #4
   108b0:	e24dde41 	sub	sp, sp, #1040	; 0x410
   108b4:	e24dd008 	sub	sp, sp, #8
   108b8:	e50b0410 	str	r0, [fp, #-1040]	; 0xfffffbf0
	char buf[1024];
	uint faulting_addr = get_data_fault_addr();
   108bc:	eb0002ea 	bl	1146c <get_data_fault_addr>
   108c0:	e50b0008 	str	r0, [fp, #-8]
	//uint fault_info = get_data_fault_status(); @todo use this to print a better error message
	panic(sprintf(buf, 1024,
   108c4:	e51b3410 	ldr	r3, [fp, #-1040]	; 0xfffffbf0
   108c8:	e593200c 	ldr	r2, [r3, #12]
   108cc:	e24b3b01 	sub	r3, fp, #1024	; 0x400
   108d0:	e2433004 	sub	r3, r3, #4
   108d4:	e2433004 	sub	r3, r3, #4
   108d8:	e58d2000 	str	r2, [sp]
   108dc:	e1a00003 	mov	r0, r3
   108e0:	e3a01b01 	mov	r1, #1024	; 0x400
   108e4:	e30125cc 	movw	r2, #5580	; 0x15cc
   108e8:	e3402001 	movt	r2, #1
   108ec:	e51b3008 	ldr	r3, [fp, #-8]
   108f0:	eb0001ab 	bl	10fa4 <sprintf>
   108f4:	e1a03000 	mov	r3, r0
   108f8:	e1a00003 	mov	r0, r3
   108fc:	eb000261 	bl	11288 <panic>
	              "Page fault at address 0x%x"
	              " executing instruction at 0x%x",
	              faulting_addr,
	              tf->user_return_address));
}
   10900:	e24bd004 	sub	sp, fp, #4
   10904:	e8bd8800 	pop	{fp, pc}

00010908 <unused_exception_handler>:

void unused_exception_handler(struct trap_frame* tf) {
   10908:	e92d4800 	push	{fp, lr}
   1090c:	e28db004 	add	fp, sp, #4
   10910:	e24dd008 	sub	sp, sp, #8
   10914:	e50b0008 	str	r0, [fp, #-8]
	dump_tramp_frame(tf);
   10918:	e51b0008 	ldr	r0, [fp, #-8]
   1091c:	ebffff63 	bl	106b0 <dump_tramp_frame>
	panic("ARM reserved interrupt vector called.\n"
   10920:	e3010608 	movw	r0, #5640	; 0x1608
   10924:	e3400001 	movt	r0, #1
   10928:	eb000256 	bl	11288 <panic>
	      "This should never happen, might be a hardware error.");
}
   1092c:	e24bd004 	sub	sp, fp, #4
   10930:	e8bd8800 	pop	{fp, pc}

00010934 <irq_handler>:

void irq_handler(struct trap_frame* tf) {
   10934:	e92d4800 	push	{fp, lr}
   10938:	e28db004 	add	fp, sp, #4
   1093c:	e24dd008 	sub	sp, sp, #8
   10940:	e50b0008 	str	r0, [fp, #-8]
	//@todo
	panic("irq handler unimplemented");
   10944:	e3010664 	movw	r0, #5732	; 0x1664
   10948:	e3400001 	movt	r0, #1
   1094c:	eb00024d 	bl	11288 <panic>
}
   10950:	e24bd004 	sub	sp, fp, #4
   10954:	e8bd8800 	pop	{fp, pc}

00010958 <fiq_handler>:

void fiq_handler(struct trap_frame* tf) {
   10958:	e92d4800 	push	{fp, lr}
   1095c:	e28db004 	add	fp, sp, #4
   10960:	e24dd008 	sub	sp, sp, #8
   10964:	e50b0008 	str	r0, [fp, #-8]
	dump_tramp_frame(tf);
   10968:	e51b0008 	ldr	r0, [fp, #-8]
   1096c:	ebffff4f 	bl	106b0 <dump_tramp_frame>
	panic("FIQ handler called.\n"
   10970:	e3010680 	movw	r0, #5760	; 0x1680
   10974:	e3400001 	movt	r0, #1
   10978:	eb000242 	bl	11288 <panic>
	      "This should never happen because we don't enable FIQ interrupts.\n");
}
   1097c:	e24bd004 	sub	sp, fp, #4
   10980:	e8bd8800 	pop	{fp, pc}

00010984 <timer_init>:
// Enable IRQ interrupts from CNTPS (timer 0)
#define CNTPS_IRQ 0x01

void cprintf(char *fmt, ...);

void timer_init() {
   10984:	e92d4800 	push	{fp, lr}
   10988:	e28db004 	add	fp, sp, #4
   1098c:	e24ddf46 	sub	sp, sp, #280	; 0x118
  char buf[256];
  char* test_string;
  uint lowword;
  uint highword;

  asm ("mrrc p15, 0, %0, %1, c14"
   10990:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10994:	e50b2008 	str	r2, [fp, #-8]
   10998:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d %d\n", highword, lowword);
   1099c:	e24b2e11 	sub	r2, fp, #272	; 0x110
   109a0:	e51b3008 	ldr	r3, [fp, #-8]
   109a4:	e58d3000 	str	r3, [sp]
   109a8:	e1a00002 	mov	r0, r2
   109ac:	e3a01c01 	mov	r1, #256	; 0x100
   109b0:	e30126d8 	movw	r2, #5848	; 0x16d8
   109b4:	e3402001 	movt	r2, #1
   109b8:	e51b300c 	ldr	r3, [fp, #-12]
   109bc:	eb000178 	bl	10fa4 <sprintf>
   109c0:	e1a03000 	mov	r3, r0
   109c4:	e50b3010 	str	r3, [fp, #-16]
 	uart0_put_str(test_string);
   109c8:	e51b0010 	ldr	r0, [fp, #-16]
   109cc:	ebfffee1 	bl	10558 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   109d0:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   109d4:	e50b2008 	str	r2, [fp, #-8]
   109d8:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d %d\n", highword, lowword);
   109dc:	e24b2e11 	sub	r2, fp, #272	; 0x110
   109e0:	e51b3008 	ldr	r3, [fp, #-8]
   109e4:	e58d3000 	str	r3, [sp]
   109e8:	e1a00002 	mov	r0, r2
   109ec:	e3a01c01 	mov	r1, #256	; 0x100
   109f0:	e30126d8 	movw	r2, #5848	; 0x16d8
   109f4:	e3402001 	movt	r2, #1
   109f8:	e51b300c 	ldr	r3, [fp, #-12]
   109fc:	eb000168 	bl	10fa4 <sprintf>
   10a00:	e1a03000 	mov	r3, r0
   10a04:	e50b3010 	str	r3, [fp, #-16]
 	uart0_put_str(test_string);
   10a08:	e51b0010 	ldr	r0, [fp, #-16]
   10a0c:	ebfffed1 	bl	10558 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10a10:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10a14:	e50b2008 	str	r2, [fp, #-8]
   10a18:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d %d\n", highword, lowword);
   10a1c:	e24b2e11 	sub	r2, fp, #272	; 0x110
   10a20:	e51b3008 	ldr	r3, [fp, #-8]
   10a24:	e58d3000 	str	r3, [sp]
   10a28:	e1a00002 	mov	r0, r2
   10a2c:	e3a01c01 	mov	r1, #256	; 0x100
   10a30:	e30126d8 	movw	r2, #5848	; 0x16d8
   10a34:	e3402001 	movt	r2, #1
   10a38:	e51b300c 	ldr	r3, [fp, #-12]
   10a3c:	eb000158 	bl	10fa4 <sprintf>
   10a40:	e1a03000 	mov	r3, r0
   10a44:	e50b3010 	str	r3, [fp, #-16]
 	uart0_put_str(test_string);
   10a48:	e51b0010 	ldr	r0, [fp, #-16]
   10a4c:	ebfffec1 	bl	10558 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10a50:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10a54:	e50b2008 	str	r2, [fp, #-8]
   10a58:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d %d\n", highword, lowword);
   10a5c:	e24b2e11 	sub	r2, fp, #272	; 0x110
   10a60:	e51b3008 	ldr	r3, [fp, #-8]
   10a64:	e58d3000 	str	r3, [sp]
   10a68:	e1a00002 	mov	r0, r2
   10a6c:	e3a01c01 	mov	r1, #256	; 0x100
   10a70:	e30126d8 	movw	r2, #5848	; 0x16d8
   10a74:	e3402001 	movt	r2, #1
   10a78:	e51b300c 	ldr	r3, [fp, #-12]
   10a7c:	eb000148 	bl	10fa4 <sprintf>
   10a80:	e1a03000 	mov	r3, r0
   10a84:	e50b3010 	str	r3, [fp, #-16]
 	uart0_put_str(test_string);
   10a88:	e51b0010 	ldr	r0, [fp, #-16]
   10a8c:	ebfffeb1 	bl	10558 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10a90:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10a94:	e50b2008 	str	r2, [fp, #-8]
   10a98:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d %d\n", highword, lowword);
   10a9c:	e24b2e11 	sub	r2, fp, #272	; 0x110
   10aa0:	e51b3008 	ldr	r3, [fp, #-8]
   10aa4:	e58d3000 	str	r3, [sp]
   10aa8:	e1a00002 	mov	r0, r2
   10aac:	e3a01c01 	mov	r1, #256	; 0x100
   10ab0:	e30126d8 	movw	r2, #5848	; 0x16d8
   10ab4:	e3402001 	movt	r2, #1
   10ab8:	e51b300c 	ldr	r3, [fp, #-12]
   10abc:	eb000138 	bl	10fa4 <sprintf>
   10ac0:	e1a03000 	mov	r3, r0
   10ac4:	e50b3010 	str	r3, [fp, #-16]
 	uart0_put_str(test_string);
   10ac8:	e51b0010 	ldr	r0, [fp, #-16]
   10acc:	ebfffea1 	bl	10558 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10ad0:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10ad4:	e50b2008 	str	r2, [fp, #-8]
   10ad8:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d %d\n", highword, lowword);
   10adc:	e24b2e11 	sub	r2, fp, #272	; 0x110
   10ae0:	e51b3008 	ldr	r3, [fp, #-8]
   10ae4:	e58d3000 	str	r3, [sp]
   10ae8:	e1a00002 	mov	r0, r2
   10aec:	e3a01c01 	mov	r1, #256	; 0x100
   10af0:	e30126d8 	movw	r2, #5848	; 0x16d8
   10af4:	e3402001 	movt	r2, #1
   10af8:	e51b300c 	ldr	r3, [fp, #-12]
   10afc:	eb000128 	bl	10fa4 <sprintf>
   10b00:	e1a03000 	mov	r3, r0
   10b04:	e50b3010 	str	r3, [fp, #-16]
 	uart0_put_str(test_string);
   10b08:	e51b0010 	ldr	r0, [fp, #-16]
   10b0c:	ebfffe91 	bl	10558 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10b10:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10b14:	e50b2008 	str	r2, [fp, #-8]
   10b18:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d %d\n", highword, lowword);
   10b1c:	e24b2e11 	sub	r2, fp, #272	; 0x110
   10b20:	e51b3008 	ldr	r3, [fp, #-8]
   10b24:	e58d3000 	str	r3, [sp]
   10b28:	e1a00002 	mov	r0, r2
   10b2c:	e3a01c01 	mov	r1, #256	; 0x100
   10b30:	e30126d8 	movw	r2, #5848	; 0x16d8
   10b34:	e3402001 	movt	r2, #1
   10b38:	e51b300c 	ldr	r3, [fp, #-12]
   10b3c:	eb000118 	bl	10fa4 <sprintf>
   10b40:	e1a03000 	mov	r3, r0
   10b44:	e50b3010 	str	r3, [fp, #-16]
 	uart0_put_str(test_string);
   10b48:	e51b0010 	ldr	r0, [fp, #-16]
   10b4c:	ebfffe81 	bl	10558 <uart0_put_str>

  mmio_write(CORE0_TIMER_IRQCNTL, CNTPS_IRQ);
   10b50:	e3a00040 	mov	r0, #64	; 0x40
   10b54:	e3440000 	movt	r0, #16384	; 0x4000
   10b58:	e3a01001 	mov	r1, #1
   10b5c:	ebfffde3 	bl	102f0 <mmio_write>
}
   10b60:	e24bd004 	sub	sp, fp, #4
   10b64:	e8bd8800 	pop	{fp, pc}

00010b68 <memcpy>:
//Useful memory functions like memcpy
#include "utils.h"

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint size) {
   10b68:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10b6c:	e28db000 	add	fp, sp, #0
   10b70:	e24dd024 	sub	sp, sp, #36	; 0x24
   10b74:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10b78:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10b7c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10b80:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10b84:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   10b88:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10b8c:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   10b90:	e51b200c 	ldr	r2, [fp, #-12]
   10b94:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10b98:	e0823003 	add	r3, r2, r3
   10b9c:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10ba0:	ea000007 	b	10bc4 <memcpy+0x5c>
		*dest++ = *src++;
   10ba4:	e51b3008 	ldr	r3, [fp, #-8]
   10ba8:	e2832001 	add	r2, r3, #1
   10bac:	e50b2008 	str	r2, [fp, #-8]
   10bb0:	e51b200c 	ldr	r2, [fp, #-12]
   10bb4:	e2821001 	add	r1, r2, #1
   10bb8:	e50b100c 	str	r1, [fp, #-12]
   10bbc:	e5d22000 	ldrb	r2, [r2]
   10bc0:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   10bc4:	e51b200c 	ldr	r2, [fp, #-12]
   10bc8:	e51b3010 	ldr	r3, [fp, #-16]
   10bcc:	e1520003 	cmp	r2, r3
   10bd0:	1afffff3 	bne	10ba4 <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   10bd4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10bd8:	e1a00003 	mov	r0, r3
   10bdc:	e24bd000 	sub	sp, fp, #0
   10be0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10be4:	e12fff1e 	bx	lr

00010be8 <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, const void* source, uint size) {
   10be8:	e92d4800 	push	{fp, lr}
   10bec:	e28db004 	add	fp, sp, #4
   10bf0:	e24dd020 	sub	sp, sp, #32
   10bf4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10bf8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10bfc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   10c00:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10c04:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10c08:	e1520003 	cmp	r2, r3
   10c0c:	1a000001 	bne	10c18 <memmove+0x30>
		return destination;
   10c10:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10c14:	ea000024 	b	10cac <memmove+0xc4>
	}
	if (destination < source) {
   10c18:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   10c1c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10c20:	e1520003 	cmp	r2, r3
   10c24:	2a000005 	bcs	10c40 <memmove+0x58>
		return memcpy(destination, source, size);
   10c28:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
   10c2c:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   10c30:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10c34:	ebffffcb 	bl	10b68 <memcpy>
   10c38:	e1a03000 	mov	r3, r0
   10c3c:	ea00001a 	b	10cac <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   10c40:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10c44:	e2433001 	sub	r3, r3, #1
   10c48:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   10c4c:	e0823003 	add	r3, r2, r3
   10c50:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   10c54:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10c58:	e2433001 	sub	r3, r3, #1
   10c5c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10c60:	e0823003 	add	r3, r2, r3
   10c64:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   10c68:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10c6c:	e2433001 	sub	r3, r3, #1
   10c70:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10c74:	ea000007 	b	10c98 <memmove+0xb0>
		*dest-- = *src--;
   10c78:	e51b3008 	ldr	r3, [fp, #-8]
   10c7c:	e2432001 	sub	r2, r3, #1
   10c80:	e50b2008 	str	r2, [fp, #-8]
   10c84:	e51b200c 	ldr	r2, [fp, #-12]
   10c88:	e2421001 	sub	r1, r2, #1
   10c8c:	e50b100c 	str	r1, [fp, #-12]
   10c90:	e5d22000 	ldrb	r2, [r2]
   10c94:	e5c32000 	strb	r2, [r3]
		return memcpy(destination, source, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   10c98:	e51b200c 	ldr	r2, [fp, #-12]
   10c9c:	e51b3010 	ldr	r3, [fp, #-16]
   10ca0:	e1520003 	cmp	r2, r3
   10ca4:	1afffff3 	bne	10c78 <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   10ca8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10cac:	e1a00003 	mov	r0, r3
   10cb0:	e24bd004 	sub	sp, fp, #4
   10cb4:	e8bd8800 	pop	{fp, pc}

00010cb8 <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
   10cb8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10cbc:	e28db000 	add	fp, sp, #0
   10cc0:	e24dd024 	sub	sp, sp, #36	; 0x24
   10cc4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10cc8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10ccc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10cd0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10cd4:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   10cd8:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10cdc:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   10ce0:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10ce4:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10ce8:	ea000007 	b	10d0c <memcpy_region+0x54>
		*dest++ = *src++;
   10cec:	e51b3008 	ldr	r3, [fp, #-8]
   10cf0:	e2832001 	add	r2, r3, #1
   10cf4:	e50b2008 	str	r2, [fp, #-8]
   10cf8:	e51b200c 	ldr	r2, [fp, #-12]
   10cfc:	e2821001 	add	r1, r2, #1
   10d00:	e50b100c 	str	r1, [fp, #-12]
   10d04:	e5d22000 	ldrb	r2, [r2]
   10d08:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   10d0c:	e51b200c 	ldr	r2, [fp, #-12]
   10d10:	e51b3010 	ldr	r3, [fp, #-16]
   10d14:	e1520003 	cmp	r2, r3
   10d18:	1afffff3 	bne	10cec <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   10d1c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10d20:	e1a00003 	mov	r0, r3
   10d24:	e24bd000 	sub	sp, fp, #0
   10d28:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10d2c:	e12fff1e 	bx	lr

00010d30 <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* destination, const void* source_start, const void* source_end) {
   10d30:	e92d4800 	push	{fp, lr}
   10d34:	e28db004 	add	fp, sp, #4
   10d38:	e24dd010 	sub	sp, sp, #16
   10d3c:	e50b0008 	str	r0, [fp, #-8]
   10d40:	e50b100c 	str	r1, [fp, #-12]
   10d44:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   10d48:	e51b2010 	ldr	r2, [fp, #-16]
   10d4c:	e51b300c 	ldr	r3, [fp, #-12]
   10d50:	e0633002 	rsb	r3, r3, r2
   10d54:	e51b0008 	ldr	r0, [fp, #-8]
   10d58:	e51b100c 	ldr	r1, [fp, #-12]
   10d5c:	e1a02003 	mov	r2, r3
   10d60:	ebffffa0 	bl	10be8 <memmove>
   10d64:	e1a03000 	mov	r3, r0
}
   10d68:	e1a00003 	mov	r0, r3
   10d6c:	e24bd004 	sub	sp, fp, #4
   10d70:	e8bd8800 	pop	{fp, pc}

00010d74 <strcpy>:

//Copy null terminated source into destination which is at least dest_size in length
//dest_size includes the space for the null terminator
char* strcpy(char* destination, const char* source, uint dest_size) {
   10d74:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10d78:	e28db000 	add	fp, sp, #0
   10d7c:	e24dd01c 	sub	sp, sp, #28
   10d80:	e50b0010 	str	r0, [fp, #-16]
   10d84:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10d88:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
	if (dest_size < 1) {
   10d8c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10d90:	e3530000 	cmp	r3, #0
   10d94:	1a000001 	bne	10da0 <strcpy+0x2c>
		return nullptr;
   10d98:	e3a03000 	mov	r3, #0
   10d9c:	ea000019 	b	10e08 <strcpy+0x94>
	}
	char* dest_end = destination + dest_size - 1;
   10da0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10da4:	e2433001 	sub	r3, r3, #1
   10da8:	e51b2010 	ldr	r2, [fp, #-16]
   10dac:	e0823003 	add	r3, r2, r3
   10db0:	e50b3008 	str	r3, [fp, #-8]
	while (*source
   10db4:	ea000007 	b	10dd8 <strcpy+0x64>
	       && destination != dest_end) {
		*destination++ = *source++;
   10db8:	e51b3010 	ldr	r3, [fp, #-16]
   10dbc:	e2832001 	add	r2, r3, #1
   10dc0:	e50b2010 	str	r2, [fp, #-16]
   10dc4:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   10dc8:	e2821001 	add	r1, r2, #1
   10dcc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10dd0:	e5d22000 	ldrb	r2, [r2]
   10dd4:	e5c32000 	strb	r2, [r3]
char* strcpy(char* destination, const char* source, uint dest_size) {
	if (dest_size < 1) {
		return nullptr;
	}
	char* dest_end = destination + dest_size - 1;
	while (*source
   10dd8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10ddc:	e5d33000 	ldrb	r3, [r3]
   10de0:	e3530000 	cmp	r3, #0
   10de4:	0a000003 	beq	10df8 <strcpy+0x84>
	       && destination != dest_end) {
   10de8:	e51b2010 	ldr	r2, [fp, #-16]
   10dec:	e51b3008 	ldr	r3, [fp, #-8]
   10df0:	e1520003 	cmp	r2, r3
   10df4:	1affffef 	bne	10db8 <strcpy+0x44>
		*destination++ = *source++;
	}
	*destination = 0;
   10df8:	e51b3010 	ldr	r3, [fp, #-16]
   10dfc:	e3a02000 	mov	r2, #0
   10e00:	e5c32000 	strb	r2, [r3]
	return destination;
   10e04:	e51b3010 	ldr	r3, [fp, #-16]
}
   10e08:	e1a00003 	mov	r0, r3
   10e0c:	e24bd000 	sub	sp, fp, #0
   10e10:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10e14:	e12fff1e 	bx	lr

00010e18 <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   10e18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10e1c:	e28db000 	add	fp, sp, #0
   10e20:	e24dd014 	sub	sp, sp, #20
   10e24:	e50b0010 	str	r0, [fp, #-16]
   10e28:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   10e2c:	e51b3010 	ldr	r3, [fp, #-16]
   10e30:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   10e34:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10e38:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   10e3c:	ea000004 	b	10e54 <zero_region+0x3c>
		*start++ = 0;
   10e40:	e51b3008 	ldr	r3, [fp, #-8]
   10e44:	e2832001 	add	r2, r3, #1
   10e48:	e50b2008 	str	r2, [fp, #-8]
   10e4c:	e3a02000 	mov	r2, #0
   10e50:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   10e54:	e51b2008 	ldr	r2, [fp, #-8]
   10e58:	e51b300c 	ldr	r3, [fp, #-12]
   10e5c:	e1520003 	cmp	r2, r3
   10e60:	1afffff6 	bne	10e40 <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   10e64:	e51b3010 	ldr	r3, [fp, #-16]
}
   10e68:	e1a00003 	mov	r0, r3
   10e6c:	e24bd000 	sub	sp, fp, #0
   10e70:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10e74:	e12fff1e 	bx	lr

00010e78 <write_uint>:

//sprintf helper for writing unsigned ints
//returns false if buf is full
static char* write_uint(char* buf, char* buf_end, uint base, uint num) {
   10e78:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10e7c:	e28db000 	add	fp, sp, #0
   10e80:	e24dd02c 	sub	sp, sp, #44	; 0x2c
   10e84:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
   10e88:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
   10e8c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e90:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
   10e94:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10e98:	e3530000 	cmp	r3, #0
   10e9c:	0a000022 	beq	10f2c <write_uint+0xb4>
		uint idigit = 11;
   10ea0:	e3a0300b 	mov	r3, #11
   10ea4:	e50b300c 	str	r3, [fp, #-12]
		while (num) {
   10ea8:	ea000017 	b	10f0c <write_uint+0x94>
			uint digit = num % base;
   10eac:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10eb0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10eb4:	e732f213 	udiv	r2, r3, r2
   10eb8:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
   10ebc:	e0020291 	mul	r2, r1, r2
   10ec0:	e0623003 	rsb	r3, r2, r3
   10ec4:	e50b3010 	str	r3, [fp, #-16]
			idigit--;
   10ec8:	e51b300c 	ldr	r3, [fp, #-12]
   10ecc:	e2433001 	sub	r3, r3, #1
   10ed0:	e50b300c 	str	r3, [fp, #-12]
			num_buffer[idigit] = digits[digit];
   10ed4:	e30136e0 	movw	r3, #5856	; 0x16e0
   10ed8:	e3403001 	movt	r3, #1
   10edc:	e51b2010 	ldr	r2, [fp, #-16]
   10ee0:	e0833002 	add	r3, r3, r2
   10ee4:	e5d31000 	ldrb	r1, [r3]
   10ee8:	e24b201c 	sub	r2, fp, #28
   10eec:	e51b300c 	ldr	r3, [fp, #-12]
   10ef0:	e0823003 	add	r3, r2, r3
   10ef4:	e1a02001 	mov	r2, r1
   10ef8:	e5c32000 	strb	r2, [r3]
			num /= base;
   10efc:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
   10f00:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10f04:	e733f312 	udiv	r3, r2, r3
   10f08:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
		uint idigit = 11;
		while (num) {
   10f0c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10f10:	e3530000 	cmp	r3, #0
   10f14:	1affffe4 	bne	10eac <write_uint+0x34>
			uint digit = num % base;
			idigit--;
			num_buffer[idigit] = digits[digit];
			num /= base;
		}
		first_digit = &num_buffer[idigit];
   10f18:	e24b201c 	sub	r2, fp, #28
   10f1c:	e51b300c 	ldr	r3, [fp, #-12]
   10f20:	e0823003 	add	r3, r2, r3
   10f24:	e50b3008 	str	r3, [fp, #-8]
   10f28:	ea000004 	b	10f40 <write_uint+0xc8>
	} else {
		num_buffer[10] = '0';
   10f2c:	e3a03030 	mov	r3, #48	; 0x30
   10f30:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
		first_digit = &num_buffer[10];
   10f34:	e24b301c 	sub	r3, fp, #28
   10f38:	e283300a 	add	r3, r3, #10
   10f3c:	e50b3008 	str	r3, [fp, #-8]
	}
	while (first_digit != &num_buffer[11]) {
   10f40:	ea00000d 	b	10f7c <write_uint+0x104>
		*buf++ = *first_digit++;
   10f44:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10f48:	e2832001 	add	r2, r3, #1
   10f4c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
   10f50:	e51b2008 	ldr	r2, [fp, #-8]
   10f54:	e2821001 	add	r1, r2, #1
   10f58:	e50b1008 	str	r1, [fp, #-8]
   10f5c:	e5d22000 	ldrb	r2, [r2]
   10f60:	e5c32000 	strb	r2, [r3]
		if (buf == buf_end) {
   10f64:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10f68:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
   10f6c:	e1520003 	cmp	r2, r3
   10f70:	1a000001 	bne	10f7c <write_uint+0x104>
			return buf;
   10f74:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10f78:	ea000005 	b	10f94 <write_uint+0x11c>
		first_digit = &num_buffer[idigit];
	} else {
		num_buffer[10] = '0';
		first_digit = &num_buffer[10];
	}
	while (first_digit != &num_buffer[11]) {
   10f7c:	e24b301c 	sub	r3, fp, #28
   10f80:	e283300b 	add	r3, r3, #11
   10f84:	e51b2008 	ldr	r2, [fp, #-8]
   10f88:	e1520003 	cmp	r2, r3
   10f8c:	1affffec 	bne	10f44 <write_uint+0xcc>
		*buf++ = *first_digit++;
		if (buf == buf_end) {
			return buf;
		}
	}
	return buf;
   10f90:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
   10f94:	e1a00003 	mov	r0, r3
   10f98:	e24bd000 	sub	sp, fp, #0
   10f9c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10fa0:	e12fff1e 	bx	lr

00010fa4 <sprintf>:

//C standard library function sprintf with buffer size specified
char* sprintf(char* buf, uint buf_size, const char* fmt, ...) {
   10fa4:	e92d000c 	push	{r2, r3}
   10fa8:	e92d4800 	push	{fp, lr}
   10fac:	e28db004 	add	fp, sp, #4
   10fb0:	e24dd028 	sub	sp, sp, #40	; 0x28
   10fb4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
   10fb8:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
	if (buf_size < 1) {
   10fbc:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10fc0:	e3530000 	cmp	r3, #0
   10fc4:	1a000001 	bne	10fd0 <sprintf+0x2c>
		return nullptr; //Need at least space for null terminator
   10fc8:	e3a03000 	mov	r3, #0
   10fcc:	ea0000a8 	b	11274 <sprintf+0x2d0>
	}
	char* buf_start = buf;
   10fd0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10fd4:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
   10fd8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10fdc:	e2433001 	sub	r3, r3, #1
   10fe0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10fe4:	e0823003 	add	r3, r2, r3
   10fe8:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
	uint* var_args = (uint*)&fmt + 1;
   10fec:	e28b3008 	add	r3, fp, #8
   10ff0:	e50b3008 	str	r3, [fp, #-8]

	while (buf != buf_end
   10ff4:	ea000092 	b	11244 <sprintf+0x2a0>
	       && *fmt) {
		if (*fmt != '%') {
   10ff8:	e59b3004 	ldr	r3, [fp, #4]
   10ffc:	e5d33000 	ldrb	r3, [r3]
   11000:	e3530025 	cmp	r3, #37	; 0x25
   11004:	0a000008 	beq	1102c <sprintf+0x88>
			*buf++ = *fmt++;
   11008:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   1100c:	e2832001 	add	r2, r3, #1
   11010:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   11014:	e59b2004 	ldr	r2, [fp, #4]
   11018:	e2821001 	add	r1, r2, #1
   1101c:	e58b1004 	str	r1, [fp, #4]
   11020:	e5d22000 	ldrb	r2, [r2]
   11024:	e5c32000 	strb	r2, [r3]
   11028:	ea000085 	b	11244 <sprintf+0x2a0>
		} else {
			fmt++;
   1102c:	e59b3004 	ldr	r3, [fp, #4]
   11030:	e2833001 	add	r3, r3, #1
   11034:	e58b3004 	str	r3, [fp, #4]
			switch (*fmt) {
   11038:	e59b3004 	ldr	r3, [fp, #4]
   1103c:	e5d33000 	ldrb	r3, [r3]
   11040:	e3530058 	cmp	r3, #88	; 0x58
   11044:	0a000039 	beq	11130 <sprintf+0x18c>
   11048:	e3530058 	cmp	r3, #88	; 0x58
   1104c:	ca00000b 	bgt	11080 <sprintf+0xdc>
   11050:	e3530044 	cmp	r3, #68	; 0x44
   11054:	0a000017 	beq	110b8 <sprintf+0x114>
   11058:	e3530044 	cmp	r3, #68	; 0x44
   1105c:	ca000002 	bgt	1106c <sprintf+0xc8>
   11060:	e3530000 	cmp	r3, #0
   11064:	0a000011 	beq	110b0 <sprintf+0x10c>
   11068:	ea000060 	b	111f0 <sprintf+0x24c>
   1106c:	e3530053 	cmp	r3, #83	; 0x53
   11070:	0a000046 	beq	11190 <sprintf+0x1ec>
   11074:	e3530055 	cmp	r3, #85	; 0x55
   11078:	0a000038 	beq	11160 <sprintf+0x1bc>
   1107c:	ea00005b 	b	111f0 <sprintf+0x24c>
   11080:	e3530073 	cmp	r3, #115	; 0x73
   11084:	0a000041 	beq	11190 <sprintf+0x1ec>
   11088:	e3530073 	cmp	r3, #115	; 0x73
   1108c:	ca000002 	bgt	1109c <sprintf+0xf8>
   11090:	e3530064 	cmp	r3, #100	; 0x64
   11094:	0a000007 	beq	110b8 <sprintf+0x114>
   11098:	ea000054 	b	111f0 <sprintf+0x24c>
   1109c:	e3530075 	cmp	r3, #117	; 0x75
   110a0:	0a00002e 	beq	11160 <sprintf+0x1bc>
   110a4:	e3530078 	cmp	r3, #120	; 0x78
   110a8:	0a000020 	beq	11130 <sprintf+0x18c>
   110ac:	ea00004f 	b	111f0 <sprintf+0x24c>
			case 0:
				return buf_start;
   110b0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   110b4:	ea00006e 	b	11274 <sprintf+0x2d0>
			case 'd':
			case 'D':
				{
					int num = *(int*)var_args;
   110b8:	e51b3008 	ldr	r3, [fp, #-8]
   110bc:	e5933000 	ldr	r3, [r3]
   110c0:	e50b300c 	str	r3, [fp, #-12]
					var_args++;
   110c4:	e51b3008 	ldr	r3, [fp, #-8]
   110c8:	e2833004 	add	r3, r3, #4
   110cc:	e50b3008 	str	r3, [fp, #-8]
					if (num < 0) {
   110d0:	e51b300c 	ldr	r3, [fp, #-12]
   110d4:	e3530000 	cmp	r3, #0
   110d8:	aa00000d 	bge	11114 <sprintf+0x170>
						*buf++ = '-';
   110dc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   110e0:	e2832001 	add	r2, r3, #1
   110e4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   110e8:	e3a0202d 	mov	r2, #45	; 0x2d
   110ec:	e5c32000 	strb	r2, [r3]
						if (buf == buf_end) {
   110f0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   110f4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   110f8:	e1520003 	cmp	r2, r3
   110fc:	1a000001 	bne	11108 <sprintf+0x164>
							return buf_start;
   11100:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11104:	ea00005a 	b	11274 <sprintf+0x2d0>
						}
						num = -num;
   11108:	e51b300c 	ldr	r3, [fp, #-12]
   1110c:	e2633000 	rsb	r3, r3, #0
   11110:	e50b300c 	str	r3, [fp, #-12]
					}
					buf = write_uint(buf, buf_end, 10, (uint)num);
   11114:	e51b300c 	ldr	r3, [fp, #-12]
   11118:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   1111c:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   11120:	e3a0200a 	mov	r2, #10
   11124:	ebffff53 	bl	10e78 <write_uint>
   11128:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   1112c:	ea000041 	b	11238 <sprintf+0x294>
				}
			case 'x':
			case 'X':
				{
					uint num = *var_args++;
   11130:	e51b3008 	ldr	r3, [fp, #-8]
   11134:	e2832004 	add	r2, r3, #4
   11138:	e50b2008 	str	r2, [fp, #-8]
   1113c:	e5933000 	ldr	r3, [r3]
   11140:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
					buf = write_uint(buf, buf_end, 16, num);
   11144:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   11148:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   1114c:	e3a02010 	mov	r2, #16
   11150:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   11154:	ebffff47 	bl	10e78 <write_uint>
   11158:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   1115c:	ea000035 	b	11238 <sprintf+0x294>
				}
			case 'u':
			case 'U':
				{
					uint num = *var_args++;
   11160:	e51b3008 	ldr	r3, [fp, #-8]
   11164:	e2832004 	add	r2, r3, #4
   11168:	e50b2008 	str	r2, [fp, #-8]
   1116c:	e5933000 	ldr	r3, [r3]
   11170:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
					buf = write_uint(buf, buf_end, 10, num);
   11174:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   11178:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   1117c:	e3a0200a 	mov	r2, #10
   11180:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   11184:	ebffff3b 	bl	10e78 <write_uint>
   11188:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   1118c:	ea000029 	b	11238 <sprintf+0x294>
				}
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
   11190:	e51b3008 	ldr	r3, [fp, #-8]
   11194:	e5933000 	ldr	r3, [r3]
   11198:	e50b3010 	str	r3, [fp, #-16]
					var_args++;
   1119c:	e51b3008 	ldr	r3, [fp, #-8]
   111a0:	e2833004 	add	r3, r3, #4
   111a4:	e50b3008 	str	r3, [fp, #-8]
					while (*insert
   111a8:	ea000007 	b	111cc <sprintf+0x228>
					       && buf != buf_end) {
						*buf++ = *insert++;
   111ac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   111b0:	e2832001 	add	r2, r3, #1
   111b4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   111b8:	e51b2010 	ldr	r2, [fp, #-16]
   111bc:	e2821001 	add	r1, r2, #1
   111c0:	e50b1010 	str	r1, [fp, #-16]
   111c4:	e5d22000 	ldrb	r2, [r2]
   111c8:	e5c32000 	strb	r2, [r3]
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
					var_args++;
					while (*insert
   111cc:	e51b3010 	ldr	r3, [fp, #-16]
   111d0:	e5d33000 	ldrb	r3, [r3]
   111d4:	e3530000 	cmp	r3, #0
   111d8:	0a000003 	beq	111ec <sprintf+0x248>
					       && buf != buf_end) {
   111dc:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   111e0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   111e4:	e1520003 	cmp	r2, r3
   111e8:	1affffef 	bne	111ac <sprintf+0x208>
						*buf++ = *insert++;
					}
					break;
   111ec:	ea000011 	b	11238 <sprintf+0x294>
				}
			default:
				*buf++ = '%';
   111f0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   111f4:	e2832001 	add	r2, r3, #1
   111f8:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   111fc:	e3a02025 	mov	r2, #37	; 0x25
   11200:	e5c32000 	strb	r2, [r3]
				if (buf == buf_end) {
   11204:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   11208:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   1120c:	e1520003 	cmp	r2, r3
   11210:	1a000001 	bne	1121c <sprintf+0x278>
					return buf_start;
   11214:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   11218:	ea000015 	b	11274 <sprintf+0x2d0>
				}
				*buf++ = *fmt;
   1121c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   11220:	e2832001 	add	r2, r3, #1
   11224:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   11228:	e59b2004 	ldr	r2, [fp, #4]
   1122c:	e5d22000 	ldrb	r2, [r2]
   11230:	e5c32000 	strb	r2, [r3]
				break;
   11234:	e1a00000 	nop			; (mov r0, r0)
			}
			fmt++;
   11238:	e59b3004 	ldr	r3, [fp, #4]
   1123c:	e2833001 	add	r3, r3, #1
   11240:	e58b3004 	str	r3, [fp, #4]
	}
	char* buf_start = buf;
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
	uint* var_args = (uint*)&fmt + 1;

	while (buf != buf_end
   11244:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   11248:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   1124c:	e1520003 	cmp	r2, r3
   11250:	0a000003 	beq	11264 <sprintf+0x2c0>
	       && *fmt) {
   11254:	e59b3004 	ldr	r3, [fp, #4]
   11258:	e5d33000 	ldrb	r3, [r3]
   1125c:	e3530000 	cmp	r3, #0
   11260:	1affff64 	bne	10ff8 <sprintf+0x54>
				break;
			}
			fmt++;
		}
	}
	*buf = 0; //Null terminate
   11264:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   11268:	e3a02000 	mov	r2, #0
   1126c:	e5c32000 	strb	r2, [r3]
	return buf_start;
   11270:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
}
   11274:	e1a00003 	mov	r0, r3
   11278:	e24bd004 	sub	sp, fp, #4
   1127c:	e8bd4800 	pop	{fp, lr}
   11280:	e28dd008 	add	sp, sp, #8
   11284:	e12fff1e 	bx	lr

00011288 <panic>:
//Panic function along with the function called when an assert is triggered
#include "utils.h"
#include "mem_mapped_io.h" //For UART

void panic(char* msg) {
   11288:	e92d4800 	push	{fp, lr}
   1128c:	e28db004 	add	fp, sp, #4
   11290:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   11294:	e24dd008 	sub	sp, sp, #8
   11298:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   1129c:	e2433004 	sub	r3, r3, #4
   112a0:	e5030004 	str	r0, [r3, #-4]
	static const char panic_msg_start[] = "panic: ";
	char buf[4096];
	//The -1/+1 is to account for the null terminator
	memcpy(buf, panic_msg_start, sizeof(panic_msg_start) - 1);
   112a4:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   112a8:	e2433004 	sub	r3, r3, #4
   112ac:	e1a00003 	mov	r0, r3
   112b0:	e3011734 	movw	r1, #5940	; 0x1734
   112b4:	e3401001 	movt	r1, #1
   112b8:	e3a02007 	mov	r2, #7
   112bc:	ebfffe29 	bl	10b68 <memcpy>
	strcpy(buf + sizeof(panic_msg_start) - 1, msg, 4096 - sizeof(panic_msg_start) + 1);
   112c0:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   112c4:	e2433004 	sub	r3, r3, #4
   112c8:	e2832007 	add	r2, r3, #7
   112cc:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   112d0:	e2433004 	sub	r3, r3, #4
   112d4:	e1a00002 	mov	r0, r2
   112d8:	e5131004 	ldr	r1, [r3, #-4]
   112dc:	e3002ff9 	movw	r2, #4089	; 0xff9
   112e0:	ebfffea3 	bl	10d74 <strcpy>
	uart0_put_str(buf);
   112e4:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   112e8:	e2433004 	sub	r3, r3, #4
   112ec:	e1a00003 	mov	r0, r3
   112f0:	ebfffc98 	bl	10558 <uart0_put_str>
	while (true) {}
   112f4:	eafffffe 	b	112f4 <panic+0x6c>

000112f8 <trigger_assert>:
}

void trigger_assert(const char* expr_str, const char* file_name, uint line_number, const char* func_name) {
   112f8:	e92d4800 	push	{fp, lr}
   112fc:	e28db004 	add	fp, sp, #4
   11300:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   11304:	e24dd020 	sub	sp, sp, #32
   11308:	e24bca01 	sub	ip, fp, #4096	; 0x1000
   1130c:	e24cc004 	sub	ip, ip, #4
   11310:	e50c0004 	str	r0, [ip, #-4]
   11314:	e24b0a01 	sub	r0, fp, #4096	; 0x1000
   11318:	e2400004 	sub	r0, r0, #4
   1131c:	e5001008 	str	r1, [r0, #-8]
   11320:	e24b1a01 	sub	r1, fp, #4096	; 0x1000
   11324:	e2411004 	sub	r1, r1, #4
   11328:	e501200c 	str	r2, [r1, #-12]
   1132c:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   11330:	e2422004 	sub	r2, r2, #4
   11334:	e5023010 	str	r3, [r2, #-16]
	char msg[4096];
	sprintf(msg,
   11338:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   1133c:	e2422004 	sub	r2, r2, #4
   11340:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11344:	e2433004 	sub	r3, r3, #4
   11348:	e1a0c003 	mov	ip, r3
   1134c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11350:	e2433004 	sub	r3, r3, #4
   11354:	e5133008 	ldr	r3, [r3, #-8]
   11358:	e58d3000 	str	r3, [sp]
   1135c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11360:	e2433004 	sub	r3, r3, #4
   11364:	e513300c 	ldr	r3, [r3, #-12]
   11368:	e58d3004 	str	r3, [sp, #4]
   1136c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11370:	e2433004 	sub	r3, r3, #4
   11374:	e5133010 	ldr	r3, [r3, #-16]
   11378:	e58d3008 	str	r3, [sp, #8]
   1137c:	e1a00002 	mov	r0, r2
   11380:	e3a01a01 	mov	r1, #4096	; 0x1000
   11384:	e30126f4 	movw	r2, #5876	; 0x16f4
   11388:	e3402001 	movt	r2, #1
   1138c:	e51c3004 	ldr	r3, [ip, #-4]
   11390:	ebffff03 	bl	10fa4 <sprintf>
	        "Assertion triggered\nExpression %s\nFile %s\nLine %u\nFunction %s\n",
	        expr_str,
	        file_name,
	        line_number,
	        func_name);
	panic(msg);
   11394:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11398:	e2433004 	sub	r3, r3, #4
   1139c:	e1a00003 	mov	r0, r3
   113a0:	ebffffb8 	bl	11288 <panic>
}
   113a4:	e24bd004 	sub	sp, fp, #4
   113a8:	e8bd8800 	pop	{fp, pc}

000113ac <get_cpsr>:
//Helpful arm assembly intrinsics
#include "arm.h"

uint get_cpsr() {
   113ac:	e92d0810 	push	{r4, fp}
   113b0:	e28db004 	add	fp, sp, #4
	register uint cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
   113b4:	e10f3000 	mrs	r3, CPSR
   113b8:	e1a04003 	mov	r4, r3
	              : [cpsr_out] "=r" (cur_cpsr));
	return cur_cpsr;
   113bc:	e1a03004 	mov	r3, r4
}
   113c0:	e1a00003 	mov	r0, r3
   113c4:	e24bd004 	sub	sp, fp, #4
   113c8:	e8bd0810 	pop	{r4, fp}
   113cc:	e12fff1e 	bx	lr

000113d0 <set_cpsr>:

void set_cpsr(uint new_cpsr) {
   113d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   113d4:	e28db000 	add	fp, sp, #0
   113d8:	e24dd00c 	sub	sp, sp, #12
   113dc:	e50b0008 	str	r0, [fp, #-8]
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
   113e0:	e51b3008 	ldr	r3, [fp, #-8]
   113e4:	e12ff003 	msr	CPSR_fsxc, r3
	              : //No output
	              : [cpsr_in] "r" (new_cpsr));
}
   113e8:	e24bd000 	sub	sp, fp, #0
   113ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   113f0:	e12fff1e 	bx	lr

000113f4 <set_operating_mode>:

//Set the current processor operating mode,
//mode_bit should be one of the PSR mode defines in arm.h
void set_operating_mode(uint mode_bit) {
   113f4:	e92d4810 	push	{r4, fp, lr}
   113f8:	e28db008 	add	fp, sp, #8
   113fc:	e24dd00c 	sub	sp, sp, #12
   11400:	e50b0010 	str	r0, [fp, #-16]
	register uint cur_cpsr = get_cpsr();
   11404:	ebffffe8 	bl	113ac <get_cpsr>
   11408:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr & (~PSR_MODE_MASK | mode_bit);
   1140c:	e51b3010 	ldr	r3, [fp, #-16]
   11410:	e1e03d83 	mvn	r3, r3, lsl #27
   11414:	e1e03da3 	mvn	r3, r3, lsr #27
   11418:	e0044003 	and	r4, r4, r3
	set_cpsr(cur_cpsr);
   1141c:	e1a00004 	mov	r0, r4
   11420:	ebffffea 	bl	113d0 <set_cpsr>
}
   11424:	e24bd008 	sub	sp, fp, #8
   11428:	e8bd8810 	pop	{r4, fp, pc}

0001142c <enable_irq_interrupts>:

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void enable_irq_interrupts() {
   1142c:	e92d4818 	push	{r3, r4, fp, lr}
   11430:	e28db00c 	add	fp, sp, #12
	register uint cur_cpsr = get_cpsr();
   11434:	ebffffdc 	bl	113ac <get_cpsr>
   11438:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr & ~PSR_IRQ_INTERRUPT_DISABLE;
   1143c:	e3c44080 	bic	r4, r4, #128	; 0x80
	set_cpsr(cur_cpsr);
   11440:	e1a00004 	mov	r0, r4
   11444:	ebffffe1 	bl	113d0 <set_cpsr>
}
   11448:	e8bd8818 	pop	{r3, r4, fp, pc}

0001144c <disable_irq_interrupts>:

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void disable_irq_interrupts() {
   1144c:	e92d4818 	push	{r3, r4, fp, lr}
   11450:	e28db00c 	add	fp, sp, #12
	register uint cur_cpsr = get_cpsr();
   11454:	ebffffd4 	bl	113ac <get_cpsr>
   11458:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr | PSR_IRQ_INTERRUPT_DISABLE;
   1145c:	e3844080 	orr	r4, r4, #128	; 0x80
	set_cpsr(cur_cpsr);
   11460:	e1a00004 	mov	r0, r4
   11464:	ebffffd9 	bl	113d0 <set_cpsr>
}
   11468:	e8bd8818 	pop	{r3, r4, fp, pc}

0001146c <get_data_fault_addr>:

uint get_data_fault_addr() {
   1146c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   11470:	e28db000 	add	fp, sp, #0
	register uint dfar;
	asm volatile ("mrc p15, 0, %[dfar_out] c6, c0, 0"
	              : [dfar_out] "=r" (dfar));
	return dfar;
	#endif
	return 0;
   11474:	e3a03000 	mov	r3, #0
}
   11478:	e1a00003 	mov	r0, r3
   1147c:	e24bd000 	sub	sp, fp, #0
   11480:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   11484:	e12fff1e 	bx	lr

00011488 <get_data_fault_status>:

uint get_data_fault_status() {
   11488:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1148c:	e28db000 	add	fp, sp, #0
	register uint dfsr;
	asm volatile ("mrc p15, 0, %[dfsr_out], c5, c0, 0"
	              : [dfsr_out] "=r" (dfsr));
	return dfsr;
	#endif
	return 0;
   11490:	e3a03000 	mov	r3, #0
}
   11494:	e1a00003 	mov	r0, r3
   11498:	e24bd000 	sub	sp, fp, #0
   1149c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   114a0:	e12fff1e 	bx	lr
