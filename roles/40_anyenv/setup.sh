#!/bin/bash

rm -fr ~/.anyenv

git clone https://github.com/anyenv/anyenv ~/.anyenv
cat > ~/.bashrc.d/anyenv.sh <<EOF
export PATH="\$HOME/.anyenv/bin:\$PATH"
eval "\$(anyenv init -)"
EOF

. ~/.bashrc.d/anyenv.sh

anyenv install --init
