#!/usr/bin/env bash

case "$OSTYPE" in
  darwin*)
    BROWSER=$(plutil -p ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist | grep 'https' -b3 |awk 'NR==3 {split($4, arr, "\""); print arr[2]}')
    ;;
  linux*)
    BROWSER=(xdg-settings get default-web-browser)
    ;;
  *)
    echo "unsupported OD: $OSTYPE" && exit 1
    ;;
esac

echo $BROWSER
