#!/bin/bash

sudo rm -f *.txt *.png
sudo rm -rf results-*/
killall -q python
killall -q python2.7
killall -q ovs-vswitchd
killall -q ovsdb-server
killall -q controller
mn -c
service openvswitch-switch start
