#!/bin/bash
set -e
source /build/buildconfig
echo "Installing K Desktop Environment (KDE)" 1>&2
set -x
#https://wiki.debian.org/KDE
apt-get install kde-plasma-desktop kde-config-gtk-style gtk2-engines-oxygen gtk3-engines-oxygen
#start up with GUI
systemctl set-default multi-user.target
aptitude install -y ~t^desktop$ ~t^kde-desktop$
