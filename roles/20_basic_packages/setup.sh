#!/bin/bash

if type apt >/dev/null 2>&1; then
  sudo -E apt install -y build-essential libncurses5-dev libgnutls28-dev libxml2-dev libssl-dev libreadline-dev

elif type yum >/dev/null 2>&1; then
  sudo -E yum groupinstall -y "Development Tools"
  sudo -E yum install -y ncurses-devel wget gnutls-devel libxml2-devel openssl-devel readline-devel
fi

