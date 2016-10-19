# undef ctrl+s
stty stop undef

# append to the history file, don't overwrite it
shopt -s histappend

# bash history size
HISTSIZE=10000
HISTFILESIZE=10000

# term color
export TERM=xterm-256color

# ps1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] <\j>$(__git_ps1)\[\033[00m\]\n\$ '
