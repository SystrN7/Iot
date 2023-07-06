#!/bin/bash

# Set configuration variables
IP_ADDRESS=$(ip a show enp0s8 | grep "inet " | awk '{print $2}' | cut -d / -f1)

# Add master node in /etc/hosts
echo "$(cat /vagrant/tmp/server-address) fgalaupS" >> /etc/hosts
# Add current node in /etc/hosts
echo "127.0.0.1 $(hostname)" >> /etc/hosts


# |========== Install k3s agent ==========|
export K3S_TOKEN_FILE="/vagrant/tmp/node-token"
export K3S_URL="https://fgalaupS:6443"
export K3S_NODE_NAME="$(hostname)"
export INSTALL_K3S_EXEC="agent --node-ip=${IP_ADDRESS}"

curl -sfL https://get.k3s.io | sh -

echo "Token file: ${K3S_TOKEN_FILE}, URL: ${K3S_URL}, Node name: ${K3S_NODE_NAME}, Install exec: ${INSTALL_K3S_EXEC}"

# sudo k3s agent --token-file /vagrant/tmp/node-token --server "https://fgalaupS:6443" --node-name=fgalaupSW --node-ip=192.168.56.111