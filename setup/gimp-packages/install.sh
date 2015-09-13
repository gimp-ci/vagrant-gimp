#!/bin/bash
set -e
source /build/buildconfig
echo "Install package dependencies for building GIMP." 1>&2
set -x

#search for packages
#apt-cache search <package>
#get package versions
#apt-cache policy <package>
#install specific package version
#apt-get install <package>=<version>

#development dependencies
DEPS=(
autoconf
automake
)
apt-get install ${DEPS[*]}

#gimp dependencies
#any packages that don't have a version specified were pre-installed by upstream
#dependencies listed at http://www.gimp.org/source/
DEPS=(
pkg-config=0.28-1
libgtk2.0-0
libgtk2.0-dev
libglib2.0-0
libglib2.0-dev
libpango1.0-0=1.36.8-3
libpango1.0-dev=1.36.8-3
fontconfig
libxslt1.1
libxslt1-dev
xsltproc
gtk-doc-tools
python-gtk2
python-gtk2-dev
)
#optional dependencies
OPT_DEPS=(
libaa1=1.4p5-43
libaa1-dev=1.4p5-43
libexif12=0.6.21-2
libexif-dev=0.6.21-2
libjpeg62-turbo
libjpeg62-turbo-dev
libpng12-0
libpng12-dev
libtiff5
libtiff5-dev
libmng1=1.0.10+dfsg-3.1+b3
libmng-dev=1.0.10+dfsg-3.1+b3
libxpm4=1:3.5.11-1+b1
libxpm-dev=1:3.5.11-1+b1
librsvg2-2=2.40.5-1
librsvg2-common=2.40.5-1
librsvg2-dev=2.40.5-1
libwmf0.2-7=0.2.8.4-10.3+deb8u1
libwmf-dev=0.2.8.4-10.3+deb8u1
libwebkitgtk-dev=2.4.8-2
libwebkitgtk-common-dev=2.4.8-2
zlib1g
zlib1g-dev
python
python-dev
)
apt-get install ${DEPS[*]} ${OPT_DEPS[*]}

#babl deps
DEPS=(
libtool
libltdl-dev
)
apt-get install ${DEPS[*]}

#gegl deps
DEPS=(
intltool
libjson-glib-1.0-0
libjson-glib-dev
)
apt-get install ${DEPS[*]}
