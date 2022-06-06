user="root"
addr="localhost"
port="22"
dir="./"

help="\n
	File exchanger using OpenSSH's SCP file transfer protocol. \n
	Requires networking and OpenSSH. \n
	Warnings : \n
		-	on qemu machines, requires TCP port forwarding \n
		-	requires setting a password and authorisations for root users \n
		-	deleting ~/.ssh/known_hosts might be obligatory \n
	Options : \n
		-u	user, default : '$user' \n
		-a	address (IP), default : '$addr' (127.0.0.1) \n
		-p	port, default : '$port' \n
		-f	directory, default : '$dir' \n
		-o	operation, default : 'UNSET' \n	"



while getopts ":u:a:p:f:o:h" opt; do
	case "$opt" in
		u)
			user=$OPTARG
			;;
		a)
			addr=$OPTARG
			;;
		p)
			port=$OPTARG
			;;
		f)
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


if test -z $operation; then
	read -p "Please specify an operation : " operation
fi


if test $operation == "grep"; then
	eval "scp -r -P $port ${addr}:/root/* $dir"
	exit 0
fi

if test $operation == "send"; then
	eval "scp -r -P $port ${dir}/* ${addr}:/root/"
	exit 0
fi


echo "Invalid Operation"
exit 1
