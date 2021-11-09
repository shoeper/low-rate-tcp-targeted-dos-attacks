#!/bin/bash

# Preps a GCE virtual machine for CS244 PA3 by rpropper@ and yutian@.
# Reproduces experiments from the paper "Low-Rate TCP-Targeted Denial of 
# Service Attacks".

# First, install some dependencies...
sudo apt-get -y update
sudo apt-get -y install git tmux
sudo apt-get -y install python-matplotlib
sudo apt-get -y install python-numpy

# Now download and install Mininet
git clone git://github.com/mininet/mininet
cd mininet && git checkout -b 2.2.2rc1 && util/install.sh -a

cd ~
git clone https://github.com/shoeper/low-rate-tcp-targeted-dos-attacks.git
cd low-rate-tcp-targeted-dos-attacks/
