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
        exa -l ~/Trash
        exit 0
fi

if [[ "$1" == "empty" ]]
then
        rm -rfv ~/Trash/*
        exit 0
fi

if [[ "$1" == "size" ]]
then
        du -sh ~/Trash/
        exit 0
fi

for file in "$@"
do
        realpath "$file" > "$TRASH/${file%/}.trashinfo"
        mv -v "$file" "$TRASH"
done
