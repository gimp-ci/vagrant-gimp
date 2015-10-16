#!/bin/bash
set -e
source /build/buildconfig
echo "Installing VirtualBox Guest Additions required packages." 1>&2
set -x

#install required packages
apt-get install linux-headers-$(uname -r) dkms
