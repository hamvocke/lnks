#!/usr/bin/env bash

set -o pipefail
set -o errexit
set -o nounset

if ! type fzf &> /dev/null; then
    echo "fzf is not installed" >&2
    exit 1
fi

keep_open=false

usage () {
    echo "Usage: $(basename $0) [OPTIONS...]"
    echo "  -k    --keep-open     Keep lnks open after selecting a bookmark"
    exit 0
}

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -k|--keep-open) keep_open=true ;;
        -h|--help) usage;;
        *) echo "Unknown parameter passed: $1" >&2; exit 1 ;;
    esac
    shift
done

if type explorer.exe &> /dev/null; then
    open_command="explorer.exe"
elif type open &> /dev/null; then
    open_command="open"
elif type xdg-open &> /dev/null; then
    open_command="xdg-open"
fi

enter_command="enter:execute-silent(${open_command} {-1})"

if [ "$keep_open" = true ]; then
    enter_command="${enter_command}+clear-query"
else
    enter_command="${enter_command}+abort"
fi

cat "$(dirname "$0")"/*.txt | fzf \
    --border=rounded \
    --prompt="Search Bookmarks > " \
    --with-nth='1..-2' \
    --bind="${enter_command}" \
    --preview='echo {-1}' \
    --preview-window='up,1'
