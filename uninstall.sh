#!/usr/bin/env bash
[ ! -d ~/.config/config-pa-de-solminihac ] && echo "Not installed yet, install with: " && echo "./install.sh" && exit
sed -i '/.*# installed by config-pa-de-solminihac/d' ~/.bashrc
sed -i '/source ~\/.bashrc_common/d' ~/.bashrc
rm -f ~/.bashrc_common
sed -i '/.*# installed by config-pa-de-solminihac/d' ~/.vimrc
sed -i '/source ~\/.vimrc_common/d' ~/.vimrc
rm -f ~/.vimrc_common
rm -f ~/bin/diffconflicts
rmdir ~/bin 2> /dev/null
rm -rf ~/.config/config-pa-de-solminihac
rmdir ~/.config 2> /dev/null
