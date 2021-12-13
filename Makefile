all:	mbr.bin kern.bin	amkgbs.bin


mbr.bin:	src/mbr.asm
	nasm -f bin $< -o $@

kern.bin:	src/kern.asm
	nasm -f bin $< -o $@

amkgbs.bin:	mbr.bin kern.bin
	rm -rf bin/$@
	cat $^ >> bin/$@
	$(RM) -rf *.bin


#emulate:	bin/amkgbs.bin
#	qemu-system-i386 -hda $<

commit:
	git commit -a -m "update"

push:
	echo "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"
	git push origin master
