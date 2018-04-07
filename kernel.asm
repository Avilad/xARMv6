
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00010000 <_start>:
   10000:	ee101fb0 	mrc	15, 0, r1, cr0, cr0, {5}
   10004:	e2111003 	ands	r1, r1, #3
   10008:	1a00000b 	bne	1003c <loop_forever>
   1000c:	e59f1030 	ldr	r1, [pc, #48]	; 10044 <loop_forever+0x8>
   10010:	e1a0d001 	mov	sp, r1
   10014:	e59f102c 	ldr	r1, [pc, #44]	; 10048 <loop_forever+0xc>
   10018:	e59f202c 	ldr	r2, [pc, #44]	; 1004c <loop_forever+0x10>
   1001c:	e3a03000 	mov	r3, #0

00010020 <clear_bss_top>:
   10020:	e1510002 	cmp	r1, r2
   10024:	0a000003 	beq	10038 <clear_bss_done>
   10028:	e5813000 	str	r3, [r1]
   1002c:	e2811008 	add	r1, r1, #8
   10030:	e1510002 	cmp	r1, r2
   10034:	eafffff9 	b	10020 <clear_bss_top>

00010038 <clear_bss_done>:
   10038:	eb000004 	bl	10050 <c_main>

0001003c <loop_forever>:
   1003c:	e320f002 	wfe
   10040:	eafffffd 	b	1003c <loop_forever>
   10044:	00010000 	.word	0x00010000
   10048:	00010440 	.word	0x00010440
   1004c:	000104e0 	.word	0x000104e0

00010050 <c_main>:
#include "mem_mapped_io.h"

void c_main(void)
{
   10050:	e92d4800 	push	{fp, lr}
   10054:	e28db004 	add	fp, sp, #4
	uart0_init();
   10058:	eb00001c 	bl	100d0 <uart0_init>
	uart0_put_str("Hello, world!\0");
   1005c:	e59f0014 	ldr	r0, [pc, #20]	; 10078 <c_main+0x28>
   10060:	eb00009d 	bl	102dc <uart0_put_str>
	while (1) {
		uart0_send_char(uart0_get_char());
   10064:	eb000082 	bl	10274 <uart0_get_char>
   10068:	e1a03000 	mov	r3, r0
   1006c:	e1a00003 	mov	r0, r3
   10070:	eb00005d 	bl	101ec <uart0_send_char>
	}
   10074:	eafffffa 	b	10064 <c_main+0x14>
   10078:	0001042c 	.word	0x0001042c

0001007c <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   1007c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10080:	e28db000 	add	fp, sp, #0
   10084:	e24dd00c 	sub	sp, sp, #12
   10088:	e50b0008 	str	r0, [fp, #-8]
   1008c:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   10090:	e51b3008 	ldr	r3, [fp, #-8]
   10094:	e51b200c 	ldr	r2, [fp, #-12]
   10098:	e5832000 	str	r2, [r3]
}
   1009c:	e24bd000 	sub	sp, fp, #0
   100a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   100a4:	e12fff1e 	bx	lr

000100a8 <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   100a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   100ac:	e28db000 	add	fp, sp, #0
   100b0:	e24dd00c 	sub	sp, sp, #12
   100b4:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   100b8:	e51b3008 	ldr	r3, [fp, #-8]
   100bc:	e5933000 	ldr	r3, [r3]
}
   100c0:	e1a00003 	mov	r0, r3
   100c4:	e24bd000 	sub	sp, fp, #0
   100c8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   100cc:	e12fff1e 	bx	lr

000100d0 <uart0_init>:

void uart0_init() {
   100d0:	e92d4800 	push	{fp, lr}
   100d4:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   100d8:	e59f00dc 	ldr	r0, [pc, #220]	; 101bc <uart0_init+0xec>
   100dc:	e3a01000 	mov	r1, #0
   100e0:	ebffffe5 	bl	1007c <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   100e4:	e59f00d4 	ldr	r0, [pc, #212]	; 101c0 <uart0_init+0xf0>
   100e8:	e3a01000 	mov	r1, #0
   100ec:	ebffffe2 	bl	1007c <mmio_write>
	delay(150);
   100f0:	e59f30cc 	ldr	r3, [pc, #204]	; 101c4 <uart0_init+0xf4>
   100f4:	e3a02096 	mov	r2, #150	; 0x96
   100f8:	e5832000 	str	r2, [r3]
   100fc:	ea000000 	b	10104 <uart0_init+0x34>
   10100:	e1a00000 	nop			; (mov r0, r0)
   10104:	e59f30b8 	ldr	r3, [pc, #184]	; 101c4 <uart0_init+0xf4>
   10108:	e5933000 	ldr	r3, [r3]
   1010c:	e2432001 	sub	r2, r3, #1
   10110:	e59f10ac 	ldr	r1, [pc, #172]	; 101c4 <uart0_init+0xf4>
   10114:	e5812000 	str	r2, [r1]
   10118:	e3530000 	cmp	r3, #0
   1011c:	1afffff7 	bne	10100 <uart0_init+0x30>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   10120:	e59f00a0 	ldr	r0, [pc, #160]	; 101c8 <uart0_init+0xf8>
   10124:	e3a01903 	mov	r1, #49152	; 0xc000
   10128:	ebffffd3 	bl	1007c <mmio_write>
	delay(150);
   1012c:	e59f3090 	ldr	r3, [pc, #144]	; 101c4 <uart0_init+0xf4>
   10130:	e3a02096 	mov	r2, #150	; 0x96
   10134:	e5832000 	str	r2, [r3]
   10138:	ea000000 	b	10140 <uart0_init+0x70>
   1013c:	e1a00000 	nop			; (mov r0, r0)
   10140:	e59f307c 	ldr	r3, [pc, #124]	; 101c4 <uart0_init+0xf4>
   10144:	e5933000 	ldr	r3, [r3]
   10148:	e2432001 	sub	r2, r3, #1
   1014c:	e59f1070 	ldr	r1, [pc, #112]	; 101c4 <uart0_init+0xf4>
   10150:	e5812000 	str	r2, [r1]
   10154:	e3530000 	cmp	r3, #0
   10158:	1afffff7 	bne	1013c <uart0_init+0x6c>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   1015c:	e59f0064 	ldr	r0, [pc, #100]	; 101c8 <uart0_init+0xf8>
   10160:	e3a01000 	mov	r1, #0
   10164:	ebffffc4 	bl	1007c <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10168:	e59f005c 	ldr	r0, [pc, #92]	; 101cc <uart0_init+0xfc>
   1016c:	e59f105c 	ldr	r1, [pc, #92]	; 101d0 <uart0_init+0x100>
   10170:	ebffffc1 	bl	1007c <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   10174:	e59f0058 	ldr	r0, [pc, #88]	; 101d4 <uart0_init+0x104>
   10178:	e3a01001 	mov	r1, #1
   1017c:	ebffffbe 	bl	1007c <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   10180:	e59f0050 	ldr	r0, [pc, #80]	; 101d8 <uart0_init+0x108>
   10184:	e3a01028 	mov	r1, #40	; 0x28
   10188:	ebffffbb 	bl	1007c <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   1018c:	e59f0048 	ldr	r0, [pc, #72]	; 101dc <uart0_init+0x10c>
   10190:	e3a01070 	mov	r1, #112	; 0x70
   10194:	ebffffb8 	bl	1007c <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   10198:	e59f0040 	ldr	r0, [pc, #64]	; 101e0 <uart0_init+0x110>
   1019c:	e59f1040 	ldr	r1, [pc, #64]	; 101e4 <uart0_init+0x114>
   101a0:	ebffffb5 	bl	1007c <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   101a4:	e59f0010 	ldr	r0, [pc, #16]	; 101bc <uart0_init+0xec>
   101a8:	e59f1038 	ldr	r1, [pc, #56]	; 101e8 <uart0_init+0x118>
   101ac:	ebffffb2 	bl	1007c <mmio_write>
#endif
}
   101b0:	e24bd004 	sub	sp, fp, #4
   101b4:	e8bd4800 	pop	{fp, lr}
   101b8:	e12fff1e 	bx	lr
   101bc:	3f201030 	.word	0x3f201030
   101c0:	3f200094 	.word	0x3f200094
   101c4:	00010440 	.word	0x00010440
   101c8:	3f200098 	.word	0x3f200098
   101cc:	3f201044 	.word	0x3f201044
   101d0:	000007ff 	.word	0x000007ff
   101d4:	3f201024 	.word	0x3f201024
   101d8:	3f201028 	.word	0x3f201028
   101dc:	3f20102c 	.word	0x3f20102c
   101e0:	3f201038 	.word	0x3f201038
   101e4:	000007f2 	.word	0x000007f2
   101e8:	00000301 	.word	0x00000301

000101ec <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   101ec:	e92d4800 	push	{fp, lr}
   101f0:	e28db004 	add	fp, sp, #4
   101f4:	e24dd008 	sub	sp, sp, #8
   101f8:	e1a03000 	mov	r3, r0
   101fc:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   10200:	e1a00000 	nop			; (mov r0, r0)
   10204:	e59f005c 	ldr	r0, [pc, #92]	; 10268 <uart0_send_char+0x7c>
   10208:	ebffffa6 	bl	100a8 <mmio_read>
   1020c:	e1a03000 	mov	r3, r0
   10210:	e2033020 	and	r3, r3, #32
   10214:	e3530000 	cmp	r3, #0
   10218:	1afffff9 	bne	10204 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   1021c:	e55b3005 	ldrb	r3, [fp, #-5]
   10220:	e59f0044 	ldr	r0, [pc, #68]	; 1026c <uart0_send_char+0x80>
   10224:	e1a01003 	mov	r1, r3
   10228:	ebffff93 	bl	1007c <mmio_write>
	delay(150);
   1022c:	e59f303c 	ldr	r3, [pc, #60]	; 10270 <uart0_send_char+0x84>
   10230:	e3a02096 	mov	r2, #150	; 0x96
   10234:	e5832000 	str	r2, [r3]
   10238:	ea000000 	b	10240 <uart0_send_char+0x54>
   1023c:	e1a00000 	nop			; (mov r0, r0)
   10240:	e59f3028 	ldr	r3, [pc, #40]	; 10270 <uart0_send_char+0x84>
   10244:	e5933000 	ldr	r3, [r3]
   10248:	e2432001 	sub	r2, r3, #1
   1024c:	e59f101c 	ldr	r1, [pc, #28]	; 10270 <uart0_send_char+0x84>
   10250:	e5812000 	str	r2, [r1]
   10254:	e3530000 	cmp	r3, #0
   10258:	1afffff7 	bne	1023c <uart0_send_char+0x50>
}
   1025c:	e24bd004 	sub	sp, fp, #4
   10260:	e8bd4800 	pop	{fp, lr}
   10264:	e12fff1e 	bx	lr
   10268:	3f201018 	.word	0x3f201018
   1026c:	3f201000 	.word	0x3f201000
   10270:	00010440 	.word	0x00010440

00010274 <uart0_get_char>:

char uart0_get_char() {
   10274:	e92d4800 	push	{fp, lr}
   10278:	e28db004 	add	fp, sp, #4
   1027c:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   10280:	e1a00000 	nop			; (mov r0, r0)
   10284:	e59f0048 	ldr	r0, [pc, #72]	; 102d4 <uart0_get_char+0x60>
   10288:	ebffff86 	bl	100a8 <mmio_read>
   1028c:	e1a03000 	mov	r3, r0
   10290:	e2033010 	and	r3, r3, #16
   10294:	e3530000 	cmp	r3, #0
   10298:	1afffff9 	bne	10284 <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   1029c:	e59f0034 	ldr	r0, [pc, #52]	; 102d8 <uart0_get_char+0x64>
   102a0:	ebffff80 	bl	100a8 <mmio_read>
   102a4:	e1a03000 	mov	r3, r0
   102a8:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   102ac:	e55b3005 	ldrb	r3, [fp, #-5]
   102b0:	e353000d 	cmp	r3, #13
   102b4:	0a000001 	beq	102c0 <uart0_get_char+0x4c>
   102b8:	e55b3005 	ldrb	r3, [fp, #-5]
   102bc:	ea000000 	b	102c4 <uart0_get_char+0x50>
   102c0:	e3a0300a 	mov	r3, #10
}
   102c4:	e1a00003 	mov	r0, r3
   102c8:	e24bd004 	sub	sp, fp, #4
   102cc:	e8bd4800 	pop	{fp, lr}
   102d0:	e12fff1e 	bx	lr
   102d4:	3f201018 	.word	0x3f201018
   102d8:	3f201000 	.word	0x3f201000

000102dc <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   102dc:	e92d4800 	push	{fp, lr}
   102e0:	e28db004 	add	fp, sp, #4
   102e4:	e24dd008 	sub	sp, sp, #8
   102e8:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   102ec:	ea00000b 	b	10320 <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   102f0:	e51b3008 	ldr	r3, [fp, #-8]
   102f4:	e5d33000 	ldrb	r3, [r3]
   102f8:	e353000a 	cmp	r3, #10
   102fc:	1a000001 	bne	10308 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   10300:	e3a0000d 	mov	r0, #13
   10304:	ebffffb8 	bl	101ec <uart0_send_char>
		}
		uart0_send_char(*s++);
   10308:	e51b3008 	ldr	r3, [fp, #-8]
   1030c:	e2832001 	add	r2, r3, #1
   10310:	e50b2008 	str	r2, [fp, #-8]
   10314:	e5d33000 	ldrb	r3, [r3]
   10318:	e1a00003 	mov	r0, r3
   1031c:	ebffffb2 	bl	101ec <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   10320:	e51b3008 	ldr	r3, [fp, #-8]
   10324:	e5d33000 	ldrb	r3, [r3]
   10328:	e3530000 	cmp	r3, #0
   1032c:	1affffef 	bne	102f0 <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   10330:	e24bd004 	sub	sp, fp, #4
   10334:	e8bd4800 	pop	{fp, lr}
   10338:	e12fff1e 	bx	lr

0001033c <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   1033c:	e92d0810 	push	{r4, fp}
   10340:	e28db004 	add	fp, sp, #4
   10344:	e24dd018 	sub	sp, sp, #24
   10348:	e1a03000 	mov	r3, r0
   1034c:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   10350:	e1a00000 	nop			; (mov r0, r0)
    } while (*MBOX_STATUS & MBOX_FULL);
   10354:	e59f30c0 	ldr	r3, [pc, #192]	; 1041c <mailbox_send_message+0xe0>
   10358:	e5933000 	ldr	r3, [r3]
   1035c:	e3530000 	cmp	r3, #0
   10360:	bafffffa 	blt	10350 <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   10364:	e55b1015 	ldrb	r1, [fp, #-21]	; 0xffffffeb
   10368:	e3a02000 	mov	r2, #0
   1036c:	e59f30ac 	ldr	r3, [pc, #172]	; 10420 <mailbox_send_message+0xe4>
   10370:	e3a04000 	mov	r4, #0
   10374:	e1833001 	orr	r3, r3, r1
   10378:	e1844002 	orr	r4, r4, r2
   1037c:	e50b300c 	str	r3, [fp, #-12]
   10380:	e50b4008 	str	r4, [fp, #-8]
    *MBOX_WRITE = mailbox_addr_or_channel;
   10384:	e59f2098 	ldr	r2, [pc, #152]	; 10424 <mailbox_send_message+0xe8>
   10388:	e51b300c 	ldr	r3, [fp, #-12]
   1038c:	e5823000 	str	r3, [r2]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   10390:	e1a00000 	nop			; (mov r0, r0)
        } while(*MBOX_STATUS & MBOX_EMPTY);
   10394:	e59f3080 	ldr	r3, [pc, #128]	; 1041c <mailbox_send_message+0xe0>
   10398:	e5933000 	ldr	r3, [r3]
   1039c:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   103a0:	e3530000 	cmp	r3, #0
   103a4:	1afffff9 	bne	10390 <mailbox_send_message+0x54>
        
        uint32 response = *MBOX_READ;
   103a8:	e59f3078 	ldr	r3, [pc, #120]	; 10428 <mailbox_send_message+0xec>
   103ac:	e5933000 	ldr	r3, [r3]
   103b0:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   103b4:	e51b3010 	ldr	r3, [fp, #-16]
   103b8:	e20330ff 	and	r3, r3, #255	; 0xff
   103bc:	e203200f 	and	r2, r3, #15
   103c0:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   103c4:	e1520003 	cmp	r2, r3
   103c8:	1a00000d 	bne	10404 <mailbox_send_message+0xc8>
   103cc:	e51b3010 	ldr	r3, [fp, #-16]
   103d0:	e3c3300f 	bic	r3, r3, #15
   103d4:	e59f2044 	ldr	r2, [pc, #68]	; 10420 <mailbox_send_message+0xe4>
   103d8:	e1530002 	cmp	r3, r2
   103dc:	1a000008 	bne	10404 <mailbox_send_message+0xc8>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   103e0:	e59f3038 	ldr	r3, [pc, #56]	; 10420 <mailbox_send_message+0xe4>
   103e4:	e5933004 	ldr	r3, [r3, #4]
   103e8:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   103ec:	03a03001 	moveq	r3, #1
   103f0:	13a03000 	movne	r3, #0
   103f4:	e20330ff 	and	r3, r3, #255	; 0xff
   103f8:	e20330ff 	and	r3, r3, #255	; 0xff
   103fc:	e3a04000 	mov	r4, #0
   10400:	ea000000 	b	10408 <mailbox_send_message+0xcc>
        }
    }
   10404:	eaffffe1 	b	10390 <mailbox_send_message+0x54>
    return 0;
}
   10408:	e1a00003 	mov	r0, r3
   1040c:	e1a01004 	mov	r1, r4
   10410:	e24bd004 	sub	sp, fp, #4
   10414:	e8bd0810 	pop	{r4, fp}
   10418:	e12fff1e 	bx	lr
   1041c:	3f00b898 	.word	0x3f00b898
   10420:	00010450 	.word	0x00010450
   10424:	3f00b8a0 	.word	0x3f00b8a0
   10428:	3f00b880 	.word	0x3f00b880
