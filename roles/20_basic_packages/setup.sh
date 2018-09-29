#!/bin/bash

if type apt >/dev/null 2>&1; then
  sudo -E apt install -y build-essential libncurses5-dev libgnutls-dev libxml2-dev

elif type yum >/dev/null 2>&1; then
  sudo -E yum groupinstall -y "Development Tools"
  sudo -E yum install -y ncurses-devel wget gnutls-devel libxml2-devel
fi

