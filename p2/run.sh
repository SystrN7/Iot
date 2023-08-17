#!/bin/bash

# Change the hosts file
# Create a backup of the hosts file if it doesn't exist
if [ ! -f /etc/hosts.bak ]
then
    sudo cp -v /etc/hosts /etc/hosts.bak
fi

sudo bash -c 'cat /etc/hosts.bak > /etc/hosts'
sudo bash -c 'cat confs/hosts >> /etc/hosts'

# Start vagrant
vagrant up
