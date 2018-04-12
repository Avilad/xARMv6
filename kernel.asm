
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
   1004c:	eb00007a 	bl	1023c <kmain>

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
   10090:	eb0001a5 	bl	1072c <fiq_handler>
   10094:	ea00002e 	b	10154 <trap_return>

00010098 <undefined_instruction_handler_asm>:
   10098:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   1009c:	e14f2000 	mrs	r2, SPSR
   100a0:	e92d0004 	stmfd	sp!, {r2}
   100a4:	e94d6000 	stmdb	sp, {sp, lr}^
   100a8:	e24dd008 	sub	sp, sp, #8
   100ac:	e1a0000d 	mov	r0, sp
   100b0:	eb000173 	bl	10684 <undefined_instruction_handler>
   100b4:	ea000026 	b	10154 <trap_return>

000100b8 <software_interrupt_handler_asm>:
   100b8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100bc:	e14f2000 	mrs	r2, SPSR
   100c0:	e92d0004 	stmfd	sp!, {r2}
   100c4:	e94d6000 	stmdb	sp, {sp, lr}^
   100c8:	e24dd008 	sub	sp, sp, #8
   100cc:	e1a0000d 	mov	r0, sp
   100d0:	eb000172 	bl	106a0 <software_interrupt_handler>
   100d4:	ea00001e 	b	10154 <trap_return>

000100d8 <prefetch_abort_handler_asm>:
   100d8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100dc:	e14f2000 	mrs	r2, SPSR
   100e0:	e92d0004 	stmfd	sp!, {r2}
   100e4:	e94d6000 	stmdb	sp, {sp, lr}^
   100e8:	e24dd008 	sub	sp, sp, #8
   100ec:	e1a0000d 	mov	r0, sp
   100f0:	eb000171 	bl	106bc <prefetch_abort_handler>
   100f4:	ea000016 	b	10154 <trap_return>

000100f8 <data_abort_handler_asm>:
   100f8:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
   100fc:	e14f2000 	mrs	r2, SPSR
   10100:	e92d0004 	stmfd	sp!, {r2}
   10104:	e94d6000 	stmdb	sp, {sp, lr}^
   10108:	e24dd008 	sub	sp, sp, #8
   1010c:	e1a0000d 	mov	r0, sp
   10110:	eb000170 	bl	106d8 <data_abort_handler>
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
   10150:	eb00016e 	bl	10710 <irq_handler>

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

0001023c <kmain>:
extern char linker_bss_start[];
extern char linker_bss_end[];
extern char linker_vector_table_start[];
extern char linker_vector_table_end[];

