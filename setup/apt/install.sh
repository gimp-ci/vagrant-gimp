#!/bin/bash
set -e
source /build/buildconfig
echo "Configuring up APT to default yes and not install recommends." 1>&2
set -x
cp /build/apt/90gimp /etc/apt/apt.conf.d/90gimp
chown root. /etc/apt/apt.conf.d/90gimp
chmod 644 /etc/apt/apt.conf.d/90gimp
