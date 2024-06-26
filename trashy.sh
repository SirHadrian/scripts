#!/usr/bin/bash
set -e

TRASH=~/Trash

if [[ ! -d "$TRASH" ]]
then
        mkdir -p "$TRASH"
fi


restore(){
        FILE="$(basename "$1")"
        mv -v "$TRASH/$FILE" "$(cat "$TRASH/$FILE.trashinfo")"
        rm "$TRASH/$FILE.trashinfo"
}

list(){
        ls -l --color --all --human-readable "$TRASH"
}

empty(){
        rm -rfv "$TRASH"
}

size(){
        du -sh "$TRASH"
}

trash(){
        for file in "$@"
        do
                TIMESTAMP="$(date +%d.%m.%Y"-"%H:%M:%S )"
                NAME="$(basename "$file")"
                realpath "$file" > "$TRASH/${TIMESTAMP}_${NAME%/}.trashinfo"
                mv -v "$file" "$TRASH/${TIMESTAMP}_${NAME%/}"
        done
}


while [[ -n "$1" ]]
do
        case "$1" in
                r | restore)
                        shift
                        restore "$1"
                        exit
                        ;;
                l | list)
                        shift
                        list
                        exit
                        ;;
                e | empty)
                        empty
                        exit
                        ;;
                s | size)
                        size
                        exit
                        ;;
                *)
                        trash "$@"
                        exit
                        ;;
        esac
        shift
done
