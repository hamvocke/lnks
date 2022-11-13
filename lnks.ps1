#!/usr/bin/env pwsh

$selection = Get-Content ./bookmarks.txt | fzf `
  --border=rounded --margin=5% `
  --prompt="Search Bookmarks > " `
  --with-nth='1..-2' `
  --preview='echo {-1}' --preview-window='up,1'

$targetLink = $selection.Split(' ')[-1]
Start-Process $targetLink
