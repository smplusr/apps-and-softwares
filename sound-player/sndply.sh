#!/bin/sh
# Plays sounds following multiple arguments
# Expects files in the uncompressed WAVE (.wav) format
# Requires ALSA (alsaconf, alsa-lib) and aplay (included in ALSA)

help () {
	echo "manual"

	echo "Plays sounds following multiple arguments"
	echo "Expects files in the uncompressed WAVE (.wav) format"
	echo "Requires ALSA (alsaconf, alsa-lib) and aplay (included in ALSA)"
	echo ""
	echo "Syntax: sndply.sh [-h|r|l|f|p]"
	echo "	-h	shows help"
	echo "	-r	enables random music playing"
	echo "	-l	enables looping (infinite)"
	echo "	-f	specifies a playlist"
	echo "	-p	parameters given to 'aplay'"
	echo ""

	exit 1
}

folder='.'

while getopts "hrlf:p:" opt; do
	case $opt in
		h)	help			;;
		r)	random=1		;;
		l)	loop=1			;;
		f)	folder=$OPTARG		;;
		p)	parameter=$OPTARG	;;
	esac

done

fileget="find $folder -name *.wav"
fileshuf="shuf -n 1"

if [ ! -z "$loop" ]; then
	while : 
	do
		if [ ! -z "$random" ]; then
			tmp=`$fileget | $fileshuf`
			aplay $tmp $parameter
		else
			for file in `$fileget`; do
				aplay $file $parameter
			done
		fi
	done		
else
	for file in `$fileget`; do
		if [ ! -z "$random" ]; then	
			tmp=`$fileget | $fileshuf`;
			aplay $tmp $parameter
		else
			aplay $file $parameter
		fi
	done
fi
