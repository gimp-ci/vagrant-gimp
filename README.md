# DEPRECATED

This project has been migrated to [GNOME GitLab under World/gimp-ci](https://gitlab.gnome.org/World/gimp-ci).  Refer to [the documentation repository for better information](https://gitlab.gnome.org/World/gimp-ci/documentation).  If you just want to build GIMP, then [check out the GIMP development environment based on Docker](https://gitlab.gnome.org/World/gimp-ci/docker-gimp).  The Docker environment also allows you to run GIMP if you have Xorg display; instructions therein.

# GIMP Development Environment

Welcome!  This development environment is meant to get you up and running fast.
This environment is intended for development of the GNU Image Manipulation
Program or GIMP for short.

This repository assumes you already have [Vagrant installed][vagrant] and
[VirtualBox installed][vbox].

# Prerequisites

### Required software

* Install the [latest version of Vagrant][vagrant] (Vagrant 1.8.1 as of this
  writing).
* Install the [latest version of VirtualBox][vbox] (VirtualBox 5.0.12 as of this
  writing).

### System requirements

Requirements are based on the final size after provisioning the VM and compiled
GIMP.

Minimum:

* 64-bit single-core processor
* 6GB hard disk space
* 4GB RAM - this can be lowered by adjusting the `Vagrantfile`.
* 10Mbps internet connection - slower internet means provisioning will take
  hours

Recommended:

* Multi-core 64-bit processor with Intel VT-x or AMD-V extensions
* 10GB hard disk space
* 16GB RAM
* 20Mbps or higher internet connection seems to be the limits of how fast Debian
  packages will download from mirrors.

See Tips and Tricks (documented below) for getting more performance out of the
VM.  I recommend leaving at least 2GB of RAM for your operating system and other
applications.

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

# Build GIMP

After the environment first loads it should be ready to build GIMP.
There should the following files and directories in the `vagrant` user.

* `~/gimp-git` - contains all of the output from the gimp build.
* `~/gimp-git/share/config.site` - a file containing variables used by the build
  process.
* `~/git/babl` - source code of BABL
* `~/git/gegl` - source code of GEGL
* `~/git/gimp` - source code of GIMP
* `~/build-gimp.sh` - a script to compile BABL, GEGL, and GIMP all at
  once.

To build GIMP either open a terminal from the GUI or launch `vagrant
ssh`.  Then execute the following command from the vagrant home
directory.

    ./build-gimp.sh

When the process is done, GIMP should be built.  Simply execute
`gimp-2.9` from a terminal to start the latest development build of GIMP.

The binary is located in `~/gimp-git/bin/gimp-2.9`.

# Development resources for GIMP

GIMP Development Resources:

* [See objectives document](objectives.md)
* http://www.gimp.org/source/
* http://www.gimp.org/develop/

Plugin Development:

* See [libgimp-Gimp][lg-gimp] and [libgimp-gimpplugin][lg-gimpplugin] interface
  documentation around GIMP plugins.
* [Idea: JavaScript bindings for GIMP plugins][jsbind-idea].
* [Perl language bindings for GIMP plugins][perlbind].
* From the GIMP master branch see `gimp/plug-ins/pygimp` for the python
  language bindings for GIMP plugins.
* For Gtk+ dialogs see [GOjbect Introspection][gobject] and [Javascript
  implementations using GObject Introspection][jslibs].

# Tips and Tricks

### More performance

Currently the vagrant box is relatively low spec with the default 8MB video RAM,
2048MB RAM, and 1 CPU core.  The `build-gimp.sh` script will automatically take
advantage of more cores to build GIMP faster.  Just edit the
[`Vagrantfile`](Vagrantfile) file and update the following settings.

    # Customize the VM specs (memory values in MB)
    vb.memory = "8192"
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.cpus = "8"

### VirtualBox Guest Additions

Why VirtualBox guest additions?  The VM becomes more performant.  If you're
using a graphical UI then it will autoscale when you fullscreen the virtual
machine.  Shared clipboards can also be enabled.  These features are useful when
developing software inside a VM.

A script for installing VirtualBox guest additions has been provided.  From
within the VM simply call:

    /vagrant/setup/vbox-guest-additions/install.sh

One can override the version of guest additions being installed.  The version of
guest additions should match the version of VirtualBox installed on the host
system.

    vbox_version=5.0.12 /vagrant/setup/vbox-guest-additions/install.sh

[gobject]: https://wiki.gnome.org/Projects/GObjectIntrospection
[jsbind-idea]: http://wiki.gimp.org/wiki/Hacking:GSoC/2011/Ideas#Support_writing_JavaScript_plug-ins
[jslibs]: https://wiki.gnome.org/JavaScript
[lg-gimp]: http://developer.gimp.org/api/2.0/libgimp/libgimp-Gimp.html
[lg-gimpplugin]: http://developer.gimp.org/api/2.0/libgimp/libgimp-gimpplugin.html
[perlbind]: https://metacpan.org/release/Gimp
[vagrant]: https://www.vagrantup.com/
[vbox]: https://www.virtualbox.org/wiki/Downloads
