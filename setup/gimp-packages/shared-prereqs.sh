#!/bin/bash
set -e
source /build/buildconfig
echo "Installing shared prerequisite packages." 1>&2
set -x

DEPS=(
autoconf
automake
autotools-dev
binutils
coreutils
gawk
gcc
gettext
gettext-base
graphviz
gtk-doc-tools
libavformat-dev
libexiv2-dev
libglib2.0-dev
libjasper-dev
libjpeg62-turbo-dev
liblcms2-dev:amd64
libpng12-dev:amd64
librsvg2-dev
librsvg2-bin
librsvg2-dev:amd64
librsvg2-common:amd64
libtool
libtool-bin
make
perl-base
pkg-config
#python2.6
#python2.6-minimal
python2.7
python
python2.7-dev
python2.7-minimal
python3.4
python3.4-minimal
python3-apt
python3-aptdaemon
python3-aptdaemon.gtk3widgets
python3-chardet
python3-dbus
python3-debian
python3-defer
python3-gi
python3-minimal
#python3-packagekit
python3-pkg-resources
python3-six
python3-software-properties
unzip
zip
)

apt-get install ${DEPS[*]}
