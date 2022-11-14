#!/usr/bin/env bash

if ! [ -x "$(command -v fzf)" ]; then
    echo "fzf is not installed"
    exit 1
fi


case "$OSTYPE" in
  darwin*)  OPEN_COMMAND="open" ;;
  linux*)   OPEN_COMMAND="xdg-open" ;;
  *)        echo "unsupported OD: $OSTYPE" && exit 1 ;;
esac

ENTER_COMMAND="enter:execute(${OPEN_COMMAND} {-1} 2>/dev/null)"

cat ~/lnks/*.txt | fzf --border=rounded --margin=5% --prompt="Search Bookmarks > " --with-nth='1..-2' --bind="${ENTER_COMMAND}" --preview='echo {-1}' --preview-window='up,1'
