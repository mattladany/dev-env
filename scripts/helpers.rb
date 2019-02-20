#!/usr/bin/env ruby

################################################################################
############# Some helper variables/functions for the Vagerantfile #############
################################################################################

# The install script for ansible on Centos 7
$centos7_ansible_install = <<-SHELL
  yum install -y epel-release
  yum install -y ansible
SHELL

# The install script for ansible on Ubuntu 16.04 (Xenial)
$xenial64_ansible_install = <<-SHELL
  apt-add-repository ppa:ansible:ansible
  apt -y update
  apt -y install ansible
SHELL

# The install script for ansible on Arch Linux
$archlinux_ansible_install = <<-SHELL
  pacman -Syyu
  pacman -S ansible
SHELL

# Gets the $X_ansible_install variable that holds a shell script to install
#   ansible, depending on BOX_NAME
def get_ansible_install(boxname)
  case boxname
  when "centos/7"
    $centos7_ansible_install
  when "ubuntu/xenial64"
    $xenial64_ansible_install
  when "archlinux/archlinux"
    $archlinux_ansible_install
  end
end

# Gets the name of the ansible role to use based on the BOX_NAME
def get_ansible_role(boxname)
  case boxname
  when "centos/7"
    "centos7"
  when "ubuntu/xenial64"
    "xenial64"
  when "archlinux/archlinux"
    "archlinux"
  end
end

# Gets the directory to use for the --with-python3-dir parameter when running
#   ./configure for vim
def get_vim_python3_dir(boxname)
  case boxname
  when "centos/7"
    "/lib64/python3/config"
  when "ubuntu/xenial64"
    "/usr/lib/python3/config"
  when "archlinux/archlinux"
    "/usr/lib/python3/config"
  end
end
