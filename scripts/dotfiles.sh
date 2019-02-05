#!/bin/bash

git clone https://github.com/mattladany/dotfiles.git
cd dotfiles
printf 'O\n' | ./install/bootstrap.sh
