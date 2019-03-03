#!/bin/bash

BASE_DIR=$(cd $(dirname $BASH_SOURCE); pwd)


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

fgrep "### begin auto add" ~/.inputrc >/dev/null 2>&1 || 
    cat >> ~/.inputrc <<EOF

### begin auto add 
set bell-style none
### end auto add

EOF


cp -v -r -f ${BASE_DIR}/files/.??* ~/

# git
curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.bashrc.d/git-completion.sh
curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.bashrc.d/git-prompt.sh
