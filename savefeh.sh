#!/usr/bin/bash

DIR_NAME="$(dirname "$*")"

DIR="$DIR_NAME/SAVE"

if [[ ! -d "$DIR" ]]
then
        mkdir -p "$DIR"
fi

mv "$*" "$DIR"
