QEMU = qemu-system-arm

# Cross-compiling (e.g., on Mac OS X, install arm-none-eabi-gcc with MacPorts)
CROSSCOMPILE := arm-none-eabi-

CC = $(CROSSCOMPILE)gcc
AS = $(CROSSCOMPILE)as
LD = $(CROSSCOMPILE)ld
OBJCOPY = $(CROSSCOMPILE)objcopy
OBJDUMP = $(CROSSCOMPILE)objdump

# -march=armv6 tells gcc to generate code for that exact kind of CPU (i.e. what the RP runs)
CFLAGS = -march=armv6 -fno-pic -static -fno-builtin -fno-strict-aliasing -ggdb -O0 -Wall -Werror -I.
LDFLAGS = -L.
ASFLAGS = -march=armv6 

LIBGCC = $(shell $(CC) -print-libgcc-file-name)

# Specify your host compiler
HOSTCC_preferred = gcc
define get_hostcc
    $(if $(shell which $(HOSTCC_preferred)),$(HOSTCC_preferred),"cc")
endef
HOSTCC := $(call get_hostcc)

# link the libgcc.a for __aeabi_idiv. ARM has no native support for div
LIBS = $(LIBGCC)

OBJS = \
	lib/string.o \
	\
	arm.o\
	asm.o\
	bio.o\
	buddy.o\
	console.o\
	exec.o\
	file.o\
	fs.o\
	log.o\
	main.o\
	memide.o\
	pipe.o\
	proc.o\
	spinlock.o\
	start.o\
	swtch.o\
	syscall.o\
	sysfile.o\
	sysproc.o\
	trap_asm.o\
	trap.o\
	vm.o \
	\
	device/picirq.o \
	device/timer.o \
	device/uart.o

KERN_OBJS = $(OBJS) entry.o
kernel.elf: $(addprefix build/,$(KERN_OBJS)) kernel.ld build/initcode build/fs.img
	cp -f build/initcode initcode
	cp -f build/fs.img fs.img
	$(call LINK_BIN, kernel.ld, kernel.elf, \
		$(addprefix build/,$(KERN_OBJS)), \
		initcode fs.img)
	$(OBJDUMP) -S kernel.elf > kernel.asm
	$(OBJDUMP) -t kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym
	rm -f initcode fs.img


GDBPORT = 1234

QEMUOPTS = -M versatilepb \
           -m 128 \
           -cpu arm1176 \
           -nographic \
           -kernel kernel.elf

QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
                      then echo "-gdb tcp::$(GDBPORT)"; \
                      else echo "-s -p $(GDBPORT)"; fi)

.gdbinit: .gdbinit.tmpl
	sed "s/localhost:1234/localhost:$(GDBPORT)/"	 < $^ > $@

qemu: kernel.elf
	@clear
	@echo "Press Ctrl-A and then X to terminate QEMU session\n"
	$(QEMU) $(QEMUOPTS)

qemu-gdb: kernel.elf .gdbinit
	@echo "*** Now run 'gdb'." 1>&2
	$(QEMU) -serial mon:stdio $(QEMUOPTS) -S $(QEMUGDB)

INITCODE_OBJ = initcode.o
$(addprefix build/,$(INITCODE_OBJ)): initcode.S
	$(call build-directory)
	$(call AS_WITH, -nostdinc -I.)

#initcode is linked into the kernel, it will be used to craft the first process
build/initcode: $(addprefix build/,$(INITCODE_OBJ))
	$(call LINK_INIT, -N -e start -Ttext 0)
	$(call OBJCOPY_INIT)
	$(OBJDUMP) -S $< > initcode.asm

build/fs.img:
	make -C tools
	make -C usr

clean: 
	rm -rf build
	rm -f *.o *.d *.asm *.sym vectors.S bootblock entryother \
	initcode initcode.out kernel xv6.img fs.img kernel.elf memfs
	make -C tools clean
	make -C usr clean
