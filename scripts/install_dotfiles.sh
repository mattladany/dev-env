#!/bin/bash

git clone https://github.com/mattladany/dotfiles.git
cd dotfiles
sudo printf 'O\n' | ./install/bootstrap.sh
#rm -rf /home/mladany/.vim/plugged/tabnine-vim
