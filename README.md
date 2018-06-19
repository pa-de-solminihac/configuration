# Configuration de base pour `bash`, `vim` et `git`

Le **minimum vital**, sur place ou à emporter.

- à utiliser en local ou à emporter :
  - au travers de vos connexions `SSH`
  - au travers de `sudo`
- peut s'intégrer avec votre configuration existante


# Installation

Pas de script d'install pour l'instant, mais ça reste relativement simple : il suffit de copier-coller les lignes suivantes dans un terminal :

```bash
cd ~ && [ ! -d ".config" ] && mkdir .config && chmod 700 .config
git clone https://github.com/pa-de-solminihac/configuration.git ~/.config/config-pa-de-solminihac
echo "source ~/.bashrc_common" >> ~/.bashrc && ln -s ~/.config/config-pa-de-solminihac/bash/.bashrc_common ~/.bashrc_common
echo "source ~/.vimrc_common" >> ~/.vimrc && ln -s ~/.config/config-pa-de-solminihac/vim/.vimrc_common ~/.vimrc_common
mkdir -p bin && ln -s ~/.config/config-pa-de-solminihac/bin/diffconflicts ~/bin/
```

C'est tout. Fermez votre terminal et ouvrez-en un nouveau, vous devriez voir un nouveau prompt... qui signifie que tout s'est bien passé.

**Remarque** : si vous êtes sous OS X, vous devriez sans doute [utiliser une version de BASH plus récente sous OS X](https://github.com/pa-de-solminihac/configuration/blob/master/README.md#notes-pour-osx)

# Utilisation

Ces fichiers définissent une configuration basique pour `bash`, `vim`, et `git`


## Bash

Prompt amélioré avec mise en évidence :
- des dépôts GIT
- du fait d'être connecté en SSH, dans un screen, en tant que `root`...

Alias classiques :
- `ll` : `ls -l`
- `curdate` : affiche la date courante au format YYYYmmddHHMMSS
- `generate_password` : génère un mot de passe
- `detail` : un `tail -F` qui gère les couleurs

Fonctions simples :
- `monip` : affiche les IP LAN et WAN de la machine
- `follow_http "<url>"` : met en évidence les redirections HTTP
- `dirdiff <dossier1> <dossier2>` : diff entre deux dossiers
- `cGET '<url>'` : raccourci afficher le contenu d'une URL avec `curl` (voir aussi `cHEAD` et `cTIME`)


## VIM

Le fichier `.vimrc_common` définit quelques réglages de base de vim, avec notamment :
- coloration syntaxique
- recherche incrémentale
- utilisation de la souris
- une statusline améliorée avec mise en évidence de l'encodage
- mise en évidence des caractères spéciaux, potentiellement indésirables, notamment les espaces insécables, tabulations, espaces en fin de lignes...
- tabulations expandtab


## GIT

Utilisation d'alias pour fournir les fonctionnalités suivantes :
- `gitfa` : `git fetch --all`
- `gitst` : un `git status` concis, avec coloration syntaxique
- `gitstu` : comme `gitst` mais sans afficher les fichiers non traqués
- `gitincoming` : log les commits qui viendront si on `git pull` (à utiliser après avoir lancé un `gitfa`)
- `gitunpushed` : log les commits qui partiront si on `git push`
- `gitdiffwith [branch]` : log les commits qui diffèrent entre la branche courante et la branche demandée
- `gitdifftool [fichier]` : affiche avec `vimdiff` les différences entre la version connue de git la version locale d'un fichier
- `gitmergetool [fichier]` : résolution de conflits avec `vimdiff` améliorée. Voir [Procédure de résolution de conflits](https://github.com/pa-de-solminihac/configuration/blob/master/diffconflicts.md)

# Emporter cette configuration partout

- `sbash <user@host> [PORT]` : à utiliser à la place de `ssh` pour se connecter en SSH en emportant cette configuration
- `groot` : à utiliser à la place de `sudo -s` pour devenir root en emportant cette configuration


# Compatibilité

- Linux
- OSX
- Windows (avec Cygwin)

## Notes pour OSX

Installer une version plus récente de *bash* (celle du système date de... 2007), ainsi que les outils GNU portables *coreutils* et *ssh-copy-id*

```bash
brew install coreutils
brew install ssh-copy-id
brew install bash
# changer son shell par défaut pour cette version de bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash 
```

Pour une meilleure intégration on peut ajouter les lignes suivantes dans le `.bash_profile` :
```
alias ll="gls -alh --color=auto --group-directories-first "
alias vi="gvim -p --remote-tab-silent "
```
