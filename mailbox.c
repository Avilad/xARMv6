#include "mem_mapped_io.h"
#include "types.h"

volatile uint32  __attribute__((aligned(16))) mailbox_message_buffer[36];

//Memory mapped io and constants
#define VIDEOCORE_MBOX  (MMIO_BASE+0x0000B880)
#define MBOX_READ       ((uint32*)(VIDEOCORE_MBOX+0x0))
#define MBOX_POLL       ((uint32*)(VIDEOCORE_MBOX+0x10))
#define MBOX_SENDER     ((uint32*)(VIDEOCORE_MBOX+0x14))
#define MBOX_STATUS     ((uint32*)(VIDEOCORE_MBOX+0x18))
#define MBOX_CONFIG     ((uint32*)(VIDEOCORE_MBOX+0x1C))
#define MBOX_WRITE      ((uint32*)(VIDEOCORE_MBOX+0x20))
#define MBOX_RESPONSE   0x80000000
#define MBOX_FULL       0x80000000
#define MBOX_EMPTY      0x40000000

//Sends a message via mailbox returns whether successful
bool64 mailbox_send_message(uint8 channel) {
    //Wait until the mailbox isn't full
    do {
	    asm volatile("nop");
    } while (*MBOX_STATUS & MBOX_FULL);
    
    if (channel & 0xF) {
	    //@todo panic
    }
    //@todo shouldnt have to cast to uint32 first, change back once our compiler is targeting 64 bit
    uint64 mailbox_addr_or_channel = ((uint64)(uint32)&mailbox_message_buffer) | channel; //Zero last 4 bits for channel identifier
    *MBOX_WRITE = mailbox_addr_or_channel;
    
    while (1) {
	    //Wait for response
        do {
	        asm volatile("nop");
        } while(*MBOX_STATUS & MBOX_EMPTY);
        
        uint32 response = *MBOX_READ;
        
        //Is the response for us, if not keep looping
        //@todo same as above
        if((uint8)(response & 0xF) == channel && (response & ~0xF) == (uint64)(uint32)&mailbox_message_buffer) {
            return mailbox_message_buffer[1] == MBOX_RESPONSE;
        }
    }
    return 0;
}
