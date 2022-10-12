#!/usr/bin/env bash

if ! [ -x "$(command -v fzf)" ]; then
    echo "fzf is not installed"
fi

cat bookmarks.txt | fzf --border=rounded --margin=5% --prompt="Search Bookmarks >" --with-nth='1..-2' --bind='enter:execute(xdg-open {-1} 2>/dev/null)'
