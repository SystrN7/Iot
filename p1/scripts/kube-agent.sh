#!/bin/bash

# curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token $K3S_CLUSTER_TOKEN" sh -s -

IP_ADDRESS=$(ip a show enp0s8 | grep "inet " | awk '{print $2}' | cut -d / -f1)

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --node-ip=${IP_ADDRESS} --flannel-iface=enp0s8" K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=$(cat /vagrant/tmp/node-token) sh -


# Copy kube config to user home (for kuectl)
mkdir -p /home/vagrant/.kube
cp /vagrant/tmp/k3s.yaml /home/vagrant/.kube/config