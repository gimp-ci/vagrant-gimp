# GIMP Development Environment

Welcome!  This development environment is meant to get you up and running fast.
This environment is intended for development of the GNU Image Manipulation
Program or GIMP for short.

This repository assumes you already have [Vagrant installed][vagrant].

# Provision development environment

    git clone https://github.com/samrocketman/vagrant-gimp.git
    cd vagrant-gimp
    vagrant up

When the provisioning is done you should reload to get a desktop
environment.

    vagrant reload

# Control development environment

To get the current status of your virtual machine execute the following.

    vagrant status

To poweroff the virtual machine execute the following.

    vagrant halt

Use `vagrant up` to power on the development environment.

# Log in

Then log in with the user `vagrant` and password `gimp`.

Alternatively, open a terminal and execute the following.

    vagrant ssh

# Development resources for GIMP

GIMP Development Resources:

* http://www.gimp.org/develop/

Plugin Development:

* http://developer.gimp.org/api/2.0/libgimp/libgimp-Gimp.html
* http://developer.gimp.org/api/2.0/libgimp/libgimp-gimpplugin.html
* http://wiki.gimp.org/wiki/Hacking:GSoC/2011/Ideas#Support_writing_JavaScript_plug-ins
* https://metacpan.org/release/Gimp (perl language bindings for GIMP plugins)

[vagrant]: https://www.vagrantup.com/
