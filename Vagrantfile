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

  if (BOX_NAME == "archlinux/archlinux")
    config.vbguest.auto_update = false
  end

  # Network settings
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "172.16.0.100"

  # Virtualbox settings provider
#  config.vm.provider "virtualbox" do |vb|
#
#     vb.gui = true
#     vb.name = "Development Box"
#     vb.memory = "8192"
#     vb.cpus = 8
#
#   end

  config.vm.synced_folder ".", "/vagrant", type: "smb"

  config.vm.provider "hyperv" do |h|
    h.memory = 4096
    h.cpus = 4
  end

  # Install ansible on the guest
  config.vm.provision "bootstrap-phase1", type: "shell",
    inline: get_ansible_install(BOX_NAME)

  # Run the ansible playbook
  config.vm.provision "bootstrap-phase2", type: "ansible_local" do | ansible |
    ansible.galaxy_role_file = 'requirements.yml'
    ansible.galaxy_command = 'ansible-galaxy install --role-file %{role_file}'
    ansible.playbook = 'devbox.yml'
    ansible.extra_vars = {
      role_name: get_ansible_role(BOX_NAME),
      vim_python3_dir: get_vim_python3_dir(BOX_NAME)
    }

  end

end
