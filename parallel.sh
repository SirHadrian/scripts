#!/usr/bin/bash

function usage {
	echo "Limit the number of background tasks for a command at one time"
	echo "-p - the maximum background processes allowed to run at one time"
	echo "-c - commnad to execute for every argument, it has the template echo {}, where {} is substituted for the arguments"
	echo "-h - print help message"
	return
}

MAX_PROCS=
COMMAND=
while getopts p:c:h opt; do
	case "$opt" in
	p)
		MAX_PROCS=$OPTARG
		;;
	c)
		COMMAND=$OPTARG
		;;
	h)
		usage
		break
		;;
	*)
		printf "%s" "Unknown option: $opt"
		break
		;;
	esac
done

shift $((OPTIND - 1))
[ -z "$*" ] && printf "%s" "No arguments were provided" && exit 1

for item in "$@"; do
	PROCS=$(jobs -p | wc -l)
	if [[ $PROCS -gt $MAX_PROCS ]]; then
		wait -n
	fi
	${COMMAND//\{\}/$item} &
done
wait
