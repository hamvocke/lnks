#!/usr/bin/env bash

set -o pipefail
set -o errexit
set -o nounset

if ! [ -x "$(command -v fzf)" ]; then
    echo "fzf is not installed"
    exit 1
fi

keep_open=false

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -k|--keep-open) keep_open=true ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

case "$OSTYPE" in
  darwin*)  open_command="open" ;;
  linux*)   open_command="xdg-open" ;;
  *)        echo "unsupported OS: $OSTYPE" && exit 1 ;;
esac

enter_command="enter:execute-silent(${open_command} {-1})"


if [ "$keep_open" = false ]; then
    enter_command="${enter_command}+abort"
else
    enter_command="${enter_command}+clear-query"
fi

cat "$(dirname "$0")"/*.txt | fzf \
  --border=rounded \
  --margin=5% \
  --prompt="Search Bookmarks > " \
  --with-nth='1..-2' \
  --bind="${enter_command}" \
  --preview='echo {-1}' \
  --preview-window='up,1'
