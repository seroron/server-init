#!/bin/bash

git clone https://github.com/seroron/.emacs.d.git ~/.emacs.d
cd ~/.emacs.d/
make emacs-local
. ~/.bashrc.d/emacs-local.sh
make emacs-package
