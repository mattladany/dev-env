# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile AIP/syntax version.
VAGRANTFILE_API_VERSION = "2"

$install_vim = <<-SHELL
  cd /usr/local/src
  git clone https://github.com/vim/vim.git
  cd vim
  make distclean
  ./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-python3interp=yes --with-python3-config-dir=/lib64/python3/config --enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope --prefix=/usr/local
  make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
  make install
SHELL

$install_gradle = <<-SHELL
  wget https://services.gradle.org/distributions/gradle-5.2.1-bin.zip
  mkdir /opt/gradle
  unzip -d /opt/gradle gradle-5.2.1-bin.zip
  export PATH=$PATH:/opt/gradle/gradle-5.2.1/bin
SHELL

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The box to use
  config.vm.box = "centos/7"

  # Network settings
#  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "172.16.0.100"

  # Virtualbox settings provider
  config.vm.provider "virtualbox" do |vb|

     vb.gui = true
     vb.name = "Development Box"
     vb.memory = "2048"
     vb.cpus = 2

   end

  # Run the ansible playbook
  config.vm.provision "ansible" do | ansible |
    ansible.playbook = "devbox.yml"
  end

end
