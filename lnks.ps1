#!/usr/bin/env pwsh

param (
  [switch][Alias("k", "keep-open")] $keepOpen = $false,
  [Alias("d", "dir")] $lnksDirectory
)

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

$enterCommand = "enter:execute-silent(explorer.exe {-1})"

if ($keepOpen)
{
  $enterCommand += "+clear-query"
}
else
{
  $enterCommand += "+abort"
}

if ($lnksDirectory -eq $null) {
  $lnksDirectory = Split-Path -Path $PSCommandPath -Parent
}

Get-Content "$lnksDirectory\*.txt" | fzf `
  --border=rounded `
  --prompt="Search Bookmarks > " `
  --with-nth='1..-2' `
  --bind=$enterCommand `
  --preview='echo {-1}' --preview-window='up,1'
