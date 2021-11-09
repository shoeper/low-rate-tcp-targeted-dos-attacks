#!/bin/bash

cd ~

# Preps a GCE virtual machine for CS244 PA3 by rpropper@ and yutian@.
# Reproduces experiments from the paper "Low-Rate TCP-Targeted Denial of 
# Service Attacks".

echo "First, install some dependencies..."
sudo apt-get -y update
sudo apt-get -y dist-upgrade
sudo apt-get -y install git tmux
sudo apt-get -y install build-essential
sudo apt-get -y install python-matplotlib
sudo apt-get -y install python-numpy

echo "Now download and install Mininet"
git clone git://github.com/mininet/mininet
cd mininet
# we don't want repeated runs of the script to fail
git checkout -b 2.2.2rc1 || true
util/install.sh -a

echo "Clone low-rate-tcp-targeted-dos-attacks repo"
cd ~
git clone https://github.com/shoeper/low-rate-tcp-targeted-dos-attacks.git

echo "Reboot recommended"
