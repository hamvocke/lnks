#!/usr/bin/env pwsh

try
{
  # try executing a dummy command to test if we have fzf installed, surpressing any output
  fzf --version 2>&1 | out-null
}
Catch [System.Management.Automation.CommandNotFoundException]
{
  Write-Output "fzf is not installed"
  Exit 1
}

$selection = Get-Content ./bookmarks.txt | fzf `
  --border=rounded --margin=5% `
  --prompt="Search Bookmarks > " `
  --with-nth='1..-2' `
  --preview='echo {-1}' --preview-window='up,1'

# Only try to start process if last command (fzf) set its status to True and we have something to open
if ( $? -and $selection )
{
  $targetLink = $selection.Split(' ')[-1]
  Start-Process $targetLink
}
