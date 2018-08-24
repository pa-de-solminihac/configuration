#!/usr/bin/env bash
[ -d "~/.config/config-pa-de-solminihac" ] && echo "Not installed yet, install with: " && echo "./install.sh" && exit
cd ~/.config/config-pa-de-solminihac && git pull

