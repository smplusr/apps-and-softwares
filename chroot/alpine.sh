#!/bin/sh
web="http://dl-cdn.alpinelinux.org/alpine/v3.16/releases/x86_64/alpine-virt-3.16.0-x86_64.iso"
iso="alpine-virt-3.16.0-x86_64.iso"

mem="512M"

help="\n
	Virtualized Alpine system. Runs a fully functionnal Live CDROM only Alpine linux guest. \n
	Requires qemu-system-x86_64. \n
	Option (all optionnal) : \n
		-m	memory (RAM), default : '$mem' \n
		-f	live ISO, default : '$iso' \n
		-k	enables KVM acceleration, default : 'UNSET' \n
		-h	help \n	"



while getopts ":m:f:k:h" opt; do
	case "$opt" in
		m)
			mem=$OPTARG
			;;
		f)
			iso=$OPTARG
			;;
		k)
			kvm="true"
			;;
		h)
			echo -e $help
			exit 0
			;;
	esac
done


if ! test -f $iso; then
	wget $web
fi

command="$command \
	qemu-system-x86_64 \
		-nographic \
		-m $mem -smp $(nproc) \
		-net nic -net user,hostfwd=tcp::2222-:22 \
        	-machine type=q35,accel=tcg,usb=off,dump-guest-core=off \
		-drive file=$iso,media=cdrom,cache=writeback \
		-boot d
	"

if ! test -z $kvm; then
	command="$command -enable-kvm"
fi


eval $command
