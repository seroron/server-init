#!/bin/bash

curl -L git.io/nodebrew | perl - setup

cat > ~/.bashrc.d/nodebrew.sh <<EOF
export PATH=\$HOME/.nodebrew/current/bin:\$PATH
EOF
source ~/.bashrc.d/nodebrew.sh

nodebrew install-binary latest
nodebrew use latest
npm install -g brew
