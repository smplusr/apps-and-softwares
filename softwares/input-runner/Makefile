all:		input-run.o input-run.elf clean run


input-run.o:	input-run.asm
	nasm -f elf32 $<

input-run.elf:	input-run.o
	ld -no-pie -o $@ $<

clean:		input-run.o
	$(RM) -f $<

run:		input-run.elf
	./$< input.bin
