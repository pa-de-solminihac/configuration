# PATH avec commandes perso
# export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="~/bin:/usr/local/sbin:/usr/local/bin:$PATH"

# HISTORIQUE long et horodaté
unset HISTCONTROL
HISTTIMEFORMAT="%Y/%m/%d @ %T "
HISTFILESIZE=999999
HISTSIZE=999999

# LANGUE et encodage du terminal
LANG=fr_FR.UTF-8

####################
# ALIAS et fonctions
####################
source ~/.bashrc_common

alias vi="gvim -p --remote-tab-silent "
alias ll="ls -alh --color=auto"
# alias vim="/usr/local/bin/vim"
# alias phonegap-serve="phonegap serve listening 192.168.0.15:3000"
# alias diff="/usr/local/bin/grc /usr/bin/diff "
# alias recap="vi ~/Desktop/recap.txt"
# alias top="top -ocpu" # OSX
# alias netst="netstat -tan | head -n 1; netstat -tan | grep tcp4 | grep LISTEN"

