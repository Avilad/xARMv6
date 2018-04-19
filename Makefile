# Toolchain flags
KERN_OBJS = entry.o         \
            main.o          \
            vm.o            \
						mp.o            \
            uart.o          \
						vectors.o       \
            trap_asm.o      \
						initcode.o      \
						swtch.o         \
            trap.o          \
            timer.o         \
						proc.o          \
            mem_utils.o     \
            panic.o         \
            console.o       \
            syscall.o       \
						sysproc.o       \
						sysfile.o       \
						exec.o					\
						spinlock.o      \
						sleeplock.o			\
						memide.o        \
						bio.o           \
						log.o           \
						file.o          \
						pipe.o          \
						fs.o						\
						utils.o

QEMU = qemu-system-arm-2.11.0

QEMUOPTS = -M raspi2         \
           -m 1024           \
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
LDFLAGS =
ASFLAGS = -fno-pic -c


# Scripts for object files and kernel
all: kernel.elf

build/entry.o: entry.S
	mkdir -p build
	$(CC) $< $(ASFLAGS) -o $@

build/trap_asm.o: trap_asm.S
	mkdir -p build
	$(CC) $< $(ASFLAGS) -o $@

build/vectors.o: vectors.S
	mkdir -p build
	$(CC) $< $(ASFLAGS) -o $@

build/swtch.o: swtch.S
	mkdir -p build
	$(CC) $< $(ASFLAGS) -o $@

build/initcode.o: initcode.S
	mkdir -p build
	@echo $@
	$(CC) $< $(ASFLAGS) -o $@
	$(LD) $(LDFLAGS) -N -e start -Ttext 80000000 -o initcode.out build/initcode.o
	$(OBJCOPY) -S -O binary initcode.out initcode
	$(LD) -r -b binary initcode -o build/initcode.o
	rm -f initcode initcode.out

build/%.o: %.c
	mkdir -p build
	$(CC) $< $(CFLAGS) -o $@

# Need this library for the (u)div instructions since arm doesn't have a div built in
LIBGCC = $(shell $(CC) -print-libgcc-file-name)

kernel.elf: $(addprefix build/,$(KERN_OBJS)) kernel.ld build/fs.img.o
	$(LD) -T kernel.ld  -o $@ $(addprefix build/,$(KERN_OBJS)) $(LIBGCC) build/fs.img.o
	$(OBJDUMP) -S kernel.elf > kernel.asm
	$(OBJDUMP) -t kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym

# Filesystem scripts
mkfs: mkfs.c fs.h
	gcc -Werror -Wall -o mkfs mkfs.c

UPROGS=

fs.img: mkfs README.org $(UPROGS)
	./mkfs fs.img README.org $(UPROGS)

build/fs.img.o: fs.img
	$(LD) -r -b binary fs.img -o build/fs.img.o
	rm -f fs.img

# QEMU run scripts
qemu: kernel.elf
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
	rm -f *.o *.d *.asm *.sym *.elf mkfs fs.img
