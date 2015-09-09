#!/bin/bash
set -e
source /build/buildconfig
echo "Installing GIMP prerequisite packages." 1>&2
set -x

DEPS=(
fontconfig
fontconfig-config
ghostscript
libaa1-dev
libasound2-dev:amd64
libatk1.0-dev
libatk-bridge2.0-dev:amd64
libbz2-dev:amd64
libdbus-1-dev:amd64
libdbus-glib-1-dev
libcairo2-dev
libfreetype6:amd64
libfreetype6-dev
libgexiv2-dev
libgtk2.0-dev
libgtk-3-dev
libgudev-1.0-0:amd64
libgudev-1.0-dev
liblzma-dev:amd64
libmng-dev:amd64
libopenexr-dev
libpoppler-dev:amd64
libpoppler-glib-dev
#libtiff4-dev:amd64
libtiff5-dev:amd64
libwebkit-dev
libwebkitgtk-dev
libwmf-dev
libx11-dev:amd64
libx11-doc
libx11-xcb-dev:amd64
libxml2-utils
libxpm-dev:amd64
libxslt1.1:amd64
xvfb
zlib1g:amd64
zlib1g-dev:amd64
)

apt-get install ${DEPS[*]}
