
kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00010000 <_start>:
   10000:	ee101fb0 	mrc	15, 0, r1, cr0, cr0, {5}
   10004:	e2111003 	ands	r1, r1, #3
   10008:	1a00000d 	bne	10044 <loop_forever>
   1000c:	e59f1038 	ldr	r1, [pc, #56]	; 1004c <loop_forever+0x8>
   10010:	e1a0d001 	mov	sp, r1
   10014:	e59f1034 	ldr	r1, [pc, #52]	; 10050 <loop_forever+0xc>
   10018:	e59f2034 	ldr	r2, [pc, #52]	; 10054 <loop_forever+0x10>
   1001c:	e3a03000 	mov	r3, #0

00010020 <clear_bss_top>:
   10020:	e1510002 	cmp	r1, r2
   10024:	0a000003 	beq	10038 <clear_bss_done>
   10028:	e5813000 	str	r3, [r1]
   1002c:	e2811008 	add	r1, r1, #8
   10030:	e1510002 	cmp	r1, r2
   10034:	eafffff9 	b	10020 <clear_bss_top>

00010038 <clear_bss_done>:
   10038:	e32ff0d3 	msr	CPSR_fsxc, #211	; 0xd3
   1003c:	e59fd014 	ldr	sp, [pc, #20]	; 10058 <loop_forever+0x14>
   10040:	eb000005 	bl	1005c <c_main>

00010044 <loop_forever>:
   10044:	e320f002 	wfe
   10048:	eafffffd 	b	10044 <loop_forever>
   1004c:	00010000 	.word	0x00010000
   10050:	00010510 	.word	0x00010510
   10054:	000105b0 	.word	0x000105b0
   10058:	00002000 	.word	0x00002000

0001005c <c_main>:
#include "mem_mapped_io.h"

void c_main(void)
{
   1005c:	e92d4800 	push	{fp, lr}
   10060:	e28db004 	add	fp, sp, #4
	uart0_init();
   10064:	eb00001c 	bl	100dc <uart0_init>
	uart0_put_str("Hello, world!\0");
   10068:	e59f0014 	ldr	r0, [pc, #20]	; 10084 <c_main+0x28>
   1006c:	eb00009d 	bl	102e8 <uart0_put_str>
	while (1) {
		uart0_send_char(uart0_get_char());
   10070:	eb000082 	bl	10280 <uart0_get_char>
   10074:	e1a03000 	mov	r3, r0
   10078:	e1a00003 	mov	r0, r3
   1007c:	eb00005d 	bl	101f8 <uart0_send_char>
	}
   10080:	eafffffa 	b	10070 <c_main+0x14>
   10084:	000104fc 	.word	0x000104fc

00010088 <mmio_write>:
// Initialization for the UART devices in ARM
#include "mailbox.h"
#include "mem_mapped_io.h"
#include "types.h"

void mmio_write(volatile uint32* reg, uint32 data) {
   10088:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1008c:	e28db000 	add	fp, sp, #0
   10090:	e24dd00c 	sub	sp, sp, #12
   10094:	e50b0008 	str	r0, [fp, #-8]
   10098:	e50b100c 	str	r1, [fp, #-12]
	*reg = data;
   1009c:	e51b3008 	ldr	r3, [fp, #-8]
   100a0:	e51b200c 	ldr	r2, [fp, #-12]
   100a4:	e5832000 	str	r2, [r3]
}
   100a8:	e24bd000 	sub	sp, fp, #0
   100ac:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   100b0:	e12fff1e 	bx	lr

000100b4 <mmio_read>:
uint32 mmio_read(volatile uint32* reg) {
   100b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   100b8:	e28db000 	add	fp, sp, #0
   100bc:	e24dd00c 	sub	sp, sp, #12
   100c0:	e50b0008 	str	r0, [fp, #-8]
	return *reg;
   100c4:	e51b3008 	ldr	r3, [fp, #-8]
   100c8:	e5933000 	ldr	r3, [r3]
}
   100cc:	e1a00003 	mov	r0, r3
   100d0:	e24bd000 	sub	sp, fp, #0
   100d4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   100d8:	e12fff1e 	bx	lr

000100dc <uart0_init>:

void uart0_init() {
   100dc:	e92d4800 	push	{fp, lr}
   100e0:	e28db004 	add	fp, sp, #4
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
	mmio_write(UART0_CR, UART0_CR_EN | UART0_CR_ENABLE_TX_RX_FIFO); // Re-enable receive and transfer
	delay(150);
#else
		// Disable UART0.
	mmio_write(UART0_CR, 0x00000000);
   100e4:	e59f00dc 	ldr	r0, [pc, #220]	; 101c8 <uart0_init+0xec>
   100e8:	e3a01000 	mov	r1, #0
   100ec:	ebffffe5 	bl	10088 <mmio_write>
	// Setup the GPIO pin 14 && 15.
 
	// Disable pull up/down for all GPIO pins & delay for 150 cycles.
	mmio_write(GPPUD, 0x00000000);
   100f0:	e59f00d4 	ldr	r0, [pc, #212]	; 101cc <uart0_init+0xf0>
   100f4:	e3a01000 	mov	r1, #0
   100f8:	ebffffe2 	bl	10088 <mmio_write>
	delay(150);
   100fc:	e59f30cc 	ldr	r3, [pc, #204]	; 101d0 <uart0_init+0xf4>
   10100:	e3a02096 	mov	r2, #150	; 0x96
   10104:	e5832000 	str	r2, [r3]
   10108:	ea000000 	b	10110 <uart0_init+0x34>
   1010c:	e1a00000 	nop			; (mov r0, r0)
   10110:	e59f30b8 	ldr	r3, [pc, #184]	; 101d0 <uart0_init+0xf4>
   10114:	e5933000 	ldr	r3, [r3]
   10118:	e2432001 	sub	r2, r3, #1
   1011c:	e59f10ac 	ldr	r1, [pc, #172]	; 101d0 <uart0_init+0xf4>
   10120:	e5812000 	str	r2, [r1]
   10124:	e3530000 	cmp	r3, #0
   10128:	1afffff7 	bne	1010c <uart0_init+0x30>
 
	// Disable pull up/down for pin 14,15 & delay for 150 cycles.
	mmio_write(GPPUDCLK0, (1 << 14) | (1 << 15));
   1012c:	e59f00a0 	ldr	r0, [pc, #160]	; 101d4 <uart0_init+0xf8>
   10130:	e3a01903 	mov	r1, #49152	; 0xc000
   10134:	ebffffd3 	bl	10088 <mmio_write>
	delay(150);
   10138:	e59f3090 	ldr	r3, [pc, #144]	; 101d0 <uart0_init+0xf4>
   1013c:	e3a02096 	mov	r2, #150	; 0x96
   10140:	e5832000 	str	r2, [r3]
   10144:	ea000000 	b	1014c <uart0_init+0x70>
   10148:	e1a00000 	nop			; (mov r0, r0)
   1014c:	e59f307c 	ldr	r3, [pc, #124]	; 101d0 <uart0_init+0xf4>
   10150:	e5933000 	ldr	r3, [r3]
   10154:	e2432001 	sub	r2, r3, #1
   10158:	e59f1070 	ldr	r1, [pc, #112]	; 101d0 <uart0_init+0xf4>
   1015c:	e5812000 	str	r2, [r1]
   10160:	e3530000 	cmp	r3, #0
   10164:	1afffff7 	bne	10148 <uart0_init+0x6c>
 
	// Write 0 to GPPUDCLK0 to make it take effect.
	mmio_write(GPPUDCLK0, 0x00000000);
   10168:	e59f0064 	ldr	r0, [pc, #100]	; 101d4 <uart0_init+0xf8>
   1016c:	e3a01000 	mov	r1, #0
   10170:	ebffffc4 	bl	10088 <mmio_write>
 
	// Clear pending interrupts.
	mmio_write(UART0_ICR, 0x7FF);
   10174:	e59f005c 	ldr	r0, [pc, #92]	; 101d8 <uart0_init+0xfc>
   10178:	e59f105c 	ldr	r1, [pc, #92]	; 101dc <uart0_init+0x100>
   1017c:	ebffffc1 	bl	10088 <mmio_write>
	// Divider = UART_CLOCK/(16 * Baud)
	// Fraction part register = (Fractional part * 64) + 0.5
	// UART_CLOCK = 3000000; Baud = 115200.
 
	// Divider = 3000000 / (16 * 115200) = 1.627 = ~1.
	mmio_write(UART0_IBRD, 1);
   10180:	e59f0058 	ldr	r0, [pc, #88]	; 101e0 <uart0_init+0x104>
   10184:	e3a01001 	mov	r1, #1
   10188:	ebffffbe 	bl	10088 <mmio_write>
	// Fractional part register = (.627 * 64) + 0.5 = 40.6 = ~40.
	mmio_write(UART0_FBRD, 40);
   1018c:	e59f0050 	ldr	r0, [pc, #80]	; 101e4 <uart0_init+0x108>
   10190:	e3a01028 	mov	r1, #40	; 0x28
   10194:	ebffffbb 	bl	10088 <mmio_write>
 
	// Enable FIFO & 8 bit data transmissio (1 stop bit, no parity).
	mmio_write(UART0_LCRH, (1 << 4) | (1 << 5) | (1 << 6));
   10198:	e59f0048 	ldr	r0, [pc, #72]	; 101e8 <uart0_init+0x10c>
   1019c:	e3a01070 	mov	r1, #112	; 0x70
   101a0:	ebffffb8 	bl	10088 <mmio_write>
 
	// Mask all interrupts.
	mmio_write(UART0_IMSC, (1 << 1) | (1 << 4) | (1 << 5) | (1 << 6) |
   101a4:	e59f0040 	ldr	r0, [pc, #64]	; 101ec <uart0_init+0x110>
   101a8:	e59f1040 	ldr	r1, [pc, #64]	; 101f0 <uart0_init+0x114>
   101ac:	ebffffb5 	bl	10088 <mmio_write>
	                       (1 << 7) | (1 << 8) | (1 << 9) | (1 << 10));
 
	// Enable UART0, receive & transfer part of UART.
	mmio_write(UART0_CR, (1 << 0) | (1 << 8) | (1 << 9));
   101b0:	e59f0010 	ldr	r0, [pc, #16]	; 101c8 <uart0_init+0xec>
   101b4:	e59f1038 	ldr	r1, [pc, #56]	; 101f4 <uart0_init+0x118>
   101b8:	ebffffb2 	bl	10088 <mmio_write>
#endif
}
   101bc:	e24bd004 	sub	sp, fp, #4
   101c0:	e8bd4800 	pop	{fp, lr}
   101c4:	e12fff1e 	bx	lr
   101c8:	3f201030 	.word	0x3f201030
   101cc:	3f200094 	.word	0x3f200094
   101d0:	00010510 	.word	0x00010510
   101d4:	3f200098 	.word	0x3f200098
   101d8:	3f201044 	.word	0x3f201044
   101dc:	000007ff 	.word	0x000007ff
   101e0:	3f201024 	.word	0x3f201024
   101e4:	3f201028 	.word	0x3f201028
   101e8:	3f20102c 	.word	0x3f20102c
   101ec:	3f201038 	.word	0x3f201038
   101f0:	000007f2 	.word	0x000007f2
   101f4:	00000301 	.word	0x00000301

000101f8 <uart0_send_char>:

// Pushes a byte through the UART port
void uart0_send_char(char data) {
   101f8:	e92d4800 	push	{fp, lr}
   101fc:	e28db004 	add	fp, sp, #4
   10200:	e24dd008 	sub	sp, sp, #8
   10204:	e1a03000 	mov	r3, r0
   10208:	e54b3005 	strb	r3, [fp, #-5]
    while(mmio_read(UART0_FR) & UART0_FR_FULL) {}; // Wait until we can send
   1020c:	e1a00000 	nop			; (mov r0, r0)
   10210:	e59f005c 	ldr	r0, [pc, #92]	; 10274 <uart0_send_char+0x7c>
   10214:	ebffffa6 	bl	100b4 <mmio_read>
   10218:	e1a03000 	mov	r3, r0
   1021c:	e2033020 	and	r3, r3, #32
   10220:	e3530000 	cmp	r3, #0
   10224:	1afffff9 	bne	10210 <uart0_send_char+0x18>
	mmio_write(UART0_DR, data);
   10228:	e55b3005 	ldrb	r3, [fp, #-5]
   1022c:	e59f0044 	ldr	r0, [pc, #68]	; 10278 <uart0_send_char+0x80>
   10230:	e1a01003 	mov	r1, r3
   10234:	ebffff93 	bl	10088 <mmio_write>
	delay(150);
   10238:	e59f303c 	ldr	r3, [pc, #60]	; 1027c <uart0_send_char+0x84>
   1023c:	e3a02096 	mov	r2, #150	; 0x96
   10240:	e5832000 	str	r2, [r3]
   10244:	ea000000 	b	1024c <uart0_send_char+0x54>
   10248:	e1a00000 	nop			; (mov r0, r0)
   1024c:	e59f3028 	ldr	r3, [pc, #40]	; 1027c <uart0_send_char+0x84>
   10250:	e5933000 	ldr	r3, [r3]
   10254:	e2432001 	sub	r2, r3, #1
   10258:	e59f101c 	ldr	r1, [pc, #28]	; 1027c <uart0_send_char+0x84>
   1025c:	e5812000 	str	r2, [r1]
   10260:	e3530000 	cmp	r3, #0
   10264:	1afffff7 	bne	10248 <uart0_send_char+0x50>
}
   10268:	e24bd004 	sub	sp, fp, #4
   1026c:	e8bd4800 	pop	{fp, lr}
   10270:	e12fff1e 	bx	lr
   10274:	3f201018 	.word	0x3f201018
   10278:	3f201000 	.word	0x3f201000
   1027c:	00010510 	.word	0x00010510

00010280 <uart0_get_char>:

char uart0_get_char() {
   10280:	e92d4800 	push	{fp, lr}
   10284:	e28db004 	add	fp, sp, #4
   10288:	e24dd008 	sub	sp, sp, #8
    while (mmio_read(UART0_FR) & UART0_FR_EMPTY) {};
   1028c:	e1a00000 	nop			; (mov r0, r0)
   10290:	e59f0048 	ldr	r0, [pc, #72]	; 102e0 <uart0_get_char+0x60>
   10294:	ebffff86 	bl	100b4 <mmio_read>
   10298:	e1a03000 	mov	r3, r0
   1029c:	e2033010 	and	r3, r3, #16
   102a0:	e3530000 	cmp	r3, #0
   102a4:	1afffff9 	bne	10290 <uart0_get_char+0x10>
    char response = (char)mmio_read(UART0_DR);
   102a8:	e59f0034 	ldr	r0, [pc, #52]	; 102e4 <uart0_get_char+0x64>
   102ac:	ebffff80 	bl	100b4 <mmio_read>
   102b0:	e1a03000 	mov	r3, r0
   102b4:	e54b3005 	strb	r3, [fp, #-5]
    //Always get \n instead of \r
    return response == '\r' ? '\n' : response;
   102b8:	e55b3005 	ldrb	r3, [fp, #-5]
   102bc:	e353000d 	cmp	r3, #13
   102c0:	0a000001 	beq	102cc <uart0_get_char+0x4c>
   102c4:	e55b3005 	ldrb	r3, [fp, #-5]
   102c8:	ea000000 	b	102d0 <uart0_get_char+0x50>
   102cc:	e3a0300a 	mov	r3, #10
}
   102d0:	e1a00003 	mov	r0, r3
   102d4:	e24bd004 	sub	sp, fp, #4
   102d8:	e8bd4800 	pop	{fp, lr}
   102dc:	e12fff1e 	bx	lr
   102e0:	3f201018 	.word	0x3f201018
   102e4:	3f201000 	.word	0x3f201000

000102e8 <uart0_put_str>:

// Send a null-terminated string
void uart0_put_str(char* s) {
   102e8:	e92d4800 	push	{fp, lr}
   102ec:	e28db004 	add	fp, sp, #4
   102f0:	e24dd008 	sub	sp, sp, #8
   102f4:	e50b0008 	str	r0, [fp, #-8]
	while (*s) {
   102f8:	ea00000b 	b	1032c <uart0_put_str+0x44>
		//\n -> \r\n
		if (*s == '\n') {
   102fc:	e51b3008 	ldr	r3, [fp, #-8]
   10300:	e5d33000 	ldrb	r3, [r3]
   10304:	e353000a 	cmp	r3, #10
   10308:	1a000001 	bne	10314 <uart0_put_str+0x2c>
			uart0_send_char('\r');
   1030c:	e3a0000d 	mov	r0, #13
   10310:	ebffffb8 	bl	101f8 <uart0_send_char>
		}
		uart0_send_char(*s++);
   10314:	e51b3008 	ldr	r3, [fp, #-8]
   10318:	e2832001 	add	r2, r3, #1
   1031c:	e50b2008 	str	r2, [fp, #-8]
   10320:	e5d33000 	ldrb	r3, [r3]
   10324:	e1a00003 	mov	r0, r3
   10328:	ebffffb2 	bl	101f8 <uart0_send_char>
    return response == '\r' ? '\n' : response;
}

// Send a null-terminated string
void uart0_put_str(char* s) {
	while (*s) {
   1032c:	e51b3008 	ldr	r3, [fp, #-8]
   10330:	e5d33000 	ldrb	r3, [r3]
   10334:	e3530000 	cmp	r3, #0
   10338:	1affffef 	bne	102fc <uart0_put_str+0x14>
		if (*s == '\n') {
			uart0_send_char('\r');
		}
		uart0_send_char(*s++);
	}
}
   1033c:	e24bd004 	sub	sp, fp, #4
   10340:	e8bd4800 	pop	{fp, lr}
   10344:	e12fff1e 	bx	lr

00010348 <mailbox_send_message>:
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
   10348:	e92d0810 	push	{r4, fp}
   1034c:	e28db004 	add	fp, sp, #4
   10350:	e24dd018 	sub	sp, sp, #24
   10354:	e1a03000 	mov	r3, r0
   10358:	e54b3015 	strb	r3, [fp, #-21]	; 0xffffffeb
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
   1035c:	e1a00000 	nop			; (mov r0, r0)
    } while (*MBOX_STATUS & MBOX_FULL);
   10360:	e59f30c0 	ldr	r3, [pc, #192]	; 10428 <mailbox_send_message+0xe0>
   10364:	e5933000 	ldr	r3, [r3]
   10368:	e3530000 	cmp	r3, #0
   1036c:	bafffffa 	blt	1035c <mailbox_send_message+0x14>
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
   10370:	e55b1015 	ldrb	r1, [fp, #-21]	; 0xffffffeb
   10374:	e3a02000 	mov	r2, #0
   10378:	e59f30ac 	ldr	r3, [pc, #172]	; 1042c <mailbox_send_message+0xe4>
   1037c:	e3a04000 	mov	r4, #0
   10380:	e1833001 	orr	r3, r3, r1
   10384:	e1844002 	orr	r4, r4, r2
   10388:	e50b300c 	str	r3, [fp, #-12]
   1038c:	e50b4008 	str	r4, [fp, #-8]
    *MBOX_WRITE = mailbox_addr_or_channel;
   10390:	e59f2098 	ldr	r2, [pc, #152]	; 10430 <mailbox_send_message+0xe8>
   10394:	e51b300c 	ldr	r3, [fp, #-12]
   10398:	e5823000 	str	r3, [r2]
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
   1039c:	e1a00000 	nop			; (mov r0, r0)
        } while(*MBOX_STATUS & MBOX_EMPTY);
   103a0:	e59f3080 	ldr	r3, [pc, #128]	; 10428 <mailbox_send_message+0xe0>
   103a4:	e5933000 	ldr	r3, [r3]
   103a8:	e2033101 	and	r3, r3, #1073741824	; 0x40000000
   103ac:	e3530000 	cmp	r3, #0
   103b0:	1afffff9 	bne	1039c <mailbox_send_message+0x54>
        
        uint32 response = *MBOX_READ;
   103b4:	e59f3078 	ldr	r3, [pc, #120]	; 10434 <mailbox_send_message+0xec>
   103b8:	e5933000 	ldr	r3, [r3]
   103bc:	e50b3010 	str	r3, [fp, #-16]
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
   103c0:	e51b3010 	ldr	r3, [fp, #-16]
   103c4:	e20330ff 	and	r3, r3, #255	; 0xff
   103c8:	e203200f 	and	r2, r3, #15
   103cc:	e55b3015 	ldrb	r3, [fp, #-21]	; 0xffffffeb
   103d0:	e1520003 	cmp	r2, r3
   103d4:	1a00000d 	bne	10410 <mailbox_send_message+0xc8>
   103d8:	e51b3010 	ldr	r3, [fp, #-16]
   103dc:	e3c3300f 	bic	r3, r3, #15
   103e0:	e59f2044 	ldr	r2, [pc, #68]	; 1042c <mailbox_send_message+0xe4>
   103e4:	e1530002 	cmp	r3, r2
   103e8:	1a000008 	bne	10410 <mailbox_send_message+0xc8>
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
   103ec:	e59f3038 	ldr	r3, [pc, #56]	; 1042c <mailbox_send_message+0xe4>
   103f0:	e5933004 	ldr	r3, [r3, #4]
   103f4:	e3530102 	cmp	r3, #-2147483648	; 0x80000000
   103f8:	03a03001 	moveq	r3, #1
   103fc:	13a03000 	movne	r3, #0
   10400:	e20330ff 	and	r3, r3, #255	; 0xff
   10404:	e20330ff 	and	r3, r3, #255	; 0xff
   10408:	e3a04000 	mov	r4, #0
   1040c:	ea000000 	b	10414 <mailbox_send_message+0xcc>
        }
    }
   10410:	eaffffe1 	b	1039c <mailbox_send_message+0x54>
    return 0;
}
   10414:	e1a00003 	mov	r0, r3
   10418:	e1a01004 	mov	r1, r4
   1041c:	e24bd004 	sub	sp, fp, #4
   10420:	e8bd0810 	pop	{r4, fp}
   10424:	e12fff1e 	bx	lr
   10428:	3f00b898 	.word	0x3f00b898
   1042c:	00010520 	.word	0x00010520
   10430:	3f00b8a0 	.word	0x3f00b8a0
   10434:	3f00b880 	.word	0x3f00b880

00010438 <undefined_instruction_handler>:
//Handles traps
#include "arm.h"

void undefined_instruction_handler(struct trap_frame* tf) {
   10438:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   1043c:	e28db000 	add	fp, sp, #0
   10440:	e24dd00c 	sub	sp, sp, #12
   10444:	e50b0008 	str	r0, [fp, #-8]
	
}
   10448:	e24bd000 	sub	sp, fp, #0
   1044c:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10450:	e12fff1e 	bx	lr

00010454 <software_interrupt_handler>:
void software_interrupt_handler(struct trap_frame* tf) {
   10454:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10458:	e28db000 	add	fp, sp, #0
   1045c:	e24dd00c 	sub	sp, sp, #12
   10460:	e50b0008 	str	r0, [fp, #-8]
	
}
   10464:	e24bd000 	sub	sp, fp, #0
   10468:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   1046c:	e12fff1e 	bx	lr

00010470 <prefetch_abort_handler>:
void prefetch_abort_handler(struct trap_frame* tf) {
   10470:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10474:	e28db000 	add	fp, sp, #0
   10478:	e24dd00c 	sub	sp, sp, #12
   1047c:	e50b0008 	str	r0, [fp, #-8]
	
}
   10480:	e24bd000 	sub	sp, fp, #0
   10484:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   10488:	e12fff1e 	bx	lr

0001048c <data_abort_handler>:
void data_abort_handler(struct trap_frame* tf) {
   1048c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   10490:	e28db000 	add	fp, sp, #0
   10494:	e24dd00c 	sub	sp, sp, #12
   10498:	e50b0008 	str	r0, [fp, #-8]
	
}
   1049c:	e24bd000 	sub	sp, fp, #0
   104a0:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   104a4:	e12fff1e 	bx	lr

000104a8 <unused_exception_handler>:
void unused_exception_handler(struct trap_frame* tf) {
   104a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   104ac:	e28db000 	add	fp, sp, #0
   104b0:	e24dd00c 	sub	sp, sp, #12
   104b4:	e50b0008 	str	r0, [fp, #-8]
	
}
   104b8:	e24bd000 	sub	sp, fp, #0
   104bc:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   104c0:	e12fff1e 	bx	lr

000104c4 <irq_handler>:
void irq_handler(struct trap_frame* tf) {
   104c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   104c8:	e28db000 	add	fp, sp, #0
   104cc:	e24dd00c 	sub	sp, sp, #12
   104d0:	e50b0008 	str	r0, [fp, #-8]
	
}
   104d4:	e24bd000 	sub	sp, fp, #0
   104d8:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   104dc:	e12fff1e 	bx	lr

000104e0 <fiq_handler>:
void fiq_handler(struct trap_frame* tf) {
   104e0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
   104e4:	e28db000 	add	fp, sp, #0
   104e8:	e24dd00c 	sub	sp, sp, #12
   104ec:	e50b0008 	str	r0, [fp, #-8]
	
}
   104f0:	e24bd000 	sub	sp, fp, #0
   104f4:	e49db004 	pop	{fp}		; (ldr fp, [sp], #4)
   104f8:	e12fff1e 	bx	lr
