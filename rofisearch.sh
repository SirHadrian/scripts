#!/usr/bin/bash

BROWSER="librewolf"

declare -A URLS

URLS=(
  ["google"]="https://www.google.com/search?q="
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["archwiki"]="https://wiki.archlinux.org/title/"
  ["yandex"]="https://yandex.ru/yandsearch?text="
  ["github"]="https://github.com/search?q="
  ["stackoverflow"]="http://stackoverflow.com/search?q="
  ["askubuntu"]="http://askubuntu.com/search?q="
  ["piratebay"]="https://thepiratebay.org/search/"
  ["youtube"]="https://www.youtube.com/results?search_query="
)

gen_list(){
	for i in "${!URLS[@]}"
	do
		echo "$i"
	done
}	

main(){
    site=$( gen_list | rofi -dmenu -matching fuzzy -p "Search on > ")

    if [[ -n "$site" ]]
    then
        query=$(rofi -dmenu -mathcing fuzzy -p "$site > ")

        if [[ -n "$query" ]]
        then
            url=${URLS[$site]}$query
            $BROWSER "$url" &> /dev/null
        else
            exit 1
        fi

    else
        exit 1
    fi

    exit 0
}

main
