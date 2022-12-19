#!/usr/bin/bash

archive() {
	echo ".............Start archiving $1............."
	tar -czvf "$(basename "$1")".tgz "$1"
	echo ".............Done archiving $1............."
}

run() {
	for item in "$@"; do
		archive "$item" &
	done

	wait

	echo "=================================="
	echo "Archiving Completed"
	echo "=================================="
}

echo "=================================="
echo "Archiving:"
echo "$@"
echo "=================================="

read -rp "Start archiving? (Y/n)" answer
action=${answer:-Y}

case $action in
[Yy])
	run "$@"
	;;
[Nn])
	exit 0
	;;
*)
	echo "Wrong choice"
	exit 1
	;;
esac
