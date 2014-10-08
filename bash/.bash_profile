# PATH avec commandes perso
export PATH="~/bin:/usr/local/sbin:/usr/local/bin:$PATH"

# HISTORIQUE long et horodaté
HISTTIMEFORMAT="%Y/%m/%d @ %T "
HISTSIZE=999999

# LANGUE et encodage du terminal
LANG=fr_FR.UTF-8

########
# PROMPT
########
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
LIGHT_YELLOW="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
GRAY="\[\033[01;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"
# MODIF PA 2014-09-25 : better git-prompt (cf. http://www.git-attitude.fr/2013/05/22/prompt-git-qui-dechire/)
# MODIF PA 2014-07-17 : git completion et git-prompt (cf. http://stackoverflow.com/questions/10435117/ps1-env-variable-does-not-work-on-mac)
# MODIF PA : prompt avec mise en evidence de la valeur de retour (adapte de http://www.austinriba.com/2010/09/best-bash-prompt-ever/)
# MODIF PA : prompt avec integration GIT (cf. http://www.bramschoenmakers.nl/en/node/624)
# *: modified, +: added, %: untracked, u=: up to date
export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
PS1="${debian_chroot:+($debian_chroot)}\n\`if [ \$? = 0 ]; then echo -e '${GRAY}'; else echo -e '${LIGHT_RED}'; fi\`\D{%d-%m:%H:%M }${GREEN}\u@\h:${LIGHT_GREEN}\w${LIGHT_YELLOW}\$(__git_ps1)${COLOR_NONE}\n${COLOR_NONE}\`if [ \$(whoami) = 'root' ]; then echo '#'; else echo '$'; fi\` "

####################
# ALIAS et fonctions
####################
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias mysql="mysql --show-warnings "
alias vi="gvim -p --remote-tab-silent "
alias ll="ls -alhG"
alias diff="/usr/bin/grc /usr/bin/diff "
alias generate_password="openssl rand -base64 37 | cut -c1-16"

function monip() { echo "Private"; /sbin/ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}' | sort | uniq; echo; echo "Public"; dig +short myip.opendns.com @208.67.220.220; } # AKA @resolver1.opendns.com

function follow_http() { wget -O /dev/null -S "$1" 2>&1 | grep 'HTTP/\|Location'; }

function dirdiff() { DIFFCMD="diff -rw --exclude=.svn --exclude=.git "; $DIFFCMD $1 $2 | grep "^diff \|^Only in " | sed "s/$DIFFCMD/gvimdiff /g"; }

function cGET() { curl -s -S -L "$1"; }

function man() { sought=$*; /usr/bin/man $sought | col -b | vim -R -c "set nonumber" -c "set syntax=man" -c "set nolist" -c "match" -; }

