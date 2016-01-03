#!/bin/bash
set -e
source /build/buildconfig
#do everything as vagrant user
if [ ! "${USER}" = "vagrant" ]; then
    su - vagrant -c "$0 $@"
    exit
fi
echo "Set up dotfiles" 1>&2
set -x

#check for prefix in bash environment
if ! grep -q 'PREFIX' ~/.bashrc; then
  cat >> ~/.bashrc <<EOF

#gimp prefix
export PREFIX=/home/vagrant/gimp-git
export PATH="\${PREFIX}/bin:\${PATH}"

#for GIMP packages and startup
export PKG_CONFIG_PATH="\${PREFIX}/lib/pkgconfig:\${PKG_CONFIG_PATH}"
export LD_LIBRARY_PATH="\${PREFIX}/lib:\${LD_LIBRARY_PATH}"
EOF
  echo 'MANPATH_MAP /home/vagrant/gimp-git/bin /home/vagrant/gimp-git/share/man' | sudo tee -a /etc/manpath.config
fi
