//Functions for reading and writing ARM mailboxes

#include "MemoryMappedIO.h"

//Is the mailbox message a request or a response to a previous request
#define MBOX_REQUEST    

//Channel definitions
#define MBOX_CH_POWER   0
#define MBOX_CH_FB      1
#define MBOX_CH_VUART   2
#define MBOX_CH_VCHIQ   3
#define MBOX_CH_LEDS    4
#define MBOX_CH_BTNS    5
#define MBOX_CH_TOUCH   6
#define MBOX_CH_COUNT   7
#define MBOX_CH_PROP    8

//@todo document, add more of these probably
#define MBOX_TAG_GETSERIAL      0x10004
#define MBOX_TAG_LAST           0

//Mailbox message buffer, must be 16 byte aligned
extern volatile uint32 mailbox_message_buffer[36];

bool64 mailbox_send_message(uint8 channel);
