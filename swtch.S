// Context switch
//
//   void swtch(context **old, context *new);
//
// Save the current registers on the stack, creating
// a context, and save its address in *old.
// Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  // Save old callee-save registers
  stmfd sp!, {r4-r12, lr}

  // Switch stacks
  str sp, [r0] // *old = sp
  mov sp, r1   // sp = new

  // Load new callee-save registers and return
  ldmfd sp!, {r4-r12, pc}
