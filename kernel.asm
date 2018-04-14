
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
   10094:	e1a0f00b 	mov	pc, fp
   10098:	ea000036 	b	10178 <trap_return>

0001009c <reset_handler_asm>:
   1009c:	e59fb0e8 	ldr	fp, [pc, #232]	; 1018c <reset_handler_c>
   100a0:	e1a0f00b 	mov	pc, fp

000100a4 <undefined_instruction_handler_asm>:
   100a4:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100a8:	e14f2000 	mrs	r2, SPSR
   100ac:	e92d0004 	stmfd	sp!, {r2}
   100b0:	e94d6000 	stmdb	sp, {sp, lr}^
   100b4:	e24dd008 	sub	sp, sp, #8
   100b8:	e1a0000d 	mov	r0, sp
   100bc:	e59fb0ec 	ldr	fp, [pc, #236]	; 101b0 <fiq_handler_c+0x8>
   100c0:	e1a0f00b 	mov	pc, fp
   100c4:	ea00002b 	b	10178 <trap_return>

000100c8 <software_interrupt_handler_asm>:
   100c8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100cc:	e14f2000 	mrs	r2, SPSR
   100d0:	e92d0004 	stmfd	sp!, {r2}
   100d4:	e94d6000 	stmdb	sp, {sp, lr}^
   100d8:	e24dd008 	sub	sp, sp, #8
   100dc:	e1a0000d 	mov	r0, sp
   100e0:	e59fb0ac 	ldr	fp, [pc, #172]	; 10194 <software_interrupt_handler_c>
   100e4:	e1a0f00b 	mov	pc, fp
   100e8:	ea000022 	b	10178 <trap_return>

000100ec <prefetch_abort_handler_asm>:
   100ec:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100f0:	e14f2000 	mrs	r2, SPSR
   100f4:	e92d0004 	stmfd	sp!, {r2}
   100f8:	e94d6000 	stmdb	sp, {sp, lr}^
   100fc:	e24dd008 	sub	sp, sp, #8
   10100:	e1a0000d 	mov	r0, sp
   10104:	e59fb08c 	ldr	fp, [pc, #140]	; 10198 <prefetch_abort_handler_c>
   10108:	e1a0f00b 	mov	pc, fp
   1010c:	ea000019 	b	10178 <trap_return>

00010110 <data_abort_handler_asm>:
   10110:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10114:	e14f2000 	mrs	r2, SPSR
   10118:	e92d0004 	stmfd	sp!, {r2}
   1011c:	e94d6000 	stmdb	sp, {sp, lr}^
   10120:	e24dd008 	sub	sp, sp, #8
   10124:	e1a0000d 	mov	r0, sp
   10128:	e59fb06c 	ldr	fp, [pc, #108]	; 1019c <data_abort_handler_c>
   1012c:	e1a0f00b 	mov	pc, fp
   10130:	ea000010 	b	10178 <trap_return>

00010134 <unused_exception_handler_asm>:
   10134:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   10138:	e14f2000 	mrs	r2, SPSR
   1013c:	e92d0004 	stmfd	sp!, {r2}
   10140:	e94d6000 	stmdb	sp, {sp, lr}^
   10144:	e24dd008 	sub	sp, sp, #8
   10148:	e1a0000d 	mov	r0, sp
   1014c:	e59fb04c 	ldr	fp, [pc, #76]	; 101a0 <unused_exception_handler_c>
   10150:	e1a0f00b 	mov	pc, fp
   10154:	ea000007 	b	10178 <trap_return>

00010158 <irq_handler_asm>:
   10158:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1015c:	e14f2000 	mrs	r2, SPSR
   10160:	e92d0004 	stmfd	sp!, {r2}
   10164:	e94d6000 	stmdb	sp, {sp, lr}^
   10168:	e24dd008 	sub	sp, sp, #8
   1016c:	e1a0000d 	mov	r0, sp
   10170:	e59fb02c 	ldr	fp, [pc, #44]	; 101a4 <irq_handler_c>
   10174:	e1a0f00b 	mov	pc, fp

00010178 <trap_return>:
   10178:	e8dd6000 	ldm	sp, {sp, lr}^
   1017c:	e28dd008 	add	sp, sp, #8
   10180:	e8bd0004 	ldmfd	sp!, {r2}
   10184:	e16ff002 	msr	SPSR_fsxc, r2
   10188:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

0001018c <reset_handler_c>:
   1018c:	00010000 	.word	0x00010000

00010190 <undefined_instruction_handler_c>:
   10190:	000107bc 	.word	0x000107bc

00010194 <software_interrupt_handler_c>:
   10194:	00010814 	.word	0x00010814

00010198 <prefetch_abort_handler_c>:
   10198:	00010840 	.word	0x00010840

0001019c <data_abort_handler_c>:
   1019c:	00010890 	.word	0x00010890

000101a0 <unused_exception_handler_c>:
   101a0:	000108f0 	.word	0x000108f0

000101a4 <irq_handler_c>:
   101a4:	0001091c 	.word	0x0001091c

000101a8 <fiq_handler_c>:
   101a8:	00010940 	.word	0x00010940
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
   101bc:	eb000013 	bl	10210 <vm_init>

	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
   101c0:	e3a00000 	mov	r0, #0
   101c4:	e3001060 	movw	r1, #96	; 0x60
   101c8:	e3401001 	movt	r1, #1
   101cc:	e30021b4 	movw	r2, #436	; 0x1b4
   101d0:	e3402001 	movt	r2, #1
   101d4:	eb00029c 	bl	10c4c <memcpy_region>

	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   101d8:	e3060000 	movw	r0, #24576	; 0x6000
   101dc:	e3400001 	movt	r0, #1
   101e0:	e30610a0 	movw	r1, #24736	; 0x60a0
   101e4:	e3401001 	movt	r1, #1
   101e8:	eb0002ef 	bl	10dac <zero_region>

	//---UART initialization
	uart0_init();
   101ec:	eb000056 	bl	1034c <uart0_init>

	//---Generic timer interrupts initialization
	timer_init();
   101f0:	eb0001dd 	bl	1096c <timer_init>

	// char buf[256];
	// char* test_string = sprintf(buf, 256, "Hello %d worlds!\n", -10);
	// uart0_put_str(test_string);

	asm volatile ("ldr r0, =1;"
   101f4:	e3a00001 	mov	r0, #1
   101f8:	ef000000 	svc	0x00000000
	              "swi 0;");

	while (1) {
		uart0_send_char(uart0_get_char());
   101fc:	eb0000be 	bl	104fc <uart0_get_char>
   10200:	e1a03000 	mov	r3, r0
   10204:	e1a00003 	mov	r0, r3
   10208:	eb000098 	bl	10470 <uart0_send_char>
	}
   1020c:	eafffffa 	b	101fc <kmain+0x48>

00010210 <vm_init>:
#define USE_SECTIONS 0x2
#define AP_DONT_CHECK_PERMS 0xC00

extern char kernel_end[];

void vm_init() {
   10210:	e92d4800 	push	{fp, lr}
   10214:	e28db004 	add	fp, sp, #4
   10218:	e24dd010 	sub	sp, sp, #16
  // Identity map from 1MB up to PERI_BASE
	uint offset = 0;
   1021c:	e3a03000 	mov	r3, #0
   10220:	e50b3008 	str	r3, [fp, #-8]
	uint* page_table_base = (uint*)((uint)(kernel_end + 0x4000) & ~0x3FFF);
   10224:	e59f30c8 	ldr	r3, [pc, #200]	; 102f4 <vm_init+0xe4>
   10228:	e3c33dff 	bic	r3, r3, #16320	; 0x3fc0
   1022c:	e3c3303f 	bic	r3, r3, #63	; 0x3f
   10230:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
	for(uint vaddr = 0; vaddr < (1 << 31); vaddr += MB) {
   10234:	e3a03000 	mov	r3, #0
   10238:	e50b300c 	str	r3, [fp, #-12]
   1023c:	ea000012 	b	1028c <vm_init+0x7c>
		uint* pt_entry = page_table_base + offset;
   10240:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   10244:	e51b3008 	ldr	r3, [fp, #-8]
   10248:	e1a03103 	lsl	r3, r3, #2
   1024c:	e0823003 	add	r3, r2, r3
   10250:	e50b3010 	str	r3, [fp, #-16]
		*pt_entry = 0;
   10254:	e51b3010 	ldr	r3, [fp, #-16]
   10258:	e3a02000 	mov	r2, #0
   1025c:	e5832000 	str	r2, [r3]
		*pt_entry = vaddr | AP_DONT_CHECK_PERMS | USE_SECTIONS;
   10260:	e51b300c 	ldr	r3, [fp, #-12]
   10264:	e3833b03 	orr	r3, r3, #3072	; 0xc00
   10268:	e3833002 	orr	r3, r3, #2
   1026c:	e51b2010 	ldr	r2, [fp, #-16]
   10270:	e5823000 	str	r3, [r2]
		offset++;
   10274:	e51b3008 	ldr	r3, [fp, #-8]
   10278:	e2833001 	add	r3, r3, #1
   1027c:	e50b3008 	str	r3, [fp, #-8]

void vm_init() {
  // Identity map from 1MB up to PERI_BASE
	uint offset = 0;
	uint* page_table_base = (uint*)((uint)(kernel_end + 0x4000) & ~0x3FFF);
	for(uint vaddr = 0; vaddr < (1 << 31); vaddr += MB) {
   10280:	e51b300c 	ldr	r3, [fp, #-12]
   10284:	e2833601 	add	r3, r3, #1048576	; 0x100000
   10288:	e50b300c 	str	r3, [fp, #-12]
   1028c:	e51b300c 	ldr	r3, [fp, #-12]
   10290:	e3530000 	cmp	r3, #0
   10294:	aaffffe9 	bge	10240 <vm_init+0x30>
	/*
	   https://github.com/dwelch67/raspberrypi/tree/master/mmu
	   https://stackoverflow.com/questions/20138294/getting-a-prefetch-abort-after-enabling-mmu-on-armv7
	   https://witekio.com/blog/turning-arm-mmu-living-tell-tale-code/
	*/
	set_operating_mode(PSR_SYSTEM_MODE);
   10298:	e3a0001f 	mov	r0, #31
   1029c:	eb00043f 	bl	113a0 <set_operating_mode>

	asm volatile("mov r0, $4;"
   102a0:	e24b3014 	sub	r3, fp, #20
   102a4:	e3a00004 	mov	r0, #4
   102a8:	e1e00000 	mvn	r0, r0
   102ac:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   102b0:	e0001001 	and	r1, r0, r1
   102b4:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
   102b8:	e3a01000 	mov	r1, #0
   102bc:	ee021f50 	mcr	15, 0, r1, cr2, cr0, {2}
   102c0:	ee071f15 	mcr	15, 0, r1, cr7, cr5, {0}
   102c4:	ee071f95 	mcr	15, 0, r1, cr7, cr5, {4}
   102c8:	ee081f17 	mcr	15, 0, r1, cr8, cr7, {0}
   102cc:	e5930000 	ldr	r0, [r3]
   102d0:	ee020f10 	mcr	15, 0, r0, cr2, cr0, {0}
   102d4:	f57ff04f 	dsb	sy
   102d8:	e3e00000 	mvn	r0, #0
   102dc:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
   102e0:	ee111f10 	mrc	15, 0, r1, cr1, cr0, {0}
   102e4:	e3811001 	orr	r1, r1, #1
   102e8:	ee011f10 	mcr	15, 0, r1, cr1, cr0, {0}
                 "orr r1, r1, $1;"             // Enable mmu bit (0x1)
                 "mcr p15, 0, r1, c1, c0, 0;"  // Put that bad boy back in there
				 :
				 : "r"(&page_table_base)
				 : "memory", "r0", "r1");
}
   102ec:	e24bd004 	sub	sp, fp, #4
   102f0:	e8bd8800 	pop	{fp, pc}
   102f4:	0001a0a0 	.word	0x0001a0a0

000102f8 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint* reg, uint data) {
   102f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   102fc:	e28db000 	add	fp, sp, #0
   10300:	e24dd00c 	sub	sp, sp, #12
   10304:	e50b0008 	str	r0, [fp, #-8]
   10308:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   1030c:	e51b3008 	ldr	r3, [fp, #-8]
   10310:	e51b200c 	ldr	r2, [fp, #-12]
   10314:	e5832000 	str	r2, [r3]
}
   10318:	e24bd000 	sub	sp, fp, #0
   1031c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10320:	e12fff1e 	bx	lr

00010324 <mmio_read>:
uint mmio_read(volatile uint* reg) {
   10324:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10328:	e28db000 	add	fp, sp, #0
   1032c:	e24dd00c 	sub	sp, sp, #12
   10330:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   10334:	e51b3008 	ldr	r3, [fp, #-8]
   10338:	e5933000 	ldr	r3, [r3]
}
   1033c:	e1a00003 	mov	r0, r3
   10340:	e24bd000 	sub	sp, fp, #0
   10344:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10348:	e12fff1e 	bx	lr

0001034c <uart0_init>:

void uart0_init() {
   1034c:	e92d4800 	push	{fp, lr}
   10350:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   10354:	e3010030 	movw	r0, #4144	; 0x1030
   10358:	e3430f20 	movt	r0, #16160	; 0x3f20
   1035c:	e3a01000 	mov	r1, #0
   10360:	ebffffe4 	bl	102f8 <mmio_write>
	// Setup the GPIO pin 14 && 15.

	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   10364:	e3a00094 	mov	r0, #148	; 0x94
   10368:	e3430f20 	movt	r0, #16160	; 0x3f20
   1036c:	e3a01000 	mov	r1, #0
   10370:	ebffffe0 	bl	102f8 <mmio_write>
	delay(150);
   10374:	e3063000 	movw	r3, #24576	; 0x6000
   10378:	e3403001 	movt	r3, #1
   1037c:	e3a02096 	mov	r2, #150	; 0x96
   10380:	e5832000 	str	r2, [r3]
   10384:	ea000000 	b	1038c <uart0_init+0x40>
   10388:	e320f000 	nop	{0}
   1038c:	e3063000 	movw	r3, #24576	; 0x6000
   10390:	e3403001 	movt	r3, #1
   10394:	e5932000 	ldr	r2, [r3]
   10398:	e2421001 	sub	r1, r2, #1
   1039c:	e3063000 	movw	r3, #24576	; 0x6000
   103a0:	e3403001 	movt	r3, #1
   103a4:	e5831000 	str	r1, [r3]
   103a8:	e3520000 	cmp	r2, #0
   103ac:	1afffff5 	bne	10388 <uart0_init+0x3c>

	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   103b0:	e3a00098 	mov	r0, #152	; 0x98
   103b4:	e3430f20 	movt	r0, #16160	; 0x3f20
   103b8:	e3a01903 	mov	r1, #49152	; 0xc000
   103bc:	ebffffcd 	bl	102f8 <mmio_write>
	delay(150);
   103c0:	e3063000 	movw	r3, #24576	; 0x6000
   103c4:	e3403001 	movt	r3, #1
   103c8:	e3a02096 	mov	r2, #150	; 0x96
   103cc:	e5832000 	str	r2, [r3]
   103d0:	ea000000 	b	103d8 <uart0_init+0x8c>
   103d4:	e320f000 	nop	{0}
   103d8:	e3063000 	movw	r3, #24576	; 0x6000
   103dc:	e3403001 	movt	r3, #1
   103e0:	e5932000 	ldr	r2, [r3]
   103e4:	e2421001 	sub	r1, r2, #1
   103e8:	e3063000 	movw	r3, #24576	; 0x6000
   103ec:	e3403001 	movt	r3, #1
   103f0:	e5831000 	str	r1, [r3]
   103f4:	e3520000 	cmp	r2, #0
   103f8:	1afffff5 	bne	103d4 <uart0_init+0x88>

	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   103fc:	e3a00098 	mov	r0, #152	; 0x98
   10400:	e3430f20 	movt	r0, #16160	; 0x3f20
   10404:	e3a01000 	mov	r1, #0
   10408:	ebffffba 	bl	102f8 <mmio_write>

	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   1040c:	e3010044 	movw	r0, #4164	; 0x1044
   10410:	e3430f20 	movt	r0, #16160	; 0x3f20
   10414:	e30017ff 	movw	r1, #2047	; 0x7ff
   10418:	ebffffb6 	bl	102f8 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.

	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   1041c:	e3010024 	movw	r0, #4132	; 0x1024
   10420:	e3430f20 	movt	r0, #16160	; 0x3f20
   10424:	e3a01001 	mov	r1, #1
   10428:	ebffffb2 	bl	102f8 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   1042c:	e3010028 	movw	r0, #4136	; 0x1028
   10430:	e3430f20 	movt	r0, #16160	; 0x3f20
   10434:	e3a01028 	mov	r1, #40	; 0x28
   10438:	ebffffae 	bl	102f8 <mmio_write>

	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   1043c:	e301002c 	movw	r0, #4140	; 0x102c
   10440:	e3430f20 	movt	r0, #16160	; 0x3f20
   10444:	e3a01070 	mov	r1, #112	; 0x70
   10448:	ebffffaa 	bl	102f8 <mmio_write>

	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   1044c:	e3010038 	movw	r0, #4152	; 0x1038
   10450:	e3430f20 	movt	r0, #16160	; 0x3f20
   10454:	e30017f2 	movw	r1, #2034	; 0x7f2
   10458:	ebffffa6 	bl	102f8 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));

	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   1045c:	e3010030 	movw	r0, #4144	; 0x1030
   10460:	e3430f20 	movt	r0, #16160	; 0x3f20
   10464:	e3001301 	movw	r1, #769	; 0x301
   10468:	ebffffa2 	bl	102f8 <mmio_write>
#endif
}
   1046c:	e8bd8800 	pop	{fp, pc}

00010470 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   10470:	e92d4800 	push	{fp, lr}
   10474:	e28db004 	add	fp, sp, #4
   10478:	e24dd008 	sub	sp, sp, #8
   1047c:	e1a03000 	mov	r3, r0
   10480:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   10484:	e1a00000 	nop			; (mov r0, r0)
   10488:	e3010018 	movw	r0, #4120	; 0x1018
   1048c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10490:	ebffffa3 	bl	10324 <mmio_read>
   10494:	e1a03000 	mov	r3, r0
   10498:	e2033020 	and	r3, r3, #32
   1049c:	e3530000 	cmp	r3, #0
   104a0:	1afffff8 	bne	10488 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   104a4:	e55b3005 	ldrb	r3, [fp, #-5]
   104a8:	e3a00a01 	mov	r0, #4096	; 0x1000
   104ac:	e3430f20 	movt	r0, #16160	; 0x3f20
   104b0:	e1a01003 	mov	r1, r3
   104b4:	ebffff8f 	bl	102f8 <mmio_write>
	delay(150);
   104b8:	e3063000 	movw	r3, #24576	; 0x6000
   104bc:	e3403001 	movt	r3, #1
   104c0:	e3a02096 	mov	r2, #150	; 0x96
   104c4:	e5832000 	str	r2, [r3]
   104c8:	ea000000 	b	104d0 <uart0_send_char+0x60>
   104cc:	e320f000 	nop	{0}
   104d0:	e3063000 	movw	r3, #24576	; 0x6000
   104d4:	e3403001 	movt	r3, #1
   104d8:	e5932000 	ldr	r2, [r3]
   104dc:	e2421001 	sub	r1, r2, #1
   104e0:	e3063000 	movw	r3, #24576	; 0x6000
   104e4:	e3403001 	movt	r3, #1
   104e8:	e5831000 	str	r1, [r3]
   104ec:	e3520000 	cmp	r2, #0
   104f0:	1afffff5 	bne	104cc <uart0_send_char+0x5c>
}
   104f4:	e24bd004 	sub	sp, fp, #4
   104f8:	e8bd8800 	pop	{fp, pc}

000104fc <uart0_get_char>:

char uart0_get_char() {
   104fc:	e92d4800 	push	{fp, lr}
   10500:	e28db004 	add	fp, sp, #4
   10504:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   10508:	e1a00000 	nop			; (mov r0, r0)
   1050c:	e3010018 	movw	r0, #4120	; 0x1018
   10510:	e3430f20 	movt	r0, #16160	; 0x3f20
   10514:	ebffff82 	bl	10324 <mmio_read>
   10518:	e1a03000 	mov	r3, r0
   1051c:	e2033010 	and	r3, r3, #16
   10520:	e3530000 	cmp	r3, #0
   10524:	1afffff8 	bne	1050c <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   10528:	e3a00a01 	mov	r0, #4096	; 0x1000
   1052c:	e3430f20 	movt	r0, #16160	; 0x3f20
   10530:	ebffff7b 	bl	10324 <mmio_read>
   10534:	e1a03000 	mov	r3, r0
   10538:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   1053c:	e55b3005 	ldrb	r3, [fp, #-5]
   10540:	e353000d 	cmp	r3, #13
   10544:	0a000001 	beq	10550 <uart0_get_char+0x54>
   10548:	e55b3005 	ldrb	r3, [fp, #-5]
   1054c:	ea000000 	b	10554 <uart0_get_char+0x58>
   10550:	e3a0300a 	mov	r3, #10
}
   10554:	e1a00003 	mov	r0, r3
   10558:	e24bd004 	sub	sp, fp, #4
   1055c:	e8bd8800 	pop	{fp, pc}

00010560 <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   10560:	e92d4800 	push	{fp, lr}
   10564:	e28db004 	add	fp, sp, #4
   10568:	e24dd008 	sub	sp, sp, #8
   1056c:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   10570:	ea00000b 	b	105a4 <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   10574:	e51b3008 	ldr	r3, [fp, #-8]
   10578:	e5d33000 	ldrb	r3, [r3]
   1057c:	e353000a 	cmp	r3, #10
   10580:	1a000001 	bne	1058c <uart0_put_str+0x2c>
			uart0_send_char('\r');
   10584:	e3a0000d 	mov	r0, #13
   10588:	ebffffb8 	bl	10470 <uart0_send_char>
		}
		uart0_send_char(*s++);
   1058c:	e51b3008 	ldr	r3, [fp, #-8]
   10590:	e2832001 	add	r2, r3, #1
   10594:	e50b2008 	str	r2, [fp, #-8]
   10598:	e5d33000 	ldrb	r3, [r3]
   1059c:	e1a00003 	mov	r0, r3
   105a0:	ebffffb2 	bl	10470 <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   105a4:	e51b3008 	ldr	r3, [fp, #-8]
   105a8:	e5d33000 	ldrb	r3, [r3]
   105ac:	e3530000 	cmp	r3, #0
   105b0:	1affffef 	bne	10574 <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   105b4:	e24bd004 	sub	sp, fp, #4
   105b8:	e8bd8800 	pop	{fp, pc}

000105bc <mailbox_send_message>:
   105bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   105c0:	e28db000 	add	fp, sp, #0
   105c4:	e24dd01c 	sub	sp, sp, #28
   105c8:	e1a03000 	mov	r3, r0
   105cc:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
   105d0:	e320f000 	nop	{0}
   105d4:	e30b3898 	movw	r3, #47256	; 0xb898
   105d8:	e3433f00 	movt	r3, #16128	; 0x3f00
   105dc:	e5933000 	ldr	r3, [r3]
   105e0:	e3530000 	cmp	r3, #0
   105e4:	bafffff9 	blt	105d0 <mailbox_send_message+0x14>
   105e8:	e55b0015 	ldrb	r0, [fp, #-21]	; 0xffffffeb
   105ec:	e3a01000 	mov	r1, #0
   105f0:	e3063010 	movw	r3, #24592	; 0x6010
   105f4:	e3403001 	movt	r3, #1
   105f8:	e1a02003 	mov	r2, r3
   105fc:	e3a03000 	mov	r3, #0
   10600:	e1822000 	orr	r2, r2, r0
   10604:	e1833001 	orr	r3, r3, r1
   10608:	e14b20fc 	strd	r2, [fp, #-12]
   1060c:	e30b38a0 	movw	r3, #47264	; 0xb8a0
   10610:	e3433f00 	movt	r3, #16128	; 0x3f00
   10614:	e51b200c 	ldr	r2, [fp, #-12]
   10618:	e5832000 	str	r2, [r3]
   1061c:	e320f000 	nop	{0}
   10620:	e30b3898 	movw	r3, #47256	; 0xb898
   10624:	e3433f00 	movt	r3, #16128	; 0x3f00
   10628:	e5933000 	ldr	r3, [r3]
   1062c:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   10630:	e3530000 	cmp	r3, #0
   10634:	1afffff8 	bne	1061c <mailbox_send_message+0x60>
   10638:	e30b3880 	movw	r3, #47232	; 0xb880
   1063c:	e3433f00 	movt	r3, #16128	; 0x3f00
   10640:	e5933000 	ldr	r3, [r3]
   10644:	e50b3010 	str	r3, [fp, #-16]
   10648:	e51b3010 	ldr	r3, [fp, #-16]
   1064c:	e6ef3073 	uxtb	r3, r3
   10650:	e203200f 	and	r2, r3, #15
   10654:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   10658:	e1520003 	cmp	r2, r3
   1065c:	1a00000f 	bne	106a0 <mailbox_send_message+0xe4>
   10660:	e51b3010 	ldr	r3, [fp, #-16]
   10664:	e3c3200f 	bic	r2, r3, #15
   10668:	e3063010 	movw	r3, #24592	; 0x6010
   1066c:	e3403001 	movt	r3, #1
   10670:	e1520003 	cmp	r2, r3
   10674:	1a000009 	bne	106a0 <mailbox_send_message+0xe4>
   10678:	e3063010 	movw	r3, #24592	; 0x6010
   1067c:	e3403001 	movt	r3, #1
   10680:	e5933004 	ldr	r3, [r3, #4]
   10684:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   10688:	03a03001 	moveq	r3, #1
   1068c:	13a03000 	movne	r3, #0
   10690:	e6ef3073 	uxtb	r3, r3
   10694:	e6ef2073 	uxtb	r2, r3
   10698:	e3a03000 	mov	r3, #0
   1069c:	ea000000 	b	106a4 <mailbox_send_message+0xe8>
   106a0:	eaffffdd 	b	1061c <mailbox_send_message+0x60>
   106a4:	e1a00002 	mov	r0, r2
   106a8:	e1a01003 	mov	r1, r3
   106ac:	e24bd000 	sub	sp, fp, #0
   106b0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   106b4:	e12fff1e 	bx	lr

000106b8 <dump_trap_frame>:
#include "arm.h"
#include "utils.h"
#include "arm_asm_intrinsics.h"
#include "console.h"

static void dump_trap_frame(struct trap_frame* tf) {
   106b8:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
   106bc:	e28db020 	add	fp, sp, #32
   106c0:	e24dd054 	sub	sp, sp, #84	; 0x54
   106c4:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
	cprintf("user LR = 0x%x\n"
   106c8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   106cc:	e5933000 	ldr	r3, [r3]
   106d0:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
   106d4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   106d8:	e5932004 	ldr	r2, [r3, #4]
   106dc:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
   106e0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   106e4:	e5930008 	ldr	r0, [r3, #8]
   106e8:	e50b0034 	str	r0, [fp, #-52]	; 0xffffffcc
   106ec:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   106f0:	e593000c 	ldr	r0, [r3, #12]
   106f4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   106f8:	e593c010 	ldr	ip, [r3, #16]
   106fc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10700:	e5934014 	ldr	r4, [r3, #20]
   10704:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10708:	e593e018 	ldr	lr, [r3, #24]
   1070c:	e50be038 	str	lr, [fp, #-56]	; 0xffffffc8
   10710:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10714:	e593a01c 	ldr	sl, [r3, #28]
   10718:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   1071c:	e5939020 	ldr	r9, [r3, #32]
   10720:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10724:	e5938024 	ldr	r8, [r3, #36]	; 0x24
   10728:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   1072c:	e5937028 	ldr	r7, [r3, #40]	; 0x28
   10730:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10734:	e593602c 	ldr	r6, [r3, #44]	; 0x2c
   10738:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   1073c:	e5935030 	ldr	r5, [r3, #48]	; 0x30
   10740:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10744:	e593e034 	ldr	lr, [r3, #52]	; 0x34
   10748:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   1074c:	e5931038 	ldr	r1, [r3, #56]	; 0x38
   10750:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10754:	e593203c 	ldr	r2, [r3, #60]	; 0x3c
   10758:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   1075c:	e5933040 	ldr	r3, [r3, #64]	; 0x40
   10760:	e58d0000 	str	r0, [sp]
   10764:	e58dc004 	str	ip, [sp, #4]
   10768:	e58d4008 	str	r4, [sp, #8]
   1076c:	e51bc038 	ldr	ip, [fp, #-56]	; 0xffffffc8
   10770:	e58dc00c 	str	ip, [sp, #12]
   10774:	e58da010 	str	sl, [sp, #16]
   10778:	e58d9014 	str	r9, [sp, #20]
   1077c:	e58d8018 	str	r8, [sp, #24]
   10780:	e58d701c 	str	r7, [sp, #28]
   10784:	e58d6020 	str	r6, [sp, #32]
   10788:	e58d5024 	str	r5, [sp, #36]	; 0x24
   1078c:	e58de028 	str	lr, [sp, #40]	; 0x28
   10790:	e58d102c 	str	r1, [sp, #44]	; 0x2c
   10794:	e58d2030 	str	r2, [sp, #48]	; 0x30
   10798:	e58d3034 	str	r3, [sp, #52]	; 0x34
   1079c:	e3010530 	movw	r0, #5424	; 0x1530
   107a0:	e3400001 	movt	r0, #1
   107a4:	e51b102c 	ldr	r1, [fp, #-44]	; 0xffffffd4
   107a8:	e51b2030 	ldr	r2, [fp, #-48]	; 0xffffffd0
   107ac:	e51b3034 	ldr	r3, [fp, #-52]	; 0xffffffcc
   107b0:	eb000326 	bl	11450 <cprintf>
	        tf->general_registers[8],
	        tf->general_registers[9],
	        tf->general_registers[10],
	        tf->general_registers[11],
	        tf->general_registers[12]);
}
   107b4:	e24bd020 	sub	sp, fp, #32
   107b8:	e8bd8ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, pc}

000107bc <undefined_instruction_handler>:

void undefined_instruction_handler(struct trap_frame* tf) {
   107bc:	e92d4800 	push	{fp, lr}
   107c0:	e28db004 	add	fp, sp, #4
   107c4:	e24ddb01 	sub	sp, sp, #1024	; 0x400
   107c8:	e24dd008 	sub	sp, sp, #8
   107cc:	e50b0408 	str	r0, [fp, #-1032]	; 0xfffffbf8
	char buf[1024];
	//-4 because return address is after faulting instruction
	dump_trap_frame(tf);
   107d0:	e51b0408 	ldr	r0, [fp, #-1032]	; 0xfffffbf8
   107d4:	ebffffb7 	bl	106b8 <dump_trap_frame>
	panic(sprintf(buf, 1024, "Undefined instruction executed at 0x%x",
	              tf->user_return_address - 4));
   107d8:	e51b3408 	ldr	r3, [fp, #-1032]	; 0xfffffbf8
   107dc:	e593300c 	ldr	r3, [r3, #12]

void undefined_instruction_handler(struct trap_frame* tf) {
	char buf[1024];
	//-4 because return address is after faulting instruction
	dump_trap_frame(tf);
	panic(sprintf(buf, 1024, "Undefined instruction executed at 0x%x",
   107e0:	e2433004 	sub	r3, r3, #4
   107e4:	e24b2b01 	sub	r2, fp, #1024	; 0x400
   107e8:	e2422004 	sub	r2, r2, #4
   107ec:	e1a00002 	mov	r0, r2
   107f0:	e3a01b01 	mov	r1, #1024	; 0x400
   107f4:	e30125fc 	movw	r2, #5628	; 0x15fc
   107f8:	e3402001 	movt	r2, #1
   107fc:	eb0001cd 	bl	10f38 <sprintf>
   10800:	e1a03000 	mov	r3, r0
   10804:	e1a00003 	mov	r0, r3
   10808:	eb00029c 	bl	11280 <panic>
	              tf->user_return_address - 4));
}
   1080c:	e24bd004 	sub	sp, fp, #4
   10810:	e8bd8800 	pop	{fp, pc}

00010814 <software_interrupt_handler>:

void software_interrupt_handler(struct trap_frame* tf) {
   10814:	e92d4800 	push	{fp, lr}
   10818:	e28db004 	add	fp, sp, #4
   1081c:	e24dd010 	sub	sp, sp, #16
   10820:	e50b0010 	str	r0, [fp, #-16]
	uint syscall_id = tf->general_registers[0];
   10824:	e51b3010 	ldr	r3, [fp, #-16]
   10828:	e5933010 	ldr	r3, [r3, #16]
   1082c:	e50b3008 	str	r3, [fp, #-8]
	syscall(syscall_id);
   10830:	e51b0008 	ldr	r0, [fp, #-8]
   10834:	eb000326 	bl	114d4 <syscall>
}
   10838:	e24bd004 	sub	sp, fp, #4
   1083c:	e8bd8800 	pop	{fp, pc}

00010840 <prefetch_abort_handler>:

void prefetch_abort_handler(struct trap_frame* tf) {
   10840:	e92d4800 	push	{fp, lr}
   10844:	e28db004 	add	fp, sp, #4
   10848:	e24ddb01 	sub	sp, sp, #1024	; 0x400
   1084c:	e24dd008 	sub	sp, sp, #8
   10850:	e50b0408 	str	r0, [fp, #-1032]	; 0xfffffbf8
	char buf[1024];
	panic(sprintf(buf, 1024, "Prefetch abort at 0x%x",
	              tf->user_return_address - 4));
   10854:	e51b3408 	ldr	r3, [fp, #-1032]	; 0xfffffbf8
   10858:	e593300c 	ldr	r3, [r3, #12]
	syscall(syscall_id);
}

void prefetch_abort_handler(struct trap_frame* tf) {
	char buf[1024];
	panic(sprintf(buf, 1024, "Prefetch abort at 0x%x",
   1085c:	e2433004 	sub	r3, r3, #4
   10860:	e24b2b01 	sub	r2, fp, #1024	; 0x400
   10864:	e2422004 	sub	r2, r2, #4
   10868:	e1a00002 	mov	r0, r2
   1086c:	e3a01b01 	mov	r1, #1024	; 0x400
   10870:	e3012624 	movw	r2, #5668	; 0x1624
   10874:	e3402001 	movt	r2, #1
   10878:	eb0001ae 	bl	10f38 <sprintf>
   1087c:	e1a03000 	mov	r3, r0
   10880:	e1a00003 	mov	r0, r3
   10884:	eb00027d 	bl	11280 <panic>
	              tf->user_return_address - 4));
}
   10888:	e24bd004 	sub	sp, fp, #4
   1088c:	e8bd8800 	pop	{fp, pc}

00010890 <data_abort_handler>:

void data_abort_handler(struct trap_frame* tf) {
   10890:	e92d4800 	push	{fp, lr}
   10894:	e28db004 	add	fp, sp, #4
   10898:	e24dde41 	sub	sp, sp, #1040	; 0x410
   1089c:	e24dd008 	sub	sp, sp, #8
   108a0:	e50b0410 	str	r0, [fp, #-1040]	; 0xfffffbf0
	char buf[1024];
	uint faulting_addr = get_data_fault_addr();
   108a4:	eb0002db 	bl	11418 <get_data_fault_addr>
   108a8:	e50b0008 	str	r0, [fp, #-8]
	//uint fault_info = get_data_fault_status(); @todo use this to print a better error message
	panic(sprintf(buf, 1024,
   108ac:	e51b3410 	ldr	r3, [fp, #-1040]	; 0xfffffbf0
   108b0:	e593200c 	ldr	r2, [r3, #12]
   108b4:	e24b3b01 	sub	r3, fp, #1024	; 0x400
   108b8:	e2433004 	sub	r3, r3, #4
   108bc:	e2433004 	sub	r3, r3, #4
   108c0:	e58d2000 	str	r2, [sp]
   108c4:	e1a00003 	mov	r0, r3
   108c8:	e3a01b01 	mov	r1, #1024	; 0x400
   108cc:	e301263c 	movw	r2, #5692	; 0x163c
   108d0:	e3402001 	movt	r2, #1
   108d4:	e51b3008 	ldr	r3, [fp, #-8]
   108d8:	eb000196 	bl	10f38 <sprintf>
   108dc:	e1a03000 	mov	r3, r0
   108e0:	e1a00003 	mov	r0, r3
   108e4:	eb000265 	bl	11280 <panic>
	              "Page fault at address 0x%x"
	              " executing instruction at 0x%x",
	              faulting_addr,
	              tf->user_return_address));
}
   108e8:	e24bd004 	sub	sp, fp, #4
   108ec:	e8bd8800 	pop	{fp, pc}

000108f0 <unused_exception_handler>:

void unused_exception_handler(struct trap_frame* tf) {
   108f0:	e92d4800 	push	{fp, lr}
   108f4:	e28db004 	add	fp, sp, #4
   108f8:	e24dd008 	sub	sp, sp, #8
   108fc:	e50b0008 	str	r0, [fp, #-8]
	dump_trap_frame(tf);
   10900:	e51b0008 	ldr	r0, [fp, #-8]
   10904:	ebffff6b 	bl	106b8 <dump_trap_frame>
	panic("ARM reserved interrupt vector called.\n"
   10908:	e3010678 	movw	r0, #5752	; 0x1678
   1090c:	e3400001 	movt	r0, #1
   10910:	eb00025a 	bl	11280 <panic>
	      "This should never happen, might be a hardware error.");
}
   10914:	e24bd004 	sub	sp, fp, #4
   10918:	e8bd8800 	pop	{fp, pc}

0001091c <irq_handler>:

void irq_handler(struct trap_frame* tf) {
   1091c:	e92d4800 	push	{fp, lr}
   10920:	e28db004 	add	fp, sp, #4
   10924:	e24dd008 	sub	sp, sp, #8
   10928:	e50b0008 	str	r0, [fp, #-8]
	//@todo
	panic("irq handler unimplemented");
   1092c:	e30106d4 	movw	r0, #5844	; 0x16d4
   10930:	e3400001 	movt	r0, #1
   10934:	eb000251 	bl	11280 <panic>
}
   10938:	e24bd004 	sub	sp, fp, #4
   1093c:	e8bd8800 	pop	{fp, pc}

00010940 <fiq_handler>:

void fiq_handler(struct trap_frame* tf) {
   10940:	e92d4800 	push	{fp, lr}
   10944:	e28db004 	add	fp, sp, #4
   10948:	e24dd008 	sub	sp, sp, #8
   1094c:	e50b0008 	str	r0, [fp, #-8]
	dump_trap_frame(tf);
   10950:	e51b0008 	ldr	r0, [fp, #-8]
   10954:	ebffff57 	bl	106b8 <dump_trap_frame>
	panic("FIQ handler called.\n"
   10958:	e30106f0 	movw	r0, #5872	; 0x16f0
   1095c:	e3400001 	movt	r0, #1
   10960:	eb000246 	bl	11280 <panic>
	      "This should never happen because we don't enable FIQ interrupts.\n");
}
   10964:	e24bd004 	sub	sp, fp, #4
   10968:	e8bd8800 	pop	{fp, pc}

0001096c <timer_init>:
// Enable IRQ interrupts from CNTPS (timer 0)
#define CNTPS_IRQ 0x01

void cprintf(char *fmt, ...);

void timer_init() {
   1096c:	e92d4800 	push	{fp, lr}
   10970:	e28db004 	add	fp, sp, #4
   10974:	e24dde11 	sub	sp, sp, #272	; 0x110
  char buf[256];
  char* test_string;
  uint lowword;
  uint highword;

  asm ("mrrc p15, 0, %0, %1, c14"
   10978:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   1097c:	e50b2008 	str	r2, [fp, #-8]
   10980:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
   10984:	e24b3e11 	sub	r3, fp, #272	; 0x110
   10988:	e1a00003 	mov	r0, r3
   1098c:	e3a01c01 	mov	r1, #256	; 0x100
   10990:	e3012748 	movw	r2, #5960	; 0x1748
   10994:	e3402001 	movt	r2, #1
   10998:	e51b3008 	ldr	r3, [fp, #-8]
   1099c:	eb000165 	bl	10f38 <sprintf>
   109a0:	e50b0010 	str	r0, [fp, #-16]
 	uart0_put_str(test_string);
   109a4:	e51b0010 	ldr	r0, [fp, #-16]
   109a8:	ebfffeec 	bl	10560 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   109ac:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   109b0:	e50b2008 	str	r2, [fp, #-8]
   109b4:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
   109b8:	e24b3e11 	sub	r3, fp, #272	; 0x110
   109bc:	e1a00003 	mov	r0, r3
   109c0:	e3a01c01 	mov	r1, #256	; 0x100
   109c4:	e3012748 	movw	r2, #5960	; 0x1748
   109c8:	e3402001 	movt	r2, #1
   109cc:	e51b3008 	ldr	r3, [fp, #-8]
   109d0:	eb000158 	bl	10f38 <sprintf>
   109d4:	e50b0010 	str	r0, [fp, #-16]
 	uart0_put_str(test_string);
   109d8:	e51b0010 	ldr	r0, [fp, #-16]
   109dc:	ebfffedf 	bl	10560 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   109e0:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   109e4:	e50b2008 	str	r2, [fp, #-8]
   109e8:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
   109ec:	e24b3e11 	sub	r3, fp, #272	; 0x110
   109f0:	e1a00003 	mov	r0, r3
   109f4:	e3a01c01 	mov	r1, #256	; 0x100
   109f8:	e3012748 	movw	r2, #5960	; 0x1748
   109fc:	e3402001 	movt	r2, #1
   10a00:	e51b3008 	ldr	r3, [fp, #-8]
   10a04:	eb00014b 	bl	10f38 <sprintf>
   10a08:	e50b0010 	str	r0, [fp, #-16]
 	uart0_put_str(test_string);
   10a0c:	e51b0010 	ldr	r0, [fp, #-16]
   10a10:	ebfffed2 	bl	10560 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10a14:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10a18:	e50b2008 	str	r2, [fp, #-8]
   10a1c:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
   10a20:	e24b3e11 	sub	r3, fp, #272	; 0x110
   10a24:	e1a00003 	mov	r0, r3
   10a28:	e3a01c01 	mov	r1, #256	; 0x100
   10a2c:	e3012748 	movw	r2, #5960	; 0x1748
   10a30:	e3402001 	movt	r2, #1
   10a34:	e51b3008 	ldr	r3, [fp, #-8]
   10a38:	eb00013e 	bl	10f38 <sprintf>
   10a3c:	e50b0010 	str	r0, [fp, #-16]
 	uart0_put_str(test_string);
   10a40:	e51b0010 	ldr	r0, [fp, #-16]
   10a44:	ebfffec5 	bl	10560 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10a48:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10a4c:	e50b2008 	str	r2, [fp, #-8]
   10a50:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
   10a54:	e24b3e11 	sub	r3, fp, #272	; 0x110
   10a58:	e1a00003 	mov	r0, r3
   10a5c:	e3a01c01 	mov	r1, #256	; 0x100
   10a60:	e3012748 	movw	r2, #5960	; 0x1748
   10a64:	e3402001 	movt	r2, #1
   10a68:	e51b3008 	ldr	r3, [fp, #-8]
   10a6c:	eb000131 	bl	10f38 <sprintf>
   10a70:	e50b0010 	str	r0, [fp, #-16]
 	uart0_put_str(test_string);
   10a74:	e51b0010 	ldr	r0, [fp, #-16]
   10a78:	ebfffeb8 	bl	10560 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10a7c:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10a80:	e50b2008 	str	r2, [fp, #-8]
   10a84:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
   10a88:	e24b3e11 	sub	r3, fp, #272	; 0x110
   10a8c:	e1a00003 	mov	r0, r3
   10a90:	e3a01c01 	mov	r1, #256	; 0x100
   10a94:	e3012748 	movw	r2, #5960	; 0x1748
   10a98:	e3402001 	movt	r2, #1
   10a9c:	e51b3008 	ldr	r3, [fp, #-8]
   10aa0:	eb000124 	bl	10f38 <sprintf>
   10aa4:	e50b0010 	str	r0, [fp, #-16]
 	uart0_put_str(test_string);
   10aa8:	e51b0010 	ldr	r0, [fp, #-16]
   10aac:	ebfffeab 	bl	10560 <uart0_put_str>

  asm ("mrrc p15, 0, %0, %1, c14"
   10ab0:	ec532f0e 	mrrc	15, 0, r2, r3, cr14
   10ab4:	e50b2008 	str	r2, [fp, #-8]
   10ab8:	e50b300c 	str	r3, [fp, #-12]
     : "=r" (lowword), "=r" (highword));
 	test_string = sprintf(buf, 256, "%d\n", lowword);
   10abc:	e24b3e11 	sub	r3, fp, #272	; 0x110
   10ac0:	e1a00003 	mov	r0, r3
   10ac4:	e3a01c01 	mov	r1, #256	; 0x100
   10ac8:	e3012748 	movw	r2, #5960	; 0x1748
   10acc:	e3402001 	movt	r2, #1
   10ad0:	e51b3008 	ldr	r3, [fp, #-8]
   10ad4:	eb000117 	bl	10f38 <sprintf>
   10ad8:	e50b0010 	str	r0, [fp, #-16]
 	uart0_put_str(test_string);
   10adc:	e51b0010 	ldr	r0, [fp, #-16]
   10ae0:	ebfffe9e 	bl	10560 <uart0_put_str>

  mmio_write(CORE0_TIMER_IRQCNTL, CNTPS_IRQ);
   10ae4:	e3a00040 	mov	r0, #64	; 0x40
   10ae8:	e3440000 	movt	r0, #16384	; 0x4000
   10aec:	e3a01001 	mov	r1, #1
   10af0:	ebfffe00 	bl	102f8 <mmio_write>
}
   10af4:	e24bd004 	sub	sp, fp, #4
   10af8:	e8bd8800 	pop	{fp, pc}

00010afc <memcpy>:
//Useful memory functions like memcpy
#include "utils.h"

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint size) {
   10afc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10b00:	e28db000 	add	fp, sp, #0
   10b04:	e24dd024 	sub	sp, sp, #36	; 0x24
   10b08:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10b0c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10b10:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10b14:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10b18:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   10b1c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10b20:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   10b24:	e51b200c 	ldr	r2, [fp, #-12]
   10b28:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10b2c:	e0823003 	add	r3, r2, r3
   10b30:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10b34:	ea000007 	b	10b58 <memcpy+0x5c>
		*dest++ = *src++;
   10b38:	e51b3008 	ldr	r3, [fp, #-8]
   10b3c:	e2832001 	add	r2, r3, #1
   10b40:	e50b2008 	str	r2, [fp, #-8]
   10b44:	e51b200c 	ldr	r2, [fp, #-12]
   10b48:	e2821001 	add	r1, r2, #1
   10b4c:	e50b100c 	str	r1, [fp, #-12]
   10b50:	e5d22000 	ldrb	r2, [r2]
   10b54:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   10b58:	e51b200c 	ldr	r2, [fp, #-12]
   10b5c:	e51b3010 	ldr	r3, [fp, #-16]
   10b60:	e1520003 	cmp	r2, r3
   10b64:	1afffff3 	bne	10b38 <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   10b68:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10b6c:	e1a00003 	mov	r0, r3
   10b70:	e24bd000 	sub	sp, fp, #0
   10b74:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10b78:	e12fff1e 	bx	lr

00010b7c <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, const void* source, uint size) {
   10b7c:	e92d4800 	push	{fp, lr}
   10b80:	e28db004 	add	fp, sp, #4
   10b84:	e24dd020 	sub	sp, sp, #32
   10b88:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10b8c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10b90:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   10b94:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10b98:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10b9c:	e1520003 	cmp	r2, r3
   10ba0:	1a000001 	bne	10bac <memmove+0x30>
		return destination;
   10ba4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10ba8:	ea000024 	b	10c40 <memmove+0xc4>
	}
	if (destination < source) {
   10bac:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   10bb0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10bb4:	e1520003 	cmp	r2, r3
   10bb8:	2a000005 	bcs	10bd4 <memmove+0x58>
		return memcpy(destination, source, size);
   10bbc:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
   10bc0:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   10bc4:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10bc8:	ebffffcb 	bl	10afc <memcpy>
   10bcc:	e1a03000 	mov	r3, r0
   10bd0:	ea00001a 	b	10c40 <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   10bd4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10bd8:	e2433001 	sub	r3, r3, #1
   10bdc:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   10be0:	e0823003 	add	r3, r2, r3
   10be4:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   10be8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10bec:	e2433001 	sub	r3, r3, #1
   10bf0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10bf4:	e0823003 	add	r3, r2, r3
   10bf8:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   10bfc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10c00:	e2433001 	sub	r3, r3, #1
   10c04:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10c08:	ea000007 	b	10c2c <memmove+0xb0>
		*dest-- = *src--;
   10c0c:	e51b3008 	ldr	r3, [fp, #-8]
   10c10:	e2432001 	sub	r2, r3, #1
   10c14:	e50b2008 	str	r2, [fp, #-8]
   10c18:	e51b200c 	ldr	r2, [fp, #-12]
   10c1c:	e2421001 	sub	r1, r2, #1
   10c20:	e50b100c 	str	r1, [fp, #-12]
   10c24:	e5d22000 	ldrb	r2, [r2]
   10c28:	e5c32000 	strb	r2, [r3]
		return memcpy(destination, source, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   10c2c:	e51b200c 	ldr	r2, [fp, #-12]
   10c30:	e51b3010 	ldr	r3, [fp, #-16]
   10c34:	e1520003 	cmp	r2, r3
   10c38:	1afffff3 	bne	10c0c <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   10c3c:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10c40:	e1a00003 	mov	r0, r3
   10c44:	e24bd004 	sub	sp, fp, #4
   10c48:	e8bd8800 	pop	{fp, pc}

00010c4c <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
   10c4c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10c50:	e28db000 	add	fp, sp, #0
   10c54:	e24dd024 	sub	sp, sp, #36	; 0x24
   10c58:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10c5c:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   10c60:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10c64:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10c68:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   10c6c:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10c70:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   10c74:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10c78:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10c7c:	ea000007 	b	10ca0 <memcpy_region+0x54>
		*dest++ = *src++;
   10c80:	e51b3008 	ldr	r3, [fp, #-8]
   10c84:	e2832001 	add	r2, r3, #1
   10c88:	e50b2008 	str	r2, [fp, #-8]
   10c8c:	e51b200c 	ldr	r2, [fp, #-12]
   10c90:	e2821001 	add	r1, r2, #1
   10c94:	e50b100c 	str	r1, [fp, #-12]
   10c98:	e5d22000 	ldrb	r2, [r2]
   10c9c:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   10ca0:	e51b200c 	ldr	r2, [fp, #-12]
   10ca4:	e51b3010 	ldr	r3, [fp, #-16]
   10ca8:	e1520003 	cmp	r2, r3
   10cac:	1afffff3 	bne	10c80 <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   10cb0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10cb4:	e1a00003 	mov	r0, r3
   10cb8:	e24bd000 	sub	sp, fp, #0
   10cbc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10cc0:	e12fff1e 	bx	lr

00010cc4 <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* destination, const void* source_start, const void* source_end) {
   10cc4:	e92d4800 	push	{fp, lr}
   10cc8:	e28db004 	add	fp, sp, #4
   10ccc:	e24dd010 	sub	sp, sp, #16
   10cd0:	e50b0008 	str	r0, [fp, #-8]
   10cd4:	e50b100c 	str	r1, [fp, #-12]
   10cd8:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   10cdc:	e51b2010 	ldr	r2, [fp, #-16]
   10ce0:	e51b300c 	ldr	r3, [fp, #-12]
   10ce4:	e0633002 	rsb	r3, r3, r2
   10ce8:	e51b0008 	ldr	r0, [fp, #-8]
   10cec:	e51b100c 	ldr	r1, [fp, #-12]
   10cf0:	e1a02003 	mov	r2, r3
   10cf4:	ebffffa0 	bl	10b7c <memmove>
   10cf8:	e1a03000 	mov	r3, r0
}
   10cfc:	e1a00003 	mov	r0, r3
   10d00:	e24bd004 	sub	sp, fp, #4
   10d04:	e8bd8800 	pop	{fp, pc}

00010d08 <strcpy>:

//Copy null terminated source into destination which is at least dest_size in length
//dest_size includes the space for the null terminator
char* strcpy(char* destination, const char* source, uint dest_size) {
   10d08:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10d0c:	e28db000 	add	fp, sp, #0
   10d10:	e24dd01c 	sub	sp, sp, #28
   10d14:	e50b0010 	str	r0, [fp, #-16]
   10d18:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10d1c:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
	if (dest_size < 1) {
   10d20:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10d24:	e3530000 	cmp	r3, #0
   10d28:	1a000001 	bne	10d34 <strcpy+0x2c>
		return nullptr;
   10d2c:	e3a03000 	mov	r3, #0
   10d30:	ea000019 	b	10d9c <strcpy+0x94>
	}
	char* dest_end = destination + dest_size - 1;
   10d34:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10d38:	e2433001 	sub	r3, r3, #1
   10d3c:	e51b2010 	ldr	r2, [fp, #-16]
   10d40:	e0823003 	add	r3, r2, r3
   10d44:	e50b3008 	str	r3, [fp, #-8]
	while (*source
   10d48:	ea000007 	b	10d6c <strcpy+0x64>
	       && destination != dest_end) {
		*destination++ = *source++;
   10d4c:	e51b3010 	ldr	r3, [fp, #-16]
   10d50:	e2832001 	add	r2, r3, #1
   10d54:	e50b2010 	str	r2, [fp, #-16]
   10d58:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   10d5c:	e2821001 	add	r1, r2, #1
   10d60:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10d64:	e5d22000 	ldrb	r2, [r2]
   10d68:	e5c32000 	strb	r2, [r3]
char* strcpy(char* destination, const char* source, uint dest_size) {
	if (dest_size < 1) {
		return nullptr;
	}
	char* dest_end = destination + dest_size - 1;
	while (*source
   10d6c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10d70:	e5d33000 	ldrb	r3, [r3]
   10d74:	e3530000 	cmp	r3, #0
   10d78:	0a000003 	beq	10d8c <strcpy+0x84>
	       && destination != dest_end) {
   10d7c:	e51b2010 	ldr	r2, [fp, #-16]
   10d80:	e51b3008 	ldr	r3, [fp, #-8]
   10d84:	e1520003 	cmp	r2, r3
   10d88:	1affffef 	bne	10d4c <strcpy+0x44>
		*destination++ = *source++;
	}
	*destination = 0;
   10d8c:	e51b3010 	ldr	r3, [fp, #-16]
   10d90:	e3a02000 	mov	r2, #0
   10d94:	e5c32000 	strb	r2, [r3]
	return destination;
   10d98:	e51b3010 	ldr	r3, [fp, #-16]
}
   10d9c:	e1a00003 	mov	r0, r3
   10da0:	e24bd000 	sub	sp, fp, #0
   10da4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10da8:	e12fff1e 	bx	lr

00010dac <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   10dac:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10db0:	e28db000 	add	fp, sp, #0
   10db4:	e24dd014 	sub	sp, sp, #20
   10db8:	e50b0010 	str	r0, [fp, #-16]
   10dbc:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   10dc0:	e51b3010 	ldr	r3, [fp, #-16]
   10dc4:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   10dc8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10dcc:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   10dd0:	ea000004 	b	10de8 <zero_region+0x3c>
		*start++ = 0;
   10dd4:	e51b3008 	ldr	r3, [fp, #-8]
   10dd8:	e2832001 	add	r2, r3, #1
   10ddc:	e50b2008 	str	r2, [fp, #-8]
   10de0:	e3a02000 	mov	r2, #0
   10de4:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   10de8:	e51b2008 	ldr	r2, [fp, #-8]
   10dec:	e51b300c 	ldr	r3, [fp, #-12]
   10df0:	e1520003 	cmp	r2, r3
   10df4:	1afffff6 	bne	10dd4 <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   10df8:	e51b3010 	ldr	r3, [fp, #-16]
}
   10dfc:	e1a00003 	mov	r0, r3
   10e00:	e24bd000 	sub	sp, fp, #0
   10e04:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10e08:	e12fff1e 	bx	lr

00010e0c <write_uint>:

//sprintf helper for writing unsigned ints
//returns false if buf is full
static char* write_uint(char* buf, char* buf_end, uint base, uint num) {
   10e0c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10e10:	e28db000 	add	fp, sp, #0
   10e14:	e24dd02c 	sub	sp, sp, #44	; 0x2c
   10e18:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
   10e1c:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
   10e20:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e24:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
   10e28:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10e2c:	e3530000 	cmp	r3, #0
   10e30:	0a000022 	beq	10ec0 <write_uint+0xb4>
		uint idigit = 11;
   10e34:	e3a0300b 	mov	r3, #11
   10e38:	e50b300c 	str	r3, [fp, #-12]
		while (num) {
   10e3c:	ea000017 	b	10ea0 <write_uint+0x94>
			uint digit = num % base;
   10e40:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10e44:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10e48:	e732f213 	udiv	r2, r3, r2
   10e4c:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
   10e50:	e0020291 	mul	r2, r1, r2
   10e54:	e0623003 	rsb	r3, r2, r3
   10e58:	e50b3010 	str	r3, [fp, #-16]
			idigit--;
   10e5c:	e51b300c 	ldr	r3, [fp, #-12]
   10e60:	e2433001 	sub	r3, r3, #1
   10e64:	e50b300c 	str	r3, [fp, #-12]
			num_buffer[idigit] = digits[digit];
   10e68:	e301374c 	movw	r3, #5964	; 0x174c
   10e6c:	e3403001 	movt	r3, #1
   10e70:	e51b2010 	ldr	r2, [fp, #-16]
   10e74:	e0833002 	add	r3, r3, r2
   10e78:	e5d31000 	ldrb	r1, [r3]
   10e7c:	e24b201c 	sub	r2, fp, #28
   10e80:	e51b300c 	ldr	r3, [fp, #-12]
   10e84:	e0823003 	add	r3, r2, r3
   10e88:	e1a02001 	mov	r2, r1
   10e8c:	e5c32000 	strb	r2, [r3]
			num /= base;
   10e90:	e51b202c 	ldr	r2, [fp, #-44]	; 0xffffffd4
   10e94:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e98:	e733f312 	udiv	r3, r2, r3
   10e9c:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
		uint idigit = 11;
		while (num) {
   10ea0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10ea4:	e3530000 	cmp	r3, #0
   10ea8:	1affffe4 	bne	10e40 <write_uint+0x34>
			uint digit = num % base;
			idigit--;
			num_buffer[idigit] = digits[digit];
			num /= base;
		}
		first_digit = &num_buffer[idigit];
   10eac:	e24b201c 	sub	r2, fp, #28
   10eb0:	e51b300c 	ldr	r3, [fp, #-12]
   10eb4:	e0823003 	add	r3, r2, r3
   10eb8:	e50b3008 	str	r3, [fp, #-8]
   10ebc:	ea000004 	b	10ed4 <write_uint+0xc8>
	} else {
		num_buffer[10] = '0';
   10ec0:	e3a03030 	mov	r3, #48	; 0x30
   10ec4:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
		first_digit = &num_buffer[10];
   10ec8:	e24b301c 	sub	r3, fp, #28
   10ecc:	e283300a 	add	r3, r3, #10
   10ed0:	e50b3008 	str	r3, [fp, #-8]
	}
	while (first_digit != &num_buffer[11]) {
   10ed4:	ea00000d 	b	10f10 <write_uint+0x104>
		*buf++ = *first_digit++;
   10ed8:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10edc:	e2832001 	add	r2, r3, #1
   10ee0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
   10ee4:	e51b2008 	ldr	r2, [fp, #-8]
   10ee8:	e2821001 	add	r1, r2, #1
   10eec:	e50b1008 	str	r1, [fp, #-8]
   10ef0:	e5d22000 	ldrb	r2, [r2]
   10ef4:	e5c32000 	strb	r2, [r3]
		if (buf == buf_end) {
   10ef8:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10efc:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
   10f00:	e1520003 	cmp	r2, r3
   10f04:	1a000001 	bne	10f10 <write_uint+0x104>
			return buf;
   10f08:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10f0c:	ea000005 	b	10f28 <write_uint+0x11c>
		first_digit = &num_buffer[idigit];
	} else {
		num_buffer[10] = '0';
		first_digit = &num_buffer[10];
	}
	while (first_digit != &num_buffer[11]) {
   10f10:	e24b301c 	sub	r3, fp, #28
   10f14:	e283300b 	add	r3, r3, #11
   10f18:	e51b2008 	ldr	r2, [fp, #-8]
   10f1c:	e1520003 	cmp	r2, r3
   10f20:	1affffec 	bne	10ed8 <write_uint+0xcc>
		*buf++ = *first_digit++;
		if (buf == buf_end) {
			return buf;
		}
	}
	return buf;
   10f24:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
   10f28:	e1a00003 	mov	r0, r3
   10f2c:	e24bd000 	sub	sp, fp, #0
   10f30:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10f34:	e12fff1e 	bx	lr

00010f38 <sprintf>:

//C standard library function sprintf with buffer size specified
char* sprintf(char* buf, uint buf_size, const char* fmt, ...) {
   10f38:	e92d000c 	push	{r2, r3}
   10f3c:	e92d4800 	push	{fp, lr}
   10f40:	e28db004 	add	fp, sp, #4
   10f44:	e24dd008 	sub	sp, sp, #8
   10f48:	e50b0008 	str	r0, [fp, #-8]
   10f4c:	e50b100c 	str	r1, [fp, #-12]
	return sprintf_no_var_args(buf, buf_size, &fmt);
   10f50:	e51b0008 	ldr	r0, [fp, #-8]
   10f54:	e51b100c 	ldr	r1, [fp, #-12]
   10f58:	e28b3004 	add	r3, fp, #4
   10f5c:	e1a02003 	mov	r2, r3
   10f60:	eb000005 	bl	10f7c <sprintf_no_var_args>
   10f64:	e1a03000 	mov	r3, r0
}
   10f68:	e1a00003 	mov	r0, r3
   10f6c:	e24bd004 	sub	sp, fp, #4
   10f70:	e8bd4800 	pop	{fp, lr}
   10f74:	e28dd008 	add	sp, sp, #8
   10f78:	e12fff1e 	bx	lr

00010f7c <sprintf_no_var_args>:

//C standard library function sprintf with buffer size specified
//This version can be called from within a var args function without pushing the arguments again
char* sprintf_no_var_args(char* buf, uint buf_size, const char** fmt_addr) {
   10f7c:	e92d4800 	push	{fp, lr}
   10f80:	e28db004 	add	fp, sp, #4
   10f84:	e24dd030 	sub	sp, sp, #48	; 0x30
   10f88:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
   10f8c:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
   10f90:	e50b2030 	str	r2, [fp, #-48]	; 0xffffffd0
	char* fmt = *fmt_addr;
   10f94:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
   10f98:	e5933000 	ldr	r3, [r3]
   10f9c:	e50b3008 	str	r3, [fp, #-8]
	if (!buf || !fmt || buf_size < 1) {
   10fa0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10fa4:	e3530000 	cmp	r3, #0
   10fa8:	0a000005 	beq	10fc4 <sprintf_no_var_args+0x48>
   10fac:	e51b3008 	ldr	r3, [fp, #-8]
   10fb0:	e3530000 	cmp	r3, #0
   10fb4:	0a000002 	beq	10fc4 <sprintf_no_var_args+0x48>
   10fb8:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10fbc:	e3530000 	cmp	r3, #0
   10fc0:	1a000001 	bne	10fcc <sprintf_no_var_args+0x50>
		return nullptr; //Need at least space for null terminator
   10fc4:	e3a03000 	mov	r3, #0
   10fc8:	ea0000a9 	b	11274 <sprintf_no_var_args+0x2f8>
	}
	char* buf_start = buf;
   10fcc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10fd0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
   10fd4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10fd8:	e2433001 	sub	r3, r3, #1
   10fdc:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10fe0:	e0823003 	add	r3, r2, r3
   10fe4:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
	uint* var_args = (uint*)fmt_addr + 1;
   10fe8:	e51b3030 	ldr	r3, [fp, #-48]	; 0xffffffd0
   10fec:	e2833004 	add	r3, r3, #4
   10ff0:	e50b300c 	str	r3, [fp, #-12]

	while (buf != buf_end
   10ff4:	ea000092 	b	11244 <sprintf_no_var_args+0x2c8>
	       && *fmt) {
		if (*fmt != '%') {
   10ff8:	e51b3008 	ldr	r3, [fp, #-8]
   10ffc:	e5d33000 	ldrb	r3, [r3]
   11000:	e3530025 	cmp	r3, #37	; 0x25
   11004:	0a000008 	beq	1102c <sprintf_no_var_args+0xb0>
			*buf++ = *fmt++;
   11008:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   1100c:	e2832001 	add	r2, r3, #1
   11010:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   11014:	e51b2008 	ldr	r2, [fp, #-8]
   11018:	e2821001 	add	r1, r2, #1
   1101c:	e50b1008 	str	r1, [fp, #-8]
   11020:	e5d22000 	ldrb	r2, [r2]
   11024:	e5c32000 	strb	r2, [r3]
   11028:	ea000085 	b	11244 <sprintf_no_var_args+0x2c8>
		} else {
			fmt++;
   1102c:	e51b3008 	ldr	r3, [fp, #-8]
   11030:	e2833001 	add	r3, r3, #1
   11034:	e50b3008 	str	r3, [fp, #-8]
			switch (*fmt) {
   11038:	e51b3008 	ldr	r3, [fp, #-8]
   1103c:	e5d33000 	ldrb	r3, [r3]
   11040:	e3530058 	cmp	r3, #88	; 0x58
   11044:	0a000039 	beq	11130 <sprintf_no_var_args+0x1b4>
   11048:	e3530058 	cmp	r3, #88	; 0x58
   1104c:	ca00000b 	bgt	11080 <sprintf_no_var_args+0x104>
   11050:	e3530044 	cmp	r3, #68	; 0x44
   11054:	0a000017 	beq	110b8 <sprintf_no_var_args+0x13c>
   11058:	e3530044 	cmp	r3, #68	; 0x44
   1105c:	ca000002 	bgt	1106c <sprintf_no_var_args+0xf0>
   11060:	e3530000 	cmp	r3, #0
   11064:	0a000011 	beq	110b0 <sprintf_no_var_args+0x134>
   11068:	ea000060 	b	111f0 <sprintf_no_var_args+0x274>
   1106c:	e3530053 	cmp	r3, #83	; 0x53
   11070:	0a000046 	beq	11190 <sprintf_no_var_args+0x214>
   11074:	e3530055 	cmp	r3, #85	; 0x55
   11078:	0a000038 	beq	11160 <sprintf_no_var_args+0x1e4>
   1107c:	ea00005b 	b	111f0 <sprintf_no_var_args+0x274>
   11080:	e3530073 	cmp	r3, #115	; 0x73
   11084:	0a000041 	beq	11190 <sprintf_no_var_args+0x214>
   11088:	e3530073 	cmp	r3, #115	; 0x73
   1108c:	ca000002 	bgt	1109c <sprintf_no_var_args+0x120>
   11090:	e3530064 	cmp	r3, #100	; 0x64
   11094:	0a000007 	beq	110b8 <sprintf_no_var_args+0x13c>
   11098:	ea000054 	b	111f0 <sprintf_no_var_args+0x274>
   1109c:	e3530075 	cmp	r3, #117	; 0x75
   110a0:	0a00002e 	beq	11160 <sprintf_no_var_args+0x1e4>
   110a4:	e3530078 	cmp	r3, #120	; 0x78
   110a8:	0a000020 	beq	11130 <sprintf_no_var_args+0x1b4>
   110ac:	ea00004f 	b	111f0 <sprintf_no_var_args+0x274>
			case 0:
				return buf_start;
   110b0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   110b4:	ea00006e 	b	11274 <sprintf_no_var_args+0x2f8>
			case 'd':
			case 'D':
				{
					int num = *(int*)var_args;
   110b8:	e51b300c 	ldr	r3, [fp, #-12]
   110bc:	e5933000 	ldr	r3, [r3]
   110c0:	e50b3010 	str	r3, [fp, #-16]
					var_args++;
   110c4:	e51b300c 	ldr	r3, [fp, #-12]
   110c8:	e2833004 	add	r3, r3, #4
   110cc:	e50b300c 	str	r3, [fp, #-12]
					if (num < 0) {
   110d0:	e51b3010 	ldr	r3, [fp, #-16]
   110d4:	e3530000 	cmp	r3, #0
   110d8:	aa00000d 	bge	11114 <sprintf_no_var_args+0x198>
						*buf++ = '-';
   110dc:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   110e0:	e2832001 	add	r2, r3, #1
   110e4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   110e8:	e3a0202d 	mov	r2, #45	; 0x2d
   110ec:	e5c32000 	strb	r2, [r3]
						if (buf == buf_end) {
   110f0:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   110f4:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   110f8:	e1520003 	cmp	r2, r3
   110fc:	1a000001 	bne	11108 <sprintf_no_var_args+0x18c>
							return buf_start;
   11100:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   11104:	ea00005a 	b	11274 <sprintf_no_var_args+0x2f8>
						}
						num = -num;
   11108:	e51b3010 	ldr	r3, [fp, #-16]
   1110c:	e2633000 	rsb	r3, r3, #0
   11110:	e50b3010 	str	r3, [fp, #-16]
					}
					buf = write_uint(buf, buf_end, 10, (uint)num);
   11114:	e51b3010 	ldr	r3, [fp, #-16]
   11118:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   1111c:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   11120:	e3a0200a 	mov	r2, #10
   11124:	ebffff38 	bl	10e0c <write_uint>
   11128:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   1112c:	ea000041 	b	11238 <sprintf_no_var_args+0x2bc>
				}
			case 'x':
			case 'X':
				{
					uint num = *var_args++;
   11130:	e51b300c 	ldr	r3, [fp, #-12]
   11134:	e2832004 	add	r2, r3, #4
   11138:	e50b200c 	str	r2, [fp, #-12]
   1113c:	e5933000 	ldr	r3, [r3]
   11140:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
					buf = write_uint(buf, buf_end, 16, num);
   11144:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   11148:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   1114c:	e3a02010 	mov	r2, #16
   11150:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   11154:	ebffff2c 	bl	10e0c <write_uint>
   11158:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   1115c:	ea000035 	b	11238 <sprintf_no_var_args+0x2bc>
				}
			case 'u':
			case 'U':
				{
					uint num = *var_args++;
   11160:	e51b300c 	ldr	r3, [fp, #-12]
   11164:	e2832004 	add	r2, r3, #4
   11168:	e50b200c 	str	r2, [fp, #-12]
   1116c:	e5933000 	ldr	r3, [r3]
   11170:	e50b3024 	str	r3, [fp, #-36]	; 0xffffffdc
					buf = write_uint(buf, buf_end, 10, num);
   11174:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   11178:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   1117c:	e3a0200a 	mov	r2, #10
   11180:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
   11184:	ebffff20 	bl	10e0c <write_uint>
   11188:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   1118c:	ea000029 	b	11238 <sprintf_no_var_args+0x2bc>
				}
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
   11190:	e51b300c 	ldr	r3, [fp, #-12]
   11194:	e5933000 	ldr	r3, [r3]
   11198:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
					var_args++;
   1119c:	e51b300c 	ldr	r3, [fp, #-12]
   111a0:	e2833004 	add	r3, r3, #4
   111a4:	e50b300c 	str	r3, [fp, #-12]
					while (*insert
   111a8:	ea000007 	b	111cc <sprintf_no_var_args+0x250>
					       && buf != buf_end) {
						*buf++ = *insert++;
   111ac:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   111b0:	e2832001 	add	r2, r3, #1
   111b4:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   111b8:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   111bc:	e2821001 	add	r1, r2, #1
   111c0:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   111c4:	e5d22000 	ldrb	r2, [r2]
   111c8:	e5c32000 	strb	r2, [r3]
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
					var_args++;
					while (*insert
   111cc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   111d0:	e5d33000 	ldrb	r3, [r3]
   111d4:	e3530000 	cmp	r3, #0
   111d8:	0a000003 	beq	111ec <sprintf_no_var_args+0x270>
					       && buf != buf_end) {
   111dc:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   111e0:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   111e4:	e1520003 	cmp	r2, r3
   111e8:	1affffef 	bne	111ac <sprintf_no_var_args+0x230>
						*buf++ = *insert++;
					}
					break;
   111ec:	ea000011 	b	11238 <sprintf_no_var_args+0x2bc>
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
   11208:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1120c:	e1520003 	cmp	r2, r3
   11210:	1a000001 	bne	1121c <sprintf_no_var_args+0x2a0>
					return buf_start;
   11214:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   11218:	ea000015 	b	11274 <sprintf_no_var_args+0x2f8>
				}
				*buf++ = *fmt;
   1121c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   11220:	e2832001 	add	r2, r3, #1
   11224:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   11228:	e51b2008 	ldr	r2, [fp, #-8]
   1122c:	e5d22000 	ldrb	r2, [r2]
   11230:	e5c32000 	strb	r2, [r3]
				break;
   11234:	e1a00000 	nop			; (mov r0, r0)
			}
			fmt++;
   11238:	e51b3008 	ldr	r3, [fp, #-8]
   1123c:	e2833001 	add	r3, r3, #1
   11240:	e50b3008 	str	r3, [fp, #-8]
	}
	char* buf_start = buf;
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
	uint* var_args = (uint*)fmt_addr + 1;

	while (buf != buf_end
   11244:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   11248:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1124c:	e1520003 	cmp	r2, r3
   11250:	0a000003 	beq	11264 <sprintf_no_var_args+0x2e8>
	       && *fmt) {
   11254:	e51b3008 	ldr	r3, [fp, #-8]
   11258:	e5d33000 	ldrb	r3, [r3]
   1125c:	e3530000 	cmp	r3, #0
   11260:	1affff64 	bne	10ff8 <sprintf_no_var_args+0x7c>
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
   11270:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   11274:	e1a00003 	mov	r0, r3
   11278:	e24bd004 	sub	sp, fp, #4
   1127c:	e8bd8800 	pop	{fp, pc}

00011280 <panic>:
//Panic function along with the function called when an assert is triggered
#include "utils.h"
#include "mem_mapped_io.h" //For UART

void panic(char* msg) {
   11280:	e92d4800 	push	{fp, lr}
   11284:	e28db004 	add	fp, sp, #4
   11288:	e24dd008 	sub	sp, sp, #8
   1128c:	e50b0008 	str	r0, [fp, #-8]
	static const char panic_msg_start[] = "panic: ";
	cprintf("Panic'd: %s", msg);
   11290:	e3010760 	movw	r0, #5984	; 0x1760
   11294:	e3400001 	movt	r0, #1
   11298:	e51b1008 	ldr	r1, [fp, #-8]
   1129c:	eb00006b 	bl	11450 <cprintf>
	while (true) {}
   112a0:	eafffffe 	b	112a0 <panic+0x20>

000112a4 <trigger_assert>:
}

void trigger_assert(const char* expr_str, const char* file_name, uint line_number, const char* func_name) {
   112a4:	e92d4800 	push	{fp, lr}
   112a8:	e28db004 	add	fp, sp, #4
   112ac:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   112b0:	e24dd020 	sub	sp, sp, #32
   112b4:	e24bca01 	sub	ip, fp, #4096	; 0x1000
   112b8:	e24cc004 	sub	ip, ip, #4
   112bc:	e50c0004 	str	r0, [ip, #-4]
   112c0:	e24b0a01 	sub	r0, fp, #4096	; 0x1000
   112c4:	e2400004 	sub	r0, r0, #4
   112c8:	e5001008 	str	r1, [r0, #-8]
   112cc:	e24b1a01 	sub	r1, fp, #4096	; 0x1000
   112d0:	e2411004 	sub	r1, r1, #4
   112d4:	e501200c 	str	r2, [r1, #-12]
   112d8:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   112dc:	e2422004 	sub	r2, r2, #4
   112e0:	e5023010 	str	r3, [r2, #-16]
	char msg[4096];
	sprintf(msg,
   112e4:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   112e8:	e2422004 	sub	r2, r2, #4
   112ec:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   112f0:	e2433004 	sub	r3, r3, #4
   112f4:	e1a0c003 	mov	ip, r3
   112f8:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   112fc:	e2433004 	sub	r3, r3, #4
   11300:	e5133008 	ldr	r3, [r3, #-8]
   11304:	e58d3000 	str	r3, [sp]
   11308:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   1130c:	e2433004 	sub	r3, r3, #4
   11310:	e513300c 	ldr	r3, [r3, #-12]
   11314:	e58d3004 	str	r3, [sp, #4]
   11318:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   1131c:	e2433004 	sub	r3, r3, #4
   11320:	e5133010 	ldr	r3, [r3, #-16]
   11324:	e58d3008 	str	r3, [sp, #8]
   11328:	e1a00002 	mov	r0, r2
   1132c:	e3a01a01 	mov	r1, #4096	; 0x1000
   11330:	e301276c 	movw	r2, #5996	; 0x176c
   11334:	e3402001 	movt	r2, #1
   11338:	e51c3004 	ldr	r3, [ip, #-4]
   1133c:	ebfffefd 	bl	10f38 <sprintf>
	        "Assertion triggered\nExpression %s\nFile %s\nLine %u\nFunction %s\n",
	        expr_str,
	        file_name,
	        line_number,
	        func_name);
	panic(msg);
   11340:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   11344:	e2433004 	sub	r3, r3, #4
   11348:	e1a00003 	mov	r0, r3
   1134c:	ebffffcb 	bl	11280 <panic>
}
   11350:	e24bd004 	sub	sp, fp, #4
   11354:	e8bd8800 	pop	{fp, pc}

00011358 <get_cpsr>:
//Helpful arm assembly intrinsics
#include "arm.h"

uint get_cpsr() {
   11358:	e92d0810 	push	{r4, fp}
   1135c:	e28db004 	add	fp, sp, #4
	register uint cur_cpsr; //Status flags including privelege level
	asm volatile ("mrs %[cpsr_out], cpsr"
   11360:	e10f3000 	mrs	r3, CPSR
   11364:	e1a04003 	mov	r4, r3
	              : [cpsr_out] "=r" (cur_cpsr));
	return cur_cpsr;
   11368:	e1a03004 	mov	r3, r4
}
   1136c:	e1a00003 	mov	r0, r3
   11370:	e24bd004 	sub	sp, fp, #4
   11374:	e8bd0810 	pop	{r4, fp}
   11378:	e12fff1e 	bx	lr

0001137c <set_cpsr>:

void set_cpsr(uint new_cpsr) {
   1137c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   11380:	e28db000 	add	fp, sp, #0
   11384:	e24dd00c 	sub	sp, sp, #12
   11388:	e50b0008 	str	r0, [fp, #-8]
	asm volatile ("msr cpsr_cxsf, %[cpsr_in]"
   1138c:	e51b3008 	ldr	r3, [fp, #-8]
   11390:	e12ff003 	msr	CPSR_fsxc, r3
	              : //No output
	              : [cpsr_in] "r" (new_cpsr));
}
   11394:	e24bd000 	sub	sp, fp, #0
   11398:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1139c:	e12fff1e 	bx	lr

000113a0 <set_operating_mode>:

//Set the current processor operating mode,
//mode_bit should be one of the PSR mode defines in arm.h
void set_operating_mode(uint mode_bit) {
   113a0:	e92d4810 	push	{r4, fp, lr}
   113a4:	e28db008 	add	fp, sp, #8
   113a8:	e24dd00c 	sub	sp, sp, #12
   113ac:	e50b0010 	str	r0, [fp, #-16]
	register uint cur_cpsr = get_cpsr();
   113b0:	ebffffe8 	bl	11358 <get_cpsr>
   113b4:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr & (~PSR_MODE_MASK | mode_bit);
   113b8:	e51b3010 	ldr	r3, [fp, #-16]
   113bc:	e1e03d83 	mvn	r3, r3, lsl #27
   113c0:	e1e03da3 	mvn	r3, r3, lsr #27
   113c4:	e0044003 	and	r4, r4, r3
	set_cpsr(cur_cpsr);
   113c8:	e1a00004 	mov	r0, r4
   113cc:	ebffffea 	bl	1137c <set_cpsr>
}
   113d0:	e24bd008 	sub	sp, fp, #8
   113d4:	e8bd8810 	pop	{r4, fp, pc}

000113d8 <enable_irq_interrupts>:

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void enable_irq_interrupts() {
   113d8:	e92d4818 	push	{r3, r4, fp, lr}
   113dc:	e28db00c 	add	fp, sp, #12
	register uint cur_cpsr = get_cpsr();
   113e0:	ebffffdc 	bl	11358 <get_cpsr>
   113e4:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr & ~PSR_IRQ_INTERRUPT_DISABLE;
   113e8:	e3c44080 	bic	r4, r4, #128	; 0x80
	set_cpsr(cur_cpsr);
   113ec:	e1a00004 	mov	r0, r4
   113f0:	ebffffe1 	bl	1137c <set_cpsr>
}
   113f4:	e8bd8818 	pop	{r3, r4, fp, pc}

000113f8 <disable_irq_interrupts>:

//Enable IRQ interrupts
//ARM uses a disable flag so we clear it
void disable_irq_interrupts() {
   113f8:	e92d4818 	push	{r3, r4, fp, lr}
   113fc:	e28db00c 	add	fp, sp, #12
	register uint cur_cpsr = get_cpsr();
   11400:	ebffffd4 	bl	11358 <get_cpsr>
   11404:	e1a04000 	mov	r4, r0
	cur_cpsr = cur_cpsr | PSR_IRQ_INTERRUPT_DISABLE;
   11408:	e3844080 	orr	r4, r4, #128	; 0x80
	set_cpsr(cur_cpsr);
   1140c:	e1a00004 	mov	r0, r4
   11410:	ebffffd9 	bl	1137c <set_cpsr>
}
   11414:	e8bd8818 	pop	{r3, r4, fp, pc}

00011418 <get_data_fault_addr>:

uint get_data_fault_addr() {
   11418:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1141c:	e28db000 	add	fp, sp, #0
	register uint dfar;
	asm volatile ("mrc p15, 0, %[dfar_out] c6, c0, 0"
	              : [dfar_out] "=r" (dfar));
	return dfar;
	#endif
	return 0;
   11420:	e3a03000 	mov	r3, #0
}
   11424:	e1a00003 	mov	r0, r3
   11428:	e24bd000 	sub	sp, fp, #0
   1142c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   11430:	e12fff1e 	bx	lr

00011434 <get_data_fault_status>:

uint get_data_fault_status() {
   11434:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   11438:	e28db000 	add	fp, sp, #0
	register uint dfsr;
	asm volatile ("mrc p15, 0, %[dfsr_out], c5, c0, 0"
	              : [dfsr_out] "=r" (dfsr));
	return dfsr;
	#endif
	return 0;
   1143c:	e3a03000 	mov	r3, #0
}
   11440:	e1a00003 	mov	r0, r3
   11444:	e24bd000 	sub	sp, fp, #0
   11448:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1144c:	e12fff1e 	bx	lr

00011450 <cprintf>:
#include "mem_mapped_io.h"
#include "utils.h"

//Formated printf-like print to the console
//Understands everything that sprintf does
void cprintf(const char *fmt, ...) {
   11450:	e92d000f 	push	{r0, r1, r2, r3}
   11454:	e92d4800 	push	{fp, lr}
   11458:	e28db004 	add	fp, sp, #4
   1145c:	e24ddb01 	sub	sp, sp, #1024	; 0x400
	if (fmt) {
   11460:	e59b3004 	ldr	r3, [fp, #4]
   11464:	e3530000 	cmp	r3, #0
   11468:	0a00000a 	beq	11498 <cprintf+0x48>
		char buf[1024];
		uart0_put_str(sprintf_no_var_args(buf, 1024, &fmt));
   1146c:	e24b3b01 	sub	r3, fp, #1024	; 0x400
   11470:	e2433004 	sub	r3, r3, #4
   11474:	e1a00003 	mov	r0, r3
   11478:	e3a01b01 	mov	r1, #1024	; 0x400
   1147c:	e28b3004 	add	r3, fp, #4
   11480:	e1a02003 	mov	r2, r3
   11484:	ebfffebc 	bl	10f7c <sprintf_no_var_args>
   11488:	e1a03000 	mov	r3, r0
   1148c:	e1a00003 	mov	r0, r3
   11490:	ebfffc32 	bl	10560 <uart0_put_str>
   11494:	ea000002 	b	114a4 <cprintf+0x54>
	} else {
		panic("null fmt passed to cprintf");
   11498:	e30107b4 	movw	r0, #6068	; 0x17b4
   1149c:	e3400001 	movt	r0, #1
   114a0:	ebffff76 	bl	11280 <panic>
	}
}
   114a4:	e24bd004 	sub	sp, fp, #4
   114a8:	e8bd4800 	pop	{fp, lr}
   114ac:	e28dd010 	add	sp, sp, #16
   114b0:	e12fff1e 	bx	lr

000114b4 <sys_test>:
#include "types.h"
#include "console.h"
#include "syscall.h"
#include "utils.h"

int sys_test() {
   114b4:	e92d4800 	push	{fp, lr}
   114b8:	e28db004 	add	fp, sp, #4
	cprintf("Called sys test\n");
   114bc:	e30107d0 	movw	r0, #6096	; 0x17d0
   114c0:	e3400001 	movt	r0, #1
   114c4:	ebffffe1 	bl	11450 <cprintf>
	return 0;
   114c8:	e3a03000 	mov	r3, #0
}
   114cc:	e1a00003 	mov	r0, r3
   114d0:	e8bd8800 	pop	{fp, pc}

000114d4 <syscall>:

static syscall_t syscalls[] = {
[SYS_test] sys_test
};

void syscall(uint syscall_id) {
   114d4:	e92d4800 	push	{fp, lr}
   114d8:	e28db004 	add	fp, sp, #4
   114dc:	e24dd008 	sub	sp, sp, #8
   114e0:	e50b0008 	str	r0, [fp, #-8]
	if (syscall_id < array_len(syscalls)) {
   114e4:	e51b3008 	ldr	r3, [fp, #-8]
   114e8:	e3530001 	cmp	r3, #1
   114ec:	8a000009 	bhi	11518 <syscall+0x44>
		cprintf("Calling %u syscall.\n", syscall_id);
   114f0:	e30107e4 	movw	r0, #6116	; 0x17e4
   114f4:	e3400001 	movt	r0, #1
   114f8:	e51b1008 	ldr	r1, [fp, #-8]
   114fc:	ebffffd3 	bl	11450 <cprintf>
		syscalls[syscall_id]();
   11500:	e3013814 	movw	r3, #6164	; 0x1814
   11504:	e3403001 	movt	r3, #1
   11508:	e51b2008 	ldr	r2, [fp, #-8]
   1150c:	e7933102 	ldr	r3, [r3, r2, lsl #2]
   11510:	e12fff33 	blx	r3
   11514:	ea000003 	b	11528 <syscall+0x54>
	} else {
		cprintf("Unknown syscall %u.\n", syscall_id);
   11518:	e30107fc 	movw	r0, #6140	; 0x17fc
   1151c:	e3400001 	movt	r0, #1
   11520:	e51b1008 	ldr	r1, [fp, #-8]
   11524:	ebffffc9 	bl	11450 <cprintf>
	}
}
   11528:	e24bd004 	sub	sp, fp, #4
   1152c:	e8bd8800 	pop	{fp, pc}
