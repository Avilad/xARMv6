#include "types.h"
#include "param.h"
#include "fs.h"
#include "log.h"
#include "console.h"
#include "vm.h"
#include "memlayout.h"
// #include "mmu.h"
#include "proc.h"
// #include "defs.h"
// #include "x86.h"
#include "elf.h"
#include "utils.h"

int
exec(char *path, char **argv)
{
  char *s, *last;
  int i, off;
  uint argc, top, sp, ustack[MAXARG+1];
  elfhdr elf;
  inode *ip;
  proghdr ph;
  pde_t *pgdir, *oldpgdir;
  proc *curproc = myproc();

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
    goto bad;

  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  top = USERBASE;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
      continue;
    if(ph.memsz < ph.filesz)
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
      goto bad;
    if((top = allocuvm(pgdir, top, ph.vaddr + ph.memsz)) == 0)
      goto bad;
    if(ph.vaddr % MB != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
  end_op();
  ip = 0;

  // Allocate a page at the next page boundary, and use it as the user stack.
  // (No guard page since our pages are so huge and we don't have many)
  top = (uint)SECTION_ROUND_UP(top);
  if((top = allocuvm(pgdir, top, top + MB)) == 0)
    goto bad;
  // clearpteu(pgdir, (char*)(top - 2*MB));
  sp = top;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, (char *)sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[argc] = sp;
  }
  ustack[argc] = 0;

  curproc->tf->r[0] = argc;
  curproc->tf->r[1] = sp - (argc+1)*4;  // argv pointer

  sp -= (argc+1) * 4;
  if(copyout(pgdir, (char *)sp, ustack, (argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    if(*s == '/')
      last = s+1;
  strncpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
  curproc->sz = top - USERBASE;
  curproc->tf->pc = elf.entry; // main
  curproc->tf->sp = sp;
  switchuvm(curproc);
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
}
