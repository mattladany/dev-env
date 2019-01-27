# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile AIP/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The box to use
  config.vm.box = "generic/centos7"
 
  # Network settings
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "172.16.0.100"

  # Virtualbox settings provider
  config.vm.provider "virtualbox" do |vb|

     vb.gui = true
     vb.name = "Development Box"
     vb.memory = "8192"
     vb.cpus = 8

   end
  
  # Install dependencies
  config.vm.provision "shell", 
    path: "scripts/dependencies.sh"
 
  # Install dotfiles configurations
  config.vm.provision "shell",
    path: "scripts/dotfiles.sh"

end
