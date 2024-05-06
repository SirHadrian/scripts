#!/usr/bin/bash

feh --scale-down --image-bg black --action1 "trashy %F" --action2 "savefeh %F" --action3 "trashy restore %F" -- "$@"
