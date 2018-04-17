//Arm specific defines and structures
#ifndef ARM_H
#define ARM_H

//For C Code
#ifndef __ASSEMBLER__
#include "types.h"
typedef struct {
    uint sp;
    uint lr;
    uint r[13];
    uint lr_svc; // (== pc if SVC exception)
    uint pc;
    uint cpsr;
} trapframe;
#endif

// For assembly and C code
// Program status register bitmasks
#define PSR_MODE_MASK              0x1f
#define PSR_THUMB_STATE 					(1 << 5)
#define PSR_FIQ_MASK 							(1 << 6)
#define PSR_IRQ_MASK 							(1 << 7)
#define PSR_ASNYC_ABORT_MASK			(1 << 8)

// ARM has 7 operating modes
// Not to be confused with their instruction set modes
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

#define VECTOR_TABLE_START ((uint*)0)

#endif
