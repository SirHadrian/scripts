#!/usr/bin/bash

COMMAND=
while getopts c:h opt; do
        case "$opt" in
                c)
                        COMMAND=$OPTARG
                        break
                        ;;
                *)
                        printf "%s" "Unknown option: $opt"
                        break
                        ;;
        esac
done

selection="$(fzf)"
if [ -n "$selection" ]; then
        # ${COMMAND//\{\}/"$selection"} &
        $COMMAND "$selection" &>/dev/null &
fi
