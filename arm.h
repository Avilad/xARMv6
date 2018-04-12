#ifndef ARM_H
#define ARM_H
//Arm specific defines and structures

//For C Code
#ifndef __ASSEMBLER__
#include "types.h"
struct trap_frame {
	//ARM SPSR (saved program status register) for the user
	//Stores condition codes from the ALU, permissions for the user, etc.
	uint32 user_link_register;
	uint32 user_stack_register;
	uint32 user_saved_status_register; //User saved SPSR
	uint32 user_return_address;
	uint32 general_registers[13]; //r0-r12 in the logical order
};
#endif

// For assembly and C code
// status register interrupt enable/disable bits
#define NO_INT      0xc0
#define DIS_INT     0x80

// ARM has 7 privelege modes
// Not to be confused with their execution modes
// which execute three different instruction sets
// we are only concerned with arm instructions
// On mode switch registers are automatically switched by the processor
// we are responsible for saving any general purpose registers we clobber
// the processor will save sp and lr for us.
// @todo figure out where rpi's hypervisor mode fits into this
#define MODE_MASK   0x1f //Mode bit in status register
#define USR_MODE    0x10 //User mode
#define FIQ_MODE    0x11 //Fast interrupt handling (unused)
#define IRQ_MODE    0x12 //Timer interrupt handling
#define SVC_MODE    0x13 //Supervisor Call mode
#define ABT_MODE    0x17 //Abort (exception) mode
#define UND_MODE    0x1b //Undefined instruction executed mode
#define SYS_MODE    0x1f //System mode, not entered by exceptions, must be manually entered

#define VECTOR_TABLE_START ((uint32*)0)

#endif
