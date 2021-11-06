all:		file-run.o file-run.elf clean file.bin run


file-run.o:	file-run.asm
	nasm -f elf32 $<

file-run.elf:	file-run.o
	ld -no-pie -o $@ $<

file.bin:	file.txt
	xxd -r -p $< >> $@

clean:		file-run.o file.bin
	touch file.bin
	$(RM) -f $<

run:		file-run.elf
	./$< file.bin
