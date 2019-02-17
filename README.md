# My Development Vagrant Box

## About
This is the development environment that I use when developing on a VM.

Currently supported boxes from Vagrant Cloud:
* centos/7

## Dependencies
* __vagrant__ - see https://www.vagrantup.com
* __VirtualBox__ - see https://www.virtualbox.org/wiki/Downloads
* __vagrant-vbguest__ (optional, but recommended) - run ```vagrant plugin install vagrant-vbguest```
    * This automatically mounts the latest VirtualBox Guest Additions on the guest system, if it is not already mounted.
    * Optional, but if you do not want to use it, you need to install the Guest Additions manually, and make sure you keep up to date with its newest releases.
    * See https://github.com/dotless-de/vagrant-vbguest for more details on this plugin.
* __ansible__ - see https://www.ansible.com/resources/get-started

## Installation
### Using the base box, and provisioning on boot:
```git clone https://github.com/mattladany/dev-env.git```

```cd dev-env```

```vagrant up```

## Configuration
The default OS is Centos 7, but if you want a different box, edit the 'BOX_NAME' variable in the Vagrantfile, and replace 'centos/7' with the box of your choosing, that is listed above.

## To Do's
* Add boxes to Vagrant Cloud once they are stable.
* Test the installation on host machines other than MacOS.
