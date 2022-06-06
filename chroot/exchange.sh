format="vfat"
file="disk"
dir="shared/"

help="\n
	Qemu raw disk file exchanger. Retreives and send files from and to a disk file. \n
	Options : \n
		-f	file, default : '$file' \n
		-t	format, default : '$format' \n
		-d	directory, default : '$dir' \n
		-o	operation, default : 'UNSET' \n
		-h	help \n
	"




while getopts ":f:t:d:o:h" opt; do
	case "$opt" in
		f)
			file=$OPTARG
			;;
		t)
			format=$OPTARG
			;;
		d)
			dir=$OPTARG
			;;
		o)
			operation=$OPTARG
			;;
		h)
			echo -e $help
			exit 0
			;;
	esac
done



if ! test -f $file; then
	echo "$file does not exist"
	exit 
fi



mkdir tmp/
mount -o loop $file tmp/ -t$format

if test $operation == "grep"; then
	cp -r tmp/* $dir
fi

if test $operation == "send"; then
	cp -r ${dir}/* tmp/
fi

umount -d tmp/
rm -r tmp/

