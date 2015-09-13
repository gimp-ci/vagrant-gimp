#!/bin/bash
#Sam Gleske
#Sun Sep 13 01:43:51 GMT 2015
#setup everything

#try to run a script 3 times in case it fails (typically because of out of date
#mirrors from Debian when trying to install packages)
function tryscript() (
  retries=0
  while [ "${retries}" -lt 3 ] && ! $1; do
    apt-get update --fix-missing
    ((retries++))
  done
)

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
  tryscript /build/kde/install.sh

  #set vagrant user password to "gimp"
  echo "vagrant:gimp" | chpasswd
  /build/dotfiles/install.sh

  #configure environment for development
  tryscript /build/gimp-packages/install.sh
  tryscript /build/gimp-packages/shared-prereqs.sh
  tryscript /build/gimp-packages/gimp-prereqs.sh
  tryscript /build/gimp-packages/babl-prereqs.sh
  tryscript /build/gimp-packages/gegl-prereqs.sh
  /build/gimp-source/install.sh

  #a helpful message when a user logs in with vagrant ssh
  cp -f /build/motd /etc/
)

#try the bootstrap else fail
if bootstrap; then
  cat < /build/messages/success.txt
else
  cat < /build/messages/failure.txt
fi
