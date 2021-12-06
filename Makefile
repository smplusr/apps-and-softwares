all:	mbr.bin kern.bin	amkgbs.bin


mbr.bin:	src/mbr.asm
	nasm -f bin $< -o $@

kern.bin:	src/kern-test.asm
	nasm -f bin $< -o $@

amkgbs.bin:	mbr.bin kern.bin
	rm -rf bin/$@
	cat $^ >> bin/$@
	$(RM) -rf *.bin


#emulate:	bin/amkgbs.bin
#	qemu-system-i386 -hda $<


