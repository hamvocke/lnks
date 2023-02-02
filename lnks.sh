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

DEFAULT_BROWSER=$(sh $(dirname "$0")/get_default_browser.sh)

# If chrome being used as default browser then updates the bookmarks file with Chrome bookmarks
if [[ $DEFAULT_BROWSER = *"google"*"chrome"* ]]; then
  if ! [ -x "$(command -v jq)" ]; then
    echo "jq is not installed"
    exit 1
  else
    echo "$(sh $(dirname "$0")/get_chrome_bookmarks.sh)" > ~/lnks/bookmarks.txt
  fi;
fi;

ENTER_COMMAND="enter:execute(${OPEN_COMMAND} {-1} 2>/dev/null)"

cat "$(dirname "$0")"/*.txt | fzf --border=rounded --margin=5% --prompt="Search Bookmarks > " --with-nth='1..-2' --bind="${ENTER_COMMAND}" --preview='echo {-1}' --preview-window='up,1'
