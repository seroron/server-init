#!/bin/bash

rm -fr ~/.goenv

git clone https://github.com/syndbg/goenv.git ~/.goenv

cat > ~/.bashrc.d/goenv.sh <<EOF
export GOENV_ROOT="\$HOME/.goenv"
export PATH="\$GOENV_ROOT/bin:$PATH"
eval "\$(goenv init -)"
EOF

source ${HOME}/.bashrc.d/goenv.sh
GOENV_GOLANG_VER=$(goenv install --list | grep -v 'beta' | grep -v "rc" | tail -1)

goenv install $GOENV_GOLANG_VER
goenv global $GOENV_GOLANG_VER

