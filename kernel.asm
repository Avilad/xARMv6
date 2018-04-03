
kernel.elf:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000008000 <_start>:
    8000:	580001c1 	ldr	x1, 8038 <loop_forever+0x8>
    8004:	9100003f 	mov	sp, x1
    8008:	580001c1 	ldr	x1, 8040 <loop_forever+0x10>
    800c:	580001e2 	ldr	x2, 8048 <loop_forever+0x18>
    8010:	58000203 	ldr	x3, 8050 <loop_forever+0x20>

0000000000008014 <clear_bss_top>:
    8014:	eb02003f 	cmp	x1, x2
    8018:	540000a0 	b.eq	802c <clear_bss_done>  // b.none
    801c:	f9000023 	str	x3, [x1]
    8020:	91002021 	add	x1, x1, #0x8
    8024:	eb02003f 	cmp	x1, x2
    8028:	17fffffb 	b	8014 <clear_bss_top>

000000000000802c <clear_bss_done>:
    802c:	9400000b 	bl	8058 <c_main>

0000000000008030 <loop_forever>:
    8030:	14000000 	b	8030 <loop_forever>
    8034:	00000000 	.inst	0x00000000 ; undefined
    8038:	00008000 	.word	0x00008000
    803c:	00000000 	.word	0x00000000
    8040:	000083f0 	.word	0x000083f0
    8044:	00000000 	.word	0x00000000
    8048:	00008480 	.word	0x00008480
	...

0000000000008058 <c_main>:
#include "uart0.h"

