
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
    8038:	00008440 	.word	0x00008440
    803c:	000084d0 	.word	0x000084d0

00008040 <c_main>:
#include "uart0.h"

void c_main(void)
{
    8040:	e92d4800 	push	{fp, lr}
    8044:	e28db004 	add	fp, sp, #4
	uart0_init();
    8048:	eb000007 	bl	806c <uart0_init>
	uart0_put_str("Hello, world!");
    804c:	e3080424 	movw	r0, #33828	; 0x8424
    8050:	e3400000 	movt	r0, #0
    8054:	eb00009c 	bl	82cc <uart0_put_str>
	while (1) {
		uart0_send_char(uart0_get_char());
    8058:	eb000083 	bl	826c <uart0_get_char>
    805c:	e1a03000 	mov	r3, r0
    8060:	e1a00003 	mov	r0, r3
    8064:	eb00006d 	bl	8220 <uart0_send_char>
	}
    8068:	eafffffa 	b	8058 <c_main+0x18>

0000806c <uart0_init>:
#define UART0_LCRH      ((volatile uint32*)(MMIO_BASE+0x0020102C))
#define UART0_CR        ((volatile uint32*)(MMIO_BASE+0x00201030))
#define UART0_IMSC      ((volatile uint32*)(MMIO_BASE+0x00201038))
#define UART0_ICR       ((volatile uint32*)(MMIO_BASE+0x00201044))

void uart0_init() {
    806c:	e92d4800 	push	{fp, lr}
    8070:	e28db004 	add	fp, sp, #4
    8074:	e24dd008 	sub	sp, sp, #8
	//Temporarily disable uart 0
	*UART0_CR = 0;
    8078:	e3013030 	movw	r3, #4144	; 0x1030
    807c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8080:	e3a02000 	mov	r2, #0
    8084:	e5832000 	str	r2, [r3]

	//Setup UART clock
	mailbox_message_buffer[0] = 8*4;
    8088:	e3083440 	movw	r3, #33856	; 0x8440
    808c:	e3403000 	movt	r3, #0
    8090:	e3a02020 	mov	r2, #32
    8094:	e5832000 	str	r2, [r3]
	mailbox_message_buffer[1] = MBOX_REQUEST;
    8098:	e3083440 	movw	r3, #33856	; 0x8440
    809c:	e3403000 	movt	r3, #0
    80a0:	e3a02000 	mov	r2, #0
    80a4:	e5832004 	str	r2, [r3, #4]
	mailbox_message_buffer[2] = MBOX_TAG_SETCLKRATE; // set clock rate
    80a8:	e3082440 	movw	r2, #33856	; 0x8440
    80ac:	e3402000 	movt	r2, #0
    80b0:	e3083002 	movw	r3, #32770	; 0x8002
    80b4:	e3403003 	movt	r3, #3
    80b8:	e5823008 	str	r3, [r2, #8]
	mailbox_message_buffer[3] = 12;                  // response buffer size
    80bc:	e3083440 	movw	r3, #33856	; 0x8440
    80c0:	e3403000 	movt	r3, #0
    80c4:	e3a0200c 	mov	r2, #12
    80c8:	e583200c 	str	r2, [r3, #12]
	mailbox_message_buffer[4] = 8;                   // request buffer size
    80cc:	e3083440 	movw	r3, #33856	; 0x8440
    80d0:	e3403000 	movt	r3, #0
    80d4:	e3a02008 	mov	r2, #8
    80d8:	e5832010 	str	r2, [r3, #16]
	mailbox_message_buffer[5] = 2;                   // UART clock
    80dc:	e3083440 	movw	r3, #33856	; 0x8440
    80e0:	e3403000 	movt	r3, #0
    80e4:	e3a02002 	mov	r2, #2
    80e8:	e5832014 	str	r2, [r3, #20]
	mailbox_message_buffer[6] = 4000000;             // 4Mhz
    80ec:	e3082440 	movw	r2, #33856	; 0x8440
    80f0:	e3402000 	movt	r2, #0
    80f4:	e3a03c09 	mov	r3, #2304	; 0x900
    80f8:	e340303d 	movt	r3, #61	; 0x3d
    80fc:	e5823018 	str	r3, [r2, #24]
	mailbox_message_buffer[7] = MBOX_TAG_LAST;
    8100:	e3083440 	movw	r3, #33856	; 0x8440
    8104:	e3403000 	movt	r3, #0
    8108:	e3a02000 	mov	r2, #0
    810c:	e583201c 	str	r2, [r3, #28]
	mailbox_send_message(MBOX_CH_PROP);
    8110:	e3a00008 	mov	r0, #8
    8114:	eb000083 	bl	8328 <mailbox_send_message>

	//Set pins 14 and 15 to value 100 (4) to enable alternate function 0
	//UART transmit/receive data
	uint32 func_sel_reg;
	func_sel_reg = *GPFSEL1;
    8118:	e3a03004 	mov	r3, #4
    811c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8120:	e5933000 	ldr	r3, [r3]
    8124:	e50b300c 	str	r3, [fp, #-12]
	func_sel_reg &= ~(GPIO14 | GPIO15);
    8128:	e51b300c 	ldr	r3, [fp, #-12]
    812c:	e3c33a3f 	bic	r3, r3, #258048	; 0x3f000
    8130:	e50b300c 	str	r3, [fp, #-12]
	func_sel_reg |= (4 << 12) | (4 << 15);
    8134:	e51b300c 	ldr	r3, [fp, #-12]
    8138:	e3833909 	orr	r3, r3, #147456	; 0x24000
    813c:	e50b300c 	str	r3, [fp, #-12]
	*GPFSEL1 = func_sel_reg;
    8140:	e3a03004 	mov	r3, #4
    8144:	e3433f20 	movt	r3, #16160	; 0x3f20
    8148:	e51b200c 	ldr	r2, [fp, #-12]
    814c:	e5832000 	str	r2, [r3]

	// Set up GPPUD for GPIO 14/15
	// Reference: https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 101
	*GPPUD = 0;
    8150:	e3a03094 	mov	r3, #148	; 0x94
    8154:	e3433f20 	movt	r3, #16160	; 0x3f20
    8158:	e3a02000 	mov	r2, #0
    815c:	e5832000 	str	r2, [r3]
	uint32 counter;
	counter = 150; while(counter--) { asm volatile("nop"); }
    8160:	e3a03096 	mov	r3, #150	; 0x96
    8164:	e50b3008 	str	r3, [fp, #-8]
    8168:	ea000000 	b	8170 <uart0_init+0x104>
    816c:	e320f000 	nop	{0}
    8170:	e51b3008 	ldr	r3, [fp, #-8]
    8174:	e2432001 	sub	r2, r3, #1
    8178:	e50b2008 	str	r2, [fp, #-8]
    817c:	e3530000 	cmp	r3, #0
    8180:	1afffff9 	bne	816c <uart0_init+0x100>
	*GPPUDCLK0 = (1 << 14) | (1 << 15); //pull down
    8184:	e3a03098 	mov	r3, #152	; 0x98
    8188:	e3433f20 	movt	r3, #16160	; 0x3f20
    818c:	e3a02903 	mov	r2, #49152	; 0xc000
    8190:	e5832000 	str	r2, [r3]
	counter = 150; while(counter--) { asm volatile("nop"); }
    8194:	e3a03096 	mov	r3, #150	; 0x96
    8198:	e50b3008 	str	r3, [fp, #-8]
    819c:	ea000000 	b	81a4 <uart0_init+0x138>
    81a0:	e320f000 	nop	{0}
    81a4:	e51b3008 	ldr	r3, [fp, #-8]
    81a8:	e2432001 	sub	r2, r3, #1
    81ac:	e50b2008 	str	r2, [fp, #-8]
    81b0:	e3530000 	cmp	r3, #0
    81b4:	1afffff9 	bne	81a0 <uart0_init+0x134>
	*GPPUDCLK0 = 0;                     //Flush GPIO setup
    81b8:	e3a03098 	mov	r3, #152	; 0x98
    81bc:	e3433f20 	movt	r3, #16160	; 0x3f20
    81c0:	e3a02000 	mov	r2, #0
    81c4:	e5832000 	str	r2, [r3]
	
	*UART0_ICR = UART0_CLEAR_INTERRUPTS; // clear interrupts
    81c8:	e3013044 	movw	r3, #4164	; 0x1044
    81cc:	e3433f20 	movt	r3, #16160	; 0x3f20
    81d0:	e30027ff 	movw	r2, #2047	; 0x7ff
    81d4:	e5832000 	str	r2, [r3]
	*UART0_IBRD = UART0_BAUD_115200;     // set 115200 baud rate
    81d8:	e3013024 	movw	r3, #4132	; 0x1024
    81dc:	e3433f20 	movt	r3, #16160	; 0x3f20
    81e0:	e3a02002 	mov	r2, #2
    81e4:	e5832000 	str	r2, [r3]
	*UART0_FBRD = 0xB;                   //Fractional baud rate divisor
    81e8:	e3013028 	movw	r3, #4136	; 0x1028
    81ec:	e3433f20 	movt	r3, #16160	; 0x3f20
    81f0:	e3a0200b 	mov	r2, #11
    81f4:	e5832000 	str	r2, [r3]
	*UART0_LCRH = 0b11 << 5;             // 8 bit word length
    81f8:	e301302c 	movw	r3, #4140	; 0x102c
    81fc:	e3433f20 	movt	r3, #16160	; 0x3f20
    8200:	e3a02060 	mov	r2, #96	; 0x60
    8204:	e5832000 	str	r2, [r3]
	*UART0_CR = UART0_ENABLE_TX_RX_FIFO;
    8208:	e3013030 	movw	r3, #4144	; 0x1030
    820c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8210:	e3002301 	movw	r2, #769	; 0x301
    8214:	e5832000 	str	r2, [r3]
}
    8218:	e24bd004 	sub	sp, fp, #4
    821c:	e8bd8800 	pop	{fp, pc}

00008220 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
    8220:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8224:	e28db000 	add	fp, sp, #0
    8228:	e24dd00c 	sub	sp, sp, #12
    822c:	e1a03000 	mov	r3, r0
    8230:	e54b3005 	strb	r3, [fp, #-5]
    do {
	    asm volatile("nop");
    8234:	e320f000 	nop	{0}
    } while(*UART0_FR & UART0_FULL); //Wait until we can send
    8238:	e3013018 	movw	r3, #4120	; 0x1018
    823c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8240:	e5933000 	ldr	r3, [r3]
    8244:	e2033020 	and	r3, r3, #32
    8248:	e3530000 	cmp	r3, #0
    824c:	1afffff8 	bne	8234 <uart0_send_char+0x14>
    *UART0_DR = data;
    8250:	e3a03a01 	mov	r3, #4096	; 0x1000
    8254:	e3433f20 	movt	r3, #16160	; 0x3f20
    8258:	e55b2005 	ldrb	r2, [fp, #-5]
    825c:	e5832000 	str	r2, [r3]
}
    8260:	e24bd000 	sub	sp, fp, #0
    8264:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8268:	e12fff1e 	bx	lr

0000826c <uart0_get_char>:

char uart0_get_char() {
    826c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8270:	e28db000 	add	fp, sp, #0
    8274:	e24dd00c 	sub	sp, sp, #12
    do {
	    asm volatile("nop");
    8278:	e320f000 	nop	{0}
    } while (*UART0_FR & UART0_EMPTY);
    827c:	e3013018 	movw	r3, #4120	; 0x1018
    8280:	e3433f20 	movt	r3, #16160	; 0x3f20
    8284:	e5933000 	ldr	r3, [r3]
    8288:	e2033010 	and	r3, r3, #16
    828c:	e3530000 	cmp	r3, #0
    8290:	1afffff8 	bne	8278 <uart0_get_char+0xc>
    
    char response = (char)(*UART0_DR);
    8294:	e3a03a01 	mov	r3, #4096	; 0x1000
    8298:	e3433f20 	movt	r3, #16160	; 0x3f20
    829c:	e5933000 	ldr	r3, [r3]
    82a0:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
    82a4:	e55b3005 	ldrb	r3, [fp, #-5]
    82a8:	e353000d 	cmp	r3, #13
    82ac:	0a000001 	beq	82b8 <uart0_get_char+0x4c>
    82b0:	e55b3005 	ldrb	r3, [fp, #-5]
    82b4:	ea000000 	b	82bc <uart0_get_char+0x50>
    82b8:	e3a0300a 	mov	r3, #10
}
    82bc:	e1a00003 	mov	r0, r3
    82c0:	e24bd000 	sub	sp, fp, #0
    82c4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    82c8:	e12fff1e 	bx	lr

000082cc <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
    82cc:	e92d4800 	push	{fp, lr}
    82d0:	e28db004 	add	fp, sp, #4
    82d4:	e24dd008 	sub	sp, sp, #8
    82d8:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
    82dc:	ea00000b 	b	8310 <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
    82e0:	e51b3008 	ldr	r3, [fp, #-8]
    82e4:	e5d33000 	ldrb	r3, [r3]
    82e8:	e353000a 	cmp	r3, #10
    82ec:	1a000001 	bne	82f8 <uart0_put_str+0x2c>
			uart0_send_char('\r');
    82f0:	e3a0000d 	mov	r0, #13
    82f4:	ebffffc9 	bl	8220 <uart0_send_char>
		}
		uart0_send_char(*s++);
    82f8:	e51b3008 	ldr	r3, [fp, #-8]
    82fc:	e2832001 	add	r2, r3, #1
    8300:	e50b2008 	str	r2, [fp, #-8]
    8304:	e5d33000 	ldrb	r3, [r3]
    8308:	e1a00003 	mov	r0, r3
    830c:	ebffffc3 	bl	8220 <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
    8310:	e51b3008 	ldr	r3, [fp, #-8]
    8314:	e5d33000 	ldrb	r3, [r3]
    8318:	e3530000 	cmp	r3, #0
    831c:	1affffef 	bne	82e0 <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
    8320:	e24bd004 	sub	sp, fp, #4
    8324:	e8bd8800 	pop	{fp, pc}

00008328 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
    8328:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    832c:	e28db000 	add	fp, sp, #0
    8330:	e24dd01c 	sub	sp, sp, #28
    8334:	e1a03000 	mov	r3, r0
    8338:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
    833c:	e320f000 	nop	{0}
    } while (*MBOX_STATUS & MBOX_FULL);
    8340:	e30b3898 	movw	r3, #47256	; 0xb898
    8344:	e3433f00 	movt	r3, #16128	; 0x3f00
    8348:	e5933000 	ldr	r3, [r3]
    834c:	e3530000 	cmp	r3, #0
    8350:	bafffff9 	blt	833c <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
    8354:	e55b0015 	ldrb	r0, [fp, #-21]	; 0xffffffeb
    8358:	e3a01000 	mov	r1, #0
    835c:	e3083440 	movw	r3, #33856	; 0x8440
    8360:	e3403000 	movt	r3, #0
    8364:	e1a02003 	mov	r2, r3
    8368:	e3a03000 	mov	r3, #0
    836c:	e1822000 	orr	r2, r2, r0
    8370:	e1833001 	orr	r3, r3, r1
    8374:	e14b20fc 	strd	r2, [fp, #-12]
    *MBOX_WRITE = mailbox_addr_or_channel;
    8378:	e30b38a0 	movw	r3, #47264	; 0xb8a0
    837c:	e3433f00 	movt	r3, #16128	; 0x3f00
    8380:	e51b200c 	ldr	r2, [fp, #-12]
    8384:	e5832000 	str	r2, [r3]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
    8388:	e320f000 	nop	{0}
        } while(*MBOX_STATUS & MBOX_EMPTY);
    838c:	e30b3898 	movw	r3, #47256	; 0xb898
    8390:	e3433f00 	movt	r3, #16128	; 0x3f00
    8394:	e5933000 	ldr	r3, [r3]
    8398:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
    839c:	e3530000 	cmp	r3, #0
    83a0:	1afffff8 	bne	8388 <mailbox_send_message+0x60>
        
        uint32 response = *MBOX_READ;
    83a4:	e30b3880 	movw	r3, #47232	; 0xb880
    83a8:	e3433f00 	movt	r3, #16128	; 0x3f00
    83ac:	e5933000 	ldr	r3, [r3]
    83b0:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
    83b4:	e51b3010 	ldr	r3, [fp, #-16]
    83b8:	e6ef3073 	uxtb	r3, r3
    83bc:	e203200f 	and	r2, r3, #15
    83c0:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
    83c4:	e1520003 	cmp	r2, r3
    83c8:	1a00000f 	bne	840c <mailbox_send_message+0xe4>
    83cc:	e51b3010 	ldr	r3, [fp, #-16]
    83d0:	e3c3200f 	bic	r2, r3, #15
    83d4:	e3083440 	movw	r3, #33856	; 0x8440
    83d8:	e3403000 	movt	r3, #0
    83dc:	e1520003 	cmp	r2, r3
    83e0:	1a000009 	bne	840c <mailbox_send_message+0xe4>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
    83e4:	e3083440 	movw	r3, #33856	; 0x8440
    83e8:	e3403000 	movt	r3, #0
    83ec:	e5933004 	ldr	r3, [r3, #4]
    83f0:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
    83f4:	03a03001 	moveq	r3, #1
    83f8:	13a03000 	movne	r3, #0
    83fc:	e6ef3073 	uxtb	r3, r3
    8400:	e6ef2073 	uxtb	r2, r3
    8404:	e3a03000 	mov	r3, #0
    8408:	ea000000 	b	8410 <mailbox_send_message+0xe8>
        }
    }
    840c:	eaffffdd 	b	8388 <mailbox_send_message+0x60>
    return 0;
}
    8410:	e1a00002 	mov	r0, r2
    8414:	e1a01003 	mov	r1, r3
    8418:	e24bd000 	sub	sp, fp, #0
    841c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
    8420:	e12fff1e 	bx	lr
