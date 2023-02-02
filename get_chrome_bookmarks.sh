#!/usr/bin/env bash

case "$OSTYPE" in
  darwin*) BOOKMARKS_FILE=~/Library/Application\ Support/Google/Chrome/Default/Bookmarks ;;
  linux*) BOOKMARKS_FILE=~/.config/google-chrome/Default/Bookmarks ;;
  *) echo "Unsupported OD: $OSTYPE" && exit 1;;
esac

BOOKMARKS="$(jq -r '.roots.bookmark_bar | [.name,.] | recurse(. as [$path,$root] | $root | .children[]? | select(.type=="folder") | ["\($path)/\(.name)",.]) | . as [$path,{$children}] | ($children[] as {$type,$name,$url} | select($type=="url") | "\($name) \($url)")' "$BOOKMARKS_FILE")"

echo "$BOOKMARKS"

