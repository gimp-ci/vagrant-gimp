#!/bin/bash
#Sam Gleske
#Sun Sep 13 01:43:51 GMT 2015
#setup everything

function bootstrap() (
  echo "Configuring environment."
  set -xe

  #configure apt for passwordless auth
  /build/apt/install.sh

  #prepare and update system
  apt-get update --fix-missing
  apt-get upgrade
  apt-get install git vim screen

  #set up KDE Desktop Environment
  /build/kde/install.sh

  #set vagrant user password to "gimp"
  echo "vagrant:gimp" | chpasswd
  /build/dotfiles/install.sh

  #configure environment for development
  /build/gimp-packages/install.sh
  /build/gimp-packages/shared-prereqs.sh
  /build/gimp-packages/gimp-prereqs.sh
  /build/gimp-packages/babl-prereqs.sh
  /build/gimp-packages/gegl-prereqs.sh
  /build/gimp-source/install.sh

  #a helpful message when a user logs in with vagrant ssh
  cp -f /build/motd /etc/
)

if bootstrap; then
  cat < /build/messages/success.txt
else
  cat < /build/messages/failure.txt
fi
