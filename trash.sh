#!/usr/bin/bash

TRASH=~/Trash

if [[ ! -d "$TRASH" ]]
then
        mkdir -p "$TRASH"
fi

if [[ "$1" == "restore" ]]
then
        FILE="$(basename "$2")"
        mv -v "$TRASH/${FILE%.trashinfo}" "$(cat $TRASH/$FILE)"
        rm "$TRASH/$FILE"

        exit 0
fi

if [[ "$1" == "list" ]]
then
        exa -l "$TRASH"
        exit 0
fi

if [[ "$1" == "empty" ]]
then
        rm -rfv "$TRASH"/*
        exit 0
fi

if [[ "$1" == "size" ]]
then
        du -sh "$TRASH"
        exit 0
fi

for file in "$@"
do
        NAME="$(basename "$file")"
        realpath "$file" > "$TRASH/${NAME%/}.trashinfo"
        mv -v "$file" "$TRASH"
done
