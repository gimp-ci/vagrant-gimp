#!/bin/bash
set -e
source /build/buildconfig
echo "Installing VirtualBox Guest Additions." 1>&2
set -x

export vbox_version="5.0.4"

if [ ! -e "/tmp/VBoxGuestAdditions_${vbox_version}.iso" ]; then
  echo 'Downloading guest additions.'
  curl -Lo "/tmp/VBoxGuestAdditions_${vbox_version}.iso" "http://download.virtualbox.org/virtualbox/${vbox_version}/VBoxGuestAdditions_${vbox_version}.iso"
fi

#check if not mounted
if ! mount | grep "VBoxGuestAdditions_${vbox_version}.iso" &> /dev/null; then
  echo 'Mounting guest additions.'
  mkdir -p /mnt/vbox
  mount -o loop,ro -t iso9660 "/tmp/VBoxGuestAdditions_${vbox_version}.iso" /mnt/vbox
fi
/build/vbox-guest-additions/packages.sh
#install guest additions
/mnt/vbox/VBoxLinuxAdditions.run
#mount
#sudo umount /mnt/vbox
