#!/bin/bash

IP_ADDRESS=$(ip a show enp0s8 | grep "inet " | awk '{print $2}' | cut -d / -f1)

curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$(cat /vagrant/tmp/node-token) sh -


# Copy kube config to user home (for kuectl)
mkdir -p /home/vagrant/.kube
cp /vagrant/tmp/k3s.yaml /home/vagrant/.kube/config