#!/bin/bash

git clone https://github.com/seroron/.emacs.d.git ~/.emacs.d
cd .emacs.d/
make emacs-local
make emacs-package

