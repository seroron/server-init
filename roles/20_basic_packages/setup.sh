#!/bin/bash

if type apt >/dev/null 2>&1; then
  sudo apt install build-essential libncurses5-dev

elif type yum >/dev/null 2>&1; then
  sudo yum groupinstall "Development Tools"
fi

