#!/bin/bash
set -e
source /build/buildconfig
#do everything as vagrant user
if [ ! "${USER}" = "vagrant" ]; then
    su - vagrant -c "$0 $@"
    exit
fi
echo "Setting up for GIMP development (as vagrant user)." 1>&2
set -x

mkdir -p ~/git
cd ~/git

#clone sources
#check to see if we can clone over git protocol (it may be blocked by firewall)
#if blocked then fall back to using port 443 to clone projects
if timeout 10 nc -vz git.gnome.org 9418; then
  echo "Using smart Git protocol."
  clone_url="git://git.gnome.org"
else
  echo "Using dumb HTTP protocol"
  clone_url="https://git.gnome.org/browse"
fi
for x in gimp gegl babl; do
  if [ ! -e "${x}" ]; then
    git clone "${clone_url}/${x}"
  fi
done

export PREFIX=/home/vagrant/gimp-git
mkdir -p "${PREFIX}"/share
cp /build/gimp-source/config.site "${PREFIX}"/share/
cp /build/gimp-source/build-gimp.sh ~/
