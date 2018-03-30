OBJS = main.o \
       uart.o \

QEMU = qemu-system-arm

GDBPORT = 1234

QEMUOPTS = -M versatilepb \
           -m 128 \
           -cpu arm1176 \
           -nographic \
           -kernel kernel.elf

QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
                      then echo "-gdb tcp::$(GDBPORT)"; \
                      else echo "-s -p $(GDBPORT)"; fi)

CROSSCOMPILE := arm-none-eabi-
CC = $(CROSSCOMPILE)gcc
AS = $(CROSSCOMPILE)as
LD = $(CROSSCOMPILE)ld
OBJCOPY = $(CROSSCOMPILE)objcopy
OBJDUMP = $(CROSSCOMPILE)objdump

# -march=armv6 tells gcc to generate code for that exact kind of CPU (i.e. what the RP runs)
# If something is broken try changing back to armv6
CFLAGS = -march=armv8-a -nostdlib -fno-pic -static -fno-builtin -fno-strict-aliasing -ggdb -O0 -Wall -Werror -I -c.
LDFLAGS = -L.
ASFLAGS = -march=armv8-a

all: kernel.elf

build/%.o: %.c
	mkdir -p build
	$(CC) $< $(CFLAGS) -o $@

entry: entry.S
	$(CC) $< $(CFLAGS) -fno-pic -nostdinc -I. -c entry.S

KERN_OBJS = $(OBJS) 
kernel.elf: $(addprefix build/,$(KERN_OBJS)) entry kernel.ld #build/fs.img build/initcode
	$(LD) -T kernel.ld  -o kernel.elf $(addprefix build/,$(KERN_OBJS)) entry.S
	$(OBJDUMP) -S kernel.elf > kernel.asm
	$(OBJDUMP) -t kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym

qemu: kernel.elf
	@clear
	@echo "Press Ctrl-A and then X to terminate QEMU session\n"
	$(QEMU) $(QEMUOPTS)

qemu-gdb: kernel.elf
	@echo "*** Now run 'gdb'." 1>&2
	$(QEMU) -serial mon:stdio $(QEMUOPTS) -S $(QEMUGDB)

# INITCODE_OBJ = initcode.o
# $(addprefix build/,$(INITCODE_OBJ)): initcode.S
# 	$(call build-directory)
# 	$(call AS_WITH, -nostdinc -I.)

# #initcode is linked into the kernel, it will be used to craft the first process
# build/initcode: $(addprefix build/,$(INITCODE_OBJ))
# 	$(call LINK_INIT, -N -e start -Ttext 0)
# 	$(call OBJCOPY_INIT)
# 	$(OBJDUMP) -S $< > initcode.asm

#build/fs.img:
	#make -C tools
	#make -C usr

clean: 
	rm -rf build
	rm -f *.o *.d *.asm *.sym 
