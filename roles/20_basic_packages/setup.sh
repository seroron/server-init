#!/bin/bash

if type apt >/dev/null 2>&1; then
  sudo apt install -y build-essential libncurses5-dev libgnutls-dev

elif type yum >/dev/null 2>&1; then
  sudo yum groupinstall -y "Development Tools"
  sudo yum install -y ncurses-devel
fi

