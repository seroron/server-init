# undef ctrl+s
stty stop undef

# append to the history file, don't overwrite it
shopt -s histappend

# bash history size
HISTSIZE=10000
HISTFILESIZE=10000

# term color
export TERM=xterm-256color

# git
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

# ps1
if which kubectl >/dev/null 2>&1; then
    PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] <\j>$(__git_ps1) (k8s:$(kubectl config current-context))\[\033[00m\]\n\$ '
else
    PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] <\j>$(__git_ps1)\[\033[00m\]\n\$ '
fi

# alias
if [ "$(uname)" == 'Darwin' ]; then
    # mac
    alias ls='ls -FG'
    export LSCOLORS=xbfxcxdxbxegedabagacad
    
else
    # linux
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls -F --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    else
        alias ls='ls -F'
    fi
fi

# path
export PATH=$HOME/.bin:$PATH
