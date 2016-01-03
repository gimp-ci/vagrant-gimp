#!/bin/bash
set -e
source /build/buildconfig
echo "Install package dependencies for building libmypaint." 1>&2
set -x

#search for packages
#apt-cache search <package>
#get package versions
#apt-cache policy <package>
#install specific package version
#apt-get install <package>=<version>

#libmypaint dependencies
DEPS=(
scons
libjson-c-dev
)
apt-get install ${DEPS[*]}