void kmain(void) {
   1023c:	e92d4800 	push	{fp, lr}
   10240:	e28db004 	add	fp, sp, #4
   10244:	e24ddf42 	sub	sp, sp, #264	; 0x108
	//---Setup interrupt vector table
	memcpy_region(VECTOR_TABLE_START, linker_vector_table_start, linker_vector_table_end);
   10248:	e3a00000 	mov	r0, #0
   1024c:	e59f1060 	ldr	r1, [pc, #96]	; 102b4 <kmain+0x78>
   10250:	e59f2060 	ldr	r2, [pc, #96]	; 102b8 <kmain+0x7c>
   10254:	eb000190 	bl	1089c <memcpy_region>
	
	//---Zero BSS section
	zero_region(linker_bss_start, linker_bss_end);
   10258:	e59f005c 	ldr	r0, [pc, #92]	; 102bc <kmain+0x80>
   1025c:	e59f105c 	ldr	r1, [pc, #92]	; 102c0 <kmain+0x84>
   10260:	eb0001e6 	bl	10a00 <zero_region>

	assert(7 < 5);
   10264:	e59f0058 	ldr	r0, [pc, #88]	; 102c4 <kmain+0x88>
   10268:	e59f1058 	ldr	r1, [pc, #88]	; 102c8 <kmain+0x8c>
   1026c:	e3a02014 	mov	r2, #20
   10270:	e59f3054 	ldr	r3, [pc, #84]	; 102cc <kmain+0x90>
   10274:	eb00031a 	bl	10ee4 <trigger_assert>
	//---UART initialization
	char buf[256];
	char* test_string = sprintf(buf, 256, "Hello %d worlds!", -10);
   10278:	e24b3f42 	sub	r3, fp, #264	; 0x108
   1027c:	e1a00003 	mov	r0, r3
   10280:	e3a01c01 	mov	r1, #256	; 0x100
   10284:	e59f2044 	ldr	r2, [pc, #68]	; 102d0 <kmain+0x94>
   10288:	e3e03009 	mvn	r3, #9
   1028c:	eb00023e 	bl	10b8c <sprintf>
   10290:	e50b0008 	str	r0, [fp, #-8]
	uart0_init();
   10294:	eb000023 	bl	10328 <uart0_init>
	uart0_put_str(test_string);
   10298:	e51b0008 	ldr	r0, [fp, #-8]
   1029c:	eb0000a4 	bl	10534 <uart0_put_str>
	while (1) {
		uart0_send_char(uart0_get_char());
   102a0:	eb000089 	bl	104cc <uart0_get_char>
   102a4:	e1a03000 	mov	r3, r0
   102a8:	e1a00003 	mov	r0, r3
   102ac:	eb000064 	bl	10444 <uart0_send_char>
	}
   102b0:	eafffffa 	b	102a0 <kmain+0x64>
   102b4:	00010060 	.word	0x00010060
   102b8:	00010168 	.word	0x00010168
   102bc:	00016000 	.word	0x00016000
   102c0:	000160a0 	.word	0x000160a0
   102c4:	000110b4 	.word	0x000110b4
   102c8:	000110bc 	.word	0x000110bc
   102cc:	000110d8 	.word	0x000110d8
   102d0:	000110c4 	.word	0x000110c4

000102d4 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   102d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   102d8:	e28db000 	add	fp, sp, #0
   102dc:	e24dd00c 	sub	sp, sp, #12
   102e0:	e50b0008 	str	r0, [fp, #-8]
   102e4:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   102e8:	e51b3008 	ldr	r3, [fp, #-8]
   102ec:	e51b200c 	ldr	r2, [fp, #-12]
   102f0:	e5832000 	str	r2, [r3]
}
   102f4:	e24bd000 	sub	sp, fp, #0
   102f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   102fc:	e12fff1e 	bx	lr

00010300 <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   10300:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10304:	e28db000 	add	fp, sp, #0
   10308:	e24dd00c 	sub	sp, sp, #12
   1030c:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   10310:	e51b3008 	ldr	r3, [fp, #-8]
   10314:	e5933000 	ldr	r3, [r3]
}
   10318:	e1a00003 	mov	r0, r3
   1031c:	e24bd000 	sub	sp, fp, #0
   10320:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10324:	e12fff1e 	bx	lr

00010328 <uart0_init>:

void uart0_init() {
   10328:	e92d4800 	push	{fp, lr}
   1032c:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   10330:	e59f00dc 	ldr	r0, [pc, #220]	; 10414 <uart0_init+0xec>
   10334:	e3a01000 	mov	r1, #0
   10338:	ebffffe5 	bl	102d4 <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   1033c:	e59f00d4 	ldr	r0, [pc, #212]	; 10418 <uart0_init+0xf0>
   10340:	e3a01000 	mov	r1, #0
   10344:	ebffffe2 	bl	102d4 <mmio_write>
	delay(150);
   10348:	e59f30cc 	ldr	r3, [pc, #204]	; 1041c <uart0_init+0xf4>
   1034c:	e3a02096 	mov	r2, #150	; 0x96
   10350:	e5832000 	str	r2, [r3]
   10354:	ea000000 	b	1035c <uart0_init+0x34>
   10358:	e1a00000 	nop			; (mov r0, r0)
   1035c:	e59f30b8 	ldr	r3, [pc, #184]	; 1041c <uart0_init+0xf4>
   10360:	e5933000 	ldr	r3, [r3]
   10364:	e2432001 	sub	r2, r3, #1
   10368:	e59f10ac 	ldr	r1, [pc, #172]	; 1041c <uart0_init+0xf4>
   1036c:	e5812000 	str	r2, [r1]
   10370:	e3530000 	cmp	r3, #0
   10374:	1afffff7 	bne	10358 <uart0_init+0x30>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   10378:	e59f00a0 	ldr	r0, [pc, #160]	; 10420 <uart0_init+0xf8>
   1037c:	e3a01903 	mov	r1, #49152	; 0xc000
   10380:	ebffffd3 	bl	102d4 <mmio_write>
	delay(150);
   10384:	e59f3090 	ldr	r3, [pc, #144]	; 1041c <uart0_init+0xf4>
   10388:	e3a02096 	mov	r2, #150	; 0x96
   1038c:	e5832000 	str	r2, [r3]
   10390:	ea000000 	b	10398 <uart0_init+0x70>
   10394:	e1a00000 	nop			; (mov r0, r0)
   10398:	e59f307c 	ldr	r3, [pc, #124]	; 1041c <uart0_init+0xf4>
   1039c:	e5933000 	ldr	r3, [r3]
   103a0:	e2432001 	sub	r2, r3, #1
   103a4:	e59f1070 	ldr	r1, [pc, #112]	; 1041c <uart0_init+0xf4>
   103a8:	e5812000 	str	r2, [r1]
   103ac:	e3530000 	cmp	r3, #0
   103b0:	1afffff7 	bne	10394 <uart0_init+0x6c>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   103b4:	e59f0064 	ldr	r0, [pc, #100]	; 10420 <uart0_init+0xf8>
   103b8:	e3a01000 	mov	r1, #0
   103bc:	ebffffc4 	bl	102d4 <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   103c0:	e59f005c 	ldr	r0, [pc, #92]	; 10424 <uart0_init+0xfc>
   103c4:	e59f105c 	ldr	r1, [pc, #92]	; 10428 <uart0_init+0x100>
   103c8:	ebffffc1 	bl	102d4 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   103cc:	e59f0058 	ldr	r0, [pc, #88]	; 1042c <uart0_init+0x104>
   103d0:	e3a01001 	mov	r1, #1
   103d4:	ebffffbe 	bl	102d4 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   103d8:	e59f0050 	ldr	r0, [pc, #80]	; 10430 <uart0_init+0x108>
   103dc:	e3a01028 	mov	r1, #40	; 0x28
   103e0:	ebffffbb 	bl	102d4 <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   103e4:	e59f0048 	ldr	r0, [pc, #72]	; 10434 <uart0_init+0x10c>
   103e8:	e3a01070 	mov	r1, #112	; 0x70
   103ec:	ebffffb8 	bl	102d4 <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   103f0:	e59f0040 	ldr	r0, [pc, #64]	; 10438 <uart0_init+0x110>
   103f4:	e59f1040 	ldr	r1, [pc, #64]	; 1043c <uart0_init+0x114>
   103f8:	ebffffb5 	bl	102d4 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   103fc:	e59f0010 	ldr	r0, [pc, #16]	; 10414 <uart0_init+0xec>
   10400:	e59f1038 	ldr	r1, [pc, #56]	; 10440 <uart0_init+0x118>
   10404:	ebffffb2 	bl	102d4 <mmio_write>
#endif
}
   10408:	e24bd004 	sub	sp, fp, #4
   1040c:	e8bd4800 	pop	{fp, lr}
   10410:	e12fff1e 	bx	lr
   10414:	3f201030 	.word	0x3f201030
   10418:	3f200094 	.word	0x3f200094
   1041c:	00016000 	.word	0x00016000
   10420:	3f200098 	.word	0x3f200098
   10424:	3f201044 	.word	0x3f201044
   10428:	000007ff 	.word	0x000007ff
   1042c:	3f201024 	.word	0x3f201024
   10430:	3f201028 	.word	0x3f201028
   10434:	3f20102c 	.word	0x3f20102c
   10438:	3f201038 	.word	0x3f201038
   1043c:	000007f2 	.word	0x000007f2
   10440:	00000301 	.word	0x00000301

00010444 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   10444:	e92d4800 	push	{fp, lr}
   10448:	e28db004 	add	fp, sp, #4
   1044c:	e24dd008 	sub	sp, sp, #8
   10450:	e1a03000 	mov	r3, r0
   10454:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   10458:	e1a00000 	nop			; (mov r0, r0)
   1045c:	e59f005c 	ldr	r0, [pc, #92]	; 104c0 <uart0_send_char+0x7c>
   10460:	ebffffa6 	bl	10300 <mmio_read>
   10464:	e1a03000 	mov	r3, r0
   10468:	e2033020 	and	r3, r3, #32
   1046c:	e3530000 	cmp	r3, #0
   10470:	1afffff9 	bne	1045c <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   10474:	e55b3005 	ldrb	r3, [fp, #-5]
   10478:	e59f0044 	ldr	r0, [pc, #68]	; 104c4 <uart0_send_char+0x80>
   1047c:	e1a01003 	mov	r1, r3
   10480:	ebffff93 	bl	102d4 <mmio_write>
	delay(150);
   10484:	e59f303c 	ldr	r3, [pc, #60]	; 104c8 <uart0_send_char+0x84>
   10488:	e3a02096 	mov	r2, #150	; 0x96
   1048c:	e5832000 	str	r2, [r3]
   10490:	ea000000 	b	10498 <uart0_send_char+0x54>
   10494:	e1a00000 	nop			; (mov r0, r0)
   10498:	e59f3028 	ldr	r3, [pc, #40]	; 104c8 <uart0_send_char+0x84>
   1049c:	e5933000 	ldr	r3, [r3]
   104a0:	e2432001 	sub	r2, r3, #1
   104a4:	e59f101c 	ldr	r1, [pc, #28]	; 104c8 <uart0_send_char+0x84>
   104a8:	e5812000 	str	r2, [r1]
   104ac:	e3530000 	cmp	r3, #0
   104b0:	1afffff7 	bne	10494 <uart0_send_char+0x50>
}
   104b4:	e24bd004 	sub	sp, fp, #4
   104b8:	e8bd4800 	pop	{fp, lr}
   104bc:	e12fff1e 	bx	lr
   104c0:	3f201018 	.word	0x3f201018
   104c4:	3f201000 	.word	0x3f201000
   104c8:	00016000 	.word	0x00016000

000104cc <uart0_get_char>:

char uart0_get_char() {
   104cc:	e92d4800 	push	{fp, lr}
   104d0:	e28db004 	add	fp, sp, #4
   104d4:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   104d8:	e1a00000 	nop			; (mov r0, r0)
   104dc:	e59f0048 	ldr	r0, [pc, #72]	; 1052c <uart0_get_char+0x60>
   104e0:	ebffff86 	bl	10300 <mmio_read>
   104e4:	e1a03000 	mov	r3, r0
   104e8:	e2033010 	and	r3, r3, #16
   104ec:	e3530000 	cmp	r3, #0
   104f0:	1afffff9 	bne	104dc <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   104f4:	e59f0034 	ldr	r0, [pc, #52]	; 10530 <uart0_get_char+0x64>
   104f8:	ebffff80 	bl	10300 <mmio_read>
   104fc:	e1a03000 	mov	r3, r0
   10500:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   10504:	e55b3005 	ldrb	r3, [fp, #-5]
   10508:	e353000d 	cmp	r3, #13
   1050c:	0a000001 	beq	10518 <uart0_get_char+0x4c>
   10510:	e55b3005 	ldrb	r3, [fp, #-5]
   10514:	ea000000 	b	1051c <uart0_get_char+0x50>
   10518:	e3a0300a 	mov	r3, #10
}
   1051c:	e1a00003 	mov	r0, r3
   10520:	e24bd004 	sub	sp, fp, #4
   10524:	e8bd4800 	pop	{fp, lr}
   10528:	e12fff1e 	bx	lr
   1052c:	3f201018 	.word	0x3f201018
   10530:	3f201000 	.word	0x3f201000

00010534 <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   10534:	e92d4800 	push	{fp, lr}
   10538:	e28db004 	add	fp, sp, #4
   1053c:	e24dd008 	sub	sp, sp, #8
   10540:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   10544:	ea00000b 	b	10578 <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   10548:	e51b3008 	ldr	r3, [fp, #-8]
   1054c:	e5d33000 	ldrb	r3, [r3]
   10550:	e353000a 	cmp	r3, #10
   10554:	1a000001 	bne	10560 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   10558:	e3a0000d 	mov	r0, #13
   1055c:	ebffffb8 	bl	10444 <uart0_send_char>
		}
		uart0_send_char(*s++);
   10560:	e51b3008 	ldr	r3, [fp, #-8]
   10564:	e2832001 	add	r2, r3, #1
   10568:	e50b2008 	str	r2, [fp, #-8]
   1056c:	e5d33000 	ldrb	r3, [r3]
   10570:	e1a00003 	mov	r0, r3
   10574:	ebffffb2 	bl	10444 <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   10578:	e51b3008 	ldr	r3, [fp, #-8]
   1057c:	e5d33000 	ldrb	r3, [r3]
   10580:	e3530000 	cmp	r3, #0
   10584:	1affffef 	bne	10548 <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   10588:	e24bd004 	sub	sp, fp, #4
   1058c:	e8bd4800 	pop	{fp, lr}
   10590:	e12fff1e 	bx	lr

00010594 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   10594:	e92d0810 	push	{r4, fp}
   10598:	e28db004 	add	fp, sp, #4
   1059c:	e24dd018 	sub	sp, sp, #24
   105a0:	e1a03000 	mov	r3, r0
   105a4:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   105a8:	e1a00000 	nop			; (mov r0, r0)
    } while (*MBOX_STATUS & MBOX_FULL);
   105ac:	e59f30c0 	ldr	r3, [pc, #192]	; 10674 <mailbox_send_message+0xe0>
   105b0:	e5933000 	ldr	r3, [r3]
   105b4:	e3530000 	cmp	r3, #0
   105b8:	bafffffa 	blt	105a8 <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   105bc:	e55b1015 	ldrb	r1, [fp, #-21]	; 0xffffffeb
   105c0:	e3a02000 	mov	r2, #0
   105c4:	e59f30ac 	ldr	r3, [pc, #172]	; 10678 <mailbox_send_message+0xe4>
   105c8:	e3a04000 	mov	r4, #0
   105cc:	e1833001 	orr	r3, r3, r1
   105d0:	e1844002 	orr	r4, r4, r2
   105d4:	e50b300c 	str	r3, [fp, #-12]
   105d8:	e50b4008 	str	r4, [fp, #-8]
    *MBOX_WRITE = mailbox_addr_or_channel;
   105dc:	e59f2098 	ldr	r2, [pc, #152]	; 1067c <mailbox_send_message+0xe8>
   105e0:	e51b300c 	ldr	r3, [fp, #-12]
   105e4:	e5823000 	str	r3, [r2]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   105e8:	e1a00000 	nop			; (mov r0, r0)
        } while(*MBOX_STATUS & MBOX_EMPTY);
   105ec:	e59f3080 	ldr	r3, [pc, #128]	; 10674 <mailbox_send_message+0xe0>
   105f0:	e5933000 	ldr	r3, [r3]
   105f4:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   105f8:	e3530000 	cmp	r3, #0
   105fc:	1afffff9 	bne	105e8 <mailbox_send_message+0x54>
        
        uint32 response = *MBOX_READ;
   10600:	e59f3078 	ldr	r3, [pc, #120]	; 10680 <mailbox_send_message+0xec>
   10604:	e5933000 	ldr	r3, [r3]
   10608:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   1060c:	e51b3010 	ldr	r3, [fp, #-16]
   10610:	e20330ff 	and	r3, r3, #255	; 0xff
   10614:	e203200f 	and	r2, r3, #15
   10618:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   1061c:	e1520003 	cmp	r2, r3
   10620:	1a00000d 	bne	1065c <mailbox_send_message+0xc8>
   10624:	e51b3010 	ldr	r3, [fp, #-16]
   10628:	e3c3300f 	bic	r3, r3, #15
   1062c:	e59f2044 	ldr	r2, [pc, #68]	; 10678 <mailbox_send_message+0xe4>
   10630:	e1530002 	cmp	r3, r2
   10634:	1a000008 	bne	1065c <mailbox_send_message+0xc8>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   10638:	e59f3038 	ldr	r3, [pc, #56]	; 10678 <mailbox_send_message+0xe4>
   1063c:	e5933004 	ldr	r3, [r3, #4]
   10640:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   10644:	03a03001 	moveq	r3, #1
   10648:	13a03000 	movne	r3, #0
   1064c:	e20330ff 	and	r3, r3, #255	; 0xff
   10650:	e20330ff 	and	r3, r3, #255	; 0xff
   10654:	e3a04000 	mov	r4, #0
   10658:	ea000000 	b	10660 <mailbox_send_message+0xcc>
        }
    }
   1065c:	eaffffe1 	b	105e8 <mailbox_send_message+0x54>
    return 0;
}
   10660:	e1a00003 	mov	r0, r3
   10664:	e1a01004 	mov	r1, r4
   10668:	e24bd004 	sub	sp, fp, #4
   1066c:	e8bd0810 	pop	{r4, fp}
   10670:	e12fff1e 	bx	lr
   10674:	3f00b898 	.word	0x3f00b898
   10678:	00016010 	.word	0x00016010
   1067c:	3f00b8a0 	.word	0x3f00b8a0
   10680:	3f00b880 	.word	0x3f00b880

00010684 <undefined_instruction_handler>:
//Handles traps
#include "arm.h"

void undefined_instruction_handler(struct trap_frame* tf) {
   10684:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10688:	e28db000 	add	fp, sp, #0
   1068c:	e24dd00c 	sub	sp, sp, #12
   10690:	e50b0008 	str	r0, [fp, #-8]
	
}
   10694:	e24bd000 	sub	sp, fp, #0
   10698:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1069c:	e12fff1e 	bx	lr

000106a0 <software_interrupt_handler>:
void software_interrupt_handler(struct trap_frame* tf) {
   106a0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   106a4:	e28db000 	add	fp, sp, #0
   106a8:	e24dd00c 	sub	sp, sp, #12
   106ac:	e50b0008 	str	r0, [fp, #-8]
	
}
   106b0:	e24bd000 	sub	sp, fp, #0
   106b4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   106b8:	e12fff1e 	bx	lr

000106bc <prefetch_abort_handler>:
void prefetch_abort_handler(struct trap_frame* tf) {
   106bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   106c0:	e28db000 	add	fp, sp, #0
   106c4:	e24dd00c 	sub	sp, sp, #12
   106c8:	e50b0008 	str	r0, [fp, #-8]
	
}
   106cc:	e24bd000 	sub	sp, fp, #0
   106d0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   106d4:	e12fff1e 	bx	lr

000106d8 <data_abort_handler>:
void data_abort_handler(struct trap_frame* tf) {
   106d8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   106dc:	e28db000 	add	fp, sp, #0
   106e0:	e24dd00c 	sub	sp, sp, #12
   106e4:	e50b0008 	str	r0, [fp, #-8]
	
}
   106e8:	e24bd000 	sub	sp, fp, #0
   106ec:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   106f0:	e12fff1e 	bx	lr

000106f4 <unused_exception_handler>:
void unused_exception_handler(struct trap_frame* tf) {
   106f4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   106f8:	e28db000 	add	fp, sp, #0
   106fc:	e24dd00c 	sub	sp, sp, #12
   10700:	e50b0008 	str	r0, [fp, #-8]
	
}
   10704:	e24bd000 	sub	sp, fp, #0
   10708:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1070c:	e12fff1e 	bx	lr

00010710 <irq_handler>:
void irq_handler(struct trap_frame* tf) {
   10710:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10714:	e28db000 	add	fp, sp, #0
   10718:	e24dd00c 	sub	sp, sp, #12
   1071c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10720:	e24bd000 	sub	sp, fp, #0
   10724:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10728:	e12fff1e 	bx	lr

0001072c <fiq_handler>:
void fiq_handler(struct trap_frame* tf) {
   1072c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10730:	e28db000 	add	fp, sp, #0
   10734:	e24dd00c 	sub	sp, sp, #12
   10738:	e50b0008 	str	r0, [fp, #-8]
	
}
   1073c:	e24bd000 	sub	sp, fp, #0
   10740:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10744:	e12fff1e 	bx	lr

00010748 <memcpy>:
//Useful memory functions like memcpy
#include "utils.h"

//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint32 size) {
   10748:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1074c:	e28db000 	add	fp, sp, #0
   10750:	e24dd024 	sub	sp, sp, #36	; 0x24
   10754:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   10758:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   1075c:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   10760:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10764:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source;
   10768:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1076c:	e50b300c 	str	r3, [fp, #-12]
	char* end = src + size;
   10770:	e51b200c 	ldr	r2, [fp, #-12]
   10774:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10778:	e0823003 	add	r3, r2, r3
   1077c:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10780:	ea000007 	b	107a4 <memcpy+0x5c>
		*dest++ = *src++;
   10784:	e51b3008 	ldr	r3, [fp, #-8]
   10788:	e2832001 	add	r2, r3, #1
   1078c:	e50b2008 	str	r2, [fp, #-8]
   10790:	e51b200c 	ldr	r2, [fp, #-12]
   10794:	e2821001 	add	r1, r2, #1
   10798:	e50b100c 	str	r1, [fp, #-12]
   1079c:	e5d22000 	ldrb	r2, [r2]
   107a0:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy(void* destination, const void* source, uint32 size) {
	char* dest = (char*)destination;
	char* src = (char*)source;
	char* end = src + size;
	while (src != end) {
   107a4:	e51b200c 	ldr	r2, [fp, #-12]
   107a8:	e51b3010 	ldr	r3, [fp, #-16]
   107ac:	e1520003 	cmp	r2, r3
   107b0:	1afffff3 	bne	10784 <memcpy+0x3c>
		*dest++ = *src++;
	}
	return destination;
   107b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   107b8:	e1a00003 	mov	r0, r3
   107bc:	e24bd000 	sub	sp, fp, #0
   107c0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   107c4:	e12fff1e 	bx	lr

000107c8 <memmove>:

//For overlapped memory
//or cases where destination > source
void* memmove(void* destination, const void* source, uint32 size) {
   107c8:	e92d4800 	push	{fp, lr}
   107cc:	e28db004 	add	fp, sp, #4
   107d0:	e24dd020 	sub	sp, sp, #32
   107d4:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   107d8:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   107dc:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	if (source == destination) {
   107e0:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   107e4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   107e8:	e1520003 	cmp	r2, r3
   107ec:	1a000001 	bne	107f8 <memmove+0x30>
		return destination;
   107f0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   107f4:	ea000024 	b	1088c <memmove+0xc4>
	}
	if (destination < source) {
   107f8:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   107fc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10800:	e1520003 	cmp	r2, r3
   10804:	2a000005 	bcs	10820 <memmove+0x58>
		return memcpy(destination, source, size);
   10808:	e51b0018 	ldr	r0, [fp, #-24]	; 0xffffffe8
   1080c:	e51b101c 	ldr	r1, [fp, #-28]	; 0xffffffe4
   10810:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10814:	ebffffcb 	bl	10748 <memcpy>
   10818:	e1a03000 	mov	r3, r0
   1081c:	ea00001a 	b	1088c <memmove+0xc4>
	}
	char* dest = (char*)destination + size - 1;
   10820:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10824:	e2433001 	sub	r3, r3, #1
   10828:	e51b2018 	ldr	r2, [fp, #-24]	; 0xffffffe8
   1082c:	e0823003 	add	r3, r2, r3
   10830:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source + size - 1;
   10834:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10838:	e2433001 	sub	r3, r3, #1
   1083c:	e51b201c 	ldr	r2, [fp, #-28]	; 0xffffffe4
   10840:	e0823003 	add	r3, r2, r3
   10844:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source - 1;
   10848:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   1084c:	e2433001 	sub	r3, r3, #1
   10850:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   10854:	ea000007 	b	10878 <memmove+0xb0>
		*dest-- = *src--;
   10858:	e51b3008 	ldr	r3, [fp, #-8]
   1085c:	e2432001 	sub	r2, r3, #1
   10860:	e50b2008 	str	r2, [fp, #-8]
   10864:	e51b200c 	ldr	r2, [fp, #-12]
   10868:	e2421001 	sub	r1, r2, #1
   1086c:	e50b100c 	str	r1, [fp, #-12]
   10870:	e5d22000 	ldrb	r2, [r2]
   10874:	e5c32000 	strb	r2, [r3]
		return memcpy(destination, source, size);
	}
	char* dest = (char*)destination + size - 1;
	char* src = (char*)source + size - 1;
	char* end = (char*)source - 1;
	while (src != end) {
   10878:	e51b200c 	ldr	r2, [fp, #-12]
   1087c:	e51b3010 	ldr	r3, [fp, #-16]
   10880:	e1520003 	cmp	r2, r3
   10884:	1afffff3 	bne	10858 <memmove+0x90>
		*dest-- = *src--;
	}
	return destination;
   10888:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   1088c:	e1a00003 	mov	r0, r3
   10890:	e24bd004 	sub	sp, fp, #4
   10894:	e8bd4800 	pop	{fp, lr}
   10898:	e12fff1e 	bx	lr

0001089c <memcpy_region>:

//Region version with starts/ends for more convenient parameters
//NOTE: End is always one past end
//For non-overlapping source/destinations
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
   1089c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   108a0:	e28db000 	add	fp, sp, #0
   108a4:	e24dd024 	sub	sp, sp, #36	; 0x24
   108a8:	e50b0018 	str	r0, [fp, #-24]	; 0xffffffe8
   108ac:	e50b101c 	str	r1, [fp, #-28]	; 0xffffffe4
   108b0:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
	char* dest = (char*)destination;
   108b4:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   108b8:	e50b3008 	str	r3, [fp, #-8]
	char* src = (char*)source_start;
   108bc:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   108c0:	e50b300c 	str	r3, [fp, #-12]
	char* end = (char*)source_end;
   108c4:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   108c8:	e50b3010 	str	r3, [fp, #-16]
	while (src != end) {
   108cc:	ea000007 	b	108f0 <memcpy_region+0x54>
		*dest++ = *src++;
   108d0:	e51b3008 	ldr	r3, [fp, #-8]
   108d4:	e2832001 	add	r2, r3, #1
   108d8:	e50b2008 	str	r2, [fp, #-8]
   108dc:	e51b200c 	ldr	r2, [fp, #-12]
   108e0:	e2821001 	add	r1, r2, #1
   108e4:	e50b100c 	str	r1, [fp, #-12]
   108e8:	e5d22000 	ldrb	r2, [r2]
   108ec:	e5c32000 	strb	r2, [r3]
//or cases where destination < source
void* memcpy_region(void* destination, const void* source_start, const void* source_end) {
	char* dest = (char*)destination;
	char* src = (char*)source_start;
	char* end = (char*)source_end;
	while (src != end) {
   108f0:	e51b200c 	ldr	r2, [fp, #-12]
   108f4:	e51b3010 	ldr	r3, [fp, #-16]
   108f8:	e1520003 	cmp	r2, r3
   108fc:	1afffff3 	bne	108d0 <memcpy_region+0x34>
		*dest++ = *src++;
	}
	return destination;
   10900:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
}
   10904:	e1a00003 	mov	r0, r3
   10908:	e24bd000 	sub	sp, fp, #0
   1090c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10910:	e12fff1e 	bx	lr

00010914 <memmove_region>:

//For overlapped memory
//or cases where destination > source
void* memmove_region(void* destination, const void* source_start, const void* source_end) {
   10914:	e92d4800 	push	{fp, lr}
   10918:	e28db004 	add	fp, sp, #4
   1091c:	e24dd010 	sub	sp, sp, #16
   10920:	e50b0008 	str	r0, [fp, #-8]
   10924:	e50b100c 	str	r1, [fp, #-12]
   10928:	e50b2010 	str	r2, [fp, #-16]
	return memmove(destination, source_start, source_end - source_start);
   1092c:	e51b2010 	ldr	r2, [fp, #-16]
   10930:	e51b300c 	ldr	r3, [fp, #-12]
   10934:	e0633002 	rsb	r3, r3, r2
   10938:	e51b0008 	ldr	r0, [fp, #-8]
   1093c:	e51b100c 	ldr	r1, [fp, #-12]
   10940:	e1a02003 	mov	r2, r3
   10944:	ebffff9f 	bl	107c8 <memmove>
   10948:	e1a03000 	mov	r3, r0
}
   1094c:	e1a00003 	mov	r0, r3
   10950:	e24bd004 	sub	sp, fp, #4
   10954:	e8bd4800 	pop	{fp, lr}
   10958:	e12fff1e 	bx	lr

0001095c <strcpy>:

//Copy null terminated source into destination which is at least dest_size in length
//dest_size includes the space for the null terminator
char* strcpy(char* destination, const char* source, uint32 dest_size) {
   1095c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10960:	e28db000 	add	fp, sp, #0
   10964:	e24dd01c 	sub	sp, sp, #28
   10968:	e50b0010 	str	r0, [fp, #-16]
   1096c:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   10970:	e50b2018 	str	r2, [fp, #-24]	; 0xffffffe8
	if (dest_size < 1) {
   10974:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10978:	e3530000 	cmp	r3, #0
   1097c:	1a000001 	bne	10988 <strcpy+0x2c>
		return nullptr;
   10980:	e3a03000 	mov	r3, #0
   10984:	ea000019 	b	109f0 <strcpy+0x94>
	}
	char* dest_end = destination + dest_size - 1;
   10988:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   1098c:	e2433001 	sub	r3, r3, #1
   10990:	e51b2010 	ldr	r2, [fp, #-16]
   10994:	e0823003 	add	r3, r2, r3
   10998:	e50b3008 	str	r3, [fp, #-8]
	while (*source
   1099c:	ea000007 	b	109c0 <strcpy+0x64>
	       && destination != dest_end) {
		*destination++ = *source++;
   109a0:	e51b3010 	ldr	r3, [fp, #-16]
   109a4:	e2832001 	add	r2, r3, #1
   109a8:	e50b2010 	str	r2, [fp, #-16]
   109ac:	e51b2014 	ldr	r2, [fp, #-20]	; 0xffffffec
   109b0:	e2821001 	add	r1, r2, #1
   109b4:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
   109b8:	e5d22000 	ldrb	r2, [r2]
   109bc:	e5c32000 	strb	r2, [r3]
char* strcpy(char* destination, const char* source, uint32 dest_size) {
	if (dest_size < 1) {
		return nullptr;
	}
	char* dest_end = destination + dest_size - 1;
	while (*source
   109c0:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   109c4:	e5d33000 	ldrb	r3, [r3]
   109c8:	e3530000 	cmp	r3, #0
   109cc:	0a000003 	beq	109e0 <strcpy+0x84>
	       && destination != dest_end) {
   109d0:	e51b2010 	ldr	r2, [fp, #-16]
   109d4:	e51b3008 	ldr	r3, [fp, #-8]
   109d8:	e1520003 	cmp	r2, r3
   109dc:	1affffef 	bne	109a0 <strcpy+0x44>
		*destination++ = *source++;
	}
	*destination = 0;
   109e0:	e51b3010 	ldr	r3, [fp, #-16]
   109e4:	e3a02000 	mov	r2, #0
   109e8:	e5c32000 	strb	r2, [r3]
	return destination;
   109ec:	e51b3010 	ldr	r3, [fp, #-16]
}
   109f0:	e1a00003 	mov	r0, r3
   109f4:	e24bd000 	sub	sp, fp, #0
   109f8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   109fc:	e12fff1e 	bx	lr

00010a00 <zero_region>:

//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
   10a00:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10a04:	e28db000 	add	fp, sp, #0
   10a08:	e24dd014 	sub	sp, sp, #20
   10a0c:	e50b0010 	str	r0, [fp, #-16]
   10a10:	e50b1014 	str	r1, [fp, #-20]	; 0xffffffec
	char* start = (char*)mem_start;
   10a14:	e51b3010 	ldr	r3, [fp, #-16]
   10a18:	e50b3008 	str	r3, [fp, #-8]
	char* end = (char*)mem_end;
   10a1c:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10a20:	e50b300c 	str	r3, [fp, #-12]
	while (start != end) {
   10a24:	ea000004 	b	10a3c <zero_region+0x3c>
		*start++ = 0;
   10a28:	e51b3008 	ldr	r3, [fp, #-8]
   10a2c:	e2832001 	add	r2, r3, #1
   10a30:	e50b2008 	str	r2, [fp, #-8]
   10a34:	e3a02000 	mov	r2, #0
   10a38:	e5c32000 	strb	r2, [r3]
//Zero a region of memory
//does not check mem_end >= mem_start
void* zero_region(void* mem_start, void* mem_end) {
	char* start = (char*)mem_start;
	char* end = (char*)mem_end;
	while (start != end) {
   10a3c:	e51b2008 	ldr	r2, [fp, #-8]
   10a40:	e51b300c 	ldr	r3, [fp, #-12]
   10a44:	e1520003 	cmp	r2, r3
   10a48:	1afffff6 	bne	10a28 <zero_region+0x28>
		*start++ = 0;
	}
	return mem_start;
   10a4c:	e51b3010 	ldr	r3, [fp, #-16]
}
   10a50:	e1a00003 	mov	r0, r3
   10a54:	e24bd000 	sub	sp, fp, #0
   10a58:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10a5c:	e12fff1e 	bx	lr

00010a60 <write_uint32>:

//sprintf helper for writing unsigned ints
//returns false if buf is full
static char* write_uint32(char* buf, char* buf_end, uint32 base, uint32 num) {
   10a60:	e92d4800 	push	{fp, lr}
   10a64:	e28db004 	add	fp, sp, #4
   10a68:	e24dd028 	sub	sp, sp, #40	; 0x28
   10a6c:	e50b0020 	str	r0, [fp, #-32]	; 0xffffffe0
   10a70:	e50b1024 	str	r1, [fp, #-36]	; 0xffffffdc
   10a74:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10a78:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
   10a7c:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10a80:	e3530000 	cmp	r3, #0
   10a84:	0a000021 	beq	10b10 <write_uint32+0xb0>
		uint32 idigit = 11;
   10a88:	e3a0300b 	mov	r3, #11
   10a8c:	e50b300c 	str	r3, [fp, #-12]
		while (num) {
   10a90:	ea000016 	b	10af0 <write_uint32+0x90>
			uint32 digit = num % base;
   10a94:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10a98:	e1a00003 	mov	r0, r3
   10a9c:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
   10aa0:	eb00017a 	bl	11090 <__aeabi_uidivmod>
   10aa4:	e1a03001 	mov	r3, r1
   10aa8:	e50b3010 	str	r3, [fp, #-16]
			idigit--;
   10aac:	e51b300c 	ldr	r3, [fp, #-12]
   10ab0:	e2433001 	sub	r3, r3, #1
   10ab4:	e50b300c 	str	r3, [fp, #-12]
			num_buffer[idigit] = digits[digit];
   10ab8:	e59f20c8 	ldr	r2, [pc, #200]	; 10b88 <write_uint32+0x128>
   10abc:	e51b3010 	ldr	r3, [fp, #-16]
   10ac0:	e0823003 	add	r3, r2, r3
   10ac4:	e5d31000 	ldrb	r1, [r3]
   10ac8:	e24b201c 	sub	r2, fp, #28
   10acc:	e51b300c 	ldr	r3, [fp, #-12]
   10ad0:	e0823003 	add	r3, r2, r3
   10ad4:	e1a02001 	mov	r2, r1
   10ad8:	e5c32000 	strb	r2, [r3]
			num /= base;
   10adc:	e51b002c 	ldr	r0, [fp, #-44]	; 0xffffffd4
   10ae0:	e51b1028 	ldr	r1, [fp, #-40]	; 0xffffffd8
   10ae4:	eb00012c 	bl	10f9c <__aeabi_uidiv>
   10ae8:	e1a03000 	mov	r3, r0
   10aec:	e50b302c 	str	r3, [fp, #-44]	; 0xffffffd4
	static const char digits[] = "0123456789abcdef";
	char num_buffer[11];
	char* first_digit;
	if (num) {
		uint32 idigit = 11;
		while (num) {
   10af0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10af4:	e3530000 	cmp	r3, #0
   10af8:	1affffe5 	bne	10a94 <write_uint32+0x34>
			uint32 digit = num % base;
			idigit--;
			num_buffer[idigit] = digits[digit];
			num /= base;
		}
		first_digit = &num_buffer[idigit];
   10afc:	e24b201c 	sub	r2, fp, #28
   10b00:	e51b300c 	ldr	r3, [fp, #-12]
   10b04:	e0823003 	add	r3, r2, r3
   10b08:	e50b3008 	str	r3, [fp, #-8]
   10b0c:	ea000004 	b	10b24 <write_uint32+0xc4>
	} else {
		num_buffer[10] = '0';
   10b10:	e3a03030 	mov	r3, #48	; 0x30
   10b14:	e54b3012 	strb	r3, [fp, #-18]	; 0xffffffee
		first_digit = &num_buffer[10];
   10b18:	e24b301c 	sub	r3, fp, #28
   10b1c:	e283300a 	add	r3, r3, #10
   10b20:	e50b3008 	str	r3, [fp, #-8]
	}
	while (first_digit != &num_buffer[11]) {
   10b24:	ea00000d 	b	10b60 <write_uint32+0x100>
		*buf++ = *first_digit++;
   10b28:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10b2c:	e2832001 	add	r2, r3, #1
   10b30:	e50b2020 	str	r2, [fp, #-32]	; 0xffffffe0
   10b34:	e51b2008 	ldr	r2, [fp, #-8]
   10b38:	e2821001 	add	r1, r2, #1
   10b3c:	e50b1008 	str	r1, [fp, #-8]
   10b40:	e5d22000 	ldrb	r2, [r2]
   10b44:	e5c32000 	strb	r2, [r3]
		if (buf == buf_end) {
   10b48:	e51b2020 	ldr	r2, [fp, #-32]	; 0xffffffe0
   10b4c:	e51b3024 	ldr	r3, [fp, #-36]	; 0xffffffdc
   10b50:	e1520003 	cmp	r2, r3
   10b54:	1a000001 	bne	10b60 <write_uint32+0x100>
			return buf;
   10b58:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10b5c:	ea000005 	b	10b78 <write_uint32+0x118>
		first_digit = &num_buffer[idigit];
	} else {
		num_buffer[10] = '0';
		first_digit = &num_buffer[10];
	}
	while (first_digit != &num_buffer[11]) {
   10b60:	e24b301c 	sub	r3, fp, #28
   10b64:	e283300b 	add	r3, r3, #11
   10b68:	e51b2008 	ldr	r2, [fp, #-8]
   10b6c:	e1520003 	cmp	r2, r3
   10b70:	1affffec 	bne	10b28 <write_uint32+0xc8>
		*buf++ = *first_digit++;
		if (buf == buf_end) {
			return buf;
		}
	}
	return buf;
   10b74:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
}
   10b78:	e1a00003 	mov	r0, r3
   10b7c:	e24bd004 	sub	sp, fp, #4
   10b80:	e8bd4800 	pop	{fp, lr}
   10b84:	e12fff1e 	bx	lr
   10b88:	000110e0 	.word	0x000110e0

00010b8c <sprintf>:

//C standard library function sprintf with buffer size specified
char* sprintf(char* buf, uint32 buf_size, const char* fmt, ...) {
   10b8c:	e92d000c 	push	{r2, r3}
   10b90:	e92d4800 	push	{fp, lr}
   10b94:	e28db004 	add	fp, sp, #4
   10b98:	e24dd028 	sub	sp, sp, #40	; 0x28
   10b9c:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
   10ba0:	e50b102c 	str	r1, [fp, #-44]	; 0xffffffd4
	if (buf_size < 1) {
   10ba4:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10ba8:	e3530000 	cmp	r3, #0
   10bac:	1a000001 	bne	10bb8 <sprintf+0x2c>
		return nullptr; //Need at least space for null terminator
   10bb0:	e3a03000 	mov	r3, #0
   10bb4:	ea0000a8 	b	10e5c <sprintf+0x2d0>
	}
	char* buf_start = buf;
   10bb8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10bbc:	e50b3014 	str	r3, [fp, #-20]	; 0xffffffec
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
   10bc0:	e51b302c 	ldr	r3, [fp, #-44]	; 0xffffffd4
   10bc4:	e2433001 	sub	r3, r3, #1
   10bc8:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10bcc:	e0823003 	add	r3, r2, r3
   10bd0:	e50b3018 	str	r3, [fp, #-24]	; 0xffffffe8
	uint32* var_args = (uint32*)&fmt + 1;
   10bd4:	e28b3008 	add	r3, fp, #8
   10bd8:	e50b3008 	str	r3, [fp, #-8]
	
	while (buf != buf_end
   10bdc:	ea000092 	b	10e2c <sprintf+0x2a0>
	       && *fmt) {
		if (*fmt != '%') {
   10be0:	e59b3004 	ldr	r3, [fp, #4]
   10be4:	e5d33000 	ldrb	r3, [r3]
   10be8:	e3530025 	cmp	r3, #37	; 0x25
   10bec:	0a000008 	beq	10c14 <sprintf+0x88>
			*buf++ = *fmt++;
   10bf0:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10bf4:	e2832001 	add	r2, r3, #1
   10bf8:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10bfc:	e59b2004 	ldr	r2, [fp, #4]
   10c00:	e2821001 	add	r1, r2, #1
   10c04:	e58b1004 	str	r1, [fp, #4]
   10c08:	e5d22000 	ldrb	r2, [r2]
   10c0c:	e5c32000 	strb	r2, [r3]
   10c10:	ea000085 	b	10e2c <sprintf+0x2a0>
		} else {
			fmt++;
   10c14:	e59b3004 	ldr	r3, [fp, #4]
   10c18:	e2833001 	add	r3, r3, #1
   10c1c:	e58b3004 	str	r3, [fp, #4]
			switch (*fmt) {
   10c20:	e59b3004 	ldr	r3, [fp, #4]
   10c24:	e5d33000 	ldrb	r3, [r3]
   10c28:	e3530058 	cmp	r3, #88	; 0x58
   10c2c:	0a000039 	beq	10d18 <sprintf+0x18c>
   10c30:	e3530058 	cmp	r3, #88	; 0x58
   10c34:	ca00000b 	bgt	10c68 <sprintf+0xdc>
   10c38:	e3530044 	cmp	r3, #68	; 0x44
   10c3c:	0a000017 	beq	10ca0 <sprintf+0x114>
   10c40:	e3530044 	cmp	r3, #68	; 0x44
   10c44:	ca000002 	bgt	10c54 <sprintf+0xc8>
   10c48:	e3530000 	cmp	r3, #0
   10c4c:	0a000011 	beq	10c98 <sprintf+0x10c>
   10c50:	ea000060 	b	10dd8 <sprintf+0x24c>
   10c54:	e3530053 	cmp	r3, #83	; 0x53
   10c58:	0a000046 	beq	10d78 <sprintf+0x1ec>
   10c5c:	e3530055 	cmp	r3, #85	; 0x55
   10c60:	0a000038 	beq	10d48 <sprintf+0x1bc>
   10c64:	ea00005b 	b	10dd8 <sprintf+0x24c>
   10c68:	e3530073 	cmp	r3, #115	; 0x73
   10c6c:	0a000041 	beq	10d78 <sprintf+0x1ec>
   10c70:	e3530073 	cmp	r3, #115	; 0x73
   10c74:	ca000002 	bgt	10c84 <sprintf+0xf8>
   10c78:	e3530064 	cmp	r3, #100	; 0x64
   10c7c:	0a000007 	beq	10ca0 <sprintf+0x114>
   10c80:	ea000054 	b	10dd8 <sprintf+0x24c>
   10c84:	e3530075 	cmp	r3, #117	; 0x75
   10c88:	0a00002e 	beq	10d48 <sprintf+0x1bc>
   10c8c:	e3530078 	cmp	r3, #120	; 0x78
   10c90:	0a000020 	beq	10d18 <sprintf+0x18c>
   10c94:	ea00004f 	b	10dd8 <sprintf+0x24c>
			case 0:
				return buf_start;
   10c98:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10c9c:	ea00006e 	b	10e5c <sprintf+0x2d0>
			case 'd':
			case 'D':
				{
					int32 num = *(int32*)var_args;
   10ca0:	e51b3008 	ldr	r3, [fp, #-8]
   10ca4:	e5933000 	ldr	r3, [r3]
   10ca8:	e50b300c 	str	r3, [fp, #-12]
					var_args++;
   10cac:	e51b3008 	ldr	r3, [fp, #-8]
   10cb0:	e2833004 	add	r3, r3, #4
   10cb4:	e50b3008 	str	r3, [fp, #-8]
					if (num < 0) {
   10cb8:	e51b300c 	ldr	r3, [fp, #-12]
   10cbc:	e3530000 	cmp	r3, #0
   10cc0:	aa00000d 	bge	10cfc <sprintf+0x170>
						*buf++ = '-';
   10cc4:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10cc8:	e2832001 	add	r2, r3, #1
   10ccc:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10cd0:	e3a0202d 	mov	r2, #45	; 0x2d
   10cd4:	e5c32000 	strb	r2, [r3]
						if (buf == buf_end) {
   10cd8:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10cdc:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10ce0:	e1520003 	cmp	r2, r3
   10ce4:	1a000001 	bne	10cf0 <sprintf+0x164>
							return buf_start;
   10ce8:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10cec:	ea00005a 	b	10e5c <sprintf+0x2d0>
						}
						num = -num;
   10cf0:	e51b300c 	ldr	r3, [fp, #-12]
   10cf4:	e2633000 	rsb	r3, r3, #0
   10cf8:	e50b300c 	str	r3, [fp, #-12]
					}
					buf = write_uint32(buf, buf_end, 10, (uint32)num);
   10cfc:	e51b300c 	ldr	r3, [fp, #-12]
   10d00:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10d04:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10d08:	e3a0200a 	mov	r2, #10
   10d0c:	ebffff53 	bl	10a60 <write_uint32>
   10d10:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10d14:	ea000041 	b	10e20 <sprintf+0x294>
				}
			case 'x':
			case 'X':
				{
					uint32 num = *var_args++;
   10d18:	e51b3008 	ldr	r3, [fp, #-8]
   10d1c:	e2832004 	add	r2, r3, #4
   10d20:	e50b2008 	str	r2, [fp, #-8]
   10d24:	e5933000 	ldr	r3, [r3]
   10d28:	e50b301c 	str	r3, [fp, #-28]	; 0xffffffe4
					buf = write_uint32(buf, buf_end, 16, num);
   10d2c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10d30:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10d34:	e3a02010 	mov	r2, #16
   10d38:	e51b301c 	ldr	r3, [fp, #-28]	; 0xffffffe4
   10d3c:	ebffff47 	bl	10a60 <write_uint32>
   10d40:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10d44:	ea000035 	b	10e20 <sprintf+0x294>
				}
			case 'u':
			case 'U':
				{
					uint32 num = *var_args++;
   10d48:	e51b3008 	ldr	r3, [fp, #-8]
   10d4c:	e2832004 	add	r2, r3, #4
   10d50:	e50b2008 	str	r2, [fp, #-8]
   10d54:	e5933000 	ldr	r3, [r3]
   10d58:	e50b3020 	str	r3, [fp, #-32]	; 0xffffffe0
					buf = write_uint32(buf, buf_end, 10, num);
   10d5c:	e51b0028 	ldr	r0, [fp, #-40]	; 0xffffffd8
   10d60:	e51b1018 	ldr	r1, [fp, #-24]	; 0xffffffe8
   10d64:	e3a0200a 	mov	r2, #10
   10d68:	e51b3020 	ldr	r3, [fp, #-32]	; 0xffffffe0
   10d6c:	ebffff3b 	bl	10a60 <write_uint32>
   10d70:	e50b0028 	str	r0, [fp, #-40]	; 0xffffffd8
					break;
   10d74:	ea000029 	b	10e20 <sprintf+0x294>
				}
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
   10d78:	e51b3008 	ldr	r3, [fp, #-8]
   10d7c:	e5933000 	ldr	r3, [r3]
   10d80:	e50b3010 	str	r3, [fp, #-16]
					var_args++;
   10d84:	e51b3008 	ldr	r3, [fp, #-8]
   10d88:	e2833004 	add	r3, r3, #4
   10d8c:	e50b3008 	str	r3, [fp, #-8]
					while (*insert
   10d90:	ea000007 	b	10db4 <sprintf+0x228>
					       && buf != buf_end) {
						*buf++ = *insert++;
   10d94:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10d98:	e2832001 	add	r2, r3, #1
   10d9c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10da0:	e51b2010 	ldr	r2, [fp, #-16]
   10da4:	e2821001 	add	r1, r2, #1
   10da8:	e50b1010 	str	r1, [fp, #-16]
   10dac:	e5d22000 	ldrb	r2, [r2]
   10db0:	e5c32000 	strb	r2, [r3]
			case 's':
			case 'S':
				{
					const char* insert = *(const char**)var_args;
					var_args++;
					while (*insert
   10db4:	e51b3010 	ldr	r3, [fp, #-16]
   10db8:	e5d33000 	ldrb	r3, [r3]
   10dbc:	e3530000 	cmp	r3, #0
   10dc0:	0a000003 	beq	10dd4 <sprintf+0x248>
					       && buf != buf_end) {
   10dc4:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10dc8:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10dcc:	e1520003 	cmp	r2, r3
   10dd0:	1affffef 	bne	10d94 <sprintf+0x208>
						*buf++ = *insert++;
					}
					break;
   10dd4:	ea000011 	b	10e20 <sprintf+0x294>
				}
			default:
				*buf++ = '%';
   10dd8:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10ddc:	e2832001 	add	r2, r3, #1
   10de0:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10de4:	e3a02025 	mov	r2, #37	; 0x25
   10de8:	e5c32000 	strb	r2, [r3]
				if (buf == buf_end) {
   10dec:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10df0:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10df4:	e1520003 	cmp	r2, r3
   10df8:	1a000001 	bne	10e04 <sprintf+0x278>
					return buf_start;
   10dfc:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
   10e00:	ea000015 	b	10e5c <sprintf+0x2d0>
				}
				*buf++ = *fmt;
   10e04:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e08:	e2832001 	add	r2, r3, #1
   10e0c:	e50b2028 	str	r2, [fp, #-40]	; 0xffffffd8
   10e10:	e59b2004 	ldr	r2, [fp, #4]
   10e14:	e5d22000 	ldrb	r2, [r2]
   10e18:	e5c32000 	strb	r2, [r3]
				break;
   10e1c:	e1a00000 	nop			; (mov r0, r0)
			}
			fmt++;
   10e20:	e59b3004 	ldr	r3, [fp, #4]
   10e24:	e2833001 	add	r3, r3, #1
   10e28:	e58b3004 	str	r3, [fp, #4]
	}
	char* buf_start = buf;
	char* buf_end = buf + buf_size - 1; //Leave space for null terminator
	uint32* var_args = (uint32*)&fmt + 1;
	
	while (buf != buf_end
   10e2c:	e51b2028 	ldr	r2, [fp, #-40]	; 0xffffffd8
   10e30:	e51b3018 	ldr	r3, [fp, #-24]	; 0xffffffe8
   10e34:	e1520003 	cmp	r2, r3
   10e38:	0a000003 	beq	10e4c <sprintf+0x2c0>
	       && *fmt) {
   10e3c:	e59b3004 	ldr	r3, [fp, #4]
   10e40:	e5d33000 	ldrb	r3, [r3]
   10e44:	e3530000 	cmp	r3, #0
   10e48:	1affff64 	bne	10be0 <sprintf+0x54>
				break;
			}
			fmt++;
		}
	}
	*buf = 0; //Null terminate
   10e4c:	e51b3028 	ldr	r3, [fp, #-40]	; 0xffffffd8
   10e50:	e3a02000 	mov	r2, #0
   10e54:	e5c32000 	strb	r2, [r3]
	return buf_start;
   10e58:	e51b3014 	ldr	r3, [fp, #-20]	; 0xffffffec
}
   10e5c:	e1a00003 	mov	r0, r3
   10e60:	e24bd004 	sub	sp, fp, #4
   10e64:	e8bd4800 	pop	{fp, lr}
   10e68:	e28dd008 	add	sp, sp, #8
   10e6c:	e12fff1e 	bx	lr

00010e70 <panic>:
//Panic function along with the function called when an assert is triggered
#include "utils.h"
#include "mem_mapped_io.h" //For UART

void panic(char* msg) {
   10e70:	e92d4800 	push	{fp, lr}
   10e74:	e28db004 	add	fp, sp, #4
   10e78:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   10e7c:	e24dd008 	sub	sp, sp, #8
   10e80:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10e84:	e2433004 	sub	r3, r3, #4
   10e88:	e5030004 	str	r0, [r3, #-4]
	static const char panic_msg_start[] = "Panic'd: ";
	char buf[4096];
	//The -1/+1 is to account for the null terminator
	memcpy(buf, panic_msg_start, sizeof(panic_msg_start) - 1);
   10e8c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10e90:	e2433004 	sub	r3, r3, #4
   10e94:	e1a00003 	mov	r0, r3
   10e98:	e59f103c 	ldr	r1, [pc, #60]	; 10edc <panic+0x6c>
   10e9c:	e3a02009 	mov	r2, #9
   10ea0:	ebfffe28 	bl	10748 <memcpy>
	strcpy(buf + sizeof(panic_msg_start) - 1, msg, 4096 - sizeof(panic_msg_start) + 1);
   10ea4:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10ea8:	e2433004 	sub	r3, r3, #4
   10eac:	e2832009 	add	r2, r3, #9
   10eb0:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10eb4:	e2433004 	sub	r3, r3, #4
   10eb8:	e1a00002 	mov	r0, r2
   10ebc:	e5131004 	ldr	r1, [r3, #-4]
   10ec0:	e59f2018 	ldr	r2, [pc, #24]	; 10ee0 <panic+0x70>
   10ec4:	ebfffea4 	bl	1095c <strcpy>
	uart0_put_str(buf);
   10ec8:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10ecc:	e2433004 	sub	r3, r3, #4
   10ed0:	e1a00003 	mov	r0, r3
   10ed4:	ebfffd96 	bl	10534 <uart0_put_str>
	while (true) {}
   10ed8:	eafffffe 	b	10ed8 <panic+0x68>
   10edc:	00011134 	.word	0x00011134
   10ee0:	00000ff7 	.word	0x00000ff7

00010ee4 <trigger_assert>:
}

void trigger_assert(const char* expr_str, const char* file_name, uint32 line_number, const char* func_name) {
   10ee4:	e92d4800 	push	{fp, lr}
   10ee8:	e28db004 	add	fp, sp, #4
   10eec:	e24dda01 	sub	sp, sp, #4096	; 0x1000
   10ef0:	e24dd020 	sub	sp, sp, #32
   10ef4:	e24bca01 	sub	ip, fp, #4096	; 0x1000
   10ef8:	e24cc004 	sub	ip, ip, #4
   10efc:	e50c0004 	str	r0, [ip, #-4]
   10f00:	e24b0a01 	sub	r0, fp, #4096	; 0x1000
   10f04:	e2400004 	sub	r0, r0, #4
   10f08:	e5001008 	str	r1, [r0, #-8]
   10f0c:	e24b1a01 	sub	r1, fp, #4096	; 0x1000
   10f10:	e2411004 	sub	r1, r1, #4
   10f14:	e501200c 	str	r2, [r1, #-12]
   10f18:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   10f1c:	e2422004 	sub	r2, r2, #4
   10f20:	e5023010 	str	r3, [r2, #-16]
	char msg[4096];
	sprintf(msg,
   10f24:	e24b2a01 	sub	r2, fp, #4096	; 0x1000
   10f28:	e2422004 	sub	r2, r2, #4
   10f2c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f30:	e2433004 	sub	r3, r3, #4
   10f34:	e1a0c003 	mov	ip, r3
   10f38:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f3c:	e2433004 	sub	r3, r3, #4
   10f40:	e5133008 	ldr	r3, [r3, #-8]
   10f44:	e58d3000 	str	r3, [sp]
   10f48:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f4c:	e2433004 	sub	r3, r3, #4
   10f50:	e513300c 	ldr	r3, [r3, #-12]
   10f54:	e58d3004 	str	r3, [sp, #4]
   10f58:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f5c:	e2433004 	sub	r3, r3, #4
   10f60:	e5133010 	ldr	r3, [r3, #-16]
   10f64:	e58d3008 	str	r3, [sp, #8]
   10f68:	e1a00002 	mov	r0, r2
   10f6c:	e3a01a01 	mov	r1, #4096	; 0x1000
   10f70:	e59f2020 	ldr	r2, [pc, #32]	; 10f98 <trigger_assert+0xb4>
   10f74:	e51c3004 	ldr	r3, [ip, #-4]
   10f78:	ebffff03 	bl	10b8c <sprintf>
	        "Assertion triggered\nExpression %s\nFile %s\nLine %u\nFunction %s\n",
	        expr_str,
	        file_name,
	        line_number,
	        func_name);
	panic(msg);
   10f7c:	e24b3a01 	sub	r3, fp, #4096	; 0x1000
   10f80:	e2433004 	sub	r3, r3, #4
   10f84:	e1a00003 	mov	r0, r3
   10f88:	ebffffb8 	bl	10e70 <panic>
}
   10f8c:	e24bd004 	sub	sp, fp, #4
   10f90:	e8bd4800 	pop	{fp, lr}
   10f94:	e12fff1e 	bx	lr
   10f98:	000110f4 	.word	0x000110f4

00010f9c <__aeabi_uidiv>:
   10f9c:	e2512001 	subs	r2, r1, #1
   10fa0:	012fff1e 	bxeq	lr
   10fa4:	3a000036 	bcc	11084 <__aeabi_uidiv+0xe8>
   10fa8:	e1500001 	cmp	r0, r1
   10fac:	9a000022 	bls	1103c <__aeabi_uidiv+0xa0>
   10fb0:	e1110002 	tst	r1, r2
   10fb4:	0a000023 	beq	11048 <__aeabi_uidiv+0xac>
   10fb8:	e311020e 	tst	r1, #-536870912	; 0xe0000000
   10fbc:	01a01181 	lsleq	r1, r1, #3
   10fc0:	03a03008 	moveq	r3, #8
   10fc4:	13a03001 	movne	r3, #1
   10fc8:	e3510201 	cmp	r1, #268435456	; 0x10000000
   10fcc:	31510000 	cmpcc	r1, r0
   10fd0:	31a01201 	lslcc	r1, r1, #4
   10fd4:	31a03203 	lslcc	r3, r3, #4
   10fd8:	3afffffa 	bcc	10fc8 <__aeabi_uidiv+0x2c>
   10fdc:	e3510102 	cmp	r1, #-2147483648	; 0x80000000
   10fe0:	31510000 	cmpcc	r1, r0
   10fe4:	31a01081 	lslcc	r1, r1, #1
   10fe8:	31a03083 	lslcc	r3, r3, #1
   10fec:	3afffffa 	bcc	10fdc <__aeabi_uidiv+0x40>
   10ff0:	e3a02000 	mov	r2, #0
   10ff4:	e1500001 	cmp	r0, r1
   10ff8:	20400001 	subcs	r0, r0, r1
   10ffc:	21822003 	orrcs	r2, r2, r3
   11000:	e15000a1 	cmp	r0, r1, lsr #1
   11004:	204000a1 	subcs	r0, r0, r1, lsr #1
   11008:	218220a3 	orrcs	r2, r2, r3, lsr #1
   1100c:	e1500121 	cmp	r0, r1, lsr #2
   11010:	20400121 	subcs	r0, r0, r1, lsr #2
   11014:	21822123 	orrcs	r2, r2, r3, lsr #2
   11018:	e15001a1 	cmp	r0, r1, lsr #3
   1101c:	204001a1 	subcs	r0, r0, r1, lsr #3
   11020:	218221a3 	orrcs	r2, r2, r3, lsr #3
   11024:	e3500000 	cmp	r0, #0
   11028:	11b03223 	lsrsne	r3, r3, #4
   1102c:	11a01221 	lsrne	r1, r1, #4
   11030:	1affffef 	bne	10ff4 <__aeabi_uidiv+0x58>
   11034:	e1a00002 	mov	r0, r2
   11038:	e12fff1e 	bx	lr
   1103c:	03a00001 	moveq	r0, #1
   11040:	13a00000 	movne	r0, #0
   11044:	e12fff1e 	bx	lr
   11048:	e3510801 	cmp	r1, #65536	; 0x10000
   1104c:	21a01821 	lsrcs	r1, r1, #16
   11050:	23a02010 	movcs	r2, #16
   11054:	33a02000 	movcc	r2, #0
   11058:	e3510c01 	cmp	r1, #256	; 0x100
   1105c:	21a01421 	lsrcs	r1, r1, #8
   11060:	22822008 	addcs	r2, r2, #8
   11064:	e3510010 	cmp	r1, #16
   11068:	21a01221 	lsrcs	r1, r1, #4
   1106c:	22822004 	addcs	r2, r2, #4
   11070:	e3510004 	cmp	r1, #4
   11074:	82822003 	addhi	r2, r2, #3
   11078:	908220a1 	addls	r2, r2, r1, lsr #1
   1107c:	e1a00230 	lsr	r0, r0, r2
   11080:	e12fff1e 	bx	lr
   11084:	e3500000 	cmp	r0, #0
   11088:	13e00000 	mvnne	r0, #0
   1108c:	ea000007 	b	110b0 <__aeabi_idiv0>

00011090 <__aeabi_uidivmod>:
   11090:	e3510000 	cmp	r1, #0
   11094:	0afffffa 	beq	11084 <__aeabi_uidiv+0xe8>
   11098:	e92d4003 	push	{r0, r1, lr}
   1109c:	ebffffbe 	bl	10f9c <__aeabi_uidiv>
   110a0:	e8bd4006 	pop	{r1, r2, lr}
   110a4:	e0030092 	mul	r3, r2, r0
   110a8:	e0411003 	sub	r1, r1, r3
   110ac:	e12fff1e 	bx	lr

000110b0 <__aeabi_idiv0>:
   110b0:	e12fff1e 	bx	lr
