#!/bin/bash
set -e
source /build/buildconfig
echo "Installing BABL prerequisite packages." 1>&2
set -x

DEPS=(
asciidoc
enscript
gobject-introspection
libopenraw-dev
libsdl1.2-dev
libspiro-dev
libsuitesparse-dev:amd64
libumfpack5.6.2:amd64
libv4l-0:amd64
libv4lconvert0:amd64
libwebp-dev:amd64
ruby
rubygems-integration
valac
)

apt-get install ${DEPS[*]}
