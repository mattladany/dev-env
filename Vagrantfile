# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile AIP/syntax version.
VAGRANTFILE_API_VERSION = "2"

# The name of the Vagrant Cloud box to use.
BOX_NAME = "centos/7"
#BOX_NAME = "ubuntu/xenial64"

# Gets the name of the ansible role to use based on the BOX_NAME.
def get_ansible_role()
  case BOX_NAME
  when "centos/7"
    "centos7"
  when "ubuntu/xenial64"
    "xenial64"
  end
end

# Gets the name of the package manager to use based on the BOX_NAME.
def get_package_manager()
  case BOX_NAME
  when "centos/7"
    "yum"
  when "ubuntu/xenial64"
    "apt"
  when "ubuntu/trusty64"
    "apt-get"
  end
end


$install_ansible = <<-SHELL
  $1 install -y epel-release
  $1 install -y ansible
SHELL

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

  config.vm.provision "bootstrap-phase1", type: "shell",
    inline: $install_ansible, :args => [get_package_manager]

  # Run the ansible playbook
  config.vm.provision "ansible" do | ansible |

    ansible.playbook = "devbox.yml"
    ansible.extra_vars = {
      role_name: get_ansible_role
    }

  end

end
