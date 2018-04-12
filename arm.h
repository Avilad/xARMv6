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
// Program status register bitmasks
#define PSR_MODE_MASK              0x1f
#define PSR_FIQ_INTERRUPT_DISABLE (1 << 6)
#define PSR_IRQ_INTERRUPT_DISABLE (1 << 7)
#define PSR_DISABLE_INTERRUPTS    (PSR_FIQ_INTERRUPT_DISABLE | PSR_IRQ_INTERRUPT_DISABLE)

// ARM has 7 privelege modes
// Not to be confused with their execution modes
// which execute three different instruction sets
// we are only concerned with arm instructions
// On mode switch registers are automatically switched by the processor
// we are responsible for saving any general purpose registers we clobber
// the processor will save sp and lr for us.
#define PSR_USER_MODE                  0x10
#define PSR_FIQ_MODE                   0x11 //Fast interrupt handling (unused)
#define PSR_IRQ_MODE                   0x12 //Timer interrupt handling
#define PSR_SUPERVISOR_MODE            0x13 //Supervisor Call mode (used for system calls)
#define PSR_ABORT_MODE                 0x17 //Abort (exception) mode
#define PSR_UNDEFINED_INSTRUCTION_MODE 0x1b //Entered when an undefined instruction is executed
#define PSR_SYSTEM_MODE                0x1f //System mode, not entered by exceptions, must be manually entered

#define VECTOR_TABLE_START ((uint32*)0)

#endif
