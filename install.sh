#!/usr/bin/env bash
cd ~ && [ ! -d ".config" ] && mkdir .config && chmod 700 .config
git clone https://github.com/pa-de-solminihac/configuration.git ~/.config/config-pa-de-solminihac
echo "source ~/.bashrc_common" >> ~/.bashrc && ln -s ~/.config/config-pa-de-solminihac/bash/.bashrc_common ~/.bashrc_common
echo "source ~/.vimrc_common" >> ~/.vimrc && ln -s ~/.config/config-pa-de-solminihac/vim/.vimrc_common ~/.vimrc_common
mkdir -p bin && ln -s ~/.config/config-pa-de-solminihac/bin/diffconflicts ~/bin/
