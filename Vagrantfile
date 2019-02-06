# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile AIP/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The box to use
  config.vm.box = "centos/7"

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

  # Install GNOME gui, and all dependencies
  config.vm.provision "shell", inline: <<-SHELL
    yum groupinstall -y "GNOME Desktop"
    systemctl set-default graphical.target
    systemctl start graphical.target
    yum update -y
    yum install -y git tmux curl ncurses ncurses-devel termcap-devel python36 python-devel
    git clone https://github.com/vim/vim.git
    cd vim
    make -j8
    sudo make install
    cp src/vim /usr/bin
  SHELL

  # Install dotfiles configurations
  config.vm.provision "shell",
    path: "scripts/dotfiles.sh"

end
