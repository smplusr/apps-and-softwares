ARGS=		Ã 


all:		argv-run.o argv-run.elf clean run


argv-run.o:	argv-run.s
	as -o $@ $<

argv-run.elf:	argv-run.o
	ld -no-pie -o $@ $<


clean:		argv-run.o
	$(RM) -f $<

run:		argv-run.elf
	./$< $(ARGS)
