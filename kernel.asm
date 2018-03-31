
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <_start>:
    8000:	e59f102c 	ldr	r1, [pc, #44]	; 8034 <loop_forever+0x4>
    8004:	e1a0d001 	mov	sp, r1
    8008:	e59f1028 	ldr	r1, [pc, #40]	; 8038 <loop_forever+0x8>
    800c:	e59f2028 	ldr	r2, [pc, #40]	; 803c <loop_forever+0xc>
    8010:	e3a03000 	mov	r3, #0

00008014 <clear_bss_top>:
    8014:	e1510002 	cmp	r1, r2
    8018:	0a000003 	beq	802c <clear_bss_done>
    801c:	e5813000 	str	r3, [r1]
    8020:	e2811008 	add	r1, r1, #8
    8024:	e1510002 	cmp	r1, r2
    8028:	eafffff9 	b	8014 <clear_bss_top>

0000802c <clear_bss_done>:
    802c:	eb000003 	bl	8040 <c_main>

00008030 <loop_forever>:
    8030:	eafffffe 	b	8030 <loop_forever>
    8034:	00008000 	.word	0x00008000
    8038:	000082e0 	.word	0x000082e0
    803c:	000082e0 	.word	0x000082e0

00008040 <c_main>:
#include "uart.h"

void c_main(void)
{
    8040:	e92d4800 	push	{fp, lr}
    8044:	e28db004 	add	fp, sp, #4
	uart_init();
    8048:	eb000003 	bl	805c <uart_init>
	uart_put_str("Hello, world!");
    804c:	e30802c8 	movw	r0, #33480	; 0x82c8
    8050:	e3400000 	movt	r0, #0
    8054:	eb000084 	bl	826c <uart_put_str>
	while (1);
    8058:	eafffffe 	b	8058 <c_main+0x18>

0000805c <uart_init>:
// Initialization for the UART devices in ARM
#include "MemoryMappedIO.h"
#include "types.h"

void uart_init() {
    805c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8060:	e28db000 	add	fp, sp, #0
    8064:	e24dd00c 	sub	sp, sp, #12
    // UART initialization
    *AUX_ENABLE |= 1;      // enable UART1, AUX mini uart (console)
    8068:	e3053004 	movw	r3, #20484	; 0x5004
    806c:	e3433f21 	movt	r3, #16161	; 0x3f21
    8070:	e3052004 	movw	r2, #20484	; 0x5004
    8074:	e3432f21 	movt	r2, #16161	; 0x3f21
    8078:	e5922000 	ldr	r2, [r2]
    807c:	e3822001 	orr	r2, r2, #1
    8080:	e5832000 	str	r2, [r3]
    *AUX_MU_IER = 0;
    8084:	e3053044 	movw	r3, #20548	; 0x5044
    8088:	e3433f21 	movt	r3, #16161	; 0x3f21
    808c:	e3a02000 	mov	r2, #0
    8090:	e5832000 	str	r2, [r3]
    *AUX_MU_CNTL = 0;
    8094:	e3053060 	movw	r3, #20576	; 0x5060
    8098:	e3433f21 	movt	r3, #16161	; 0x3f21
    809c:	e3a02000 	mov	r2, #0
    80a0:	e5832000 	str	r2, [r3]
    *AUX_MU_LCR = 3;       // 8 bits
    80a4:	e305304c 	movw	r3, #20556	; 0x504c
    80a8:	e3433f21 	movt	r3, #16161	; 0x3f21
    80ac:	e3a02003 	mov	r2, #3
    80b0:	e5832000 	str	r2, [r3]
    *AUX_MU_MCR = 0;
    80b4:	e3053050 	movw	r3, #20560	; 0x5050
    80b8:	e3433f21 	movt	r3, #16161	; 0x3f21
    80bc:	e3a02000 	mov	r2, #0
    80c0:	e5832000 	str	r2, [r3]
    *AUX_MU_IER = 0;
    80c4:	e3053044 	movw	r3, #20548	; 0x5044
    80c8:	e3433f21 	movt	r3, #16161	; 0x3f21
    80cc:	e3a02000 	mov	r2, #0
    80d0:	e5832000 	str	r2, [r3]
    *AUX_MU_IIR = 0xc6;    // disable interrupts
    80d4:	e3053048 	movw	r3, #20552	; 0x5048
    80d8:	e3433f21 	movt	r3, #16161	; 0x3f21
    80dc:	e3a020c6 	mov	r2, #198	; 0xc6
    80e0:	e5832000 	str	r2, [r3]
    *AUX_MU_BAUD = 270;    // 115200 baud
    80e4:	e3053068 	movw	r3, #20584	; 0x5068
    80e8:	e3433f21 	movt	r3, #16161	; 0x3f21
    80ec:	e300210e 	movw	r2, #270	; 0x10e
    80f0:	e5832000 	str	r2, [r3]

	// Map UART1 to GPIO 14/15 (UART transmit/receive data)
    uint32 func_sel_reg;
    func_sel_reg = *GPFSEL1;
    80f4:	e3a03004 	mov	r3, #4
    80f8:	e3433f20 	movt	r3, #16160	; 0x3f20
    80fc:	e5933000 	ldr	r3, [r3]
    8100:	e50b300c 	str	r3, [fp, #-12]
    func_sel_reg &= ~(GPIO14 | GPIO15); 
    8104:	e51b300c 	ldr	r3, [fp, #-12]
    8108:	e3c33a3f 	bic	r3, r3, #258048	; 0x3f000
    810c:	e50b300c 	str	r3, [fp, #-12]
    func_sel_reg |= (2<<12)|(2<<15);    // alt5
    8110:	e51b300c 	ldr	r3, [fp, #-12]
    8114:	e3833a12 	orr	r3, r3, #73728	; 0x12000
    8118:	e50b300c 	str	r3, [fp, #-12]
    *GPFSEL1 = func_sel_reg;
    811c:	e3a03004 	mov	r3, #4
    8120:	e3433f20 	movt	r3, #16160	; 0x3f20
    8124:	e51b200c 	ldr	r2, [fp, #-12]
    8128:	e5832000 	str	r2, [r3]

	// Set up GPPUD for GPIO 14/15
	// Reference: https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 101
    *GPPUD = 0;            
    812c:	e3a03094 	mov	r3, #148	; 0x94
    8130:	e3433f20 	movt	r3, #16160	; 0x3f20
    8134:	e3a02000 	mov	r2, #0
    8138:	e5832000 	str	r2, [r3]
    uint32 counter;
    counter = 150; while(counter--) { asm volatile("nop"); }
    813c:	e3a03096 	mov	r3, #150	; 0x96
    8140:	e50b3008 	str	r3, [fp, #-8]
    8144:	ea000000 	b	814c <uart_init+0xf0>
    8148:	e320f000 	nop	{0}
    814c:	e51b3008 	ldr	r3, [fp, #-8]
    8150:	e2432001 	sub	r2, r3, #1
    8154:	e50b2008 	str	r2, [fp, #-8]
    8158:	e3530000 	cmp	r3, #0
    815c:	1afffff9 	bne	8148 <uart_init+0xec>
    *GPPUDCLK0 = (1<<14)|(1<<15);
    8160:	e3a03098 	mov	r3, #152	; 0x98
    8164:	e3433f20 	movt	r3, #16160	; 0x3f20
    8168:	e3a02903 	mov	r2, #49152	; 0xc000
    816c:	e5832000 	str	r2, [r3]
    counter = 150; while(counter--) { asm volatile("nop"); }
    8170:	e3a03096 	mov	r3, #150	; 0x96
    8174:	e50b3008 	str	r3, [fp, #-8]
    8178:	ea000000 	b	8180 <uart_init+0x124>
    817c:	e320f000 	nop	{0}
    8180:	e51b3008 	ldr	r3, [fp, #-8]
    8184:	e2432001 	sub	r2, r3, #1
    8188:	e50b2008 	str	r2, [fp, #-8]
    818c:	e3530000 	cmp	r3, #0
    8190:	1afffff9 	bne	817c <uart_init+0x120>
    *GPPUDCLK0 = 0;        // flush GPIO setup
    8194:	e3a03098 	mov	r3, #152	; 0x98
    8198:	e3433f20 	movt	r3, #16160	; 0x3f20
    819c:	e3a02000 	mov	r2, #0
    81a0:	e5832000 	str	r2, [r3]
    *AUX_MU_CNTL = 3;      // enable Tx, Rx
    81a4:	e3053060 	movw	r3, #20576	; 0x5060
    81a8:	e3433f21 	movt	r3, #16161	; 0x3f21
    81ac:	e3a02003 	mov	r2, #3
    81b0:	e5832000 	str	r2, [r3]
}
    81b4:	e24bd000 	sub	sp, fp, #0
    81b8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    81bc:	e12fff1e 	bx	lr

000081c0 <uart_send_char>:

// Pushes a byte through the UART port
void uart_send_char(char data) {
    81c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    81c4:	e28db000 	add	fp, sp, #0
    81c8:	e24dd00c 	sub	sp, sp, #12
    81cc:	e1a03000 	mov	r3, r0
    81d0:	e54b3005 	strb	r3, [fp, #-5]
	// Wait until status register says we can accept data
    do {
		asm volatile("nop");
    81d4:	e320f000 	nop	{0}
	} while (!(*AUX_MU_LSR & LSR_CAN_ACCEPT));
    81d8:	e3053054 	movw	r3, #20564	; 0x5054
    81dc:	e3433f21 	movt	r3, #16161	; 0x3f21
    81e0:	e5933000 	ldr	r3, [r3]
    81e4:	e2033020 	and	r3, r3, #32
    81e8:	e3530000 	cmp	r3, #0
    81ec:	0afffff8 	beq	81d4 <uart_send_char+0x14>
    *AUX_MU_IO = data;
    81f0:	e3053040 	movw	r3, #20544	; 0x5040
    81f4:	e3433f21 	movt	r3, #16161	; 0x3f21
    81f8:	e55b2005 	ldrb	r2, [fp, #-5]
    81fc:	e5832000 	str	r2, [r3]
}
    8200:	e24bd000 	sub	sp, fp, #0
    8204:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8208:	e12fff1e 	bx	lr

0000820c <uart_get_char>:

char uart_get_char() {
    820c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8210:	e28db000 	add	fp, sp, #0
    8214:	e24dd00c 	sub	sp, sp, #12
	// Wait until status register says there's something in the buffer
    do {
		asm volatile("nop");
    8218:	e320f000 	nop	{0}
	} while (!(*AUX_MU_LSR & LSR_DATA_READY));
    821c:	e3053054 	movw	r3, #20564	; 0x5054
    8220:	e3433f21 	movt	r3, #16161	; 0x3f21
    8224:	e5933000 	ldr	r3, [r3]
    8228:	e2033001 	and	r3, r3, #1
    822c:	e3530000 	cmp	r3, #0
    8230:	0afffff8 	beq	8218 <uart_get_char+0xc>
	
	// Read it
    char data = (char)(*AUX_MU_IO & IO_REG_DATA_MASK);
    8234:	e3053040 	movw	r3, #20544	; 0x5040
    8238:	e3433f21 	movt	r3, #16161	; 0x3f21
    823c:	e5933000 	ldr	r3, [r3]
    8240:	e54b3005 	strb	r3, [fp, #-5]

	// Carraige return to newline
    return data == '\r' ? '\n' : data;
    8244:	e55b3005 	ldrb	r3, [fp, #-5]
    8248:	e353000d 	cmp	r3, #13
    824c:	0a000001 	beq	8258 <uart_get_char+0x4c>
    8250:	e55b3005 	ldrb	r3, [fp, #-5]
    8254:	ea000000 	b	825c <uart_get_char+0x50>
    8258:	e3a0300a 	mov	r3, #10
}
    825c:	e1a00003 	mov	r0, r3
    8260:	e24bd000 	sub	sp, fp, #0
    8264:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8268:	e12fff1e 	bx	lr

0000826c <uart_put_str>:

// Send a null-terminated string
void uart_put_str(char* s) {
    826c:	e92d4800 	push	{fp, lr}
    8270:	e28db004 	add	fp, sp, #4
    8274:	e24dd008 	sub	sp, sp, #8
    8278:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
    827c:	ea00000b 	b	82b0 <uart_put_str+0x44>
        /* convert newline to carrige return + newline */
        if(*s == '\n') { uart_send_char('\r'); }
    8280:	e51b3008 	ldr	r3, [fp, #-8]
    8284:	e5d33000 	ldrb	r3, [r3]
    8288:	e353000a 	cmp	r3, #10
    828c:	1a000001 	bne	8298 <uart_put_str+0x2c>
    8290:	e3a0000d 	mov	r0, #13
    8294:	ebffffc9 	bl	81c0 <uart_send_char>
        uart_send_char(*s++);
    8298:	e51b3008 	ldr	r3, [fp, #-8]
    829c:	e2832001 	add	r2, r3, #1
    82a0:	e50b2008 	str	r2, [fp, #-8]
    82a4:	e5d33000 	ldrb	r3, [r3]
    82a8:	e1a00003 	mov	r0, r3
    82ac:	ebffffc3 	bl	81c0 <uart_send_char>
    return data == '\r' ? '\n' : data;
}

// Send a null-terminated string
void uart_put_str(char* s) {
	while (*s) {
    82b0:	e51b3008 	ldr	r3, [fp, #-8]
    82b4:	e5d33000 	ldrb	r3, [r3]
    82b8:	e3530000 	cmp	r3, #0
    82bc:	1affffef 	bne	8280 <uart_put_str+0x14>
        /* convert newline to carrige return + newline */
        if(*s == '\n') { uart_send_char('\r'); }
        uart_send_char(*s++);
    }
}
    82c0:	e24bd004 	sub	sp, fp, #4
    82c4:	e8bd8800 	pop	{fp, pc}
