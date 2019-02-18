# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile AIP/syntax version
VAGRANTFILE_API_VERSION = "2"

# The name of the Vagrant Cloud box to use
BOX_NAME = "centos/7"
#BOX_NAME = "ubuntu/xenial64"

$centos7_ansible_install = <<-SHELL
  yum install -y epel-release
  yum install -y ansible
SHELL

$xenial64_ansible_install = <<-SHELL
  apt-add-repository ppa:ansible:ansible
  apt -y update
  apt -y install ansible
SHELL

# Gets the $X_ansible_install variable that holds a shell script to install
#   ansible, depending on BOX_NAME
def get_ansible_install
  case BOX_NAME
  when "centos/7"
    $centos7_ansible_install
  when "ubuntu/xenial64"
    $xenial64_ansible_install
  end
end

# Gets the name of the ansible role to use based on the BOX_NAME
def get_ansible_role
  case BOX_NAME
  when "centos/7"
    "centos7"
  when "ubuntu/xenial64"
    "xenial64"
  end
end

# The shell script to run on the guest to install ansible
$ansible_install = get_ansible_install

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

  # Install ansible
  config.vm.provision "bootstrap-phase1", type: "shell",
    inline: $ansible_install

  # Run the ansible playbook
  config.vm.provision "ansible" do | ansible |

    ansible.playbook = "devbox.yml"
    ansible.extra_vars = {
      role_name: get_ansible_role
    }

  end

end
