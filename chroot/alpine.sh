#!/bin/sh
web="http://dl-cdn.alpinelinux.org/alpine/v3.16/releases/x86_64/alpine-virt-3.16.0-x86_64.iso"
rom="alpine-virt-3.16.0-x86_64.iso"

mem=128
cpu=1


function build {
	if ! test -f $rom; then
		wget $web
	fi

	command="$command \
		qemu-system-x86_64 \
			-m $mem -smp $cpu \
			-nographic \
			-cdrom $rom \
			-boot d 
		"

	if ! test $kvm -eq "0"; then
		command="$command \
			-machine type=q35,accel=kvm -cpu host \
			-enable-kvm \
			"
	fi

	if ! test -z $hda; then
		if ! test -f $hda; then
			eval "qemu-img create -f raw $hda ${mem}M"
		fi
		command="$command \
			-hda $hda
			"
	fi
}


while getopts ":m:c:f:r:k" opt; do
	case "$opt" in
		m)
			mem=$OPTARG
			;;
		c)
			cpu=$OPTARG
			;;
		f)
			hda=$OPTARG
			;;
		r)
			rom=$OPTARG
			;;
		k)
			kvm=1
			;;
	esac
done


build
eval $command
