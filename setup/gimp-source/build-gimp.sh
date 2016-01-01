#!/bin/bash
#Created by Sam Gleske
#Sun Sep 13 03:54:55 GMT 2015
#Debian GNU/Linux 8
#Linux 3.16.0-4-amd64 x86_64
#do everything as vagrant user
if [ ! "${USER}" = "vagrant" ]; then
    echo "ERROR: Must be the vagrant user."
    exit 1
fi
set -e

#PREFIX is set in ~/.bashrc
export BABL_PREFIX="${PREFIX}"
export GEGL_PREFIX="${PREFIX}"

#build babl (a GIMP dependency) from latest master
cd ~/git/babl
mkdir -p ~/gimp-git/share/aclocal
./autogen.sh --prefix="${BABL_PREFIX}"
make
make install

#build gegl (a GIMP dependency) from latest master
cd ~/git/gegl
./autogen.sh --prefix="${GEGL_PREFIX}"
make
make install

#build libmypaint (depends on GEGL and depended on by GIMP)
cd ~/git/libmypaint
#get the gegl version which was compiled and installed in ~/gimp-git; e.g. GEGL_VERSION=0.3
export GEGL_VERSION="$(ls -l ~/gimp-git/lib/ | awk '$1 ~ /^d/ && $0 ~ /gegl/ { sub("gegl-", "", $NF); print $NF }')"
scons prefix="${PREFIX}" use_sharedlib=yes enable_gegl=true
scons prefix="${PREFIX}" use_sharedlib=yes enable_gegl=true install

#build GIMP from latest master
cd ~/git/gimp
./autogen.sh --prefix="${PREFIX}"
make
make install
