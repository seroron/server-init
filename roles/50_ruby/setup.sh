#!/bin/bash

rm -fr ~/.rbenv

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
