#!/bin/bash

BASE_DIR=`pwd`

setup_init()
{
    mkdir -p ~/.bashrc.d
    fgrep "if [ -d ~/.bashrc.d ]" ~/.bashrc >/dev/null || 
	cat >> ~/.bashrc <<EOF

### begin auto add 
if [ -d ~/.bashrc.d ]; then
  for i in ~/.bashrc.d/*.sh; do
    if [ -r \$i ]; then
	. \$i
    fi
  done
  unset i
fi
### end auto add

EOF

    cp -v -r -f ${BASE_DIR}/files/.??* ~/
}

setup_emacs()
{
    rm -fr ~/.emacs.d
    git clone https://github.com/seroron/.emacs.d.git
    cd .emacs.d/
    make
}

setup_ruby()
{
    rm -fr .rbenv
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

    cat > ~/.bashrc.d/rbenv.sh <<EOF
export PATH="\$HOME/.rbenv/bin:\$PATH"
eval "\$(rbenv init -)"
EOF

    source ${HOME}/.bashrc.d/rbenv.sh
    echo source "${HOME}/.bashrc.d/rbenv.sh"
    RBENV_RUBY_VER=$(rbenv install --list | grep -v '-' | tail -1)

    rbenv install $RBENV_RUBY_VER
    rbenv global $RBENV_RUBY_VER
}

setup_nodejs()
{
    curl -L git.io/nodebrew | perl - setup

    cat > ~/.bashrc.d/nodebrew.sh <<EOF
export PATH=\$HOME/.nodebrew/current/bin:\$PATH
EOF
    source ~/.bashrc.d/nodebrew.sh
    
    nodebrew install-binary latest
    nodebrew use latest
    npm install -g brew
}

show_help()
{
    echo "Usage: ./setup.sh <command>"
    echo " command:"    
    egrep -o "^setup_[^\(\)]+\(\)$" $0 | sed -E 's/setup_([^\(]+)\(\)/    \1/g'
}

if type setup_$1 1>/dev/null 2>/dev/null; then
    setup_$1
else
    show_help    
fi
