# Centos 7 Vagrant Box

## About
This is the configuration of my Centos 7 VM that I want to use when developing on Centos.

## Dependencies
* __vagrant__ - https://www.vagrantup.com
* __VirtualBox__ - https://www.virtualbox.org/wiki/Downloads
* __vagrant-vbguest__ (optional, but recommended) - run ```vagrant plugin install vagrant-vbguest```
    * This automatically installs the host's VirtualBox Guest Additions on the guest system.
    * Optional, but if you do not want to use it, you need to install the Guest Additions manually, and make sure you keep up to date with the newest releases of it.

## Installation
Currently, there is only one way to use this vagrant box:
```git clone https://github.com/mattladany/dev-env.git```
```cd dev-env```
```git checkout virtualbox/centos7```
```vagrant up```

## To Do's
* Add the box to Vagrant Cloud once it is stable.
* Test the installation on base machines other than MacOS.
