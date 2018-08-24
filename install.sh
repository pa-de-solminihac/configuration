#!/usr/bin/env bash
[ -d ~/.config/config-pa-de-solminihac ] && echo "Already installed, update with:" && echo "cd ~/.config/config-pa-de-solminihac && ./update.sh" && exit
cd ~ && [ ! -d .config ] && mkdir .config && chmod 700 .config
git clone https://github.com/pa-de-solminihac/configuration.git ~/.config/config-pa-de-solminihac
echo 'source ~/.bashrc_common # installed by config-pa-de-solminihac' >> ~/.bashrc && ln -s ~/.config/config-pa-de-solminihac/bash/.bashrc_common ~/.bashrc_common
echo 'source ~/.vimrc_common " installed by config-pa-de-solminihac' >> ~/.vimrc && ln -s ~/.config/config-pa-de-solminihac/vim/.vimrc_common ~/.vimrc_common
mkdir -p bin && ln -s ~/.config/config-pa-de-solminihac/bin/diffconflicts ~/bin/
