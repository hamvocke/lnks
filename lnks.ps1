#!/usr/bin/env pwsh

$targetLink = cat ./bookmarks.txt | `
  fzf `
    --border=rounded --margin=5% `
    --prompt="Search Bookmarks > " `
    --with-nth='1..-2' `
    --preview='echo {-1}' --preview-window='up,1' | `
  sed 's/^.*\(https.*\)$/\1/'

Start-Process $targetLink

