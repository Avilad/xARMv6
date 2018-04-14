# Toolchain flags
KERN_OBJS = entry.o         \
            main.o          \
            vm.o            \
            mem_mapped_io.o \
            mailbox.o       \
            trap_asm.o      \
			trap.o          \
			timer.o         \
			mem_utils.o     \
			panic.o         \
			arm_asm_intrinsics.o \
			console.o       \
			syscall.o       \

QEMU = qemu-system-arm-2.11.0

QEMUOPTS = -M raspi2         \
           -m 256            \
           -serial mon:stdio \
           -nographic        \
           -kernel kernel.elf

CROSSCOMPILE := arm-none-eabi-
CC = $(CROSSCOMPILE)gcc
AS = $(CROSSCOMPILE)as
LD = $(CROSSCOMPILE)ld
OBJCOPY = $(CROSSCOMPILE)objcopy
OBJDUMP = $(CROSSCOMPILE)objdump

CFLAGS = -std=gnu99 -nostdlib -fno-pic -static -fno-builtin -fno-strict-aliasing -ggdb -O0 -Wall -c -mcpu=cortex-a7
LDFLAGS = -L
ASFLAGS = -fno-pic -c


# Scripts for object files and kernel
all: kernel.elf

build/entry.o: entry.S
	mkdir -p build
	$(CC) $< $(ASFLAGS) -o $@

build/trap_asm.o: trap_asm.S
	mkdir -p build
	$(CC) $< $(ASFLAGS) -o $@

build/%.o: %.c
	mkdir -p build
	$(CC) $< $(CFLAGS) -o $@

# Need this library for the (u)div instructions since arm doesn't have a div built in
LIBGCC = $(shell $(CC) -print-libgcc-file-name)

kernel.elf: $(addprefix build/,$(KERN_OBJS)) kernel.ld
	$(LD) -T kernel.ld  -o $@ $(addprefix build/,$(KERN_OBJS)) $(LIBGCC)
	$(OBJDUMP) -S kernel.elf > kernel.asm
	$(OBJDUMP) -t kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym


# QEMU run scripts
qemu: kernel.elf
	@clear
	@echo "Press Ctrl-A and then X to terminate QEMU session\n"
	$(QEMU) $(QEMUOPTS)

# -S means you must run 'c' in GDB to run first instruction
# -s is shorthand for -gdb tcp::1234
qemu-gdb: kernel.elf .gdbinit
	@echo "*** Now run 'gdb-multiarch'." 1>&2
	$(QEMU) $(QEMUOPTS) -S -s


# Utility scripts
clean:
	rm -rf build
	rm -f *.o *.d *.asm *.sym *.elf
