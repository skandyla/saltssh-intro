# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|

  # VM with salt-ssh
  config.vm.define :"saltsshbox" do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "saltsshbox"
    config.vm.network "private_network", ip: "192.168.33.70"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 2
    end

    config.vm.synced_folder ".", "/srv"

    # Deploy vagrant insecure private key inside the VM
    config.vm.provision "file", source: "~/.vagrant.d/insecure_private_key", destination: "~/.ssh/id_rsa"


    # Install salt-ssh
    config.vm.provision "shell", inline: <<-SHELL
      wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
      sudo echo 'deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main' > /etc/apt/sources.list.d/saltstack.list
      sudo apt-get update
      sudo apt-get install -y salt-ssh
      sudo mv /etc/salt/roster{,.bak}
      sudo ln -s /srv/saltstack/saltetc/roster /etc/salt/
      sudo ln -s /srv/saltstack/saltetc/master /etc/salt/
    SHELL
  end

  # VM for testing
  config.vm.define :"testserver" do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "testserver"
    config.vm.network "private_network", ip: "192.168.33.75"
    config.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
    end

    # Deploy vagrant public key
    config.vm.provision "shell", inline: <<-SHELL
      curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> ~/.ssh/authorized_keys2 2>/dev/null
      curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys2 2>/dev/null
    SHELL
  end

end
