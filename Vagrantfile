# -*- mode: ruby -*-
# vi: set ft=ruby :

require './scripts/helpers.rb'

# Vagrantfile AIP/syntax version
VAGRANTFILE_API_VERSION = "2"

# The name of the Vagrant Cloud box to use
BOX_NAME = "centos/7"
#BOX_NAME = "ubuntu/xenial64"
#BOX_NAME = "archlinux/archlinux"

# Configure the Vagrant box
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The box to use
  config.vm.box = BOX_NAME

  # Network settings
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "172.16.0.100"

  # Virtualbox settings provider
  config.vm.provider "virtualbox" do |vb|

     vb.gui = true
     vb.name = "Development Box"
     vb.memory = "2048"
     vb.cpus = 2

   end

  # Install ansible on the guest
  config.vm.provision "bootstrap-phase1", type: "shell",
    inline: get_ansible_install(BOX_NAME)

  # Run the ansible playbook
  config.vm.provision "bootstrap-phase2", type: "ansible_local" do | ansible |

    ansible.playbook = "devbox.yml"
    ansible.extra_vars = {
      role_name: get_ansible_role(BOX_NAME),
      vim_python3_dir: get_vim_python3_dir(BOX_NAME)
    }

  end

end
