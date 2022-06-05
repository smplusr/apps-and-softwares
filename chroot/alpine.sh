#!/bin/sh
web="http://dl-cdn.alpinelinux.org/alpine/v3.16/releases/x86_64/alpine-virt-3.16.0-x86_64.iso"
rom="alpine-virt-3.16.0-x86_64.iso"

len="128M"
mem="512M"


while getopts ":m:l:f:r:k" opt; do
	case "$opt" in
		m)
			mem=$OPTARG
			;;
        l)
			len=$OPTARG
			;;
		f)
			hda=$OPTARG
			;;
		r)
			rom=$OPTARG
			;;
		k)
			kvm="true"
			;;
	esac
done


if ! test -f $rom; then
	wget $web
fi

command="$command \
	qemu-system-x86_64 \
		-nographic \
		-m $mem -smp $(nproc) \
        -machine type=q35,accel=tcg,usb=off,dump-guest-core=off \
		-drive file=$rom,media=cdrom,cache=writeback \
		-boot d
	"

if ! test -z $kvm; then
	command="$command -machine type=q35,accel=kvm -cpu host"
fi

if ! test -z $hda; then
	if ! test -f $hda; then
		eval "qemu-img create -f raw $hda $len"
	fi
	command="$command -drive file=$hda,if=virtio,format=raw,cache=writeback"
fi


eval $command
