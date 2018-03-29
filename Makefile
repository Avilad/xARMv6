QEMU = qemu-system-arm

# Cross-compiling (e.g., on Mac OS X, install arm-none-eabi-gcc with MacPorts)
CROSSCOMPILE := arm-none-eabi-

CC = $(CROSSCOMPILE)gcc
AS = $(CROSSCOMPILE)as
LD = $(CROSSCOMPILE)ld
OBJCOPY = $(CROSSCOMPILE)objcopy
OBJDUMP = $(CROSSCOMPILE)objdump

# -march=armv6 tells gcc to generate code for that exact kind of CPU (i.e. what the RP runs)
#@todo if something is broken try changing back to armv6
CFLAGS = -march=armv8 -nostdlib -fno-pic -static -fno-builtin -fno-strict-aliasing -ggdb -O0 -Wall -Werror -I.
LDFLAGS = -L.
ASFLAGS = -march=armv8

LIBGCC = $(shell $(CC) -print-libgcc-file-name)

# Specify your host compiler
HOSTCC_preferred = gcc
define get_hostcc
    $(if $(shell which $(HOSTCC_preferred)), $(HOSTCC_preferred), "cc")
endef
HOSTCC := $(call get_hostcc)

# link the libgcc.a for __aeabi_idiv. ARM has no native support for div
LIBS = $(LIBGCC)

OBJS = main.o

build/%.o: %.c
	mkdir -p build
	$(CC) $(CFLAGS) $< -o $@

KERN_OBJS = $(OBJS) #entry.o
kernel.elf: $(addprefix build/,$(KERN_OBJS)) kernel.ld #build/fs.img build/initcode
	$(LD) -T kernel.ld  -o kernel.elf $(addprefix build/,$(KERN_OBJS)) #@todo build/kernel.elf???
	$(OBJDUMP) -S kernel.elf > kernel.asm
	$(OBJDUMP) -t kernel.elf | sed '1,/SYMBOL TABLE/d; s/ .* / /; /^$$/d' > kernel.sym

#$(call LINK_BIN, kernel.ld, kernel.elf, $(addprefix build/,$(KERN_OBJS))) #, fs.img initcode
#removed from the above makey thingy
#at start
#cp -f build/initcode initcode
#cp -f build/fs.img fs.img

#at end
#rm -f initcode fs.img


GDBPORT = 1234

QEMUOPTS = -M versatilepb \
           -m 128 \
           -cpu arm1176 \
           -nographic \
           -kernel kernel.elf

QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
                      then echo "-gdb tcp::$(GDBPORT)"; \
                      else echo "-s -p $(GDBPORT)"; fi)

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
	rm -f *.o *.d *.asm *.sym vectors.S bootblock entryother \
	initcode initcode.out kernel xv6.img fs.img kernel.elf memfs
	make -C tools clean
	make -C usr clean
