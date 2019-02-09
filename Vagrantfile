# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile AIP/syntax version.
VAGRANTFILE_API_VERSION = "2"

$install_vim = <<-SHELL
  git clone https://github.com/vim/vim.git
  cd vim
  ./configure --prefix=/usr/local --enable-multibyte  --with-tlib=ncurses --enable-pythoninterp --enable-rubyinterp --with-ruby-command=/usr/bin/ruby --with-features=huge
  ./configure --enable-python3interp=yes --prefix=/usr
  make -j8
  sudo make install
  cp src/vim /usr/bin
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
     vb.memory = "8192"
     vb.cpus = 8

   end

  # Install GNOME gui, and all dependencies
  config.vm.provision "dependencies", type: "shell", inline: <<-SHELL
    yum install -y epel-release
    yum update -y
    yum groupinstall -y "GNOME Desktop"
    systemctl set-default graphical.target
    systemctl start graphical.target
    yum install -y yum-utils
    yum groupinstall "Development tools"
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm
    yum install -y wget git tmux curl ncurses ncurses-devel termcap-devel python36 python36-devel python36-pip cmake gcc-c++ make mono-addins-devel java-1.8.0-openjdk java-1.8.0-openjdk-devel ruby ruby-devel code
  SHELL

  config.vm.provision "vim", type: "shell", inline: $install_vim

  config.vm.provision "gradle", type: "shell", inline: $install_gradle


  # Install dotfiles configurations
  config.vm.provision "dotfiles", type: "shell", privileged: false,
    path: "scripts/install_dotfiles.sh"

end
