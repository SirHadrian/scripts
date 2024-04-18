#!/usr/bin/bash

if [ $# -ne 2 ]; then
        printf "%s\n" "Incorrect arguments"
        exit 1
fi

archive="$1"

case "$archive" in
        "*.tar.gz")
                tar -xzvf "$archive"
                ;;
        "*.bz2")
                bunzip2 "$archive"
                ;;
        "*.rar")
                unrar x "$archive"
                ;;
        "*.tar")
                tar -xvf "$archive"
                ;;
        "*.tbz2")
                tar -xjvf "$archive"
                ;;
        "*.tgz")
                tar -xzvf "$archive"
                ;;
        "*.zip")
                unzip "$archive"
                ;;
        "*.Z")
                uncompress "$archive"
                ;;
        "*.7z")
                7z x "$archive"
                ;;
        *)
                printf "%s" "Unrecognized file extension"
                ;;
esac
