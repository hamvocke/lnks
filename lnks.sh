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

SELECTION=$(cat "$(dirname "$0")"/*.txt | fzf \
  --border=rounded --margin=5% \
  --prompt="Search Bookmarks > " \
  --with-nth='1..-2' \
  --preview='echo {-1}' --preview-window='up,1')

if [ -n "$SELECTION" ]; then
    TARGET_LINK=$(echo $SELECTION | sed 's/^.*\(https.*\)$/\1/')
    $OPEN_COMMAND $TARGET_LINK 2>/dev/null
fi