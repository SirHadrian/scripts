#!/bin/zsh

if [[ -e $HOME/.zshrc ]]; then
	source $HOME/.zshrc
fi

usage(){
	echo "Execute a commnad n times"
	echo "-n | --time - duration in seconds"
	echo "-e | --exec - commnad to execute every n times"
	echo "-h | --help - print usage"
}

interval=
execute_command=

while [[ -n "$1" ]]
do
	case "$1" in
		-n | --time)
			shift
			interval=$1
			;;
		-e | --exec)
			shift
			execute_command="$1"
			;;
		-h | --help)
			usage
			exit
			;;
		*)
			usage >&2
			exit 1
			;;
	esac
	shift
done

if [[ -z "$interval" || -z "$execute_command" ]]
then
	usage >&2
	exit 1
fi

while true
do
	("$execute_command")
	sleep $interval
done
