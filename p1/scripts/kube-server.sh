#!/bin/bash

# Set configuration variables
IP_ADDRESS=$(ip a show enp0s8 | grep "inet " | awk '{print $2}' | cut -d / -f1)
NODE_TOKEN="/var/lib/rancher/k3s/server/node-token"
KUBE_CONFIG="/etc/rancher/k3s/k3s.yaml"

# Add current node in /etc/hosts
echo "127.0.0.1 $(hostname)" >> /etc/hosts

# |========== Install K3s server ==========|
export K3S_NODE_NAME="$(hostname)"
export INSTALL_K3S_EXEC="server --cluster-init --node-ip=${IP_ADDRESS} --write-kubeconfig-mode 644"

curl -sfL https://get.k3s.io | sh -

# |========== Whait k3s finish to start ==========|
while [ ! -e ${NODE_TOKEN} ]
do
    sleep 2
done

echo "Node token found!"
echo "Node token: "
cat ${NODE_TOKEN}

# Copy node token, kube config, server address to shared folder
mkdir -p /vagrant/tmp
cp ${NODE_TOKEN} /vagrant/tmp
cp ${KUBE_CONFIG} /vagrant/tmp #copy contents of "k3s.yaml" to ".kube/config" to 'kubectl' from local-machine
echo -n ${IP_ADDRESS} > /vagrant/tmp/server-address

# Configure kuectl
mkdir -p /home/vagrant/.kube
cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
chmod +r /home/vagrant/.kube/config
