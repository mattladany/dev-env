# My Development Vagrant Box

## About
This is the development environment that I use when developing on a VM.

Currently supported operating systems:
* _Centos 7_
* _Ubuntu 16.04_
* _Arch Linux_

## Dependencies
* __VirtualBox (version 6.0.4)__ - see https://www.virtualbox.org/wiki/Downloads
* __vagrant (version 2.2.3)__ - see https://www.vagrantup.com
* __vagrant-vbguest__ (optional, but recommended) - run ```vagrant plugin install vagrant-vbguest```
    * This automatically mounts the latest VirtualBox Guest Additions on the guest system, if it is not already mounted.
    * Optional, but if you do not want to use it, you need to install the Guest Additions manually, and make sure you keep up to date with its newest releases.
    * See https://github.com/dotless-de/vagrant-vbguest for more details on this plugin.

## Installation
### Using the base box, and provisioning on boot:
```git clone https://github.com/mattladany/dev-env.git```

```cd dev-env```

```vagrant up```

## Configuration
To configure the operationg system you want to use, set the 'BOX_NAME' variable in the Vagrantfile to one of the following strings:
* "centos/7" (default)
* "ubuntu/xenial64"
* "archlinux/archlinux"
For more information about these boxes, visit https://app.vagrantup.com/boxes/search.

## Notes
* __VirtualBox Guest Additions Bug__
    * Currently, the VirtualBox Guest Additions has a bug where immediately after logging in, windowing features do not work correctly and you will have trouble clicking around once an application is opened. As a current workaround, you need to log out and log back in immediately after booting. Will continue to look into this until a fix is found.

## To Do's
* Add macOS as a possible OS to use.
* Continue to add wanted packages to all boxes.
* Make the desktop environment configurable.
* Remove the vagrant-vbguest plugin dependency, and mount the VirtualBox Guest Additions manually.
* Add boxes to Vagrant Cloud once they are stable.
* Test the installation on host machines other than MacOS.
