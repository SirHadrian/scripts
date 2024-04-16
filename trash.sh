#!/usr/bin/bash

TRASH=~/Trash

if [[ ! -d "$TRASH" ]]
then
        mkdir -p "$TRASH"
fi

for file in "$@"
do
        realpath "$file" > "$TRASH/${file%/}.trashinfo"
        mv "$file" "$TRASH"
done
