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
EOF
fi
