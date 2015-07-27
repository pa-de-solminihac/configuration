# Description

Le minimum vital, sur place ou à emporter.

Configuration de base pour `bash`, `vim` et `git`
- à utiliser en local ou à emporter :
  - au travers de vos connexions `SSH`
  - au travers de `sudo`
- peut s'intégrer avec votre configuration existante

# Installation

Copier coller les lignes suivantes dans un terminal :

```bash
git clone https://github.com/pa-de-solminihac/configuration.git
# install pour bash
echo "source ~/.bashrc_local" >> ~/.bash_profile
ln -s configuration/bash/.bashrc_local
ln -s configuration/bash/.bashrc_common
# install pour vim
echo "source ~/.vimrc_common" >> ~/.vimrc
ln -s configuration/vim/.vimrc_common
# install pour git
mkdir -p bin
ln -s configuration/bin/diffconflicts bin/
```

# Utilisation

Ces fichiers définissent une configuration basique pour `bash`, `vim`, et `git`

## Bash

Prompt amélioré avec :
- mise en évidence des dépôts GIT
- mise en évidence du fait d'être connecté en SSH
- mise en évidence du fait d'être connecté en tant que `root`

Alias classiques :
- `ll` : `ls -l`
- `curdate` : affiche la date courante au format YYYYmmddHHMMSS
- `generate_password` : génère un mot de passe

Fonctions simples :
- `monip` : affiche les IP LAN et WAN de la machine
- `follow_http "<url>"` : met en évidence les redirections HTTP
- `dirdiff <dossier1> <dossier2>` : diff entre deux dossiers
- `cGET "<url>"` : raccourci afficher le contenu d'une URL avec `curl`

## VIM

Le fichier `.vimrc_common` définit quelques réglages de base de vim, avec notamment :
- coloration syntaxique
- recherche incrémentale
- utilisation de la souris
- une statusline améliorée avec mise en évidence de l'encodage
- mise en évidence de caractères tels que les espaces insécables, tabulations, espaces en fin de lignes...
- tabulations expandtab

## GIT

Utilisation d'alias pour fournir les fonctionnalités suivantes :
- `gitfa` : `git fetch --all`
- `gitst` : `git status --short` avec coloration syntaxique
- `gitincoming` : log les commits qui viendront si on `git pull`
- `gitunpushed` : log les commits qui partiront si on `git push`
- `gitdifftool [fichier]` : affiche avec `vimdiff` les différences entre la version connue de git la version locale d'un fichier
- `gitmergetool [fichier]` : effectue un **2-way merge** avec coloration syntaxique dans vimdiff (bien plus pratique que le 3-way merge habituel).
  - la fenêtre de gauche est le fichier local, celle de droite le fichier à merger dedans
  - lorsqu'on quitte, le fichier de la fenêtre de gauche sera utilisé comme résultat du merge
  - pour annuler le merge, il faut quitter avec `:cq`

# Emporter cette confiuration partout

L'alias `groot` sert à devenir root en emportant cette configuration.

L'alias `sbash <user@host> [PORT]` sert à se connecter en SSH en emportant cette configuration.
