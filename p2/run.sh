#!/bin/bash

#Change the hosts file

#Create a backup of the hosts file if it doesn't exist
if [ ! -f /etc/hosts.bak ]; then
    sudo cp /etc/hosts /etc/hosts.bak
fi
sudo cat /etc/hosts.bak > /etc/hosts
sudo cat /vagrant/confs/hosts >> /etc/hosts

# Start vagrant
vagrant up