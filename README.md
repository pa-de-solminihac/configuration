# Description

Le minimum vital, sur place ou à emporter.

Configuration de base pour `bash`, `vim` et `git`
- à utiliser en local ou à emporter :
  - au travers de vos connexions SSH (en utilisant l'alias `sbash` au lieu de `ssh`)
  - au travers de sudo (en utilisant l'alias `groot` au lieu de `sudo`)
- peut s'intégrer avec votre configuration existante

# Installation

```bash
git clone https://github.com/pa-de-solminihac/configuration.git
# install pour bash
echo "source ~/.bashrc_local" >> ~/.bash_profile
ln -s configuration/bash/.bashrc_local
ln -s configuration/bash/.bashrc_common
# install pour vim
ln -s configuration/vim/.vimrc
ln -s configuration/vim/.vimrc_common
# install pour git
mkdir -p bin
ln -s configuration/bin/diffconflicts bin/
```
