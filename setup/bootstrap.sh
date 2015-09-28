#!/bin/bash
set -e
source /build/buildconfig
echo "Configuring environment."
set -x

#configure apt for passwordless auth
/build/apt/install.sh

#prepare and update system
/build/tryscript.sh apt-get upgrade
/build/tryscript.sh apt-get install git vim screen

#set up KDE Desktop Environment
/build/tryscript.sh /build/kde/install.sh

#set vagrant user password to "gimp"
echo "vagrant:gimp" | chpasswd
/build/dotfiles/install.sh

#configure environment for development
/build/tryscript.sh /build/gimp-packages/install.sh
/build/tryscript.sh /build/gimp-packages/shared-prereqs.sh
/build/tryscript.sh /build/gimp-packages/gimp-prereqs.sh
/build/tryscript.sh /build/gimp-packages/babl-prereqs.sh
/build/tryscript.sh /build/gimp-packages/gegl-prereqs.sh
/build/gimp-source/install.sh

#a helpful message when a user logs in with vagrant ssh
cp -f /build/motd /etc/
