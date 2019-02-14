#!/bin/sh
systemctl set-default graphical.target
systemctl start graphical.target
exit 0