void c_main(void)
{
    8058:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
    805c:	910003fd 	mov	x29, sp
	uart0_init();
    8060:	94000008 	bl	8080 <uart0_init>
	uart0_put_str("Hello, world!");
    8064:	90000000 	adrp	x0, 8000 <_start>
    8068:	910f8000 	add	x0, x0, #0x3e0
    806c:	94000093 	bl	82b8 <uart0_put_str>
	while (1) {
		uart0_send_char(uart0_get_char());
    8070:	9400007e 	bl	8268 <uart0_get_char>
    8074:	12001c00 	and	w0, w0, #0xff
    8078:	9400006c 	bl	8228 <uart0_send_char>
    807c:	17fffffd 	b	8070 <c_main+0x18>

0000000000008080 <uart0_init>:
#define UART0_LCRH      ((volatile uint32*)(MMIO_BASE+0x0020102C))
#define UART0_CR        ((volatile uint32*)(MMIO_BASE+0x00201030))
#define UART0_IMSC      ((volatile uint32*)(MMIO_BASE+0x00201038))
#define UART0_ICR       ((volatile uint32*)(MMIO_BASE+0x00201044))

void uart0_init() {
    8080:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    8084:	910003fd 	mov	x29, sp
	//Temporarily disable uart 0
	*UART0_CR = 0;
    8088:	d2820600 	mov	x0, #0x1030                	// #4144
    808c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8090:	b900001f 	str	wzr, [x0]

	//Setup UART clock
	mailbox_message_buffer[0] = 8*4;
    8094:	90000000 	adrp	x0, 8000 <_start>
    8098:	910fc000 	add	x0, x0, #0x3f0
    809c:	52800401 	mov	w1, #0x20                  	// #32
    80a0:	b9000001 	str	w1, [x0]
	mailbox_message_buffer[1] = MBOX_REQUEST;
    80a4:	90000000 	adrp	x0, 8000 <_start>
    80a8:	910fc000 	add	x0, x0, #0x3f0
    80ac:	b900041f 	str	wzr, [x0, #4]
	mailbox_message_buffer[2] = MBOX_TAG_SETCLKRATE; // set clock rate
    80b0:	90000000 	adrp	x0, 8000 <_start>
    80b4:	910fc000 	add	x0, x0, #0x3f0
    80b8:	52900041 	mov	w1, #0x8002                	// #32770
    80bc:	72a00061 	movk	w1, #0x3, lsl #16
    80c0:	b9000801 	str	w1, [x0, #8]
	mailbox_message_buffer[3] = 12;                  // response buffer size
    80c4:	90000000 	adrp	x0, 8000 <_start>
    80c8:	910fc000 	add	x0, x0, #0x3f0
    80cc:	52800181 	mov	w1, #0xc                   	// #12
    80d0:	b9000c01 	str	w1, [x0, #12]
	mailbox_message_buffer[4] = 8;                   // request buffer size
    80d4:	90000000 	adrp	x0, 8000 <_start>
    80d8:	910fc000 	add	x0, x0, #0x3f0
    80dc:	52800101 	mov	w1, #0x8                   	// #8
    80e0:	b9001001 	str	w1, [x0, #16]
	mailbox_message_buffer[5] = 2;                   // UART clock
    80e4:	90000000 	adrp	x0, 8000 <_start>
    80e8:	910fc000 	add	x0, x0, #0x3f0
    80ec:	52800041 	mov	w1, #0x2                   	// #2
    80f0:	b9001401 	str	w1, [x0, #20]
	mailbox_message_buffer[6] = 4000000;             // 4Mhz
    80f4:	90000000 	adrp	x0, 8000 <_start>
    80f8:	910fc000 	add	x0, x0, #0x3f0
    80fc:	52812001 	mov	w1, #0x900                 	// #2304
    8100:	72a007a1 	movk	w1, #0x3d, lsl #16
    8104:	b9001801 	str	w1, [x0, #24]
	mailbox_message_buffer[7] = MBOX_TAG_LAST;
    8108:	90000000 	adrp	x0, 8000 <_start>
    810c:	910fc000 	add	x0, x0, #0x3f0
    8110:	b9001c1f 	str	wzr, [x0, #28]
	mailbox_send_message(MBOX_CH_PROP);
    8114:	52800100 	mov	w0, #0x8                   	// #8
    8118:	9400007e 	bl	8310 <mailbox_send_message>

	//Set pins 14 and 15 to value 100 (4) to enable alternate function 0
	//UART transmit/receive data
	uint32 func_sel_reg;
	func_sel_reg = *GPFSEL1;
    811c:	d2800080 	mov	x0, #0x4                   	// #4
    8120:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8124:	b9400000 	ldr	w0, [x0]
    8128:	b9001ba0 	str	w0, [x29, #24]
	func_sel_reg &= ~(GPIO14 | GPIO15);
    812c:	b9401ba0 	ldr	w0, [x29, #24]
    8130:	120e6400 	and	w0, w0, #0xfffc0fff
    8134:	b9001ba0 	str	w0, [x29, #24]
	func_sel_reg |= (4 << 12) | (4 << 15);
    8138:	b9401ba1 	ldr	w1, [x29, #24]
    813c:	52880000 	mov	w0, #0x4000                	// #16384
    8140:	72a00040 	movk	w0, #0x2, lsl #16
    8144:	2a000020 	orr	w0, w1, w0
    8148:	b9001ba0 	str	w0, [x29, #24]
	*GPFSEL1 = func_sel_reg;
    814c:	d2800080 	mov	x0, #0x4                   	// #4
    8150:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8154:	b9401ba1 	ldr	w1, [x29, #24]
    8158:	b9000001 	str	w1, [x0]

	// Set up GPPUD for GPIO 14/15
	// Reference: https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf, page 101
	*GPPUD = 0;
    815c:	d2801280 	mov	x0, #0x94                  	// #148
    8160:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8164:	b900001f 	str	wzr, [x0]
	uint32 counter;
	counter = 150; while(counter--) { asm volatile("nop"); }
    8168:	528012c0 	mov	w0, #0x96                  	// #150
    816c:	b9001fa0 	str	w0, [x29, #28]
    8170:	14000002 	b	8178 <uart0_init+0xf8>
    8174:	d503201f 	nop
    8178:	b9401fa0 	ldr	w0, [x29, #28]
    817c:	51000401 	sub	w1, w0, #0x1
    8180:	b9001fa1 	str	w1, [x29, #28]
    8184:	7100001f 	cmp	w0, #0x0
    8188:	54ffff61 	b.ne	8174 <uart0_init+0xf4>  // b.any
	*GPPUDCLK0 = (1 << 14) | (1 << 15); //pull down
    818c:	d2801300 	mov	x0, #0x98                  	// #152
    8190:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8194:	52980001 	mov	w1, #0xc000                	// #49152
    8198:	b9000001 	str	w1, [x0]
	counter = 150; while(counter--) { asm volatile("nop"); }
    819c:	528012c0 	mov	w0, #0x96                  	// #150
    81a0:	b9001fa0 	str	w0, [x29, #28]
    81a4:	14000002 	b	81ac <uart0_init+0x12c>
    81a8:	d503201f 	nop
    81ac:	b9401fa0 	ldr	w0, [x29, #28]
    81b0:	51000401 	sub	w1, w0, #0x1
    81b4:	b9001fa1 	str	w1, [x29, #28]
    81b8:	7100001f 	cmp	w0, #0x0
    81bc:	54ffff61 	b.ne	81a8 <uart0_init+0x128>  // b.any
	*GPPUDCLK0 = 0;                     //Flush GPIO setup
    81c0:	d2801300 	mov	x0, #0x98                  	// #152
    81c4:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    81c8:	b900001f 	str	wzr, [x0]
	
	*UART0_ICR = UART0_CLEAR_INTERRUPTS; // clear interrupts
    81cc:	d2820880 	mov	x0, #0x1044                	// #4164
    81d0:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    81d4:	5280ffe1 	mov	w1, #0x7ff                 	// #2047
    81d8:	b9000001 	str	w1, [x0]
	*UART0_IBRD = UART0_BAUD_115200;     // set 115200 baud rate
    81dc:	d2820480 	mov	x0, #0x1024                	// #4132
    81e0:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    81e4:	52800041 	mov	w1, #0x2                   	// #2
    81e8:	b9000001 	str	w1, [x0]
	*UART0_FBRD = 0xB;                   //Fractional baud rate divisor
    81ec:	d2820500 	mov	x0, #0x1028                	// #4136
    81f0:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    81f4:	52800161 	mov	w1, #0xb                   	// #11
    81f8:	b9000001 	str	w1, [x0]
	*UART0_LCRH = 0b11 << 5;             // 8 bit word length
    81fc:	d2820580 	mov	x0, #0x102c                	// #4140
    8200:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8204:	52800c01 	mov	w1, #0x60                  	// #96
    8208:	b9000001 	str	w1, [x0]
	*UART0_CR = UART0_ENABLE_TX_RX_FIFO;
    820c:	d2820600 	mov	x0, #0x1030                	// #4144
    8210:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8214:	52806021 	mov	w1, #0x301                 	// #769
    8218:	b9000001 	str	w1, [x0]
}
    821c:	d503201f 	nop
    8220:	a8c27bfd 	ldp	x29, x30, [sp], #32
    8224:	d65f03c0 	ret

0000000000008228 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
    8228:	d10043ff 	sub	sp, sp, #0x10
    822c:	39003fe0 	strb	w0, [sp, #15]
    do {
	    asm volatile("nop");
    8230:	d503201f 	nop
    } while(*UART0_FR & UART0_FULL); //Wait until we can send
    8234:	d2820300 	mov	x0, #0x1018                	// #4120
    8238:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    823c:	b9400000 	ldr	w0, [x0]
    8240:	121b0000 	and	w0, w0, #0x20
    8244:	7100001f 	cmp	w0, #0x0
    8248:	54ffff41 	b.ne	8230 <uart0_send_char+0x8>  // b.any
    *UART0_DR = data;
    824c:	d2820000 	mov	x0, #0x1000                	// #4096
    8250:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8254:	39403fe1 	ldrb	w1, [sp, #15]
    8258:	b9000001 	str	w1, [x0]
}
    825c:	d503201f 	nop
    8260:	910043ff 	add	sp, sp, #0x10
    8264:	d65f03c0 	ret

0000000000008268 <uart0_get_char>:

char uart0_get_char() {
    8268:	d10043ff 	sub	sp, sp, #0x10
    do {
	    asm volatile("nop");
    826c:	d503201f 	nop
    } while (*UART0_FR & UART0_EMPTY);
    8270:	d2820300 	mov	x0, #0x1018                	// #4120
    8274:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8278:	b9400000 	ldr	w0, [x0]
    827c:	121c0000 	and	w0, w0, #0x10
    8280:	7100001f 	cmp	w0, #0x0
    8284:	54ffff41 	b.ne	826c <uart0_get_char+0x4>  // b.any
    
    char response = (char)(*UART0_DR);
    8288:	d2820000 	mov	x0, #0x1000                	// #4096
    828c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
    8290:	b9400000 	ldr	w0, [x0]
    8294:	39003fe0 	strb	w0, [sp, #15]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
    8298:	39403fe0 	ldrb	w0, [sp, #15]
    829c:	7100341f 	cmp	w0, #0xd
    82a0:	54000060 	b.eq	82ac <uart0_get_char+0x44>  // b.none
    82a4:	39403fe0 	ldrb	w0, [sp, #15]
    82a8:	14000002 	b	82b0 <uart0_get_char+0x48>
    82ac:	52800140 	mov	w0, #0xa                   	// #10
}
    82b0:	910043ff 	add	sp, sp, #0x10
    82b4:	d65f03c0 	ret

00000000000082b8 <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
    82b8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
    82bc:	910003fd 	mov	x29, sp
    82c0:	f9000fa0 	str	x0, [x29, #24]
	while (*s) {
    82c4:	1400000c 	b	82f4 <uart0_put_str+0x3c>
		//\n -> \r\n
		if (*s == '\n') {
    82c8:	f9400fa0 	ldr	x0, [x29, #24]
    82cc:	39400000 	ldrb	w0, [x0]
    82d0:	7100281f 	cmp	w0, #0xa
    82d4:	54000061 	b.ne	82e0 <uart0_put_str+0x28>  // b.any
			uart0_send_char('\r');
    82d8:	528001a0 	mov	w0, #0xd                   	// #13
    82dc:	97ffffd3 	bl	8228 <uart0_send_char>
		}
		uart0_send_char(*s++);
    82e0:	f9400fa0 	ldr	x0, [x29, #24]
    82e4:	91000401 	add	x1, x0, #0x1
    82e8:	f9000fa1 	str	x1, [x29, #24]
    82ec:	39400000 	ldrb	w0, [x0]
    82f0:	97ffffce 	bl	8228 <uart0_send_char>
	while (*s) {
    82f4:	f9400fa0 	ldr	x0, [x29, #24]
    82f8:	39400000 	ldrb	w0, [x0]
    82fc:	7100001f 	cmp	w0, #0x0
    8300:	54fffe41 	b.ne	82c8 <uart0_put_str+0x10>  // b.any
	}
}
    8304:	d503201f 	nop
    8308:	a8c27bfd 	ldp	x29, x30, [sp], #32
    830c:	d65f03c0 	ret

0000000000008310 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
    8310:	d10083ff 	sub	sp, sp, #0x20
    8314:	39003fe0 	strb	w0, [sp, #15]
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
    8318:	d503201f 	nop
    } while (*MBOX_STATUS & MBOX_FULL);
    831c:	d2971300 	mov	x0, #0xb898                	// #47256
    8320:	f2a7e000 	movk	x0, #0x3f00, lsl #16
    8324:	b9400000 	ldr	w0, [x0]
    8328:	7100001f 	cmp	w0, #0x0
    832c:	54ffff6b 	b.lt	8318 <mailbox_send_message+0x8>  // b.tstop
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
    8330:	39403fe1 	ldrb	w1, [sp, #15]
    8334:	90000000 	adrp	x0, 8000 <_start>
    8338:	910fc000 	add	x0, x0, #0x3f0
    833c:	2a0003e0 	mov	w0, w0
    8340:	aa000020 	orr	x0, x1, x0
    8344:	f9000fe0 	str	x0, [sp, #24]
    *MBOX_WRITE = mailbox_addr_or_channel;
    8348:	d2971400 	mov	x0, #0xb8a0                	// #47264
    834c:	f2a7e000 	movk	x0, #0x3f00, lsl #16
    8350:	f9400fe1 	ldr	x1, [sp, #24]
    8354:	b9000001 	str	w1, [x0]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
    8358:	d503201f 	nop
        } while(*MBOX_STATUS & MBOX_EMPTY);
    835c:	d2971300 	mov	x0, #0xb898                	// #47256
    8360:	f2a7e000 	movk	x0, #0x3f00, lsl #16
    8364:	b9400000 	ldr	w0, [x0]
    8368:	12020000 	and	w0, w0, #0x40000000
    836c:	7100001f 	cmp	w0, #0x0
    8370:	54ffff41 	b.ne	8358 <mailbox_send_message+0x48>  // b.any
        
        uint32 response = *MBOX_READ;
    8374:	d2971000 	mov	x0, #0xb880                	// #47232
    8378:	f2a7e000 	movk	x0, #0x3f00, lsl #16
    837c:	b9400000 	ldr	w0, [x0]
    8380:	b90017e0 	str	w0, [sp, #20]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
    8384:	b94017e0 	ldr	w0, [sp, #20]
    8388:	12001c00 	and	w0, w0, #0xff
    838c:	12000c01 	and	w1, w0, #0xf
    8390:	39403fe0 	ldrb	w0, [sp, #15]
    8394:	6b00003f 	cmp	w1, w0
    8398:	54fffe01 	b.ne	8358 <mailbox_send_message+0x48>  // b.any
    839c:	b94017e0 	ldr	w0, [sp, #20]
    83a0:	121c6c00 	and	w0, w0, #0xfffffff0
    83a4:	90000001 	adrp	x1, 8000 <_start>
    83a8:	910fc021 	add	x1, x1, #0x3f0
    83ac:	6b01001f 	cmp	w0, w1
    83b0:	54fffd41 	b.ne	8358 <mailbox_send_message+0x48>  // b.any
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
    83b4:	90000000 	adrp	x0, 8000 <_start>
    83b8:	910fc000 	add	x0, x0, #0x3f0
    83bc:	b9400401 	ldr	w1, [x0, #4]
    83c0:	52b00000 	mov	w0, #0x80000000            	// #-2147483648
    83c4:	6b00003f 	cmp	w1, w0
    83c8:	1a9f17e0 	cset	w0, eq  // eq = none
    83cc:	12001c00 	and	w0, w0, #0xff
    83d0:	92401c00 	and	x0, x0, #0xff
        }
    }
    return 0;
}
    83d4:	910083ff 	add	sp, sp, #0x20
    83d8:	d65f03c0 	ret
