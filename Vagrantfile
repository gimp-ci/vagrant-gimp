# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  version = "0.1"
  hostname = "gimpdev"
  locale = "en_US.UTF-8"

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # https://atlas.hashicorp.com/debian/
  config.vm.box = "debian/jessie64"

  #Shared folders
  config.vm.synced_folder "./setup", "/build"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  config.push.define "atlas" do |push|
    push.app = "samrocketman/gimp"
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    #set hostname and locale
    hostnamectl set-hostname #{hostname}
    echo "127.0.0.1 #{hostname}" >> /etc/hosts
    locale-gen #{locale}
    #configure apt for passwordless auth
    /build/apt/install.sh
    #prepare and update system
    apt-get update --fix-missing
    apt-get upgrade
    apt-get install git vim screen
    #set up KDE Desktop Environment
    #/build/kde/install.sh
    #set vagrant user password to "gimp"
    echo "vagrant:gimp" | chpasswd
    #install GIMP prerequisite packages
    #/build/gimp-packages/shared-prereqs.sh
    #/build/gimp-packages/gimp-prereqs.sh
    #/build/gimp-packages/babl-prereqs.sh
    #/build/gimp-packages/gegl-prereqs.sh
    cp -f /build/motd /etc/
  SHELL
end
