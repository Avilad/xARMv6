set architecture arm

echo + target remote localhost:1234\n
target remote localhost:1234

echo + symbol-file kernel\n
symbol-file kernel.elf
