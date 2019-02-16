#!/bin/bash

cd /usr/local/src
wget https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
tar -xvf tmux-2.8.tar.gz
cd tmux-2.8
./configure && make
make install
#
#mkdir -p /home/vagrant/.tmux/plugins/
#cd /home/vagrant/.tmux/plugins
#git clone https://github.com/tmux-plugins/tpm
